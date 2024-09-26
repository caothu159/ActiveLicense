# Get current datetime from WorldtimeApi and set to localmachine with current timezone
Set-Date -Date (Invoke-RestMethod -Uri "http://worldtimeapi.org/api/timezone/Asia/Ho_Chi_Minh").datetime