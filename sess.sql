USE [master]
GO
/****** Object:  Database [Абоненты_Слипченко]    Script Date: 20.12.2022 12:02:36 ******/
CREATE DATABASE [Абоненты_Слипченко]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Абоненты_Слипченко', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты_Слипченко.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Абоненты_Слипченко_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты_Слипченко_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Абоненты_Слипченко] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Абоненты_Слипченко].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Абоненты_Слипченко] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET ARITHABORT OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Абоненты_Слипченко] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Абоненты_Слипченко] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Абоненты_Слипченко] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Абоненты_Слипченко] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET RECOVERY FULL 
GO
ALTER DATABASE [Абоненты_Слипченко] SET  MULTI_USER 
GO
ALTER DATABASE [Абоненты_Слипченко] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Абоненты_Слипченко] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Абоненты_Слипченко] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Абоненты_Слипченко] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Абоненты_Слипченко] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Абоненты_Слипченко', N'ON'
GO
ALTER DATABASE [Абоненты_Слипченко] SET QUERY_STORE = OFF
GO
USE [Абоненты_Слипченко]
GO
/****** Object:  Table [dbo].[абоненты]    Script Date: 20.12.2022 12:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[абоненты](
	[Номер_абонента] [int] NOT NULL,
	[ФИО_абонента] [nvarchar](50) NULL,
	[Адрес] [text] NULL,
 CONSTRAINT [PK_абоненты] PRIMARY KEY CLUSTERED 
(
	[Номер_абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[договора]    Script Date: 20.12.2022 12:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[договора](
	[Номер_договора] [text] NULL,
	[Дата_Установки_телефона] [date] NULL,
	[Номер_телефона] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[разговоры]    Script Date: 20.12.2022 12:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[разговоры](
	[Номер_разговора] [int] NOT NULL,
	[Дата_разговора] [date] NULL,
	[Продолжительность] [int] NULL,
	[Код_города] [int] NULL,
	[Название_города] [text] NULL,
 CONSTRAINT [PK_разговоры] PRIMARY KEY CLUSTERED 
(
	[Номер_разговора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[тариф]    Script Date: 20.12.2022 12:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[тариф](
	[Тариф] [int] NULL,
	[Оплата] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[добавление_абонента]    Script Date: 20.12.2022 12:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[добавление_абонента]
@nomer int,
@fio nvarchar(50),
@adres text
	as
	begin
	insert into [dbo].[абоненты]([Номер_абонента],[ФИО_абонента],[Адрес])
	values (@nomer, @fio, @adres)
	end
GO
/****** Object:  StoredProcedure [dbo].[удаление_абонента]    Script Date: 20.12.2022 12:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE PROCEDURE добавление_абонента
--@nomer int,
--@fio nvarchar(50),
--@adres text
--	as
--	begin
--	insert into [dbo].[абоненты]([Номер_абонента],[ФИО_абонента],[Адрес])
--	values (@nomer, @fio, @adres)
--	end

create procedure [dbo].[удаление_абонента]
@nomer int
as
begin 
delete from [dbo].[абоненты]
where [Номер_абонента] = @nomer
end
GO
USE [master]
GO
ALTER DATABASE [Абоненты_Слипченко] SET  READ_WRITE 
GO
