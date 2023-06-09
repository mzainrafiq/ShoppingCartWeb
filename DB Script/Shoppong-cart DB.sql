USE [master]
GO
/****** Object:  Database [shopping-cart-db]    Script Date: 26/06/2023 4:13:58 pm ******/
CREATE DATABASE [shopping-cart-db]
 
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
/****** Object:  Table [dbo].[Cart]    Script Date: 26/06/2023 4:13:59 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartLine]    Script Date: 26/06/2023 4:13:59 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartLine](
	[CartLineId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 26/06/2023 4:13:59 pm ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 26/06/2023 4:13:59 pm ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 26/06/2023 4:13:59 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[UserName] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
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
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDateTime]) VALUES (10, N'Kitchen', 4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDateTime]) VALUES (11, N'Bath', 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (10, N'Apple', N'Fresh', 300, N'\ProductImage\358319bc-4b47-415f-8376-94306fc484d8-apple.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (12, N'Mango', N'Fresh', 200, N'\ProductImage\8fb4fed0-18e4-468a-963c-07500d2461f3-Mango.PNG', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (13, N'Sufi Oil', N'Pure', 750, N'\ProductImage\09781c61-471d-46c1-ba80-fe520233b6e0-Sufi oil.PNG', 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (14, N'Palmolic Soap', N'New', 100, N'\ProductImage\c9af00f0-b1d7-4ac4-aa25-608b9c1ff1fa-Soap.PNG', 11)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (15, N'Pure Shampoo', N'mediam', 200, N'\ProductImage\adf63e37-b49c-43e9-bd59-c2e2bc368d78-Pure.PNG', 11)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (16, N'ToothPaiste', N'Medium', 200, N'\ProductImage\45c5e8d6-2240-475f-8e72-2f83b0b46f9b-ToothPaiste.PNG', 11)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (17, N'Milk', N'Fresh', 150, N'\ProductImage\21ace3f0-919a-454a-8363-ac26b1b5ccac-milk.PNG', 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (18, N'Lotion', N'Medium', 200, N'\ProductImage\e66c82b2-79bd-4f11-a7ab-77945fda6eed-lotion.PNG', 9)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [UserName], [Password], [IsAdmin], [Email], [City]) VALUES (1, N'Suleman                                           ', N'suleman                                           ', N'123                                               ', 0, N'suleman@gmail.com                                 ', N'Lahore                                            ')
INSERT [dbo].[Users] ([UserId], [Name], [UserName], [Password], [IsAdmin], [Email], [City]) VALUES (5, N'Zain Rafiq                                        ', N'admin                                             ', N'12345                                             ', 1, N'zahid@gmail.com                                   ', N'Lahore                                            ')
INSERT [dbo].[Users] ([UserId], [Name], [UserName], [Password], [IsAdmin], [Email], [City]) VALUES (6, N'M Zain                                            ', N'zain                                              ', N'123                                               ', 0, N'ghfhfhg@jjk.com                                   ', N'Lahore                                            ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_Cart_to_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_Cart_to_User]
GO
ALTER TABLE [dbo].[CartLine]  WITH CHECK ADD  CONSTRAINT [fk_CartLine_to_Cart] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartLine] CHECK CONSTRAINT [fk_CartLine_to_Cart]
GO
ALTER TABLE [dbo].[CartLine]  WITH CHECK ADD  CONSTRAINT [fk_CartLine_to_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[CartLine] CHECK CONSTRAINT [fk_CartLine_to_Product]
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
