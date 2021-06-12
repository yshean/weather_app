abstract class Images {
  static const _basePath = 'assets/images/';

  static const _sun = 'sun.png';
  static const _sunWithCloud = 'sun_with_cloud.png';
  static const _cloud = 'cloud.png';

  static String get sun => _basePath + _sun;
  static String get sunWithCloud => _basePath + _sunWithCloud;
  static String get cloud => _basePath + _cloud;
}
