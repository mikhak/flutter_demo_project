// https://sqirlla.com/menu/

import 'dart:math';
import 'food.dart';

final _random = new Random();
int next(int min, int max) => min + _random.nextInt(max - min);

class Menu {
  static List<Food> menu = [
    Food(
        id: "1",
        image: "assets/images/DIS_Avo_Toast.jpg",
        name: "Avocado Toast",
        price: "\$10",
        description:
            "Market avocado, hot pickled carrots, garlic crème fraîche, house za’atar (V)",
        reviews: ["Ten", "Nine"],
        quantity: next(5, 10)),
    Food(
        id: "2",
        image: "assets/images/DIS_Buckwheat.jpg",
        name: "Buckwheat Pancake",
        price: "\$12",
        description:
            "Buckwheat and cactus flour pancake, cocoa nibs pudding, toasted coconut, fresh fruit (V/GF)",
        reviews: ["Ten", "Nine", "Eight", "Four", "One"],
        quantity: next(5, 10)),
    Food(
        id: "3",
        image: "assets/images/DIS_Chopped.jpg",
        name: "The Olive Garden",
        price: "\$13",
        description:
            "Garden of romaine, prosciutto, castelvetrano olive, celery, lacto-fermented onion, creamy italian, herby breadcrumb, midnight moon  (VO/GFO)",
        reviews: [
          "excellent",
          "won't have it again.",
          "delicious",
          "two",
          "three"
        ],
        quantity: next(5, 10)),
    Food(
        id: "4",
        image: "assets/images/DIS_Crispy.jpg",
        name: "Crispy Rice Salad",
        price: "\$12",
        description:
            "Crispy Kokuho Rose brown rice salad with mint, cilantro, cucumber, scallion, lacto-fermented hot sauce, fried egg  (V/GF)",
        reviews: [
          "excellent",
          "won't have it again.",
          "delicious",
          "two",
          "three"
        ],
        quantity: next(15, 30)),
    Food(
        id: "5",
        image: "assets/images/DIS_Hash.jpg",
        name: "The Hash",
        price: "\$14.5",
        description:
            "Weiser potato, Old Bay sprouting cauliflower, leeks, green garlic persillade, fried egg, shu greens (V/VO/GF)",
        reviews: [
          "excellent",
          "won't have it again.",
          "delicious",
          "two",
          "three"
        ],
        quantity: next(1, 5)),
    Food(
        id: "6",
        image: "assets/images/DIS_Hold.jpg",
        name: "Hold The Rice",
        price: "\$10",
        description:
            "Kale marinated in mustard vinaigrette, sorrel pesto, preserved meyer lemon, lacto-fermented hot sauce, watermelon radish, french Sheep feta, poached egg (V/GF)",
        reviews: ["Ten", "Nine", "Eight", "Four", "One"],
        quantity: next(5, 10)),
    Food(
        id: "7",
        image: "assets/images/DIS_Jamon.jpg",
        name: "Jamon Pepín",
        price: "\$14",
        description: "House ham, comté, beurre de baratte butter, mustard",
        reviews: ["Ten", "Nine", "Eight", "Four", "One"],
        quantity: next(5, 10)),
    Food(
        id: "8",
        image: "assets/images/DIS_Rainbow.jpg",
        name: "Famed Ricotta Toast",
        price: "\$9",
        description:
            "Brioche toast w/ house ricotta, and choice of seasonal jam (shown 'rainbow') (V)",
        reviews: ["Ten", "Nine", "Eight", "Four", "One"],
        quantity: next(5, 10)),
    Food(
        id: "9",
        image: "assets/images/DIS_Sorrel.jpg",
        name: "Sorrel Pesto Rice",
        price: "\$9",
        description:
            "Kokuho Rose brown rice, sorrel pesto (nut free), preserved meyer lemon, lacto-fermented hot sauce, watermelon radish, french sheep feta, poached egg  (V/GF)",
        reviews: ["Ten", "Nine"],
        quantity: next(5, 10)),
    Food(
        id: "10",
        image: "assets/images/DIS_Yuban.jpg",
        name: "Yeuban",
        price: "\$16",
        description:
            "Pastrami spiced yuba (organic non-GMO tofu skin from Hodo), fermented jimmy nardello russian dressing *contains cashews*, bread & butter pickles, sauerkraut, Bub's rye (this is a vegetarian sandwich and can be made vegan) (V/VO)",
        reviews: [
          "excellent",
          "won't have it again.",
          "wonderful",
          "tasty",
          "8"
        ],
        quantity: next(5, 10)),
  ];

  static Food getFoodById(id) {
    return menu.where((p) => p.id == id).first;
  }
}
