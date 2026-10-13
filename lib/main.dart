import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Map<String, dynamic>> users = const [
    {"name": "Ahmed Mansour", "position": "Flutter Developer"},
    {"name": "Sara Ali", "position": "UI/UX Designer"},
    {"name": "Mohamed Hassan", "position": "Project Manager"},
    {"name": "Ahmed Mansour", "position": "Flutter Developer"},
    {"name": "Sara Ali", "position": "UI/UX Designer"},
    {"name": "Mohamed Hassan", "position": "Project Manager"},
    {"name": "Ahmed Mansour", "position": "Flutter Developer"},
    {"name": "Sara Ali", "position": "UI/UX Designer"},
    {"name": "Mohamed Hassan", "position": "Project Manager"},
    {"name": "Ahmed Mansour", "position": "Flutter Developer"},
    {"name": "Sara Ali", "position": "UI/UX Designer"},
    {"name": "Mohamed Hassan", "position": "Project Manager"},
    {"name": "Ahmed Mansour", "position": "Flutter Developer"},
    {"name": "Sara Ali", "position": "UI/UX Designer"},
    {"name": "Mohamed Hassan", "position": "Project Manager"},
    {"name": "Ahmed Mansour", "position": "Flutter Developer"},
    {"name": "Sara Ali", "position": "UI/UX Designer"},
    {"name": "Mohamed Hassan", "position": "Project Manager"},
  ];

  Widget _welcomeSection() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                child: const Icon(Icons.person_pin, color: Colors.white),
              ),

              const SizedBox(width: 12),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    "Admin Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              _buildStatCard("Total Staff", "12"),
              const SizedBox(width: 8),
              _buildStatCard("Active Today", "3"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String number) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Text("Search team member...", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _filterList() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          _buildFilterChip("All (3)", true),
          _buildFilterChip("Developers", false),
          _buildFilterChip("Designers", false),
          _buildFilterChip("Managers", false),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _employeeList() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
                child: const Icon(Icons.person, color: Colors.blueAccent),
              ),
              title: Text(
                user["name"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text("${user["position"]}"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            ),
          );
        },
      ),
    );
  }

  Widget _buttonTabBar() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.all(12),
        // color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "Add New Member",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Color(0xDB12255B),
        appBar: AppBar(
          title: const Text('Dashboard & Users'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),

        body: Column(
          children: [
            _welcomeSection(),
            const SizedBox(height: 16),
            const SizedBox(width: 8),
            _searchBar(),
            const SizedBox(height: 12),
            _filterList(),
            const SizedBox(height: 8),
            _employeeList(),
            _buttonTabBar(),
          ],
        ),
      ),
    );
  }
}
