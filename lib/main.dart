import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_doc/app/app.dart';


void main(){

  setupLogger();

  runApp(const ProviderScope(child: GoogleDocsApp()));
}
