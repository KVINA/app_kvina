Use KVINA
Go
create table Kvina_Guests
(
	guests_id int identity(1,1) primary key,
	guests_mail varchar(200) unique,
	guests_facebook varchar(200) unique,
	guests_phone varchar(15),
)
go
create table Kvina_Employees 
(
	employees_id int identity(1,1) primary key,
	employees_code varchar(10) UNIQUE NOT NULL,
	employees_status int,
	first_name nvarchar(50),
	last_name nvarchar(50),	
	date_of_birth date,
	gender VARCHAR(10) CHECK (gender IN ('unknown', 'male', 'female')),
	phone_number varchar(15),
	email VARCHAR(200) UNIQUE,
	permanent_address nvarchar(200), --địa chỉ thường trú
	education_level nvarchar(100), --trình độ học vấn
	citizen_identification_number varchar(20), -- số căn cước công dân

)
go
CREATE TABLE Kvina_Account (
    user_id INT identity(1,1) PRIMARY KEY,
    username VARCHAR(10) UNIQUE NOT NULL,
    registration_date DATE DEFAULT GetDate(),
    password_hash VARBINARY(64) NOT NULL,
	password_reset_token NVARCHAR(255),
	password_reset_expiration DATETIME,
	FOREIGN KEY (username) REFERENCES Kvina_Employees(employees_code)
)
go

-- Tạo hàm băm mật khẩu sử dụng HASHBYTES
CREATE FUNCTION UFU_HashPassword(@input_password NVARCHAR(255))
RETURNS VARBINARY(64)
AS
BEGIN
    DECLARE @hashed_password VARBINARY(64);
    SET @hashed_password = HASHBYTES('SHA2_256', @input_password);
    RETURN @hashed_password;
END;
go

CREATE PROC USP_Kvina_Account_Add
@username VARCHAR(10),
@passwrod nvarchar(255)
As
BEGIN
	IF NOT EXISTS (Select 1 from Kvina_Account Where username = @username)
	INSERT INTO Kvina_Account( username, password_hash ) Values( @username, dbo.UFU_HashPassword(@passwrod) );
END
GO

CREATE PROC USP_GeneratePasswordResetToken (@username nvarchar(50))
AS
BEGIN

    DECLARE @token NVARCHAR(255);
    SET @token = CONVERT(NVARCHAR(255), NEWID());
    UPDATE Kvina_Account SET password_reset_token = @token, password_reset_expiration = DATEADD(MINUTE, 5, GETDATE()) WHERE username = @username;
END
go

CREATE PROC USP_SetPasswordFromToken @username NVARCHAR(50),@token NVARCHAR(255),@new_password NVARCHAR(255)
As
BEGIN	
	IF EXISTS ( SELECT 1 FROM Kvina_Account	WHERE username = @username AND password_reset_token = @token AND password_reset_expiration > GETDATE())
	UPDATE Kvina_Account SET password_hash = dbo.UFU_HashPassword(@new_password) Where username = @username;
END
GO

CREATE PROC USP_CheckLogin @username VARCHAR(10), @password nvarchar(255)
AS
BEGIN
	SELECT employees_status From Kvina_Employees
	INNER JOIN Kvina_Account ON Kvina_Employees.employees_code = Kvina_Account.username
	WHERE username = @username And password_hash = dbo.UFU_HashPassword(@password)
END