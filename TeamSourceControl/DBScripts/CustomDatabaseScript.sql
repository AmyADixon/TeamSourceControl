/* Amy Dixon
   02.15.18
   CPW 210
   Custom Date Base Script */

----------------------------------------- ERROR BACKUP -----------------------------------------

GO
use master

GO
IF DB_ID('CtrlArtGallery') IS NOT NULL
BEGIN
	DROP DATABASE CtrlArtGallery
END


CREATE DATABASE CtrlArtGallery
GO

USE CtrlArtGallery
GO

----------------------------------------- CREATE TABLES -----------------------------------------
GO
CREATE TABLE Artists (ArtistID int PRIMARY KEY IDENTITY(100, 3),
					  ArtistFirstName varchar(50) NOT NULL,
					  ArtistLastName varchar(50) NULL,
					  ArtistTag varchar(150) NULL,
					  ArtistEmail varchar(350) NOT NULL,
					  ArtistPhone char(10) NULL, /* Numbers in the US only; Gallery is located in US */
					  ArtistCity varchar(25) NOT NULL,
					  ArtistState char(2) NOT NULL,
					  AboutTheArtist varchar (1000) NULL,
					  ArtistWebsite varchar(350) NULL )

GO
CREATE TABLE Art (ArtPieceID int PRIMARY KEY IDENTITY(0, 1),
				  Title varchar(450) NOT NULL,
				  DateDisplayed date NOT NULL,
				  DateRemoved date NULL,
				  ArrivalDate date NOT NULL,
				  DateCreated date NOT NULL,
				  DateAvailableForSale date NULL,
				  Price money NULL, 
				  Style varchar(16) NOT NULL, /* DropDown: Sculpture, painting, digital, live performance, drawing, etc. */
				  IsInteractive bit NOT NULL, /* Yes or no */
				  TargetedAgeRange varchar(7) NOT NULL, /* ### - ### */
				  Description varchar(300) NULL,
				  ArtURL varchar(350) UNIQUE NOT NULL)

GO
CREATE TABLE ArtistMedia (MediaID int PRIMARY KEY IDENTITY(1, 1),
						  MediaBrand varchar(100) NULL,
						  MediaType varchar(100) NOT NULL)

GO
CREATE TABLE GalleryInfo (GalleryID int PRIMARY KEY IDENTITY(10, 10),
						  GalleryPhone char(10) NOT NULL,
						  GalleryHours varchar(11) NOT NULL) /* ##:## - ##:## */

GO
CREATE TABLE GalleryEvents (EventID int PRIMARY KEY IDENTITY(0, 1),
							EventStartDate date NOT NULL, /* ##/##/#### */
							EventEndDate date NOT NULL,
							EventStartTime time NOT NULL,
							EventEndTime time NOT NULL,
							EventDescription varchar(300) NULL)

GO
CREATE TABLE GalleryVisitors (MemberID int PRIMARY KEY IDENTITY(100, 2),
							  MemberEmail varchar(350) NOT NULL,
							  MemberFirstName varchar(50) NOT NULL,
							  MemberLastName varchar(50) NULL,
							  MemberPhone char(10) NULL,
							  MemberCity varchar(25) NULL,
							  MemberState char(2) NOT NULL,
							  MemberStreet varchar(200) NULL,
							  MemberZip char(5) NOT NULL )

GO
CREATE TABLE ArtLocation (ArtPieceID int PRIMARY KEY REFERENCES Art(ArtPieceID),
						  HallNumber char(2) NOT NULL,
						  RoomNumber char(3) NOT NULL,
						  SpaceNumber char (3) NOT NULL)

GO
CREATE TABLE MediaUsed (ArtPieceID int PRIMARY KEY REFERENCES Art(ArtPieceID),
						MediaID int REFERENCES ArtistMedia(MediaID),
						ArtistID int REFERENCES Artists(ArtistID))

GO
CREATE TABLE FeaturedArtists (ArtistID int PRIMARY KEY REFERENCES Artists(ArtistID),
							  EventID int REFERENCES GalleryEvents(EventID))

GO
CREATE TABLE DisplayedArtistPieces (ArtistPieceID int PRIMARY KEY REFERENCES Art(ArtPieceID),
									ArtistID int REFERENCES Artists(ArtistID))

GO
CREATE TABLE OtherGalleryWorks (GalleryID int PRIMARY KEY REFERENCES GalleryInfo(GalleryID),
								ArtistID int REFERENCES Artists(ArtistID))

GO
CREATE TABLE VirtualGallery (MemberID int PRIMARY KEY REFERENCES GalleryVisitors(MemberID),
							 ArtPieceID int REFERENCES Art(ArtPieceID))
