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

----------------------------------------- Insert Test Data -----------------------------------------

USE CtrlArtGallery

GO
INSERT INTO Art(Title, DateDisplayed, DateRemoved, ArrivalDate, DateCreated, DateAvailableForSale,
            Price, Style, IsInteractive, TargetedAgeRange, Description, ArtURL)
VALUES ('The Great Orange', '2018-01-09', NULL, '2017-12-10', '2013-05-3', NULL, NULL, 'Sculpture',
		0, '12+', NULL, 'http://www.turtles.nevermind/no')

GO
INSERT INTO Art(Title, DateDisplayed, DateRemoved, ArrivalDate, DateCreated, DateAvailableForSale,
            Price, Style, IsInteractive, TargetedAgeRange, Description, ArtURL)
VALUES ('Rainbows Are Stupid', '2018-06-12', NULL, '2018-01-03', '2017-09-20', '2018-08-30', 1245, 'Sculpture',
		0, '12+', NULL, 'http://www.turtles.nevermind/what')

GO
INSERT INTO Art(Title, DateDisplayed, DateRemoved, ArrivalDate, DateCreated, DateAvailableForSale,
            Price, Style, IsInteractive, TargetedAgeRange, Description, ArtURL)
VALUES ('Panthers', '2018-05-09', NULL, '2018-03-17', '2016-06-13', '2018-08-01', 2352.11, 'Painting',
		1, '18+', NULL, 'http://www.turtles.nevermind/PanthersRule')

GO
INSERT INTO ArtistMedia (MediaBrand, MediaType)
VALUES ('Old Holland', 'Oil Paint'),
	   ('SuperShapes', 'Clay')

GO
INSERT INTO GalleryInfo (GalleryPhone, GalleryHours)
VALUES ('2534567899', '8:00-6:30')

GO
INSERT INTO GalleryEvents (EventStartDate, EventEndDate, EventStartTime, EventEndTime,
						   EventDescription)
VALUES ('2018-02-28', '2018-03-01', '08:00', '18:30', 'Meet the artists!'),
	   ('2018-07-10', '2018-07-13', '08:00', '18:30', NULL)

GO
INSERT INTO GalleryVisitors (MemberEmail, MemberFirstName, MemberLastName, MemberPhone, 
            MemberCity, MemberState, MemberStreet, MemberZip)
VALUES ('thisIsTakingForever@gmail.com', 'Amy', 'Dixon', NULL, 'Tacoma', 'WA',
        '145 Blach St.', '98444'),
	   ('IAmSoTired@MaybeIAmSick.com', 'Jordyn', 'Jensen', '5095553212', NULL, 'WA',
	    NULL, '98322')
GO
INSERT INTO Artists (ArtistFirstName, ArtistLastName, ArtistTag, ArtistEmail, ArtistPhone,
            ArtistCity, ArtistState, AboutTheArtist, ArtistWebsite)
     VALUES ('Brenna', 'Zollins', 'ZollinsArt', 'ZollinsArt@gmail.com', NULL, 'Seattle',
             'WA', NULL,'http://www.ZollinsArt.com'),
			('Niklaus', 'Dollins', NULL, 'DollinsNik@MSN,com', '5552453333', 'Spokane',
			'WA', 'Niklaus dabbles in both painting and scupting, but enjoys drawing the most',
			NULL)
GO
INSERT INTO ArtLocation (ArtPieceID, HallNumber, RoomNumber, SpaceNumber)
VALUES (0, '3', '12', '37'),
	   (1, '1', '13', '1')
GO
INSERT INTO ArtLocation (ArtPieceID, HallNumber, RoomNumber, SpaceNumber)
VALUES (3, '3', '11', '2')

GO
INSERT INTO MediaUsed (ArtPieceID, MediaID, ArtistID)
VALUES (0, 2, 103),
	   (1, 2, 100)
GO
INSERT INTO DisplayedArtistPieces (ArtistPieceID, ArtistID)
VALUES (0, 100),
       (1, 103)
GO
INSERT INTO DisplayedArtistPieces (ArtistPieceID, ArtistID)
VALUES (3, 109)

GO
INSERT INTO FeaturedArtists (EventID, ArtistID)
VALUES (0, 100),
	   (0, 103)
GO
INSERT INTO VirtualGallery (MemberID, ArtPieceID)
VALUES (102, 0),
	   (100, 1)
GO

----------------------------------------- Create Views -----------------------------------------

/* A window for all artists and the mediums they use */
GO
CREATE VIEW vw_ArtistsAndMediums
AS SELECT ArtistFirstName, ArtistLastName, ArtistTag, MediaBrand, MediaType
		  FROM Artists JOIN MediaUsed ON Artists.ArtistID = MediaUsed.ArtistID
					   JOIN ArtistMedia ON  ArtistMedia.MediaID = MediaUsed.MediaID

/* A window for all artists with art on display */
GO
CREATE VIEW vw_ArtistsOnDisplay
AS SELECT ArtistFirstName, ArtistLastName, Title, HallNumber, RoomNumber, SpaceNumber
		  FROM Artists JOIN DisplayedArtistPieces ON Artists.ArtistID = DisplayedArtistPieces.ArtistID JOIN
			   Art ON Art.ArtPieceID = DisplayedArtistPieces.ArtistPieceID JOIN ArtLocation ON 
			   ArtLocation.ArtPieceID = Art.ArtPieceID

/* A window for all artists starring in events */
GO
CREATE VIEW vw_ArtistEvents
AS SELECT ArtistFirstName, ArtistLastName, GalleryEvents.EventID , EventDescription, EventStartDate,
		  EventEndDate, EventStartTime, EventEndTime 
		  FROM Artists JOIN FeaturedArtists ON Artists.ArtistID = FeaturedArtists.ArtistID JOIN
			   GalleryEvents ON GalleryEvents.EventID = FeaturedArtists.EventID

/* A window for all members and their favored art*/
GO
CREATE VIEW vw_MemberArtCollection
AS SELECT GalleryVisitors.MemberID, MemberFirstName, MemberLastName, Title, ArtistFirstName + ' ' +
		  ArtistLastName AS [Artist]
		  FROM GalleryVisitors JOIN VirtualGallery ON GalleryVisitors.MemberID = VirtualGallery.MemberID
			   JOIN Art ON Art.ArtPieceID = VirtualGallery.ArtPieceID JOIN DisplayedArtistPieces ON
			   DisplayedArtistPieces.ArtistPieceID = Art.ArtPieceID JOIN Artists ON Artists.ArtistID =
			   DisplayedArtistPieces.ArtistID

/* A window for all artists who have art for sale */
GO
CREATE VIEW vw_ArtForSale
AS SELECT ArtistFirstName, ArtistLastName, Title, Price, DateAvailableForSale
		  FROM Artists JOIN DisplayedArtistPieces ON Artists.ArtistID = DisplayedArtistPieces.ArtistID
			   JOIN Art ON Art.ArtPieceID = DisplayedArtistPieces.ArtistPieceID
		  WHERE Price IS NOT NULL
GO

----------------------------------------- Create Stored Procedures -----------------------------------------

/* Automatically finds a list of all artists and their art pieces matching the artist search criteria */
CREATE PROCEDURE proc_FindArtistPieces
				 @ArtistFNameVar varchar(50),
				 @ArtistLName varchar(50)
AS SELECT ArtistFirstName + ' ' + ArtistLastName AS [ArtistName], Title, ArtPieceID
   FROM Artists JOIN DisplayedArtistPieces ON Artists.ArtistID = DisplayedArtistPieces.ArtistID JOIN
		Art ON Art.ArtPieceID = DisplayedArtistPieces.ArtistPieceID
   WHERE (ArtistFirstName = @ArtistFNameVar) OR (ArtistLastName = @ArtistLName)

/* Automatically finds a list of all art pieces matching the media search criteria */
GO
CREATE PROCEDURE proc_FindMediaPieces
				 @MediaTypeVar varchar(100)
AS SELECT Art.ArtPieceID, Title, MediaType, MediaBrand
   FROM Art JOIN MediaUsed ON Art.ArtPieceID = MediaUsed.ArtPieceID JOIN ArtistMedia ON
		ArtistMedia.MediaID = MediaUsed.MediaID
	WHERE MediaType = @MediaTypeVar

/* Automatically finds a list of members based on common art piece interests */
GO
CREATE PROCEDURE proc_CommonMemberArt
				 @ArtTitleVar varchar(450)
AS SELECT GalleryVisitors.MemberID, MemberFirstName + ' ' + MemberLastName AS [MemberName], Title
   FROM GalleryVisitors JOIN VirtualGallery ON GalleryVisitors.MemberID = VirtualGallery.MemberID
		JOIN Art ON Art.ArtPieceID = VirtualGallery.ArtPieceID
   WHERE Title = @ArtTitleVar
   ORDER BY MemberID

/* Automatically creates a table of all artists, art pieces, and media used */
GO
CREATE PROCEDURE proc_ArtMediaAndArtists
AS SELECT Artists.ArtistID, ArtistFirstName + ' ' + ArtistLastName AS [ArtistName], Title, MediaType,
		  MediaBrand
   FROM Artists JOIN DisplayedArtistPieces ON Artists.ArtistID = DisplayedArtistPieces.ArtistID
		JOIN Art ON Art.ArtPieceID = DisplayedArtistPieces.ArtistPieceID JOIN MediaUsed ON 
		MediaUsed.ArtPieceID = Art.ArtPieceID JOIN ArtistMedia ON MediaUsed.MediaID = ArtistMedia.MediaID
   ORDER BY ArtistID

 /* Automatically creates a table for events and their featured artists */
 GO
 CREATE PROCEDURE proc_EventsAndArtists
 AS SELECT GalleryEvents.EventID, EventDescription, ArtistFirstName + ' ' + ArtistLastName AS
		   [FeaturedArtist]
	FROM GalleryEvents JOIN FeaturedArtists ON GalleryEvents.EventID = FeaturedArtists.EventID JOIN
		 Artists ON Artists.ArtistID = FeaturedArtists.ArtistID
	ORDER BY EventID, [FeaturedArtist]

/* Automatically creates a table for all artist contact information */
GO
CREATE PROCEDURE proc_ArtistContactInfo
AS SELECT ArtistID, ArtistFirstName + ' ' + ArtistLastName AS [ArtistName], ArtistTag, ArtistEmail,
		  ArtistPhone, ArtistWebsite , ArtistCity + ', ' + ArtistState AS [Location]
   FROM Artists
   ORDER BY [ArtistName]

 /* Automatically creates a table for all member contact information */
 GO
 CREATE PROCEDURE proc_MemberContactInfo
 AS SELECT MemberID, MemberFirstName + ' ' + MemberLastName AS [MemberName], MemberEmail, MemberPhone,
		   MemberStreet + ' ' + MemberCity + ', ' + MemberState + ' ' + MemberZip AS [MemberAddress]
	FROM GalleryVisitors
	ORDER BY [MemberName]
GO

----------------------------------------- Create Check Constraints -----------------------------------------

ALTER TABLE Art
ADD CHECK (Price > 0)

ALTER TABLE Artists
ADD CHECK (ArtistFirstName <> '')

ALTER TABLE Artists
ADD CHECK (ArtistLastNAme <> '')

ALTER TABLE Artists
ADD CHECK (ArtistEmail <> '')

ALTER TABLE GalleryVisitors
ADD CHECK (MemberFirstName <> '')

ALTER TABLE GalleryVisitors
ADD CHECK (MemberEmail <> '')

----------------------------------------- Create Triggers -----------------------------------------

GO
CREATE TRIGGER trig_CapitalizeArtistState
	ON Artists
	AFTER INSERT, UPDATE
AS
	UPDATE Artists
	SET ArtistState = UPPER(ArtistState)
	WHERE ArtistID IN (SELECT ArtistID
					   FROM inserted)
GO
