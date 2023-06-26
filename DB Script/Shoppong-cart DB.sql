USE [master]
GO
/****** Object:  Database [shopping-cart-db]    Script Date: 26/06/2023 8:45:22 am ******/
CREATE DATABASE [shopping-cart-db]
 -- CONTAINMENT = NONE
 -- ON  PRIMARY 
-- ( NAME = N'shopping-cart-db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopping-cart-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 -- LOG ON 
-- ( NAME = N'shopping-cart-db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopping-cart-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 -- WITH CATALOG_COLLATION = DATABASE_DEFAULT
-- GO
-- ALTER DATABASE [shopping-cart-db] SET COMPATIBILITY_LEVEL = 150
-- GO
-- IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
-- begin
-- EXEC [shopping-cart-db].[dbo].[sp_fulltext_database] @action = 'enable'
-- end
GO
ALTER DATABASE [shopping-cart-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shopping-cart-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shopping-cart-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shopping-cart-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shopping-cart-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [shopping-cart-db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shopping-cart-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shopping-cart-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shopping-cart-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shopping-cart-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shopping-cart-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shopping-cart-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shopping-cart-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shopping-cart-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shopping-cart-db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shopping-cart-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shopping-cart-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shopping-cart-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shopping-cart-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shopping-cart-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shopping-cart-db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shopping-cart-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shopping-cart-db] SET RECOVERY FULL 
GO
ALTER DATABASE [shopping-cart-db] SET  MULTI_USER 
GO
ALTER DATABASE [shopping-cart-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shopping-cart-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shopping-cart-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shopping-cart-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shopping-cart-db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shopping-cart-db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'shopping-cart-db', N'ON'
GO
ALTER DATABASE [shopping-cart-db] SET QUERY_STORE = OFF
GO
USE [shopping-cart-db]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 26/06/2023 8:45:23 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26/06/2023 8:45:23 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/06/2023 8:45:23 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[Phone number] [nchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[Email] [nchar](50) NULL,
	[City] [nchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDateTime]) VALUES (3, N'Drinks', 2, CAST(N'2023-06-02T17:15:11.9146376' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDateTime]) VALUES (6, N'Fruits', 1, CAST(N'2023-06-03T00:29:05.3369342' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDateTime]) VALUES (9, N'Cosmetics', 3, CAST(N'2023-06-04T11:37:23.0948834' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (10, N'AppleAppleApple', N'Fresh', 3000, N'\ProductImage\358319bc-4b47-415f-8376-94306fc484d8-apple.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (12, N'Mango', N'Fresh', 200, N'\ProductImage\b8667b1c-8f84-40b0-b842-b3e82ce072a8-apple.jpg', 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Phone number], [IsAdmin], [Email], [City]) VALUES (2, N'Zain', N'123', N'03080446117', 0, N'zain@gmail.com                                    ', N'Lahore                                            ')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Phone number], [IsAdmin], [Email], [City]) VALUES (3, N'Admin', N'123', N'admin', 1, N'admin@gmail.com                                   ', N'Lahore                                            ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [shopping-cart-db] SET  READ_WRITE 
GO
