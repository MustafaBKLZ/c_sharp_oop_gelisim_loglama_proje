USE [master]
GO
/****** Object:  Database [URUN_AGACI_DB]    Script Date: 4.07.2020 22:22:49 ******/
CREATE DATABASE [URUN_AGACI_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'URUN_AGACI_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\URUN_AGACI_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'URUN_AGACI_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\URUN_AGACI_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [URUN_AGACI_DB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [URUN_AGACI_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [URUN_AGACI_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [URUN_AGACI_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [URUN_AGACI_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [URUN_AGACI_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [URUN_AGACI_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [URUN_AGACI_DB] SET  MULTI_USER 
GO
ALTER DATABASE [URUN_AGACI_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [URUN_AGACI_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [URUN_AGACI_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [URUN_AGACI_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [URUN_AGACI_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [URUN_AGACI_DB] SET QUERY_STORE = OFF
GO
USE [URUN_AGACI_DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [URUN_AGACI_DB]
GO
/****** Object:  Table [dbo].[URUN_AGACI_DETAY]    Script Date: 4.07.2020 22:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URUN_AGACI_DETAY](
	[uad_ID] [int] IDENTITY(1,1) NOT NULL,
	[uad_uam_Kod] [nvarchar](50) NULL,
	[uad_uam_Versiyon] [nvarchar](50) NULL,
	[uad_Parca_Sira] [int] NULL,
	[uad_Parca_No] [nvarchar](50) NULL,
	[uad_Parca_Ismi] [nvarchar](50) NULL,
	[uad_Miktar] [float] NULL,
	[uad_Parca_Maliyet] [float] NULL,
	[uad_Aciklama] [nvarchar](50) NULL,
 CONSTRAINT [PK_URUN_AGACI_DETAY] PRIMARY KEY CLUSTERED 
(
	[uad_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URUN_AGACI_MASTER]    Script Date: 4.07.2020 22:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URUN_AGACI_MASTER](
	[uam_ID] [int] IDENTITY(1,1) NOT NULL,
	[uam_Versiyon] [int] NULL,
	[uam_Kod] [nvarchar](50) NULL,
	[uam_Adi] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Urun_Agaci_Detaylari]    Script Date: 4.07.2020 22:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Bu kısım orjinal tablolar. Ana kaydın tutulduğu yer. Her ürün ağacı için tek bir kayıt olur
-- MASTER
-- select * from URUN_AGACI_MASTER


-- DETAY
-- Master tablodan seçilen satırdaki uad_uam_Kod ve uad_uam_Versiyon bilgisine göre detay tablosundan veri alınır.
-- select * from dbo.Urun_Agaci_Detaylari('AGC1058' , 1)



CREATE	 FUNCTION [dbo].[Urun_Agaci_Detaylari]
(	
	@kod as nvarchar(50),
	@versiyon as int
)
RETURNS TABLE 
AS
RETURN 
(
select 
       uad_ID as ID
	  ,[uad_uam_Kod] as Kod
	  ,(select top 1 uam_Adi from URUN_AGACI_MASTER where uad_uam_Kod = @kod ) as Adi -- alt sorgu olduğundan sadece bir hücre veri geliyor olması lazım  yani scalar olması gerek.
      ,[uad_uam_Versiyon] as Versiyon
      ,[uad_Parca_Sira] as [Parça Sıra]
      ,[uad_Parca_No] as [Parça No]
      ,[uad_Parca_Ismi] as [Parça İsmi]
      ,[uad_Miktar] as [Miktar]
      ,[uad_Parca_Maliyet] as [Parça Maliyet]
      ,[uad_Aciklama] as [Aciklama]	 
 from URUN_AGACI_DETAY where uad_uam_Kod = @kod and uad_uam_Versiyon = @versiyon
)
GO
/****** Object:  Table [dbo].[URUN_AGACI_DETAY_Log]    Script Date: 4.07.2020 22:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URUN_AGACI_DETAY_Log](
	[uad_ID] [int] IDENTITY(1,1) NOT NULL,
	[uad_uam_Versiyon] [nvarchar](50) NULL,
	[uad_uam_Rev_No] [int] NULL,
	[uad_uam_Kod] [nvarchar](50) NULL,
	[uad_Parca_Sira] [int] NULL,
	[uad_Parca_No] [nvarchar](50) NULL,
	[uad_Parca_Ismi] [nvarchar](50) NULL,
	[uad_Miktar] [float] NULL,
	[uad_Parca_Maliyet] [float] NULL,
	[uad_Aciklama] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URUN_AGACI_MASTER_Log]    Script Date: 4.07.2020 22:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URUN_AGACI_MASTER_Log](
	[uam_ID] [int] IDENTITY(1,1) NOT NULL,
	[uam_Versiyon] [int] NULL,
	[uam_Rev_No] [int] NULL,
	[uam_Rev_User] [nvarchar](50) NULL,
	[uam_Rev_Date] [datetime] NULL,
	[uam_Kod] [nvarchar](50) NULL,
	[uam_Adi] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Urun_Agaci_Detaylari_Log]    Script Date: 4.07.2020 22:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Bu kısım log tablolar. log kayıtlarının tutulduğu yer. Her ürün ağacı için bir çok kayıt olur
 --MASTER_log
-- select * from URUN_AGACI_MASTER_Log


-- DETAY_log
-- Master tablodan seçilen satırdaki uad_uam_Kod, uad_uam_Versiyon ve uad_uam_Rev_No bilgisine göre detay tablosundan veri alınır.
-- select * from dbo.[Urun_Agaci_Detaylari_Log]('AGC1058', 1,1)



CREATE FUNCTION [dbo].[Urun_Agaci_Detaylari_Log]
(	
	@kod as nvarchar(50),
	@versiyon as int,
	@revizyon as int
)
RETURNS TABLE 
AS
RETURN 
(
select 
       [uad_uam_Kod] as Kod
	  ,(select top 1 uam_Adi from URUN_AGACI_MASTER_Log where uad_uam_Kod = @kod) as Adi
      ,[uad_uam_Versiyon] as Versiyon
	  ,[uad_uam_Rev_No] as RevNo
      ,[uad_Parca_Sira] as [Parça Sıra]
      ,[uad_Parca_No] as [Parça No]
      ,[uad_Parca_Ismi] as [Parça İsmi]
      ,[uad_Miktar] as [Miktar]
      ,[uad_Parca_Maliyet] as [Parça Maliyet]
      ,[uad_Aciklama] as [Aciklama]	 
 from URUN_AGACI_DETAY_Log where uad_uam_Kod = @kod and uad_uam_Versiyon = @versiyon and uad_uam_Rev_No = @revizyon
)
GO
SET IDENTITY_INSERT [dbo].[URUN_AGACI_DETAY] ON 

INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (1, N'AGC1058', N'1', 9, N'ST106121', N'B', 1, 200, N' 1. VERSİYONUN 5. REVİZYONU')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (2, N'AGC1058', N'1', 9, N'ST106189', N'B', 10, 55, N' ASDASD ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (3, N'AGC1058', N'1', 3, N'ST108965', N'C', 9, 80, N' ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (4, N'AGC1058', N'1', 4, N'ST123587', N'D', 10, 25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (5, N'AGC1058', N'1', 5, N'ST985642', N'E', 56, 0.25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (6, N'AGC1058', N'1', 6, N'ST123554', N'F', 34, 0.99, N' ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (7, N'AGC1058', N'1', 7, N'ST985627', N'G', 7, 56, N' ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (8, N'AGC1058', N'1', 8, N'ST198765', N'H', 8, 65, N' ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (9, N'OSA-00001', N'1', 1, N'ST00001', N'X', 25, 5, N'PARÇA 1')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (10, N'OSA-00001', N'1', 2, N'ST00002', N'Y', 25, 5, N'PARÇA 1')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (11, N'OSA-00001', N'1', 3, N'ST00003', N'Z', 5, 25, N'PARÇA 1')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (12, N'OSA-00002', N'1', 6, N'AAAAA', N'GG', 50, 100, N'11')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (13, N'OSA-00002', N'1', 6, N'QQQQQ', N'H', 1, 567, N'1')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (15, N'OSA-00002', N'1', 6, N'3345GGG', N'FSDFS', 50, 0, N'313123')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (16, N'OSA-0003', N'1', 1, N'00001', N'X', 5, 55, N'PARÇA 1')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (17, N'23124', N'1', 1, N'123', N'123415 ', 5, 6, N'12312 3123')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (18, N'AGC1058', N'1', 9, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (19, N'AGC1058', N'1', 10, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (20, N'AGC1058', N'1', 11, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (21, N'OSA-00002', N'1', 4, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (22, N'OSA-00002', N'1', 5, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (23, N'OSA-00004', N'1', 1, N'123', N'123', 3, 3, N'213')
INSERT [dbo].[URUN_AGACI_DETAY] ([uad_ID], [uad_uam_Kod], [uad_uam_Versiyon], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (24, N'OSA-00004', N'1', 2, N'123', N'123', 3, 3, N'213')
SET IDENTITY_INSERT [dbo].[URUN_AGACI_DETAY] OFF
SET IDENTITY_INSERT [dbo].[URUN_AGACI_DETAY_Log] ON 

INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (52, N'1', 5, N'AGC1058', 9, N'ST106121', N'A', 7, 165, N' 1. VERSİYONUN 5. REVİZYONU')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (53, N'1', 5, N'AGC1058', 9, N'ST106189', N'B', 10, 55, N' ASDASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (54, N'1', 5, N'AGC1058', 3, N'ST108965', N'C', 9, 80, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (55, N'1', 5, N'AGC1058', 4, N'ST123587', N'D', 10, 25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (56, N'1', 5, N'AGC1058', 5, N'ST985642', N'E', 56, 0.25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (57, N'1', 5, N'AGC1058', 6, N'ST123554', N'F', 34, 0.99, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (58, N'1', 5, N'AGC1058', 7, N'ST985627', N'G', 7, 56, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (59, N'1', 5, N'AGC1058', 8, N'ST198765', N'H', 8, 65, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (114, N'1', 2, N'OSA-00004', 1, N'123', N'123', 3, 3, N'213')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (60, N'1', 6, N'AGC1058', 9, N'ST106121', N'B', 1, 200, N' 1. VERSİYONUN 5. REVİZYONU')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (61, N'1', 6, N'AGC1058', 9, N'ST106189', N'B', 10, 55, N' ASDASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (62, N'1', 6, N'AGC1058', 3, N'ST108965', N'C', 9, 80, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (63, N'1', 6, N'AGC1058', 4, N'ST123587', N'D', 10, 25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (64, N'1', 6, N'AGC1058', 5, N'ST985642', N'E', 56, 0.25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (65, N'1', 6, N'AGC1058', 6, N'ST123554', N'F', 34, 0.99, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (66, N'1', 6, N'AGC1058', 7, N'ST985627', N'G', 7, 56, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (67, N'1', 6, N'AGC1058', 8, N'ST198765', N'H', 8, 65, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (68, N'1', 7, N'AGC1058', 9, N'ST106121', N'B', 1, 200, N' 1. VERSİYONUN 5. REVİZYONU')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (69, N'1', 7, N'AGC1058', 9, N'ST106189', N'B', 10, 55, N' ASDASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (70, N'1', 7, N'AGC1058', 3, N'ST108965', N'C', 9, 80, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (71, N'1', 7, N'AGC1058', 4, N'ST123587', N'D', 10, 25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (72, N'1', 7, N'AGC1058', 5, N'ST985642', N'E', 56, 0.25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (73, N'1', 7, N'AGC1058', 6, N'ST123554', N'F', 34, 0.99, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (74, N'1', 7, N'AGC1058', 7, N'ST985627', N'G', 7, 56, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (75, N'1', 7, N'AGC1058', 8, N'ST198765', N'H', 8, 65, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (76, N'1', 7, N'AGC1058', 9, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (77, N'1', 8, N'AGC1058', 9, N'ST106121', N'B', 1, 200, N' 1. VERSİYONUN 5. REVİZYONU')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (78, N'1', 8, N'AGC1058', 9, N'ST106189', N'B', 10, 55, N' ASDASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (79, N'1', 8, N'AGC1058', 3, N'ST108965', N'C', 9, 80, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (80, N'1', 8, N'AGC1058', 4, N'ST123587', N'D', 10, 25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (81, N'1', 8, N'AGC1058', 5, N'ST985642', N'E', 56, 0.25, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (82, N'1', 8, N'AGC1058', 6, N'ST123554', N'F', 34, 0.99, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (83, N'1', 8, N'AGC1058', 7, N'ST985627', N'G', 7, 56, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (84, N'1', 8, N'AGC1058', 8, N'ST198765', N'H', 8, 65, N' ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (85, N'1', 8, N'AGC1058', 9, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (86, N'1', 8, N'AGC1058', 10, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (87, N'1', 1, N'OSA-00002', 4, N'ASDASD', N'GG', 33, 22, N'11')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (88, N'1', 1, N'OSA-00002', 2, N'FDHDH', N'H', 1, 567, N'1')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (89, N'1', 1, N'OSA-00002', 3, N'3345GGG', N'FSDFS', 1, 22, N'313123')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (90, N'1', 2, N'OSA-00002', 4, N'ASDASD', N'GG', 33, 22, N'11')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (91, N'1', 2, N'OSA-00002', 2, N'FDHDH', N'H', 1, 567, N'1')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (92, N'1', 2, N'OSA-00002', 3, N'3345GGG', N'FSDFS', 1, 22, N'313123')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (93, N'1', 2, N'OSA-00002', 4, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (94, N'1', 3, N'OSA-00002', 4, N'ASDASD', N'GG', 33, 22, N'11')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (95, N'1', 3, N'OSA-00002', 2, N'FDHDH', N'H', 1, 567, N'1')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (96, N'1', 3, N'OSA-00002', 3, N'3345GGG', N'FSDFS', 1, 22, N'313123')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (97, N'1', 3, N'OSA-00002', 4, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (98, N'1', 3, N'OSA-00002', 5, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (99, N'1', 4, N'OSA-00002', 4, N'ASDASD', N'GG', 33, 22, N'11')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (100, N'1', 4, N'OSA-00002', 6, N'QQQQQ', N'H', 1, 567, N'1')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (101, N'1', 4, N'OSA-00002', 3, N'3345GGG', N'FSDFS', 1, 22, N'313123')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (102, N'1', 4, N'OSA-00002', 4, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (103, N'1', 4, N'OSA-00002', 5, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (104, N'1', 5, N'OSA-00002', 6, N'AAAAA', N'GG', 33, 22, N'11')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (105, N'1', 5, N'OSA-00002', 6, N'QQQQQ', N'H', 1, 567, N'1')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (106, N'1', 5, N'OSA-00002', 3, N'3345GGG', N'FSDFS', 1, 22, N'313123')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (107, N'1', 5, N'OSA-00002', 4, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (108, N'1', 5, N'OSA-00002', 5, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (109, N'1', 6, N'OSA-00002', 6, N'AAAAA', N'GG', 33, 22, N'11')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (110, N'1', 6, N'OSA-00002', 6, N'QQQQQ', N'H', 1, 567, N'1')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (111, N'1', 6, N'OSA-00002', 6, N'3345GGG', N'FSDFS', 50, 0, N'313123')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (112, N'1', 6, N'OSA-00002', 4, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
INSERT [dbo].[URUN_AGACI_DETAY_Log] ([uad_ID], [uad_uam_Versiyon], [uad_uam_Rev_No], [uad_uam_Kod], [uad_Parca_Sira], [uad_Parca_No], [uad_Parca_Ismi], [uad_Miktar], [uad_Parca_Maliyet], [uad_Aciklama]) VALUES (113, N'1', 6, N'OSA-00002', 5, N'ASDASF', N'HH', 5, 5, N'ASD ADA ASD ')
SET IDENTITY_INSERT [dbo].[URUN_AGACI_DETAY_Log] OFF
SET IDENTITY_INSERT [dbo].[URUN_AGACI_MASTER] ON 

INSERT [dbo].[URUN_AGACI_MASTER] ([uam_ID], [uam_Versiyon], [uam_Kod], [uam_Adi]) VALUES (1, 1, N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI ')
INSERT [dbo].[URUN_AGACI_MASTER] ([uam_ID], [uam_Versiyon], [uam_Kod], [uam_Adi]) VALUES (2, 1, N'OSA-00001', N'OYUNCAN SPOR ARABA BMV')
INSERT [dbo].[URUN_AGACI_MASTER] ([uam_ID], [uam_Versiyon], [uam_Kod], [uam_Adi]) VALUES (3, 1, N'OSA-00002', N'OYUNCAK SPOR ARABA MERCEDES BENZ2')
INSERT [dbo].[URUN_AGACI_MASTER] ([uam_ID], [uam_Versiyon], [uam_Kod], [uam_Adi]) VALUES (4, 1, N'OSA-0003', N'OYUNCAK SPOR ARABA FİAT')
INSERT [dbo].[URUN_AGACI_MASTER] ([uam_ID], [uam_Versiyon], [uam_Kod], [uam_Adi]) VALUES (5, 1, N'23124', N'2314213')
INSERT [dbo].[URUN_AGACI_MASTER] ([uam_ID], [uam_Versiyon], [uam_Kod], [uam_Adi]) VALUES (6, 1, N'OSA-00004', N'OYUNCAK SPOR ARABA BMW320')
SET IDENTITY_INSERT [dbo].[URUN_AGACI_MASTER] OFF
SET IDENTITY_INSERT [dbo].[URUN_AGACI_MASTER_Log] ON 

INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (29, 1, 1, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'OSA-00004', N'OYUNCAK SPOR ARABA BMW320')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (30, 1, 2, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'OSA-00004', N'OYUNCAK SPOR ARABA BMW320')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (13, 1, 1, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI 7')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (14, 1, 2, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI 8')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (15, 1, 3, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI 1')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (16, 1, 4, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI 2')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (19, 1, 5, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI ')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (20, 1, 6, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI ')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (21, 1, 7, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI ')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (22, 1, 8, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'AGC1058', N'OYUNCAK SPOR ARABA ÜRÜN AĞACI ')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (23, 1, 1, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'OSA-00002', N'OYUNCAK SPOR ARABA MERCEDES BENZ2')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (24, 1, 2, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'OSA-00002', N'OYUNCAK SPOR ARABA MERCEDES BENZ2')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (25, 1, 3, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'OSA-00002', N'OYUNCAK SPOR ARABA MERCEDES BENZ2')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (26, 1, 4, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'OSA-00002', N'OYUNCAK SPOR ARABA MERCEDES BENZ2')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (27, 1, 5, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'OSA-00002', N'OYUNCAK SPOR ARABA MERCEDES BENZ2')
INSERT [dbo].[URUN_AGACI_MASTER_Log] ([uam_ID], [uam_Versiyon], [uam_Rev_No], [uam_Rev_User], [uam_Rev_Date], [uam_Kod], [uam_Adi]) VALUES (28, 1, 6, N'MUSTAFA', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'OSA-00002', N'OYUNCAK SPOR ARABA MERCEDES BENZ2')
SET IDENTITY_INSERT [dbo].[URUN_AGACI_MASTER_Log] OFF
USE [master]
GO
ALTER DATABASE [URUN_AGACI_DB] SET  READ_WRITE 
GO
