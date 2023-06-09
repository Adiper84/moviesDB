USE [master]
GO
/****** Object:  Database [dbMovies]    Script Date: 14/06/2023 21:44:28 ******/
CREATE DATABASE [dbMovies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbMovies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbMovies.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbMovies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbMovies_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbMovies] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbMovies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbMovies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbMovies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbMovies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbMovies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbMovies] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbMovies] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbMovies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbMovies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbMovies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbMovies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbMovies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbMovies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbMovies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbMovies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbMovies] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbMovies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbMovies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbMovies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbMovies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbMovies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbMovies] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbMovies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbMovies] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbMovies] SET  MULTI_USER 
GO
ALTER DATABASE [dbMovies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbMovies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbMovies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbMovies] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbMovies] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbMovies] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbMovies] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbMovies] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbMovies]
GO
/****** Object:  Table [dbo].[movies]    Script Date: 14/06/2023 21:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[director] [nvarchar](50) NOT NULL,
	[genre] [nvarchar](50) NOT NULL,
	[length] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_movies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 14/06/2023 21:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[oid] [int] IDENTITY(1,1000) NOT NULL,
	[mid] [int] NOT NULL,
	[uid] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14/06/2023 21:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[uid] [nvarchar](50) NOT NULL,
	[fname] [nvarchar](50) NOT NULL,
	[lname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[movies] ON 

INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (1, N'a', N'milo', N'punkcrock', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (2, N'aa', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (3, N'aaa', N'milo', N'asswipe', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (4, N'b', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (5, N'bbb', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (6, N'bbbbbb', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (7, N'ffff', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (8, N'dddd', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (9, N'eeee', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (10, N'qqq', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (11, N'ssss', N'222asdasd', N'babasd', 544, N'asdasdad', N'www.gggg.gggg')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (12, N'aaaaaqqqqq', N'asd', N'a', 122, N'aaaaaa', N'asdasd')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (13, N'new movie', N'David Fincherasd', N'tragedy', 100, N'must watch seret tov', N'')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (14, N'plese', N'damnit', N'make', 432, N'it work god', N'')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (15, N'more', N'more', N'more', 666, N'moremroe', N'')
INSERT [dbo].[movies] ([id], [name], [director], [genre], [length], [description], [image]) VALUES (16, N'add', N'nissim page', N'newnewnew', 1, N'ahhahahhh', N'sssssss')
SET IDENTITY_INSERT [dbo].[movies] OFF
GO
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'111111111', N'admin', N'admin', N'admin@admin.admin', N'11111')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'111111112', N'admin', N'admin', N'admin@admin.admin', N'11111')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'111111113', N'Adi', N'Perevitsky', N'peadi9@gmail.com', N'11111')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'222222222', N'asdads', N'asdasd', N'ad@asd.com', N'12345')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_users]    Script Date: 14/06/2023 21:44:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_users] ON [dbo].[users]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_movies] FOREIGN KEY([mid])
REFERENCES [dbo].[movies] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_movies]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([uid])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
USE [master]
GO
ALTER DATABASE [dbMovies] SET  READ_WRITE 
GO
