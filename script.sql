USE [QLSV]
GO
/****** Object:  Table [dbo].[diem]    Script Date: 10/14/2023 10:30:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diem](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[MaMon] [nchar](255) NOT NULL,
	[MaSV] [nchar](255) NOT NULL,
	[giuaky] [float] NULL,
	[cuoiky] [float] NULL,
	[chuyencan] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giangvien]    Script Date: 10/14/2023 10:30:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giangvien](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nchar](255) NOT NULL,
	[MaGV] [nchar](255) NOT NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_giangvien_1] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa]    Script Date: 10/14/2023 10:30:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nchar](255) NOT NULL,
	[is_delete] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop]    Script Date: 10/14/2023 10:30:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nchar](255) NULL,
	[khoa] [nchar](255) NULL,
	[is_delete] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monhoc]    Script Date: 10/14/2023 10:30:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monhoc](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nchar](255) NOT NULL,
	[MaMon] [nchar](255) NOT NULL,
	[is_delete] [bit] NOT NULL,
	[tinchi] [int] NULL,
	[MaGV] [nchar](255) NOT NULL,
 CONSTRAINT [PK_monhoc] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinhvien]    Script Date: 10/14/2023 10:30:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinhvien](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nchar](255) NOT NULL,
	[MaSV] [nchar](255) NOT NULL,
	[is_delete] [bit] NOT NULL,
	[lop] [nchar](255) NULL,
 CONSTRAINT [PK_sinhvien_1] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/14/2023 10:30:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nchar](255) NOT NULL,
	[password] [nchar](255) NOT NULL,
	[ten] [nchar](255) NOT NULL,
	[role] [nchar](10) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[giangvien] ADD  CONSTRAINT [DF_giangvien_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[khoa] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[lop] ADD  CONSTRAINT [DF_lop_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[monhoc] ADD  CONSTRAINT [DF_monhoc_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[sinhvien] ADD  CONSTRAINT [DF_sinhvien_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[diem]  WITH CHECK ADD  CONSTRAINT [FK_diem_monhoc] FOREIGN KEY([MaMon])
REFERENCES [dbo].[monhoc] ([MaMon])
GO
ALTER TABLE [dbo].[diem] CHECK CONSTRAINT [FK_diem_monhoc]
GO
ALTER TABLE [dbo].[diem]  WITH CHECK ADD  CONSTRAINT [FK_diem_sinhvien] FOREIGN KEY([MaSV])
REFERENCES [dbo].[sinhvien] ([MaSV])
GO
ALTER TABLE [dbo].[diem] CHECK CONSTRAINT [FK_diem_sinhvien]
GO
ALTER TABLE [dbo].[monhoc]  WITH CHECK ADD  CONSTRAINT [FK_monhoc_giangvien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[giangvien] ([MaGV])
GO
ALTER TABLE [dbo].[monhoc] CHECK CONSTRAINT [FK_monhoc_giangvien]
GO
