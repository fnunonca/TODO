--+SqlPlusRoutine
    --&Author=Fernando Vasquez
    --&Comment=Inserts a new record into the dbo.task table.
    --&SelectType=NonQuery
--+SqlPlusRoutine
CREATE PROCEDURE [dbo].[taskInsert]
(
    @id int out,
 
    --+Required
    --+Comment=description
    @description varchar(MAX),
 
    --+Required
    --+Comment=status
    @status int,
 
    --+Required
    --+Comment=date_create
    @date_create datetime,
 
    --+Comment=date_finish
    @date_finish datetime
 
)
AS
BEGIN
 
    SET NOCOUNT ON;
 
    INSERT INTO [dbo].[task]
    (
        description,
        status,
        date_create,
        date_finish
    )
    VALUES
    (
        @description,
        @status,
        @date_create,
        @date_finish
    );
 
    SET @id = scope_identity();
 
    --+Return=Ok
    RETURN 1;
 
END;
GO
 
------------------------------------------------------------------------------------------------------------------------------
 
--+SqlPlusRoutine
    --&Author=Fernando Vasquez
    --&Comment=Updates record for the dbo.task table.
    --&SelectType=NonQuery
--+SqlPlusRoutine
CREATE PROCEDURE [dbo].[taskUpdate]
(
    --+Required
    --+Comment=id
    @id int,
 
    --+Required
    --+Comment=description
    @description varchar(MAX),
 
    --+Required
    --+Comment=status
    @status int,
 
    --+Required
    --+Comment=date_create
    @date_create datetime,
 
    --+Comment=date_finish
    @date_finish datetime
 
)
AS
BEGIN
 
    SET NOCOUNT ON;
 
    UPDATE [dbo].[task] SET
        description = @description,
        status = @status,
        date_create = @date_create,
        date_finish = @date_finish
    WHERE
        id = @id
 
    IF @@ROWCOUNT = 0
    BEGIN
        --+Return=NotFound
        RETURN 0;
    END;
 
    --+Return=Ok
    RETURN 1;
 
END;
GO
 
------------------------------------------------------------------------------------------------------------------------------
 
--+SqlPlusRoutine
    --&Author=Fernando Vasquez
    --&Comment=Selects single row from dbo.task table by identity column.
    --&SelectType=SingleRow
--+SqlPlusRoutine
CREATE PROCEDURE [dbo].[taskById]
(
    --+Required
    --+Comment=id
    @id int
)
AS
BEGIN
 
    SET NOCOUNT ON;
 
    SELECT
        id,
        description,
        status,
        date_create,
        date_finish
    FROM
        dbo.task
    WHERE
        id = @id;
 
    IF @@ROWCOUNT = 0
    BEGIN
        --+Return=NotFound
        RETURN 0;
    END;
 
    --+Return=Ok
    RETURN 1;
 
END;
GO
 
------------------------------------------------------------------------------------------------------------------------------
 
--+SqlPlusRoutine
    --&Author=Fernando Vasquez
    --&Comment=Deletes single row from dbo.task table by identity column.
    --&SelectType=NonQuery
--+SqlPlusRoutine
CREATE PROCEDURE [dbo].[taskDelete]
(
    --+Required
    --+Comment=id
    @id int
)
AS
BEGIN
 
    SET NOCOUNT ON;
 
    DELETE FROM dbo.task
    WHERE
        id = @id;
 
    IF @@ROWCOUNT = 0
    BEGIN
        --+Return=NotFound
        RETURN 0;
    END;
 
    --+Return=Ok
    RETURN 1;
 
END;
GO
 
------------------------------------------------------------------------------------------------------------------------------
 
--+SqlPlusRoutine
    --&Author=Fernando Vasquez
    --&Comment=Queries dbo.task table.
    --&SelectType=MultiRow
--+SqlPlusRoutine
CREATE PROCEDURE [dbo].[taskQuery]
(
    --+Comment=description
    @description varchar(MAX),
 
    --+Comment=status
    @status int,
 
    --+Comment=date_create
    @date_create datetime,
 
    --+Comment=date_finish
    @date_finish datetime
 
)
AS
BEGIN
 
    SET NOCOUNT ON;
 
    SELECT
        id,
        description,
        status,
        date_create,
        date_finish
    FROM
        dbo.task
    WHERE
        (@description IS NULL OR description = @description) AND
        (@status IS NULL OR status = @status) AND
        (@date_create IS NULL OR date_create = @date_create) AND
        (@date_finish IS NULL OR date_finish = @date_finish)
    IF @@ROWCOUNT = 0
    BEGIN
        --+Return=NotFound
        RETURN 0;
    END;
 
    --+Return=Ok
    RETURN 1;
 
END;
GO
