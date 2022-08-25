import 'dart:convert';

class ProductModel {
  static List<Items> item = [
    Items(
      id: 1,
      title: "shoes",
      price: 999,
      image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      category: "snikers",
      description: 'hello',
    ),
    Items(
      id: 1,
      title: "shoes",
      price: 999,
      image: "https://www.wallpapersin4k.org/wp-content/uploads/2017/04/Nike-Shoes-HD-Wallpaper-10.jpg",
      category: "snikers",
      description: 'hello',
    ),
    Items(
      id: 1,
      title: "shoes",
      price: 999,
      image: "https://th.bing.com/th/id/R.a3c91bfb5490b062cb4bea1d3478b653?rik=9Uxo0%2bjdLQ8B2A&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f3%2fe%2fb%2f713214-cool-shoes-hd-wallpapers-1920x1280-photos.jpg&ehk=Gzk7NDAzXP02LphvP8XItFtcmhfafqzOGcqdnAFZEs4%3d&risl=&pid=ImgRaw&r=0",
      category: "snikers",
      description: 'hello',
    ),
    Items(
      id: 1,
      title: "shoes",
      price: 999,
      image: "https://www.hdwallpapers.in/download/red_nike_shoe_in_black_background_4k_hd_nike-HD.jpg",
      category: "snikers",
      description: 'hello',
    ),
    Items(
      id: 1,
      title: "shoes",
      price: 999,
      image: "https://th.bing.com/th/id/R.830110d653d6a1a68c3a67fa6d59e8ab?rik=i%2fMEE8hpj9EbTQ&riu=http%3a%2f%2fwallpapersdsc.net%2fwp-content%2fuploads%2f2017%2f04%2fShoe-Download-Free-Backgrounds-HD.jpg&ehk=Oj5MFcyQ3%2fIj%2bBNp8lFO6JTF87SPhEeXi68fJ8lbDN0%3d&risl=&pid=ImgRaw&r=0",
      category: "snikers",
      description: 'hello',
    ),
    Items(
      id: 1,
      title: "shoes",
      price: 999,
      image: "https://wallpapercave.com/wp/wp2461042.jpg",
      category: "snikers",
      description: 'hello',
    ),
    Items(
      id: 1,
      title: "shoes",
      price: 999,
      image: "https://www.hdwallpapers.in/download/green_white_red_nike_shoe_in_blur_light_background_hd_nike-1600x900.jpg",
      category: "snikers",
      description: 'hello',
    ),
  ];
}

class Items {
  final int id;
  final String title;
  final int price;
  final String image;
  final String category;
  final String description;

  Items({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });

  Items.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        description = json['description'],
        id = json['id'],
        image = json['image'],
        price = json['price'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'category': category,
        'description': description,
        'id': id,
        'image': image,
        'price': price,
        'title': title,
      };
}
