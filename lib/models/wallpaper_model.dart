class WallpaperModel {
  String? photographer;
  SrcModel? src;

  WallpaperModel({
    this.photographer,
    this.src,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      src: SrcModel.fromMap (jsonData["src"]),
      photographer: jsonData["photographer"],
    );
  }
}

class SrcModel {
  String portrait;
  String original;
  String small;

  SrcModel({
    required this.portrait,
    required this.original,
    required this.small,
  });

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      portrait: jsonData["portrait"],
      original: jsonData["original"],
      small: jsonData["small"],
    );
  }
}
