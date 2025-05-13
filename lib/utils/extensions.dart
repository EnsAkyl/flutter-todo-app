/* Bu extentions, BuildContext üzerinden kolayca bazı yaygın özelliklere (tema,renk,ekran boyutu)
erişimi sağlar. Normalde uzun uzun yazacağımız koduları tek satıra indirir.*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this); //_theme adında özel bir getter tanımlanır. Theme.of(centext) demek yerine _theme diyerek ulaşabiliryoruz.

  TextTheme get textTheme => _theme.textTheme;//Yazı stillerine kolay erişim.

  ColorScheme get colorScheme => _theme.colorScheme;//Uygulamanın renk şemasına ulaşmak için.(context.colorSheme.primary kullanmak yeterli olur.)

  Size get deviceSize => MediaQuery.sizeOf(this);//Ekran boyutunu almak için
}
