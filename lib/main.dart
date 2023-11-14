import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quantomail/src/widgets/main_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  //Set Default Language
  Intl.defaultLocale = "en";
  //Error Handling
  FlutterError.onError = (details) {
    if (kDebugMode) {
      print(details);
    }
    // print(details.exceptionAsString(), stackTrace: details.stack);
  };

  runApp(const MyApp());
}
