class Bike {
  Bike({
    this.id,
    this.title,
    this.price,
    this.image,
    this.gear,
    this.size,
    this.description,
    this.idCategory,
    this.idStore,
    this.idVendor,
    this.country,
    this.featured,
    this.model,
    this.modelId,
    this.wheelSize,
    this.frameMaterial,
    this.ridingStyle,
    this.frameSize,
    this.type,
    this.brakeType,
    this.usedFor,
    this.brandId,
    this.flavorId,
    this.nutritionBrandId,
    this.nutritionModelId,
    this.createdAt,
    this.updatedAt,
    this.discipline,
    this.idAdmin,
    this.rate,
  });

  int id;
  String title;
  int price;
  String image;
  String gear;
  String size;
  String description;
  int idCategory;
  int idStore;
  int idVendor;
  String country;
  int featured;
  String model;
  int modelId;
  String wheelSize;
  String frameMaterial;
  String ridingStyle;
  String frameSize;
  String type;
  String brakeType;
  String usedFor;
  int brandId;
  dynamic flavorId;
  int nutritionBrandId;
  int nutritionModelId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic discipline;
  dynamic idAdmin;
  int rate;

  factory Bike.fromJson(Map<String, dynamic> json) => Bike(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    image: json["image"],
    gear: json["gear"],
    size: json["size"] == null ? null : json["size"],
    description: json["description"],
    idCategory: json["id_category"],
    idStore: json["id_store"],
    idVendor: json["id_vendor"],
    country: json["country"],
    featured: json["featured"],
    model: json["model"] == null ? null : json["model"],
    modelId: json["model_id"] == null ? null : json["model_id"],
    wheelSize: json["wheel_size"] == null ? null : json["wheel_size"],
    frameMaterial: json["frame_material"] == null ? null : json["frame_material"],
    ridingStyle: json["riding_style"] == null ? null : json["riding_style"],
    frameSize: json["frame_size"] == null ? null : json["frame_size"],
    type: json["type"] == null ? null : json["type"],
    brakeType: json["brake_type"] == null ? null : json["brake_type"],
    usedFor: json["used_for"] == null ? null : json["used_for"],
    brandId: json["brand_id"] == null ? null : json["brand_id"],
    flavorId: json["flavor_id"],
    nutritionBrandId: json["nutrition_brand_id"] == null ? null : json["nutrition_brand_id"],
    nutritionModelId: json["nutrition_model_id"] == null ? null : json["nutrition_model_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    discipline: json["discipline"],
    idAdmin: json["id_admin"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "image": image,
    "gear": gear,
    "size": size == null ? null : size,
    "description": description,
    "id_category": idCategory,
    "id_store": idStore,
    "id_vendor": idVendor,
    "country": country,
    "featured": featured,
    "model": model == null ? null : model,
    "model_id": modelId == null ? null : modelId,
    "wheel_size": wheelSize == null ? null : wheelSize,
    "frame_material": frameMaterial == null ? null : frameMaterial,
    "riding_style": ridingStyle == null ? null : ridingStyle,
    "frame_size": frameSize == null ? null : frameSize,
    "type": type == null ? null : type,
    "brake_type": brakeType == null ? null : brakeType,
    "used_for": usedFor == null ? null : usedFor,
    "brand_id": brandId == null ? null : brandId,
    "flavor_id": flavorId,
    "nutrition_brand_id": nutritionBrandId == null ? null : nutritionBrandId,
    "nutrition_model_id": nutritionModelId == null ? null : nutritionModelId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "discipline": discipline,
    "id_admin": idAdmin,
    "rate": rate,
  };

  @override
  String toString() {
    return 'Bike{id: $id, title: $title, price: $price, image: $image, gear: $gear, size: $size, description: $description, idCategory: $idCategory, idStore: $idStore, idVendor: $idVendor, country: $country, featured: $featured, model: $model, modelId: $modelId, wheelSize: $wheelSize, frameMaterial: $frameMaterial, ridingStyle: $ridingStyle, frameSize: $frameSize, type: $type, brakeType: $brakeType, usedFor: $usedFor, brandId: $brandId, flavorId: $flavorId, nutritionBrandId: $nutritionBrandId, nutritionModelId: $nutritionModelId, createdAt: $createdAt, updatedAt: $updatedAt, discipline: $discipline, idAdmin: $idAdmin, rate: $rate}';
  }
}