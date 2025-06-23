import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning App',
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Image.asset("assets/study.png", height: 200),
          const SizedBox(height: 30),
          const Text(
            "Learning is Everything",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: Text(
              "Learning with Pleasure with Dear Programmer, Wherever you are.",
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
            },
            child: const Text("Get Start"),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text("Hi, Programmer"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search here...",
              prefixIcon: const Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildIconTile(Icons.category, "Category"),
              _buildIconTile(Icons.class_, "Classes"),
              _buildIconTile(Icons.school, "Free Course"),
              _buildIconTile(Icons.book, "BookStore"),
              _buildIconTile(Icons.live_tv, "Live Course"),
              _buildIconTile(Icons.leaderboard, "LeaderBoard"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Courses", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("See All", style: TextStyle(color: Colors.deepPurple)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildCourseCard(context, "Flutter", "assets/flutter.png")),
              const SizedBox(width: 12),
              Expanded(child: _buildCourseCard(context, "React Native", "assets/react.png")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconTile(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(icon, color: Colors.deepPurple),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCourseCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const CourseDetailPage()));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(imagePath, height: 60),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Text("55 Videos", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}


class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset("assets/flutter.png", height: 100),
            const SizedBox(height: 10),
            const Text("Flutter Complete Course", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Created by Dear Programmer\n55 Videos", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ToggleButtons(
              borderRadius: BorderRadius.circular(10),
              isSelected: const [true, false],
              children: const [
                Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Videos")),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Description")),
              ],
              onPressed: (int index) {},
              selectedColor: Colors.white,
              fillColor: Colors.deepPurple,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.play_circle_outline),
                    title: Text("Introduction to Flutter"),
                    subtitle: Text("20 min 55 sec"),
                  ),
                  ListTile(
                    leading: Icon(Icons.play_circle_outline),
                    title: Text("Installing Flutter on Windows"),
                    subtitle: Text("22 min 10 sec"),
                  ),
                  ListTile(
                    leading: Icon(Icons.play_circle_outline),
                    title: Text("Setup Emulator on Windows"),
                    subtitle: Text("20 min 45 sec"),
                  ),
                  ListTile(
                    leading: Icon(Icons.play_circle_outline),
                    title: Text("Creating Our First App"),
                    subtitle: Text("29 min 10 sec"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}