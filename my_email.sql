Execute sysmail_add_profile_sp
@profile_name = 'NagadurgaEmailProfile',
@description = 'Nagadurga primary Email Profile'

CREATE USER hp FOR LOGIN [LAPTOP-OIAGH78A\hp];
GO
EXEC sp_addrolemember N'DatabaseMailUserRole', 'hp'

Execute sysmail_add_account_sp
@account_name = 'NagadurgaoduguAccount',
@email_address = 'Nagadurgaodugu',
@display_name = 'Nagadurga Local SQL Email Acct',
@replyto_address = 'Nagadurgaodugu@gmail.com' ,
@description = 'description...',
@mailserver_name = 'smtp.gmail.com',
@mailserver_type = 'SMTP' ,
@port = 587,
@username = 'Nagadurgaodugu@gmail.com',
@password = 'LearnCsharpAndSQL!',
@enable_ssl = 1

Execute sysmail_add_profileaccount_sp
@profile_name = 'NagadurgaEmailProfile',
@account_name = 'NagadurgaoduguAccount',
@sequence_number =1

reconfigure
go

Execute sysmail_update_account_sp
@account_name = 'NagadurgaoduguAccount',
@email_address = 'nagadurgaodugu789@gmail.com',
@display_name = 'Nagadurga Local SQL Email Acct',
@replyto_address = 'nagadurgaodugu789@gmail.com' ,
@description = 'description...',
@mailserver_name = 'smtp.gmail.com',
@mailserver_type = 'SMTP' ,
@port = 587,
@username = 'nagadurgaodugu789',
@password = 'LearnCsharpAndSQL!',
@enable_ssl = 1


EXEC sp_configure 'Database Mail XPs',1
GO
RECONFIGURE
GO

EXEC msdb.dbo.sp_send_dbmail
    @recipients = 'nagadurgaodugu789@gmail.com',
	@copy_recipients ='nagadurgaodugu789@gmail.com',
	@subject = 'Hello from nagadurga! ',
	@body = 'I LOVE YOU!',
	@profile_name = 'NagadurgaEmailProfile'

EXEC sp_configure 'show advanced',1
RECONFIGURE;
EXEC sp_configure;
GO


sysmail_help_queue_sp @queue_type ='Mail'

select * from sysmail_event_log