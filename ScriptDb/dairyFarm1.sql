USE [DairyFarm]
GO
/****** Object:  Table [dbo].[CattleProductions]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CattleProductions](
	[IdProduction] [int] IDENTITY(1,1) NOT NULL,
	[IdCattle] [int] NOT NULL,
	[Dateprod] [datetime] NOT NULL,
	[hourprod] [datetime] NOT NULL,
	[quantity] [decimal](9, 3) NOT NULL,
 CONSTRAINT [PK_CATTLEPRODUCTIONS] PRIMARY KEY CLUSTERED 
(
	[IdProduction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cattles]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cattles](
	[IdCattle] [int] IDENTITY(1,1) NOT NULL,
	[CodeCattle] [varchar](11) NULL,
	[IdHerd] [int] NOT NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_Cattles_Active]  DEFAULT ((1)),
	[DateBirth] [date] NOT NULL,
	[MalParent] [int] NULL,
	[FemaleParent] [int] NULL,
	[Sex] [char](1) NOT NULL,
 CONSTRAINT [PK_CATTLES] PRIMARY KEY CLUSTERED 
(
	[IdCattle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CattleTypes]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CattleTypes](
	[IdCattleType] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CATTLETYPES] PRIMARY KEY CLUSTERED 
(
	[IdCattleType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Diets]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diets](
	[IdDiet] [int] IDENTITY(1,1) NOT NULL,
	[IdSeason] [int] NOT NULL,
	[Label] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DIETS] PRIMARY KEY CLUSTERED 
(
	[IdDiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Diets_CattleTypes]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diets_CattleTypes](
	[IdDiet] [int] NOT NULL,
	[IdCattleType] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Diets_Foods]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diets_Foods](
	[IdDiet] [int] NOT NULL,
	[IdFood] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiseaseHistories_MedicalTreatments]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiseaseHistories_MedicalTreatments](
	[idTreatment] [int] NOT NULL,
	[IdDiseasesHistory] [int] NOT NULL,
 CONSTRAINT [pk_DiseaseHistories_MedicalTreatments] PRIMARY KEY CLUSTERED 
(
	[idTreatment] ASC,
	[IdDiseasesHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Diseases]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diseases](
	[IdDisease] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](50) NOT NULL,
	[Contagious] [bit] NOT NULL,
 CONSTRAINT [PK_DISEASES] PRIMARY KEY CLUSTERED 
(
	[IdDisease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiseasesHistories]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiseasesHistories](
	[IdDiseasesHistory] [int] IDENTITY(1,1) NOT NULL,
	[IdTreatment] [int] NOT NULL,
	[IdDisease] [int] NOT NULL,
	[IdCattle] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[VeterinaryVisit] [bit] NOT NULL,
 CONSTRAINT [PK_DISEASESHISTORIES] PRIMARY KEY CLUSTERED 
(
	[IdDiseasesHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Foods]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Foods](
	[IdFood] [int] IDENTITY(1,1) NOT NULL,
	[TotQuantity] [decimal](9, 3) NOT NULL,
	[Label] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FOODS] PRIMARY KEY CLUSTERED 
(
	[IdFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gestations]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gestations](
	[IdGestation] [int] IDENTITY(1,1) NOT NULL,
	[IdCattle] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[DateCalve] [date] NULL,
	[CalveSex] [char](1) NULL,
	[Comment] [nchar](256) NULL,
	[DeathCalve] [bit] NULL,
 CONSTRAINT [PK_Gestations] PRIMARY KEY CLUSTERED 
(
	[IdGestation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Herds]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Herds](
	[IdHerd] [int] IDENTITY(1,1) NOT NULL,
	[IdCattleType] [int] NOT NULL,
	[MaxAnimals] [int] NOT NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_Herds_Active]  DEFAULT ((1)),
	[Label] [varchar](50) NOT NULL,
	[AvailablePlaces] [int] NOT NULL,
 CONSTRAINT [PK_HERDS] PRIMARY KEY CLUSTERED 
(
	[IdHerd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Meals]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meals](
	[IdMeal] [int] IDENTITY(1,1) NOT NULL,
	[IdFood] [int] NOT NULL,
	[IdHerd] [int] NOT NULL,
	[DateMeal] [datetime] NOT NULL,
	[HourMeal] [timestamp] NOT NULL,
	[Quantity] [decimal](9, 3) NOT NULL,
 CONSTRAINT [PK_MEALS] PRIMARY KEY CLUSTERED 
(
	[IdMeal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalTreatments]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MedicalTreatments](
	[IdTreatment] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MEDICALTREATMENTS] PRIMARY KEY CLUSTERED 
(
	[IdTreatment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 15/05/2015 12:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seasons](
	[IdSeason] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](50) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SEASONS] PRIMARY KEY CLUSTERED 
(
	[IdSeason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cattles] ON 

INSERT [dbo].[Cattles] ([IdCattle], [CodeCattle], [IdHerd], [Active], [DateBirth], [MalParent], [FemaleParent], [Sex]) VALUES (1, N'5555', 1, 1, CAST(N'2015-01-01' AS Date), NULL, NULL, N'f')
SET IDENTITY_INSERT [dbo].[Cattles] OFF
SET IDENTITY_INSERT [dbo].[CattleTypes] ON 

INSERT [dbo].[CattleTypes] ([IdCattleType], [Label]) VALUES (1, N'veau')
INSERT [dbo].[CattleTypes] ([IdCattleType], [Label]) VALUES (2, N'velle')
INSERT [dbo].[CattleTypes] ([IdCattleType], [Label]) VALUES (3, N'vache_lait')
INSERT [dbo].[CattleTypes] ([IdCattleType], [Label]) VALUES (4, N'vache_reforme')
INSERT [dbo].[CattleTypes] ([IdCattleType], [Label]) VALUES (5, N'veau_non_sevre')
INSERT [dbo].[CattleTypes] ([IdCattleType], [Label]) VALUES (1004, N'TestTypeCattle')
INSERT [dbo].[CattleTypes] ([IdCattleType], [Label]) VALUES (1005, N'polo')
SET IDENTITY_INSERT [dbo].[CattleTypes] OFF
SET IDENTITY_INSERT [dbo].[Diseases] ON 

INSERT [dbo].[Diseases] ([IdDisease], [Label], [Contagious]) VALUES (1, N'grippe', 1)
SET IDENTITY_INSERT [dbo].[Diseases] OFF
SET IDENTITY_INSERT [dbo].[Gestations] ON 

INSERT [dbo].[Gestations] ([IdGestation], [IdCattle], [StartDate], [EndDate], [DateCalve], [CalveSex], [Comment], [DeathCalve]) VALUES (1, 1, CAST(N'2015-01-01' AS Date), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Gestations] OFF
SET IDENTITY_INSERT [dbo].[Herds] ON 

INSERT [dbo].[Herds] ([IdHerd], [IdCattleType], [MaxAnimals], [Active], [Label], [AvailablePlaces]) VALUES (1, 1, 50, 1, N'veau1', 25)
INSERT [dbo].[Herds] ([IdHerd], [IdCattleType], [MaxAnimals], [Active], [Label], [AvailablePlaces]) VALUES (2, 2, 50, 1, N'velle1', 50)
INSERT [dbo].[Herds] ([IdHerd], [IdCattleType], [MaxAnimals], [Active], [Label], [AvailablePlaces]) VALUES (3, 3, 50, 1, N'vache_lait1', 49)
INSERT [dbo].[Herds] ([IdHerd], [IdCattleType], [MaxAnimals], [Active], [Label], [AvailablePlaces]) VALUES (4, 4, 50, 1, N'vache_reforme1', 47)
INSERT [dbo].[Herds] ([IdHerd], [IdCattleType], [MaxAnimals], [Active], [Label], [AvailablePlaces]) VALUES (1002, 5, 10, 0, N'TestHerd', 0)
INSERT [dbo].[Herds] ([IdHerd], [IdCattleType], [MaxAnimals], [Active], [Label], [AvailablePlaces]) VALUES (1003, 1004, 20, 0, N'BrahiHerd', 0)
INSERT [dbo].[Herds] ([IdHerd], [IdCattleType], [MaxAnimals], [Active], [Label], [AvailablePlaces]) VALUES (1004, 3, 10, 0, N'vache_lai2ch', 0)
INSERT [dbo].[Herds] ([IdHerd], [IdCattleType], [MaxAnimals], [Active], [Label], [AvailablePlaces]) VALUES (1005, 3, 10, 0, N'vach3', 0)
SET IDENTITY_INSERT [dbo].[Herds] OFF
SET IDENTITY_INSERT [dbo].[MedicalTreatments] ON 

INSERT [dbo].[MedicalTreatments] ([IdTreatment], [Label]) VALUES (1, N'sirop')
INSERT [dbo].[MedicalTreatments] ([IdTreatment], [Label]) VALUES (2, N'vanille')
SET IDENTITY_INSERT [dbo].[MedicalTreatments] OFF
/****** Object:  Index [PK_DIETS_CATTLETYPES]    Script Date: 15/05/2015 12:52:57 ******/
ALTER TABLE [dbo].[Diets_CattleTypes] ADD  CONSTRAINT [PK_DIETS_CATTLETYPES] PRIMARY KEY NONCLUSTERED 
(
	[IdDiet] ASC,
	[IdCattleType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_DIETS_FOODS]    Script Date: 15/05/2015 12:52:57 ******/
ALTER TABLE [dbo].[Diets_Foods] ADD  CONSTRAINT [PK_DIETS_FOODS] PRIMARY KEY NONCLUSTERED 
(
	[IdDiet] ASC,
	[IdFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CattleProductions]  WITH CHECK ADD  CONSTRAINT [FK_CattleProductions_Cattles] FOREIGN KEY([IdCattle])
REFERENCES [dbo].[Cattles] ([IdCattle])
GO
ALTER TABLE [dbo].[CattleProductions] CHECK CONSTRAINT [FK_CattleProductions_Cattles]
GO
ALTER TABLE [dbo].[Cattles]  WITH CHECK ADD  CONSTRAINT [FK_CATTLES_HERDS] FOREIGN KEY([IdHerd])
REFERENCES [dbo].[Herds] ([IdHerd])
GO
ALTER TABLE [dbo].[Cattles] CHECK CONSTRAINT [FK_CATTLES_HERDS]
GO
ALTER TABLE [dbo].[Diets]  WITH CHECK ADD  CONSTRAINT [FK_Diets_Seasons] FOREIGN KEY([IdSeason])
REFERENCES [dbo].[Seasons] ([IdSeason])
GO
ALTER TABLE [dbo].[Diets] CHECK CONSTRAINT [FK_Diets_Seasons]
GO
ALTER TABLE [dbo].[Diets_CattleTypes]  WITH CHECK ADD  CONSTRAINT [FK_DIETSCATTLETYPES_CATTLETYPES] FOREIGN KEY([IdCattleType])
REFERENCES [dbo].[CattleTypes] ([IdCattleType])
GO
ALTER TABLE [dbo].[Diets_CattleTypes] CHECK CONSTRAINT [FK_DIETSCATTLETYPES_CATTLETYPES]
GO
ALTER TABLE [dbo].[Diets_CattleTypes]  WITH CHECK ADD  CONSTRAINT [FK_DIETSCATTLETYPES_DIETS] FOREIGN KEY([IdDiet])
REFERENCES [dbo].[Diets] ([IdDiet])
GO
ALTER TABLE [dbo].[Diets_CattleTypes] CHECK CONSTRAINT [FK_DIETSCATTLETYPES_DIETS]
GO
ALTER TABLE [dbo].[Diets_Foods]  WITH CHECK ADD  CONSTRAINT [FK_DIETSFOODS_DIETS] FOREIGN KEY([IdDiet])
REFERENCES [dbo].[Diets] ([IdDiet])
GO
ALTER TABLE [dbo].[Diets_Foods] CHECK CONSTRAINT [FK_DIETSFOODS_DIETS]
GO
ALTER TABLE [dbo].[Diets_Foods]  WITH CHECK ADD  CONSTRAINT [FK_DIETSFOODS_FOODS] FOREIGN KEY([IdFood])
REFERENCES [dbo].[Foods] ([IdFood])
GO
ALTER TABLE [dbo].[Diets_Foods] CHECK CONSTRAINT [FK_DIETSFOODS_FOODS]
GO
ALTER TABLE [dbo].[DiseaseHistories_MedicalTreatments]  WITH CHECK ADD  CONSTRAINT [FK_DDISEASEHISTORIESMEDICALTREATMENTS_MEDICALTREATMENTS] FOREIGN KEY([idTreatment])
REFERENCES [dbo].[MedicalTreatments] ([IdTreatment])
GO
ALTER TABLE [dbo].[DiseaseHistories_MedicalTreatments] CHECK CONSTRAINT [FK_DDISEASEHISTORIESMEDICALTREATMENTS_MEDICALTREATMENTS]
GO
ALTER TABLE [dbo].[DiseaseHistories_MedicalTreatments]  WITH CHECK ADD  CONSTRAINT [FK_DISEASEHISTORIESMEDICALTREATMENTS_MEDICALTREATMENTS] FOREIGN KEY([IdDiseasesHistory])
REFERENCES [dbo].[DiseasesHistories] ([IdDiseasesHistory])
GO
ALTER TABLE [dbo].[DiseaseHistories_MedicalTreatments] CHECK CONSTRAINT [FK_DISEASEHISTORIESMEDICALTREATMENTS_MEDICALTREATMENTS]
GO
ALTER TABLE [dbo].[DiseasesHistories]  WITH CHECK ADD  CONSTRAINT [FK_DiseasesHistories_Cattles] FOREIGN KEY([IdCattle])
REFERENCES [dbo].[Cattles] ([IdCattle])
GO
ALTER TABLE [dbo].[DiseasesHistories] CHECK CONSTRAINT [FK_DiseasesHistories_Cattles]
GO
ALTER TABLE [dbo].[DiseasesHistories]  WITH CHECK ADD  CONSTRAINT [FK_DISEASESHISTORIES_DISEASES] FOREIGN KEY([IdDisease])
REFERENCES [dbo].[Diseases] ([IdDisease])
GO
ALTER TABLE [dbo].[DiseasesHistories] CHECK CONSTRAINT [FK_DISEASESHISTORIES_DISEASES]
GO
ALTER TABLE [dbo].[Gestations]  WITH CHECK ADD  CONSTRAINT [FK_Gestations_Cattles] FOREIGN KEY([IdCattle])
REFERENCES [dbo].[Cattles] ([IdCattle])
GO
ALTER TABLE [dbo].[Gestations] CHECK CONSTRAINT [FK_Gestations_Cattles]
GO
ALTER TABLE [dbo].[Herds]  WITH CHECK ADD  CONSTRAINT [FK_Herds_CattleTypes] FOREIGN KEY([IdCattleType])
REFERENCES [dbo].[CattleTypes] ([IdCattleType])
GO
ALTER TABLE [dbo].[Herds] CHECK CONSTRAINT [FK_Herds_CattleTypes]
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD  CONSTRAINT [FK_MEALS_FOODS] FOREIGN KEY([IdFood])
REFERENCES [dbo].[Foods] ([IdFood])
GO
ALTER TABLE [dbo].[Meals] CHECK CONSTRAINT [FK_MEALS_FOODS]
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD  CONSTRAINT [FK_MEALS_HERDS] FOREIGN KEY([IdHerd])
REFERENCES [dbo].[Herds] ([IdHerd])
GO
ALTER TABLE [dbo].[Meals] CHECK CONSTRAINT [FK_MEALS_HERDS]
GO
