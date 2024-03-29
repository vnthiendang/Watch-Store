CREATE DATABASE [Shopping]

USE DATABASE [Shopping]

ALTER DATABASE [Shopping] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGoogleAccount](
	[username] [nvarchar](30) NOT NULL,
	[email] [nvarchar](200) NULL,
	[password] [nvarchar](200) NULL,
	[firstname] [nvarchar](300) NULL,
	[lastname] [nvarchar](300) NULL,
	[picture] [nvarchar](800) NULL,
	[role] [nvarchar](200) NULL,
	[DOB] [date] NULL,
	[address] [nvarchar](200) NULL,
	[organization] [nvarchar](200) NULL,
	[phone] [nvarchar](200) NULL,
	[status] [bit] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [nvarchar](30) NOT NULL,
	[userID] [nvarchar](30) NOT NULL,
	[date] [date] NULL,
	[total] [money] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [nvarchar](30) NOT NULL,
	[orderID] [nvarchar](30) NULL,
	[productID] [nvarchar](30) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](30) NOT NULL,
	[name] [nvarchar](200) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[images] [nvarchar](2000) NULL,
	[categoryID] [int] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [nvarchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[password] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (1, N'Active')
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (2, N'Sports')
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (3, N'Deligate')

INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW001', N'Samsung Galaxy Watch5', 6490.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/w/a/watch-lte-44_1.jpg', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW002', N'Xiaomi Watch S1 Active', 2990.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/c/active-s1-blue-thumb.jpg', 2)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW003', N'Xiaomi Redmi band 2', 790.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/redmi_band_2.png', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW004', N'Huawei Band 7', 949.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/h/u/huawei-band-7.jpg', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW005', N'Huawei Watch GT3', 5490.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/w/a/watch_3_leather.jpg', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW006', N'Apple Watch Series 7 41mm (GPS)', 8290.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/e/series_7-thumb_2.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW007', N'Apple Watch SE 2022', 6990.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/e/se-2022-40mm.jpg', 2)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW008', N'Xiaomi Redmi Watch 2 Lite', 990.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/redmi-watch-2.jpg', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW009', N'Xiaomi Mi Band 7', 890.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/i/mi-band-7.jpg', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW010', N'Apple Watch Series 6', 5000.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/p/apple-watch-series-6-40mm-3_3_1_1.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW011', N'Garmin Forerunner 745', 6990.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/7/4/745_main_b_2.jpg', 2)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW012', N'Apple Watch SE 44mm (GPS)', 6290.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/p/apple-watch-se-40mm_1_2_1.jpg', 3)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW013', N'Huawei Watch GT Runner', 3390.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/w/a/wacth-gt-runner.jpg', 2)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [images], [categoryID]) VALUES (N'SW014', N'Soundpeats Watch 2', 790.000, 20, N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/w/2/w2_1_1_900x_1.png', 3)

INSERT [dbo].[tblUser] ([userID], [name], [phone], [address], [email], [roleID], [password]) VALUES (N'admin', N'Hoan The', N'0582832746', N'HCM', N'thedh@admin.vn', N'AD', N'1')
INSERT [dbo].[tblUser] ([userID], [name], [phone], [address], [email], [roleID], [password]) VALUES (N'SE130363', N'Ngo Trinh Gia Bao', N'0124827864', N'HN', N'baoht@gmail.com', N'US', N'1')
INSERT [dbo].[tblUser] ([userID], [name], [phone], [address], [email], [roleID], [password]) VALUES (N'SE140103', N'Phuoc Long', N'0467237645', N'HN', N'long@fu.edu.vn', N'US', N'1')
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategories]
GO
USE [master]
GO
ALTER DATABASE [Shopping] SET  READ_WRITE 
GO
