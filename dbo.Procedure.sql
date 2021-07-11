CREATE PROCEDURE [dbo].[PaymentInsert]
	@PaymentId int,
	@PaymentDate date,
	@BuyId int,
	@UserId int, 
	@Amount int,
	@PaymentType varchar(30)
AS
	insert into PaymentMst values(@PaymentId, @PaymentDate, @BuyId, @UserId, @Amount, @PaymentType)
RETURN 0
