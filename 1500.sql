USE [ProjectD]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[Title_id] [int] IDENTITY(1,1) NOT NULL,
	[Title_name] [varchar](10) NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[Title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataUser]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataUser](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[Title_id] [int] NULL,
	[User_FristName] [varchar](200) NULL,
	[User_LastName] [varchar](200) NULL,
	[User_Email] [varchar](200) NULL,
	[User_Phone] [varchar](10) NULL,
	[User_Image] [image] NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Sta_User_id] [int] NULL,
 CONSTRAINT [PK_DataUser] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusUser]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusUser](
	[Sta_User_id] [int] IDENTITY(1,1) NOT NULL,
	[Sta_User_type] [varchar](50) NULL,
 CONSTRAINT [PK_StatusUser] PRIMARY KEY CLUSTERED 
(
	[Sta_User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewUser]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUser]
AS
SELECT        dbo.DataUser.User_id, dbo.Title.Title_id, dbo.Title.Title_name, dbo.DataUser.User_FristName, dbo.DataUser.User_LastName, dbo.DataUser.User_Phone, dbo.DataUser.User_Email, dbo.DataUser.User_Image, 
                         dbo.StatusUser.Sta_User_id, dbo.StatusUser.Sta_User_type
FROM            dbo.DataUser INNER JOIN
                         dbo.Title ON dbo.DataUser.Title_id = dbo.Title.Title_id INNER JOIN
                         dbo.StatusUser ON dbo.DataUser.Sta_User_id = dbo.StatusUser.Sta_User_id
GO
/****** Object:  Table [dbo].[Dormitory]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dormitory](
	[Doc_id] [int] IDENTITY(1,1) NOT NULL,
	[Doc_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Dormitory] PRIMARY KEY CLUSTERED 
(
	[Doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Oder_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Room_Id] [int] NULL,
	[Date_In] [varchar](max) NULL,
	[Sta_Id] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Oder_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Room_id] [int] IDENTITY(1,1) NOT NULL,
	[Doc_id] [int] NULL,
	[StaRoom_ID] [int] NULL,
	[CateP_id] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentOrder_Id] [int] NULL,
	[Payment_Date] [varchar](50) NULL,
	[Payment_Pic] [image] NULL,
	[StaPay_ID] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusPayment]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusPayment](
	[StaPay_Id] [int] IDENTITY(1,1) NOT NULL,
	[StaPay_Name] [varchar](50) NULL,
 CONSTRAINT [PK_StatusPayment] PRIMARY KEY CLUSTERED 
(
	[StaPay_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatePrice]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatePrice](
	[CateP_id] [int] IDENTITY(1,1) NOT NULL,
	[RoomPrice] [money] NULL,
 CONSTRAINT [PK_CatePrice] PRIMARY KEY CLUSTERED 
(
	[CateP_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[Sta_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sta_Name] [varchar](50) NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY CLUSTERED 
(
	[Sta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPayment]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPayment]
AS
SELECT        dbo.Payment.Payment_Id, dbo.[Order].Oder_Id, dbo.[Order].Date_In, dbo.DataUser.User_id, dbo.Title.Title_id, dbo.Title.Title_name, dbo.DataUser.User_FristName, dbo.DataUser.User_LastName, dbo.DataUser.User_Phone, 
                         dbo.Room.Room_id, dbo.Dormitory.Doc_id, dbo.Dormitory.Doc_Name, dbo.CatePrice.CateP_id, dbo.CatePrice.RoomPrice, dbo.StatusPayment.StaPay_Id, dbo.StatusPayment.StaPay_Name, dbo.StatusOrder.Sta_Id, 
                         dbo.StatusOrder.Sta_Name, dbo.Payment.Payment_Date, dbo.Payment.Payment_Pic
FROM            dbo.Payment INNER JOIN
                         dbo.[Order] ON dbo.Payment.PaymentOrder_Id = dbo.[Order].Oder_Id INNER JOIN
                         dbo.DataUser ON dbo.[Order].User_Id = dbo.DataUser.User_id INNER JOIN
                         dbo.Title ON dbo.DataUser.Title_id = dbo.Title.Title_id INNER JOIN
                         dbo.StatusOrder ON dbo.[Order].Sta_Id = dbo.StatusOrder.Sta_Id INNER JOIN
                         dbo.StatusPayment ON dbo.Payment.StaPay_ID = dbo.StatusPayment.StaPay_Id INNER JOIN
                         dbo.Room ON dbo.[Order].Room_Id = dbo.Room.Room_id INNER JOIN
                         dbo.CatePrice ON dbo.Room.CateP_id = dbo.CatePrice.CateP_id INNER JOIN
                         dbo.Dormitory ON dbo.Room.Doc_id = dbo.Dormitory.Doc_id
GO
/****** Object:  Table [dbo].[RoomBill]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomBill](
	[RoomBill_Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NULL,
	[Water] [money] NULL,
	[Ele] [money] NULL,
	[Room_Price] [money] NULL,
	[Total_Price] [money] NULL,
	[Bill_Date_Out] [varchar](100) NULL,
	[StaBill_id] [int] NULL,
 CONSTRAINT [PK_RoomBill] PRIMARY KEY CLUSTERED 
(
	[RoomBill_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentRoomBill]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentRoomBill](
	[PaymentBill_Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentRoomBill_id] [int] NULL,
	[PaymentBill_date] [varchar](200) NULL,
	[PaymentPic] [image] NULL,
	[StaPayBill_id] [int] NULL,
 CONSTRAINT [PK_PaymentRoomBill] PRIMARY KEY CLUSTERED 
(
	[PaymentBill_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPayBill]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPayBill]
AS
SELECT        dbo.PaymentRoomBill.PaymentBill_Id, dbo.RoomBill.RoomBill_Id, dbo.[Order].Oder_Id, dbo.Title.Title_id, dbo.Title.Title_name, dbo.DataUser.User_FristName, dbo.DataUser.User_LastName, dbo.DataUser.User_Phone, 
                         dbo.Room.Room_id, dbo.Dormitory.Doc_id, dbo.Dormitory.Doc_Name, dbo.RoomBill.Water, dbo.RoomBill.Ele, dbo.RoomBill.Room_Price, dbo.RoomBill.Total_Price, dbo.RoomBill.Bill_Date_Out, dbo.StatusPayment.StaPay_Id, 
                         dbo.StatusPayment.StaPay_Name, dbo.PaymentRoomBill.PaymentPic
FROM            dbo.DataUser INNER JOIN
                         dbo.[Order] ON dbo.DataUser.User_id = dbo.[Order].User_Id INNER JOIN
                         dbo.RoomBill ON dbo.[Order].Oder_Id = dbo.RoomBill.Order_Id INNER JOIN
                         dbo.PaymentRoomBill ON dbo.RoomBill.RoomBill_Id = dbo.PaymentRoomBill.PaymentRoomBill_id INNER JOIN
                         dbo.Room ON dbo.[Order].Room_Id = dbo.Room.Room_id INNER JOIN
                         dbo.Dormitory ON dbo.Room.Doc_id = dbo.Dormitory.Doc_id INNER JOIN
                         dbo.StatusPayment ON dbo.PaymentRoomBill.StaPayBill_id = dbo.StatusPayment.StaPay_Id INNER JOIN
                         dbo.Title ON dbo.DataUser.Title_id = dbo.Title.Title_id
GO
/****** Object:  View [dbo].[ViewOrder]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewOrder]
AS
SELECT        dbo.[Order].Oder_Id, dbo.Title.Title_id, dbo.Title.Title_name, dbo.DataUser.User_id, dbo.DataUser.User_FristName, dbo.DataUser.User_LastName, dbo.DataUser.User_Phone, dbo.Dormitory.Doc_id, dbo.Dormitory.Doc_Name, 
                         dbo.Room.Room_id, dbo.CatePrice.CateP_id, dbo.CatePrice.RoomPrice, dbo.StatusOrder.Sta_Id, dbo.StatusOrder.Sta_Name, dbo.[Order].Date_In
FROM            dbo.[Order] INNER JOIN
                         dbo.Room ON dbo.[Order].Room_Id = dbo.Room.Room_id INNER JOIN
                         dbo.Dormitory ON dbo.Room.Doc_id = dbo.Dormitory.Doc_id INNER JOIN
                         dbo.CatePrice ON dbo.Room.CateP_id = dbo.CatePrice.CateP_id INNER JOIN
                         dbo.StatusOrder ON dbo.[Order].Sta_Id = dbo.StatusOrder.Sta_Id INNER JOIN
                         dbo.DataUser ON dbo.[Order].User_Id = dbo.DataUser.User_id INNER JOIN
                         dbo.Title ON dbo.DataUser.Title_id = dbo.Title.Title_id
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_Id] [varchar](50) NOT NULL,
	[Admin_Pass] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusRoom]    Script Date: 11/2/2020 12:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusRoom](
	[StaRoom_Id] [int] IDENTITY(1,1) NOT NULL,
	[StaRoom_Type] [varchar](50) NULL,
 CONSTRAINT [PK_StatusRoom] PRIMARY KEY CLUSTERED 
(
	[StaRoom_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([Admin_Id], [Admin_Pass]) VALUES (N'admin', N'1234')
GO
SET IDENTITY_INSERT [dbo].[CatePrice] ON 

INSERT [dbo].[CatePrice] ([CateP_id], [RoomPrice]) VALUES (1, 1500.0000)
INSERT [dbo].[CatePrice] ([CateP_id], [RoomPrice]) VALUES (2, 3000.0000)
SET IDENTITY_INSERT [dbo].[CatePrice] OFF
GO
SET IDENTITY_INSERT [dbo].[DataUser] ON 

INSERT [dbo].[DataUser] ([User_id], [Title_id], [User_FristName], [User_LastName], [User_Email], [User_Phone], [User_Image], [UserName], [Password], [Sta_User_id]) VALUES (1, 1, N'พันสิทธิ์', N'ทรงเยาว์ศรี', N'phansit.son62@kru.ac.th', N'0925040566', NULL, N'phansit', N'1234', 4)
SET IDENTITY_INSERT [dbo].[DataUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Dormitory] ON 

INSERT [dbo].[Dormitory] ([Doc_id], [Doc_Name]) VALUES (1, N'หอ1')
INSERT [dbo].[Dormitory] ([Doc_id], [Doc_Name]) VALUES (2, N'หอ2')
SET IDENTITY_INSERT [dbo].[Dormitory] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Oder_Id], [User_Id], [Room_Id], [Date_In], [Sta_Id]) VALUES (2, 1, 1, N'10/26/2020', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (1, 1, 3, 1)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (2, 1, 1, 1)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (3, 1, 1, 1)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (1002, 2, 1, 1)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (1003, 2, 1, 1)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (1004, 2, 1, 1)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (1005, 1, 1, 2)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (1006, 1, 1, 2)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (1007, 2, 1, 2)
INSERT [dbo].[Room] ([Room_id], [Doc_id], [StaRoom_ID], [CateP_id]) VALUES (1008, 2, 1, 2)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusOrder] ON 

INSERT [dbo].[StatusOrder] ([Sta_Id], [Sta_Name]) VALUES (1, N'รอตรวจสอบ')
INSERT [dbo].[StatusOrder] ([Sta_Id], [Sta_Name]) VALUES (2, N'ชำระเรียบร้อย')
SET IDENTITY_INSERT [dbo].[StatusOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusPayment] ON 

INSERT [dbo].[StatusPayment] ([StaPay_Id], [StaPay_Name]) VALUES (1, N'เงินสด')
INSERT [dbo].[StatusPayment] ([StaPay_Id], [StaPay_Name]) VALUES (2, N'ผ่านธนาคาร')
SET IDENTITY_INSERT [dbo].[StatusPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusRoom] ON 

INSERT [dbo].[StatusRoom] ([StaRoom_Id], [StaRoom_Type]) VALUES (1, N'ว่าง')
INSERT [dbo].[StatusRoom] ([StaRoom_Id], [StaRoom_Type]) VALUES (2, N'เต็ม')
INSERT [dbo].[StatusRoom] ([StaRoom_Id], [StaRoom_Type]) VALUES (3, N'จอง')
SET IDENTITY_INSERT [dbo].[StatusRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusUser] ON 

INSERT [dbo].[StatusUser] ([Sta_User_id], [Sta_User_type]) VALUES (1, N'ว่าง')
INSERT [dbo].[StatusUser] ([Sta_User_id], [Sta_User_type]) VALUES (2, N'จอง')
INSERT [dbo].[StatusUser] ([Sta_User_id], [Sta_User_type]) VALUES (3, N'เข้าพัก')
INSERT [dbo].[StatusUser] ([Sta_User_id], [Sta_User_type]) VALUES (4, N'รอการตรวจสอบ')
SET IDENTITY_INSERT [dbo].[StatusUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([Title_id], [Title_name]) VALUES (1, N'นาย')
INSERT [dbo].[Title] ([Title_id], [Title_name]) VALUES (2, N'นางสาว')
INSERT [dbo].[Title] ([Title_id], [Title_name]) VALUES (3, N'นาง')
SET IDENTITY_INSERT [dbo].[Title] OFF
GO
ALTER TABLE [dbo].[DataUser]  WITH CHECK ADD  CONSTRAINT [FK_DataUser_StatusUser] FOREIGN KEY([Sta_User_id])
REFERENCES [dbo].[StatusUser] ([Sta_User_id])
GO
ALTER TABLE [dbo].[DataUser] CHECK CONSTRAINT [FK_DataUser_StatusUser]
GO
ALTER TABLE [dbo].[DataUser]  WITH CHECK ADD  CONSTRAINT [FK_DataUser_Title] FOREIGN KEY([Title_id])
REFERENCES [dbo].[Title] ([Title_id])
GO
ALTER TABLE [dbo].[DataUser] CHECK CONSTRAINT [FK_DataUser_Title]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Room] FOREIGN KEY([Room_Id])
REFERENCES [dbo].[Room] ([Room_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Room]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_StatusOrder] FOREIGN KEY([Sta_Id])
REFERENCES [dbo].[StatusOrder] ([Sta_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_StatusOrder]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_DataUser] FOREIGN KEY([User_Id])
REFERENCES [dbo].[DataUser] ([User_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OrderDetails_DataUser]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Order] FOREIGN KEY([PaymentOrder_Id])
REFERENCES [dbo].[Order] ([Oder_Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Order]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_StatusPayment] FOREIGN KEY([StaPay_ID])
REFERENCES [dbo].[StatusPayment] ([StaPay_Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_StatusPayment]
GO
ALTER TABLE [dbo].[PaymentRoomBill]  WITH CHECK ADD  CONSTRAINT [FK_PaymentRoomBill_RoomBill] FOREIGN KEY([PaymentRoomBill_id])
REFERENCES [dbo].[RoomBill] ([RoomBill_Id])
GO
ALTER TABLE [dbo].[PaymentRoomBill] CHECK CONSTRAINT [FK_PaymentRoomBill_RoomBill]
GO
ALTER TABLE [dbo].[PaymentRoomBill]  WITH CHECK ADD  CONSTRAINT [FK_PaymentRoomBill_StatusPayment] FOREIGN KEY([StaPayBill_id])
REFERENCES [dbo].[StatusPayment] ([StaPay_Id])
GO
ALTER TABLE [dbo].[PaymentRoomBill] CHECK CONSTRAINT [FK_PaymentRoomBill_StatusPayment]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_CatePrice] FOREIGN KEY([CateP_id])
REFERENCES [dbo].[CatePrice] ([CateP_id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_CatePrice]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Dormitory] FOREIGN KEY([Doc_id])
REFERENCES [dbo].[Dormitory] ([Doc_id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Dormitory]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_StatusRoom] FOREIGN KEY([StaRoom_ID])
REFERENCES [dbo].[StatusRoom] ([StaRoom_Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_StatusRoom]
GO
ALTER TABLE [dbo].[RoomBill]  WITH CHECK ADD  CONSTRAINT [FK_RoomBill_Order1] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Oder_Id])
GO
ALTER TABLE [dbo].[RoomBill] CHECK CONSTRAINT [FK_RoomBill_Order1]
GO
ALTER TABLE [dbo].[RoomBill]  WITH CHECK ADD  CONSTRAINT [FK_RoomBill_StatusOrder] FOREIGN KEY([StaBill_id])
REFERENCES [dbo].[StatusOrder] ([Sta_Id])
GO
ALTER TABLE [dbo].[RoomBill] CHECK CONSTRAINT [FK_RoomBill_StatusOrder]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Dormitory"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CatePrice"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StatusOrder"
            Begin Extent = 
               Top = 204
               Left = 366
               Bottom = 300
               Right = 536
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Title"
            Begin Extent = 
               Top = 102
               Left = 662
               Bottom = 198
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DataUser"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 209
            End
            DisplayFlags = 280
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DataUser"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 136
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomBill"
            Begin Extent = 
               Top = 117
               Left = 461
               Bottom = 247
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "PaymentRoomBill"
            Begin Extent = 
               Top = 6
               Left = 663
               Bottom = 136
               Right = 862
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Room"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 282
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dormitory"
            Begin Extent = 
               Top = 6
               Left = 455
               Bottom = 102
               Right = 625
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StatusPayment"
            Begin Extent = 
               Top = 167
               Left = 243
               Bottom = 263
               Right = 413
            End
            DisplayFl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPayBill'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ags = 280
            TopColumn = 0
         End
         Begin Table = "Title"
            Begin Extent = 
               Top = 170
               Left = 685
               Bottom = 266
               Right = 855
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2055
         Alias = 1995
         Table = 1170
         Output = 1530
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPayBill'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPayBill'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Payment"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DataUser"
            Begin Extent = 
               Top = 6
               Left = 465
               Bottom = 136
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Title"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 102
               Right = 844
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StatusOrder"
            Begin Extent = 
               Top = 200
               Left = 407
               Bottom = 296
               Right = 577
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StatusPayment"
            Begin Extent = 
               Top = 102
               Left = 674
               Bottom = 198
               Right = 844
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room"
            Begin Extent = 
               Top = 131
               Left = 49
               Bottom = 261
               Right = 219
            End
            DisplayFlags = 28' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPayment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
            TopColumn = 0
         End
         Begin Table = "CatePrice"
            Begin Extent = 
               Top = 198
               Left = 615
               Bottom = 294
               Right = 785
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dormitory"
            Begin Extent = 
               Top = 182
               Left = 233
               Bottom = 278
               Right = 403
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 1260
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPayment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPayment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[27] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DataUser"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Title"
            Begin Extent = 
               Top = 138
               Left = 369
               Bottom = 234
               Right = 539
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StatusUser"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 102
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUser'
GO
