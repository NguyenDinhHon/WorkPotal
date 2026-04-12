# WorkPotal — Job Portal

Ứng dụng web **tuyển dụng / tìm việc** xây dựng trên **ASP.NET Core 6 MVC**, kết nối **SQL Server** qua **Entity Framework Core**, có **ASP.NET Core Identity** cho tài khoản và vai trò. Repository này chứa toàn bộ solution trong thư mục gốc `WorkPotal`.

## Mục lục

- [Tổng quan](#tổng-quan)
- [Kiến trúc solution](#kiến-trúc-solution)
- [Công nghệ sử dụng](#công-nghệ-sử-dụng)
- [Yêu cầu môi trường](#yêu-cầu-môi-trường)
- [Cài đặt và chạy local](#cài-đặt-và-chạy-local)
- [Cấu hình](#cấu-hình)
- [Cơ sở dữ liệu](#cơ-sở-dữ-liệu)
- [Tính năng theo mô hình dữ liệu](#tính-năng-theo-mô-hình-dữ-liệu)
- [Đường dẫn & giao diện](#đường-dẫn--giao-diện)
- [Git và nhánh](#git-và-nhánh)

## Tổng quan

WorkPotal là nền tảng kết nối **nhà tuyển dụng** và **ứng viên**: đăng tin việc làm, quản lý hồ sơ/CV, nội dung blog, và (tùy nhánh/tích hợp) hiển thị thông tin địa lý trên **Google Maps** — API key được cấu hình qua file bí mật local, không đưa lên Git.

## Kiến trúc solution

| Project | Vai trò |
|--------|---------|
| **JobPortal.WebApp** | Ứng dụng MVC: controllers, Razor views, `wwwroot`, Areas (khi có trong nhánh), pipeline trong `Program.cs`. |
| **JobPortal.Data** | EF Core `DbContext`, entities, cấu hình Fluent API, view model phục vụ UI. |
| **JobPortal.Common** | Tiện ích dùng chung (ví dụ upload/xử lý ảnh, attribute validate). |

File solution: `job_portal.sln`.

## Công nghệ sử dụng

- **.NET 6** (SDK tương ứng)
- **ASP.NET Core MVC** + Razor (`Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation` trong development)
- **Entity Framework Core 6** + **SQL Server**
- **ASP.NET Core Identity** (`AppUser`, `AppRole`)
- **X.PagedList.Mvc.Core** — phân trang
- **Session** và cookie authentication (cấu hình trong `Program.cs`)

## Yêu cầu môi trường

- [.NET 6 SDK](https://dotnet.microsoft.com/download/dotnet/6.0)
- [SQL Server](https://www.microsoft.com/sql-server) (LocalDB hoặc instance đặt tên; chỉnh connection string cho khớp)
- (Tuỳ chọn) Visual Studio 2022 hoặc VS Code / Rider để mở `job_portal.sln`

## Cài đặt và chạy local

1. **Clone** repository và mở terminal tại thư mục `WorkPotal` (thư mục chứa `job_portal.sln`).

2. **Khôi phục package** (nếu cần):

   ```bash
   dotnet restore job_portal.sln
   ```

3. **Tạo / import database** — xem mục [Cơ sở dữ liệu](#cơ-sở-dữ-liệu).

4. **Chạy web app**:

   ```bash
   dotnet run --project JobPortal.WebApp/JobPortal.WebApp.csproj
   ```

5. Mở trình duyệt tại URL mà console in ra (thường `https://localhost:5xxx` hoặc `http://localhost:5xxx`).

## Cấu hình

### Connection string

Trong `JobPortal.WebApp/appsettings.json`, khóa `ConnectionStrings:JobPortalContextConnection` trỏ tới SQL Server của bạn. Ví dụ mặc định trong repo dùng instance tên (cần chỉnh cho đúng máy bạn):

```json
"JobPortalContextConnection": "Server=localhost\\MSSQLSERVER2022;Database=JobPortalDb;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True"
```

### Google Maps API (không commit key)

- `Program.cs` đã nạp thêm file **`appsettings.Secrets.json`** (optional).
- Tạo file `JobPortal.WebApp/appsettings.Secrets.json` từ mẫu `appsettings.Secrets.example.json` và điền API key.
- File `appsettings.Secrets.json` được liệt kê trong `.gitignore` để tránh lộ key trên GitHub.

## Cơ sở dữ liệu

- Script khởi tạo schema: **`JobPortalDb.sql`**
- Dữ liệu mẫu (nếu dùng): **`SeedData.sql`**

Thực hiện restore trên SQL Server (SSMS hoặc `sqlcmd`), sau đó đảm bảo tên database trong connection string trùng với database vừa tạo.

Nếu nhóm dùng **EF Core Migrations**, có thể cập nhật DB qua `dotnet ef database update` (cần cài EF CLI và cấu hình startup project phù hợp).

## Tính năng theo mô hình dữ liệu

Các entity trong `JobPortal.Data/Entities` phản ánh phạm vi nghiệp vụ:

| Khái niệm | Mô tả ngắn |
|-----------|------------|
| **Job** | Tin tuyển dụng: tiêu đề, mô tả, lương, kỹ năng, địa điểm (province), loại hình làm việc (time), employer (`AppUser`). |
| **AppUser / AppRole** | Người dùng và vai trò (Identity). |
| **Category, Title, Skill, Time, Province, Country** | Danh mục và địa lý phục vụ lọc/tìm kiếm. |
| **CV** | Hồ sơ ứng viên. |
| **Blog** | Bài viết / tin tức. |

Phần controller và view cụ thể (trang chủ, đăng nhập, tìm kiếm, employer, admin, …) có thể được phát triển theo **nhánh Git** khác nhau; nhánh hiện tại có thể chỉ gồm một subset (ví dụ khu vực **Company**).

## Đường dẫn & giao diện

- **Company (nhà tuyển dụng / danh sách)** — routing trong `CompanyController`: prefix `/company`, chi tiết `/company/{slug}`; có tham số `showMap` cho hiển thị bản đồ trên trang chi tiết (khi view hỗ trợ).
- Layout chung: `Views/Shared/_Layout.cshtml` (và các partial menu, search box, sidebar).

## Git và nhánh

Remote mẫu: `WorkPotal` trên GitHub. Các nhánh tính năng thường gặp: `main`, `dev`, `feature/*` (ví dụ `feature/map` cho luồng company + bản đồ). Quy trình merge/PR do nhóm quy định.

---

**Lưu ý bảo mật:** không commit `appsettings.Secrets.json`, chuỗi kết nối chứa mật khẩu thật, hay API key. Nếu key từng lộ, hãy thu hồi và tạo key mới trên Google Cloud Console.
