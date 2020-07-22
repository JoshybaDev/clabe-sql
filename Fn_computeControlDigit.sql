USE [DATABASE]
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_computeControlDigit]    Script Date: 22/07/2020 12:13:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Israel Gómez Rodríguez
-- Create date: 22/07/2020
-- Description:	
--				CALCULAR DIGITO VALIDADOR DE LA CLABE INTERBANCARIA MEXICANA
--				INFORMACION https://es.wikipedia.org/wiki/CLABE#D.C3.ADgito_control
-- =============================================
CREATE FUNCTION [dbo].[Fn_computeControlDigit]
(
	@PRECLABE  VARCHAR(18)
)
RETURNS INT
AS
BEGIN



--DECLARE @PRECLABE AS VARCHAR(18)='07291600213326353'  --3
DECLARE @LARGO AS VARCHAR(18)='37137137137137137'
DECLARE @PRESUMA INT=0
DECLARE @POSICION INT=1
WHILE(@POSICION<18)
	BEGIN
		SET @PRESUMA = @PRESUMA +    ( CAST(SUBSTRING(@PRECLABE,@POSICION,1) AS INT) *  CAST(SUBSTRING(@LARGO,@POSICION,1) AS INT) %10 )
		SET @POSICION=@POSICION+1
	END
SET @PRESUMA =@PRESUMA%10
SET @PRESUMA =(10 - @PRESUMA) % 10
--SELECT @PRESUMA

RETURN @PRESUMA

END