CREATE TABLE [dbo].[Pos_Credits]
(
[id_distributor] [int] NOT NULL,
[id_pos] [int] NOT NULL,
[dt_credit] [datetime] NOT NULL,
[amount] [numeric] (10, 2) NULL,
[type_dc] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[id_vendedor] [int] NULL,
[data_vencimento] [datetime] NULL,
[data_pagamento] [datetime] NULL,
[valor_pagamento] [numeric] (18, 2) NULL,
[tipo_transacao] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[username] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pin] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id_transaction_number] [uniqueidentifier] NULL,
[id_pos_recharge_transaction] [int] NULL,
[discount_margin] [float] NULL,
[ID] [bigint] NOT NULL IDENTITY(209000000, 1),
[confirmation_date] [datetime] NULL,
[id_external_transaction] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pos_Credits] ADD CONSTRAINT [PK_Pos_Credits] PRIMARY KEY CLUSTERED  ([id_distributor], [id_pos], [dt_credit], [type_dc]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_06] ON [dbo].[Pos_Credits] ([confirmation_date]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_02] ON [dbo].[Pos_Credits] ([dt_credit], [id_vendedor], [amount]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UK_POS_CREDITS_ID] ON [dbo].[Pos_Credits] ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_03] ON [dbo].[Pos_Credits] ([id_distributor], [dt_credit], [id_pos], [type_dc], [amount]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_07] ON [dbo].[Pos_Credits] ([id_external_transaction]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_04] ON [dbo].[Pos_Credits] ([id_pos], [type_dc]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Pos_Credits_02] ON [dbo].[Pos_Credits] ([type_dc]) ON [PRIMARY]
GO
