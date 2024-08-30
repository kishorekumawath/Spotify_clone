import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode theme) => emit(theme);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    final themeModeString = json['themeMode'] as String?;
    if (themeModeString == 'light') {
      return ThemeMode.light;
    } else if (themeModeString == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    return {'themeMode': state.toString().split('.').last};
  }
}