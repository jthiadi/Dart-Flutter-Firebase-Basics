import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006a61),
      surfaceTint: Color(0xff006a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9ef2e5),
      onPrimaryContainer: Color(0xff005049),
      secondary: Color(0xff4a635f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcce8e3),
      onSecondaryContainer: Color(0xff324b47),
      tertiary: Color(0xff46617a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcde5ff),
      onTertiaryContainer: Color(0xff2e4961),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff161d1c),
      onSurfaceVariant: Color(0xff3f4947),
      outline: Color(0xff6f7977),
      outlineVariant: Color(0xffbec9c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xff82d5c9),
      primaryFixed: Color(0xff9ef2e5),
      onPrimaryFixed: Color(0xff00201d),
      primaryFixedDim: Color(0xff82d5c9),
      onPrimaryFixedVariant: Color(0xff005049),
      secondaryFixed: Color(0xffcce8e3),
      onSecondaryFixed: Color(0xff05201c),
      secondaryFixedDim: Color(0xffb1ccc7),
      onSecondaryFixedVariant: Color(0xff324b47),
      tertiaryFixed: Color(0xffcde5ff),
      onTertiaryFixed: Color(0xff001d32),
      tertiaryFixedDim: Color(0xffaecae6),
      onTertiaryFixedVariant: Color(0xff2e4961),
      surfaceDim: Color(0xffd5dbd9),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f2),
      surfaceContainer: Color(0xffe9efed),
      surfaceContainerHigh: Color(0xffe3eae7),
      surfaceContainerHighest: Color(0xffdde4e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003e38),
      surfaceTint: Color(0xff006a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1c7a70),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223b37),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff58726e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1c394f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff557089),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff0c1211),
      onSurfaceVariant: Color(0xff2e3836),
      outline: Color(0xff4b5452),
      outlineVariant: Color(0xff656f6d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xff82d5c9),
      primaryFixed: Color(0xff1c7a70),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006057),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff58726e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff405a55),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff557089),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3c5770),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1c8c6),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f2),
      surfaceContainer: Color(0xffe3eae7),
      surfaceContainerHigh: Color(0xffd8dedc),
      surfaceContainerHighest: Color(0xffccd3d1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00332e),
      surfaceTint: Color(0xff006a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00534b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff17302d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354e4a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff102e45),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff304c63),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff242e2c),
      outlineVariant: Color(0xff414b49),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xff82d5c9),
      primaryFixed: Color(0xff00534b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003a34),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354e4a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e3733),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff304c63),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff18354c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4bab8),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f0),
      surfaceContainer: Color(0xffdde4e1),
      surfaceContainerHigh: Color(0xffcfd6d3),
      surfaceContainerHighest: Color(0xffc1c8c6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff82d5c9),
      surfaceTint: Color(0xff82d5c9),
      onPrimary: Color(0xff003732),
      primaryContainer: Color(0xff005049),
      onPrimaryContainer: Color(0xff9ef2e5),
      secondary: Color(0xffb1ccc7),
      onSecondary: Color(0xff1c3531),
      secondaryContainer: Color(0xff324b47),
      onSecondaryContainer: Color(0xffcce8e3),
      tertiary: Color(0xffaecae6),
      onTertiary: Color(0xff163349),
      tertiaryContainer: Color(0xff2e4961),
      onTertiaryContainer: Color(0xffcde5ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1513),
      onSurface: Color(0xffdde4e1),
      onSurfaceVariant: Color(0xffbec9c6),
      outline: Color(0xff899390),
      outlineVariant: Color(0xff3f4947),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff006a61),
      primaryFixed: Color(0xff9ef2e5),
      onPrimaryFixed: Color(0xff00201d),
      primaryFixedDim: Color(0xff82d5c9),
      onPrimaryFixedVariant: Color(0xff005049),
      secondaryFixed: Color(0xffcce8e3),
      onSecondaryFixed: Color(0xff05201c),
      secondaryFixedDim: Color(0xffb1ccc7),
      onSecondaryFixedVariant: Color(0xff324b47),
      tertiaryFixed: Color(0xffcde5ff),
      onTertiaryFixed: Color(0xff001d32),
      tertiaryFixedDim: Color(0xffaecae6),
      onTertiaryFixedVariant: Color(0xff2e4961),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff343a39),
      surfaceContainerLowest: Color(0xff090f0e),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff303635),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff98ecdf),
      surfaceTint: Color(0xff82d5c9),
      onPrimary: Color(0xff002b27),
      primaryContainer: Color(0xff4a9e94),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc6e2dd),
      onSecondary: Color(0xff102a26),
      secondaryContainer: Color(0xff7c9691),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc3dffd),
      onTertiary: Color(0xff08283e),
      tertiaryContainer: Color(0xff7894ae),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1513),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dfdc),
      outline: Color(0xffaab4b1),
      outlineVariant: Color(0xff889290),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff00514a),
      primaryFixed: Color(0xff9ef2e5),
      onPrimaryFixed: Color(0xff001512),
      primaryFixedDim: Color(0xff82d5c9),
      onPrimaryFixedVariant: Color(0xff003e38),
      secondaryFixed: Color(0xffcce8e3),
      onSecondaryFixed: Color(0xff001512),
      secondaryFixedDim: Color(0xffb1ccc7),
      onSecondaryFixedVariant: Color(0xff223b37),
      tertiaryFixed: Color(0xffcde5ff),
      onTertiaryFixed: Color(0xff001322),
      tertiaryFixedDim: Color(0xffaecae6),
      onTertiaryFixedVariant: Color(0xff1c394f),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff3f4644),
      surfaceContainerLowest: Color(0xff040808),
      surfaceContainerLow: Color(0xff181f1e),
      surfaceContainer: Color(0xff232928),
      surfaceContainerHigh: Color(0xff2d3432),
      surfaceContainerHighest: Color(0xff383f3e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaefff3),
      surfaceTint: Color(0xff82d5c9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff7ed1c5),
      onPrimaryContainer: Color(0xff000e0c),
      secondary: Color(0xffdaf6f0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffadc8c3),
      onSecondaryContainer: Color(0xff000e0c),
      tertiary: Color(0xffe6f1ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffaac6e2),
      onTertiaryContainer: Color(0xff000c19),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e1513),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2ef),
      outlineVariant: Color(0xffbac5c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff00514a),
      primaryFixed: Color(0xff9ef2e5),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff82d5c9),
      onPrimaryFixedVariant: Color(0xff001512),
      secondaryFixed: Color(0xffcce8e3),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb1ccc7),
      onSecondaryFixedVariant: Color(0xff001512),
      tertiaryFixed: Color(0xffcde5ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffaecae6),
      onTertiaryFixedVariant: Color(0xff001322),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff4b5150),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1a2120),
      surfaceContainer: Color(0xff2b3230),
      surfaceContainerHigh: Color(0xff363d3b),
      surfaceContainerHighest: Color(0xff414847),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
