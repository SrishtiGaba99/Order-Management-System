

CREATE TABLE [PRODUCTS](
P_UID BIGINT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_PRODUCTS_P_UID] PRIMARY KEY CLUSTERED,
P_NAME NVARCHAR(MAX) NOT NULL,
P_HEIGHT FLOAT,
P_WEIGHT FLOAT,
P_BARCODE NVARCHAR(20),
P_SKU NVARCHAR(MAX),
P_QUANTITY BIGINT,
P_PICTURE IMAGE
)

CREATE TABLE [USERS](
U_UID BIGINT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_USERS_U_UID] PRIMARY KEY CLUSTERED,
U_USERNAME NVARCHAR(MAX) NOT NULL,
U_FIRSTNAME NVARCHAR(MAX),
U_LASTNAME NVARCHAR(MAX),
U_DOB DATETIME,
U_EMAIL NVARCHAR(MAX),
U_PHONENUMBER BIGINT

)
ALTER TABLE [USERS]
ADD U_R_UID BIGINT  

CREATE TABLE [ADDRESS](
A_UID BIGINT IDENTITY(1,1) NOT NULL 
CONSTRAINT [PK_ADDRESS_A_UID] PRIMARY KEY CLUSTERED,
A_RECIEPIENT_NAME NVARCHAR(MAX) NOT NULL,
A_RECIEPIENT_MOBILE BIGINT,
A_HOUSE_NUM BIGINT,
A_STREET NVARCHAR(MAX),
A_CITY NVARCHAR(MAX),
A_STATE NVARCHAR(MAX),
A_PINCOCDE BIGINT,
A_U_UID BIGINT
CONSTRAINT [FK_ADDRESS_A_U_UID_USERS_U_UID] FOREIGN KEY(A_U_UID) REFERENCES USERS (U_UID)
)

CREATE TABLE [ORDER_STATUS]
(
OS_UID BIGINT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_ORDERS_STATUS_OS_UID] PRIMARY KEY CLUSTERED,
OS_NAME NVARCHAR(MAX)
)

CREATE TABLE [ORDERS](
O_UID BIGINT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_ORDERS_O_UID] PRIMARY KEY CLUSTERED,
O_U_UID BIGINT
CONSTRAINT [FK_ORDERS_O_U_UID_USERS_U_UID] FOREIGN KEY(O_U_UID) REFERENCES USERS (U_UID),
O_A_UID BIGINT
CONSTRAINT [FK_ORDERS_O_A_UID_ADDRESS_A_UID] FOREIGN KEY(O_A_UID) REFERENCES [ADDRESS] (A_UID),
O_OS_UID BIGINT
CONSTRAINT [FK_ORDERS_O_OS_UID_ORDER_STATUS_OS_UID] FOREIGN KEY(O_OS_UID) REFERENCES [ORDER_STATUS] (OS_UID),
O_ORDERDATE DATETIME

)

CREATE TABLE [ORDER_REL_PRODUCT]
(
ORU_UID  BIGINT IDENTITY(1,1) NOT NULL,
ORU_O_UID  BIGINT,
ORU_P_UID BIGINT,
ORU_QUANTITY BIGINT
)

CREATE TABLE [ROLE]
(
R_UID BIGINT IDENTITY(1,1) NOT NULL,
R_NAME NVARCHAR(MAX)
)


CREATE TYPE [DBO].[PRODUCTS_TVP] AS TABLE 
(
	PRODUCT_ID BIGINT
	,QUANTITY BIGINT
)
GO
