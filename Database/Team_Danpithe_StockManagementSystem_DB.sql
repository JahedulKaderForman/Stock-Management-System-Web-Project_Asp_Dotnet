USE [master]
GO
/****** Object:  Database [StockManagement_db]    Script Date: 8/28/2018 1:39:51 PM ******/
CREATE DATABASE [StockManagement_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagement_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagement_db.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagement_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagement_db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagement_db] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagement_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagement_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagement_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagement_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagement_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagement_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagement_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagement_db] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagement_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagement_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagement_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagement_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagement_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagement_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagement_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagement_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagement_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagement_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagement_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagement_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagement_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagement_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagement_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagement_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagement_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagement_db] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagement_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagement_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagement_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagement_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagement_db]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/28/2018 1:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 8/28/2018 1:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 8/28/2018 1:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](100) NOT NULL,
	[ReorderLevel] [int] NULL,
	[AvailableQuantity] [int] NULL,
	[CategoryID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 8/28/2018 1:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[StockOutId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ItemType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[StockOutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 8/28/2018 1:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Computer                                          ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Electronics                                       ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2004, N'Garments                                          ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2008, N'Keyboard                                          ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Kichen Items                                      ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2005, N'Machine                                           ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1004, N'Medicine                                          ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2007, N'Mobile                                            ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1005, N'Paper                                             ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2009, N'Sound Box                                         ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Stationary                                        ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2006, N'Television                                        ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2003, N'Toys                                              ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3006, N'Water pump                                        ')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyID], [CompanyName]) VALUES (3, N'Huawei                                                                                              ')
INSERT [dbo].[Company] ([CompanyID], [CompanyName]) VALUES (5, N'Microsoft                                                                                           ')
INSERT [dbo].[Company] ([CompanyID], [CompanyName]) VALUES (2, N'Nokia                                                                                               ')
INSERT [dbo].[Company] ([CompanyID], [CompanyName]) VALUES (1, N'Samsung                                                                                             ')
INSERT [dbo].[Company] ([CompanyID], [CompanyName]) VALUES (7, N'Ubar                                                                                                ')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemID], [ItemName], [ReorderLevel], [AvailableQuantity], [CategoryID], [CompanyID]) VALUES (1, N'switch', 0, 10, 6, 1)
INSERT [dbo].[Item] ([ItemID], [ItemName], [ReorderLevel], [AvailableQuantity], [CategoryID], [CompanyID]) VALUES (2, N'Mobile', 1, 90, 6, 1)
INSERT [dbo].[Item] ([ItemID], [ItemName], [ReorderLevel], [AvailableQuantity], [CategoryID], [CompanyID]) VALUES (1003, N'switch', 0, 167, 6, 2)
INSERT [dbo].[Item] ([ItemID], [ItemName], [ReorderLevel], [AvailableQuantity], [CategoryID], [CompanyID]) VALUES (1004, N'AndroidBook', 0, 100, 1004, 2)
INSERT [dbo].[Item] ([ItemID], [ItemName], [ReorderLevel], [AvailableQuantity], [CategoryID], [CompanyID]) VALUES (1005, N'Headphone', 0, 0, 6, 1)
INSERT [dbo].[Item] ([ItemID], [ItemName], [ReorderLevel], [AvailableQuantity], [CategoryID], [CompanyID]) VALUES (1006, N'Laptop', 4, 13131363, 6, 5)
INSERT [dbo].[Item] ([ItemID], [ItemName], [ReorderLevel], [AvailableQuantity], [CategoryID], [CompanyID]) VALUES (1007, N'MC-201', 3, 50, 5, 5)
INSERT [dbo].[Item] ([ItemID], [ItemName], [ReorderLevel], [AvailableQuantity], [CategoryID], [CompanyID]) VALUES (2007, N'pen', 0, 0, 8, 2)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (1, CAST(0x923E0B00 AS Date), 1, 10, N'sell')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (2, CAST(0x923E0B00 AS Date), 1003, 5, N'sell')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (3, CAST(0x923E0B00 AS Date), 1004, 10, N'sell')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (4, CAST(0x923E0B00 AS Date), 1, 5, N'lost')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (5, CAST(0x923E0B00 AS Date), 1004, 10, N'damage')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (1004, CAST(0x943E0B00 AS Date), 2, 20, N'sell')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (1005, CAST(0x943E0B00 AS Date), 1003, 20, N'sell')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (1006, CAST(0x953E0B00 AS Date), 1006, 50, N'sell')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (1007, CAST(0x953E0B00 AS Date), 1, 80, N'sell')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (1008, CAST(0x953E0B00 AS Date), 1007, 50, N'sell')
INSERT [dbo].[StockOut] ([StockOutId], [Date], [ItemId], [Quantity], [ItemType]) VALUES (2004, CAST(0xA43E0B00 AS Date), 1006, 20, N'sell')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserId], [UserName], [Password]) VALUES (1, N'Forman', N'admin1234')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Category]    Script Date: 8/28/2018 1:39:51 PM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Company]    Script Date: 8/28/2018 1:39:51 PM ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [IX_Company] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_AvailableQuantity]  DEFAULT ((0)) FOR [AvailableQuantity]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Company]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_StockOut] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_StockOut]
GO
USE [master]
GO
ALTER DATABASE [StockManagement_db] SET  READ_WRITE 
GO
