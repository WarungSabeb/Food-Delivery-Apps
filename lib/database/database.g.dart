// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $OrderTable extends Order with TableInfo<$OrderTable, OrderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _restoNameMeta =
      const VerificationMeta('restoName');
  @override
  late final GeneratedColumn<String> restoName = GeneratedColumn<String>(
      'resto_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _orderTimeMeta =
      const VerificationMeta('orderTime');
  @override
  late final GeneratedColumn<DateTime> orderTime = GeneratedColumn<DateTime>(
      'order_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, restoName, orderTime, price];
  @override
  String get aliasedName => _alias ?? 'order';
  @override
  String get actualTableName => 'order';
  @override
  VerificationContext validateIntegrity(Insertable<OrderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('resto_name')) {
      context.handle(_restoNameMeta,
          restoName.isAcceptableOrUnknown(data['resto_name']!, _restoNameMeta));
    } else if (isInserting) {
      context.missing(_restoNameMeta);
    }
    if (data.containsKey('order_time')) {
      context.handle(_orderTimeMeta,
          orderTime.isAcceptableOrUnknown(data['order_time']!, _orderTimeMeta));
    } else if (isInserting) {
      context.missing(_orderTimeMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      restoName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resto_name'])!,
      orderTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}order_time'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $OrderTable createAlias(String alias) {
    return $OrderTable(attachedDatabase, alias);
  }
}

class OrderData extends DataClass implements Insertable<OrderData> {
  final int id;
  final String restoName;
  final DateTime orderTime;
  final int price;
  const OrderData(
      {required this.id,
      required this.restoName,
      required this.orderTime,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['resto_name'] = Variable<String>(restoName);
    map['order_time'] = Variable<DateTime>(orderTime);
    map['price'] = Variable<int>(price);
    return map;
  }

  OrderCompanion toCompanion(bool nullToAbsent) {
    return OrderCompanion(
      id: Value(id),
      restoName: Value(restoName),
      orderTime: Value(orderTime),
      price: Value(price),
    );
  }

  factory OrderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderData(
      id: serializer.fromJson<int>(json['id']),
      restoName: serializer.fromJson<String>(json['restoName']),
      orderTime: serializer.fromJson<DateTime>(json['orderTime']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'restoName': serializer.toJson<String>(restoName),
      'orderTime': serializer.toJson<DateTime>(orderTime),
      'price': serializer.toJson<int>(price),
    };
  }

  OrderData copyWith(
          {int? id, String? restoName, DateTime? orderTime, int? price}) =>
      OrderData(
        id: id ?? this.id,
        restoName: restoName ?? this.restoName,
        orderTime: orderTime ?? this.orderTime,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('OrderData(')
          ..write('id: $id, ')
          ..write('restoName: $restoName, ')
          ..write('orderTime: $orderTime, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, restoName, orderTime, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderData &&
          other.id == this.id &&
          other.restoName == this.restoName &&
          other.orderTime == this.orderTime &&
          other.price == this.price);
}

class OrderCompanion extends UpdateCompanion<OrderData> {
  final Value<int> id;
  final Value<String> restoName;
  final Value<DateTime> orderTime;
  final Value<int> price;
  const OrderCompanion({
    this.id = const Value.absent(),
    this.restoName = const Value.absent(),
    this.orderTime = const Value.absent(),
    this.price = const Value.absent(),
  });
  OrderCompanion.insert({
    this.id = const Value.absent(),
    required String restoName,
    required DateTime orderTime,
    required int price,
  })  : restoName = Value(restoName),
        orderTime = Value(orderTime),
        price = Value(price);
  static Insertable<OrderData> custom({
    Expression<int>? id,
    Expression<String>? restoName,
    Expression<DateTime>? orderTime,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (restoName != null) 'resto_name': restoName,
      if (orderTime != null) 'order_time': orderTime,
      if (price != null) 'price': price,
    });
  }

  OrderCompanion copyWith(
      {Value<int>? id,
      Value<String>? restoName,
      Value<DateTime>? orderTime,
      Value<int>? price}) {
    return OrderCompanion(
      id: id ?? this.id,
      restoName: restoName ?? this.restoName,
      orderTime: orderTime ?? this.orderTime,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (restoName.present) {
      map['resto_name'] = Variable<String>(restoName.value);
    }
    if (orderTime.present) {
      map['order_time'] = Variable<DateTime>(orderTime.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderCompanion(')
          ..write('id: $id, ')
          ..write('restoName: $restoName, ')
          ..write('orderTime: $orderTime, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $OrderItemTable extends OrderItem
    with TableInfo<$OrderItemTable, OrderItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderIDMeta =
      const VerificationMeta('orderID');
  @override
  late final GeneratedColumn<int> orderID = GeneratedColumn<int>(
      'order_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productIDMeta =
      const VerificationMeta('productID');
  @override
  late final GeneratedColumn<int> productID = GeneratedColumn<int>(
      'product_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, orderID, productID, quantity];
  @override
  String get aliasedName => _alias ?? 'order_item';
  @override
  String get actualTableName => 'order_item';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_i_d')) {
      context.handle(_orderIDMeta,
          orderID.isAcceptableOrUnknown(data['order_i_d']!, _orderIDMeta));
    } else if (isInserting) {
      context.missing(_orderIDMeta);
    }
    if (data.containsKey('product_i_d')) {
      context.handle(
          _productIDMeta,
          productID.isAcceptableOrUnknown(
              data['product_i_d']!, _productIDMeta));
    } else if (isInserting) {
      context.missing(_productIDMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_i_d'])!,
      productID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_i_d'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $OrderItemTable createAlias(String alias) {
    return $OrderItemTable(attachedDatabase, alias);
  }
}

class OrderItemData extends DataClass implements Insertable<OrderItemData> {
  final int id;
  final int orderID;
  final int productID;
  final int quantity;
  const OrderItemData(
      {required this.id,
      required this.orderID,
      required this.productID,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_i_d'] = Variable<int>(orderID);
    map['product_i_d'] = Variable<int>(productID);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  OrderItemCompanion toCompanion(bool nullToAbsent) {
    return OrderItemCompanion(
      id: Value(id),
      orderID: Value(orderID),
      productID: Value(productID),
      quantity: Value(quantity),
    );
  }

  factory OrderItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemData(
      id: serializer.fromJson<int>(json['id']),
      orderID: serializer.fromJson<int>(json['orderID']),
      productID: serializer.fromJson<int>(json['productID']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderID': serializer.toJson<int>(orderID),
      'productID': serializer.toJson<int>(productID),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  OrderItemData copyWith(
          {int? id, int? orderID, int? productID, int? quantity}) =>
      OrderItemData(
        id: id ?? this.id,
        orderID: orderID ?? this.orderID,
        productID: productID ?? this.productID,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('OrderItemData(')
          ..write('id: $id, ')
          ..write('orderID: $orderID, ')
          ..write('productID: $productID, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderID, productID, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemData &&
          other.id == this.id &&
          other.orderID == this.orderID &&
          other.productID == this.productID &&
          other.quantity == this.quantity);
}

class OrderItemCompanion extends UpdateCompanion<OrderItemData> {
  final Value<int> id;
  final Value<int> orderID;
  final Value<int> productID;
  final Value<int> quantity;
  const OrderItemCompanion({
    this.id = const Value.absent(),
    this.orderID = const Value.absent(),
    this.productID = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  OrderItemCompanion.insert({
    this.id = const Value.absent(),
    required int orderID,
    required int productID,
    required int quantity,
  })  : orderID = Value(orderID),
        productID = Value(productID),
        quantity = Value(quantity);
  static Insertable<OrderItemData> custom({
    Expression<int>? id,
    Expression<int>? orderID,
    Expression<int>? productID,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderID != null) 'order_i_d': orderID,
      if (productID != null) 'product_i_d': productID,
      if (quantity != null) 'quantity': quantity,
    });
  }

  OrderItemCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderID,
      Value<int>? productID,
      Value<int>? quantity}) {
    return OrderItemCompanion(
      id: id ?? this.id,
      orderID: orderID ?? this.orderID,
      productID: productID ?? this.productID,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderID.present) {
      map['order_i_d'] = Variable<int>(orderID.value);
    }
    if (productID.present) {
      map['product_i_d'] = Variable<int>(productID.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemCompanion(')
          ..write('id: $id, ')
          ..write('orderID: $orderID, ')
          ..write('productID: $productID, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _restaurantIDMeta =
      const VerificationMeta('restaurantID');
  @override
  late final GeneratedColumn<int> restaurantID = GeneratedColumn<int>(
      'restaurant_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _foodImageMeta =
      const VerificationMeta('foodImage');
  @override
  late final GeneratedColumn<String> foodImage = GeneratedColumn<String>(
      'food_image', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _foodMenuMeta =
      const VerificationMeta('foodMenu');
  @override
  late final GeneratedColumn<String> foodMenu = GeneratedColumn<String>(
      'food_menu', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _foodDescriptionMeta =
      const VerificationMeta('foodDescription');
  @override
  late final GeneratedColumn<String> foodDescription = GeneratedColumn<String>(
      'food_description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _foodPriceMeta =
      const VerificationMeta('foodPrice');
  @override
  late final GeneratedColumn<int> foodPrice = GeneratedColumn<int>(
      'food_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isFoodAvailableMeta =
      const VerificationMeta('isFoodAvailable');
  @override
  late final GeneratedColumn<bool> isFoodAvailable =
      GeneratedColumn<bool>('is_food_available', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_food_available" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        restaurantID,
        foodImage,
        foodMenu,
        foodDescription,
        foodPrice,
        isFoodAvailable
      ];
  @override
  String get aliasedName => _alias ?? 'product';
  @override
  String get actualTableName => 'product';
  @override
  VerificationContext validateIntegrity(Insertable<ProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('restaurant_i_d')) {
      context.handle(
          _restaurantIDMeta,
          restaurantID.isAcceptableOrUnknown(
              data['restaurant_i_d']!, _restaurantIDMeta));
    } else if (isInserting) {
      context.missing(_restaurantIDMeta);
    }
    if (data.containsKey('food_image')) {
      context.handle(_foodImageMeta,
          foodImage.isAcceptableOrUnknown(data['food_image']!, _foodImageMeta));
    } else if (isInserting) {
      context.missing(_foodImageMeta);
    }
    if (data.containsKey('food_menu')) {
      context.handle(_foodMenuMeta,
          foodMenu.isAcceptableOrUnknown(data['food_menu']!, _foodMenuMeta));
    } else if (isInserting) {
      context.missing(_foodMenuMeta);
    }
    if (data.containsKey('food_description')) {
      context.handle(
          _foodDescriptionMeta,
          foodDescription.isAcceptableOrUnknown(
              data['food_description']!, _foodDescriptionMeta));
    } else if (isInserting) {
      context.missing(_foodDescriptionMeta);
    }
    if (data.containsKey('food_price')) {
      context.handle(_foodPriceMeta,
          foodPrice.isAcceptableOrUnknown(data['food_price']!, _foodPriceMeta));
    } else if (isInserting) {
      context.missing(_foodPriceMeta);
    }
    if (data.containsKey('is_food_available')) {
      context.handle(
          _isFoodAvailableMeta,
          isFoodAvailable.isAcceptableOrUnknown(
              data['is_food_available']!, _isFoodAvailableMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      restaurantID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}restaurant_i_d'])!,
      foodImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_image'])!,
      foodMenu: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_menu'])!,
      foodDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}food_description'])!,
      foodPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}food_price'])!,
      isFoodAvailable: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_food_available'])!,
    );
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final int restaurantID;
  final String foodImage;
  final String foodMenu;
  final String foodDescription;
  final int foodPrice;
  final bool isFoodAvailable;
  const ProductData(
      {required this.id,
      required this.restaurantID,
      required this.foodImage,
      required this.foodMenu,
      required this.foodDescription,
      required this.foodPrice,
      required this.isFoodAvailable});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['restaurant_i_d'] = Variable<int>(restaurantID);
    map['food_image'] = Variable<String>(foodImage);
    map['food_menu'] = Variable<String>(foodMenu);
    map['food_description'] = Variable<String>(foodDescription);
    map['food_price'] = Variable<int>(foodPrice);
    map['is_food_available'] = Variable<bool>(isFoodAvailable);
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      restaurantID: Value(restaurantID),
      foodImage: Value(foodImage),
      foodMenu: Value(foodMenu),
      foodDescription: Value(foodDescription),
      foodPrice: Value(foodPrice),
      isFoodAvailable: Value(isFoodAvailable),
    );
  }

  factory ProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      restaurantID: serializer.fromJson<int>(json['restaurantID']),
      foodImage: serializer.fromJson<String>(json['foodImage']),
      foodMenu: serializer.fromJson<String>(json['foodMenu']),
      foodDescription: serializer.fromJson<String>(json['foodDescription']),
      foodPrice: serializer.fromJson<int>(json['foodPrice']),
      isFoodAvailable: serializer.fromJson<bool>(json['isFoodAvailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'restaurantID': serializer.toJson<int>(restaurantID),
      'foodImage': serializer.toJson<String>(foodImage),
      'foodMenu': serializer.toJson<String>(foodMenu),
      'foodDescription': serializer.toJson<String>(foodDescription),
      'foodPrice': serializer.toJson<int>(foodPrice),
      'isFoodAvailable': serializer.toJson<bool>(isFoodAvailable),
    };
  }

  ProductData copyWith(
          {int? id,
          int? restaurantID,
          String? foodImage,
          String? foodMenu,
          String? foodDescription,
          int? foodPrice,
          bool? isFoodAvailable}) =>
      ProductData(
        id: id ?? this.id,
        restaurantID: restaurantID ?? this.restaurantID,
        foodImage: foodImage ?? this.foodImage,
        foodMenu: foodMenu ?? this.foodMenu,
        foodDescription: foodDescription ?? this.foodDescription,
        foodPrice: foodPrice ?? this.foodPrice,
        isFoodAvailable: isFoodAvailable ?? this.isFoodAvailable,
      );
  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('restaurantID: $restaurantID, ')
          ..write('foodImage: $foodImage, ')
          ..write('foodMenu: $foodMenu, ')
          ..write('foodDescription: $foodDescription, ')
          ..write('foodPrice: $foodPrice, ')
          ..write('isFoodAvailable: $isFoodAvailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, restaurantID, foodImage, foodMenu,
      foodDescription, foodPrice, isFoodAvailable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.restaurantID == this.restaurantID &&
          other.foodImage == this.foodImage &&
          other.foodMenu == this.foodMenu &&
          other.foodDescription == this.foodDescription &&
          other.foodPrice == this.foodPrice &&
          other.isFoodAvailable == this.isFoodAvailable);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<int> restaurantID;
  final Value<String> foodImage;
  final Value<String> foodMenu;
  final Value<String> foodDescription;
  final Value<int> foodPrice;
  final Value<bool> isFoodAvailable;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.restaurantID = const Value.absent(),
    this.foodImage = const Value.absent(),
    this.foodMenu = const Value.absent(),
    this.foodDescription = const Value.absent(),
    this.foodPrice = const Value.absent(),
    this.isFoodAvailable = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    required int restaurantID,
    required String foodImage,
    required String foodMenu,
    required String foodDescription,
    required int foodPrice,
    this.isFoodAvailable = const Value.absent(),
  })  : restaurantID = Value(restaurantID),
        foodImage = Value(foodImage),
        foodMenu = Value(foodMenu),
        foodDescription = Value(foodDescription),
        foodPrice = Value(foodPrice);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<int>? restaurantID,
    Expression<String>? foodImage,
    Expression<String>? foodMenu,
    Expression<String>? foodDescription,
    Expression<int>? foodPrice,
    Expression<bool>? isFoodAvailable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (restaurantID != null) 'restaurant_i_d': restaurantID,
      if (foodImage != null) 'food_image': foodImage,
      if (foodMenu != null) 'food_menu': foodMenu,
      if (foodDescription != null) 'food_description': foodDescription,
      if (foodPrice != null) 'food_price': foodPrice,
      if (isFoodAvailable != null) 'is_food_available': isFoodAvailable,
    });
  }

  ProductCompanion copyWith(
      {Value<int>? id,
      Value<int>? restaurantID,
      Value<String>? foodImage,
      Value<String>? foodMenu,
      Value<String>? foodDescription,
      Value<int>? foodPrice,
      Value<bool>? isFoodAvailable}) {
    return ProductCompanion(
      id: id ?? this.id,
      restaurantID: restaurantID ?? this.restaurantID,
      foodImage: foodImage ?? this.foodImage,
      foodMenu: foodMenu ?? this.foodMenu,
      foodDescription: foodDescription ?? this.foodDescription,
      foodPrice: foodPrice ?? this.foodPrice,
      isFoodAvailable: isFoodAvailable ?? this.isFoodAvailable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (restaurantID.present) {
      map['restaurant_i_d'] = Variable<int>(restaurantID.value);
    }
    if (foodImage.present) {
      map['food_image'] = Variable<String>(foodImage.value);
    }
    if (foodMenu.present) {
      map['food_menu'] = Variable<String>(foodMenu.value);
    }
    if (foodDescription.present) {
      map['food_description'] = Variable<String>(foodDescription.value);
    }
    if (foodPrice.present) {
      map['food_price'] = Variable<int>(foodPrice.value);
    }
    if (isFoodAvailable.present) {
      map['is_food_available'] = Variable<bool>(isFoodAvailable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('restaurantID: $restaurantID, ')
          ..write('foodImage: $foodImage, ')
          ..write('foodMenu: $foodMenu, ')
          ..write('foodDescription: $foodDescription, ')
          ..write('foodPrice: $foodPrice, ')
          ..write('isFoodAvailable: $isFoodAvailable')
          ..write(')'))
        .toString();
  }
}

class $RestaurantTable extends Restaurant
    with TableInfo<$RestaurantTable, RestaurantData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RestaurantTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _restoNameMeta =
      const VerificationMeta('restoName');
  @override
  late final GeneratedColumn<String> restoName = GeneratedColumn<String>(
      'resto_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _restoRatingMeta =
      const VerificationMeta('restoRating');
  @override
  late final GeneratedColumn<double> restoRating = GeneratedColumn<double>(
      'resto_rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _restoDistanceMeta =
      const VerificationMeta('restoDistance');
  @override
  late final GeneratedColumn<double> restoDistance = GeneratedColumn<double>(
      'resto_distance', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _restoImageMeta =
      const VerificationMeta('restoImage');
  @override
  late final GeneratedColumn<String> restoImage = GeneratedColumn<String>(
      'resto_image', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _restoJudgesMeta =
      const VerificationMeta('restoJudges');
  @override
  late final GeneratedColumn<String> restoJudges = GeneratedColumn<String>(
      'resto_judges', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _restoLocationMeta =
      const VerificationMeta('restoLocation');
  @override
  late final GeneratedColumn<String> restoLocation = GeneratedColumn<String>(
      'resto_location', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _restoEstPriceMeta =
      const VerificationMeta('restoEstPrice');
  @override
  late final GeneratedColumn<String> restoEstPrice = GeneratedColumn<String>(
      'resto_est_price', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _estMinimumMeta =
      const VerificationMeta('estMinimum');
  @override
  late final GeneratedColumn<int> estMinimum = GeneratedColumn<int>(
      'est_minimum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _estMaximumMeta =
      const VerificationMeta('estMaximum');
  @override
  late final GeneratedColumn<int> estMaximum = GeneratedColumn<int>(
      'est_maximum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isRecommendedMeta =
      const VerificationMeta('isRecommended');
  @override
  late final GeneratedColumn<bool> isRecommended =
      GeneratedColumn<bool>('is_recommended', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_recommended" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        restoName,
        restoRating,
        restoDistance,
        restoImage,
        restoJudges,
        restoLocation,
        restoEstPrice,
        estMinimum,
        estMaximum,
        isRecommended
      ];
  @override
  String get aliasedName => _alias ?? 'restaurant';
  @override
  String get actualTableName => 'restaurant';
  @override
  VerificationContext validateIntegrity(Insertable<RestaurantData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('resto_name')) {
      context.handle(_restoNameMeta,
          restoName.isAcceptableOrUnknown(data['resto_name']!, _restoNameMeta));
    } else if (isInserting) {
      context.missing(_restoNameMeta);
    }
    if (data.containsKey('resto_rating')) {
      context.handle(
          _restoRatingMeta,
          restoRating.isAcceptableOrUnknown(
              data['resto_rating']!, _restoRatingMeta));
    } else if (isInserting) {
      context.missing(_restoRatingMeta);
    }
    if (data.containsKey('resto_distance')) {
      context.handle(
          _restoDistanceMeta,
          restoDistance.isAcceptableOrUnknown(
              data['resto_distance']!, _restoDistanceMeta));
    } else if (isInserting) {
      context.missing(_restoDistanceMeta);
    }
    if (data.containsKey('resto_image')) {
      context.handle(
          _restoImageMeta,
          restoImage.isAcceptableOrUnknown(
              data['resto_image']!, _restoImageMeta));
    } else if (isInserting) {
      context.missing(_restoImageMeta);
    }
    if (data.containsKey('resto_judges')) {
      context.handle(
          _restoJudgesMeta,
          restoJudges.isAcceptableOrUnknown(
              data['resto_judges']!, _restoJudgesMeta));
    } else if (isInserting) {
      context.missing(_restoJudgesMeta);
    }
    if (data.containsKey('resto_location')) {
      context.handle(
          _restoLocationMeta,
          restoLocation.isAcceptableOrUnknown(
              data['resto_location']!, _restoLocationMeta));
    } else if (isInserting) {
      context.missing(_restoLocationMeta);
    }
    if (data.containsKey('resto_est_price')) {
      context.handle(
          _restoEstPriceMeta,
          restoEstPrice.isAcceptableOrUnknown(
              data['resto_est_price']!, _restoEstPriceMeta));
    } else if (isInserting) {
      context.missing(_restoEstPriceMeta);
    }
    if (data.containsKey('est_minimum')) {
      context.handle(
          _estMinimumMeta,
          estMinimum.isAcceptableOrUnknown(
              data['est_minimum']!, _estMinimumMeta));
    } else if (isInserting) {
      context.missing(_estMinimumMeta);
    }
    if (data.containsKey('est_maximum')) {
      context.handle(
          _estMaximumMeta,
          estMaximum.isAcceptableOrUnknown(
              data['est_maximum']!, _estMaximumMeta));
    } else if (isInserting) {
      context.missing(_estMaximumMeta);
    }
    if (data.containsKey('is_recommended')) {
      context.handle(
          _isRecommendedMeta,
          isRecommended.isAcceptableOrUnknown(
              data['is_recommended']!, _isRecommendedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RestaurantData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RestaurantData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      restoName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resto_name'])!,
      restoRating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}resto_rating'])!,
      restoDistance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}resto_distance'])!,
      restoImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resto_image'])!,
      restoJudges: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resto_judges'])!,
      restoLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resto_location'])!,
      restoEstPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}resto_est_price'])!,
      estMinimum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}est_minimum'])!,
      estMaximum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}est_maximum'])!,
      isRecommended: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_recommended'])!,
    );
  }

  @override
  $RestaurantTable createAlias(String alias) {
    return $RestaurantTable(attachedDatabase, alias);
  }
}

class RestaurantData extends DataClass implements Insertable<RestaurantData> {
  final int id;
  final String restoName;
  final double restoRating;
  final double restoDistance;
  final String restoImage;
  final String restoJudges;
  final String restoLocation;
  final String restoEstPrice;
  final int estMinimum;
  final int estMaximum;
  final bool isRecommended;
  const RestaurantData(
      {required this.id,
      required this.restoName,
      required this.restoRating,
      required this.restoDistance,
      required this.restoImage,
      required this.restoJudges,
      required this.restoLocation,
      required this.restoEstPrice,
      required this.estMinimum,
      required this.estMaximum,
      required this.isRecommended});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['resto_name'] = Variable<String>(restoName);
    map['resto_rating'] = Variable<double>(restoRating);
    map['resto_distance'] = Variable<double>(restoDistance);
    map['resto_image'] = Variable<String>(restoImage);
    map['resto_judges'] = Variable<String>(restoJudges);
    map['resto_location'] = Variable<String>(restoLocation);
    map['resto_est_price'] = Variable<String>(restoEstPrice);
    map['est_minimum'] = Variable<int>(estMinimum);
    map['est_maximum'] = Variable<int>(estMaximum);
    map['is_recommended'] = Variable<bool>(isRecommended);
    return map;
  }

  RestaurantCompanion toCompanion(bool nullToAbsent) {
    return RestaurantCompanion(
      id: Value(id),
      restoName: Value(restoName),
      restoRating: Value(restoRating),
      restoDistance: Value(restoDistance),
      restoImage: Value(restoImage),
      restoJudges: Value(restoJudges),
      restoLocation: Value(restoLocation),
      restoEstPrice: Value(restoEstPrice),
      estMinimum: Value(estMinimum),
      estMaximum: Value(estMaximum),
      isRecommended: Value(isRecommended),
    );
  }

  factory RestaurantData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RestaurantData(
      id: serializer.fromJson<int>(json['id']),
      restoName: serializer.fromJson<String>(json['restoName']),
      restoRating: serializer.fromJson<double>(json['restoRating']),
      restoDistance: serializer.fromJson<double>(json['restoDistance']),
      restoImage: serializer.fromJson<String>(json['restoImage']),
      restoJudges: serializer.fromJson<String>(json['restoJudges']),
      restoLocation: serializer.fromJson<String>(json['restoLocation']),
      restoEstPrice: serializer.fromJson<String>(json['restoEstPrice']),
      estMinimum: serializer.fromJson<int>(json['estMinimum']),
      estMaximum: serializer.fromJson<int>(json['estMaximum']),
      isRecommended: serializer.fromJson<bool>(json['isRecommended']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'restoName': serializer.toJson<String>(restoName),
      'restoRating': serializer.toJson<double>(restoRating),
      'restoDistance': serializer.toJson<double>(restoDistance),
      'restoImage': serializer.toJson<String>(restoImage),
      'restoJudges': serializer.toJson<String>(restoJudges),
      'restoLocation': serializer.toJson<String>(restoLocation),
      'restoEstPrice': serializer.toJson<String>(restoEstPrice),
      'estMinimum': serializer.toJson<int>(estMinimum),
      'estMaximum': serializer.toJson<int>(estMaximum),
      'isRecommended': serializer.toJson<bool>(isRecommended),
    };
  }

  RestaurantData copyWith(
          {int? id,
          String? restoName,
          double? restoRating,
          double? restoDistance,
          String? restoImage,
          String? restoJudges,
          String? restoLocation,
          String? restoEstPrice,
          int? estMinimum,
          int? estMaximum,
          bool? isRecommended}) =>
      RestaurantData(
        id: id ?? this.id,
        restoName: restoName ?? this.restoName,
        restoRating: restoRating ?? this.restoRating,
        restoDistance: restoDistance ?? this.restoDistance,
        restoImage: restoImage ?? this.restoImage,
        restoJudges: restoJudges ?? this.restoJudges,
        restoLocation: restoLocation ?? this.restoLocation,
        restoEstPrice: restoEstPrice ?? this.restoEstPrice,
        estMinimum: estMinimum ?? this.estMinimum,
        estMaximum: estMaximum ?? this.estMaximum,
        isRecommended: isRecommended ?? this.isRecommended,
      );
  @override
  String toString() {
    return (StringBuffer('RestaurantData(')
          ..write('id: $id, ')
          ..write('restoName: $restoName, ')
          ..write('restoRating: $restoRating, ')
          ..write('restoDistance: $restoDistance, ')
          ..write('restoImage: $restoImage, ')
          ..write('restoJudges: $restoJudges, ')
          ..write('restoLocation: $restoLocation, ')
          ..write('restoEstPrice: $restoEstPrice, ')
          ..write('estMinimum: $estMinimum, ')
          ..write('estMaximum: $estMaximum, ')
          ..write('isRecommended: $isRecommended')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      restoName,
      restoRating,
      restoDistance,
      restoImage,
      restoJudges,
      restoLocation,
      restoEstPrice,
      estMinimum,
      estMaximum,
      isRecommended);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestaurantData &&
          other.id == this.id &&
          other.restoName == this.restoName &&
          other.restoRating == this.restoRating &&
          other.restoDistance == this.restoDistance &&
          other.restoImage == this.restoImage &&
          other.restoJudges == this.restoJudges &&
          other.restoLocation == this.restoLocation &&
          other.restoEstPrice == this.restoEstPrice &&
          other.estMinimum == this.estMinimum &&
          other.estMaximum == this.estMaximum &&
          other.isRecommended == this.isRecommended);
}

class RestaurantCompanion extends UpdateCompanion<RestaurantData> {
  final Value<int> id;
  final Value<String> restoName;
  final Value<double> restoRating;
  final Value<double> restoDistance;
  final Value<String> restoImage;
  final Value<String> restoJudges;
  final Value<String> restoLocation;
  final Value<String> restoEstPrice;
  final Value<int> estMinimum;
  final Value<int> estMaximum;
  final Value<bool> isRecommended;
  const RestaurantCompanion({
    this.id = const Value.absent(),
    this.restoName = const Value.absent(),
    this.restoRating = const Value.absent(),
    this.restoDistance = const Value.absent(),
    this.restoImage = const Value.absent(),
    this.restoJudges = const Value.absent(),
    this.restoLocation = const Value.absent(),
    this.restoEstPrice = const Value.absent(),
    this.estMinimum = const Value.absent(),
    this.estMaximum = const Value.absent(),
    this.isRecommended = const Value.absent(),
  });
  RestaurantCompanion.insert({
    this.id = const Value.absent(),
    required String restoName,
    required double restoRating,
    required double restoDistance,
    required String restoImage,
    required String restoJudges,
    required String restoLocation,
    required String restoEstPrice,
    required int estMinimum,
    required int estMaximum,
    this.isRecommended = const Value.absent(),
  })  : restoName = Value(restoName),
        restoRating = Value(restoRating),
        restoDistance = Value(restoDistance),
        restoImage = Value(restoImage),
        restoJudges = Value(restoJudges),
        restoLocation = Value(restoLocation),
        restoEstPrice = Value(restoEstPrice),
        estMinimum = Value(estMinimum),
        estMaximum = Value(estMaximum);
  static Insertable<RestaurantData> custom({
    Expression<int>? id,
    Expression<String>? restoName,
    Expression<double>? restoRating,
    Expression<double>? restoDistance,
    Expression<String>? restoImage,
    Expression<String>? restoJudges,
    Expression<String>? restoLocation,
    Expression<String>? restoEstPrice,
    Expression<int>? estMinimum,
    Expression<int>? estMaximum,
    Expression<bool>? isRecommended,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (restoName != null) 'resto_name': restoName,
      if (restoRating != null) 'resto_rating': restoRating,
      if (restoDistance != null) 'resto_distance': restoDistance,
      if (restoImage != null) 'resto_image': restoImage,
      if (restoJudges != null) 'resto_judges': restoJudges,
      if (restoLocation != null) 'resto_location': restoLocation,
      if (restoEstPrice != null) 'resto_est_price': restoEstPrice,
      if (estMinimum != null) 'est_minimum': estMinimum,
      if (estMaximum != null) 'est_maximum': estMaximum,
      if (isRecommended != null) 'is_recommended': isRecommended,
    });
  }

  RestaurantCompanion copyWith(
      {Value<int>? id,
      Value<String>? restoName,
      Value<double>? restoRating,
      Value<double>? restoDistance,
      Value<String>? restoImage,
      Value<String>? restoJudges,
      Value<String>? restoLocation,
      Value<String>? restoEstPrice,
      Value<int>? estMinimum,
      Value<int>? estMaximum,
      Value<bool>? isRecommended}) {
    return RestaurantCompanion(
      id: id ?? this.id,
      restoName: restoName ?? this.restoName,
      restoRating: restoRating ?? this.restoRating,
      restoDistance: restoDistance ?? this.restoDistance,
      restoImage: restoImage ?? this.restoImage,
      restoJudges: restoJudges ?? this.restoJudges,
      restoLocation: restoLocation ?? this.restoLocation,
      restoEstPrice: restoEstPrice ?? this.restoEstPrice,
      estMinimum: estMinimum ?? this.estMinimum,
      estMaximum: estMaximum ?? this.estMaximum,
      isRecommended: isRecommended ?? this.isRecommended,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (restoName.present) {
      map['resto_name'] = Variable<String>(restoName.value);
    }
    if (restoRating.present) {
      map['resto_rating'] = Variable<double>(restoRating.value);
    }
    if (restoDistance.present) {
      map['resto_distance'] = Variable<double>(restoDistance.value);
    }
    if (restoImage.present) {
      map['resto_image'] = Variable<String>(restoImage.value);
    }
    if (restoJudges.present) {
      map['resto_judges'] = Variable<String>(restoJudges.value);
    }
    if (restoLocation.present) {
      map['resto_location'] = Variable<String>(restoLocation.value);
    }
    if (restoEstPrice.present) {
      map['resto_est_price'] = Variable<String>(restoEstPrice.value);
    }
    if (estMinimum.present) {
      map['est_minimum'] = Variable<int>(estMinimum.value);
    }
    if (estMaximum.present) {
      map['est_maximum'] = Variable<int>(estMaximum.value);
    }
    if (isRecommended.present) {
      map['is_recommended'] = Variable<bool>(isRecommended.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantCompanion(')
          ..write('id: $id, ')
          ..write('restoName: $restoName, ')
          ..write('restoRating: $restoRating, ')
          ..write('restoDistance: $restoDistance, ')
          ..write('restoImage: $restoImage, ')
          ..write('restoJudges: $restoJudges, ')
          ..write('restoLocation: $restoLocation, ')
          ..write('restoEstPrice: $restoEstPrice, ')
          ..write('estMinimum: $estMinimum, ')
          ..write('estMaximum: $estMaximum, ')
          ..write('isRecommended: $isRecommended')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, email, password, phone, name];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String email;
  final String password;
  final String phone;
  final String name;
  const UserData(
      {required this.id,
      required this.email,
      required this.password,
      required this.phone,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['phone'] = Variable<String>(phone);
    map['name'] = Variable<String>(name);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      email: Value(email),
      password: Value(password),
      phone: Value(phone),
      name: Value(name),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      phone: serializer.fromJson<String>(json['phone']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'phone': serializer.toJson<String>(phone),
      'name': serializer.toJson<String>(name),
    };
  }

  UserData copyWith(
          {int? id,
          String? email,
          String? password,
          String? phone,
          String? name}) =>
      UserData(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('phone: $phone, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, password, phone, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.email == this.email &&
          other.password == this.password &&
          other.phone == this.phone &&
          other.name == this.name);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> password;
  final Value<String> phone;
  final Value<String> name;
  const UserCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.phone = const Value.absent(),
    this.name = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String password,
    required String phone,
    required String name,
  })  : email = Value(email),
        password = Value(password),
        phone = Value(phone),
        name = Value(name);
  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? phone,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (phone != null) 'phone': phone,
      if (name != null) 'name': name,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? email,
      Value<String>? password,
      Value<String>? phone,
      Value<String>? name}) {
    return UserCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('phone: $phone, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CartDBTable extends CartDB with TableInfo<$CartDBTable, CartDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _foodNameMeta =
      const VerificationMeta('foodName');
  @override
  late final GeneratedColumn<String> foodName = GeneratedColumn<String>(
      'food_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, foodName, quantity, price];
  @override
  String get aliasedName => _alias ?? 'cart_d_b';
  @override
  String get actualTableName => 'cart_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<CartDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('food_name')) {
      context.handle(_foodNameMeta,
          foodName.isAcceptableOrUnknown(data['food_name']!, _foodNameMeta));
    } else if (isInserting) {
      context.missing(_foodNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartDBData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      foodName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_name'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $CartDBTable createAlias(String alias) {
    return $CartDBTable(attachedDatabase, alias);
  }
}

class CartDBData extends DataClass implements Insertable<CartDBData> {
  final int id;
  final String foodName;
  final int quantity;
  final int price;
  const CartDBData(
      {required this.id,
      required this.foodName,
      required this.quantity,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['food_name'] = Variable<String>(foodName);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<int>(price);
    return map;
  }

  CartDBCompanion toCompanion(bool nullToAbsent) {
    return CartDBCompanion(
      id: Value(id),
      foodName: Value(foodName),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory CartDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartDBData(
      id: serializer.fromJson<int>(json['id']),
      foodName: serializer.fromJson<String>(json['foodName']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'foodName': serializer.toJson<String>(foodName),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<int>(price),
    };
  }

  CartDBData copyWith({int? id, String? foodName, int? quantity, int? price}) =>
      CartDBData(
        id: id ?? this.id,
        foodName: foodName ?? this.foodName,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('CartDBData(')
          ..write('id: $id, ')
          ..write('foodName: $foodName, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, foodName, quantity, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartDBData &&
          other.id == this.id &&
          other.foodName == this.foodName &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class CartDBCompanion extends UpdateCompanion<CartDBData> {
  final Value<int> id;
  final Value<String> foodName;
  final Value<int> quantity;
  final Value<int> price;
  const CartDBCompanion({
    this.id = const Value.absent(),
    this.foodName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  CartDBCompanion.insert({
    this.id = const Value.absent(),
    required String foodName,
    required int quantity,
    required int price,
  })  : foodName = Value(foodName),
        quantity = Value(quantity),
        price = Value(price);
  static Insertable<CartDBData> custom({
    Expression<int>? id,
    Expression<String>? foodName,
    Expression<int>? quantity,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (foodName != null) 'food_name': foodName,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
    });
  }

  CartDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? foodName,
      Value<int>? quantity,
      Value<int>? price}) {
    return CartDBCompanion(
      id: id ?? this.id,
      foodName: foodName ?? this.foodName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (foodName.present) {
      map['food_name'] = Variable<String>(foodName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartDBCompanion(')
          ..write('id: $id, ')
          ..write('foodName: $foodName, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $OrderTable order = $OrderTable(this);
  late final $OrderItemTable orderItem = $OrderItemTable(this);
  late final $ProductTable product = $ProductTable(this);
  late final $RestaurantTable restaurant = $RestaurantTable(this);
  late final $UserTable user = $UserTable(this);
  late final $CartDBTable cartDB = $CartDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [order, orderItem, product, restaurant, user, cartDB];
}
