USE [dbAgenda]
GO
/****** Object:  Table [dbo].[contacto]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contacto](
	[id_contacto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellidoP] [varchar](20) NULL,
	[apellidoM] [varchar](20) NULL,
	[celular] [int] NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_contacto] PRIMARY KEY CLUSTERED 
(
	[id_contacto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[actividad2]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actividad2](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[actividad] [varchar](50) NULL,
	[lugar] [varchar](50) NULL,
	[participantes] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_actividad2] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](20) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[validacion]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[validacion]
@usuario as varchar(20),
@password as varchar(20)
as
select *
from usuario
where
usuario=@usuario and password=@password
GO
/****** Object:  StoredProcedure [dbo].[mostrar_datos]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_datos]
as
select * 
from contacto
order by apellidoP
GO
/****** Object:  StoredProcedure [dbo].[mostrar_contacto]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_contacto]
as
select * from contacto
order by contacto.apellidoP desc
GO
/****** Object:  StoredProcedure [dbo].[mostrar_actividad]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_actividad]
as
select *
from actividad2
order by id_actividad
GO
/****** Object:  StoredProcedure [dbo].[insertar_contacto]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_contacto]
@nombre varchar(20),
@apellidoP varchar(20),
@apellidoM varchar(20),
@email varchar (50),
@celular integer
as
insert into contacto(nombre,apellidoP,apellidoM,email,celular) values(@nombre,@apellidoP,@apellidoM,@email,@celular)
GO
/****** Object:  StoredProcedure [dbo].[eliminar_contacto]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_contacto]
@idContacto integer
as
delete from contacto 
where id_contacto=@idContacto
GO
/****** Object:  StoredProcedure [dbo].[editar_contacto]    Script Date: 11/29/2022 10:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_contacto]
@idContacto integer,
@nombre varchar(20),
@apellidoP varchar(20),
@apellidoM varchar(20),
@email varchar(50),
@celular integer
as
update contacto 
set
nombre=@nombre,
apellidoP=@apellidoP,
apellidoM=@apellidoM,
celular=@celular,
email=@email
where
id_contacto=@idContacto
GO
