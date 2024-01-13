import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:test_app/provider/cat_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int preIndex = 0;
  int postIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
        title: const Text('All Categories'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.mic),
          ),
        ],
      ),
      body: Row(
        children: [
          SafeArea(
            child: SizedBox(
              width: 87,
              child: ListView.builder(
                  itemCount: railCategories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          preIndex = currentIndex - 1;
                          postIndex = currentIndex + 1;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 87,
                            padding: const EdgeInsets.only(
                                left: 12, right: 5, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? Colors.white
                                  : Theme.of(context)
                                      .colorScheme
                                      .inversePrimary
                                      .withOpacity(0.4),
                              border: index != 0
                                  ? const Border(
                                      top: BorderSide(
                                          color: Colors.white, width: 1),
                                    )
                                  : null,
                              borderRadius:
                                  preIndex == index || postIndex == index
                                      ? BorderRadius.only(
                                          topRight: postIndex == index
                                              ? const Radius.circular(20)
                                              : Radius.zero,
                                          bottomRight: preIndex == index
                                              ? const Radius.circular(20)
                                              : Radius.zero,
                                        )
                                      : null,
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      railCategories[index].catImageUrl,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Image.asset(
                                              'images/loadingImage.png');
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  railCategories[index].catName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          /* 
                        Let's Animate the indicator Container

                        Add the dependecy flutter_animate to pubspec.yaml
                         */
                          currentIndex == index
                              ? Positioned(
                                  left: 2,
                                  top: 5,
                                  bottom: 5,
                                  child: Container(
                                    width: 7,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(8)),
                                  ).animate().scaleY(),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            child: SubCategories(
              currentIndex: currentIndex,
            ),
          )
        ],
      ),
    );
  }
}

class SubCategories extends StatelessWidget {
  final int currentIndex;
  const SubCategories({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final List subCategoryItems = [
      forYouItems,
      groceryItems,
      fashionItems,
      appliancesItems,
      mobilesItems,
      electronicsItems,
      homeItems,
      furnitureItems,
      personalCareItems,
      toysAndBayItems,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 5 / 6,
          crossAxisSpacing: 15,
          mainAxisSpacing: 8,
        ),
        itemCount: subCategoryItems[currentIndex].length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    subCategoryItems[currentIndex][index].catImageUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Image.asset('images/loadingImage.png');
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subCategoryItems[currentIndex][index].catName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }
}


// Let's add the sub categories for the categories