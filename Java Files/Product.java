package Digikala;

import java.util.List;

public class Product {

    private String title;
    private int price;
    private String description;
    private String seller;
    private String imageURL;
    private List<String> galleryUrls;
    private String category;
    private String subCategory;
    private String colors;
    private String sizes;
    private double Rate;
    private String Comments;
    private int Count;
    boolean inBasket = false;
    boolean saved = false;

    public Product(String title, int price, String description, String seller, String imageURL, List<String> galleryUrls, String category, String subCategory, String colors, double rate, String comments, int count,String inBasket, String saved, String sizes) {
        this.title = title;
        this.price = price;
        this.description = description;
        this.seller = seller;
        this.imageURL = imageURL;
        this.galleryUrls = galleryUrls;
        this.category = category;
        this.subCategory = subCategory;
        this.colors = colors;
        Rate = rate;
        Comments = comments;
        Count = count;
        this.inBasket = Boolean.parseBoolean(inBasket);
        this.saved = Boolean.parseBoolean(saved);
        this.sizes = sizes;
    }
}
enum Category {
    FashionAndClothes,
    BooksAndStationary,
    SportsAndTravel,
    DigitalProducts
}

enum SubCategory {
    Woman,
    Men,
    Kids,
    MobliePhone,
    LapTop,
    Camera,
    Book,
    Stationary,
    Music,
    HandCrafts,
    SportClothes,
    SportEquipments,
    TravelAndCampingEquipments
}
