USE [master]
GO
/****** Object:  Database [BTL]    Script Date: 5/10/2021 1:50:42 AM ******/
CREATE DATABASE [BTL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTL', FILENAME = N'D:\SQL Server 2014\MSSQL12.DUYVU\MSSQL\DATA\BTL.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BTL_log', FILENAME = N'D:\SQL Server 2014\MSSQL12.DUYVU\MSSQL\DATA\BTL_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BTL] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTL] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BTL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BTL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTL] SET RECOVERY FULL 
GO
ALTER DATABASE [BTL] SET  MULTI_USER 
GO
ALTER DATABASE [BTL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BTL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BTL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BTL] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BTL]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] NOT NULL,
	[TitleBlog] [nvarchar](4000) NULL,
	[Time] [nchar](30) NULL,
	[ContentBlog] [nvarchar](4000) NULL,
	[ImageBlog] [nchar](30) NULL,
	[NameUser] [nvarchar](50) NULL,
	[Summary] [nchar](2000) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NULL,
	[TypeStatus] [bit] NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] NOT NULL,
	[NameUser] [nvarchar](30) NULL,
	[Job] [nvarchar](50) NULL,
	[CommentContent] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CountryType]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryType](
	[countryID] [int] NOT NULL,
	[countryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CountryType] PRIMARY KEY CLUSTERED 
(
	[countryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[colorID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[image] [text] NOT NULL,
	[color] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[colorID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[createdDate] [datetime] NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nchar](15) NULL,
	[email] [nchar](30) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](20) NULL,
	[state] [nvarchar](20) NULL,
	[paymentMethod] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[paymentTypeID] [int] NOT NULL,
	[paymentTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[paymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productPrice] [nchar](20) NULL,
	[productSale] [nchar](20) NULL,
	[productInfor] [nvarchar](2000) NULL,
	[productImage] [nchar](30) NULL,
	[productIntroduce] [nvarchar](4000) NULL,
	[TypeID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/10/2021 1:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NULL,
	[Password] [nchar](50) NULL,
	[Email] [nchar](30) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (1, N'Công bố OPPO Reno5 Z, điện thoại thông minh 5G được trang bị camera bốn', N'April 07, 2021                ', N'Viễn thông di động OPPO Quảng Đông của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / GSM "OPPO Reno5 Z (CPH2211)".

Nó là một điện thoại thông minh tầm trung tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

ColorOS 11.1 dựa trên Android 11 được sử dụng làm hệ điều hành.

Chipset là MediaTek Dimensity 800U hỗ trợ 64bit và CPU là tám lõi.

Màn hình được trang bị AMOLED 6,43 inch FHD + (1080 * 2400).

Máy ảnh bao gồm cảm biến hình ảnh CMOS chính khoảng 48 triệu điểm ảnh, một máy ảnh góc cực rộng cảm biến hình ảnh CMOS khoảng 8 triệu điểm ảnh, cảm biến hình ảnh CMOS macro khoảng 2 triệu điểm ảnh và cảm biến đơn sắc cảm biến hình ảnh CMOS khoảng 2 triệu điểm ảnh . Nó được trang bị một camera quad và cảm biến hình ảnh CMOS với khoảng 16 triệu điểm ảnh ở mặt trước.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) MHz, NR (FR1, TDD) 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD) 2600 (B7) / 2100 (B1) / 1800 (B3) / 900 (B8) / 850 (B5) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) MHz, W-CDMA 2100 (I) / 900 (VIII) / Nó hỗ trợ 850 (V) MHz và GSM 1900/1800/900/850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng n1 chỉ hoạt động trong cấu hình SA và n77 chỉ hoạt động trong cấu hình NSA.

Thẻ SIM là một SIM duy nhất và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1, mạng LAN không dây (2.4GHz / 5GHz), NFC cũng có sẵn.

Dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong là 128GB.

Dung lượng của viên pin là 4310mAh.

Xác thực sinh trắc học hỗ trợ xác thực khuôn mặt và xác thực vân tay và cảm biến xác thực vân tay sử dụng loại tích hợp màn hình.

Bạn có thể chọn từ hai biến thể màu sắc, Fluid Black và Cosmo Blue.

Nó đã được quyết định bán nó ở Singapore, và giá là 529 đô la Singapore (khoảng 43.000 yên).', N'Blog_01.jpg                   ', N'Tuấn Anh', N'Công bố OPPO Reno5 Z, điện thoại thông minh 5G được trang bị camera bốn. Viễn thông di động OPPO Quảng Đông của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / GSM "OPPO Reno5 Z (CPH2211)".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (2, N'Công bố phiên bản tối cao của điện thoại thông minh 5G Realme X7 Pro được trang bị ba camera', N'April 09, 2021                ', N'RealMe Chongqing Mobile Telecommunications của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "realme X7 Pro Supreme Edition".

Nó là điện thoại thông minh tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

Realme UI 2.0 dựa trên Android 11 được sử dụng làm hệ điều hành.

Chipset được trang bị MediaTek Dimensity 1000+ hỗ trợ 64 bit và CPU là một lõi tám.

Màn hình sẽ có kích thước khoảng 6,55 inch FHD + (1080 * 2400) AMOLED với tốc độ làm tươi lên đến 90Hz.

Máy ảnh này là một máy ảnh ba bao gồm cảm biến hình ảnh CMOS khoảng 64 triệu pixel chính ở phía sau, cảm biến hình ảnh CMOS khoảng 8 triệu pixel với ống kính góc siêu rộng, cảm biến hình ảnh CMOS khoảng 2 triệu pixel cho macro và CMOS khoảng 32 triệu pixel ở phía trước. Được trang bị một cảm biến hình ảnh.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) / 1800 (n3) MHz, NR (FR1, TDD) 4500 (n79) / 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD )) 2600 (B7) / 2100 (B1) / 1900 (B2) / 1800 (B3) / 1700 (B4) / 900 (B8) / 850 (B5) / 800 (B18 / B19 / B26) / 700 (B12 / B17)) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) / 2000 (B34) / 1900 (B39) MHz, W-CDMA 2100 (I) / 1900 (II) / 1700 ( IV) Nó hỗ trợ / 900 (VIII) / 850 (V) / 800 (VI / XIX) MHz, CDMA2000 800 (BC0) MHz, GSM 1900/1800/900/850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng n1 và n3 chỉ hoạt động trong cấu hình SA và n77 chỉ hoạt động trong cấu hình NSA.

Thẻ SIM là hai SIM và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1, mạng LAN không dây IEEE 802.11a / b / g / n / ac / ax (2.4GHz / 5GHz), NFC có thể được sử dụng.

Mô hình có dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong 128GB (sau đây gọi là mô hình 8GB + 128GB) và mô hình có dung lượng bộ nhớ hệ thống là 12GB và dung lượng lưu trữ trong 256GB (sau đây gọi là kiểu máy 12GB + 256GB) là có sẵn. Có.

Viên pin được tích hợp bên trong có dung lượng 4500mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Có hai biến thể màu sắc, Tenkunojo và Kuro Takumi Forest.

Nó đã được quyết định bán nó ở Trung Quốc và giá được đặt ở mức 2.299 NDT (khoảng 39.000 yên) cho mô hình 8GB + 128GB và 2.599 nhân dân tệ (khoảng 44.000 yên) cho mô hình 12GB + 256GB.', N'Blog_02.jpg                   ', N'Hoàng Thảo', N'Công bố phiên bản tối cao của điện thoại thông minh 5G Realme X7 Pro được trang bị ba camera. RealMe Chongqing Mobile Telecommunications của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "realme X7 Pro Supreme Edition".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (3, N'Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 820', N'April 02, 2021                ', N'Thông tin di động vivo của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "vivo S9e (V2048A)".

Nó là điện thoại thông minh tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

OriginOS 1.0, dựa trên Android 11, sẽ được sử dụng làm hệ điều hành.

Chipset được trang bị MediaTek Dimensity 820 hỗ trợ 64 bit.

CPU là một lõi tám và tần số hoạt động bao gồm lõi tứ với tốc độ tối đa là 2,6 GHz và lõi tứ với tốc độ tối đa là 2,0 GHz.

Màn hình có kích thước khoảng 6,44 inch FHD + (1080 * 2404) AMOLED với tốc độ làm mới lên đến 90Hz.

Máy ảnh này là bộ ba camera bao gồm cảm biến hình ảnh CMOS khoảng 64 triệu điểm ảnh chính ở phía sau, một máy ảnh góc cực rộng cảm biến hình ảnh CMOS khoảng 8 triệu điểm ảnh, một máy ảnh macro cảm biến hình ảnh CMOS khoảng 2 triệu điểm ảnh và mặt trước khoảng 32 CMOS triệu pixel. Được trang bị một cảm biến hình ảnh.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) / 700 (n28A) MHz, NR (FR1, TDD) 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD) 2100 (B1) / 1800 (B3) / 1700 (B4) / 900 (B8) / 850 (B5) / 800 (B19) / 700 (B28A) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) / 2000 (B34) / 1900 (B39) MHz, W-CDMA 2100 (I) / 1700 (IV) / 900 (VIII) / 850 (V) MHz, CDMA2000 800 (BC0) MHz, GSM 1900/1800/900 / Nó hỗ trợ 850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng tần số FDD chỉ hoạt động trong cấu hình SA.

Thẻ SIM là hai SIM và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1 và mạng LAN không dây (2.4GHz / 5GHz) cũng có sẵn.

Dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong là 128GB hoặc 256GB.

Viên pin được tích hợp bên trong có dung lượng 4100mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Xác thực sinh trắc học hỗ trợ xác thực khuôn mặt và xác thực vân tay, và cảm biến xác thực vân tay là loại tích hợp màn hình.

Bạn có thể chọn từ ba biến thể màu sắc: cực quang đêm đầy sao, pha lê ánh sáng nước và obsidian.

Nó đã được quyết định bán nó ở Trung Quốc và giá sẽ là RMB 2.399 (khoảng 40.000 yên) cho mô hình có bộ nhớ trong 128GB và 2.699 nhân dân tệ (khoảng 45.000 yên) cho mô hình có 256GB.', N'Blog_03.jpg                   ', N'Mai Phú', N'Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 3	Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 820. Thông tin di động vivo của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "vivo S9e (V2048A)".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (4, N'Thiết bị Honor công bố máy tính bảng đầu tiên HONOR Pad 7', N'April 10, 2021                ', N'Thiết bị danh dự của Trung Quốc đã công bố thiết bị đầu cuối LTE / W-CDMA / CDMA2000 / GSM "HONOR Pad 7".

Nó là một máy tính bảng sử dụng Magic UI 4.0, dựa trên Android 10 làm hệ điều hành.

Chipset được trang bị MediaTek MT8786.

CPU là một lõi tám và tần số hoạt động bao gồm lõi kép với tối đa 2,0 GHz và lõi sáu với tối đa 1,8 GHz.

Màn hình được trang bị tinh thể lỏng IPS kích thước 10,1 inch WUXGA (1920 * 1200) và mật độ điểm ảnh là 224 ppi.

Máy ảnh được trang bị cảm biến hình ảnh CMOS với khoảng 5 triệu điểm ảnh ở phía sau và cảm biến hình ảnh CMOS với khoảng 2 triệu điểm ảnh ở phía trước.

Về phương thức liên lạc, phiên bản LTE hỗ trợ hệ thống LTE / W-CDMA / CDMA2000 / GSM, và phiên bản Wi-Fi không hỗ trợ mạng di động.

Có thể sử dụng Bluetooth 5.1 và mạng LAN không dây IEEE 802.11a / b / g / n / ac (2.4GHz / 5GHz).

Dung lượng bộ nhớ hệ thống là 4GB và dung lượng lưu trữ trong là 64GB hoặc 128GB.

Nó cũng hỗ trợ việc sử dụng bộ nhớ ngoài.

Viên pin được tích hợp bên trong có dung lượng 5100mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Bạn có thể chọn từ hai biến thể màu sắc.

Nó đã được quyết định bán nó ở Trung Quốc và phiên bản Wi-Fi sẽ được phát hành đầu tiên, sau đó phiên bản LTE sẽ được phát hành.

Giá là 1.599 RMB (khoảng 27.000 yên) cho phiên bản LTE với dung lượng lưu trữ trong 64 GB, 1.899 RMB (khoảng 32.000 yên) cho mô hình 128 GB và 1.399 RMB (khoảng 32.000 yên) cho phiên bản Wi-Fi 64 GB. mô hình Mô hình 128GB có giá 1.699 RMB (khoảng 28.000 yên).

Đây là chiếc máy tính bảng đầu tiên được Honor Device công bố sau khi tiếp quản mảng kinh doanh thiết bị đầu cuối di động thương hiệu HONOR từ Huawei Technologies của Trung Quốc.', N'Blog_04.jpg                   ', N'Giang Sơn', N'Thiết bị Honor công bố máy tính bảng đầu tiên HONOR Pad 7. Thiết bị danh dự của Trung Quốc đã công bố thiết bị đầu cuối LTE / W-CDMA / CDMA2000 / GSM "HONOR Pad 7".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ')
INSERT [dbo].[Cart] ([cartID], [productID], [quantity], [total]) VALUES (1, 5, 1, 8290000.0000)
INSERT [dbo].[Cart] ([cartID], [productID], [quantity], [total]) VALUES (2, 9, 1, 29500000.0000)
INSERT [dbo].[Cart] ([cartID], [productID], [quantity], [total]) VALUES (4, 4, 1, 3600000.0000)
INSERT [dbo].[Cart] ([cartID], [productID], [quantity], [total]) VALUES (4, 6, 1, 26300000.0000)
INSERT [dbo].[Cart] ([cartID], [productID], [quantity], [total]) VALUES (5, 5, 1, 8290000.0000)
INSERT [dbo].[Cart] ([cartID], [productID], [quantity], [total]) VALUES (5, 6, 1, 26300000.0000)
INSERT [dbo].[Cart] ([cartID], [productID], [quantity], [total]) VALUES (7, 23, 1, 5300000.0000)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (1, N'Điện thoại', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (2, N'Máy tính', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (3, N'Máy tính bảng', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (4, N'Phụ kiện', 1)
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (1, N'Ngọc Hà', N'Nhân viên văn phòng', N'"Mình đã từng mua điện thoại ở rất nhiều cửa hàng, nhưng chỉ có Smart Cellular mới chăm sóc khách hàng có tâm và tầm nhất".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (2, N'Hoàng Minh Tuấn', N'Giảng viên đại học quốc gia Hà Nội', N'"Sản phẩm chất lượng cao, chính sách ưu đãi vô cùng tốt".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (3, N'Ngô Văn Hoàng', N'Nhân viên ngân hàng', N'"Mẫu mã sản phẩm đa dạng, hiện đại, có nhiều lựa chọn cho khách hàng, tư vấn nhiệt tình, thân thiện"')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (4, N'Hoàng Lê Việt Anh', N'Kỹ sư công nghệ thông tin', N'"Sản phẩm chính hãng, chinh sách ưu đãi và bảo hành tốt, giá cả cạnh tranh. Chỉ một vấn đề nhỏ là giao hàng hơi lâu, nhưng nói chung vẫn rất tuyệt vời".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (5, N'Nguyễn Hà Anh', N'Chủ cửa hàng quần áo', N'"Công việc của mình phải sử dụng điện thoại thường xuyên nên rất cần một chiếc điện thoại cấu hình và bảo mật cao, dung lượng bộ nhớ tốt. Smart Cellular rất làm mình an tâm về việc mua sản phẩm tại đây".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (6, N'Hà Anh Tuấn', N'Nhân viên Marketing', N'"Chuyên viên tư vấn nhiệt tình, chu đáo, lại vô cùng dễ thương nữa. Lần đầu tiên mua hàng cảm thấy đáng đồng tiền".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (7, N'Lương Ngọc Quỳnh', N'Thợ chụp ảnh', N'"Mình đã đắn đo, tìm kiếm một chiếc điện thoại Iphone 12, vì trên thị trường giờ bán nhiều mà mình thì cũng không rành về điện thoại cho lắm, nhưng sau khi thấy sản phẩm của cửa hàng và các chính sách thì mình hoàn toàn tin tưởng Smart Cellular".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (8, N'Ngô Hoàng Long', N'Nhân viên lập trình', N'"Mình cũng được mấy người bạn giới thiệu qua cửa hàng, ban đầu thì vẫn còn hơi lưỡng lự nhưng sau khi sử dụng được một thời gian thì mình thấy vô cùng yên tâm".')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (1, 1, N'img_01_den.jpg', N'Màu đen')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (2, 1, N'img_01_trang.jpg', N'Màu trắng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (3, 1, N'img_01_vang.jpg', N'Màu vàng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (4, 2, N'img_02_vang.jpg', N'Màu vàng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (5, 2, N'img_02_trang_.jpg', N'Màu trắng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (6, 2, N'img_02_den.jpg', N'Màu đen')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (1, CAST(N'2021-05-04 22:10:20.117' AS DateTime), N'hic', N'9025543098     ', N'dkfnsjdkfnsj@gmail.com        ', N'hong quang', N'an thi', N'hung yen', N'cash')
INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (2, CAST(N'2021-05-07 21:14:40.627' AS DateTime), N'duy', N'4385030854     ', N'duy@gmail.com                 ', N'hung yen', N'hung yen', N'hung yen', N'cash')
INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (3, CAST(N'2021-05-08 22:31:07.910' AS DateTime), N'Tran Van Kien', N'0967775035     ', N'muahang@gmail.com             ', N'3 Cau Giay, Lang Thuong, Dong Da, Ha Noi', N'Ha Noi', N'Ha Noi', N'cash')
INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (4, CAST(N'2021-05-08 22:33:58.957' AS DateTime), N'Tran Van Kien', N'0967775035     ', N'muahang@gmail.com             ', N'3 Cau Giay, Lang Thuong, Dong Da, Ha Noi', N'Ha Noi', N'Ha Noi', N'cash')
INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (5, CAST(N'2021-05-09 00:39:48.007' AS DateTime), N'Tran Van Kien', N'0967775035     ', N'muahang@gmail.com             ', N'3 Cau Giay, Lang Thuong, Dong Da, Ha Noi', N'Ha Noi', N'Ha Noi', N'cash')
INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (6, CAST(N'2021-05-09 10:39:45.687' AS DateTime), N'Tran Van Kien', N'0967775035     ', N'muahang@gmail.com             ', N'3 Cau Giay, Lang Thuong, Dong Da, Ha Noi', N'Ha Noi', N'Ha Noi', N'cash')
INSERT [dbo].[Orders] ([cartID], [createdDate], [name], [phone], [email], [address], [city], [state], [paymentMethod]) VALUES (7, CAST(N'2021-05-09 10:40:31.443' AS DateTime), N'Tran Van Kien', N'0967775035     ', N'muahang@gmail.com             ', N'3 Cau Giay, Lang Thuong, Dong Da, Ha Noi', N'Ha Noi', N'Ha Noi', N'cash')
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (1, N'Credit')
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (2, N'Cash')
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (3, N'Paypal')
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (4, N'Samsung Galaxy A12', N'4290000             ', N'3600000             ', N'Điện thoại Samsung Galaxy A12 – Smartphone giá rẻ cấu hình tốt và pin trâu Samsung A12 là một chiếc smartphone giá rẻ nhưng sở hữu cấu hình ổn định cùng với viên pin 5000mAh cho thời lượng suốt ngày dài. Bên cạnh đó điện thoại cũng sở hữu thiết kế thời trang và phù hợp với xu hướng.', N'dt01.jpg                      ', N'Thiết kế đơn giản, 4 phiên bản màu, vân tay cạnh bên
Galaxy A12 có thiết kế đơn giản với bốn góc cạnh được bo tròn mềm mại cùng với hai cạnh bên được vát cong nhẹ nhàng tạo cảm giác cầm thoải mái cho người dùng.

Bên cạnh đó smartphone còn được cho ra mắt với nhiều phiên bản màu Đen, Trắng, Xanh thời trang để bạn có thể lựa chọn màu sắc yêu thích.

Thiết kế đơn giản, 4 phiên bản màu và cảm biến vân tay tích hợp ở mặt lưng

Samsung A12 mặc dù có thiết kế nguyên khối và chỉ sử dụng chất liệu nhựa nhưng lại được hoàn thiện vô cùng tỉ mỉ và chính xác nên vẫn mang đến cảm giác cao cấp khi chạm. Máy được hỗ trợ vân tay cạnh bên giúp người dùng mở khóa điện thoại nhanh chóng.

Màn hình giọt nước  6.5 inch và tấm nền TFT LCD tái tạo màu tốt
Mặc dù là smartphone giá rẻ nhưng Galaxy A12 vẫn sở hữu thiết kế màn hình bắt kịp với xu hướng với màn hình giọt nước và được bo tròn theo kiểu dáng của smartphone. Màn hình 6.5 inch tràn viền cho người dùng góc nhìn rộng, thoải mái tận hưởng không gian hiển thị.

Màn hình đục lỗ 6.4 inch và tấm nền TFT LCD tái tạo màu tốt

Sử dụng tấm nền TFT LCD thay vì các loại màn hình LCD thông thường mang đến khả năng tái tạo màu tốt hơn, cho hình ảnh hiển thị có màu sắc chân thực và sống động.

Smartphone còn có độ phân giải HD+ mặc dù chưa thực sự quá xuất sắc nhưng trên một thiết bị giá rẻ thì màn hình A12 đã đạt chất lượng rất tốt.

Hệ thống 4 camera sau với ống kính góc siêu rộng và camera trước 8MP
Samsung Galaxy A12 cũng mang đến cho người dùng khả năng chụp ảnh ấn tượng khi trang bị 4 camera sau với camera chính 48MP góc rộng, camera góc siêu rộng 5MP và camera xóa phông 2MP cùng camera cận cảnh 2MP.

Máy hỗ trợ đầy đủ các tính năng chụp ảnh thông minh như lấy nét tự động, chống rung,…đồng thời hỗ trợ quay phim với chất lượng 1080p sắc nét để bạn có thể quay lại mọi khoảnh khắc đáng nhớ, chụp lại các tài liệu quan trọng một cách nhanh chóng.

Hệ thống 3 camera sau với ống kính góc siêu rộng và camera trước 8MP

Ngoài ra, Samsung A12 còn sở hữu camera trước 8MP f/2.0 giúp bạn thực hiện video call chất lượng cao, chụp selfie sắc nét và xinh đẹp.

Chipset Helio G35 và RAM 4GB cho sức mạnh ấn tượng
Sức mạnh của Galaxy A12 không hề thua kém bất kỳ dòng smartphone tầm trung nào hiện nay nhờ chipset Helio G35 và RAM 4GB cho tốc độ xử lý nhanh chóng mọi thao tác tác vụ, chạy đa nhiệm mượt mà, dễ dàng chuyển đổi qua lại giữa các đa nhiệm, chơi game tốt.

Chipset Snapdragon 450 và RAM 3GB cho sức mạnh ấn tượng

Pin dung lượng 5000mAh, hỗ trợ sạc nhanh 15W
Galaxy A12 đáp ứng cho người dùng thời gian sử dụng lâu dài nhờ được trang bị viên pin dung lượng 5000mAh bền bỉ. Bạn có thể thoải mái sử dụng smartphone mà không lo hết pin liên tục suốt ngày với thời lượng bền bỉ.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (5, N'Oppo Reno5', N'8690000             ', N'8290000             ', N'Điện thoại Oppo Reno 5 – Thiết kế hiện đại sang trọng Sản phẩm mới nhất trong series OPPO Reno của hãng điện thoại OPPO chính là OPPO Reno 5. Chiếc điện thoại với nhiều kế thừa từ người tiền nhiệm Reno với thiết kế hiện đại, cấu hình cao hứa hẹn mang đến những trải nghiệm dùng ấn tượng.', N'dt02.jpg                      ', N'Màn hình nốt ruồi 6.43 inch Full HD+ tràn viền, mặt lưng kim loại sang trọng
OPPO Reno thế hệ thứ 5 sở hữu màn hình cảm ứng điện dung với thiết kế nốt ruồi 6.43 inch cùng độ phân giải Full HD+ 1080 x 2400 pixel và độ sáng lên tới 430nit mang lại hình ảnh trung thực và chính xác. Máy cũng được thiết kế các góc cạnh màn hình tràn viền tạo sự sang trọng.

Màn hình giọt nước 6.5 inch Full HD tràn viền, mặt lưng kim loại sang trọng

Phần cạnh viền và bốn góc trên OPPO Reno 5 được thiết kế bo cong mang lại trải nghiệm cầm nắm tốt. Bên cạnh đó, thiết kê nhôm không chỉ mang lại sự sang trọng mà còn mang đến khả năng tản nhiệt tốt. Thiết kế này giúp máy không bị nóng khi sử dụng trong thời gian dài cho các ứng dụng như chơi game, hay các ứng dụng nặng.

Cấu hình mạnh mẽ với chip Qualcomm Snapdragon 720G, vân tay trong màn hình
OPPO Reno 5 với chip set Qualcomm Snapdragon 720G mang lại hiệu năng cực kỳ mạnh mẽ cũng như tốc độ xử lý cực nhanh. Ngoài ra, máy cũng được trang bị bộ nhớ RAM khủng lên đến 8GB cùng bộ nhớ trong 128GB cho khả năng đa nhiệm nhiều ứng dụng cùng lúc mượt mà. Mọi hình ảnh trên máy cũng như đồ họa trong game được Reno 5 xử lý mượt mà và sắc nét. Ngoài ra, mãy cũng hỗ trợ khe cắm thẻ nhớ MicroSD với dung lượng tối đa lên tới 256GB.

Về phần mềm, điện thoại được trang bị hệ điều hành mới nhất Android 10 và chạy trên nền tảng ColorOS.

Cấu hình mạnh mẽ với chip Helio P90 SoC, vân tay trong màn hình

Công nghệ vân tay âm màn hình ngày càng phổ biến và OPPO cũng nắm bắt xu hướng khi trang bị công nghệ mới này trên mẫu OPPO Reno 5. Vân tay trên RENO 5 với tốc độ đọc nhanh mang lại thời gian mở khóa nhanh chóng cũng như tính năng bảo mật an toàn.

Bộ 4 camera sau với camera chính tới 64MP cho khả năng chụp ảnh sắc nét
Oppo Reno5 sở hữu 4 camera sau với thông số lần lượt là camera chính 64 MP, camera góc rộng 8 MP, camera tele 2 MP và camera đo độ sâu 2MP. Bốn camera trên Reno 5 với khả năng chụp hình sắc nét, chụp liên tục, chụp HDR với dải sáng cao cũng như Zoom kỹ thuật số cực kỳ chất lượng. Cụm camera này cũng hỗ trợ quay video 4K, chạm lấy nét hay nhận diện mặt người khi chụp.

Bộ 4 camera sau với camera chính tới 64MP cho khả năng chụp ảnh sắc nét

Không chỉ camera sau có độ phân giải cao, camera trước trên OPPO Reno 5 cũng được trang bị với độ phân giải lên đến 44MP. Mọi hình ảnh được chụp lại cực kỳ sắc nét khi bạn Selfie cũng như video call trực tuyến với bạn bè khi sử dụng các ứng dụng gọi điện. Camera trước cũng hỗ trợ chụp góc rộng và được thiết kế giọt nước của màn hình.

Dung lượng pin 4310 mah, hỗ trợ sạc nhanh 50W
Cũng như nhiều hãng điện thoại Android khác, OPPO cũng trang bị cho Reno 5 dung lượng pin lớn lên đến 4310 mAh. Với mức dung lượng này, máy có thể cho thời gian hoạt động cả ngày. Bên cạnh đó là sự hỗ trợ của công nghệ sạc nhanh 50W qua cổng USB-C giúp bổ sung năng lượng nhanh chóng.

Dung lượng pin 45000 mah, hỗ trợ sạc nhanh 30W

Bên cạnh đó, OPPO Reno 5 hỗ trợ 2 sim cùng mạng VoLTE 4G, jack cắm tai nghe 3,5 mm.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (6, N'Samsung Galaxy S21 Ultra 5G', N'30990000            ', N'26300000            ', N' Điện thoại Samsung Galaxy S21 Ultra - Đón đầu xu hướng công nghệ Galaxy S21 Ultra với những cải tiến đáng kể về hiệu năng của máy cực kỳ mạnh mẽ cùng với thiết kế sang trọng cao cấp. Samsung đã mang đến cho người dùng một trải nghiệm hoàn toàn mới, đây hứa hẹn sẽ là chiếc smartphone đi đầu trên thế giới về các xu hướng công nghệ lẫn hiệu năng vượt trội đáng sở hữu nhất vào thời điểm ra mắt. ', N'dt03.jpg                      ', N'Thiết kế nguyên khối, màn hình 6.8 inch tràn viền
Samsung S21 Ultra đã được Samsung trang bị bộ khung kim loại nguyên khối mang đến một phong cách thiết kế cứng cáp khi cầm nắm sử dụng, kết hợp thiết kế bố cục với mặt kính cao cấp sáng bóng ở mặt sau tạo nên một vẻ ngoài sang trọng và tinh tế từ những chi tiết nhỏ nhất. Các phím chức năng cũng được làm từ kim loại cho độ nhạy rất cao khi sử dụng.

Thiết kế kim loại nguyên khối

Điểm nổi bật nhất trên chiếc S21 Ultra đó là được trang bị màn hình kích thước lớn lên đến 6.8 inch, mang đến một không gian rộng lớn khi sử dụng. Ngoài ra chiếc điện thoại cao cấp này cũng được hãng trang bị tấm nền hiển thị Dynamics AMOLED 2X mang đến độ phân giải cực cao cho mọi hình ảnh hiển thị cực kỳ sắc nét tần số quét của màn hình này cũng đạt 120Hz cho mọi khung hình tốc độ cao.  

màn hình 6.9 inch tràn viền

Hiệu năng siêu mạnh với chip Exynos 2100, RAM 12GB
Không những có màn hình tràn viền kích thước lớn Samsung còn trang bị trên chiếc Samsung S21 Ultra cấu hình cực kỳ mạnh mẽ. Cụ thể máy được trang bị con chip mới nhất Exynos 2100 với 8 nhân tốc độ cao cho mọi tác vụ được xử lý nhanh chóng.

Ngoài ra bộ nhớ RAM của máy cũng được nâng cấp lên đến 12GB. Người dùng có thể thoải mái đa nhiệm cùng lúc nhiều ứng dụng nặng như chơi game, mạng xã hội cùng lúc mà không bị giật lag.


Bên trong của Galaxy S21 Ultra cũng được mở rộng đáng kể với dung lượng lên đến 128GB mang đến một khả năng lưu trữ rộng lớn mà không cần phải sử dụng thêm thẻ nhớ ngoài trên máy. Samsung cũng trang bị trên chiếc điện thoại này con chip Arm Mali-G78 cho khả năng xử lý hình ảnh mượt mà lên độ phân giải lên đến 2K cho nhiều tác vụ.

Camera sau độ phân giải lên đến 108MP, camera trước 40MP
Hệ thống camera sau trên Samsung Galaxy S21 Ultra cũng được nâng cấp đáng kể với độ phân giải siêu sắc nét. Camera chính được trang bị độ phân giải lên đến 108MP siêu sắc nét.

Camera phụ cũng nằm ở mức khá cao với 2camera tele 10MP, camera góc rộng đạt 12MP mang đến một chất lượng hình ảnh siêu sắc nét ở mọi tác vụ như chụp ảnh, quay video 4K. Ngoài ra hệ thống camera sau còn được trang bị cảm biến chiều sâu TOF 3D cho chất lượng hình ảnh sâu và thực với không gian bên ngoài hơn.

Camera sau độ phân giải lên đến 64MP

Camera trước trên Samsung S21 Ultra sở hữu độ phân giải 40MP. Người dùng có thể sử dụng camera trước để thực hiện selfie hay quay video độ phân giải lớn một cách dễ dàng. Camera trước cũng được trang bị góc rộng cho khả năng ghi lại hình ảnh với khung hình rộng hơn.  

Pin dung lượng 5000mAh sạc nhanh, hỗ trợ 5G tốc độ cao
Samsung đã trang bị trên chiếc S21 Ultra một dung lượng pin khá lớn lên đến 5000mAh. Người dùng có thể sử dụng hiệu năng cao kèm màn hình kích thước lớn một cách thoải mái mà không bị gián đoạn trong thời gian dài. Ngoài ra, máy cũng được trang bị khả năng sạc nhanh cho thời gian sạc đầy pin một cách nhanh chóng.

Pin dung lượng 4.800mAh sạc nhanh

5G được xem là chuẩn không dây mạnh nhất, nhanh nhất hiện tại trên các dòng điện thoại thông minh. Với chuẩn không dây này người dùng có thể thoải mái truy cập internet tốc độ siêu cao trên Galaxy S21 Ultra. Samsung cũng tích hợp 2 sim tăng khả năng mở rộng liên lạc của thiết bị.

Công nghệ bảo mật trên S21 Ultra cũng là những công nghệ hiện đại nhất với vân tay siêu âm bằng cảm biến dưới màn hình. Cổng kết nối nhanh nhất USB Type C cũng được trang bị trên chiếc điện thoại này, các công nghệ bluetooth 5.0 và Wifi dual băng tần cũng hoạt động ổn định mà mở rộng đáng kể khả năng kết nối trên S21 phiên bản Ultra.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (7, N'Samsung Galaxy Note 20 Ultra 5G', N'32990000            ', N'20990000            ', N' Điện thoại Samsung Note 20 Ultra 5G - Sang trọng, hiệu năng vượt trội Bên cạnh biên bản Galaxy Note 20 thường, Samsung còn cho ra mắt Note 20 Ultra 5G cho khả năng kết nối dữ liệu cao cùng thiết kế nguyên khối sang trọng, bắt mắt. Đây sẽ là sự lựa chọn hoàn hảo dành cho bạn để sử dụng mà không bị lỗi thời sau thời gian dài ra mắt.', N'dt04.jpg                      ', N'Thiết kế khung nhôm nguyên khối, mặt sau kính cường lực sang trọng
Là một sản phẩm có kích thước màn hình lớn vì vậy Samsung đã trang bị cho Galaxy Note 20 Ultra 5G  với công nghệ kết nối dữ liệu mạnh mẽ cùng thiết kế nguyên khối. Giúp các linh kiện bên trong điện thoại được cố định chắc chắn đảm bảo mọi thứ bên trong luôn được an toàn. Không những vậy khung nhôm tạo trên những đường viền cực kỳ sang trọng và bắt mắt khi nhìn vào.
Màn hình 6.9 inch độ phân giải 2K 120Hz, cấu hình mạnh mẽ
Đối với bất kỳ chiếc điện thoại nào đến từ Samsung dòng Note luôn là những chiếc điện thoại có kích thước màn hình lớn. Samsung Galaxy Note 20 Ultra 5G cũng vậy nó được trang bị màn hình 6.9 inch 2 cạnh bên cong tạo nên vẻ đẹp sang trọng, độ phân giải đạt 2K 1440 x 3200 pixels cho hình ảnh hiển thị cực kỳ sắc nét. Ngoài ra tần số quét trên màn hình cũng nằm ở mức lớn 120Hz ở độ phân giải FHD và 60Hz ở QHD. Mọi hình ảnh khi bạn chơi game với khung hình cao hay trải nghiệm những bộ phim hành động cực kỳ mượt mà và sắc nét với công nghệ HDR10+.
Samsung Note 20 Ultra 5G sở hữu bên trong một cấu hình cực kỳ mạnh mẽ cân dư sức các tựa game nặng nhất hiện nay. Máy sử dụng chip Exynos 992 tốc độ siêu nhanh đi kèm bộ nhớ RAM 12GB cho bộ nhớ 256GB giúp người dùng có thể thoải mái sử dụng đa nhiệm và lưu trữ thoải mái. Tất cả tạo nên một cấu hình cực kỳ mạnh mẽ có thể đáp ứng mọi nhu cầu của bạn trên một chiếc điện thoại.
Màn hình 6.9 inch độ phân giải 2K 120Hz, cấu hình mạnh mẽ
Trang bị công nghệ 5G tương lai, tốc độ cao khi sử dụng dữ liệu
Hầu hết trên tất cả các nước nói chung và Việt Nam nói riêng đều đang bắt đầu phủ sóng băng tần 5G dần dần để thay đổi các chuẩn thấp hiện tại. Nắm bắt được nhu cầu và xu hướng thị trường hãng đang trang bị Samsung Galaxy Note 20 Ultra công nghệ 5G tốc độ cao. Khi lựa chọn chiếc điện thoại này bạn sẽ không cần phải lo lắng chiếc điện thoại của mình sẽ không theo kịp các công nghệ đổi mới của tương lai.

Với công nghệ 5G người dùng có thể truy cập internet với tốc độ cực cao lên đến 10Gb/s nhanh hơn tất cả các đường truyền wifi cáp quang mà bạn đang sử dụng. Vì vậy lựa chọn Note 20 Ultra 5G không những mạnh mẽ về cấu hình với kích thước lớn mà còn giúp bạn không đi lùi so với những công nghệ nổi bật và quan trọng như 5G.
Camera sau 108MP zoom quang học lên đến 50X, camera trước 40MP
Không những mang đến cấu hình máy hiệu năng cao Galaxy Note 20 Ultra 5G còn mang đến cho bạn bộ 3 camera có độ phân giải cao. Cụ thể camera chính có độ phân giải 108 MP khẩu độ f/1.8, camera periscope telephoto 13 MP khẩu độ f/3.4, camera góc rộng 2 MP khẩu độ f/2.2. Bộ 3 camera này cộng lại cho khả năng zoom quang học lên đến 50X. Giúp bạn lưu lại được những hình ảnh chất lượng cao ở khoảng cách xa và góc cực rộng với độ phân giải lên đến 8K.
Hỗ trợ sạc nhanh 45W qua USB Type C, pin dung lượng lớn 4500mAh
Samsung Note 20 Ultra 5G được hãng trang bị khả năng sạc nhanh công suất lên đến 45W qua cổng USB Type C cho khả năng sạc đầy pin cực kỳ nhanh chóng chưa đến 90 phút. Không những vậy Note 20 Ultra 5G còn có khả năng sạc ngược cho thiết bị khác với công suất 9W. Máy cũng trang bị khả năng sạc không dây công suất lên đến 15W.
Bút S-Pen siêu nhạy, nhiều trang bị kết nối hiện đại, cảm biến vân tay dưới màn hình
Hầu hết các dòng điện thoại Samsung Galaxy Note đều được trang bị bút S-Pen và Galaxy Note 20 Ultra 5G cũng không ngoại lệ. Chiếc bút này được cải tiến nhiều hơn so với các dòng cũ có độ nhạy cực cao và điều hướng thông minh cực kỳ chính xác. Bạn có thể sử dụng bút S-Pen để thỏa sức sáng tạo với những tính năng tuyệt vời và công nghệ cực kỳ thông minh.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (8, N'Xiaomi Redmi Note 10', N'5490000             ', N'5090000             ', N'Điện thoại Xiaomi Redmi Note 10 – Hài hòa giữa công nghệ hiển thị và hiệu năng Đến hẹn lại lên, trong năm nay Xiaomi tiếp tục làm mới bộ sưu tập thiết bị tầm trung của mình với chiếc smartphone mới trong dòng Redmi Note, thiết bị mang tên Redmi Note 10. Những chiếc điện thoại Xiaomi Redmi Note đã quá hot, liệu chiếc smartphone mới này có đủ sức làm lu mờ đi những sản phẩm tiền nhiệm không.   Ngoài ra, khách hàng cũng có thể tham khảo thêm Xiaomi Redmi Note 10 5G để tận hưởng mạng 5G tốc độ cao trên một chiếc smartphone giá rẻ.', N'dt05.jpg                      ', N'Màn hình Amoled 6.43 inches, độ phân giải FullHD+
Điện thoại Redmi Note thế hệ 10 tiếp tục được sở hữu thiết kế kim loại nguyên khối với mặt lưng cong 3D đặc trưng của dòng sản phẩm này. Qua đó, đem lại một ngoại hình sang trọng và bắt mắt với các đường nét mềm mại, giúp bạn tự tin hơn khi cầm máy.

Màn hình của Xiaomi Redmi Note 10 có kích thước 6.43 inch, độ phân giải Full HD+, mật độ điểm ảnh cao đến tận 409 ppi, đem đến khả năng hiển thị vô cùng sắc nét, chưa từng thấy trên những chiếc Redmi Note trước. Nhờ vào việc sử dụng tấm nền Amoled, cho độ sáng cao, màu sắc trung thực, thích hợp để chụp ảnh và hoạt động chỉnh sửa ảnh.

Màn hình 6.58 inches, độ phân giải FullHD+, tấm nền IPS sắc nét

Chiếc smartphone này sử dụng màn hình đục lỗ, camera trước được đặt ở giữa màn hình. Điều này mang đến trải nghiệm không gian hoàn toàn mới mẻ và tối ưu nhất.

Vi xử lý Snapdragon 678 cho hiệu năng mạnh mẽ
Không còn cái nhìn tiêu cực vào những vi xử lý của Snapdragon, với chip mới nhất này sẽ khiến tất cả phải có cái nhìn mới về Snapdragon 678. Chiếc Snapdragon 678 được tích hợp bên trong điện thoại Redmi Note 10 là loại chip được sản xuất trên tiến trình 11nm.

Vi xử lý MediaTek MT6875 Dimensity 820, 6GB RAM, 64GB bộ nhớ trong

Với con chip Snapdragon 678 này, bạn sẽ được trải nghiệm khả năng xử lý mượt mà và nhanh chóng nhất khi giải trí với những tựa game đồ họa nặng, xem phim chất lượng FullHD,…

Bên cạnh đó, góp phần cung cấp sức mạnh cho sản phẩm này là 6GB RAM, hỗ trợ đa nhiệm tuyệt vời, mở nhiều ứng dụng cùng một lúc hoàn toàn không bị giật lag. Bộ nhớ trong 128GB mở rộng khả năng lưu trữ, thoải mái sử dụng dữ liệu.

Bốn camera sau chụp góc siêu rộng, camera selfie 13MP
Điểm độc đáo trong thiết kế của Redmi Note 10 đó chính là cụm camera sau ở mặt lưng được xếp thành cụm hình vông, trông khá bắt mắt. Và đây chính là hệ thống bốn ba camera với độ phân giải “khủng” lần lượt là 48MP, F/1.8 hỗ trợ chụp ảnh góc rộng, 8MP F/2.2 chụp ảnh góc siêu rộng 118 độ, hai camera 2MP đo chiều sâu ảnh và chụp ảnh macro.

Ba camera sau chụp góc siêu rộng, camera selfie 16MP

Với sự kết hợp này, Xiaomi Redmi Note 10 của bạn hoàn toàn đủ khả năng để chụp ảnh một cách chuyên nghiệp với nhiều trường hợp khác nhau như chụp ảnh nhóm hay chụp ảnh chân dung, mang đến cho bạn những tấm ảnh xuất sắc.

Camera trước được thiết kế dạng đục lỗ, giúp mở rộng khung hình. Camera trước có độ phân giải 13MP đầy đủ các tính năng như chụp HDR và panorama, sẵn sàng hỗ trợ bạn chia sẻ ảnh đẹp lên mạng xã hội bất cứ lúc nào.

Viên pin 5.000 mAh tích hợp sạc nhanh 33W  
Không khỏi bất ngờ khi chiếc điện thoại Redmi Note 10 được trang bị viên pin khủng 5.000 mAh, bởi lẽ đó vốn là đặc trưng của điện thoại Xiaomi. Với dung lượng này, chiếc máy cho phép bạn sử dụng thoải mái trong 1,5 ngày với cường độ sử dụng dày đặc.

Viên pin 4.520 mAh tích hợp sạc nhanh 22.5W và sạc ngược 9W

Ngoài ra, máy còn có khả năng sạc nhanh 33W, nhà sản xuất cho biết rằng nó cho khả năng sạc đầy pin chỉ trong vòng 30 phút.  ', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (9, N'iPhone 12 Pro Max I Chính hãng VN/A ', N'32990000            ', N'29500000            ', N'Điện thoại iPhone 12 Pro Max: Nâng tầm đẳng cấp sử dụng Cứ mỗi năm, đến dạo cuối tháng 8 và gần đầu tháng 9 thì mọi thông tin sôi sục mới về chiếc iPhone mới lại xuất hiện. Apple năm nay lại ra thêm một chiếc iPhone mới với tên gọi mới là iPhone 12 Pro Max, đây là một dòng điện thoại mới và mạnh mẽ nhất của nhà Apple năm nay. Mời bạn tham khảo thêm một số mô tả sản phẩm bên dưới để bạn có thể ra quyết định mua sắm.', N'dt06.jpg                      ', N'Màn hình 6.7 inches Super Retina XDR
Năm nay, công nghệ màn hình trên 12 Pro Max cũng được đổi mới và trang bị tốt hơn cùng kích thước lên đến 6.7 inch, lớn hơn so với điện thoại iPhone 12. Với công nghệ màn hình OLED cho khả năng hiển thị hình ảnh lên đến 2778 x 1284 pixels. Bên cạnh đó, màn hình này còn cho độ sáng tối đa cao nhất lên đến 800 nits, luôn đảm bảo cho bạn một độ sáng cao và dễ nhìn nhất ngoài nắng.
Một điểm đổi mới nữa trên màn hình của chiếc điện thoại Apple iPhone 12 năm nay là việc chúng được thiết kế với khung viền vuông vức, viền thép không gỉ mang đến vẻ đẹp sang trọng cho điện thoại. Máy cũng được trang bị nhiều phiên bản màu sắc đặc biệt cho người dùng lựa chọn.
Về trang bị phần cứng bên trong thì iPhone 12 Pro Max có một thanh RAM lên đến 6GB. Điều này cho thấy rằng Apple ngày đang lắng nghe người dùng nhiều hơn khi trang bị một dung lượng RAM lớn hơn để việc đa nhiệm ngày càng được cải thiện hơn. Việc thanh ram lớn giúp cho bạn trải nghiệm các tựa game và đa nhiệm mượt mà hơn.
Năm nay, 12 Pro Max cũng sẽ có ba phiên bản bộ nhớ trong khác nhau, với bộ nhớ trong nhỏ nhất bắt đầu từ 128GB, 256GB và cao nhất sẽ là 512GB. Một chiếc điện thoại mà có một bộ nhớ trong lớn ngang ngửa một chiếc laptop là điều mà Apple muốn mang lại cho người dùng để có thể san sẻ bớt bộ nhớ cho các thiết bị khác.
Con chip Apple A14 SoC 5nm, RAM 6GB mạnh mẽ
iPhone 12 Pro Max không những chỉ có các cải tiến trên, mà chúng còn có một thứ cải tiến được coi là nguồn lõi và là trái tim để vận hành chiếc điện thoại siêu phẩm 2020, đó là con chip Apple A14 SoC 5nm. Trang bị này giúp cho điện thoại có một sức mạnh đáng gờm hơn các đối thủ hơn về hiệu năng, hiệu suất sử dụng pin.
Máy cũng được trang bị chuẩn kết nối wifi và mạng di động giúp cho bạn có thể cải thiện hiệu suất sử dụng mạng và chúng còn giúp các đường truyền tín hiệu luôn được đảm bảo không rớt kết nối và tăng chất lượng hiển thị hình ảnh trên mạng.
Có thể nói camera cũng là một bước tiến mới trên iPhone 12 Pro Max khi chúng có một bộ 3 camera với chung một độ phân giải là 12MP. Tuy nhiên chúng có khẩu độ lớn và mật độ điểm ảnh trên một panel cũng lớn hơn, do đó chúng cho hình ảnh chi tiết hơn, bắt sáng tốt hơn. Ngoài ra, kết hợp chống rung quang học OIS thì máy còn có thể quay phim 4K tốt.
Camera trên iPhone 12 Pro Max có chức năng quét chiều sâu và đảm bảo hình ảnh có một độ sâu nhất định. Cùng với đó chức năng chính của chiếc ống kính này là khả năng thể hiện hình ảnh 3D khi quét chúng vào một căn phòng nhất định. Giúp phục vụ cho công việc xây dựng cũng như định dạng hình ảnh
Camera trước 12MP cũng có cùng khẩu độ và kích thước điểm ảnh trong panel giống như camera. Điều này giúp cho việc sử dụng chúng cho chụp ảnh selfie tốt hơn và chân thực hơn. Cùng với đó một tính năng mà Apple luôn giữ chúng từ đời iPhone X đến giờ là khả năng quét khuôn mặt 3D FaceiD.
Công nghệ chống nước là không thể thiếu trên các dòng điện thoại cao cấp và đặc biệt là đối với iPhone 12 Pro Max. Chúng được trang bị công nghệ chống nước và chống bụi tốt nhất hiện nay trên các dòng smartphone đó là tiêu chuẩn IP68. Giúp bạn luôn có thể yên tâm hơn trong việc sử dụng quay phim dưới nước hay ở môi trường khắc nghiệt.
Viên pin liền cho thời lượng sử dụng lên đến cả ngày cùng công nghệ sạc nhanh 
Một viên pin liền với dung lượng lớn trên iPhone 12 Pro Max giúp cho chiếc điện thoại bạn có thể hoạt động được một cách ổn thoả hơn và thời gian sử dụng được lâu dài hơn. Cụ thể, máy cho thời gian nghe nhạc lên tới 80 giờ hoặc 12 giờ xem video trực truyến.
Công nghệ sạc là trên 12 Pro Max là công nghệ sạc nhanh không dây lên đến 15W. Điều này có thể giúp bạn hạn chế được các việc phải ngồi đợi chiếc điện thoại của mình sạc xong khi máy có thể bổ sung 50% dung lượng chỉ trong vòng 30 phút.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (10, N'iPhone 11 I Chính hãng VN/A ', N'18000000            ', N'15800000            ', N'giảm lên đến 500.000 ₫  Điện thoại iPhone 11  – Camera nâng cấp, màu sắc trẻ trung iPhone 11 là model có nhiều màu sắc nhất và có giá rẻ nhất trong bộ 3 iPhone 11 series được Apple ra mắt trong năm 2019. Bên cạnh đó, cấu hình máy cũng được nâng cấp đặc biệt về cụm camera sau và Face ID, viên pin dung lượng lớn hơn.', N'dt07.jpg                      ', N'Thiết kế từ nhôm và vỏ kính, chuẩn chống nước IP68
iPhone 11 có kiểu dáng đẹp mắt khi được hoàn thiện từ nhôm và vỏ kính bền nhất trong thế giới smartphone. Máy được sử dụng tới 7 tầm nền màu sắc giúp màu sơn có độ sâu đầy ấn tượng phản chiếu qua lớp kính sang trọng.

Khung nhôm trên iPhone 11 được sơn mờ tương tự như trên iPhone Xr. Trong khi hai phiên bản cao cấp Pro và Pro Max là khung thép không gỉ.
Nhận diện khuôn mặt Face ID được nâng cấp, âm thanh sống động

Về âm thanh với chất lượng âm tốt với hệ thống loa kép nằm ở cả trên và dưới, đặc biệt với âm thanh nổi stereo. Trong trải nghiệm giải trí, máy cho âm thanh cân bằng kể cả khi đặt máy nằm ngang. Khi giải trí với âm lượng cao, mặt lưng cũng không bị rung, ảnh hưởng trải nghiệm người dùng.

Màn hình LCD 6,1 inch Liquid Retina cho màu sắc vô cùng chân thực
iPhone 11 sử dụng màn hình LCD tiên tiến nhất hiện nay, cũng tương tự như phiên bản Pro hiển thị tuyệt đẹp với kích thước lớn 6,1 inch Liquid Retina sắc nét, tràn viền cạnh cùng mật độ điểm ảnh 326ppi. Thiết kế tràn viền giúp cho dù màn hình lớn tới 6,1 inch nhưng máy vẫn nhỏ gọn hơn so với iPhone 8 Plus, dễ dàng cầm nắm thao tác bằng một tay.
Ngoài ra, để nâng cao chất lượng hiển thị, Apple đã tích hợp công nghệ True-Tone. Công nghệ giúp điều chỉnh ánh sáng màn hình theo ánh sáng môi trường. Nhờ đó người dùng sẽ hạn chế tình trạng đau mắt khi sử dụng máy trong thời gian dài.

Màn hình trên iPhone 11 vẫn giữ nguyên thiết kế tai thỏ, phần notch này chứa camera selfie, loa và FaceID và một số cảm biến khác. Đặc biệt màn hình này còn được tích hợp lớp kính cường lực Gorilla Glass với khung viền được bo cong 2,5D cho các thao tác vuốt thoải mái. Mặt kính này được Apple phủ một lớp oleophobic giúp hạn chế bám vân tay cũng như dễ dàng lau chùi, vệ sinh.

Màn hình LCD 6,1 inch Liquid Retina cho màu sắc vô cùng chân thực
Về màu sắc hiển thị, máy cho khả năng hiển thị màu sắc cao với điểm DeltaIE trung bình đạt 1,1 cùng độ lệch 2,4. Đặc biệt, điện thoại hỗ trợ dải màu DCI-P3 giúp màn hình giữ được độ chính xác cao, kể cả khi màn hình ở độ sáng thấp nhất.

Cụm camera kép góc siêu rộng 12 MP, camera selfie 12 MP
Apple đã khéo léo thiết kế cụm camera to và nổi bật hơn trên điện thoại giúp người dùng dễ nhận dạng sản phẩm, mặt khác Apple muốn mang đến một làn gió mới trên thiết bị này với cụm camera vuông độc đáo. Apple iPhone 11 được tích cảm biến góc rộng 12 MP và cảm biến góc siêu rộng 12 MP. Thiết kế của camera kép này cũng to hơn thông thường.

iPhone 11 được tích cảm biến góc rộng 12 MP và cảm biến góc siêu rộng 12 MP

Chất lượng hình ảnh trên iPhone 11 với chi tiết cao cùng độ noise thấp, dải màu động. Khi ở chụp ở chế độ zoom 2x, máy vẫn cho chi tiết tốt nếu chụp ở điều kiện đủ sáng.

Hoạt động mượt mà với chip A13 Bionic mạnh mẽ
Một trong những nâng cấp khác đáng chú ý trên iPhone 11 chính là chip xử lý Apple A13 Bionic. Đây là con chip nhanh nhất từng có trong điện thoại thông minh, cung cấp hiệu năng vô song cho mọi tác vụ và có CPU cùng GPU nhanh hơn tới 20% so với A12.

Cùng với bộ nhớ trong 64GB và dung lượng ram 4GB cho khả năng hoạt động mượt mà, đa nhiệm ấn tượng cũng như không gian lưu trữ vừa đủ với yêu cầu thông thường. Bên cạnh bản 64GB bộ nhớ trong tiêu chuẩn, Apple còn cung cấp thêm những phiên bản nâng cấp khác như iPhone 11 128GB và 256GB.
Với viên pin 3110 mAh, người dùng có thể sử dụng để lướt web suốt 15 tiếng và xem video 10 tiếng liên tục, con số này thực sự ấn tượng. Và nó nhiều hơn cả Xr cũng như thời gian sử dụng của iPhone 11 còn lâu hơn 1.5 tiếng so với iPhone 8 Plus. 
Máy còn có khả năng sạc nhanh tới 50% trong 30 phút với bộ chuyển đổi 18W trở lên (được bán riêng) và hỗ trợ sạc không dây chuẩn Qi. ', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (11, N'iPhone 12 I Chính hãng VN/A', N'22990000            ', N'19890000            ', N'giảm lên đến 500.000 ₫  Điện thoại iPhone 12 - "Siêu phẩm" iPhone khẳng định đẳng cấp Trong khi sức hút đến từ bộ ba iPhone 11 vẫn chưa nguội đi, hãng Apple vừa qua đã cho ra mắt "siêu phẩm" mới nhất 2020 mang tên iPhone 12. Với những nâng cấp đáng kể cho màn hình và hiệu năng, đây sẽ là smartphone thuộc phân khúc cao cấp đáng chú ý trong năm nay.', N'dt08.jpg                      ', N'Màn hình Super Retina OLED rộng 6.1 inch
Apple đã quyết định giữ nguyên thiết kế notch "tai thỏ" quen thuộc cho màn hình iPhone 12, nhưng phần notch đã được tinh giản nhỏ gọn lại nhằm tạo thêm tỷ lệ hiển thị hình ảnh trên màn hình. Về kích thước, màn hình của máy độ phân giải 2532x 1170pixels và có kích thước 6.1 inch, nhỏ hơn so với iPhone 12 Pro Max (6.7 inch).

Thân máy nguyên khối cứng cáp & bền bỉ
Toàn thân máy được chế tác từ chất liệu nguyên khối cứng cáp, với khung máy làm từ thép không gỉ và hai mặt trước & sau được phủ kính cường lực Gorilla Glass. iPhone 12 cũng có khả năng chống nước và chống bụi theo tiêu chuẩn IP68 và hỗ trợ cả Apple Pay, đáp ứng nhu cầu sử dụng cần thiết của người dùng.

Camera kép 12MP + 12MP ở mặt sau, hỗ trợ quay video 4K HDR 
iPhone 12 được trang bị cụm camera hai ống kính ở mặt sau, với hai ống kính có cùng độ phân giải 12MP. Cụm camera này đều được nâng cấp so với thế hệ trước.

Camera phụ với 5 thấu kính hỗ trợ chụp ảnh góc rộng với khẩu độ f/2.4 với góc chụp rộng lên đến 120 độ. Cảm biến này được đánh giá khá giống với iPhone 11 và 11 Pro.

Camera selfie 12MP ở mặt trước
Ở phần notch mặt trước của điện thoại iPhone 12 còn có camera selfie độ phân giải 12MP. Tương tự như iPhone 11, camera selfie của iPhone có thêm tính năng gyro-EIS và cảm biến đo chiều sâu sinh trắc học SL 3D hiện đại, mang đến chất lượng hình ảnh rõ nét & hoàn mỹ.

Vi xử lý Apple A14 5nm với RAM 4GB và dung lượng 64GB
Mỗi thế hệ iPhone mới đều tương ứng với dòng CPU mới hơn nhằm mang lại hiệu năng mạnh mẽ nhất. Và iPhone 12 năm nay được trang bị bộ vi xử lý Apple A14 Bionic chạy trên tiến trình 5nm kèm chip cấu hình GPU do Apple sản xuất.

Bởi vì chip Apple A13 Bionic trước đó được đánh giá là mạnh nhất trong các thế hệ chip Apple, ta có thể mong chờ hiệu năng vượt trội đến từ Apple A14 Bionic trên iPhone.  

Ngoài ra, iPhone 12 còn có mức RAM 4GB và dung lượng lưu trữ 64 GB. Hệ điều hành chính của máy sẽ là iOS 14 cùng với một số tính năng đặc biệt như chế độ hiển thị màn hình, ứng dụng thể dục, quét mã QR và những nâng cấp phần mềm đáng kể giúp tăng trải nghiệm sử dụng.

Sử dụng cả ngày, hỗ trợ sạc nhanh 20W
Điện thoại iPhone 12 cũng được nâng cấp về dung lượng pin so với người tiền nhiệm iPhone 11. Cụ thể, máy sẽ mang đến cho người dùng hơn 17 giờ xem video, hơn và lên đến 65 giờ nghe nhạc liên tục.

Điểm mới trên iPhone 12 đó chính là sạc MagSafe. Đây là công nghệ sạc không dây mới của Apple với đế nam châm giúp cố định vào mặt lưng điện thoại. Nhờ đó quá trình sạc được ổn định và an toàn. Khi sử dụng sạc MagSafe, máy có thể sạc dưới công suất 15W.

Điện thoại iPhone 12 còn được trang bị công nghệ chống nước và bụi bẩn IP68. Công nghệ hỗ trợ chống nước ở độ sâu 6m trong vòng 30 phút. Nhờ đó, người dùng iPhone 12 có thể thoải mái sử dụng ở nhiều môi trường khác nhau, kể cả dưới trời mưa phùn hay mang đi bơi lội.

Hệ điều hành iOS 14, bảo mật Face ID an toàn

Ngoài ra, điện thoại iPhone 12 chính hãng VNA sẽ hỗ trợ 1 esim và 1 nano sim. Nhờ đó người dùng có thể sử dụng song song hai số điện thoại đầy tiện lợi.
iPhone 12 vẫn chưa có sự xuất hiện trở lại của Touch ID nhưng công nghệ nhận dạng khuôn mặt Face ID vẫn mang lại thời gian mở máy nhanh chóng cùng độ bảo mật cao.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (12, N'iPhone XR 64GB I Chính hãng VN/A', N'14990000            ', N'11990000            ', N'iPhone XR - Điện thoại sang trọng, trẻ trung với nhiều màu sắc Được ra mắt cùng Apple iPhone XS và XS Max, iPhone XR không chỉ được thừa kế những tính năng đặc trưng nổi trội của người tiền nhiệm iPhone X được ra mắt một năm trước đó và còn có những cải tiến nhằm mang lại trải nghiệm mới lạ và thú vị cho người dùng.', N'dt09.jpg                      ', N'Thiết kế sang trọng và màu sắc trẻ trung
Về ngoại hình, iP XR không quá khác biệt so với iPhone X với vẻ đẹp đến từ thiết kế viền siêu mỏng, tai thỏ mặt trước, và các cạnh được bo tròn. Máy cũng được có tiêu chuẩn chống nước chống bụi IP67 như các dòng siêu phẩm mới sau này của Apple.

Đồng thời, thiết kế của Apple iPhone XR 64GB vẫn được thừa hưởng iPhone X với hai mặt kính, điểm khác biệt là nhà sản xuất trang bị cho iPhone XR khung nhôm series 7000 (iPhone XR là khung thép không rỉ).

Màn hình kích thước 6.1 inch, hiển thị sắc nét
iPhone XR sử dụng tấm nền Liquid Retina, đồng thời tăng kích thước màn hình so với iPhone X (6.1 inch so với 5.8 inch), độ phân giải 828 x 1792 pixels cùng mật độ điểm ảnh 324 ppi. Khác với iPhone XS hay XS Max, dòng smartphone này sở hữu màn hình LCD - Apple cho biết đây là màn hình LCD tiên tiến nhất trên bất kỳ điện thoại thông minh nào.

Dung lượng 64GB giúp người dùng lưu trữ thoải mái
iPhone XR được Apple trang bị 2 tùy chọn bộ nhớ trong là 64GB và 256GB, trong khi 256GB là quá nhiều với nhu cầu sử dụng bình thường của người dùng thì 64GB là dung lượng lưu trữ khá tốt và thoải mái. Hiện nay có rất nhiều ứng dụng cung cấp dịch vụ lưu trữ lên đám mây nên bạn không cần phải lo hết dung lượng.

Hiệu năng mạnh mẽ nhờ chip Apple A12 Bionic tiên tiến
Mỗi lần ra mắt sản phẩm mới, Apple lại trình làng một con chip mới và Apple A12 Bionic mà iPhone XR sử dụng là con chip đầu tiên sản xuất trên nền tảng 7nm, gồm CPU, GPU và Neural Engine. Chip A12 Bionic được đánh giá là có nhiều cải tiến so với tiền nhiệm chip A11 khi xử lý dữ liệu mạnh mẽ hơn 15%, xử lý đồ họa nhanh hơn 40% và tiết kiệm điện năng hơn 50%.

Camera đơn 12 MP xóa phông tuyệt đỉnh và camera trước độ phân giải 7 MP
Đừng nghĩ rằng chỉ có camera kép mới có thể xóa phông đẹp, iPhone XR với camera sau 12 MP khẩu độ f/1.8 duy nhất vẫn có khả năng tạo hiệu ứng bokeh huyền ảo, làm nổi bận chân dung nhân vật chính và cho những hình ảnh vô cùng sắc nét và chi tiết. Ngoài ra, camera trước với độ phân giải 7 MP, khẩu độ f/2.2 mang công nghệ TrueDepth mới nhất cùng Animoji, Memoji thông minh sẽ cho bạn những tấm ảnh selfie với hiệu ứng ánh sáng studio có chiều sâu và những biểu tượng cảm xúc sinh động.

Dung lượng pin, hệ thống FaceID và Haptic Touch
iPhone XR 64GB được cho là chiếc iPhone có thời lượng pin “trâu bò” 2.942 mAh, lâu hơn 1 tiếng rưỡi so với thời lượng của iPhone 8 Plus. Ngoài ra, chiếc smartphone này có hỗ trợ sạc pin nhanh và sạc pin không dây Qi, do đó việc nạp năng lượng cho thiết bị không còn là vấn đề tốn nhiều thời gian nữa.

iPhone XR 64GB có viên pin 2.942 mAh

Ở iPhone XR, nút Home cảm biến vân tay TouchID bị “khai tử” và thay thế bằng công nghệ FaceID và Haptic Touch. Công nghệ bảo mật khuôn mặt FaceID ngày càng hoàn thiện giúp người dụng mở khóa nhanh chóng trong mọi điều kiện sử dụng. Tính năng Haptic Touch cũng tương tự chức năng của 3D Touch: bạn sẽ nhấn giữ vào các nút nhất định để mở ra các menu, phím tắt giống như 3D Touch và máy cũng sẽ rung lên cho bạn biết.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (13, N'iPhone 12 Pro I Chính hãng VN/A', N'30990000            ', N'27000000            ', N'Điện thoại iPhone 12 Pro - Đột phá về thiết kế, hiệu năng nâng cấp Ra mắt vào cuối năm 2020, iPhone 12 series mang đến một luồng gió với trong phân khúc smartphone cao cấp. Với thiết kế đổi mới đột phá so với thế hệ trước cùng nhiều nâng cấp về hiệu năng đáng kể trên iPhone 12 Pro. Đây sẽ là một trong những chiếc điện thoại đáng được bạn lựa chọn nhất so với các chiếc điện thoại khác cùng phân khúc giá.  ', N'dt10.jpg                      ', N'Thiết kế đột phá kiểu mới khung thép không gỉ, màn hình Super Retina 6.1 inch 
Sau một thời dài ra mắt các sản phẩm mới có chút ít thay đổi về thiết kế bên ngoài. Năm 2020, iPhone 12 Pro mang đến một phong cách thiết kế đột phá hơn với phần viền được CNC vuông bo tròn như hơi hướng của người anh iPhone 5.

Màn hình trên điện thoại iPhone 12 Pro vẫn giữ nguyên thiết kế tai thỏ nhưng phần viền được Apple thiết kế mỏng hơn mang đến một cái nhìn hoàn toàn mới về màn hình trên điện thoại.

Với kích thước màn hình lớn lên đến 6.1 inch sử dụng tấm nền Super Retina XDR OLED với độ phân giải 2K mọi hình ảnh đều được tái hiện sắc nét đến từng chi tiết trên một không gian rộng đủ để bạn thoải mái sử dụng.  

Cấu hình hiệu năng mạnh mẽ với chip Apple A14 Bionic, bộ nhớ ram 6Gb, bộ nhớ trong dung lượng lớn

Năm nay bộ nhớ trong tối thiểu trên điện thoại iPhone 12 Pro đã được nâng cấp lên 128Gb. Tăng khả năng lưu trữ gấp đôi so với phiên bản basic nhất như các dòng iPhone Pro thế hệ trước.

Apple cũng hỗ trợ nhiều mức dung lượng nữa bao gồm 256Gb và 512Gb đến cho người dùng. Với những mức dung lượng này người dùng có thể thoải mái lưu trữ dữ liệu, cài đặt ứng dụng, game nặng mà không bị đầy bộ nhớ khi sử dụng.

Bộ ba camera sau + cảm biến LiDAR, camera trước siêu sắc nét
Tương tự như điện thoại iPhone 12 Pro Max, phiên bản Pro cũng được Apple đã trang bị bộ ba camera chất lượng cao cùng độ phân giải 12MP bao gồm camera chính góc rộng, camera góc siêu rộng và ống kính tele. Máy cũng được trang bị ống kính cảm biến LiDAR cho khả năng chụp ảnh sắc nét và chất thật nhất. Khả năng chụp góc rộng và Zoom trên siêu phẩm cũng được nâng cấp đáng kể cho chất lượng và khả năng chụp ảnh tốt hơn.

Pin lithium – ion dung lượng cao, hỗ trợ sạc nhanh 20W
Là chiếc điện thoại có hiệu năng mạnh mẽ cùng màn hình kích thước lớn. Vì vậy Apple đã trang bị cho iPhone 12 Pro một khoảng dung lượng pin lớn. Với khoảng dung lượng này người dùng có thể thoải mái sử dụng cả một ngày dài mà không lo hết pin. Máy cũng được trang bị công nghệ sạc nhanh với công suất lớn cho thời gian sạc đầy pin nhanh chóng.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (14, N'Laptop Lenovo Yoga 6 13ARE05 82FN0052VN', N'19990000            ', N'18990000            ', N'Laptop Lenovo Yoga 6 13ARE05 82FN0052VN - Hiệu năng vượt trội với chip Ryzen 5 PRO 4650U Nếu bạn đang tìm kiếm một chiếc laptop làm việc đa chức năng với hiệu suất vượt trội, sản phẩm laptop Lenovo Yoga 6 13ARE05 82FN0052VN với bộ vi xử lý Ryzen 5 PRO 4650U sẽ đáp ứng trọn vẹn tất cả nhu cầu làm việc của bạn.', N'mt01.jpg                      ', N'Màn hình cảm ứng xoay đa năng, tương thích với bút cảm ứng
Laptop Lenovo Yoga 6 13ARE05 82FN0052VN được trang bị màn hình 13.3 inch Full HD (1920 x 1080 pixels) với khả năng xoay nghiêng độc đáo đáp ứng nhu cầu công việc đa năng.

Đặc biệt, màn hình của máy thuộc dạng cảm ứng đa điểm, và tương thích với cả bút cảm ứng đi kèm giúp làm việc hiệu quả hơn, nhất là những công việc về thiết kế.

Màn hình cảm ứng xoay đa năng, tương thích với bút cảm ứng

Thiết kế tổng thể của Lenovo Yoga 6 13ARE05 82FN0052VN mang màu xanh tinh tế, kiểu dáng gọn gàng, trọng lượng nhẹ chỉ 1.32kg phù hợp để bạn thoải mái mang theo bên mình và làm việc từ xa.

Chiếc máy được làm từ chất liệu nhôm nguyên khối bền bỉ, góp phần gia tăng độ cứng cáp cho chiếc máy. Các phương thức kết nối như USB Type-C, USB Type-A, jack tai nghe 3.5mm cũng hiện diện trên Lenovo Yoga 6 13ARE05 82FN0052VN.

Bộ vi xử lý Ryzen 5 PRO 4650U với RAM 8 GB cùng ổ cứng SSD 512 GB đáp ứng công việc hiệu quả
Laptop Lenovo Yoga 6 13ARE05 82FN0052VN được trang bị bên trong bộ vi xử lý Ryzen 5 Pro 4650U. Đây là con chip 6 lõi 12 luồng, với tần số dao động 2.1 GHz ~ 4.0 GHz cùng chip đồ họa onboard AMD Radeon Graphics giúp xử lý tác vụ đa nhiệm hiệu quả, cũng như render hình ảnh chất lượng rõ nét.

Bộ vi xử lý Ryzen 5 PRO 4650U với RAM 8 GB cùng ổ cứng SSD 512 GB đáp ứng công việc hiệu quả

Bên trong Lenovo Yoga 6 13ARE05 82FN0052VN còn được trang bị thêm hệ điều hành Windows 10, dung lượng RAM 8 GB và ổ cứng SSD dung lượng 512 GB PCIe cho tốc độ khởi động hệ thống nhanh, cũng như kho lưu trữ rộng rãi. Chiếc máy còn được trang bị viên pin 60Wh cho thời lượng làm việc đa nhiệm liên tục suốt 4 - 5 giờ.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (15, N'Laptop ASUS Gaming ROG Zephyrus GA401II', N'32990000            ', N'29950000            ', N'Laptop ASUS Gaming ROG Zephyrus GA401II - Cấu hình mạnh mẽ trong thiết kế gọn gàng Không chỉ dừng lại ở các thế hệ laptop gaming đa dạng ở tầm trung, Asus còn cho ra mắt một thế hệ laptop cực kỳ mạnh mẽ đại diện cho phân khúc cao cấp. Laptop ASUS Gaming ROG Zephyrus GA401II là một trong những cái tên đáng được bạn cân nhắc trong quá trình sử dụng.', N'mt02.jpg                      ', N'Thiết kế đậm chất gaming, màn hình 14 inch Full HD 120Hz
Có thể nói mọi dòng laptop gaming của Asus đều được tái hiện vẻ ngoài cực kỳ mạnh mẽ tương đồng với cấu hình của máy bên trong.

Laptop ASUS Gaming ROG Zephyrus GA401II cũng mang đến một thiết kế ngoại hình cực kỳ bắt mắt nhưng cũng không kém phần nổi bật và sang trọng với bộ khung nguyên khối cùng phần viền được CNC bắt mắt.

Trọng lượng của chiếc điện thoại này cũng nằm ở mức khá nhẹ chỉ 1.73Kg cực kỳ gọn nhẹ và không quá nặng so với các chiếc laptop gaming khác.

Thiết kế đậm chất gaming, màn hình 14 inch Full HD 120Hz

Màn hình trên ASUS Gaming ROG Zephyrus thế hệ lần này được trang bị kích thước chuẩn đạt 14 inch đủ để người dùng có thể sử dụng mọi tác vụ một cách đầy đủ cũng như đa nhiệm tốt trong quá trình sử dụng.

Độ phân giải của màn hình cũng nằm ở mức cao lên đến Full HD cho khả năng hiển thị sắc nét dưới tấm nền IPS. Tần số quét của màn hình cũng nằm ở mức cao đạt 120Hz cho khả năng làm mới hình ảnh ở khung hình cao khá tốt khi chơi game hay xem phim.

Với màn hình này chiếc laptop ASUS Gaming ROG Zephyrus có thể sử dụng mọi tác vụ từ chơi game hay làm việc đồ họa cao cực kỳ dễ dàng.

AMD Ryzen 7 4800HS, RAM 16GB, 512GB SSD PCIe, GeForce GTX 1650 Ti
Đa số mọi người đều biết AMD là một trong những hãng chip cung cấp cho người dùng tốc độ xử lý cực kỳ mạnh mẽ với số nhân và luồng cao.

Đặc biệt Asus đã trang cho chiếc laptop này con chip AMD Ryzen 7 4800HS mang đến một hiệu năng cực kỳ mạnh mẽ với tốc độ lên đến 4.9GHz mang xử lý nhanh mọi tác vụ sử dụng.


Đặc biệt với bo mạch tốt nhất hàng đầu thế giới Asus đã tích hợp luôn bộ nhớ ram DDR4 với dung lượng lên đến 8GB bus 3200mhz và một thanh ram tương tự với khe cắm ngoài tổng cộng lên đến 16GB.

Với 16GB RAM bạn sẽ có thể thoải mái sử dụng thiết bị của mình cho hầu hết mọi quá trình từ chơi game hay sử dụng đồ họa cao một cách tốt nhất.

Bộ nhớ của chiếc laptop ASUS Gaming ROG Zephyrus có dung lượng lên đến 512GB SSD PCIe với chuẩn M2 tốc độ siêu cao. Đạt gần 2500Mb/s cho cả đọc và ghi khi truy xuất dữ liệu từ chiếc ổ cứng của bạn.

Asus cũng trang bị cho chiếc laptop Asus gaming của mình chiếc card đồ họa GeForce GTX 1650 Ti cho dung lượng nằm ở mức 4GB. Xuất mọi hình ảnh ở độ phân giải cao với tần số quét cực kỳ đẹp lên màn hình.

Pin 4Cell, 76WHr sạc nhanh, trang bị Wifi 6, bluetooth 5.0
Laptop ASUS Gaming ROG Zephyrus GA401II được trang bị viên pin 4 Cell 76WHr mang đến một khả năng sử dụng cực kỳ dài lên đến hơn 10 giờ liên tục kéo dài thời gian trải nghiệm laptop xuyên suốt.

Máy cũng được trang bị khả năng sạc nhanh cho khả năng sạc đầy thiết bị chỉ trong vòng 90 phút đưa chiếc laptop hoạt động trở lại ngay.

Pin 4Cell, 76WHr sạc nhanh, trang bị Wifi 6, bluetooth 5.0

Ngoài ra chuẩn kết nối internet của chiếc laptop này cũng được sử dụng loại mới nhất Wifi 6 cho khả năng sử dụng dual băng tần cực kỳ mạnh mẽ với tốc độ lên đến 10GBps tăng nhanh tốc độ mạng đáng kể.

Bluetooth cũng được trang bị chuẩn vẻ phiên bản 5.0 cho khả năng tương thích với hầu hết mọi thiết bị ngoại vi kết nối với laptop trên thị trường.

Nhiều cổng kết nối, bàn phím đa điểm siêu nhạy, Win 10 home
Hầu hết mọi chuẩn kết nối mới nổi bật nhất về công nghệ truyền tải đều được trang bị trên chiếc laptop gaming này gồm 1 cổng USB Type-C with DisplayPort 1.4, 1 cổng USB 3.2 Gen 2 Type-C và 2 cổng USB 3.2 Gen 1 Type-A, 1 cổng HDMI giúp bạn kết nối nhiều cổng hơn với tốc độ cao.

Nhiều cổng kết nối, bàn phím đa điểm siêu nhạy, Win 10 home

Bàn phím trên chiếc laptop này cũng có kích thước tiêu chuẩn với các phím bấm to vừa vặn có độ nhạy phản hồi cao. Người dùng có thể sử dụng bàn phím với tốc độ nhanh rất chính xác với đèn LED RGB siêu đẹp.

Asus cũng đã liên kết với Microsoft và trang bị sẵn trên chiếc laptop này hệ điều hành Win 10 home hoàn toàn miễn phí. Giúp bạn không phải tốn thêm tiền mua key bản quyền khi mua chiếc laptop cao cấp của Asus.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (16, N'Laptop ASUS ZenBook UX325EA', N'21990000            ', N'29950000            ', N'Laptop ASUS Gaming ROG Zephyrus GA401II - Cấu hình mạnh mẽ trong thiết kế gọn gàng Không chỉ dừng lại ở các thế hệ laptop gaming đa dạng ở tầm trung, Asus còn cho ra mắt một thế hệ laptop cực kỳ mạnh mẽ đại diện cho phân khúc cao cấp. Laptop ASUS Gaming ROG Zephyrus GA401II là một trong những cái tên đáng được bạn cân nhắc trong quá trình sử dụng.', N'mt03.jpg                      ', N'Trọng lượng chỉ 1.11kg, hoàn thiện từ nhôm nguyên khối
Vẫn là lối thiết kế đậm chất Asus khi tối ưu về trọng lượng và cả độ mỏng, cụ thể máy có kích thước chỉ 13.97 x 203.2 x 304.29 mm và trọng lượng chỉ 1.11kg. Do đó, người dùng dễ dàng mang máy đi đến khắp mọi nơi trên thế giới, thậm chí là bằng một tay từ phòng này sang phòng khác.

Ngoài ra, laptop ASUS ZenBook UX325EA được hoàn thiện chủ yếu đến từ chất liệu nhôm nguyên khối. Chất liệu này góp phần mang đến vẻ ngoài sang trọng, và hơn hết nó cho khả năng chống chịu tốt từ những va đập lực bên ngoài.

Bàn phím gõ êm, độ nảy tốt, touchpad tích hợp numpad ảo
Với những chiếc máy Asus hiện nay, khi bật nắp laptop thì bản lề sẽ tự động nâng lên để tạo cảm giác tốt hơn trong việc sử dụng bàn phím. Và với ASUS ZenBook 13 UX325EA thì bàn phím được nâng cao 3 độ. Cảm giác gõ phím mang lại êm ái, ít gây ra tiếng động, phù hợp khi bạn làm việc đêm khuya, không làm ảnh hưởng đến người khác.

Bàn phím gõ êm, độ nảy tốt, touchpad tích hợp numpad ảo

Về touchpad, được thiết kế rộng rãi dễ thao tác và di chuyển chuột. Đặc biệt phần touchpad này còn được tích hợp thêm phần numpad ảo hữu ích cho những người thích một chiếc laptop nhỏ gọn nhưng đầy đủ phím chức năng.

Màn hình 13.3 inches, độ phân giải FullHD, tấm nền IPS
ASUS ZenBook UX325EA mang đến cho người dùng trải nghiệm không gian chân thực nhất với khả năng tối ưu viền màn hình đạt đến 88% so với thân máy. Màn hình của Asus có kích thước 13.3 inches độ phân giải FullHD cùng tấm nền IPS cung cấp hình ảnh chi tiết, màu sắc trung thực cùng góc nhìn tốt.

Chưa dừng lại ở đó, về thông số màu, Asus ZenBook UX325EA đạt được 76,1% trên gam màu DCI-P3, thấp hơn 83,4% so với những chiếc laptop cao cấp nhưng trên mức so với những chiếc máy cùng phân khúc.

Hiệu năng Intel Core i5-1135G7, 8 GB RAM, 256 GB bộ nhớ trong
Laptop ASUS ZenBook UX325EA được trang bị bộ xử lý Intel Core i5-1135G7 và 8GB RAM. Đi kèm với đó là card đồ họa Intel Iris Xe mới nhất, nó hứa hẹn mang lại khả năng chơi nhiều tựa game 3D nặng mức setting cao. Ngoài ra, người dùng còn được cung cấp bởi ổ cứng 256GB SSD M.2 PCIE G3X2 cho khả năng xử lý dữ liệu nhanh chóng và mượt mà.

Thời lượng sử dụng đến 13 giờ, đầy đủ cổng kết nối
Mặc dù chiếc laptop ZenBook UX325EA có kích thước nhỏ gọn nhưng nó lại được cung cấp bởi viên pin dung lượng pin lên tới 67Wh. Trong bài thử nghiệm của LaptopMag, laptop đạt được 13 giờ 47 phút với các tác vụ lướt web liên tục với tùy chỉnh độ sáng 150 nits.

Được trang bị đầy đủ những cổng I / O, bao gồm cổng HDMI và cổng USB Type-A. ', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (17, N'Laptop Acer Nitro 5 AN515-55-5923', N'23990000            ', N'19590000            ', N'Acer Nitro 5 2020 - Laptop gaming bền bỉ, hiệu năng vượt trội Ngày nay, khi người dùng lựa chọn cho mình một chiếc laptop để sử dụng luôn quan tâm đến nhu cầu sử dụng vừa để làm việc vừa để giải trí chơi game. Vì vậy lựa chọn cho mình một chiếc laptop gaming là một giải pháp phù hợp cho mọi nhu cầu sử dụng của bạn. Acer Nitro 5 là chiếc laptop đến từ thương hiệu Acer sẽ mang đến một cách nhìn hoàn toàn mới về các nhu cầu sử dụng trên dòng laptop gaming có thể mang lại cho người dùng.', N'mt04.jpg                      ', N'Màn hình kích thước 15.6 inch Full HD, tần số quét 144Hz thời gian phản hồi 3ms
Acer đã trang bị cho laptop gaming Nitro 5 AN515-55 một màn hình có kích thước lớn lên đến 15.6 inch rất mỏng. Với kích thước màn hình lớn này người dùng có thể sử dụng đa nhiệm cùng lúc nhiều ứng dụng mà không bị giới hạn không gian hiển thị. Hơn thế chất lượng hiển thị của màn hình của chiếc laptop này cũng đạt độ phân giải cao Full HD cho mọi hình ảnh hiển thị sắc nét và trung thực đến từng chi tiết.

Trang bị chip Intel Core i5-10300H, RAM 8Gb, phù hợp với nhiều nhu cầu sử dụng
Acer Nitro 5 được Acer trang bị chip Intel Core i5-10300H với tốc độ xử lý cực nhanh với xung nhịp lên đến 4.5GHz. Với chip xử lý này chiếc laptop dễ dàng load nhanh chóng các tựa game và các ứng dụng nặng một cách nhanh chóng. Hơn thế, máy còn sở hữu bộ nhớ ram lên đến 8GB cho khả năng đa nhiệm cực tốt khi sử dụng nhiều ứng dụng cùng lúc. Bạn có thể dễ dàng nâng cấp bộ nhớ RAM của laptop lên đến tối đa 32GB khi có nhu cầu sử dụng cao hơn.

Trang bị SSD NVMe M.2 PCIe 512GB, NVIDIA GeForce GTX 1650Ti 4GB GDDR6
Nitro 5 2020 được hãng trang bị hỗ trợ chuẩn cổng kết nối có băng thông lớn là NVMe M.2 PCIe cho tốc độ đọc ghi ổn định ở mức 3500MB/s. Giúp khả năng truyền tải dữ liệu cực kỳ nhanh chóng khi đọc và ghi các file game hay truy xuất dữ liệu. Laptop sở hữu ổ cứng SSD NVMe M.2 PCIe có dung lượng lên đến 512GB phù hợp với nhiều nhu cầu sử dụng cần đến lưu lượng lớn để lưu trữ dữ liệu.

Trang bị SSD NVMe M.2 PCIe 512GB, NVIDIA GeForce GTX 1650Ti 4GB GDDR6

Hơn hế, laptop Acer Nitro 5 còn được hãng trang bị card đồ họa NVIDIA GeForce GTX 1650Ti 4GB GDDR6. Giúp xử lý hình ảnh ở độ phân giải cao người dùng có thể cài đặt max setting cấu hình độ phân giải trong game hay render các video có độ phân giải cao. Hơn thế, dòng card đồ hoạ 1650Ti này còn chuyên hỗ trợ tối đa cho mọi tựa game bom tấn hiện nay ở mức thiết lập từ thấp đến cao.

Nhiều chuẩn kết nối hiện đại, Webcam HD và Win 10 bản quyền
Được trang bị chuẩn Wifi 6 802.11AX mới nhất hiện nay cho tốc độ kết nối với băng thông cao. Và kèm chip Killer™ Ethernet E2600 giúp ổn định đường truyền internet ưu tiên băng thông trong suốt quá trình truyền tải chơi game. Hơn thế, laptop còn sở hữu nhiều các chuẩn kết nối khác như: Bluetooth 5.0, cổng mạng LAN, 3 cổng USB 3.2 Gen 1 và 1 jack âm thanh 3.5 mm. Cùng với cổng HDMI truyền tải hình ảnh độ phân giải cao và 1 cổng USB Type C tốc độ cao. Phù hợp với hầu hết các thiết bị ngoại vi như chuột, bàn phím, máy chiếu,...

Nhiều chuẩn kết nối hiện đại, Webcam HD và Win 10 bản quyền

Pin dung lượng cao 4 Cell 57 WHr, hệ thống tản nhiệt lớn với công nghệ Acer CoolBoost
Với hiệu năng cao như trên chiếc laptop Acer Nitro 5 chắc chắn sẽ cần tiêu thụ một lượng pin rất lớn để duy trì hoạt động. Nhưng Acer đã trang bị cho chiếc laptop này viên pin có dung lượng cao 4 Cell công suất lên đến 57WHr. Giúp laptop có thể hoạt động liên tục trên 6 tiếng một cách xuyên suốt và không bị ngắt quãng. Laptop gaming này cũng được trang bị khả năng sạc pin tốc độ cao giúp thiết bị đầy pin nhanh chóng trở lại.

Hệ thống tản nhiệt được xem là bộ phận rất quan trọng cho dòng laptop gaming để giải tỏa nhiệt lượng mà máy tỏa ra. Hệ thống tản nhiệt của máy gồm 2 quạt tản lớn thế hệ mới kết hợp công nghệ mới Acer CoolBoost cho khả năng tăng 10% tốc độ quay của quạt, giảm nhiệt độ của các linh kiện quan trọng như CPU/GPU xuống đến 9%. Hơn thế, laptop cũng được tích hợp phần mềm Nitro Sense tự động theo dõi nhiệt độ và điều chỉnh tốc độ quạt sao cho phù hợp và tản nhiệt tốt nhất.

Bàn phím trang bị đèn LED RGB, âm thanh tái tạo 3D kèm Acer True Harmony 6 chế độ
Một trong những sự cải tiến lớn nhất và tạo nên sự nổi bật nhất trên laptop Acer Nitro 5 đó chính là về bàn phím. Bàn phím trên máy được trang bị hệ thống dải đèn led RGB 4 vùng bạn có thể tùy chỉnh hiệu ứng chuyển đổi màu sắc yêu thích thông qua phần mềm Nitro Senser một cách dễ dàng.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (18, N'Samsung Galaxy Tab S7 Plus', N'23990000            ', N'16600000            ', N'Samsung Galaxy Tab S7 Plus : Màn hình rộng sắc nét, pin khủng 10.090mAh Máy tính bảng giờ đây đã trở thành một sản phẩm công nghệ quen thuộc và quan trọng đối với rất nhiều người. Ngày qua ngày, người dùng đều mong muốn nhu cầu sử dụng của họ sẽ tốt hơn và đòi hỏi cao hơn về một chiếc tablet Samsung. Thấu hiểu điều đó, tập đoàn Samsung đã cho ra mắt máy tính bảng Samsung Galaxy Tab S7 và Tab S7 Plus. Đây được xem là chiếc tablet được trang bị những tính năng hiện đại bậc nhất cùng thời lượng pin cực khủng, giúp giải quyết nỗi lo hụt pin cho cả ngày sử dụng.', N'mtb01.jpg                     ', N'Thiết kế cứng cáp và sang trọng cùng màn hình sAMOLED 12.4 inch
Chiếc Samsung Tab S7 Plus là sản phẩm rất được Samsung ưu ái, sở hữu thiết kế cứng cáp với chất liệu kim loại sáng bóng và các góc được bo cong một cách hoàn hảo. Mang đến cho sản phẩm không chỉ là sự cứng cáp, mà được hòa hợp tuyệt vời cùng những đường nét mềm mại.

Màn hình Amoled 12.4 inch và độ phân giải lên đến 2K+, không chỉ mang đến cho bạn một màn hình lớn dễ dàng quan sát và thao tác mà còn có chất lượng hiển thị rất rõ ràng, mọi chi tiết đều sắc nét, sống động, cho bạn những phút giây thưởng thức hình ảnh tốt nhất.

Trang bị cảm biến vân tay và bút S-Pen hiện đại và camera sau kép
Galaxy Tab S7 Plus được trang bị bảo mật cảm biến vân tay dưới màn hình, giúp bạn dễ dàng và nhanh chóng đăng nhập hơn, đồng thời cho khả năng bảo mật tốt hơn, người khác sẽ khó có thể mở được máy tính bảng của bạn nếu không dùng vân tay của bạn.

Không chỉ thế, máy tính bảng Samsung Galaxy Tab S7 Plus không thể thiếu S-Pen hiện đại giúp mọi thao tác luôn có độ nhạy tốt, bạn có thể mở tablet và ghi chú nhanh với bút S-Pen thay vì phải gõ sẽ chậm hơn rất nhiều. Ngoài ra, Tab S7+ còn có bộ đôi camera sau với độ phân giải 13MP và 5MP và camera trước 8MP nên hoàn toàn đủ khả ăng đáp ứng nhu cầu chụp ảnh có chất lượng tốt.

Trang bị chip Snapdragon 865+ mạnh mẽ và RAM 6GB, 128GB bộ nhớ trong
Samsung Tab S7 Plus được trang bị chip Snapdragon 865+ mới nhất hiện nay, vừa được Qualcomm cho ra mắt vào 9/7. Với bộ vi xử lí này, chắc hẳn Tab S7 Plus sẽ mang đến khả năng xử lí cực kì mạnh mẽ và nhanh chóng ngay cả khi xử lí đa nhiệm.

Ngoài ra, chiếc máy tính bảng này còn sở hữu RAM 6GB và bộ nhớ trong 128GB cho phép hỗ trợ vi xử lí hoạt động hiệu quả và năng suất hơn, đồng thời bộ nhớ trong 128GB sẽ mở ra khả năng lưu trữ cực lớn cho người dùng, hình ảnh, video hay các ghi chú, ứng dụng lớn đều không thành vấn đề.

Dung lượng pin lên đến 10.000 mAh cùng công nghệ sạc nhanh 45W

Ngoài ra, sở hữu công nghệ sạc nhanh 45W giúp Samsung Tab S7 Plus có thể sạc đầy chỉ với thời gian ngắn, tiết kiệm thời gian để bạn có thể nhanh chóng tiếp tục sử dụng và giải quyết công việc.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (19, N'iPad 10.2 2020 WiFi 32GB', N'9990000             ', N'8500000             ', N'iPad Gen 8 10.2 inch 2020 - Hiệu năng mạnh mẽ nhờ chip Apple A12 Bionic iPad đang là một trong những thương hiệu tablet hàng đầu trên thị trường, nhờ uy tín và cam kết chất lượng sản phẩm mà tập đoàn Apple mang lại cho khách hàng của mình trên toàn cầu. Nếu bạn mong muốn có được một chiếc iPad cho bạn trải nghiệm sử dụng thú vị, với vi xử lí mạnh mẽ và sự hỗ trợ đắc lực từ Apple Pencil, cùng mức giá chưa đến 10 triệu đồng thì iPad Gen 8 vừa được ra mắt trong năm nay chính là một gợi ý ấn tượng với bạn và phù hợp cho bạn.', N'mtb02.jpg                     ', N'Thiết kế nhôm nguyên khối quen thuộc và màn hình Retina 10.2 inch
Apple iPad 10.2 thế hệ 2020 vẫn sở hữu thiết kế quen thuộc, không có nhiều khác biệt với những chiếc iPad thế hệ trước. Được làm từ chất liệu nhôm nguyên khối và thiết kế gọn nhẹ, các góc cạnh bo cong mang đến vẻ đẹp tinh tế cho iPad.

Ngoài ra, iPad Gen 8 2020 vẫn được trang bị nút Home với cảm biến vân tay Touch ID giúp bạn dễ dàng sử dụng, cùng với khả năng bảo mật tốt cho iPad của mình.

Máy được trang bị màn hình Retina HD lên đến 10.2 inch cùng tấm nền IPS LCD, sự trang bị này giúp người dùng có được khoảng thời gian sử dụng thoải mái với iPad nhờ hình ảnh luôn rõ nét.

Hỗ trợ bàn phím và Apple Pencil giúp làm việc tiện lợi hơn
Không giống với thế hệ iPad trước chiếc iPad 10.2 inch 2020 này được hỗ trợ bàn phím, sẵn sàng trở thành một chiếc laptop mini bất cứ lúc nào để bạn giải quyết công việc nhanh chóng và tiện lợi.

Ngoài ra, iPad Gen 8 còn có Apple Pencil với công nghệ hiện đại, bạn có thể ghi chú nhanh chóng, phác thảo bản vẽ nhanh chóng với độ mượt cực tốt, cho cảm giác như thao tác trên giấy thật.

Trang bị chip Apple A12 Bionic mang đến cấu hình mạnh mẽ
Điểm tạo nên sức mạnh cho iPad 10.2 inch 2020 chính là chip độc quyền của Apple - A12 Bionic. Nhờ có bộ vi xử lí này mà thiết bị hoàn toàn đủ khả năng cân các loại game hay ứng dụng nặng.

Trang bị chip Apple A12 Bionic mang đến cấu hình mạnh mẽ

Một trong những thứ hỗ trợ đắc lực cho chip A12 Bionic chính là dung lượng ROM của iPad 8 lên đến 32GB, nhờ đó iPad có thể xử lí đa nhiệm mượt mà, tình trạng iPad bị chậm khi dung các ứng dụng nặng cũng sẽ không có.

Camera sau 8MP cho hình ảnh sắc nét và dung lượng pin sử dụng lên đến 10 giờ
Đối với một chiếc tablet, thường thì camera không phải là phần được chú trọng quá nhiều, nhưng với Apple iPad 10.2 inch 2020 Wifi thì camera đảm bảo khả năng chụp ảnh và quay video cũng như videocall với hình ảnh sắc nét và sống động.

Ngoài ra, iPad Gen 8 Wifi có dung lượng pin cao, đáp ứng thời gian sử dụng lên đến 10 giờ liên tục. Nếu bạn không sử dụng iPad thường xuyên mà chỉ dung khoảng 3 giờ một ngày thì bạn có thể dùng iPad gần 3 ngày.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (20, N'iPad Air 10.9 2020 WiFi 64GB', N'16990000            ', N'14900000            ', N' iPad Air 4 2020 – Chip A14 mạnh mẽ cho trải nghiệm hoàn hảo Apple luôn khiến cho cộng đồng công nghệ đứng ngồi không yên mỗi khi cho giới thiệu sản phẩm mới. iPad Air 4 được ra mắt tại sự kiện mà các tín đồ công nghệ nghĩ rằng Apple sẽ trình làng dòng điện thoại iPhone 12 2020, nhưng chiếc tablet này mới chính là nhân vật chính. iPad Air thế hệ 2020 mang những thay đổi về mặt thiết kế cũng như những tính năng mới được tích hợp để tối ưu hóa về hiệu năng, mang đến cho người dùng những trải nghiệm tốt hơn. ', N'mtb03.jpg                     ', N'Thiết kế tinh tế, màu sắc thời thượng với độ mỏng 6.1mm
Máy tính bảng iPad Air 2020 sẽ có thiết kế hoàn toàn mới với kiểu dáng tương tự với iPad Pro 2020 nhưng với kích thước nhỏ gọn hơn 247.6 x 178.5 mm và độ mỏng chỉ 6.1 mm cùng trọng lượng chưa đến 500g giúp bạn dễ dàng mang theo iPad để sử dụng ở bất cứ đâu.

Màn hình có tần số quét 60Hz, tấm nền IPS LCD và kích thước 10.9 inch
Để mang đến không gian hiển thị tuyệt vời cho người dùng, Apple đã trang bị màn hình có tần số quét đến 60Hz cho iPad Air 4, giúp hình ảnh hiển thị mượt mà, các chuyển động hình ảnh trơn tru cũng như hạn chế tình trạng giật lag. Nhờ vậy bạn có thể tận hưởng những thước phim ấn tượng, chơi game (đặc biệt là những game có góc nhìn thứ nhất) một cách tuyệt vời nhất. Độ phân giải 2360 x 1640 pixels cho hình ảnh sắc nét và chân thực.

Chip A14 kết hợp RAM 6GB cho sức mạnh ấn tượng và bộ nhớ 128GB lưu trữ rộng rãi
Sức mạnh của máy đến từ con chip A14 Bionic để mang đến tốc độ xử lý vượt trội hơn, nhanh chóng hơn cùng với RAM 6GB cho sức mạnh không thua gì một chiếc PC. Bên cạnh đó còn có thông tin iPad Air 2020 sẽ có bàn phím Magic Keyboard riêng để có thể giúp bạn biến chiếc máy tính bảng của mình thành một chiếc laptop một cách nhanh chóng và đơn giản.

Hệ thống camera với cảm biến LiDAR hỗ trợ quay phim chất lượng 4K siêu nét
Một trong những sự cải tiến mới của iPad Air 4 chính là hệ thống camera với camera chính góc rộng 12MP cùng với cảm biến chiều sâu TOF 3D LiDAR hỗ trợ quay phim với chất lượng 4K cho hình ảnh cực kỳ sắc nét và sinh động. Bên cạnh đó, iPad cũng được hỗ trợ những tính năng chụp ảnh thông minh như xóa phông, lấy nét tự động,…cho ảnh chụp không thua kém bất kỳ thiết bị nào.

Camera trước có cảm biến 7MP và hỗ trợ quay phim 1080p, hỗ trợ video call chất lượng cao mang đến những trải nghiệm tuyệt vời cho người dùng. Bạn có thể sử dụng iPad để quay lại vlog hằng ngày thay cho một chiếc máy quay, máy ảnh và chia sẻ ngay với bạn bè, người thân,…vô cùng tiện lợi.

Dung lượng pin lớn cho 10 giờ lướt web
Apple cũng đã nâng cấp dung lượng pin cho iPad Air 4 với dung lượng lớn, cho 10 giờ lướt web bằng wifi, 9 giờ sử dụng mạng di động. Mặc dù dung lượng trước đây của những thế hệ iPad trước cũng đã đáp ứng rất tốt về thời lượng sử dụng chính vì thế sự nâng cấp này chắc chắn sẽ giúp người dùng càng yên tâm hơn khi sử dụng thiết bị suốt cả ngày dài mà không lo hết pin.

Tính năng FaceID bảo mật cao, hỗ trợ đầy đủ các kết nối không dây và hỗ trợ kết nối 3G/4G

Máy cũng hỗ trợ đầy đủ các kết nối như kết nối WiFi giúp bạn truy cập vào mạng Internet nhanh chóng. Ngoài ra còn có phiên bản iPad hỗ trợ 3G/4G (có khe lắp thẻ SIM) để bạn có thể luôn trực tuyến dù ở bất cứ đâu, không bỏ lỡ bất cứ thông báo, tin nhắn nào.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (21, N'Samsung Galaxy Tab S7', N'18990000            ', N'14800000            ', N'Samsung Tab S7 – Chiếc tablet cao cấp hỗ trợ S Pen, cấu hình mạnh mẽ Hiếm thấy một hãng sản xuất nào vẫn cho duy trì cho ra đời những chiếc tablet mà vẫn chạy trên hệ điều hành Android như nhà sản xuất Samsung. Cũng khoảng gần một năm từ khi chiếc Galaxy Tab S6 được trình làng, và mới đây nhất là chiếc Galaxy Tab S6 Lite, nghe qua là đã biết phiên bản rút gọn của người đàn anh. Song thật bất ngờ, chúng ta lại tiếp tục được chứng kiến sự ra mắt của máy tính bảng Samsung Galaxy Tab S7.', N'mtb04.jpg                     ', N'Màn hình 11 inch, tấm nền TFT, hoàn thiện từ nhôm cứng cáp
Galaxy Tab S7 sở hữu màn hình 11 inch cùng với tấm nền TFT và độ phân giải lên đến 2560 x 1600 pixel. Tất cả đem đến cho chiếc Tab S7 cho khả năng hiển thị tốt, từ đó mà người dùng có thể sử dụng nó trong nhiều trường hợp khác như công việc, giải trí (xem phim, nghe nhạc, chơi game,…) đến làm việc đồ họa.

Màn hình 11 inch, tấm nền OLED

Bên cạnh màn hình sắc nét, Samsung cũng không quên tối ưu về thiết kế cho sản phẩm của mình. Chiếc máy không to hơn sản phẩm kế nhiệm là bao nhiêu với thiết kế gần như không viền. Hoàn thiện chủ yếu từ nhôm giúp cho chiếc máy trở nên cứng cáp hơn bao giờ hết.

Hiệu năng xử lý mượt mà với Snapdragon 865, 8GB RAM, 256GB bộ nhớ trong

Cùng với đó, Samsung Tab S7 được cài sẵn hệ điều hành Android 10 cùng 6 GB RAM, 128GB bộ nhớ trong, gấp đôi so với người tiền nhiệm giúp các ứng dụng hoạt động mượt mà hơn, đa nhiệm khỏi phải bàn cãi và khả năng lưu trữ tốt đáp ứng cho mọi công việc.

Camera trước 8MP cùng hệ thống camera kép phía sau cho chất lượng ảnh sắc nét
Điểm nổi bật của chiếc tablet này đến từ camera kép, trong bối cảnh những chiếc tablet còn lại trên thị trường chỉ sử dụng camera đơn. Cụm camera kép 13MP và 5MP ở phía sau với ống kính góc rộng và siêu rộng, cho góc chụp lên tới 123 độ. Từ đó, đáp ứng tốt nhu cầu làm việc và giải trí, chụp ảnh nhóm với bạn bè.

Camera trước 8MP cùng hệ thống camera kép phía sau cho chất lượng ảnh sắc nét

Ngoài ra, camera trước cũng là điểm đáng chú ý, khi được trang bị độ phân giải 8MP, khẩu độ f/2.0 với góc chụp 80˚ cho khả năng chụp selfie ấn tượng. Kết hợp với AI thông minh giúp tối ưu hóa tông màu cho ra những bức ảnh chụp nâng lên tầm cao mới. Cùng với ứng dụng Adobe Premiere Rush, việc chỉnh sửa ảnh, video chất lượng chưa bao giờ đơn giản đến vậy.

Âm thanh vòm Dolby Atmos trong trẻo, hỗ trợ bút Spen
Bên cạnh một hiệu năng tốt cho nhu cầu công việc thì máy tính bảng Samsung Galaxy Tab S7 còn mang lại khả năng giải trí cao với công nghệ âm thanh vòm Dolby Atmos. Nếu sử dụng âm thanh vòm cho những bộ phim hay chơi game hành động, chắc chắn bạn sẽ thấy một sự thay đổi rất rõ.

Viên pin lên đến 8000 mAh, sạc nhanh 45W
Galaxy Tab S7 được hãng trang bị viên pin có dung lượng tới 8000 mAh. Với dung lượng này, Tab S7 cho thời gian sử dụng khá ấn tượng hơn 15 giờ xem phim. Bên cạnh đó, máy còn được trang bị sạc nhanh thông qua cổng USB-C hoặc đế sạc GordO. Nhờ đó, người dùng có thể thoải mái sử dụng mà không cần lo lắng về việc hết pin giữa chừng.

Điểm nổi bật trên chiếc máy này là tích hợp máy quét vân tay giúp mở khóa nhanh chóng cùng khả năng bảo mật tối đa. Không cần mật khẩu, chỉ với một lần chạm ngón tay là bạn có thể mở được khóa ngay lập tức.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (22, N'Tai nghe Bluetooth Apple AirPods 2 VN/A', N'3990000             ', N'3400000             ', N'Tai nghe Apple AirPods 2 – Thiết kế tối giản, chất lượng âm thanh tuyệt vời Vừa qua, Apple đã chính thức cho ra mắt chiếc tai nghe Airpods 2. Thế hệ thứ 2 lần này không có nhiều sự khác biệt so với thế hệ đầu về ngoại hình, trừ một số chi tiết về đèn báo hiệu cũng như ra mắt thêm phiên bản sạc không dây và sạc thường (sạc có dây). Ngoài ra, bạn có thể tham khảo thêm Apple Airpods Pro, sắp được ra mắt trong thời gian tới.', N'pk01.jpg                      ', N'Thiết kế nhỏ gọn, bắt mắt
Về cơ bản tai nghe không dây Apple AirPods 2 vẫn sở hữu thiết kế thời trang và nhỏ gọn, trọng lượng 4g cũng rất nhẹ không khác mấy so với tai nghe AirPods thế hệ đầu tiên. Nó cũng vẫn giữ nguyên thiết kế với màu trắng đặc trưng cho các dòng tai nghe. Đây là tai nghe wireless 100% và có khả năng tích hợp với mọi thiết bị Apple khác nhau nên bạn có thể linh hoạt sử dụng.

Tai nghe AirPods 2 vẫn giữ thiết kế nhỏ gọn, bắt mắt của từ Airpods 1

Thêm vào đó, chúng còn được phủ lên thêm một lớp chất liệu mới ở đầu mỗi tai nghe để giúp tai nghe được bám hơn trên tai người đeo, tương tự như lớp phủ mặt kính mờ trên mặt lưng của chiếc Pixel 3 mà Google đã trang bị cho chiếc điện thoại của mình.

Chip H1 cho khả năng kết nối nhanh hơn, mở Siri bằng giọng nói
Tai nghe Apple AirPods 2 trang bị chip H1 được hy vọng sẽ giúp kết nối ổn định hơn, mượt mà hơn thế hệ tiền nhiệm, cho người dùng nhiều trải nghiệm tốt hơn. Do đó, thay vì sử dụng chip W1 như các thế hệ sản phẩm cũ thì thế hệ mới 2019 lại được thêm vào chip H1 mạnh mẽ giúp giảm thiểu thời gian chuyển đổi giữa hai thiết bị và gia tăng thời gian đàm thoại lên đến 5 giờ liên tục.

Chip H1 cho khả năng kết nối nhanh hơn

Trước đây, người dùng phải chạm hai lần vào tai nghe để kích hoạt trợ lý ảo Siri thì bây giờ tai nghe Airpods 2 đã có sự cải tiến khi bạn chỉ cần thu âm giọng nói là có thể mở Siri chờ lệnh ngay. Tính năng này giúp bạn có thể dễ dàng điều chỉnh tai nghe mà không cần thao tác quá nhiều. Điều này cho phép người dùng có thể tương tác với Siri khi iPhone để trong túi quần.

mở Siri bằng giọng nói

Tính năng chống ồn vượt trội
Một trong những tính năng được Apple nâng cấp trên Airpods 2 chính là khả năng chống ồn. Theo báo cáo từ công ty phân tích Barclays, tai nghe AirPods có khả năng chống ồn, xử lý âm thanh bên ngoài tốt hơn so với tai nghe AirPods đời đầu với khả năng chống ồn còn hạn chế. Bên cạnh đó, tai nghe AirPods 2 có thể sẽ được Apple sử dụng công nghệ chống ồn vật lý, khác với chống ồn điện từ như những tai nghe headphone. Với khả năng chống ồn tốt hơn này, tai nghe AirPods hứa hẹn sẽ cho ra chất âm tuyệt vời và cải thiện khoảng cách kết nối giữa các thiết bị.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (23, N'Tai nghe Bluetooth Apple AirPods Pro VN/A', N'7990000             ', N'5300000             ', N'giảm lên đến 500.000 ₫  Airpods Pro – Tai nghe bluetooth với chất âm rõ cùng khả năng chống nước IPX4 Mẫu AirPods xuất hiện lần đầu vào năm 2016, sau nhiều nâng cấp về thiết kế vào cấu hình, mẫu tai nghe không dây ngày càng được hoàn thiện. Mới đây, Apple đã công bố mẫu tai nghe AirPods mới nhất – tai nghe bluetooth Apple Airpods Pro – với thiết kế mới cùng nhiều tính năng mới.', N'pk02.jpg                      ', N'Airpods Pro sở hữu thiết kế nhỏ gọn, trọng lượng 5.4 gram
Những thiết kế của Apple ngày càng hướng đến người dùng hơn khi chiếc tai nghe Airpods Pro mới nhất khá nhỏ gọn, trọng lượng chỉ 5.4g và 45,6 gram cả hộp. Sự nâng cấp đầu tiên phải kể đến đó là Airpods Pro được thiết kế như một tai nghe in-ear thay vì earbud toàn khung nhựa 100% như ở các phiên bản cũ. Cùng với 3 mút silicon mềm giúp Airpods Pro không chỉ giúp tai nghe trở nên sang trọng hơn và còn giúp tai nghe bám chắc vào tai, khả năng cách âm tốt cũng như phù hợp với nhiều kích thước tai khác nhau.

Không chỉ nhỏ gọn, phù hợp với nhiều khuôn tai mà Apple Airpods Pro còn sở hữu lõi thông khí giúp giảm thiểu áp lực lên tai, không đau tai khi đeo trong thời gian dài. Bên cạnh đó Airpods Pro còn sở hữu tiêu chuẩn chống nước và bụi bẩn IPX4. Như vậy Apple đã mang đến một tai nghe không dây không chỉ sử dụng thoải mái trong thời gian dài mà còn có thể sử dụng trong nhiều điều kiện môi trường khác nhau.

Âm thanh trên Apple Airpods Pro rõ nét với công nghệ khử tiếng ồn chủ động
Tai nghe AirPods Pro sở hữu nhiều công nghệ âm thanh mang đến chất lượng nghe - gọi tốt.

Một tính năng thông minh của Airpods Pro đó chỉnh là sử chuyển đổi giữa chế độ khử tiếng ồn chủ động và chế độ trong suốt. Với những lúc bạn có nhu cầu nghe cả những âm thanh đang xảy ra xung quanh. Việc đơn giản bạn cần làm là nhấn giữ cảm biến lực trên thân tai nghe để chuyển đổi giữa hai chế độ. Với chế độ trong suốt, bạn có thể nghe được cùng lúc âm thanh bên trong cũng như âm thanh bên ngoài, thoải mái nói chuyện với mọi người xung quanh.

Một micrô hướng vào bên trong giúp lắng nghe những âm thanh bên trong

Công nghệ Adaptive EQ cùng chip H1 giúp tùy chỉnh âm thanh
Bên cạnh tính năng chống ồn chủ động, Airpods Pro còn công nghệ Adaptive EQ cho khả năng tận hưởng âm nhạc tốt hơn. Công nghệ Adaptive EQ giúp điều chỉnh âm nhạc theo hình dạng tai nghe của từng người. Tai nghe cho âm trầm mạnh, cùng với đó là trình điều khiển loa cho phép tùy chỉnh độ méo cao và thấp khác nhau.

Ngoài ra, Apple AirPods Pro còn bộ khuếch đại cấp nguồn kết hợp với chip H1 giúp loại bỏ nền nhiễu, kiểm soát mức độ nghe. Bộ khuếch đại dải động giúp tạo ra âm thanh thuần khiết, rõ ràng cùng khả năng kéo dài tuổi thọ pin. Hơn thế nữa, tai nghe bluetooth AirPods Pro còn sở hữu cổng micro lưới mở rộng giúp cải thiện độ rõ của cuộc gọi, âm thanh trong các tình huống gió.

Dung lượng pin lớn lên đến 5 giờ sử dụng

Cảm biến lực giúp kiểm soát trên tai nghe cùng nhiều tính năng nâng cao: Siri, Ar
Tai nghe bluetooth Airpods Pro với cảm biến lực giúp kiểm soát ngay trên tai nghe. Cụ thể, bạn cần nhấn 1 lần để phát, tạm dừng hoặc trả lời cuộc gọi điện thoại. Nhấn 2, 3 lần để bỏ qua, nhấn và giữ để chuyển giữa chế độ khử tiếng ồn chủ động và chế độ trong suốt.

Tai nghe Apple Airpods Pro vẫn sở hữu tính năng kết nối với iPhone hoặc Apple Watch như các mẫu tai nghe Airpods khác, kết nối bluetooth 5.0.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (24, N'Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA', N'890000              ', N'550000              ', N'Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA chính hãng tiết kiệm tối đa thời gian sạc điện thoại Nhanh chóng, tiết kiệm tối đa thời gian là những gì mà người dùng iPhone mong đợi ở chiếc sạc pin của mình. Để có thể làm được điều đó thì việc sử dụng củ sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA chính hãng là điều cần thiết mà bạn không nên bỏ qua.', N'pk03.jpg                      ', N'Thiết kế nhỏ gọn, an toàn dòng điện
Củ sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA chính hãng được thiết kế siêu nhỏ gọn, tinh tế giúp bạn có thể mang đến bất cứ nơi đâu. Chất liệu cao cấp cùng màu trắng nổi bật mang đến sự sang trọng và độ bền bỉ cùng với thời gian.

Củ sạc còn có khả năng bảo vệ sản phẩm tránh quá dòng, quá điện áp hay hiện tượng mạch điện bị chập và quá nhiệt trong quá trình sạc. Sản phẩm được kiểm định khắt khe và được cấp chứng chỉ an toàn cháy nổ: ROSH, CE, FCC giúp đảm đảm an toàn cho người sử dụng.

Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA Chính hãng

Công suất sạc nhanh, vô cùng tiện ích
Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA chính hãng có công suất lên đến 20W. Công nghệ sạc nhanh Power Delivery (PD) này giúp người dùng có thể tiết kiệm được nhiều thời gian dành cho việc chờ đợi pin đầy.

Ngoài ra, sạc còn được trang bị cổng Type-C mang đến sự thuận tiện khi sử dụng. Công nghệ Power Delivery (PD) có thể sạc trên các thiết bị như iPhone 12, iPhone 12 Mini, iPhone 12 Pro, iPhone 12 Pro max hay các dòng điện thoại iPhone 11 Series,…', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (25, N'Camera hành trình Gopro Hero 9', N'11990000            ', N'10590000            ', N'Camera hành trình Gopro Hero 9 - Ghi lại những hình ảnh tuyệt vời nhất Camera hành trình luôn là những thiết bị không thể thiết đối với mỗi người dùng thích du lịch khám phá. Gopro Hero 9 là một trong những sản phẩm tuyệt vời nhất năm 2020 với độ phân giải quay cũng như trang bị nhiều công nghệ hình ảnh sắc nét, ổn định nhất khi quay.', N'pk04.jpg                      ', N'Nhỏ gọn chất liệu cao cấp, khung chắc chắn khi gắn gimbal
Với thiết kế nhỏ gọn mà Gopro Hero 9 mang lại phiên bản lần này cũng có kích thước tương tự như phiên bản trước và được tối giản nhỏ gọn với các đường nét tinh tế hơn.

Bộ khung vỏ trong của Gopro Hero 9 được làm thực kim loại thép không gỉ cố định các linh kiện bên trong và có một trục giá đỡ nằm ở mặt dưới của Gopro Hero 9.

Ống kính góc rộng quay lên đến 5K, chống rung HyperSmooth 3.0
Camera Gopro Hero 9 là một sản phẩm mang lại chất lượng hình ảnh khá tốt với độ phân giải lên đến 5K trên khung hình 30fps cho nhu cầu chụp ảnh và quay video với khung hình lớn. 

Bạn có thể dễ dàng chụp những bức ảnh yêu thích của mình lên độ phân giải cao nhất với Super Photo và quay video 4K với khung hình đạt 60fps và 1080P 240fps siêu sắc nét và chuyện động nhanh mọi khung hình.

Ống kính góc rộng quay lên đến 4K

Với ống kính góc rộng mà Gopro Hero 9 mang đến bạn cũng có thể selfie với góc rộng và quay video với góc rộng hơn bắt hết toàn bộ khung hình.

Có thể nói hệ thống chống rung HyperSmooth 3.0 trên Gopro Hero 9 mang đến một khả năng chống rung rất tuyệt vời cho mọi nhu cầu sử dụng.

Với việc tương thích và đồng bộ với hệ thống camera được xử lý qua con chip tốc độ cao. Hệ thống chống rung này và camera hoạt động liên tục mang đến những khung hình chất lượng nhất đến cho người dùng.

Màn hình trước tiện lợi, pin dung lượng lớn, chống nước 10m
Hãng đã tinh tế khi nắm bắt nhu cầu cũng như phản hồi của người dùng và bổ sung thêm một màn hình selfie ở mặt trước. Người dùng có thể theo dõi camera một cách dễ dàng từ phía trước để điều khiển.

Ngoài ra Gopro Hero 9 còn giúp người dùng trải nghiệm khả năng livestream một cách dễ dàng với độ phân giải cao lên đến 1080P cực kỳ sắc nét.

Dung lượng pin trên Hero 9 cũng nằm ở mức khá lớn, tăng 40% so với Gopro 8 cho khả năng hoạt động xuyên suốt cả ngày dài mà không hết pin. Ngoài ra pin trên Gopro Hero 9 cũng có thể tháo rời và thay một cách dễ dàng.

Điểm đặc biệt trên chiếc Gopro Hero 9 đó là được trang bị khả năng chống nước lên đến 30m. Bạn có thể thoải mái sử dụng Gopro 9 khi tắm biển hay hồ bơi, đi ngoài mưa mà không lo bị hư hỏng camera hành trình.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (26, N'Surface Laptop Go Core i5', N'23990000            ', N'19490000            ', N'Surface Laptop Go – Laptop nhỏ gọn cho người dùng Hiện nay các dòng laptop mỏng nhẹ ngày càng được ưu chuộng bởi sự tiện lợi khi di chuyển. Với dòng laptop Surface thì Surface Laptop Go là một trong những đại diện cho dòng laptop nhỏ gọn, hiệu năng cao.', N'mt05.jpg                      ', N'Thiết kế siêu nhẹ, sang trọng
Surface Laptop Go sở hữu thiết kế gọn gàng với trọng lượng chỉ hơn 1kg. Với trọng lượng này, laptop có tính di động cao. Về vẻ bên ngoài, laptop được hoàn thiện từ vật liệu cao cấp mang để một vẻ đẹp sang trọng. Mặt lưng là logo windows nổi bật.

Thiết kế siêu nhẹ, sang trọng

Màn hình 12.4 inch nhỏ gọn, hỗ trợ cảm ứng
Điểm nổi bật của Surface Laptop Go là máy được trang bị màn hình 12.4 inch. Màn hình với độ phân giải 1536 x 1024 pixels cùng công nghệ màn hình PixelSense mang đến chi tiết hiển thị cao, màu sắc sống động.

Màn hình 12.4 inch nhỏ gọn, hỗ trợ cảm ứng

Màn hình này cũng hỗ trợ cảm ứng cho các thao tác xử lý nhanh chóng mà không cần chuột. Ngoài ra, tuy sở hữu màn hình kích thước nhỏ nhưng Surface Laptop Go vẫn hỗ trợ camera giúp người dùng gọi điện video với chất lượng hình ảnh HD.

Hiệu năng mượt mà với chip Intel Core i5 thế hệ 10, bảo mật vân tay
Về cấu hình, máy được trang bị con chip thế hệ 10 Intel 1035G1 cùng card đồ họa Onboard. Bên cạnh đó là RAM 8GB, ổ cứng SSD 128GB mang đến tốc độ xử lý nhanh cùng đa nhiệm mượt mà.

Hiệu năng mượt mà với chip Intel Core i5 thế hệ 10, bảo mật vân tay

Laptop được trang bị công nghệ bảo mật vân tay an toàn. Với tính năng này, người dùng có thể mở khóa nhanh chóng chỉ qua một lần nhấp. Ngoài ra người dùng còn có thể chựa chọn phương pháp đăng nhập thông qua Windows Hello. Về trải nghiệm giải trí với công nghệ âm thanh Dolby Audio mang đến âm thanh Omnisonic đắm chìm.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (28, N'Samsung Galaxy Z Fold2 5G', N'50000000            ', N'47500000            ', N'Điện thoại Samsung Galaxy Z Fold 2 5G – Phiên bản mùa hè Samsung Z Fold 2 là dòng điện thoại cao cấp của Samsung. Ngoài phiên bản màu xuân độc đáo thì mới đây hãng cho cho ra mắt Z Fold 2 phiên bản mùa hè đặc biệt với số lượng có hạn.', N'dt11.jpg                      ', N'Thiết kế sang trọng, độc đáo
Galaxy Z Fold 2 5G phiên bản Summer 2021 với màu sắc mới độc đáo hơn khiến người dùng nghĩ ngay đến mùa hè đầy tươi mát. Vỏ hộp cũng được thiết kế họa tiết mùa hè đầy sang trọng.

Samsung Galaxy Z Fold2 5G - Phiên bản mùa hè

Hỗ trợ 5G, cấu hình vượt trội
Galaxy Z Fold 2 mùa hè vẫn sẽ được hỗ trợ công nghệ mạng 5G mới nhất mang lại tốc độ lướt web nhanh vượt trội.

Ngoài ra, máy vẫn với thiết thế 2 màn hình. Trong đó màn hình chính kích thước lớn 7,6 inch cùng màn hình phụ 6,23 inch với khả năng biến đổi linh hoạt. Bản lề trên máy cũng chắc chắn và bền bỉ, đảm bảo có thể sử dụng thoải mái mà không lo hư hỏng.

Hỗ trợ 5G, cấu hình vượt trội

Về cấu hình, máy được trang bị cấu hình tương tự với phiên bản thông thường. Cụ thể Samsung Galaxy Z Fold 2 sẽ chạy trên con chip Snapdragon 865+ cùng dung lượng RAM 12 GB. Máy cũng được trang bị cụm camera với độ phân giải 12MP hỗ trợ góc chụp siêu rộng.

Hỗ trợ 5G, cấu hình vượt trội

Galaxy Z Fold2 Summer 2021 được trang bị viên pin 4.500 mAh hỗ trợ sạc nhanh 25W mang lại thời gian sử dụng lâu dài.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (29, N'Apple MacBook Pro 13 Touch Bar M1 512GB 2020', N'41990000            ', N'35900000            ', N'MacBook Pro 13 Touch Bar M1 512GB 2020 mạnh mẽ, ấn tượng MacBook Pro 13 Touch Bar M1 512GB 2020 chiếc laptop được người dùng đặc biệt là những tín đồ công nghệ yêu thích và sử dụng. Với thiết kế sang trọng, cấu hình cực khủng mang đến cho người dùng những trải nghiệm vô cùng độc đáo khi làm việc, lướt web hoặc chơi game,...', N'mt06.jpg                      ', N'Bộ nhớ 512GB, chip Apple M1 cực mạnh mẽ
Macbook Pro M1 2020 13 inch Touch Bar 512GB được trang bị bộ nhớ cực khủng 512GB. Chúng không chỉ mang đến một không gian lớn để lưu trữ tài liệu mà còn kết hợp với chip M1 giúp cải thiện đáng kể hiệu suất cũng như kiểm soát việc sử dụng năng lượng hiệu quả.

Bộ nhớ 512GB, chip Apple M1 cực mạnh mẽ

RAM 8GB cùng với Card đồ họa GPU 8-core giúp máy xử lý nhanh chóng và mượt mà các tác vụ hằng ngày trong công việc, sử dụng các phần mềm chuyên dụng, lướt web, nghe nhạc, xem phim hay là chơi game giải trí.

Màn hình Retina, bàn phím Magic Keyboard
MacBook Pro 13 Touch Bar M1 512GB 2020 sở hữu màn hình Retina có độ phân giải 2560 x 1600 pixel mang đến hình ảnh chất lượng vượt trội. Bạn có thể tận dụng tối đa bộ xử lý tín hiệu hình ảnh mới nhất ngay cả khi sử dụng camera FaceTime trên thiết bị.

Màn hình Retina, bàn phím Magic Keyboard

Bàn phím thiết kế kiểu Magic Keyboard" dựa trên cơ chế phím cắt kéo có hành trình phím ngắn hơn, chỉ 1mm hạn chế tiếng ồn khi gõ phím. Touch ID được thiết kế tách rời, phím ESC vật lý, không còn bấm cảm ứng trên Touch Bar như các phiên bản trước.

Pin cực khủng, cổng kết nối Thunderbolt
MacBook Pro 13 Touch Bar M1 512GB 2020 được trang bị pin cực khủng với thời lượng lên tới 20 giờ. Đây là mức pin cao nhất trong tất cả các sản phẩm Macbook từ trước đến nay.

Pin cực khủng, cổng kết nối Thunderbolt

Ngoài ra, máy có thể kết nối đa dạng thông qua cổng Thunderbolt 3 với tốc độ truyền tải dữ liệu băng thông cực cao. Thiết kế vô cùng phù hợp với thời đại đa kết nối như hiện nay.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (30, N'Laptop ASUS TUF Gaming FX506LI-HN039T', N'23490000            ', N'19990000            ', N' Laptop ASUS Gaming FX506LI laptop gaming giá rẻ - hiệu năng cao Hiện nay khi mua laptop người dùng thường có xu hướng lựa chọn sản phẩm có thể phục vụ cho nhiều nhu cầu sử dụng khác nhau. Vậy, ASUS Gaming FX506LI sẽ là lựa chọn phù hợp. Laptop với cấu hình cao có thể phục vụ học tập, làm việc, chơi game,…', N'mt07.jpg                      ', N'Thiết kế gaming hầm hố, bàn phím chuyên dụng
Laptop ASUS Gaming FX506LI được thiết kế nhỏ gọn cùng độ bền cao khi sở hữu nhiều chứng nhận độ bền như MIL-STD-810G với khả năng chịu nhiệt độ cao, phơi nhiễm bức xạ mặt trời,.. Nhờ đó, người dùng thoải mái mang theo, duy chuyển mà không cần quá lo lắng việc tình trạng sốc sẽ ảnh hưởng đến máy. Hay những va chạm vô tình cũng không ảnh hưởng đến máy.

Thiết kế gaming hầm hố, bàn phím chuyên dụng

Bàn phím trên ASUS Gaming FX506LI được thiết kế chuyên dụng cho dân chơi game với hệ thống phím WASD nổi bật, khoảng cách giữa các phím rộng. Bên cạnh đó, bàn phím được trang bị công nghệ Overstroke và HyperStrike cho thao tác gõ nhanh và chính xác hơn.

Khi gõ, máy cho cảm giác thoải mái với hành trình 1,8mm và bền bỉ với 20 triệu lần nhấn. Ngoài ra, ASUS Gaming FX506LI còn được trang bị đèn nền RGB-backlighting cho màu sắc rực rỡ

Màn hình 15,6 inch, khung viền siêu mỏng
Laptop được trang bị màn hình 15,6 inch kích thước lớn, tấm nền IPS full HD sắc nét cùng độ sáng cao lên tới 250nits cho chi tiết sắc nét. Màn hình được thiết kế với khung viền Nano Edge siêu mỏng, chỉ 6,5mm nhờ đó tăng tối đa diện tích khung hình. Màn hình với tần số quét 144Hz cho các chuyển động mượt mà, đặc biệt trong trải nghiệm chơi game.

Màn hình 15,6 inch, khung viền siêu mỏng

Về màu sắc, ASUS Gaming FX506LI sở hữu độ phủ màu sRGB lên đến 63%, Non-Glare with 45% NTSC cho màu sắc hiển thị sống động. Ngoài ra, máy với góc nhìn rộng giúp người dùng có thể xem phim, giải trí cùng bạn bè dễ dàng.

Âm thanh Surround Sound chất lượng cùng công nghệ HYPERCOOL độc quyền
ASUS Gaming FX506LI cho chất lượng âm thanh cao nhờ được tích hợp công nghệ âm thanh độc quyền DTS Headphone: X. Đặc biệt khi đeo tai nghe, người dùng có thể trải nghiệm âm thanh vòm 7.1 giả lập cho chất lượng chân thực, đặc biệt trong trải nghiệm game. Ngoài ra, người dùng còn có thể tùy chỉnh Equalizer mang đến trải nghiệm chân thực trong phim ảnh, trò chơi, nghe nhạc,…

Âm thanh Surround Sound chất lượng cùng công nghệ HYPERCOOL độc quyền

Không chỉ trong trong trải nghiệm âm thanh, ASUS Gaming FX506LI còn sở hữu công nghệ tản nhiệt HyperCool độc quyền với hệ thống Anti-Dust Cooling. Với 3 tùy chỉnh chế độ quạt cùng công nghệ Fan Overboost nhờ đó máy luôn duy trì nhiệt độ ổn định, kể cả khi chơi game trong thời gian dài.

Ngoài ra, ASUS Gaming FX506LI còn được trang bị viên pin dung lượng lớn 3 Cell 48WHr. Nhờ đó người dùng có thể thoải mái sử dụng, chơi game trong thời gian dài mà không cần lo lắng tình trạng pin.

Cấu hình mạnh mẽ với chip Intel Core i5-10300H
Laptop ASUS Gaming FX506LI được trang bị cấu hình mạnh mẽ với chip Intel Core i5-10300H cho khả năng xử lý cao. Cùng với card đồ họa kép NVIDIA GeForce GTX 1650Ti 4GB GDDR6 cùng Intel® UHD Graphics cho khả năng xử lý đồ họa ấn tượng. Người dùng có thể thoải mái sử dụng cho chơi game, đồ họa,…

Cấu hình mạnh mẽ với chip Intel Core i5-10300H

Ngoài ra, với ổ cứng SSD 512GB SSD M.2 PCIE cùng 8GB RAM cho tốc độ mở máy, truyền tải dữ liệu cực kỳ nhanh. Dung lượng Ram lớn (Có thể mở rộng lên 32GB) cho khả năng đa nhiệm tốt. người dùng có thể xử lý cùng lúc nhiều việc khác nhau mà không lo lắng việc đơ máy hay load lại.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (31, N'Apple MacBook Air M1 512GB 2020', N'34990000            ', N'30500000            ', N'MacBook Air M1 512GB 2020 - Mở rộng dung lượng lưu trữ Apple là một hãng sản xuất các thiết bị điện tử nổi tiếng nhất thế giới. Mỗi dòng sản phẩm Apple cho ra mắt những phiên bản với dung lượng bộ nhớ trong khác nhau. Đến với Air M1 cũng được Apple cho ra mắt phiên bản có dung lượng cao nhất đó là Apple MacBook Air M1 512GB 2020.', N'mt08.jpg                      ', N'Thiết kế với phong cách mới, chất liệu cao cấp siêu nhẹ
Giống như các dòng sản phẩm trước đây, Apple đã thiết kế cho chiếc máy tính xách tay của mình với một thiết kế riêng biệt với sự đẳng cấp riêng.

Mang đến sự tinh tế và sang trọng cho người dùng và đến với thế hệ Macbook Air M1 2020 cũng được thiết kế như vậy.

Thiết kế với phong cách mới, chất liệu cao cấp siêu nhẹ

Được làm từ chất liệu kim loại cao cấp và kích thước gọn gàng 1.61 cm x 30.41 cm x 21.24 cm nhưng trọng lượng của máy chỉ 1.29 kg. Giúp người dùng có thể thoải mái mang laptop đi bất kỳ nơi đâu.

Với chất liệu này còn giúp cho laptop hạn chế được bụi bẩn hay vân tay giúp Apple MacBook Air M1 512GB 2020 luôn sạch sẽ và bóng loáng.

Hiệu năng thay đổi với chip mới, ổ cứng lên đến 512GB SSD
Apple MacBook Air M1 512GB 2020 được trang bị bộ vi xử lý ARM một trong những con chip mới nhất trong quá trình đổi mới của Apple.

Với chip ARM mang đến tốc độ xử lý vượt trội nhanh hơn gấp 3.5 lần so với thế hệ tiền nhiệm trước đây. Cùng với bộ nhớ Ram 8GB mang đến khả năng đa nhiệm trên các tác vụ một cách mượt mà và nhanh chóng.

Hiệu năng thay đổi với chip mới, ổ cứng lên đến 512GB SSD

Điểm đáng nói ở chiếc MacBook Air M1 512GB 2020 là Apple đã nâng cấp dung lượng ổ cứng lên đến 512GB đem đến cho người dùng không gian lưu trữ thoải mái mà không lo nhanh hết dung lượng.

Với ổ cứng 512GB cho phép người dùng có thể truy xuất dữ liệu nhanh chóng, mang đến sự trải nghiệm thoải mái trong quá trình sử dụng.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (32, N'Laptop MSI Gaming BRAVO 15 A4DCR-270VN', N'19490000            ', N'17990000            ', N'MSI Bravo 15 A4CDR (270VN) – Laptop gaming nhỏ gọn, hiệu năng cao Mẫu laptop MSI Bravo 15 là sản phẩm mới năm 2020 của MSI được ra mắt hướng tới dòng sản phẩm laptop gaming trung cấp, giúp người dùng có một chiếc máy chiến game hiệu năng cao nhưng vẫn giữ cho mình một thiết kế nhỏ gọn để tiện di chuyển ở mọi nơi. Cùng điểm qua những điểm nổi bật được đánh giá cao ở chiếc laptop gaming mới nhất đến từ MSI này.', N'mt09.jpg                      ', N'Màn hình 15.6" hỗ trợ công nghệ Freesynce, tần số quét màn hình 144Hz
Laptop MSI Gaming Bravo 15 được trang bị một màn hình với kích thước 15.6 inches phù hợp cho nhu cầu làm việc, xem phim hay chơi game của người dùng, tấm nền màn hình IPS LCD độ phân giải FullHD giúp màu sắc hiển thị chân thực và sắc nét.

Màn hình 15.6" hỗ trợ công nghệ Freesynce, tần số quét màn hình 144Hz

Áp dụng công nghệ khử răng cưa, giảm độ trễ hình ảnh khi chơi game với AMD Freesynce cho phép game thủ trải nghiệm gaming một cách hoàn hảo, tần số quét màn hình 144Hz phù hợp với các tự game Esport mà tốc độ là yếu tố chính dẫn đến chiến thắng.

Viền màn hình siêu mỏng, thiết kế vỏ nhôm cao cấp
Thiết kế viền màn hình siêu mỏng, giúp chiếc laptop MSI Bravo 15 tối ưu được diện tích hiển thị, giúp thiết kế máy cũng sexy hơn.

Viền màn hình siêu mỏng

Thiết kế vỏ nhôm cao cấp, trọng lượng chiếc laptop chỉ nặng chưa đến 2kg giúp người dùng có thể mang chiếc máy để chiến game ở mọi lúc mọi nơi mọi cách dễ dàng hơn.

thiết kế vỏ nhôm cao cấp

Vi xử lý Ryzen 5-4600H hiệu năng cao, đồ hoạ Radeon RX 5300M chiến tốt mọi tựa game
Vi xử lý Ryzen 5-4600H sản xuất trên tiến trình 7nm mang đến cho chiếc laptop MSI Gaming Bravo 15 A4CDR 270VN khả năng xử lý công việc một cách vượt trội như một chiếc máy tính để bàn. Hỗ trợ tốt cả xử lý công việc, chơi game, hay làm đồ họa.

Vi xử lý Ryzen 5-4600H hiệu năng cao, đồ hoạt Radeon RX 5500M chiến tốt mọi tựa game

Cùng với đó là đồ họa Radeon RX 5300M giúp bạn có thể chiến mọi tựa game AAA với mức setting High một cách mượt mà nhất, không còn bỏ lỡ bất kỳ tựa game yêu thích nào mà bạn mong muốn.

Công nghệ tản nhiệt độc quyền Cooler Boost 5 giúp máy vận hành ổn định
Công nghệ tản nhiệt Cooler Boost thế hệ thứ 5, nâng cấp số lượng các ống đồng tản nhiệt lên 6, hệ thống quạt tản Whirlwind Blade cao cấp, tăng số hốc thoát khí lên 4.

Công nghệ tản nhiệt độc quyền Cooler Boost 5 giúp máy vận hành ổn định

Với hệ thống tản nhiệt này, giúp cho MSI Gaming Bravo 15 có khả năng vận hành ổn định trong thời gian dài, mà không gặp tình trạng giảm hiệu năng hoạt động do tình trạng quá nhiệt gây nê.

Hỗ trợ âm thanh Hi-Res, tùy chỉnh mạnh mẽ âm thanh với Nahimic 3
Laptop MSI Bravo 15 A4CDR 270VN hỗ trợ công nghệ âm thanh Hi-Res Audio cho phép bạn  tận hưởng âm thanh chất lượng cao, khi nghe nhạc, xem phim hay chơi game.

Hỗ trợ âm thanh Hi-Res, tùy chỉnh mạnh mẽ âm thanh với Nahimic 3

Công nghệ âm thanh giả lập Nahimic 3 độc quyền dành cho laptop MSI cho phép người dùng các tùy chỉnh âm thanh như tạo hệ thống âm thanh vòm 3D, khử nhiễu, khử tiếng ồn khi thu hay ghi âm.

Tùy chỉnh thiết lập gaming với Dragon Center, hỗ trợ chơi game Android với trình giải lập MSI App Player
Là một chiếc laptop dành cho game thủ, không thể không nhắc đến phần mềm quản lý và  tùy chỉnh thiết lập game, với Dragon Center đến từ MSI, bạn có thể thiết lập cài đặt riêng cho từng tựa game, ghi lại các cảnh highlight, tùy chỉnh đèn bàn phím, ra lệnh giọng nói,…

Tùy chỉnh thiết lập gaming với Dragon Center

Cùng hợp tác với Bluestack, MSI tích hợp phần mềm MSI App Player cho phép các game thủ chơi game trên di động có thể trải nghiệm các tựa game yêu thích trên di động lên chiếc laptop của mình với trải nghiệm tốt hơn như màn hình lớn, hỗ trợ gán phím cho game.

hỗ trợ chơi game Android với trình giải lập MSI App Player', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (33, N'Laptop MSI Gaming GF63 GF63 THIN 9SCSR-1057VN', N'22490000            ', N'18590000            ', N'Laptop MSI Gaming GF63 THIN 9SCSR-1057VN – Tối giản kích thước, hiệu năng chạm đỉnh Dòng máy Gaming luôn có chỗ đứng vững trong thị trường laptop hiện nay, không những phục vụ cho người chơi game mà còn hỗ trợ làm đồ họa rất đỉnh. Khi nhắc đến thương hiệu laptop gaming thì người dùng liền nghĩ ngay đến MSI, và điển hình là dòng laptop MSI Gaming GF63 THIN 9SCSR-1057VN tiêu biểu mà bạn có thể xem qua.', N'mt11.png                      ', N'Độ mỏng chỉ 2.2cm, trọng lượng 1.86kg, hoàn thiện từ nhôm nguyên khối
Laptop MSI Gaming GF63 THIN 9SCSR-1057VN mang một thiết kế hiện đại và đầy phong cách đặc trưng của gaming. Bằng chứng là vẻ ngoài được hoàn thiện chủ yếu từ nhôm, tạo nên một kết cấu chắc chắn và bền bỉ, sẵn sàng chống lại tất cả những va đập từ lực bên ngoài.

Độ mỏng chỉ 2.2cm, trọng lượng 1.86kg, hoàn thiện từ nhôm nguyên khối

Tưởng chừng vẻ ngoài của máy sẽ hầm hố và nặng nề thường thấy trên những dòng laptop gaming nhưng, độ mỏng của máy chỉ 2.2 cm và trọng lượng cũng chỉ đạt có 1.86g ngang bằng với những chiếc máy phổ thông hiện nay. Qua đó, giúp cho người dùng có thể mang đến khắp mọi nơi để sử dụng như công ty, hay quán cà phê.

Toàn bộ phần thân của chiếc MSI Gaming GF63 THIN 9SCSR-1057VN đều sở hữu một màu đen chủ đạo với chỉ một điểm nhấn đến từ logo màu đỏ được phát sáng.

Màn hình kích thước 15.6 inches, độ phân giải FullHD, tấm nền IPS
MSI Gaming GF63 được trang bị một màn hình kích thước đến 15.6 inch, đảm bảo đủ không gian để trải nghiệm những tựa game sống động. Bên cạnh đó, độ phân giải đạt FullHD, tạo khả năng hiển thị sắc nét các chi tiết nhỏ nhất.

Màn hình kích thước 15.6 inches, độ phân giải FullHD, tấm nền IPS

Ngoài ra, màn hình của MSI Gaming GF63 sử dụng tấm nền IPS giúp cho bạn dễ dàng tận hưởng những tựa game mà mình yêu thích ở góc nhìn rộng, độ tương phản cao cùng màu sắc trung thực. Hơn nữa, màn hình cũng có khả năng chống chói khi bạn sử dụng ở ngoài trời.

Hiệu năng vượt trội từ Intel Core i5 thế hệ thứ 9, card rời GTX 1650 Ti
MSI Gaming GF63 sở hữu bộ vi xử lý đến từ Intel Core i5 thế hệ thứ 9 nâng cao sức mạnh lên đáng kể. Cụ thể con chip này có xung nhịp 2,4 GHz Turbo Boost 4,10 GHz, bộ nhớ đệm 8MB, 4 nhân và 8 luồng cung cấp sức mạnh vượt trội. Qua đó, hỗ trợ chơi được hầu hết những tựa game thể thao nổi tiếng..

Hiệu năng vượt trội từ Intel Core i5 thế hệ thứ 9, card rời GTX 1650 Ti

Bên cạnh đó, nhằm gia tăng sức mạnh để xử lý dữ liệu, MSI còn trang bị cho sản phẩm của mình card đồ họa rời GTX 1650 Ti, đây là con chip sử dụng kiến trúc NVIDIA Turing nổi tiếng, với bộ nhớ GDDR6 thế hệ mới. Từ đó, cung cấp tốc độ xử lý nhanh, hiệu ứng bóng đổ trung thực cùng khả năng tối ưu riêng cho từng game.

Đi kèm đó là bộ nhớ trong SSD 512GB, cho khả năng xử lý dữ liệu nhanh chóng và ổn định. Bộ nhớ cao, giúp mở rộng không gian lưu trữ, thoải mái để bạn cất giữ game, nhạc, video, hay những dữ liệu thoải mái hơn.

Thông thường, các dòng máy MSI đều được cung cấp ba chế độ tùy chỉnh hiệu năng, với chỉ một phím MSI Shift duy nhất. Ba chế độ đó là: Sport phù hợp khi bạn chơi game, Comfort để sử dụng lúc tác vụ bình thường và cuối cùng là Eco dành cho việc tiết kiệm năng lượng.

card rời GTX 1650 Ti

Âm thanh Nahimic3 sống động và thời gian sử dụng đến 7 giờ
MSI Gaming GF63 được trang bị bộ âm thanh Nahimic3, vốn phổ biến trong các laptop gaming. Qua đó, mang đến âm thanh vòm 3D phù hợp dành cho công tác chơi game. Cộng thêm nữa là công nghệ Audio Boost cung cấp một chất âm có độ chi tiết cao hơn lên đến 30% hỗ trợ nghe được những tiếng động dù là nhỏ nhất.

Âm thanh Nahimic3 sống động

Tùy vào tần suất sử dụng mà thời gian trên MSI GF63 có thể thay đổi. Nếu để chơi game trung bình không hoạt động 3D quá nặng thì nó có thể trụ được trong 7 giờ đồng hồ. Đây quả là một con số vượt trội, đủ để bạn trải nghiệm toàn bộ trò chơi mà không bị gián đoạn.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (34, N'Laptop Lenovo ThinkBook 15 G2 ITL', N'16290000            ', N'15490000            ', N'Laptop Lenovo ThinkBook 15 G2 ITL thiết kế thanh lịch, chất lượng ổn định ThinkBook là dòng sản phẩm hướng tới đối tượng doanh nhân của Lenovo. Tất cả các thiết kế thuộc dòng này đều mang tính thanh lịch, sang trọng, cấu hình ổn định toát lên thần thái của một doanh nhân. Laptop Lenovo Thinkbook 155 G2 ITL là dòng sản phẩm thế hệ mới mang đến cho người dùng những trải nghiệm khác biệt.', N'mt10.jpg                      ', N'Thiết kế chuyên nghiệp, màn hình Full HD
Laptop Lenovo Thinkbook 15 G2 ITL sở hữu thiết kế chuyên nghiệp mang đến cho người dùng nhiều cảm hứng làm việc. Phần viền màn hình siêu mỏng, kích thước nhỏ gọn không chỉ mang đến phong cách độc đáo mà còn giúp bạn dễ dàng mang đi bất cứ đâu.

Thiết kế chuyên nghiệp, màn hình Full HD

Màn hình của máy có kích thước 15,6 inch tương đối lớn, độ phân giải Full HD sắc nét và gam màu rộng mang đến hình ảnh sống động và màu sắc chân thật. Ngoài ra, công nghệ lọc ánh sáng xanh trên máy giúp bảo vệ mắt để có thể làm việc thoải mái trong thời gian dài.

Cấu hình tiên tiến, khả năng xử lý đồ họa vượt trội
Lenovo Thinkbook 155 G2 ITL được trang bị bộ vi xử lý Intel thế hệ thứ 11 mang đến sức mạnh vượt trội. Chip Intel Core i5 1135G7 với 4 lõi 8 luồng, tốc độ xung nhịp tối đa 4.20GHz được sản xuất trên tiến trình 10nm SuperFin không chỉ mạnh mẽ mà còn tiết kiệm điện. RAM 8GB và ổ cứng SSD 512GB giúp bạn tối ưu hiệu suất công việc.

Cấu hình tiên tiến, khả năng xử lý đồ họa vượt trội

Ngoài ra, GPU đồ họa Intel Iris Xe mạnh mẽ hàng đầu giúp bạn sử dụng các ứng dụng đồ họa một cách mượt mà.

Bảo mật thông minh, kết nối ấn tượng
Laptop Lenovo Thinkbook 155 G2 ITL sở hữu nền tảng TPM mang đến khả năng bảo mật thông minh ngăn chặn các trường hợp truy cập trái phép. Nhiều tính năng thông minh khác như: gấp mở để mở máy, làm mát thông minh,... được trang bị để mang đến trải nghiệm hoàn hảo nhất.

Bảo mật thông minh, kết nối ấn tượng

Máy có khả năng kết nối ấn tượng nhờ công nghệ kết nối tiên tiến như: Thunderbolt 4, HDMI, USB-C 3.2 Gen 2,USB 3.2 Gen 1. Chuẩn WiFi 6 cho tốc độ nhanh hơn và vượt trội hơn.', 2, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (35, N'Apple iPad Pro 11 2021 M1 WiFi 128GB', N'21990000            ', N'20990000            ', N'iPad Pro 2021 11 inch – Tablet cấu mình mạnh với chip M1 mới Như thường lệ hằng năm Apple lại cho ra mắt chiếc máy tính bảng của mình. iPad Pro 2021 phiên bản 11 inch hứa hẹn mang đến một trải nghiệm mạnh vẽ với nhiều tính năng nổi bật.', N'mtb05.jpg                     ', N'Thiết kế vuông vức sang trọng, màn hình 11 inch
iPad Pro 11 inch 2021 sở hữu ngoại hình mang nhiều điểm tương tự về ngoại hình với chiếc iPad Pro trước đó. Apple iPad Pro 2021 sử dụng màn hình kích thước 11 inch và sử dụng màn hình LCD truyền thống.  Màn hình trên iPad Pro 2021 này với công nghệ màu ProMotion cùng độ phân giải cao 264 pixel mỗi inch. Màn hình này cũng được trang bị lớp phủ chống bám vân tay và chống phản xạ, nâng cao trải nghiệm cho người dùng.

Một vài điểm khác biệt từ ngoại hình, màn hình 11 inches, Mini-LED

Sức mạnh kinh ngạc từ con chip Apple M1
iPad Pro 11 2021 được cung cấp sức mạnh bởi con chip M1 với CPU 8 nhân và GPU 8 nhân. Nhờ đó mà thế hệ iPad Pro năm nay nhanh hơn rất nhiều lần so với iPad 2010 ban đầu và nhanh hơn tới 50% so với iPad Pro 2020. Theo nhà sản xuất cho biết, những cái tiến này giúp máy thực hiện chỉnh sửa video 4K và thiết kế 3D tốt hơn.

Sức mạnh kinh ngạc từ Apple A13Z

iPad Pro 2021 được trang bị đến 4 loa, khung nhôm với chấu sạc từ tính dành cho Apple Pencil nằm ở hai bên hông cũng như cổng USB-C nằm ở cạnh bên dưới để sạc.

Cụm camera 12MP mang lại hình ảnh chất lượng
Máy tính bảng iPad Pro 2021 được trang bị cụm camera sau với cacmera góc siêu rộng 12MP với góc chụp 122 độ. Bên cạnh là camera siêu rộng 10MP cuối cùng là máy quét LiDAR. Camera trước trên máy với khẩu độ 12MP, hỗ trợ góc chụp lên đến 122 độ.

Cụm camera 12MP mang lại hình ảnh chất lượng

Camera trên iPad Pro 2021 với tính năng Smart HDR 3 mang lại khả năng chụp ảnh và quay video một cách toàn diện.

Kết nối không dây nhanh chóng với wifi 6 và 5G
Máy tính bảng iPad Pro 2021 với hệ thống wifi 6 mang lại khả năng kết nối siêu nhanh. Ngoài ra máy còn được trang bị kết nối 5G thế hệ mới magn lại khả năng truyền tải nhanh vượt trội.

Kết nối không dây nhanh chóng với wifi 6 và 5G

Về khả năng giải trí, iPad Pro 2021 với hệ thống 4 loa Dolby Atmos mang đến âm thanh chất lượng như trong rạp hát. Nhờ vậy người dùng có thể thoải mái trải nghiệm nghe nhạc, xem phim với chất lượng âm thanh sống động.

Hỗ trợ Apple Pencil cùng hệ điều hành iPad OS mượt mà
Tablet iPad Pro 2021 có thể kết nối với Apple Pencil giúp người dùng sử dụng ghi chú tốt hơn. Sự kết hợp này mang lại cảm giác như trực quan và chính xác như đang ghi chú, vẽ tranh trên giấy. Thiết kế Apple Pencil với khả năng gắn từ tính cùng đầu bút có độ nghiêng và độ nhạy cao, tối ưu cho trải nghiệm người dùng.

Hỗ trợ Apple Pencil cùng hệ điều hành iPad OS mượt mà

Là một hệ điều hành do chính Apple sản xuất nên iPadOS khá giống iOS. Người dùng iPad Pro 2021 sẽ có thể đa nhiệm một cách dễ dàng. Các thao tác như dán và sao chép cũng được thực hiện một cách dễ dàng hơn.

iPad Pro 2021 còn sở hữu kho ứng dụng vô cùng phong phú với hơn 1 triệu ứng dụng khác nhau trên AppStore.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (36, N'iPad Pro 11 2020 WiFi 128GB', N'21990000            ', N'20900000            ', N'iPad Pro 11  – Sự nâng cấp đáng giá sau hai năm Bắt đầu được giới thiệu từ lần đầu vào năm 2015, iPad Pro là dòng tablet cao cấp nhất của Apple. Ở phiên bản 2018, iPad Pro đã sở hữu màn hình viền mỏng cùng hệ thống nhận diện khuôn mặt Face ID. Cho đến hai năm sau, Apple cho ra mắt iPad Pro 11 WiFi 2020 128gb được nâng cấp mạnh mẽ hơn về hiệu năng và camera.', N'mtb06.jpg                     ', N'Kết nối mạng qua wifi ổn định, không hỗ trợ 4G
Ở phiên bản này, chiếc máy sử dụng phương thức kết nối chủ yếu là WiFi, không dùng SIM điện thoại. Khi iPad Pro 11 WiFi 2020 được kết nối với đường truyền WiFi, người dùng có thể sử dụng thiết bị để truy cập website, các ứng dụng, call video hoặc thực hiện tác vụ cần thiết trên mạng internet.

Kết nối mạng qua wifi ổn định, không hỗ trợ 4G

Dung lượng bộ nhớ trong luôn là thứ khiến cho người dùng quan tâm hàng đầu khi dự định sở hữu bất kỳ sản phẩm công nghệ nào. Với iPad Pro 11 WiFi 2020, bạn sẽ được cung cấp một bộ nhớ lưu trữ lên đến 128GB. Ở mức dung lượng này, bạn có thể thoải mái lưu trữ hình ảnh, tài liệu, video clip, file bài hát,… trong suốt một thời gian dài mà không cần lo lắng việc hết bộ nhớ. Ngoài 128GB thì iPad Pro 11 WiFi 2020 còn nhiều phiên bản với dung lượng lưu trữ khác như: iPad Pro 11 WiFi 2020 256GB.

Thiết kế quen thuộc, trọng lượng chỉ 471g, màn hình Liquid Retina, độ phân giải 1668 x 2388 pixel
Thiết kế của iPad Pro 11 128gb giống phiên bản trước và một thay đổi duy nhất nằm ở mặt lưng với cụm camera sau hình vuông. Tổng kích thước của chiếc iPad này là 247.6 x 178.5 x 5.9 mm và có trọng lượng 471g chỉ nhỉnh hơn một chút so với phiên bản trước. Đồng thời các cạnh và góc xung quanh được bo tròn mềm mại sẽ tạo cho người dùng cảm giác cầm nắm vô cùng chắc chắn và thoải mái.


iPad Pro 11 WiFi 2020 sở hữu màn hình Retina kích thước 11 inch IPS với độ phân giải 1668 x 2388 pixel. Màn hình còn được sử dụng công nghệ màn hình ProMotion cho phép người dùng được trải nghiệm những hình ảnh một cách chân thực và sinh động nhất.


Bên cạnh những công nghệ quen thuộc, với iPad Pro 11 WiFi 2020 được phủ công nghệ oleophobic chống vân tay, chống phản xạ cho khả năng hiển thị ngoài trời tốt. còn mang đến cho chiếc màn hình của sản phẩm này công nghệ True Tone. iPad Pro 11 2020 cũng được trang bị công nghệ True Tone này giúp màn hình trở nên thực tế hơn, phù hợp với những người chỉnh sửa ảnh hoặc chỉnh sửa video muốn tinh chỉnh màu sắc của hình ảnh. Ngoài ra, tốc độ của màn hình đạt 120 Hz, đem đến khả năng hiển thị liên tục 120 khung hình mỗi giây.

Hiệu năng nâng cấp: vi xử lý Apple A12Z Bionic mạnh mẽ
iPad Pro 11 2020 được cung cấp sức mạnh bởi con chip A12Z Bionic, gồm GPU 8 lõi cùng kiến trúc kiểm soát nhiệt mới và hệ thống controller được tối ưu hóa nhằm cho hiệu suất cao hơn. Theo nhà sản xuất cho biết, nhờ những cải tiến trên mà các chuyên gia làm việc trên iPad Pro 2020 có thể chỉnh sửa video 4K và thiết kế mô hình 3D trơn tru.

Hiệu năng nâng cấp: vi xử lý Apple A12Z Bionic mạnh mẽ

Sở hữu viên pin lithium-polymer, iPad Pro 11 wifi 2020 cho 10 giờ lướt web. iPad Pro 2020 hỗ trợ sử dụng Apple Pencil cho phép ghi chú dễ dàng như trên giấy. Đồng thời thỏa sức sáng tạo, chỉnh sửa hình ảnh.

Hỗ trợ Apple Pencil

Camera sau được nâng cấp: 12MP+10MP, máy quét LiDAR
iPad Pro 2020 được trang bị đến tận hệ thống ba camera sau, bao gồm cảm biến chính 12MP và ống kính góc siêu rộng 10MP. Cảm biến thứ ba được Apple gọi là máy quét LiDAR, cho phép đo được khoảng cách lên tới 5 mét xung quanh vật thể, hoạt động cả ngoài trời và trong nhà.

Camera sau được nâng cấp: 12MP+10MP, máy quét LiDAR

Điều này cho thấy sự đầu tư rất nhiều của Apple đối với sản phẩm iPad khi công nghệ camera không thua kém gì so với camera trên iPhone. Thậm chí là bạn còn có thể sử dụng camera trên iPad thay thế cho những chiếc máy ảnh DSLR. Camera trên iPad Pro 2020 hỗ trợ quay video 4K.

Camera trước hỗ trợ Face ID cũng như chụp ảnh tự sướng, FaceTime với bạn bè. Đồng thời với Animoji, iPad Pro 2020 có thể giúp các bức ảnh, cuộc trò chuyện trở nên sinh động hơn.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (37, N'iPad 10.2 2020 WiFi 128GB', N'11990000            ', N'10500000            ', N'iPad 10.2 2020 - Phiên bản wifi cùng dung lượng bộ nhớ trong lớn iPad 10.2 2020 phiên bản wifi với bề ngoài sang trọng, chip Apple A12 mạnh mẽ cùng sự hỗ trợ của bút Apple Pencil và bàn phím thông minh. iPad 10.2 với camera chính 8MP cho khả năng chụp ảnh chất lượng.', N'mtb07.jpg                     ', N'iPad 10.2 2020 phiên bản wifi với bề ngoài sang trọng, chip Apple A12 mạnh mẽ cùng sự hỗ trợ của bút Apple Pencil và bàn phím thông minh. iPad 10.2 với camera chính 8MP cho khả năng chụp ảnh chất lượng.

iPad 10.2 2020 - Phiên bản wifi cùng dung lượng bộ nhớ trong lớn

Phiên bản wifi cho khả năng kết nối mạng không dây dễ dàng. Phiên bản 128GB bộ nhớ trong cho khả năng lưu trữ lớn, lớn hơn nhiều so với phiên bản 32GB tiêu chuẩn.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (38, N'iPad Air 10.9 2020 WiFi 256GB', N'20990000            ', N'18100000            ', N'iPad Air 10.9 2020 WiFi 256GB I Chính hãng Apple Việt Nam', N'mtb08.jpg                     ', N'Kích thước màn hình	10.9 inches
Công nghệ màn hình	IPS LCD
Camera sau	12 MP góc rộng,khẩu độ f/1.8
Camera trước	7 MP, khẩu độ f/2.2
Chipset	Apple A14 Bionic
Bộ nhớ trong	256 GB
Pin	Khoảng 7600 mAh
Hệ điều hành	iOS
Độ phân giải màn hình	1640 x 2360 pixels
Loại CPU	2 nhân 3.0GHz
4 nhân 1.8GHz
GPU	Apple GPU
Kích thước	Dài 247.6 mm - Ngang 178.5 mm - Dày 6.1 mm
Trọng lượng	458 g
Quay video	Trước: 1080p@30/60fps
Sau: 4K@24/30/60fps
1080p@30/60/120/240fps;
Chất liệu mặt lưng	Kim loại
Công nghệ sạc	Sạc nhanh 20W
Wi-Fi	802.11ax Wi-Fi 6, dual-band, hotspot
Bluetooth	Bluetooth 5.0
GPS	GPS/GNSS', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (39, N'Apple iPad Pro 12.9 2021 M1 WiFi 1TB', N'49990000            ', N'48990000            ', N'Apple iPad Pro 12.9 2021 M1 WiFi 1TB I Chính hãng Apple Việt Nam', N'mtb09.jpg                     ', N'Apple iPad Pro 12.9 2021 M1 WiFi 1TB có dung lượng cao, phù hợp với những bạn có nhu cầu học tập, làm việc trên chính chiếc máy của mình. iPad Pro 12.9 2021 được trang bị cụm camera hỗ trợ góc chụp siêu rộng và các góc chụp khác, giúp cho bạn lưu giữ lại những khoảnh khắc đặc biệt với chất lượng hình ảnh cao nhất.

Bên cạnh đó, Apple cũng tung ra phiên bản dung lượng lớn hơn là 2TB với sản phẩm Apple iPad Pro 12.9 2021 M1 WiFi 2TB.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (40, N'Máy đọc sách Kindle Paperwhite 4 Gen 10 8GB', N'3990000             ', N'3090000             ', N'Máy đọc sách Kindle PaperWhite Gen4 10th - Đọc sách và nghe sách tiện lợi Bạn là một người có sở thích đọc sách và mong muốn được đọc những quyển sách mình yêu thích trong thời gian rảnh rỗi? Giờ đây bạn không phải vác theo nhiều quyển sách nặng nề nữa, khi đã có trong tay máy đọc sách Kindle PaperWhite Gen 4 10th bản 8 GB hiện đại và nhỏ gọn.', N'mtb10.jpg                     ', N'Kích thước nhỏ gọn vừa tay cầm, màn hình phẳng 6 inch
Máy đọc sách Kindle PaperWhite 4 Gen 10 rất thích hợp cho nhu cầu đọc sách tiện lợi mà không cần phải mang theo quá nhiều quyển sách gây cồng kềnh. Chiếc máy đọc sách này có hình dáng giống một chiếc máy tính bảng, nhưng kích cỡ nhỏ gọn vừa tay cầm nên bạn dễ dàng mang theo bên mình bất kỳ lúc nào.

Máy với bốn tùy chọn màu sắc bao gồm Đen, Xanh, Xám Xanh và Tím sẽ giúp bạn dễ chọn ra chiếc máy đọc sách phù hợp với cá tính bản thân.

Kích thước nhỏ gọn vừa tay cầm, màn hình phẳng 6 inch

Máy đọc sách Kindle PaperWhite 4 Gen 10 sử dụng loại màn hình E-ink kích thước 6 inch với độ phân giải 300 PPI, hiển thị màu mực rõ nét hơn và đẹp như trang sách thật. Ngoài ra chiếc máy đọc sách này hỗ trợ đọc sách trong chế độ tối (dark mode) cho những ai đã quen với giao diện tối trên thiết bị công nghệ.

Dung lượng chứa sách 8GB, pin 1500 mah, hỗ trợ nghe sách qua Bluetooth
Máy đọc sách Kindle PaperWhite 4 Gen 10 có dung lượng chứa sách là 8 GB giúp bạn thỏa thích lưu trữ những quyển sách điện tử bạn yêu thích. Dung lượng pin 1500mAh sẽ đảm bảo bạn có thể đọc sách trên Kindle PaperWhite 4 Gen 10 lâu dài, mỗi ngày đọc 30 phút không WiFi sẽ kéo dài tận 6-8 tuần.

Dung lượng chứa sách 8GB, pin 1500 mah, hỗ trợ nghe sách qua Bluetooth

Máy đọc sách Kindle PaperWhite 4 Gen 10 không chỉ hỗ trợ kết nối WiFi, mà còn cả Bluetooth giúp bạn nghe sách audible thỏa thích. Đặc biệt, Kindle PaperWhite 4 Gen 10 còn có khả năng chống nước trên chiếc máy, nên bạn có thể yên tâm và mang máy đọc sách theo bên mình những lúc cần thiết.', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (44, N'Apple iPad Pro 11 2021 M1 WiFi 512GB', N'31990000            ', N'30990000            ', N'Apple iPad Pro 11 2021 M1 WiFi 512GB I Chính hãng Apple Việt Nam', N'mtb11.jpg                     ', N'Apple iPad Pro 11 2021 M1 WiFi 512GB là phiên bản iPad 2021 có dung lượng cao mà Apple tung ra trong mùa hè này. Trong phiên bản mới này, Apple đã cải tiến sức mạnh của chiếc iPad Pro 2021 11 inch này với chip M1 với CPU 8 nhân và GPU 8 nhân.

Với những người sử dụng nhiều dữ liệu lưu trữ, có thể phiên bản 512GB vẫn chưa đủ với bạn, và bạn cần dung lượng cao hơn. Vậy nên bạn có thể tham khảo qua Apple iPad Pro 11 2021 M1 WiFi 1TB .', 3, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (45, N'Camera hành trình GoPro Hero 8', N'10490000            ', N'7550000             ', N'GoPro Hero 8 – bạn đồng hành trong suốt cuộc hành trình Camera hành trình GoPro Hero 8 mang đến hàng loạt tính năng ưu tú nhất chắt lọc từ những người tiền nhiệm. Máy sở hữu nhiều tính năng độc đáo như chế độ ảnh chân dung, màn hình cảm ứng đa điểm, ứng dụng tiện ích GoPro, khả năng chống nước,…', N'pk05.jpg                      ', N'Chống nước 10m, màn hình cảm ứng điều khiển bằng giọng nói
Với kích thước nhỏ gọn cùng trọng lượng 136 g, camera hành trình GoPro Hero 8 rất gọn nhẹ, đúng với tính chất của một thiết bị camera hành trình chính hãng gắn liền với dân phượt. Không còn vỏ bọc giống như GoPro Hero 6 và Hero 7 trước đó, nhưng GoPro 8 vẫn đảm bảo khả năng chống nước ở độ sâu lên đến 10m, thích hợp để quay trong điều kiện thời tiết xấu, lặn quay dưới nước.

Chống nước 10m, màn hình cảm ứng điều khiển bằng giọng nói

Máy có màn hình cảm ứng LCD 2 inch điều khiển bằng giọng nói cùng các chức năng chỉnh sửa nhanh video hoặc hình ảnh ghi được. Trên màn hình, bạn có thể điều chỉnh thu phóng để có khung hình ưng ý nhất chỉ bằng một cú chạm.

GoPro Hero 8 - Khả năng chống rung Hyper Smooth 2.0, quay ban đêm tốt
Chất lượng hình ảnh khi quay phim trên camera GoPro Hero 8 đã có nhiều cải tiến hơn rất nhiều so với dòng Hero 7 trước đây. Trước hết là khả năng khử nhiễu, tuy chưa thực sự tốt nhưng đã cải thiện khá nhiều. Khả năng quay phim đêm với Hyper Smooth mới thật sự là điều làm cho GoPro Hero 8 vượt trội so với phiên bản trước. 

Khả năng chống rung Hyper Smooth, quay ban đêm tốt

Nếu như trên GoPro Hero 7 khi bật chống rung quay ban đêm, hình ảnh sẽ có hiện tượng chồng hình do thuật toán và khả năng xử lý chậm thì trên Hero 8 đã hoàn toàn mượt mà. Người dùng không còn lo ngại giữa việc phải sắm Gimbal để quay ban đêm trong những chuyến du lịch.

Kết nối Wi-Fi, Bluetooth qua ứng dụng GoPro, hỗ trợ mic khử tiếng ồn
Do camera hỗ trợ kết nối Wi-Fi và Bluetooth, thông qua ứng dụng GoPro, những dữ liệu ghi lại bởi GoPro Hero 8 có thể nhanh chóng đồng bộ sang điện thoại, giúp bạn đăng status, nhắn tin trên các nền tảng mạng xã hội thông dụng như Facebook, Messenger, Zalo, Snapchat, Twitter ngay sau khi trải qua những khoảnh khắc đặc biệt.

Kết nối Wi-Fi, Bluetooth qua ứng dụng GoPro, hỗ trợ mic khử tiếng ồn

Ngoài ra, Hero 8 còn có khả năng giảm tiếng ồn gió hiện đại thông qua 2 mic xử lý. Bạn cũng có thể hẹn giờ để chụp ảnh và được cung cấp chế độ Video Time Lapse. Hãng cũng cung cấp cho người dùng tính năng quay ngắn (short clips), với mỗi video dài chỉ 15 hoặc 30 giây.

Camera 12MP hỗ trợ quay 4K 60 fps, chụp HDR
Về ống kính, có khả năng GoPro Hero 8 sẽ được trang bị ống kính chuyên nghiệp có bộ lọc hồng ngoại để chặn các tia hồng ngoại và giảm độ gió. Bên cạnh đó là tăng tốc độ khung hình và khả năng quay 4K 60 fps và Full HD 480 fps. Cùng với đó, Hero 8 còn bổ sung bốn tùy chọn ống kính đó là Thu hẹp, tuyến tính không bị méo, Wide & SuperView.

Camera 12MP hỗ trợ quay 4K 120 fps và Full HD 480 fps, chụp HDR

Không chỉ dừng lại ở những đoạn quay ấn tượng, Hero 8 cũng đã được nâng cấp mạnh mẽ ở phương diện chụp hình với tính năng SuperPhoto cho phép tạo ra những bức hình ấn tượng rõ từng chi tiết tương tự như tính năng HDR. Camera hành trình này có thể chụp ảnh tĩnh ở độ phân giải lên đến 12MP trong các lần chụp tối đa 30 hình ảnh mỗi giây.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (46, N'Camera IP Hồng ngoại WIFI EZVIZ C6N 1080p 2MP', N'790000              ', N'550000              ', N'Camera IP wifi Ezviz C6N 1080p 2MP - Giám sát hồng ngoại hiệu quả vào ban đêm Để tăng khả năng giám sát cả bên trong & bên ngoài căn nhà, bạn hãy sở hữu ngay camera Ezviz C6N. Với khả năng quan sát hồng ngoại 360 độ, camera C6N sẽ giúp bạn theo dõi căn nhà của mình một cách trọn vẹn, bất kể ban ngày hay ban đêm.', N'pk06.jpg                      ', N'Camera độ phân giải 1920 x 1080 pixels với micro và loa đàm thoại 2 chiều tiện dụng
Camera Ezviz có độ phân giải 1920 x 1080 pixels giúp tái tạo hình ảnh sắc nét, giám sát hiệu quả hơn. Với màu sắc chân thực & trực quan sinh động, camera sẽ giúp bạn quan sát mọi góc cạnh trong căn nhà, đảm bảo an tâm mọi lúc mọi nơi.

Chỉ cần lắp đặt, camera sẽ hoạt động liên tục và theo dõi mọi cử chỉ, hành vi bên trong không gian nhà bạn.

Camera độ phân giải 1920 x 1080 pixels với micro và loa đàm thoại 2 chiều tiện dụng

Được tích hợp sẵn trên camera Ezviz C6N đó là micro và loa cho phép bạn đàm thoại hai chiều với âm thanh rõ nét. Ngoài ra, bên trong camera cũng có ống kính Wifi 2MP với tính năng theo dõi chuyển động thông minh nhận diện rõ người lạ vào nhà.

Camera có thể xoay ngang đến 340°, xoay dọc đến 55° và xoay xuống 15°, giúp bạn quan sát đầy đủ không gian xung quanh.

Khả năng nhìn đêm hiệu quả với đèn tia hồng ngoại IP 10m, tính năng bảo vệ riêng tư một chạm
Đặc tính nổi bật của camera an ninh Ezviz C6N đó là khả năng nhìn đêm hiệu quả. Sử dụng đèn hồng ngoại hiệu suất cao cùng hệ thống Smart IR, Ezviz C6N có khả năng quan sát trong môi trường tối hiệu quả với phạm vi tối đa là 10 mét. Đặc biệt, camera cũng sẽ tự động thay đổi chế độ quan sát theo ban ngày hoặc ban đêm.

Khả năng nhìn đêm hiệu quả với đèn tia hồng ngoại IP 10m, tính năng bảo vệ riêng tư một chạm

Camera Ezviz C6N còn có cả màn trập tinh tế cho nhu cầu bảo vệ riêng tư. Chỉ với một chạm, màn trập sẽ tự động che các thấu kính, đảm bảo bạn có được sự riêng tư cần thiết.

Thiết kế dễ dàng lắp đặt, kết nối ứng dụng EZVIZ để có thêm nhiều tính năng khác
Nhờ có thiết kế đế vít cùng khả năng xoay ống kính, camera Ezviz C6N có thể được lắp trên bàn hoặc lắp cố định trên tường, trần nhà một cách dễ dàng. Ngoài ra, hình dáng tròn cùng màu trắng vôi sẽ giúp camera ẩn mình trên tường, tăng thêm tính hiệu quả khi giám sát.

Thiết kế dễ dàng lắp đặt, kết nối ứng dụng EZVIZ để có thêm nhiều tính năng khác

Bạn cũng có thể sử dụng thêm nhiều tính năng khác khi kết nối camera Ezviz C6N với ứng dụng EZVIZ trên điện thoại. Chỉ với vài thao tác cài đặt & kết nối đơn giản, ứng dụng EZVIZ sẽ cho phép bạn giám sát ngay trên điện thoại, phóng to hoặc thu nhỏ góc nhìn, đàm thoại hai chiều, cài đặt cảm biến cảnh báo, lưu trữ video và nhiều hơn nữa.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (47, N'Sạc Aukey 24W 2 cổng USB AIpower PA-U42', N'350000              ', N'220000              ', N'Sạc Aukey 24W 2 cổng USB AIpower PA-U42 – sạc an toàn, thiết kế chống trầy, va đập Aukey là hãng sản suất phụ kiện sạc và thiết bị ngoại vi có nổi tiếng thế giới, sở hữu nhiều công nghệ hiện đại, thiết kế đẹp mắt và tính năng hữu ích. Trong đó có sản phẩm sạc Aukey 24W 2 cổng USB AIpower PA-U42 sở hữu 2 cổng USB công suất lên 24W. Sản phẩm được nhiều người tin dùng và hứa hẹn sẽ là một phụ kiện công nghệ không thể thiếu trong mỗi chúng ta.', N'pk07.jpg                      ', N'Thiết nhỏ gọn, chất liệu chống trầy, chống va đập, công nghệ AiPower tự động điều chỉnh năng lượng đầu ra
Sạc Aukey PA-U42 có thiết kế nhỏ gọn giúp bạn có thể mang theo bất cứ đâu cùng với thiết kế chân cắm dạng EU thật chắc chắn. Thiết bị có hai phiên bản màu trắng và đen dễ dàng lựa chọn. Cả thân sạc được bao bọc xung quanh bởi lớp nhựa bóng cao cấp. Với chất liệu này đem lại cho sạc Aukey PA-U42 khả năng chống va đập, chống trầy xước tốt cũng như độ bền cao.

Thiết nhỏ gọn, chất liệu chống trầy, chống va đập, công nghệ AiPower tự động điều chỉnh năng lượng đầu ra


Công nghệ AiPower điều chỉnh thông minh năng lượng đầu ra cho Aukey PA-U42 để phù hợp với nhu cầu sạc cho từng thiết bị khác nhau. Với đầu ra tối đa 2,4A mỗi thiết bị của bạn sẽ nhận được tốc độ sạc tối đa an toàn nhất có thể.

Phù hợp cho đại đa số thiết bị, công suất lên đến 24W
Sạc Aukey PA-U42 - 2 cổng, 24W được thiết kế để tích hợp với tất cả các thiết bị hỗ trợ USB phổ biến từ iPhone đến điện thoại Android, máy tính bảng, máy chụp ảnh, quay phim, loa Bluetooth, sạc dự phòng, tai nghe,…

Phù hợp cho đại đa số thiết bị, công suất lên đến 24W

Sản phẩm được trang bị hai cổng sạc USB tiêu chuẩn cùng với tổng công suất lên đến 24W. Bạn có thể sạc cùng lúc hai thiết bị mà không bị nóng điện thoại, đảm bảo luôn được nạp đầy pin khi cần dùng.

Sạc an toàn, không rò rỉ tích điện, được bảo hành 24 tháng
Sạc 2 Cổng 24W Aukey PA-U42 được thiết kế mạch tiên tiến, trang bị các biện pháp bảo vệ các thiết bị của bạn khỏi dòng điện quá mức, quá nóng và sạc tràn. Hãng đã tăng cường thêm lớp bảo vệ, kiểm soát nhiệt độ và các tính năng an toàn tiên tiến hơn giữ cho bạn và các thiết bị của bạn khỏi sạc quá dòng, rò rỉ điện.

Sạc an toàn, không rò rỉ tích điện, được bảo hành 24 tháng

Khi bạn sở hữu bất kỳ sạc phẩm nào của Aukey đều được bảo hành 24 tháng. Ngoài ra còn có chế độ bảo hành 1 đổi 1 trong suốt thời gian nếu lỗi do hãng sản xuất. Cho bạn yên tâm sử dụng mà không lo hư hại.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (48, N'Camera Xiaomi Mi Home Security 360 - 1080P', N'1590000             ', N'790000              ', N'Camera an ninh Xiaomi Mi Home Security 360° 1080P - giải pháp an ninh hiệu quả, tiện lợi Trong thời buổi hiện đại ngày nay, nhu cầu sử dụng các thiết bị bảo mật ngày càng cao. Camera Mi Home Security 360 là một trong những sản phẩm nổi bật trong dòng camera giám sát an ninh trên thị trường hiện nay. Sở hữu thiết kế nhỏ gọn, trang nhã, phù hợp sử dụng trong gia đình, cửa hàng kinh doanh, văn phòng làm việc,... Thiết bị hoạt động nhẹ nhàng và yên tĩnh, cùng các tính năng hoàn hảo đáp ứng được mọi nhu cầu sử dụng của người dùng.', N'pk08.jpg                      ', N'Ống kính góc rộng 120°, quay 360° cho góc nhìn cực rộng
Camera Xiaomi Mi Home Security có thiết kế sang trọng với tông màu trắng nổi bật và kích thước nhỏ gọn 78 x 78,16 x 118mm, cùng với chân đế tiện lợi, chắc chắn giúp cho người dùng có thể dễ dàng lắp đặt tại mọi vị trí tùy ý. Thiết bị sử dụng ống kính góc rộng lên đến 120°, kết hợp với khả năng xoay camera 360 theo chiều ngang và 115° theo chiều dọc, trang bị bộ cảm biến quang 2 Megapixel, tiêu cự 3,9mm và hỗ trợ độ phân giải Full HD 1920 x 1080p đảm bảo hình ảnh thu được luôn rõ ràng, sắc nét.

Ống kính góc rộng 120°, quay 360° cho góc nhìn cực rộng

Ngoài ra, thiết bị được trang bị động cơ yên tĩnh giúp cho camera có thể dễ dàng, tự do xoay lên/ xuống, trái/ phải, trước/ sau. Thiết bị còn sử dụng công nghệ low-light true color tiên tiến cho phép người dùng có thể xem được hình ảnh với đầy đủ màu sắc mà không chuyển sang sử dụng các đèn hồng ngoại chỉ chiếu ảnh đen trắng khi đang ở môi trường thiếu ánh sáng.

Trang bị hồng ngoại ban đêm hiện đại
Camera Xiaomi Mi Home Security được trang bị hiện đại với 8 đèn hồng ngoại 940nm, cho phép nhìn trong đêm hiệu quả ở khoảng cách 10m mà không làm ảnh hưởng đến giấc ngủ của người dùng.

Trang bị hồng ngoại ban đêm hiện đại

Ngoài ra, hệ thống đèn hồng ngoại này còn giúp cho khả năng nhìn trong bóng tối của camera giám sát được tốt hơn, giảm nhiễu và tăng chi tiết ảnh.

Hỗ trợ thẻ nhớ MicroSD lên đến 64 GB
Camera Mi Home Security 360 độ được hỗ trợ khả năng lưu trữ với thẻ nhớ SD có dung lượng lên đến 64 GB, giúp cho người dùng có thể thoải mái lưu trữ dữ liệu video thu được, hạn chế vấn đề phải xoá dữ liệu video cũ để mở rộng thêm không gian lưu trữ dữ liệu mới.

Hỗ trợ thẻ nhớ MicroSD lên đến 64 GB

Thiết bị cũng hỗ trợ kho lưu trữ NAS. Tính năng này cho phép bạn xem lại và trích xuất nội dung từ camera dễ dàng hơn. Nhờ sử dụng định mã hóa video thế hệ mới H.265, không gian lưu trữ sẽ được tối ưu lên đến 50% so với thế hệ H.264 truyền thống. Bên cạnh đó, camera vẫn duy trì cung cấp thêm 2 giải pháp lưu trữ khác là đám mây và thông qua router.

Cảm biến phát hiện và theo dõi chuyển động PTZ
Camera Xiaomi Mi Home Security 360° 1080P được trang bị hệ thống nhận dạng chuyển động thông minh thế hệ mới, với sự can thiệp của trí thông minh nhân tạo AI. Với tính năng này, camera có khả năng ghi lại và gửi thông báo về thiết bị của người dùng khi có chuyển động trong khung hình mà camera ghi được. Những thói quen và hoạt động hàng ngày của người dùng sẽ được camera học tập, lấy cơ sở đó việc xác định các chuyển động bất thường sẽ chính xác hơn rất nhiều so với thế hệ trước.

Cảm biến phát hiện và theo dõi chuyển động PTZ

Thiết bị hỗ trợ cho các hệ điều hành Android 4.4 hay IOS 9.0, giúp cho người dùng có thể theo dõi các hình ảnh thu được từ camera trực tiếp qua thiết bị di động của người dùng như điện thoại thông minh hoặc máy tính bảng. Thiết bị giúp bạn quan sát từ xa, mọi lúc mọi nơi thông qua điện thoại di động, camera hỗ trợ động cơ xoay thông minh có thể đặt ngược 180 độ quan sát toàn bộ không gian mà không cần phải lắp thêm một chiếc camera nào nữa.

Chia sẻ camera với tài khoản khác cùng theo dõi qua 3G/4G
Camera 360 sử dụng kết nối Wi-Fi IEEE 802.11 b/g/n tiện lợi ở băng tần 2,4 GHz. Cùng với công nghệ mã hoá video mới cho phép cho việc truyền phát mượt mà hơn và giảm thiểu băng thông mà không gây ảnh hưởng đến chi tiết hình ảnh. Mã hóa H.265 có thể giữ cùng số lượng pixel và tốc độ bit trong khi sử dụng một nửa lưu trữ của mã hóa H.264.

Chia sẻ camera với tài khoản khác cùng theo dõi qua 3G/4G

Camera có khả năng bắt Wifi mạnh tương tự như ở các điện thoại thông minh giúp cho việc kết nối dễ dàng, hình ảnh được truyền tải tới người xem một cách mượt mà dù bạn ở bất cứ nơi đâu. Chế độ quay ban đêm chất lượng cao hỗ trợ bạn thu lại hình ảnh cả trong điều kiện thiếu sáng.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (49, N'Pin sạc dự phòng Polymer 10.000mAh Xiaomi Mi 18W', N'499000              ', N'350000              ', N'Pin sạc dự phòng Xiaomi Gen 3 10000mAh - Hết pin không còn là nỗi lo Bạn đang tìm cho mình một chiếc sạc dự phòng có dung lượng cao đủ cho nhiều lần sử dụng? Bên cạnh đó, các công nghệ hiện đại đi kèm cũng được bạn quan tâm? Sạc dự phòng Xiaomi Gen 3 10000mAh Type C 2019 chính là sự lựa chọn dành cho bạn.', N'pk09.jpg                      ', N'Dung lượng pin 10000mAh, lõi pin tiêu chuẩn đến từ LG/ Panasonic
Tương tự những sản phẩm trước, sạc dự phòng Xiaomi 10000mAh Gen 3 Type C 2019 được trang bị lõi pin Li-Po (Lithium Polymer) đến từ nhà sản xuất hàng đầu như LG/Panasonic. Vì thế bạn có thể an tâm về chất lượng cũng như tuổi thọ của sản phẩm.

Dung lượng pin 10000mAh, lõi pin tiêu chuẩn đến từ LG/ Panasonic

Song song với đó, sạc dự phòng này cũng có dung lượng lên đến 10000mAh. Đây là mức dung lượng pin rất ổn cho một thiết bị pin dự phòng, cho phép bạn có thể dùng để sạc cho iPhone 8 3,5 lần, sạc cho iPhone X 2.5 lần, và Galaxy Note 9 2 lần hơn. Với một thiết bị sạc như thế thì bạn chỉ cần sạc đầy qua đêm là đã có thể sử dụng thoải mái trong một ngày làm việc sau đó.

dung lượng lên đến 10000mAh.

Cổng input USB Type C sạc nhanh 18W, đi kèm 2 cổng ra USB
Một trong những điểm khiến Xiaomi 10000mAh Gen 3 Type C 2019 nổi bật hơn những thiết bị sạc khác, chính là ở khả năng sạc nhanh tối đa 18W thông qua cổng USB Type C. Với 2 cổng sạc vào USB Type C và Micro USB với cường độ 5V - 2.6A, 9V - 2.1A, 12V - 1.5A , hỗ trợ sạc nhanh tối đa 18W. Nhờ đó có thể sạc nhanh cho pin dự phòng.  

Cổng input USB Type C sạc nhanh 18W, đi kèm 2 cổng ra USB

Cùng với 2 cổng sạc vào là 2 đầu ra USB với cường độ 5V - 2.6A, 9V - 2.1A, 12V - 1.5A cũng hỗ trợ sạc nhanh tối đa 18W khi sạc riêng từng cổng. Khi sạc đông thời 2 cổng mực điện áp còn 5V - 2.6A.

Hai cổng sạc trên cũng có khả năng nhận diện thiết bị rất tốt, nhằm đảm bảo nguồn ra chính xác và hợp lý cho từng loại thiết bị khác nhau. Đặc biệt hơn, Xiaomi cũng đảm bảo rằng thiết bị sạc dự phòng của mình sẽ tương thích với hầu hết các loại smartphone có mặt trên thị trường ở thời điểm hiện tại.

Thiết kế tinh tế, nhỏ gọn, liền lạc, cổng sạc xử lý CNC, hệ thống đèn LED
Pin dự phòng Xiaomi Gen 3 10.000mAh có một thiết kế rất nhỏ gọn liền lạc, các đường nét, chi tiết đều được Xiaomi thiết kế rất khéo léo nhằm không đưa đến cho người dùng quá nhiều chi tiết thừa. Thiết bị được kết cấu với một lớp vỏ kim loại có độ bền cấu trúc rất cao, cảm giác cầm trong tay rất mịn màng, mát tay. Bên cạnh đó, trọng lượng của sạc cũng không qua nặng. Bạn có thể cầm thiết bị trên tay mà không cảm giác mỏi, cũng như để trong túi quần mà không ngại cảm giác chật chội, nặng nề.

Thiết kế tinh tế, nhỏ gọn, liền lạc

Những vị trí cổng sạc ra – vào đều được xử lý công nghệ CNC cho cảm giác sang trọng, tinh tế, an tâm từ lần đầu tiên sử dụng. Bên cạnh đó, sạc dự phòng Xiaomi Gen 3 2019 cũng được trang bị 4 đèn LED nhằm thông báo mức pin đang có của thiết bị.

trang bị 4 đèn LED 

Cảm biến RC cho độ chính xác, an toàn cao
Nhờ việc sử dụng cảm biến RC, Xiaomi Gen 3 2019 có thể dễ dàng xử lý các tình huống bất cập như quá nhiệt, chập nhiệt, quá tải, xả quá mức một cách dễ dàng. Song song với đó, cảm biến này cũng có độ chính xác rất cao, cùng với hệ thống mạnh tiên tiến. Bạn có thể an tâm rằng hiệu suất của việc sạc và xả luôn được giữ ở mức ổn định, an tâm nhất có thể.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (50, N'Củ sạc nhanh Xiaomi Zmi Ha716 Type C', N'290000              ', N'180000              ', N'Củ sạc nhanh Xiaomi Zmi HA716 Type C 20W PD – Khả năng sạc nhanh công suất lớn, mạch điện an toàn Củ sạc của bạn vừa mới mất hoặc vừa mới hỏng, nếu muốn tiếp tục sử dụng chiếc điện thoại đang sắp hết pin kia bạn cần mua một củ sạc mới ngay lập tức. Song bạn cần chú ý đến độ tương thích và công suất sạc nhằm gia tăng thời gian sạc cho thiết bị, củ sạc nhanh Xiaomi Zmi HA716 Type C 20W PD đang là ứng cử viên sáng giá để rút ngắn thời gian sạc ngắn nhất.', N'pk10.jpg                      ', N'Trọng lượng chỉ 42.8g, hoàn thiện từ nhựa PC
Củ sạc nhanh Xiaomi Zmi HA716 Type C 20W PD mang một thiết kế cực kỳ nhỏ gọn, cụ thể là trọng lượng chỉ đạt 42.8g. Qua đó, bạn hoàn toàn có thể cầm trên tay dễ dàng, hoặc đút vào trong túi quần và đi đến khắp mọi nơi. Bên cạnh đó, nhằm giúp củ sạc có thể chống chọi được các lực va đập thì hãng sản xuất Xiaomi phủ lớp nhựa PC lên Xiaomi Zmi HA716 Type C.

Trọng lượng chỉ 42.8g, hoàn thiện từ nhựa PC

Củ sạc nhanh Xiaomi Zmi HA716 Type C 20W PD sở hữu màu trắng trang nhã đặc trưng đến từ Xiaomi. Tuy có vẻ ngoài nổi bật nhưng lại rất dễ bị bẩn hay ố vàng qua một thời gian dài sử dụng.

Công suất sạc nhanh lên đến 20W, hỗ trợ PD
Củ sạc nhanh Xiaomi Zmi HA716 Type C 20W PD được tích hợp một đầu sạc USB Type C. Trong tương lai rất nhiều củ sạc sẽ chuyển sang sử dụng cổng Type C vì tính tiện lợi cắm được cả hai đầu và cả khả năng truyền tải dữ liệu ổn định và an toàn hơn gấp nhiều lần so với USB-A.

Hơn hết, công suất sạc nhanh mà nó hỗ trợ lên đến 20W. Qua đó, giúp rút ngắn thời gian sạc pin cho các thiết bị xuống rất nhiều lần, cụ thể củ sạc này cho phép nạp đầy năng lượng của chiếc iPad Pro 11 inch với thời gian đạt còn 2.7 giờ.

Công suất sạc nhanh lên đến 20W, hỗ trợ PD

Chưa dừng lại ở đó, việc sử dụng cổng USB- C đồng nghĩa với việc củ sạc đến từ Xiaomi này có hỗ trợ Power Delivery (PD). Điều này tức là, người dùng có thể sử dụng để được tương thích với cả Android lẫn iPhone (có hỗ trợ sạc nhanh). Củ sạc tự tìm được công suất phù hợp và điều phối năng lượng đến cho thiết bị một cách hợp lý, vừa an toàn vừa nhanh chóng.

Nguồn điện phổ biến, bảo vệ an toàn tuyệt đối
Củ sạc nhanh Xiaomi Zmi HA716 Type C 20W PD được sử dụng jack cắm hai chấu, sử dụng phổ biến khắp nơi tại Việt Nam. Và nguồn điện vào mà củ sạc này tương thích là 100 – 240V, đồng nghĩa với việc nó có thể cắm vừa với bất kỳ nguồn điện nào.

Nguồn điện phổ biến, bảo vệ an toàn tuyệt đối

Hơn nữa, nhằm gia cố độ an toàn cho người dùng và cho thiết bị được sạc, củ sạc nhanh Xiaomi Zmi HA716 Type C 20W PD được trang bị chip sạc an toàn có tác dụng ngăn chặn những sự cố điện thường thấy. Ví dụ như bảo vệ quá áp, bảo vệ quá dòng, ngắn mạch hay quá nhiệt và chống nhiễn điện từ,…', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (51, N'Bộ HUD kính lái Vietmap H1N', N'3490000             ', N'3390000             ', N'Bộ HUD kính lái Vietmap H1N thông minh, tiện ích đồng hành cùng bạn trên mọi chặng đường Bộ HUD Vietmap H1N là một trong những thiết bị thông minh và vô cùng tiện ích giúp cho lái xe nhận biết, kiểm soát được tốc độ di chuyển. Bên cạnh đó camera hành trình Vietmap này còn hiển thị nhiều thông tin hữu ích cũng như cảnh báo nguy hiểm mang đến sự an toàn cho người sử dụng trong mọi chuyến đi.', N'pk11.jpg                      ', N'Thiết kế nhỏ gọn, màn hình hiển thị sắc nét
Được thiết kế nhỏ gọn. Kích thước chỉ 120x80x120mm dễ dàng lắp đặt và không chiếm nhiều diện tích.

Thiết kế nhỏ gọn, màn hình hiển thị sắc nét

Vietmap H1N được trang bị công nghệ hiện đại mang đến khả năng hiển thị nhiều màu sắc vô cùng sắc nét. Bên cạnh đó, thiết bị còn có khả năng hỗ trợ lái xe an toàn ở trong mọi điều kiện ánh sáng khác nhau.

Nhiều tính năng nổi bật, kết nối thông minh
Bộ HUD vietmap kính lái sở hữu nhiều tính năng thông minh như: đồng bộ dẫn đường, theo dõi nhiệt độ két nước, theo dõi điện áp xe, theo dõi trạng thái xe, cảnh báo giới hạn tốc độ, cảnh báo camera cũng như cảnh bảo giao thông,... Vietmap hud h1n sẽ thu thập và cập nhật thường xuyên giúp cho việc lái xe trở nên thuận tiện và an toàn hơn.

Nhiều tính năng nổi bật, kết nối thông minh

Bên cạnh đó, với khả năng kết nối thông minh trên vietmap h1n có thể kết nối cũng như đồng bộ hóa danh bạ với điện thoại. Đặc biệt, thiết bị có thể hiển thị thông tin cuộc gọi đến giúp lái xe thuận tiện theo dõi trong quá trình di chuyển.', 4, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (52, N'Tai nghe không dây Earbuds Cowin Apex Elite', N'2200000             ', N'1340000             ', N'Tai nghe không dây Earbuds Cowin Apex Elite Active BT918 đẳng cấp đến từ chất lượng Cowin là thương hiệu tai nghe khá nổi tiếng với các sản phẩm chất lượng và thiết kế độc đáo. Nếu bạn đang muốn tìm kiếm cho mình một sản phẩm nhà Cowin tiện lợi với nhiều công nghệ hiện đại thì tai nghe không dây Earbuds Cowin Apex Elite Active BT918 là lựa chọn hợp lý dành cho bạn.', N'pk12.jpg                      ', N'Thiết kế công thái học thông minh, tinh tế
Tai nghe không dây Earbuds Cowin Apex Elite Active BT918 được thiết kế sáng tạo theo kiểu công thái học kết hợp với màu đen mang đến sự sang trọng và tinh tế.

Thiết kế công thái học thông minh, tinh tế

Trọng lượng của tai nghe cực nhỏ kết hợp với sự mảnh mai trong thiết kế giúp chúng luôn ôm khít trong tai mà không thấy đau cho dù sử dụng cả ngày dài.

Công nghệ ANC chuyên nghiệp, chất lượng cao
Tai nghe không dây Earbuds Cowin Apex Elite Active BT918 được trang bị công nghệ chống ồn chủ động (ANC) vô cùng chuyên nghiệp và chất lượng. Với công nghệ ANC cải tiến sẽ giúp giảm đáng kể tiếng ồn để bạn thoải mái tận hưởng những bản nhạc tuyệt vời hoặc tập trung vào nội dung bạn đang nghe.

Công nghệ ANC chuyên nghiệp, chất lượng cao

Ngoài ra, với trình điều khiển của tai nghe được tối ưu hóa một cách đáng kể. Từ đó mang lại âm trầm ấn tượng, âm thanh sống động cực kỳ phong phú, độ phân giải cao giúp bạn đắm chìm trong mọi giai điệu.

Pin hiệu suất cao với 6 giờ sử dụng
Tai nghe Earbuds Cowin Apex Elite Active BT918 được trang bị pin siêu nhỏ nhưng lại mang đến hiệu suất cao. Bạn có thể thoải mái sử dụng chúng tới 6 giờ chỉ với một lần sạc. Do đó, bạn có thể mang chúng theo trong bất kỳ nơi đâu.', 4, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (0, N'admin', N'202cb962ac59075b964b07152d234b70                  ', N'admin@gmail.com               ')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (1, N'long', N'202cb962ac59075b964b07152d234b70                  ', N'long@gmail.com                ')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (2, N'abc', N'202cb962ac59075b964b07152d234b70                  ', N'abc@gmail.com                 ')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (3, N'duy', N'202cb962ac59075b964b07152d234b70                  ', N'duy@gmail.com                 ')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (4, N'nhan', N'202cb962ac59075b964b07152d234b70                  ', N'nhan@gmail.com                ')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Orders] FOREIGN KEY([cartID])
REFERENCES [dbo].[Orders] ([cartID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Orders]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Category] ([TypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [BTL] SET  READ_WRITE 
GO
