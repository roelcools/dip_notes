import 'package:firebase_analytics/firebase_analytics.dart';

// async method to send analytics data to firebase
sendAnalyticsEvent({String nameEvent, String nameRoute}) async {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  await analytics.logEvent(
    name: nameEvent,
    parameters: <String, dynamic>{
      'currentPage': nameRoute,
      'param_2': 3,
      'param_3': 12345677,
      'param_4': 12.356746,
      'param_5': true,
    },
  );
  print('event logged');
}
