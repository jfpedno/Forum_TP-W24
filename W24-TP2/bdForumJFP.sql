USE [master]
GO
/****** Object:  Database [Forum01]    Script Date: 11/21/2022 1:32:41 AM ******/
CREATE DATABASE [Forum01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Forum01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Forum01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Forum01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Forum01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Forum01] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Forum01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Forum01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Forum01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Forum01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Forum01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Forum01] SET ARITHABORT OFF 
GO
ALTER DATABASE [Forum01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Forum01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Forum01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Forum01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Forum01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Forum01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Forum01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Forum01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Forum01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Forum01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Forum01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Forum01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Forum01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Forum01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Forum01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Forum01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Forum01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Forum01] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Forum01] SET  MULTI_USER 
GO
ALTER DATABASE [Forum01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Forum01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Forum01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Forum01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Forum01] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Forum01] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Forum01] SET QUERY_STORE = OFF
GO
USE [Forum01]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/21/2022 1:32:41 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[catID] [int] IDENTITY(100,1) NOT NULL,
	[catNom] [nvarchar](50) NOT NULL,
	[catDescription] [nvarchar](125) NOT NULL,
	[catIMG] [nvarchar](255) NULL,
	[catActif] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[msgID] [int] IDENTITY(100,1) NOT NULL,
	[sujetID] [int] NOT NULL,
	[userID] [nvarchar](450) NULL,
	[msgActif] [bit] NOT NULL,
	[msgText] [nvarchar](500) NOT NULL,
	[msgDate] [datetime] NOT NULL,
	[msgView] [int] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[msgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sujets]    Script Date: 11/21/2022 1:32:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sujets](
	[sujetID] [int] IDENTITY(100,1) NOT NULL,
	[catID] [int] NOT NULL,
	[userID] [nvarchar](450) NULL,
	[sujetTexte] [nvarchar](255) NOT NULL,
	[sujetDate] [datetime] NOT NULL,
	[sujetView] [int] NULL,
	[sujetActif] [bit] NOT NULL,
 CONSTRAINT [PK_Sujets] PRIMARY KEY CLUSTERED 
(
	[sujetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.9')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'041168', N'zeMasterAdmin', N'ZEMASTERADMIN', N'MASTERADMIN')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'21345661-c835-4eca-a863-39b8964b1f0b', N'041168')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'21345661-c835-4eca-a863-39b8964b1f0b', N'alohaAdmin', N'ALOHAADMIN', N'jfpedno@gmail.com', N'JFPEDNO@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEMu5d+ggOFg3y7ajCGHXPv1MCpThT4hR9N3Ja6O2OY4BNwog3aLC7rpBzfZYRALyEg==', N'VWRWYHCMJSJUCN56NF7DRN6AJOZ5NYCW', N'57299a98-c7e7-4707-b28f-0d88667d9d5b', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'82b05a4e-6033-4c3d-b816-a72fa8a4d00a', N'jfpedno@hotmail.com', N'JFPEDNO@HOTMAIL.COM', N'jfpedno@hotmail.com', N'JFPEDNO@HOTMAIL.COM', 1, N'AQAAAAEAACcQAAAAEEavglGOH5Bb6SHHl1fGHQQssdoXMPz9PjkcFoWAvZ4yUr7d7zQt6M7gPv/18a1yxw==', N'JDIRF3E4XD5E3Q7Z6JFH7B5ZRSKCEXDI', N'2d0babaf-b59c-44db-8903-b7c0f684d6c1', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'aa19752a-1e5e-46b3-9436-28a18eba43a6', N'alohaLateNight', N'ALOHALATENIGHT', N'aloha@goodnight.com', N'ALOHA@GOODNIGHT.COM', 1, N'AQAAAAEAACcQAAAAENcR7jgLFbHPQrCn5TopX2WnePqUZe/XZWLhCiwx+X4ZCEg9MVlcXkAZJfbIuMgT6g==', N'PTXTFVXDKI7F2U6WCGSIU5VACMTQWEBB', N'6923c309-bbdc-4444-85f9-cb68b7366e9c', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bef1a6fb-0761-4909-85ae-c6467592bd60', N'alohaUser', N'ALOHAUSER', N'jfpedno.iot@gmail.com', N'JFPEDNO.IOT@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEOApe5HwFn7qbqB9QSX0a55CkwA7HPPB8EVI5eyJ2/3wAxGN8KfXVJUsgnJPRCqA4A==', N'AOPF3JCLANJWFE4O24655QSGQSWGVXMR', N'40717958-a689-488e-bfb7-fbcd8f4511d0', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (1, N'Soccer', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (2, N'Basketball', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (3, N'Football', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (4, N'Volleyball', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (5, N'Tennis', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (6, N'Hockey', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (7, N'Ping Pong', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (10, N'Ski de fond', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (11, N'Baseball', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
INSERT [dbo].[Categories] ([catID], [catNom], [catDescription], [catIMG], [catActif]) VALUES (12, N'Badminton', N'<p>BlaBliBlouBlou Blablablabla.</p>', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (134, 104, N'21345661-c835-4eca-a863-39b8964b1f0b', 1, N'<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. test create user. test edit admin</p>', CAST(N'2022-11-14T11:06:14.330' AS DateTime), NULL)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (143, 104, N'21345661-c835-4eca-a863-39b8964b1f0b', 1, N'<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. test create admin test edit admin</p>', CAST(N'2022-11-14T11:22:54.613' AS DateTime), NULL)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (144, 104, N'bef1a6fb-0761-4909-85ae-c6467592bd60', 1, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>', CAST(N'2022-11-14T12:42:20.703' AS DateTime), 0)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (145, 105, NULL, 1, N'Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum.', CAST(N'2022-11-18T16:04:11.203' AS DateTime), 0)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (146, 107, NULL, 1, N'Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum.', CAST(N'2022-11-18T16:04:11.203' AS DateTime), 0)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (147, 108, NULL, 1, N'Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum.', CAST(N'2022-11-18T16:04:11.203' AS DateTime), 0)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (148, 109, NULL, 1, N'Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum.', CAST(N'2022-11-18T16:04:11.203' AS DateTime), 0)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (149, 110, NULL, 1, N'Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum.', CAST(N'2022-11-18T16:04:11.203' AS DateTime), 0)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (150, 149, NULL, 1, N'Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum.', CAST(N'2022-11-18T16:04:11.203' AS DateTime), 0)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (151, 150, NULL, 1, N'Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum.', CAST(N'2022-11-18T16:04:11.203' AS DateTime), 0)
GO
INSERT [dbo].[Messages] ([msgID], [sujetID], [userID], [msgActif], [msgText], [msgDate], [msgView]) VALUES (157, 104, NULL, 1, N'<p>werstdyugiho;glfkdjrhetwrytydflg;iluktyretszrydcgvh WAESRTDYFGHK</p>', CAST(N'2022-11-21T00:27:46.490' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Sujets] ON 
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (5, 4, N'jfPedno04111968', N'Le volleyball devrait-il remplacer le football dans les écoles secondaires au Québec ?', CAST(N'2022-10-13T15:21:53.690' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (6, 5, N'jfPedno04111968', N'Le tennis est-il un sport qui développe le narcissisme plutôt que l''autonomie chez les jeunes ?', CAST(N'2022-10-13T15:22:08.957' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (7, 6, N'jfPedno04111968', N'La culture de la violence au hockey est-elle malsaine pour les jeunes hockeyeurs au Québec ?', CAST(N'2022-10-13T15:22:53.183' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (8, 7, N'jfPedno04111968', N'Devrait-il y avoir des tables de ping-pong dans toutes les écoles secondaires du Québec ?', CAST(N'2022-10-13T15:23:05.850' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (10, 10, N'jfPedno04111968', N'Est-ce que le ski de fond est meilleur pour la santé et l''environnement que le ski-doo ?', CAST(N'2022-10-13T15:24:02.940' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (29, 12, NULL, N'Le badminton devrait-il faire parti des sports enseignés au secondaire ?', CAST(N'2022-11-04T14:38:31.210' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (104, 1, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #3598db;"><strong>Sujet Soccer.</strong></span> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. edit admin edit admin</p>', CAST(N'2022-11-18T16:34:20.780' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (105, 1, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #3598db;"><strong>Sujet Soccer.</strong></span> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. edit user edit admin</p>', CAST(N'2022-11-18T16:34:44.603' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (107, 1, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #3598db;"><strong>Sujet Soccer.</strong></span> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>', CAST(N'2022-11-18T16:35:00.440' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (108, 1, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #3598db;"><strong>Sujet Soccer.</strong></span> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>', CAST(N'2022-11-18T16:35:22.043' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (109, 1, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #e03e2d;"><strong>Sujet Soccer.</strong></span> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>', CAST(N'2022-11-18T16:35:56.610' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (110, 1, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #e03e2d;"><strong>Sujet Soccer.</strong></span> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>', CAST(N'2022-11-18T16:36:24.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (149, 1, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p>Pourquoi le soccer est-il d&eacute;sormais plus populaire que le hockey au Qu&eacute;bec ?</p>', CAST(N'2022-11-18T14:26:24.050' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (150, 1, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #e03e2d;"><strong>Sujet Soccer.</strong></span> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', CAST(N'2022-11-18T16:37:00.067' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (151, 2, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #e67e23;"><strong>Sujet Basketball.</strong></span> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', CAST(N'2022-11-18T16:37:46.090' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (152, 2, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #e67e23;"><strong>Sujet Basketball.</strong></span> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', CAST(N'2022-11-18T16:38:06.970' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (153, 2, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #e67e23;"><strong>Sujet Basketball.</strong></span> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', CAST(N'2022-11-18T16:38:20.973' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (154, 2, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p>Pourquoi le basketball n''est-il pas populaire au Qu&eacute;bec ?</p>', CAST(N'2022-11-18T16:29:41.353' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (155, 3, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #169179;"><strong>Sujet Football. </strong></span>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', CAST(N'2022-11-18T16:39:40.783' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (156, 3, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #169179;"><strong>Sujet Football.</strong></span> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', CAST(N'2022-11-18T16:40:10.767' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (157, 3, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #169179;"><strong>Sujet Football.</strong></span> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', CAST(N'2022-11-18T16:44:02.347' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (158, 3, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p>Le football est-il un sport s&eacute;curitaire pour les adolescents ?</p>', CAST(N'2022-11-18T16:42:35.517' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (159, 4, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #843fa1;"><strong>Sujet Volleyball.</strong></span> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>', CAST(N'2022-11-18T16:45:19.190' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (160, 4, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #843fa1;"><strong>Sujet Volleyball.</strong></span> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>', CAST(N'2022-11-18T16:45:47.083' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (161, 4, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #843fa1;"><strong>Sujet Volleyball.</strong></span> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>', CAST(N'2022-11-18T16:46:15.937' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (162, 11, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #7e8c8d;"><strong>Sujet Baseball.</strong></span> Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', CAST(N'2022-11-18T16:47:31.987' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (163, 11, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #7e8c8d;"><strong>Sujet Baseball. </strong></span>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', CAST(N'2022-11-18T16:48:40.977' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (164, 11, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p><span style="color: #7e8c8d;"><strong>Sujet Baseball. </strong></span>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', CAST(N'2022-11-18T16:49:13.310' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (165, 11, N'21345661-c835-4eca-a863-39b8964b1f0b', N'<p>Est-ce que les Expos devraient revenir &agrave; Montr&eacute;al ?</p>', CAST(N'2022-11-18T16:50:42.980' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (166, 1, N'bef1a6fb-0761-4909-85ae-c6467592bd60', N'<p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>', CAST(N'2022-11-18T23:38:45.410' AS DateTime), 0, 1)
GO
INSERT [dbo].[Sujets] ([sujetID], [catID], [userID], [sujetTexte], [sujetDate], [sujetView], [sujetActif]) VALUES (167, 1, N'bef1a6fb-0761-4909-85ae-c6467592bd60', N'<p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>', CAST(N'2022-11-21T01:11:34.393' AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Sujets] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/21/2022 1:32:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/21/2022 1:32:41 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/21/2022 1:32:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/21/2022 1:32:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/21/2022 1:32:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/21/2022 1:32:41 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/21/2022 1:32:41 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_msgDate]  DEFAULT (getdate()) FOR [msgDate]
GO
ALTER TABLE [dbo].[Sujets] ADD  CONSTRAINT [DF_Sujets_sujetDate]  DEFAULT (getdate()) FOR [sujetDate]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Sujets] FOREIGN KEY([sujetID])
REFERENCES [dbo].[Sujets] ([sujetID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Sujets]
GO
ALTER TABLE [dbo].[Messages]  WITH NOCHECK ADD  CONSTRAINT [FK_Messages_User] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_User]
GO
ALTER TABLE [dbo].[Sujets]  WITH CHECK ADD  CONSTRAINT [FK_Sujets_Categories] FOREIGN KEY([catID])
REFERENCES [dbo].[Categories] ([catID])
GO
ALTER TABLE [dbo].[Sujets] CHECK CONSTRAINT [FK_Sujets_Categories]
GO
ALTER TABLE [dbo].[Sujets]  WITH NOCHECK ADD  CONSTRAINT [FK_Sujets_User] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Sujets] CHECK CONSTRAINT [FK_Sujets_User]
GO
USE [master]
GO
ALTER DATABASE [Forum01] SET  READ_WRITE 
GO
