import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A), // Darker black background
      body: Column(
        children: [
          SizedBox(height: 57.0), // Distance from top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 211,
                  height: 122,
                  decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Hello, \nMy Notes',
                      style: TextStyle(
                        fontFamily: 'SofiaPro',
                        fontSize: 45,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.tune, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[700]!, width: 1),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search Here',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                NoteCard(
                  title: 'Task Management App Ui Design',
                  date: '25th May',
                  content: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used.',
                  isNew: true,
                ),
                NoteCard(
                  title: 'Shopping List',
                  date: '12 May',
                  content: '',
                  isNew: false,
                  items: [
                    {'title': 'Apple', 'checked': true},
                    {'title': 'Mango Juice', 'checked': false},
                    {'title': 'Banana 5pcs with', 'checked': false},
                    {'title': 'ButterMilk', 'checked': false},
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF6B4EFD),
        child: Icon(Icons.add, color: Colors.white, size: 28),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String date;
  final String content;
  final bool isNew;
  final List<Map<String, dynamic>>? items; // Optional list for checkbox items

  NoteCard({
    required this.title,
    required this.date,
    required this.content,
    required this.isNew,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2C2C2C),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Icon(Icons.ios_share, color: Colors.grey, size: 20), // Export/upload icon
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          if (content.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 16.0),
              child: Text(
                content,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          if (items != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items!.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 0.0), // Reduced spacing
                    child: Row(
                      children: [
                        Checkbox(
                          value: item['checked'],
                          onChanged: (bool? value) {},
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            item['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: item['checked'] ? TextDecoration.lineThrough : TextDecoration.none,),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: isNew
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Colors.green, size: 12),
                        SizedBox(width: 4),
                        Text(
                          'Just Now',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.access_time, color: Colors.grey, size: 12),
                        SizedBox(width: 4),
                        Text(
                          '1h ago',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}