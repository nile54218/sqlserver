USE [master]
GO
/****** Object:  Database [bikesstore]    Script Date: 16-10-2019 18:54:07 ******/
CREATE DATABASE [bikesstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bikesstore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bikesstore.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bikesstore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bikesstore_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bikesstore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bikesstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bikesstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bikesstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bikesstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bikesstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bikesstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [bikesstore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bikesstore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bikesstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bikesstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bikesstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bikesstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bikesstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bikesstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bikesstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bikesstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bikesstore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bikesstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bikesstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bikesstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bikesstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bikesstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bikesstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bikesstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bikesstore] SET RECOVERY FULL 
GO
ALTER DATABASE [bikesstore] SET  MULTI_USER 
GO
ALTER DATABASE [bikesstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bikesstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bikesstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bikesstore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [bikesstore]
GO
/****** Object:  Schema [production]    Script Date: 16-10-2019 18:54:07 ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [sales]    Script Date: 16-10-2019 18:54:07 ******/
CREATE SCHEMA [sales]
GO
/****** Object:  Table [production].[brands]    Script Date: 16-10-2019 18:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[brands](
	[brand_id] [int] NOT NULL,
	[brand_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[categories]    Script Date: 16-10-2019 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[categories](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[products]    Script Date: 16-10-2019 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[products](
	[product_id] [int] NOT NULL,
	[product_name] [varchar](20) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [numeric](4, 0) NOT NULL,
	[list_price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[stocks]    Script Date: 16-10-2019 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[customers]    Script Date: 16-10-2019 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[phone] [numeric](10, 0) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[street] [varchar](20) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[state] [varchar](20) NOT NULL,
	[zip_code] [numeric](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[order_items]    Script Date: 16-10-2019 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [int] NOT NULL,
	[discount] [int] NOT NULL,
	[item_amount]  AS ([quantity]*[list_price]-[discount]),
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[orders]    Script Date: 16-10-2019 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[orders](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_status] [varchar](20) NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NOT NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[staffs]    Script Date: 16-10-2019 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[staffs](
	[staff_id] [int] NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [numeric](10, 0) NOT NULL,
	[active] [varchar](20) NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[stores]    Script Date: 16-10-2019 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[stores](
	[store_id] [int] NOT NULL,
	[store_name] [varchar](20) NOT NULL,
	[phone] [numeric](10, 0) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[street] [varchar](20) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[state] [varchar](20) NOT NULL,
	[zip_code] [numeric](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [production].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_brand] FOREIGN KEY([brand_id])
REFERENCES [production].[brands] ([brand_id])
GO
ALTER TABLE [production].[products] CHECK CONSTRAINT [fk_products_brand]
GO
ALTER TABLE [production].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_categories] FOREIGN KEY([category_id])
REFERENCES [production].[categories] ([category_id])
GO
ALTER TABLE [production].[products] CHECK CONSTRAINT [fk_products_categories]
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD  CONSTRAINT [fk_stocks_products] FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
GO
ALTER TABLE [production].[stocks] CHECK CONSTRAINT [fk_stocks_products]
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD  CONSTRAINT [fk_stocks_store] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [production].[stocks] CHECK CONSTRAINT [fk_stocks_store]
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD  CONSTRAINT [fk_orderitem_products] FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
GO
ALTER TABLE [sales].[order_items] CHECK CONSTRAINT [fk_orderitem_products]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_customer] FOREIGN KEY([customer_id])
REFERENCES [sales].[customers] ([customer_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [fk_orders_customer]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_staff] FOREIGN KEY([staff_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [fk_orders_staff]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_store] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [fk_orders_store]
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD  CONSTRAINT [fk_store_staff] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [sales].[staffs] CHECK CONSTRAINT [fk_store_staff]
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD CHECK  (([list_price]>(0)))
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
USE [master]
GO
ALTER DATABASE [bikesstore] SET  READ_WRITE 
GO
