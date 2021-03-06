USE [EMS]
GO
/****** Object:  Table [dbo].[login]    Script Date: 22-04-2022 15:21:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[login]') AND type in (N'U'))
DROP TABLE [dbo].[login]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 22-04-2022 15:21:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 22-04-2022 15:21:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO
USE [master]
GO
/****** Object:  Database [EMS]    Script Date: 22-04-2022 15:21:55 ******/
DROP DATABASE [EMS]
GO
/****** Object:  Database [EMS]    Script Date: 22-04-2022 15:21:55 ******/
CREATE DATABASE [EMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EMS.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EMS_log.ldf' , SIZE = 2368KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EMS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EMS] SET  MULTI_USER 
GO
ALTER DATABASE [EMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EMS', N'ON'
GO
ALTER DATABASE [EMS] SET QUERY_STORE = OFF
GO
USE [EMS]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 22-04-2022 15:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Code] [varchar](20) NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[DepID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 22-04-2022 15:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](100) NOT NULL,
	[Department] [varchar](50) NULL,
	[Gender] [varchar](25) NOT NULL,
	[DOB] [date] NOT NULL,
	[IDProofType] [varchar](100) NOT NULL,
	[IDProofNumber] [varchar](100) NOT NULL,
	[Phone] [varchar](100) NOT NULL,
	[BloodGroup] [varchar](25) NULL,
	[emailID] [varchar](25) NULL,
	[EmpAddress] [varchar](max) NOT NULL,
	[PhotoName] [varchar](100) NULL,
 CONSTRAINT [PK__Employee__3214EC272B832074] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 22-04-2022 15:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[email] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Code], [Name], [Description], [DepID]) VALUES (N'Test01', N'Software Tester', N'software testing', 1)
INSERT [dbo].[Department] ([Code], [Name], [Description], [DepID]) VALUES (N'Dev01', N'Software Developer', N'software developing', 2)
INSERT [dbo].[Department] ([Code], [Name], [Description], [DepID]) VALUES (N'Design01', N'Software Designer', N'software designing', 3)
INSERT [dbo].[Department] ([Code], [Name], [Description], [DepID]) VALUES (N'sdf', N'IT', N'information', 5)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (2, N'Abdul', N'Software Tester', N'Male', CAST(N'2022-01-02' AS Date), N'PassPort', N'565767', N'9600468734', N'A-', N'abdulazdel@gmail.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'360_F_118184380_NQeto35FVqbX9SxMY8AkpsQFDqDgDnBR.jpg')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (3, N'Salman', N'Software Developer', N'Male', CAST(N'2022-01-10' AS Date), N'PassPort', N'0987678', N'8674677654', N'A+', N'abdulazdel@gmail.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'602506224fd075.jpeg')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (4, N'Shameer', N'Software Tester', N'Male', CAST(N'2021-12-31' AS Date), N'Driving License', N'987987', N'9876765678', N'O+', N'shameer@email.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'57206df1e1ddc.jpg')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (5, N'Mousim', N'Software Designer', N'Male', CAST(N'2002-01-10' AS Date), N'PassPort', N'6567677867', N'9646567657', N'B+', N'mousim@email.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'4.jpg')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (6, N'Abid', N'Software Developer', N'Male', CAST(N'2012-02-01' AS Date), N'PassPort', N'987987', N'7867747466', N'A+', N'abid@email.com', N'9,Shanmuga nagar,Subburayalu Nagar(Ext),
Thirupathiripuliyur', N'174-1743896_circle-hd-png-download.png')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (8, N'Prabu', N'Software Developer', N'Male', CAST(N'1992-01-03' AS Date), N'PassPort', N'6567677867', N'8676875875', N'A-', N'prabu@email.com', N'9,Shanmuga nagar,Subburayalu Nagar(Ext),
Thirupathiripuliyur', N'3.jfif')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (9, N'aasha', N'Software Developer', N'Female', CAST(N'2002-01-10' AS Date), N'PassPort', N'6567677867', N'9600468734', N'B+', N'abdulazdel@gmail.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'972086-348210172.jpg')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (10, N'Abdul Azees A', N'Software Tester', N'Female', CAST(N'2022-02-01' AS Date), N'PassPort', N'0987678', N'9600468734', N'B+', N'abdulazdel@gmail.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'Anonymous.png')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (11, N'Abdul Azees A', N'Software Tester', N'Female', CAST(N'2022-01-02' AS Date), N'PassPort', N'rdytdiyt', N'9600468734', N'A-', N'abdulazdel@gmail.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'C:\fakepath\WhatsApp Image 2022-02-23 at 12.27.13 PM.jpeg')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (12, N'salar', N'Software Developer', N'Male', CAST(N'2022-01-03' AS Date), N'Voter ID', N'75875', N'8776796767', N'A-', N'salar@email.com', N'yutyitiyuyuyiuf,
566gdgsg,
sdfsfsgsd.', N'121534517_23845772193550162_6596682684523563239_n.png.jpg')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (13, N'rizwan', N'Software Designer', N'Female', CAST(N'2022-01-03' AS Date), N'Driving License', N'88382382gh', N'8677868678', N'B+', N'rizwan@email.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'istockphoto-1157721612-612x612.jpg')
INSERT [dbo].[Employee] ([EmpID], [EmpName], [Department], [Gender], [DOB], [IDProofType], [IDProofNumber], [Phone], [BloodGroup], [emailID], [EmpAddress], [PhotoName]) VALUES (14, N'Abdul Azees A', N'Software Developer', N'Female', CAST(N'2022-01-02' AS Date), N'PassPort', N'6567677867', N'9600468734', N'A-', N'abdulazdel@gmail.com', N'27,Srinivasan Nagar,Subburayalu Nagar(Ext), Thirupathiripuliyur', N'278946407_1823196947874990_973111625830374985_n.jpg')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[login] ([UserName], [Password], [Mobile], [email]) VALUES (N'Admin', N'admin123', N'785757792', N'abdulazees@gmail.com')
INSERT [dbo].[login] ([UserName], [Password], [Mobile], [email]) VALUES (N'HR', N'hr12345', N'982833468', N'mousin@email.com')
INSERT [dbo].[login] ([UserName], [Password], [Mobile], [email]) VALUES (N'Testing', N'ts12345', N'982833468', N'abid@email.com')
GO
USE [master]
GO
ALTER DATABASE [EMS] SET  READ_WRITE 
GO
