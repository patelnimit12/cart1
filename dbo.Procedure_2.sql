CREATE PROCEDURE [dbo].[CityInsert]
	@CityId int,
@CityName varchar(30) 

AS
	insert into CityMst values(@CityId, @CityName)
RETURN 0
