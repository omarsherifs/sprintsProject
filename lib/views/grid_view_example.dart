import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({super.key});

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  List<GridData> gridDataList = [
    GridData(name: "Omar", color: Colors.blue),
    GridData(name: "Ali", color: Colors.red),
    GridData(name: "Ahmed", color: Colors.yellow),
    GridData(name: "Mohamed", color: Colors.purple),
    GridData(name: "Sara", color: Colors.green),
    GridData(name: "Fatima", color: Colors.orange),
    GridData(name: "Hassan", color: Colors.teal),
    GridData(name: "Aisha", color: Colors.pink),
    GridData(name: "Youssef", color: Colors.cyan),
    GridData(name: "Layla", color: Colors.lime),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8, // Aspect ratio of each grid item
        ),
        itemCount: gridDataList.length,
        itemBuilder: (context, index) {
          return FittedBox(
            child: Container(
              color: gridDataList[index].color,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(gridDataList[index].name, style: TextStyle(color: Colors.white)),
                      Icon(Icons.person, color: Colors.white, size: 10),
                    ],
                  ),

                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Text(gridDataList[index].name, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GridData {
  final String name;
  final Color color;
  GridData({required this.name, required this.color});
}
