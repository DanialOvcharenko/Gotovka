//
//  Dish.swift
//  Gotovka
//
//  Created by Mac on 03.08.2022.
//

import Foundation
import UIKit

class Dish {
    
    var dishes = [[DishModel]]()
    
    init(){
        setup()
    }
    
    func setup(){
        let testDish = DishModel(
            name: "Hot sandwiches",
            countryOfOrigin: "USA",
            image: UIImage(named: "sandwich") ?? UIImage(),
            TypeOfDish: .easy,
            descript: "Simple, hearty and very tasty food - hot sandwiches stuffed with sausage and cheese. Sandwiches acquire an appetizing crispy ruddy crust thanks to frying in an interesting egg-tomato seasoning with spices. Excellent breakfast or snack from quite affordable products",
            recept: "\n1) Prepare food items on the list. I have white toast bread, but if desired, it can be replaced with slices of regular white bread. Instead of dried garlic and dill, you can use about 1-2 cloves of fresh garlic, peeled and passed through a press, and fresh dill, finely chopped with a knife. \n2) Place 2 slices of cheese on one slice of bread. Put 2 slices of sausage on top of the cheese. \n3) Lay 2 slices of cheese on top. Cover with another slice of bread. Crack one egg into a bowl and beat lightly with a fork. Add about half of dried garlic (1/4 tsp) and half of dried dill (1/4 tsp). Mix. \n4) Add half of the ketchup (1 teaspoon). Mix again. Dip in the egg mixture for about 5-10 seconds so that the sandwich is well soaked. Then turn the sandwich on the other side and also leave in the egg mixture for about 5-10 seconds to soak. \n5) Heat vegetable oil in a frying pan. Fry the sandwich over medium heat for about 2-3 minutes on each side, until golden brown. \n6) In the same way, collect the second sandwich, prepare the egg mixture with ketchup, soak the sandwich in it and fry it in a pan. Cut the finished sandwich in half diagonally and serve.",
            ingridients: ["bread ", "cheeze ", "sausage ", "eggs ", "ketchup ", "dried dill ", "dried garlic ", "vegetable oil "],
            time: 150)
        
        let poachedEgg = DishModel(
            name: "Poached egg",
            countryOfOrigin: "France",
            image: UIImage(named: "eggPashot") ?? UIImage(),
            TypeOfDish: .easy,
            descript: "They're a particularly good source of vitamin A and zinc, two nutrients important for a robust immune system. At about 540 international units of vitamin A, two poached eggs provide up to 23 percent of your daily vitamin A needs. And the 1.3 milligrams of zinc covers 12 to 16 percent of your zinc requirements.",
            recept: "\n1) The egg is cooked in a regular cling film, you will not have to worry that the protein will spread throughout the pan. Cut off a rectangular piece of food film, put it in a small deep container and grease the film with olive oil. Crack an egg into the hole (you can add salt if you like). \n2) Gather the ends of the film together, tie in a knot or tie with a thread. Bring the water to a boil in a saucepan, reduce the heat and lower the bag of eggs into the water. \n3) Boil the egg in the film for 3-4 minutes, depending on the desired consistency. Remove the poached egg from the water and carefully remove the cling film. A poached egg can be served with Italian pasta, various sauces, or simply put on toast with a leaf of lettuce and a slice of fresh tomato.",
            ingridients: ["water ", "egg(-s) ", "olive oil "],
            time: 210)
        
        let omlet = DishModel(
            name: "Omlet",
            countryOfOrigin: "France",
            image: UIImage(named: "omlet") ?? UIImage(),
            TypeOfDish: .easy,
            descript: "They're a particularly good source of vitamin A and zinc, two nutrients important for a robust immune system. At about 540 international units of vitamin A, two poached eggs provide up to 23 percent of your daily vitamin A needs. And the 1.3 milligrams of zinc covers 12 to 16 percent of your zinc requirements.",
            recept: "\n1) Break the eggs into a deep bowl. Add salt. Whisk with a fork or whisk until smooth. Add milk. Mix thoroughly. In a frying pan over medium heat, heat the vegetable oil. Pour the egg mixture into the skillet. \n2) Reduce the heat to a minimum, cover the pan with a lid and cook the omelet for about 5 minutes, until the egg mass is completely set.The most delicate omelette in milk is ready.",
            ingridients: ["water ", "egg(-s) ", "oil ", "salt "],
            time: 300)
        
        let classicFriedEggs = DishModel(
            name: "Classic fried eggs",
            countryOfOrigin: "All",
            image: UIImage(named: "friedEgg") ?? UIImage(),
            TypeOfDish: .easy,
            descript: "They're a particularly good source of vitamin A and zinc, two nutrients important for a robust immune system. At about 540 international units of vitamin A, two poached eggs provide up to 23 percent of your daily vitamin A needs. And the 1.3 milligrams of zinc covers 12 to 16 percent of your zinc requirements.",
            recept: "\n1) Lightly heat the skillet. Pour in vegetable oil or melt butter. After that, turn off the gas for 30-40 seconds or move the container to a cold burner - thanks to this, the dishes will not overheat and the eggs will fry evenly. Although if you like crispy edges, you can skip this step. Add eggs carefully. \n2) You can break them immediately above the pan or into a small separate container, then pour into the pan. Reduce fire to minimum. If you cook scrambled eggs over high heat, they can burn. And due to weak heating, the eggs will be fried slowly and evenly, while the edges will not dry out. If, on the contrary, you want a crispy crust, use moderate or medium heat. \n3) Sometimes, if the eggs are not spread enough, some of the protein around the yolk remains watery. If you don't like it, carefully rip it apart with a fork, making sure not to hit the yolk. This should be done when the lower part of the protein turns white. Fry the eggs over low heat for 4-5 minutes. If the temperature is higher, it will take a little less time. The dish will be ready when the protein turns white and seizes. Do not forget that the yolk should remain liquid. It is better to salt the eggs at the end of cooking or after serving.",
            ingridients: ["oil ", "egg(-s) ", "salt "],
            time: 270)
        
        let pasta = DishModel(
            name: "Pasta",
            countryOfOrigin: "Italy",
            image: UIImage(named: "pasta") ?? UIImage(),
            TypeOfDish: .easy,
            descript: "Pasta - pasta in the form of tubes of different diameters and lengths. Macaroni is often referred to as any type of pasta. Other types of tubular products include feathers, horns, and snails.",
            recept: "Boil water, salt and put pasta in boiling water, boil until tender, season with butter and serve to your favorite",
            ingridients: ["water ", "pasta ", "salt ", "oil "],
            time: 600)
        
        let pancakes = DishModel(
            name: "Pancakes",
            countryOfOrigin: "Ukraine",
            image: UIImage(named: "pancake") ?? UIImage(),
            TypeOfDish: .easy,
            descript: "Ukrainian pancakes belong to the traditional cuisine of the Eastern Slavs, in this case it belongs to Ukrainian cuisine. Traditionally, they are made on a yeast dough, the dough is kneaded in water or milk and baked in an oven or in a frying pan. Consider who and when invented pancakes, the history of their appearance, the origin of the name, composition and cooking technology.",
            recept: "\n1) Break the eggs into a deep bowl. Add sugar and salt. Beat eggs and sugar thoroughly with a whisk or mixer. Then add milk. Whisk the mixture well. Sift flour. Add flour in small portions, beating the pancake dough well with a whisk so that there are no lumps. Then add vegetable oil. Mix. Pancake dough is ready to bake. Heat the pan well, pour 1 teaspoon of vegetable oil for the first time and spread it over the pan (conveniently with a silicone brush). \n2) Pour the batter into the pan (half or 2/3 of a ladle, depending on the size of the pan). Quickly swirling the pan, spread the batter in a thin layer across the bottom of the pan. Bake a thin pancake over medium heat on one side for 1-2 minutes, until golden brown. Then turn over and bake the pancake on the other side for about 0.5 minutes more.",
            ingridients: ["milk ", "egg(-s) ", "oil ", "flour ", "shugar"],
            time: 120)
        
        let buckwheat = DishModel(
            name: "Buckwheat",
            countryOfOrigin: "China",
            image: UIImage(named: "buckwheat") ?? UIImage(),
            TypeOfDish: .easy,
            descript: "Buckwheat in different countries may differ in properties. In addition, we all have different tastes, someone likes crumbly buckwheat, while someone likes it more tender and tender. Over time, you will surely find your golden mean - your ratio of water and buckwheat. I want to tell you how to cook delicious buckwheat, which we love to eat, and suddenly you will like it",
            recept: "\n1) Pour water into a saucepan and put it on fire. While the water is boiling, you can have time to sort out the buckwheat (if necessary). And rinse. Salt boiled water. And pour all the buckwheat into the pan. Yes, in order to make it even tastier, buckwheat can be put in a dry frying pan and calcined, warmed up so that all excess moisture is gone, but if you don’t have time for these manipulations, then you can do it easier - cook buckwheat right away. \n2) Cook buckwheat over medium heat for 15-20 minutes, but then you need to be more careful: there will come a moment when there will be very little water left over buckwheat. Add oil to a saucepan, stir and reduce heat to low. Now it remains to cook buckwheat under the lid until fully cooked (do not overdo it - we need boiled buckwheat, not fried.",
            ingridients: ["buckwheat grain ", "water ", "oil ", "salt "],
            time: 1050)
        
        let easyArray = [testDish, poachedEgg, omlet, classicFriedEggs, pasta, pancakes, buckwheat]
        
        
        let saladCaesar = DishModel(
            name: "Salad Caesar",
            countryOfOrigin: "Mexico",
            image: UIImage(named: "saladCaesar") ?? UIImage(),
            TypeOfDish: .normal,
            descript: "So tasty salad",
            recept: "\n1) Cut the bread into small cubes. Pour a little vegetable oil into the pan, put the peeled and crushed garlic clove. Put the sliced bread, mix. Fry the croutons on the smallest fire until crispy. They need to be stirred from time to time. If the garlic starts to burn, remove it. That is why it does not need to be crushed much. Cut the chicken fillet into small medallions of the same size. Salt and pepper them. \n2) Fry the fillet in a pan with a little vegetable oil on both sides until golden brown. Remove the finished fillet from the pan and cool. Prepare the ingredients for making the sauce. Please note that the taste of the future sauce directly depends on the ingredients chosen for it. Choose the mustard that you like, but preferably not very spicy so that it does not clog the taste of the rest of the ingredients. \n3) Cheese and butter should be of high quality, tasty. Choose a fresh egg. Place the egg in a glass and cover with boiling water. Hold it like this for a minute or two. Thus, it will not be cooked, but it will be well disinfected. Break the prepared egg into a glass for whisking, put the parmesan, mustard, sugar, salt, oil and chopped garlic. \n4) Whisk all ingredients in short pulses until smooth. It will turn out not very thick, but still a little thicker than water. Cut the cooled fillet into small pieces. Tear the lettuce leaves into the bottom of the plate. Pour dressing over salad. Arrange chicken pieces and chopped tomatoes. Put croutons on top. Sprinkle with grated parmesan. And in conclusion, once again pour the entire salad with dressing. Serve immediately so that the croutons do not have time to soak.",
            ingridients: ["salad iceberg ", "chicken ", "tomato cherry ", "bread ", "cheese parmezan ", "garlic ", "oil ", "salt ", "ground black pepper ", "olive oil ", "egg(-s) ", "mustard ", "shugar "],
            time: 900)
        
        let chickenChops = DishModel(
            name: "Chicken chops",
            countryOfOrigin: "Austria",
            image: UIImage(named: "chicken chops") ?? UIImage(),
            TypeOfDish: .normal,
            descript: "Chops are one of the easiest dishes to make with meat. But at the same time, simplicity does not affect the taste, on the contrary, it turns out to be excellent, so it will not be a shame to invite guests to dine. Chops are fairly large pieces of meat, beaten with a special hammer to a flat state. Fried in breadcrumbs and eggs (which positively affects the taste and juiciness).",
            recept: "\n1) To prepare a delicious meat dish in the form of chicken chops, you will need two chicken breasts. We wash them, cut the breasts lengthwise into two identical parts. We remove the veins and fat. Add salt, ground black pepper and other spices that you use for meat dishes to taste. We beat off each piece with a special hammer. \n2) Once again, you can add a little spice. For batter, we need flour and chicken eggs. Before frying, roll each piece in a bowl with flour. Then place the pieces in a bowl with eggs. They should be slightly fluffy. \n3) You can add a little salt and black pepper to the egg mixture. Next, we transfer a piece of chicken meat to a hot frying pan, where we fry on both sides until a beautiful golden crust forms on the chops. We do this with each piece. As a result, we get delicious and tender chicken chops, which should be served hot to relatives and guests.",
            ingridients: ["chicken fillet ", "egg(-s) ", "flour ", "ground black pepper ", "salt ", "sunflower oil "],
            time: 600)
        
        let syrniki = DishModel(
            name: "Syrniki",
            countryOfOrigin: "Ukraine",
            image: UIImage(named: "syrniki") ?? UIImage(),
            TypeOfDish: .normal,
            descript: "Homemade syrniki is a warm dish in a special way that evokes the most pleasant associations. Some people ask why they are called that way, because the main ingredient of the dish is not cheese at all, but cottage cheese. The fact is that the well-known name of this fermented milk product was obtained only in the 18th century. Until that time, in Ukraine, cottage cheese was simply called “cheese”, and dishes from it were called “cheese” (in old books, for example, Easter is called “cheese”). By the way, thick cottage cheese pancakes (that is, homemade cheesecakes) have been cooked in our country for a long time: for example, they were served at Shrovetide along with fluffy yeast pancakes or thin pancakes.",
            recept: "\n1) Transfer cottage cheese (400 g) to a small glass or plastic bowl. Add a pinch of salt, one egg, 3 tbsp. l. sugar, and 10 g vanilla sugar. I don't like cheesecakes to be very sweet, but you can add a little more sugar, like 4 tbsp. l. \n2) Cottage cheese for cheesecakes can be used both market and store. The main thing is that it should not be sour and not very wet. If you use store-bought cottage cheese, then take cottage cheese in soft plastic bags. After you put all the ingredients in a bowl, mix them until you get a homogeneous mass. \n3) To do this, it is best to use a regular fork, spoon or potato masher. To the resulting curd mixture, add 3 tbsp. l. wheat flour. If the cottage cheese turned out to be wet enough, then add one tablespoon of flour more. But the main thing is not to overdo it so that the cheesecakes turn out tender. \n4) Moisten your hands with a little sunflower oil and roll small balls 3-4 cm in diameter from the curd mass. Flatten the balls with your hands to make beautiful small cheesecakes. Now bread the cheesecakes in flour so that they do not lose their shape and are fried to a delicious crust. Heat up a non-stick frying pan with 3-4 tbsp. l. sunflower oil over medium heat. \n5) The pan for cheesecakes should warm up well. Don't reduce the heat when frying, so you get the perfect roast. Make sure the cheesecakes don't burn. In order to get a beautiful golden crust, I fried cheesecakes for 2-3 minutes on each side. But it may take you a little more or less time. \n6) To remove excess oil from the finished cheesecakes, first transfer them to a paper towel. Then transfer the cheesecakes to serving plates, sprinkle with a little powdered sugar, add jam or sour cream.",
            ingridients: ["cottage cheese ", "egg(-s) ", "flour ", "sugar ", "sunflower oil ", "salt ", "vanilla sugar "],
            time: 360)
        
        let eda3 = DishModel(name: "eda3", countryOfOrigin: "Italy", image: UIImage(named: "pasta") ?? UIImage(), TypeOfDish: .normal, descript: "text of description Lorem Ipsum - это текст-'рыба', часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной 'рыбой' для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.", recept: "text Lorem Ipsum - это текст-'рыба'", ingridients: ["water ", "pasta "], time: 360)
        
        let normalArray = [saladCaesar, chickenChops, syrniki, eda3]
        
        let borscht = DishModel(
            name: "Borscht",
            countryOfOrigin: "Ukraine",
            image: UIImage(named: "Borscht") ?? UIImage(),
            TypeOfDish: .hard,
            descript: "text of description",
            recept: "text",
            ingridients: ["water ", "potato "],
            time: 360)
        
        let SarzuelaFishAndSeafood = DishModel(
            name: "Sarzuela fish and seafood",
            countryOfOrigin: "Spain",
            image: UIImage(named: "sarsuella") ?? UIImage(),
            TypeOfDish: .hard,
            descript: "Fish zarzuela is a Catalan dish popular in the Spanish Levant. Sometimes fish zarzuela is called 'Spanish bouillabaisse' or 'paella without rice'. Zarzuela is a ceremonial, difficult to prepare and expensive dish that requires a large number of ingredients. Usually it is prepared for a festive meal with the family or for large ceremonial feasts. Like paella, the preparation of zarzuela often turns into a public event, surrounded by rituals and entertainment.",
            recept: "1.Bouillon. I loaded the small fish into a large saucepan, as is - without cleaning it. In Spain, a variety of small marine fish under the common name morraia (morralla) is sold specifically for broths. 2. Filleted perch and monkfish. I sent the bones, head, fins, skin to a pot with small things, poured 3 liters of water, chopped leeks, carrots, onions, celery, added a bunch of parsley and bay leaf, salt. 3. Cooked fish with vegetables for about 1 hour over medium heat. Then the finished broth was filtered through a fine sieve. I froze the excess for future paella. 4. Picada. Soaked ñora peppers in boiling water. On low heat, I fried the baguette pieces until golden brown, and there I brought the garlic cloves to softness, but not allowing it to burn. 5. From the inside of the soaked peppers, he scraped off the pulp, mixed it in a mortar with almonds, garlic, and bread already crushed into crumbs. Added a handful of chopped parsley, saffron. All diligently pounded into a homogeneous mixture. I poured in a little fish broth - this is to make it easier to mix the contents of the mortar. 6. Roast (sofrito). Two medium-sized squids washed and cut into rings, in a wide and deep clay pan over medium heat, fried on each side until golden brown, no longer. Put aside. 7. After fried shrimp and lobster. Very fast, 20 seconds on each side. Shellfish should be dry and at room temperature. To the side. 8. Next, in a frying pan, chopped onions and bell peppers were brought to softness. Added grated tomato (without peel), paprika and bay leaf, stewed over low heat for 7 minutes. In the meantime, on the next burner, he evaporated the alcohol from the wine, at least 5 minutes after boiling. He poured wine into a pan with vegetables, simmered over low heat for another 10 minutes. 9. Zarzuela. I put large pieces of monkfish and perch to the sofrito, medium fire. I fried the fish for a couple of minutes. 10. Then I added shrimp and lobster, shellfish, poured broth to the top of the contents of the pan, salted and peppered (this is optional). 11. He immediately scattered the picada on top, covered it with a lid, lowered the fire and shaking the pan, and without interfering with its contents, stewed until the shells of the mollusks opened. Immediately after, the container can be put in the oven under a hot grill for 1-2 minutes, “dry” the surface of the zarzuela. But do not be zealous - dry shrimp and shellfish are inedible. 12. Serve fish and seafood sarzuela immediately. But I liked it more cold, the very next day.",
            ingridients: ["vongole shells ", "monkfish ", "sea bass ", "shrimp ", "squid ", "mussels in shells ", "red bell pepper ", "onion ", "celery ", "sweet paprika ", "dry white wine ", "bay leaf ", "parsley ", "carrot ", "olive oil ", "ground black pepper ", "salt ", "peeled almonds ", "dry niora pepper ", "french baguette ", "chopped parsley ", "saffron ", "small fish ", "lobsters", "tomatoes"],
            time: 1800)
        
        let Test = DishModel(name: "Test", countryOfOrigin: "Test", image: UIImage(named: "test") ?? UIImage(), TypeOfDish: .hard, descript: "text of description Lorem Ipsum - это текст-'рыба', часто используемый в печати и вэб-дизайне. test", recept: "test", ingridients: ["water ", "pasta "], time: 60)
        
        let hardArray = [borscht, SarzuelaFishAndSeafood, Test]
        
        dishes.append(easyArray)
        dishes.append(normalArray)
        dishes.append(hardArray)
    }
}
