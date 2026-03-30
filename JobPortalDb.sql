-- style(shared-data): conflict-ready local change
USE [master]

GO
/****** Object:  Database [JobPortalDb] ******/
IF DB_ID(N'JobPortalDb') IS NULL
BEGIN
    CREATE DATABASE [JobPortalDb];
END
GO
ALTER DATABASE [JobPortalDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobPortalDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobPortalDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobPortalDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobPortalDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobPortalDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobPortalDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobPortalDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobPortalDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobPortalDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobPortalDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobPortalDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobPortalDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobPortalDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobPortalDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobPortalDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobPortalDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JobPortalDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobPortalDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobPortalDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobPortalDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobPortalDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobPortalDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [JobPortalDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobPortalDb] SET RECOVERY FULL 
GO
ALTER DATABASE [JobPortalDb] SET  MULTI_USER 
GO
ALTER DATABASE [JobPortalDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobPortalDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobPortalDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobPortalDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobPortalDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JobPortalDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobPortalDb', N'ON'
GO
ALTER DATABASE [JobPortalDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [JobPortalDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [JobPortalDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoleClaims]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoles]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[AppUserClaims]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/** [dbo].[AppUserLogins] **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserLogins](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[AppUserRoles]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AppUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/******  [dbo].[AppUsers]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UrlAvatar] [nvarchar](max) NULL,
	[Contact] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[WebsiteURL] [nvarchar](50) NULL,
	[Location] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[ProvinceId] [int] NULL,
	[Disable] [bit] NULL,
	[CategoryId] [int] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[CompanySize] [nvarchar](max) NULL,
	[WorkingDays] [nvarchar](max) NULL,
	[CountryId] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[Popular] [int] NOT NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[AppUserTokens]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[Blogs]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[AppUserId] [uniqueidentifier] NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Popular] [int] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[Categories]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Disable] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[Countries] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Flag] [nvarchar](max) NOT NULL,
	[Disable] [bit] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[CVs]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Certificate] [nvarchar](100) NOT NULL,
	[Major] [nvarchar](100) NOT NULL,
	[ApplyDate] [datetime2](7) NOT NULL,
	[GraduatedAt] [nvarchar](100) NOT NULL,
	[GPA] [real] NOT NULL,
	[JobId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Introduce] [nvarchar](max) NOT NULL,
	[AppUserId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[UrlImage] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[EmployerAddress] [nvarchar](max) NULL,
	[EmployerPhone] [nvarchar](20) NULL,
	[Comment] [nvarchar](max) NULL,
	[EmployerRating] [tinyint] NULL,
	[CommentOn] [datetime2](7) NULL,
	[City] [nvarchar](30) NULL,
	[EmployerEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_CVs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[Jobs]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NULL,
	[TitleId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Introduce] [nvarchar](max) NULL,
	[ObjectTarget] [nvarchar](max) NULL,
	[Experience] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NULL,
	[Popular] [int] NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[TimeId] [int] NOT NULL,
	[MinSalary] [int] NULL,
	[MaxSalary] [int] NULL,
	[AppUserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[JobSkill]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSkill](
	[JobsId] [int] NOT NULL,
	[SkillsId] [int] NOT NULL,
 CONSTRAINT [PK_JobSkill] PRIMARY KEY CLUSTERED 
(
	[JobsId] ASC,
	[SkillsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/******  [dbo].[Provinces]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Disable] [bit] NULL,
	[Popular] [int] NOT NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[Skills]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Logo] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Disable] [bit] NULL,
	[Popular] [int] NOT NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[Times]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Times](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Disable] [bit] NULL,
 CONSTRAINT [PK_Times] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******  [dbo].[Titles]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Disable] [bit] NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Popular] [int] NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250328091858_initialDatabase', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250328181202_addCountryTable', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250328181438_addCountryforJob.cs', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250328183216_updateCountryField', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250329082641_updateEmployerField', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250330081303_addCountryAus', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250330104718_addPopularValue', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250330130142_addGermanyCountry', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250330134354_addSwedenCountry', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250330140506_updateUSAValue', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250404111304_addSkillsForJob', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250405125939_removeAgeJob', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250407091924_updateUserConfig', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250507195517_updateCVField', N'6.0.3');
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250512180707_AddChatTables', N'6.0.3');

GO
INSERT [dbo].[AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4e233be7-c199-4567-9c07-9271a9de4c64', N'Employer role', N'Employer', N'EMPLOYER', N'dad3c18c-1340-4da2-88b0-f15c9bf65d22')
INSERT [dbo].[AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'376c1d1e-0b04-47da-9657-a2a87faf0a59', N'User role', N'User', N'USER', N'bb760d45-ef93-4c5e-aa36-524ea4960072')
INSERT [dbo].[AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9f685d0f-bd6f-44dd-ab60-c606952eb2a8', N'Administrator role', N'Admin', N'ADMIN', N'8d681dff-b911-4aea-bb97-3be17ba95e48')
GO

SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description], [Slug], [Disable]) VALUES (1, N'Skill', N'the ability to carry out diverse duties in IT roles', N'skill', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Slug], [Disable]) VALUES (2, N'Title', N'the type of position and level an employee holds', N'title', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Slug], [Disable]) VALUES (3, N'Employer', N'seek candidates who write code in several coding languages', N'employer', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Slug], [Disable]) VALUES (4, N'Province', N'where an Employee reports for work at Company', N'province', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (1, N'Vietnam', N'Vietnam.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (2, N'United States', N'USA.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (3, N'China', N'China.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (4, N'Japan', N'Japan.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (5, N'Singapore', N'Singapore.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (6, N'Canada', N'Canada.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (7, N'England', N'England.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (8, N'India', N'India.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (9, N'Russia', N'Russia.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (10, N'Switzerland', N'Switzerland.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (11, N'France', N'France.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (12, N'Italy', N'Italy.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (13, N'Poland', N'Poland.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (14, N'South Korea', N'Korea.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (15, N'Australia', N'Australia.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (16, N'Germany', N'Germany.png', 0)
INSERT [dbo].[Countries] ([Id], [Name], [Flag], [Disable]) VALUES (17, N'Sweden', N'Sweden.png', 0)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[CVs] ON 
SET IDENTITY_INSERT [dbo].[CVs] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Provinces] ON 

INSERT [dbo].[Provinces] ([Id], [Name], [Slug], [CategoryId], [Disable], [Popular]) VALUES (1, N'Ho Chi Minh', N'ho-chi-minh', 4, 0, 0)
INSERT [dbo].[Provinces] ([Id], [Name], [Slug], [CategoryId], [Disable], [Popular]) VALUES (2, N'Ha Noi', N'ha-noi', 4, 0, 0)
INSERT [dbo].[Provinces] ([Id], [Name], [Slug], [CategoryId], [Disable], [Popular]) VALUES (3, N'Da Nang', N'da-nang', 4, 0, 0)
INSERT [dbo].[Provinces] ([Id], [Name], [Slug], [CategoryId], [Disable], [Popular]) VALUES (4, N'Others', N'others', 4, 0, 0)
SET IDENTITY_INSERT [dbo].[Provinces] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (1, N'C++', N'cpp', N'09eb3415-8442-4d2f-a9ed-371b2c01e809.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (2, N'Android', N'android', N'eabf0179-75d1-43b5-8eda-4650cf2cb15b.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (3, N'CSS', N'css', N'73597a49-b989-407c-8c18-9f68273fb656.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (4, N'React Native', N'react-native', N'cca64e1f-e0a7-4964-9bbb-9139aeb4e44a.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (5, N'NodeJS', N'nodejs', N'cd70231f-f334-4b47-a6a1-694139768ad7.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (6, N'PHP', N'php', N'108fddff-618a-4f30-bfa6-b70f9a701097.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (7, N'JSON', N'json', N'980fcb5f-04cc-4508-ac96-118e6ddb3827.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (8, N'.NET', N'dotnet', N'84c6a61e-822b-4fff-858a-7a53cf286ca0.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (9, N'MySQL', N'mysql', N'b2a49590-2b4b-409c-b4d9-5ae9d9d90661.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (10, N'Kotlin', N'kotlin', N'9060c55a-3e92-4b03-9724-f9cc8fee0be7.jpg', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (11, N'C#', N'csharp', N'ac0d91b2-7c3d-4622-ad01-806ca1e349a4.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (12, N'HTML5', N'html5', N'f81b20a5-e57e-4d1f-8167-261119e2639d.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (13, N'Dart', N'dart', N'1f036f33-ae6e-4f43-a489-c349cbe91886.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (14, N'Golang', N'golang', N'431178d2-345f-4008-86ab-8ff94f2e5040.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (15, N'ReactJS', N'reactjs', N'6e314142-36c6-41f4-85bb-fdf4166d6c46.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (16, N'Angular', N'angular', N'1f99b56c-ff18-4847-ac20-273d5b575f4b.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (17, N'C language', N'c-language', N'4f810d7f-81c8-463f-aaf3-5cee19720956.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (18, N'Swift', N'swift', N'e4d35ba6-2ebc-4888-919a-04fffa1da6ae.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (19, N'Flutter', N'flutter', N'c85e83d4-0e90-4bfb-9b69-98a307bfdaa7.jpg', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (20, N'Java', N'java', N'0cef441d-ceee-43ee-a672-fc4b8ba4da5b.jpg', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (21, N'iOS', N'ios', N'75b1ea3f-e347-45d3-9eb1-0e0550aa6e87.jpg', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (22, N'Ruby', N'ruby', N'f944f528-c413-4781-858f-4b00f2141544.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (23, N'WordPress', N'wordpress', N'd681fa95-5f2a-4367-a045-cfe92d5eefd4.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (24, N'Drupal', N'drupal', N'268d7ffc-34bd-4376-88c2-2c7566047764.jpg', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (25, N'VueJS', N'vuejs', N'52617713-71fe-43a0-9077-9f622735cb53.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (26, N'Unity', N'unity', N'1add6073-89ee-4b93-96f8-e3a695d770ae.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (27, N'TypeScript', N'typescript', N'b6ffeb4f-b307-4d34-a773-8fcc1a2ce04f.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (28, N'jQuery', N'jquery', N'2198a273-85c8-4ebd-8f0a-4f5351902729.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (29, N'Laravel', N'laravel', N'75d7163f-73e8-4387-9909-a289b8179346.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (30, N'SQL', N'sql', N'46fd3794-41fc-4f1d-b63c-39d1d6f41a44.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (31, N'Magento', N'magento', N'2999644d-7da0-4c6d-b969-8683fd045dec.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (32, N'JavaScript', N'javascript', N'009a632e-9169-4063-9349-8c36cb14d9dd.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (33, N'Python', N'python', N'4707ba40-ecb1-4673-9649-de586bdd942d.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (34, N'Scala', N'scala', N'26342b46-36ef-435c-9ff4-fcb4548856d9.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (35, N'PostgreSQL', N'postgresql', N'0a56fd6a-8a6e-4fc4-88a6-1e001f8c408d.png', 1, 0, 0)
INSERT [dbo].[Skills] ([Id], [Name], [Slug], [Logo], [CategoryId], [Disable], [Popular]) VALUES (36, N'Scrum', N'scrum', N'a80846fd-de7f-4a7e-963e-60d31af051b0.png', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[Times] ON 

INSERT [dbo].[Times] ([Id], [Name], [Slug], [Disable]) VALUES (1, N'Part time', N'part-time', 0)
INSERT [dbo].[Times] ([Id], [Name], [Slug], [Disable]) VALUES (2, N'Full time', N'full-time', 0)
INSERT [dbo].[Times] ([Id], [Name], [Slug], [Disable]) VALUES (3, N'Work from home', N'work-from-home', 0)
INSERT [dbo].[Times] ([Id], [Name], [Slug], [Disable]) VALUES (4, N'At office', N'at-office', 0)
INSERT [dbo].[Times] ([Id], [Name], [Slug], [Disable]) VALUES (5, N'Temporary', N'temporary', 0)
SET IDENTITY_INSERT [dbo].[Times] OFF
GO
SET IDENTITY_INSERT [dbo].[Titles] ON 

INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (1, N'Team Leader', 2, 0, N'team-leader', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (2, N'Solution Architect', 2, 0, N'solution-architect', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (3, N'iOS Developer', 2, 0, N'ios-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (4, N'Full Stack Developer', 2, 0, N'full-stack-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (5, N'Java Developer', 2, 0, N'java-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (6, N'System Engineer', 2, 0, N'system-engineer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (7, N'Front End Developer', 2, 0, N'front-end-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (8, N'Tester', 2, 0, N'tester', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (9, N'System Administrator', 2, 0, N'system-administrator', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (10, N'Android Developer', 2, 0, N'android-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (11, N'Product Owner', 2, 0, N'product-owner', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (12, N'Back End Developer', 2, 0, N'back-end-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (13, N'Mobile Apps Developer', 2, 0, N'mobile-apps-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (14, N'C++ Developer', 2, 0, N'cpp-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (15, N'PHP Developer', 2, 0, N'php-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (16, N'Embedded Engineer', 2, 0, N'embedded-engineer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (17, N'UX UI Designer', 2, 0, N'ux-ui-designer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (18, N'.NET Developer', 2, 0, N'dotnet-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (19, N'Project Manager', 2, 0, N'project-manager', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (20, N'NodeJS Developer', 2, 0, N'nodejs-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (21, N'Business Analyst', 2, 0, N'business-analyst', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (22, N'Python Developer', 2, 0, N'python-developer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (23, N'Product Manager', 2, 0, N'product-manager', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (24, N'Bridge Engineer', 2, 0, N'bridge-engineer', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (25, N'Software Architect', 2, 0, N'software-architect', 0)
INSERT [dbo].[Titles] ([Id], [Name], [CategoryId], [Disable], [Slug], [Popular]) VALUES (26, N'Software Engineer', 2, 0, N'software-engineer', 0)
SET IDENTITY_INSERT [dbo].[Titles] OFF
GO
/****** Object:  Index [IX_AppRoleClaims_RoleId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AppRoleClaims_RoleId] ON [dbo].[AppRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AppRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppUserClaims_UserId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AppUserClaims_UserId] ON [dbo].[AppUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppUserRoles_RoleId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AppUserRoles_RoleId] ON [dbo].[AppUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AppUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppUsers_CategoryId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AppUsers_CategoryId] ON [dbo].[AppUsers]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppUsers_CountryId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AppUsers_CountryId] ON [dbo].[AppUsers]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppUsers_ProvinceId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AppUsers_ProvinceId] ON [dbo].[AppUsers]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AppUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blogs_AppUserId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Blogs_AppUserId] ON [dbo].[Blogs]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CVs_AppUserId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_CVs_AppUserId] ON [dbo].[CVs]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CVs_JobId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_CVs_JobId] ON [dbo].[CVs]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_AppUserId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_AppUserId] ON [dbo].[Jobs]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_CategoryId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_CategoryId] ON [dbo].[Jobs]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_ProvinceId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_ProvinceId] ON [dbo].[Jobs]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_TimeId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_TimeId] ON [dbo].[Jobs]
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_TitleId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_TitleId] ON [dbo].[Jobs]
(
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobSkill_SkillsId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobSkill_SkillsId] ON [dbo].[JobSkill]
(
	[SkillsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Provinces_CategoryId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Provinces_CategoryId] ON [dbo].[Provinces]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Skills_CategoryId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Skills_CategoryId] ON [dbo].[Skills]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Titles_CategoryId]    Script Date: 7/14/2023 9:34:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Titles_CategoryId] ON [dbo].[Titles]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Disable]
GO
ALTER TABLE [dbo].[AppUsers] ADD  DEFAULT ((0)) FOR [Popular]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT ((0)) FOR [Popular]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Disable]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Disable]
GO
ALTER TABLE [dbo].[CVs] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Jobs] ADD  DEFAULT ((0)) FOR [Popular]
GO
ALTER TABLE [dbo].[Provinces] ADD  DEFAULT ((4)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Provinces] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Disable]
GO
ALTER TABLE [dbo].[Provinces] ADD  DEFAULT ((0)) FOR [Popular]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ((1)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Disable]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ((0)) FOR [Popular]
GO
ALTER TABLE [dbo].[Times] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Disable]
GO
ALTER TABLE [dbo].[Titles] ADD  DEFAULT ((2)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Titles] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Disable]
GO
ALTER TABLE [dbo].[Titles] ADD  DEFAULT ((0)) FOR [Popular]
GO
ALTER TABLE [dbo].[AppRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AppRoleClaims_AppRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppRoles] ([Id])
GO
ALTER TABLE [dbo].[AppRoleClaims] CHECK CONSTRAINT [FK_AppRoleClaims_AppRoles_RoleId]
GO
ALTER TABLE [dbo].[AppUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AppUserClaims_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[AppUserClaims] CHECK CONSTRAINT [FK_AppUserClaims_AppUsers_UserId]
GO
ALTER TABLE [dbo].[AppUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AppUserLogins_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[AppUserLogins] CHECK CONSTRAINT [FK_AppUserLogins_AppUsers_UserId]
GO
ALTER TABLE [dbo].[AppUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AppUserRoles_AppRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppRoles] ([Id])
GO
ALTER TABLE [dbo].[AppUserRoles] CHECK CONSTRAINT [FK_AppUserRoles_AppRoles_RoleId]
GO
ALTER TABLE [dbo].[AppUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AppUserRoles_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[AppUserRoles] CHECK CONSTRAINT [FK_AppUserRoles_AppUsers_UserId]
GO
ALTER TABLE [dbo].[AppUsers]  WITH CHECK ADD  CONSTRAINT [FK_AppUsers_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[AppUsers] CHECK CONSTRAINT [FK_AppUsers_Categories_CategoryId]
GO
ALTER TABLE [dbo].[AppUsers]  WITH CHECK ADD  CONSTRAINT [FK_AppUsers_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[AppUsers] CHECK CONSTRAINT [FK_AppUsers_Countries_CountryId]
GO
ALTER TABLE [dbo].[AppUsers]  WITH CHECK ADD  CONSTRAINT [FK_AppUsers_Provinces_ProvinceId] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Provinces] ([Id])
GO
ALTER TABLE [dbo].[AppUsers] CHECK CONSTRAINT [FK_AppUsers_Provinces_ProvinceId]
GO
ALTER TABLE [dbo].[AppUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AppUserTokens_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[AppUserTokens] CHECK CONSTRAINT [FK_AppUserTokens_AppUsers_UserId]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[CVs]  WITH CHECK ADD  CONSTRAINT [FK_CVs_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[CVs] CHECK CONSTRAINT [FK_CVs_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[CVs]  WITH CHECK ADD  CONSTRAINT [FK_CVs_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[CVs] CHECK CONSTRAINT [FK_CVs_Jobs_JobId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Provinces_ProvinceId] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Provinces] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Provinces_ProvinceId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Times_TimeId] FOREIGN KEY([TimeId])
REFERENCES [dbo].[Times] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Times_TimeId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Titles_TitleId] FOREIGN KEY([TitleId])
REFERENCES [dbo].[Titles] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Titles_TitleId]
GO
ALTER TABLE [dbo].[JobSkill]  WITH CHECK ADD  CONSTRAINT [FK_JobSkill_Jobs_JobsId] FOREIGN KEY([JobsId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[JobSkill] CHECK CONSTRAINT [FK_JobSkill_Jobs_JobsId]
GO
ALTER TABLE [dbo].[JobSkill]  WITH CHECK ADD  CONSTRAINT [FK_JobSkill_Skills_SkillsId] FOREIGN KEY([SkillsId])
REFERENCES [dbo].[Skills] ([Id])
GO
ALTER TABLE [dbo].[JobSkill] CHECK CONSTRAINT [FK_JobSkill_Skills_SkillsId]
GO
ALTER TABLE [dbo].[Provinces]  WITH CHECK ADD  CONSTRAINT [FK_Provinces_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Provinces] CHECK CONSTRAINT [FK_Provinces_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Titles]  WITH CHECK ADD  CONSTRAINT [FK_Titles_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Titles] CHECK CONSTRAINT [FK_Titles_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [JobPortalDb] SET  READ_WRITE 
GO
