import 'package:flutter/material.dart';

class KategoriPage extends StatelessWidget {
  final List<List<String>> categoryContents;
  final int index;

  KategoriPage({required this.index, required this.categoryContents});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.symmetric(vertical:  5, horizontal:  20,),
      child: Column(
        children: [
          Container(
            height:  150,
            width: double.infinity,
            margin: EdgeInsets.only(top:  5),
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.brown),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:  10, left:  10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aksara',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize:  25,
                        ),
                      ),
                      SizedBox(height:  5),
                      Text(
                        categoryContents[index].join('\n'),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize:  25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height:  10), // Adjust the spacing as needed  
          Expanded(
            child: GridView.builder(
              // Remove or comment out the following line to enable scrolling
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:  2, // Number of columns
                mainAxisSpacing:  10,
                crossAxisSpacing:  10,
              ),
        itemCount: getGridItemCount(index),
              itemBuilder: (context, gridIndex) {
                return GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey, // Adjust the color as needed
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        'Item $gridIndex',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
  int getGridItemCount(int index) {
    // Adjust the number of grid items based on the category
    switch (index) {
      case 0:
        return 20; // Aksara Jawa
      case 1:
        return 20; // Sandhangan
      case 2:
        return 10; // Aksara Wilangan
      case 3:
        return 5; // Aksara Rekan
      case 4:
        return 8; // Aksara Murda
      default:
        return 0;
    }
  }
  String getImageUrlFromIndex(int categoryIndex, int gridIndex) {
    // Misalnya, Anda memiliki daftar nama gambar dan URL gambar yang sesuai
    Map<String, List<String>> imageUrls = {
      'Jawa': [
        'https://example.com/jawa_image1.jpg',
        'https://example.com/jawa_image2.jpg',
        // dan seterusnya
      ],
      'Sandhangan': [
        'https://example.com/sandhangan_image1.jpg',
        'https://example.com/sandhangan_image2.jpg',
        // dan seterusnya
      ],
      'Wilangan': [
        'https://example.com/wilangan_image1.jpg',
        'https://example.com/wilangan_image2.jpg',
        // dan seterusnya
      ],
      'Rekan': [
        'https://example.com/rekan_image1.jpg',
        'https://example.com/rekan_image2.jpg',
        // dan seterusnya
      ],
      'Murda': [
        'https://example.com/murda_image1.jpg',
        'https://example.com/murda_image2.jpg',
        // dan seterusnya
      ],
    };

    String categoryName = categoryContents[categoryIndex][gridIndex];
    return imageUrls[categoryName]?[gridIndex] ?? '';
}
}