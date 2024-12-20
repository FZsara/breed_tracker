import 'package:flutter/material.dart';

class BreedSelector extends StatelessWidget {
  const BreedSelector({
    Key? key,
    required this.breeds,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  final List<String> breeds;
  final int selectedIndex;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Breed',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12.0),
        Container(
          height: 50.0, // Height of each breed box
          width: screenWidth, // Adapts to screen width
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: breeds.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onChanged(index), // Updates selected breed
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  margin: const EdgeInsets.only(right: 12.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 2.0,
                      color:
                      selectedIndex == index ? Colors.teal : Colors.black,
                    ),
                    color: selectedIndex == index
                        ? Colors.teal.withOpacity(0.2)
                        : Colors.white,
                  ),
                  child: Text(
                    breeds[index],
                    style: TextStyle(
                      fontSize: 14.0,
                      color: selectedIndex == index ? Colors.teal : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
