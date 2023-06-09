USE [master]
GO
/****** Object:  Database [dbMovies]    Script Date: 06/07/2023 12:09:24 ******/
CREATE DATABASE [dbMovies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbMovies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbMovies.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[genres]    Script Date: 06/07/2023 12:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[gid] [int] NOT NULL,
	[gname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_genres] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movies]    Script Date: 06/07/2023 12:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[director] [nvarchar](50) NOT NULL,
	[length] [int] NOT NULL,
	[description] [nvarchar](300) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_movies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movies_genres]    Script Date: 06/07/2023 12:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies_genres](
	[mid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[m_gid] [int] IDENTITY(41,1) NOT NULL,
 CONSTRAINT [PK_movies_genres] PRIMARY KEY CLUSTERED 
(
	[m_gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 06/07/2023 12:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[oid] [int] IDENTITY(1000,1) NOT NULL,
	[mid] [int] NULL,
	[uid] [nvarchar](50) NULL,
	[date] [date] NULL,
	[tickets] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 06/07/2023 12:09:24 ******/
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
INSERT [dbo].[genres] ([gid], [gname]) VALUES (1, N'Action')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (2, N'Drama')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (3, N'Comedy')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (4, N'Thriller')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (5, N'Romance')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (6, N'Fantasy')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (7, N'Adventure')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (8, N'Science Fiction')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (9, N'Crime')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (10, N'History')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (11, N'Biography')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (12, N'Horror')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (13, N'Documentary')
INSERT [dbo].[genres] ([gid], [gname]) VALUES (14, N'Western')
GO
SET IDENTITY_INSERT [dbo].[movies] ON 

INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (1, N'The Godfather: Part II', N'Francis Ford Coppola', 202, N'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', N'The Godfather Part II.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (2, N'The Silence of the Lambs', N'Jonathan Demme', 118, N'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', N'The Silence of the Lambs.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (4, N'The Green Mile', N'Frank Darabont', 189, N'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', N'The Green Mile.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (5, N'The Godfather', N'Francis Ford Coppola', 175, N'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', N'The Godfather.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (6, N'The Shawshank Redemption', N'Frank Darabont', 142, N'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', N'The Shawshank Redemption.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (7, N'The Dark Knight', N'Christopher Nolan', 152, N'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', N'The Dark Knight.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (8, N'Inception', N'Christopher Nolan', 148, N'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.', N'Inception.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (9, N'Fight Club', N'David Fincher', 139, N'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.', N'Fight Club.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (10, N'Star Wars: Episode IV - A New Hope', N'George Lucas', 121, N'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire''s world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.', N'Star Wars Episode IV - A New Hope.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (11, N'The Lord of the Rings: The Two Towers', N'Peter Jackson', 179, N'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.', N'The Lord of the Rings The Two Towers.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (12, N'The Matrix', N'Lana Wachowski, Lilly Wachowski', 136, N'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', N'The Matrix.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (13, N'Chasing Mavericks', N'Curtis Hanson', 116, N'Chasing Mavericks is a biographical drama based on the life of surfer Jay Moriarity and his quest to ride the famous Mavericks surf break.', N'Chasing Mavericks.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (14, N'Step Into Liquid', N'Dana Brown', 88, N'Step Into Liquid is a documentary film about the history, culture, and beauty of surfing.', N'Step Into Liquid.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (15, N'Blue Crush', N'John Stockwell', 104, N'Blue Crush is a drama film following the story of a young woman pursuing her dreams of becoming a professional surfer.', N'Blue Crush.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (16, N'Riding Giants', N'Stacy Peralta', 105, N'Riding Giants is a documentary that explores the history and evolution of big wave surfing, featuring interviews with legendary surfers.', N'Riding Giants.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (18, N'The Lord of the Rings: The Fellowship of the Ring', N'Peter Jackson', 178, N'A meek hobbit of the Shire and eight companions set out on a journey to Mount Doom to destroy the One Ring and the dark lord Sauron.', N'TheLordoftheRings The Fellowship of the Ring.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (21, N'Pulp Fiction', N'Quentin Tarantino', 154, N'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', N'Pulp Fiction.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (22, N'Forrest Gump', N'Robert Zemeckis', 142, N'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', N'Forrest Gump.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (48, N'Schindler''s List', N'Steven Spielberg', 195, N'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', N'Schindler''s List.jpg')
INSERT [dbo].[movies] ([id], [name], [director], [length], [description], [image]) VALUES (49, N'The Endless Summer', N'Bruce Brown', 95, N'Join surfers Mike and Robert on an epic global journey in search of the perfect wave. This classic documentary captures the thrill of riding the waves and the spirit of adventure. Directed by Bruce Brown.', N'The Endless Summer.jpg')
SET IDENTITY_INSERT [dbo].[movies] OFF
GO
SET IDENTITY_INSERT [dbo].[movies_genres] ON 

INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (1, 2, 1)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (1, 9, 2)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (2, 2, 3)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (2, 4, 4)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (2, 9, 5)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (4, 2, 9)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (4, 6, 10)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (4, 9, 11)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (5, 2, 12)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (5, 9, 13)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (6, 2, 14)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (7, 1, 15)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (7, 2, 16)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (7, 9, 17)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (8, 1, 18)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (8, 7, 19)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (8, 8, 20)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (9, 2, 21)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (10, 1, 22)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (10, 6, 23)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (10, 7, 24)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (11, 2, 25)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (11, 6, 26)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (11, 7, 27)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (12, 1, 28)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (12, 8, 29)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (13, 11, 30)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (14, 13, 31)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (15, 2, 32)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (16, 13, 33)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (18, 2, 34)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (18, 6, 35)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (18, 7, 36)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (21, 2, 37)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (21, 9, 38)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (22, 2, 39)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (22, 5, 40)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (48, 11, 104)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (48, 2, 105)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (48, 10, 106)
INSERT [dbo].[movies_genres] ([mid], [gid], [m_gid]) VALUES (49, 13, 107)
SET IDENTITY_INSERT [dbo].[movies_genres] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5033, 2, N'111111111', CAST(N'2022-10-12' AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5035, 2, N'111111111', CAST(N'2022-10-12' AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5038, 9, N'888888888', CAST(N'2023-06-28' AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5039, 21, N'888888888', CAST(N'2023-06-26' AS Date), 2)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5040, 13, N'888888888', CAST(N'2023-06-27' AS Date), 1)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5041, 15, N'888888888', CAST(N'2023-06-29' AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5042, 4, N'888888888', CAST(N'2023-06-25' AS Date), 2)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5043, 11, N'888888888', CAST(N'2023-06-27' AS Date), 4)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5045, 4, N'111111113', CAST(N'2023-11-12' AS Date), 4)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5049, 15, N'111111111', CAST(N'2023-06-28' AS Date), 1)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5050, 13, N'111111111', CAST(N'2023-06-29' AS Date), 2)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5051, 48, N'888888888', CAST(N'2023-06-30' AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5052, 14, N'111111113', CAST(N'2023-06-27' AS Date), 5)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5053, 8, N'888888888', CAST(N'2023-06-27' AS Date), 1)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5054, 13, N'111111113', CAST(N'2023-06-29' AS Date), 4)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5055, 9, N'888888888', CAST(N'2023-06-26' AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5056, 15, N'111111113', CAST(N'2023-06-30' AS Date), 2)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5058, 22, N'888888888', CAST(N'2023-06-28' AS Date), 2)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5059, 49, N'111111113', CAST(N'2023-07-07' AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5060, 7, N'888888888', CAST(N'2023-07-05' AS Date), 2)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5061, 14, N'111111113', CAST(N'2023-07-05' AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5063, 14, N'888888888', CAST(N'2023-07-12' AS Date), 4)
INSERT [dbo].[orders] ([oid], [mid], [uid], [date], [tickets]) VALUES (5064, 12, N'111111113', CAST(N'2023-07-05' AS Date), 2)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'011111111', N'admina', N'admina', N'admin@admin.adminaaa', N'11111')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'111111111', N'admin', N'admin', N'admin@admin.admin', N'11111')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'111111113', N'Adi', N'Perevitsky', N'peadi9@gmail.com', N'11111')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'111111221', N'eliko', N'smith', N'ad@bla.com', N'abuabu')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'111111241', N'eliko', N'smith', N'a44om@asd.cpm', N'abuabu')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'111141', N'eliko', N'smith', N'a4334om@asd.cpm', N'abuabu')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'222222222', N'asdads', N'asdasd', N'ad@asd.com', N'12345')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'232323233', N'moti', N'kakoon', N'motik@gmail.com', N'aaaaa')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'888888888', N'rami', N'levi', N'rami@levi.com', N'22222')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'888888899', N'rico', N'levi', N'rami@levi.com1', N'12121')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'999399999', N'elikobene', N'smith row', N'a114333322234om@asd.cpm', N'abuasdasd3dad32342dff')
INSERT [dbo].[users] ([uid], [fname], [lname], [email], [password]) VALUES (N'999999999', N'eliko bene', N'smith row', N'a114334om@asd.cpm', N'abuabu')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_USER]    Script Date: 06/07/2023 12:09:24 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UC_USER] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_users]    Script Date: 06/07/2023 12:09:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_users] ON [dbo].[users]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[movies_genres]  WITH CHECK ADD  CONSTRAINT [FK_movies_genres_genres] FOREIGN KEY([gid])
REFERENCES [dbo].[genres] ([gid])
GO
ALTER TABLE [dbo].[movies_genres] CHECK CONSTRAINT [FK_movies_genres_genres]
GO
ALTER TABLE [dbo].[movies_genres]  WITH CHECK ADD  CONSTRAINT [FK_movies_genres_movies] FOREIGN KEY([mid])
REFERENCES [dbo].[movies] ([id])
GO
ALTER TABLE [dbo].[movies_genres] CHECK CONSTRAINT [FK_movies_genres_movies]
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
/****** Object:  StoredProcedure [dbo].[movie_genres]    Script Date: 06/07/2023 12:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[movie_genres]
as
select movies.name as movie_name, genres.gname as genres from movies
join movies_genres on movies.id=movies_genres.mid
join genres on genres.gid=movies_genres.gid
GO
/****** Object:  StoredProcedure [dbo].[movie_genres1]    Script Date: 06/07/2023 12:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[movie_genres1]
as
select movies.name as movie_name, string_agg(genres.gname, ', ') as genres from movies
join movies_genres on movies.id=movies_genres.mid
join genres on genres.gid=movies_genres.gid
group by movies.name

GO
/****** Object:  StoredProcedure [dbo].[moviesWithGenres]    Script Date: 06/07/2023 12:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[moviesWithGenres]
as
select movies.id,  movies.name, movies.director,string_agg(genres.gname, ', ') as genre, movies.length, movies.description,movies.image
from movies
join movies_genres on movies.id=movies_genres.mid
join genres on genres.gid=movies_genres.gid
group by movies.name, movies.length,movies.id,movies.description,movies.director,movies.image
GO
/****** Object:  StoredProcedure [dbo].[Orderdetails]    Script Date: 06/07/2023 12:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Orderdetails]
as
select orders.oid, orders.mid, movies.name as movie_name,(users.fname +' '+users.lname) as full_name, orders.uid, orders.date,orders.tickets from orders
join movies on orders.mid=movies.id
join users on users.uid=orders.uid
GO
USE [master]
GO
ALTER DATABASE [dbMovies] SET  READ_WRITE 
GO
