class Comics {
  String? copyright;
  Data? data;

  Comics({
    this.copyright,
    this.data,
  });

  Comics.fromJson(Map<String, dynamic> json) {
    copyright = json['copyright'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['copyright'] = copyright;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Results>? results;

  Data({this.results});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? description;
  String? modified;
  String? upc;
  String? format;
  int? pageCount;
  List<TextObjects>? textObjects;
  String? resourceURI;
  List<Prices>? prices;
  Thumbnail? thumbnail;
  int? returned;

  Results({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.description,
    this.modified,
    this.upc,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceURI,
    this.prices,
    this.thumbnail,
    this.returned,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    description = json['description'];
    modified = json['modified'];
    upc = json['upc'];
    format = json['format'];
    pageCount = json['pageCount'];
    if (json['textObjects'] != null) {
      textObjects = <TextObjects>[];
      json['textObjects'].forEach((v) {
        textObjects!.add(TextObjects.fromJson(v));
      });
    }
    resourceURI = json['resourceURI'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['digitalId'] = digitalId;
    data['title'] = title;
    data['issueNumber'] = issueNumber;
    data['description'] = description;
    data['modified'] = modified;
    data['upc'] = upc;
    data['format'] = format;
    data['pageCount'] = pageCount;
    if (textObjects != null) {
      data['textObjects'] = textObjects!.map((v) => v.toJson()).toList();
    }
    data['resourceURI'] = resourceURI;
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['returned'] = returned;
    return data;
  }
}

class TextObjects {
  String? type;
  String? language;
  String? text;

  TextObjects({
    this.type,
    this.language,
    this.text,
  });

  TextObjects.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    language = json['language'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['language'] = language;
    data['text'] = text;
    return data;
  }
}

class Prices {
  String? type;
  dynamic price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['price'] = price;
    return data;
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }
}
