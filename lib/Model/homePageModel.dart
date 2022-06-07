class HomePageModel {
  int? statusCode;
  bool? status;
  Banner? banner;
  List<HorizontalSlider>? horizontalSlider;
  String? message;

  HomePageModel(
      {this.statusCode,
        this.status,
        this.banner,
        this.horizontalSlider,
        this.message});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    status = json['status'];
    banner =
    json['banner'] != null ? Banner.fromJson(json['banner']) : null;
    if (json['horizontal_slider'] != null) {
      horizontalSlider = <HorizontalSlider>[];
      json['horizontal_slider'].forEach((v) {
        horizontalSlider!.add(HorizontalSlider.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['status'] = this.status;
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
    }
    if (this.horizontalSlider != null) {
      data['horizontal_slider'] =
          this.horizontalSlider!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Banner {
  String? banner;
  String? bannerTitle;

  Banner({this.banner, this.bannerTitle});

  Banner.fromJson(Map<String, dynamic> json) {
    banner = json['banner'];
    bannerTitle = json['banner_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['banner'] = this.banner;
    data['banner_title'] = this.bannerTitle;
    return data;
  }
}

class HorizontalSlider {
  String? heading;
  String? nameSlug;
  Null? typeImage;
  String? createdAt;
  String? updatedAt;
  List<Data>? data;

  HorizontalSlider(
      {this.heading,
        this.nameSlug,
        this.typeImage,
        this.createdAt,
        this.updatedAt,
        this.data});

  HorizontalSlider.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    nameSlug = json['name_slug'];
    typeImage = json['type_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['heading'] = this.heading;
    data['name_slug'] = this.nameSlug;
    data['type_image'] = this.typeImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? listingImage;
  String? actualPrice;
  String? price;
  int? currency;
  String? currencyCode;
  Null? rating;
  int? ratingCount;

  Data(
      {this.id,
        this.title,
        this.description,
        this.listingImage,
        this.actualPrice,
        this.price,
        this.currency,
        this.currencyCode,
        this.rating,
        this.ratingCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    listingImage = json['listing_image'];
    actualPrice = json['actual_price'];
    price = json['price'];
    currency = json['currency'];
    currencyCode = json['currency_code'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['listing_image'] = this.listingImage;
    data['actual_price'] = this.actualPrice;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['currency_code'] = this.currencyCode;
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    return data;
  }
}