CREATE PROCEDURE [dbo].[CityNameCheck]
	@CityName varchar(30)
AS
	select CityName from CityMst where CityName=@CityName
RETURN 0
