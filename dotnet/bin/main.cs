using System;
using Telegram.Bot;

var botClient = new TelegramBotClient("{YOUR_ACCESS_TOKEN_HERE}");
var me = await botClient.GetMeAsync();
Console.WriteLine(
  $"Hello, World! I am user {me.Id} and my name is {me.FirstName}."
);
