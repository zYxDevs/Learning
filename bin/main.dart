import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void main() {
  var telegram = Telegram(envVars['BOT_TOKEN']!);
  var event = Event((await telegram.getMe()).username!);

  // reply text
  TeleDart(telegram, event)
    ..start()
    ..onMessage(keyword: 'start')
      .listen((message) => message.reply('Im online!'));

  // reply photo
  teledart
    .onMessage(keyword: 'dart')
    .where((message) => message.text?.contains('telegram') ?? false)
    .listen((message) => message.replyPhoto(
        //  io.File('example/dash_paper_plane.png'),
        'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
        caption: 'This is how the Dart Bird and Telegram are met'));

  // inline mode
  teleledart.onInlineQuery().listen((inlineQuery) => inlineQuery.answer([
      InlineQueryResultArticle(
          id: 'ping',
          title: 'ping',
          input_message_content: InputTextMessageContent(
              message_text: '*Pong*', parse_mode: 'MarkdownV2')),
      InlineQueryResultArticle(
          id: 'ding',
          title: 'ding',
          input_message_content: InputTextMessageContent(
              message_text: '*_Dong_*', parse_mode: 'MarkdownV2')),
    ]));
}
