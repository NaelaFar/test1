
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/30/2015 15:17:27
-- Generated from EDMX file: C:\Users\Naela\Documents\myProject\BookningsSystem\BookningsSystem\Models\DBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Bokning];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_RequestReservation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [FK_RequestReservation];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestRoomType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_RequestRoomType];
GO
IF OBJECT_ID(N'[dbo].[FK_RoomTypeRoom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rooms] DROP CONSTRAINT [FK_RoomTypeRoom];
GO
IF OBJECT_ID(N'[dbo].[FK_RoomCity]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rooms] DROP CONSTRAINT [FK_RoomCity];
GO
IF OBJECT_ID(N'[dbo].[FK_ReservationItemRoom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReservationItems] DROP CONSTRAINT [FK_ReservationItemRoom];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestResourceRow]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ResourceRows] DROP CONSTRAINT [FK_RequestResourceRow];
GO
IF OBJECT_ID(N'[dbo].[FK_ResourceRowResource]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ResourceRows] DROP CONSTRAINT [FK_ResourceRowResource];
GO
IF OBJECT_ID(N'[dbo].[FK_ReservationItemResource]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [FK_ReservationItemResource];
GO
IF OBJECT_ID(N'[dbo].[FK_ReservationUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [FK_ReservationUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UserUserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_ReservationReservationItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReservationItems] DROP CONSTRAINT [FK_ReservationReservationItem];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestCity]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_RequestCity];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Requests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requests];
GO
IF OBJECT_ID(N'[dbo].[Reservations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reservations];
GO
IF OBJECT_ID(N'[dbo].[ReservationItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReservationItems];
GO
IF OBJECT_ID(N'[dbo].[Resources]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Resources];
GO
IF OBJECT_ID(N'[dbo].[Rooms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rooms];
GO
IF OBJECT_ID(N'[dbo].[RoomTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoomTypes];
GO
IF OBJECT_ID(N'[dbo].[Cities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cities];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[UserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRoles];
GO
IF OBJECT_ID(N'[dbo].[ChangeLogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ChangeLogs];
GO
IF OBJECT_ID(N'[dbo].[ResourceRows]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ResourceRows];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Requests'
CREATE TABLE [dbo].[Requests] (
    [RequestId] int IDENTITY(1,1) NOT NULL,
    [RoomType_RoomTypeId] int  NOT NULL,
    [City_CityId] int  NOT NULL
);
GO

-- Creating table 'Reservations'
CREATE TABLE [dbo].[Reservations] (
    [ReservationId] int IDENTITY(1,1) NOT NULL,
    [Request_RequestId] int  NOT NULL,
    [User_UserId] int  NOT NULL
);
GO

-- Creating table 'ReservationItems'
CREATE TABLE [dbo].[ReservationItems] (
    [ReservationItemId] int IDENTITY(1,1) NOT NULL,
    [RequestRequestId] int  NOT NULL,
    [ReservationReservationId] int  NOT NULL,
    [Room_RoomId] int  NOT NULL
);
GO

-- Creating table 'Resources'
CREATE TABLE [dbo].[Resources] (
    [ResourceId] int IDENTITY(1,1) NOT NULL,
    [ReservationItemReservationItemId] int  NOT NULL
);
GO

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [RoomId] int IDENTITY(1,1) NOT NULL,
    [RoomTypeRoomTypeId] int  NOT NULL,
    [City_CityId] int  NOT NULL
);
GO

-- Creating table 'RoomTypes'
CREATE TABLE [dbo].[RoomTypes] (
    [RoomTypeId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Cities'
CREATE TABLE [dbo].[Cities] (
    [CityId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [UserRole_UserRoleId] int  NOT NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [UserRoleId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'ChangeLogs'
CREATE TABLE [dbo].[ChangeLogs] (
    [ChangeLogId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'ResourceRows'
CREATE TABLE [dbo].[ResourceRows] (
    [ResourceRowId] int IDENTITY(1,1) NOT NULL,
    [RequestRequestId] int  NOT NULL,
    [Resource_ResourceId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [RequestId] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [PK_Requests]
    PRIMARY KEY CLUSTERED ([RequestId] ASC);
GO

-- Creating primary key on [ReservationId] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [PK_Reservations]
    PRIMARY KEY CLUSTERED ([ReservationId] ASC);
GO

-- Creating primary key on [ReservationItemId] in table 'ReservationItems'
ALTER TABLE [dbo].[ReservationItems]
ADD CONSTRAINT [PK_ReservationItems]
    PRIMARY KEY CLUSTERED ([ReservationItemId] ASC);
GO

-- Creating primary key on [ResourceId] in table 'Resources'
ALTER TABLE [dbo].[Resources]
ADD CONSTRAINT [PK_Resources]
    PRIMARY KEY CLUSTERED ([ResourceId] ASC);
GO

-- Creating primary key on [RoomId] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [PK_Rooms]
    PRIMARY KEY CLUSTERED ([RoomId] ASC);
GO

-- Creating primary key on [RoomTypeId] in table 'RoomTypes'
ALTER TABLE [dbo].[RoomTypes]
ADD CONSTRAINT [PK_RoomTypes]
    PRIMARY KEY CLUSTERED ([RoomTypeId] ASC);
GO

-- Creating primary key on [CityId] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [PK_Cities]
    PRIMARY KEY CLUSTERED ([CityId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [UserRoleId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([UserRoleId] ASC);
GO

-- Creating primary key on [ChangeLogId] in table 'ChangeLogs'
ALTER TABLE [dbo].[ChangeLogs]
ADD CONSTRAINT [PK_ChangeLogs]
    PRIMARY KEY CLUSTERED ([ChangeLogId] ASC);
GO

-- Creating primary key on [ResourceRowId] in table 'ResourceRows'
ALTER TABLE [dbo].[ResourceRows]
ADD CONSTRAINT [PK_ResourceRows]
    PRIMARY KEY CLUSTERED ([ResourceRowId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Request_RequestId] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [FK_RequestReservation]
    FOREIGN KEY ([Request_RequestId])
    REFERENCES [dbo].[Requests]
        ([RequestId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestReservation'
CREATE INDEX [IX_FK_RequestReservation]
ON [dbo].[Reservations]
    ([Request_RequestId]);
GO

-- Creating foreign key on [RoomType_RoomTypeId] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_RequestRoomType]
    FOREIGN KEY ([RoomType_RoomTypeId])
    REFERENCES [dbo].[RoomTypes]
        ([RoomTypeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestRoomType'
CREATE INDEX [IX_FK_RequestRoomType]
ON [dbo].[Requests]
    ([RoomType_RoomTypeId]);
GO

-- Creating foreign key on [RoomTypeRoomTypeId] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [FK_RoomTypeRoom]
    FOREIGN KEY ([RoomTypeRoomTypeId])
    REFERENCES [dbo].[RoomTypes]
        ([RoomTypeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomTypeRoom'
CREATE INDEX [IX_FK_RoomTypeRoom]
ON [dbo].[Rooms]
    ([RoomTypeRoomTypeId]);
GO

-- Creating foreign key on [City_CityId] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [FK_RoomCity]
    FOREIGN KEY ([City_CityId])
    REFERENCES [dbo].[Cities]
        ([CityId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomCity'
CREATE INDEX [IX_FK_RoomCity]
ON [dbo].[Rooms]
    ([City_CityId]);
GO

-- Creating foreign key on [Room_RoomId] in table 'ReservationItems'
ALTER TABLE [dbo].[ReservationItems]
ADD CONSTRAINT [FK_ReservationItemRoom]
    FOREIGN KEY ([Room_RoomId])
    REFERENCES [dbo].[Rooms]
        ([RoomId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReservationItemRoom'
CREATE INDEX [IX_FK_ReservationItemRoom]
ON [dbo].[ReservationItems]
    ([Room_RoomId]);
GO

-- Creating foreign key on [RequestRequestId] in table 'ResourceRows'
ALTER TABLE [dbo].[ResourceRows]
ADD CONSTRAINT [FK_RequestResourceRow]
    FOREIGN KEY ([RequestRequestId])
    REFERENCES [dbo].[Requests]
        ([RequestId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestResourceRow'
CREATE INDEX [IX_FK_RequestResourceRow]
ON [dbo].[ResourceRows]
    ([RequestRequestId]);
GO

-- Creating foreign key on [Resource_ResourceId] in table 'ResourceRows'
ALTER TABLE [dbo].[ResourceRows]
ADD CONSTRAINT [FK_ResourceRowResource]
    FOREIGN KEY ([Resource_ResourceId])
    REFERENCES [dbo].[Resources]
        ([ResourceId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ResourceRowResource'
CREATE INDEX [IX_FK_ResourceRowResource]
ON [dbo].[ResourceRows]
    ([Resource_ResourceId]);
GO

-- Creating foreign key on [ReservationItemReservationItemId] in table 'Resources'
ALTER TABLE [dbo].[Resources]
ADD CONSTRAINT [FK_ReservationItemResource]
    FOREIGN KEY ([ReservationItemReservationItemId])
    REFERENCES [dbo].[ReservationItems]
        ([ReservationItemId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReservationItemResource'
CREATE INDEX [IX_FK_ReservationItemResource]
ON [dbo].[Resources]
    ([ReservationItemReservationItemId]);
GO

-- Creating foreign key on [User_UserId] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [FK_ReservationUser]
    FOREIGN KEY ([User_UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReservationUser'
CREATE INDEX [IX_FK_ReservationUser]
ON [dbo].[Reservations]
    ([User_UserId]);
GO

-- Creating foreign key on [UserRole_UserRoleId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserUserRole]
    FOREIGN KEY ([UserRole_UserRoleId])
    REFERENCES [dbo].[UserRoles]
        ([UserRoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserRole'
CREATE INDEX [IX_FK_UserUserRole]
ON [dbo].[Users]
    ([UserRole_UserRoleId]);
GO

-- Creating foreign key on [ReservationReservationId] in table 'ReservationItems'
ALTER TABLE [dbo].[ReservationItems]
ADD CONSTRAINT [FK_ReservationReservationItem]
    FOREIGN KEY ([ReservationReservationId])
    REFERENCES [dbo].[Reservations]
        ([ReservationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReservationReservationItem'
CREATE INDEX [IX_FK_ReservationReservationItem]
ON [dbo].[ReservationItems]
    ([ReservationReservationId]);
GO

-- Creating foreign key on [City_CityId] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_RequestCity]
    FOREIGN KEY ([City_CityId])
    REFERENCES [dbo].[Cities]
        ([CityId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestCity'
CREATE INDEX [IX_FK_RequestCity]
ON [dbo].[Requests]
    ([City_CityId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------