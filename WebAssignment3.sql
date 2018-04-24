USE [master]
GO
/****** Object:  Database [Books]    Script Date: 2018-01-05 10:18:21 PM ******/
CREATE DATABASE [Books]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Books', FILENAME = N'C:\Users\carlo\Books.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Books_log', FILENAME = N'C:\Users\carlo\Books_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Books].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Books] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Books] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Books] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Books] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Books] SET ARITHABORT OFF 
GO
ALTER DATABASE [Books] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Books] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Books] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Books] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Books] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Books] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Books] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Books] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Books] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Books] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Books] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Books] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Books] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Books] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Books] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Books] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Books] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Books] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Books] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Books] SET  MULTI_USER 
GO
ALTER DATABASE [Books] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Books] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Books] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Books] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [Books]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2018-01-05 10:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2018-01-05 10:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[title] [varchar](50) NOT NULL,
	[author] [varchar](50) NOT NULL,
	[isbn] [nchar](10) NOT NULL,
	[pages] [numeric](18, 0) NOT NULL,
	[genre] [varchar](50) NULL,
	[friend] [varchar](50) NULL,
	[comment] [varchar](50) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'bob', N'bob')
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'carlos', N'carlos')

GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'Ranger games', N'Ben Blum', N'0385681429', CAST(432 AS Numeric(18, 0)), N'non-fiction', NULL, NULL)
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'Christmas at the Vinyl Cafe', N'stuart mclean', N'0735235120', CAST(272 AS Numeric(18, 0)), N'Christmas', NULL, NULL)
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'Joke Book', N'Funny Guy', N'1010101010', CAST(333 AS Numeric(18, 0)), N'Christmas', N'Jobert', N'')
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'Otherworld', N'Jason Segel', N'110193932X', CAST(368 AS Numeric(18, 0)), N'Sci-Fi', NULL, NULL)
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'The Disaster Artist', N'Greg Sestero', N'1476730407', CAST(288 AS Numeric(18, 0)), N'Entertainment', NULL, NULL)
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'bear town', N'fredrik backman', N'1501163108', CAST(336 AS Numeric(18, 0)), N'fiction', NULL, NULL)
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'the sun and her flowers', N'rupi kaur', N'1501175262', CAST(256 AS Numeric(18, 0)), N'non-fiction', NULL, NULL)
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'Learn Music', N'Quincy', N'4685646521', CAST(124 AS Numeric(18, 0)), N'Music', N'Mark', N'')
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'IT', N'Stephen King', N'9675900575', CAST(354 AS Numeric(18, 0)), N'Horror', N'James', N'')
GO
INSERT [dbo].[Books] ([title], [author], [isbn], [pages], [genre], [friend], [comment]) VALUES (N'narnia', N'CS Lewis', N'9780654321', CAST(100 AS Numeric(18, 0)), N'horror', NULL, NULL)
GO
USE [master]
GO
ALTER DATABASE [Books] SET  READ_WRITE 
GO
