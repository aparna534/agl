import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AGL Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'APARNA AGL TASK',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showImage = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20), // Make the button larger
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Square shape with rounded corners
                        ),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      child: Text('Generate Image'),
                    ),
                    SizedBox(width: 20), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20), // Make the button larger
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Square shape with rounded corners
                        ),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      child: Text('Profile'),
                    ),
                    SizedBox(width: 20), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProjectImplementationsPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20), // Make the button larger
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Square shape with rounded corners
                        ),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      child: Text('Project Implementations'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _showImage
                    ? Image.asset(
                        'assets/img.png',
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return Text('Image not found', style: TextStyle(color: Colors.red));
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'I am a passionate and results-driven AI and ML enthusiast with a solid foundation in robotics, software development, and data science. With a unique blend of technical expertise and leadership skills, I have consistently contributed to projects that aim to solve real-world challenges, from AI-based medical diagnostics to smart energy systems. I thrive in collaborative environments and have worked with renowned institutions like NUS Singapore and IIT Roorkee, building solutions that leverage cutting-edge technologies to create impactful, sustainable innovations.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Experience',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildExperienceItem('Intern – National University of Singapore (NUS)', 'Dec 2024 – Jan 2025', 'Contributed to AI/ML-based research projects focused on innovative applications within the field of smart cities and urban planning.'),
              _buildExperienceItem('Intern – TeachNook, IIT Roorkee', 'Sept 2024 – Nov 2024', 'Developed and tested AI-powered tools to enhance the learning experience for students, specifically focusing on adaptive learning systems.'),
              _buildExperienceItem('AWS Intern', 'Dec 2024 – Jan 2025', 'Gained hands-on experience with AWS cloud services to build scalable, cloud-based applications for clients across different industries.'),
              SizedBox(height: 20),
              Text(
                'Projects',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildProjectItem('Wildfire Prediction System (AI-based)', 'Developed a machine learning model that predicts the likelihood of wildfires based on environmental factors such as temperature, humidity, and historical fire data.'),
              _buildProjectItem('Smart Warehouse Inventory System', 'Designed and implemented a smart warehouse management system using IoT and machine learning to optimize inventory management and predict stock demand.'),
              _buildProjectItem('Smart Energy System', 'Built a hardware-based smart energy system that monitors and optimizes energy consumption in homes and businesses.'),
              SizedBox(height: 20),
              Text(
                'Skills',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Programming Languages: Python, Java, C++, Dart (Flutter)', style: TextStyle(fontSize: 16)),
              Text('Technologies & Tools: AWS, TensorFlow, Keras, PyTorch, Yocto, Flutter, Git, Docker', style: TextStyle(fontSize: 16)),
              Text('Areas of Expertise: Machine Learning, AI, IoT, Data Science, Cloud Computing, Robotics, Embedded Systems', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text(
                'Education',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('VIT UNIVERSITY, VELLORE - B.TECH COMPUTER SCIENCE (2026)', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem(String title, String date, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(date, style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
        Text(description, style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildProjectItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(description, style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
      ],
    );
  }
}

class ProjectImplementationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Extending AGL’s Speech Recognition App with AI Features',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Project Implementations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildImplementationItem('1. Context-Aware Responses', 
                'Feature Description:\nUse RAG (Retrieval-Augmented Generation) to enhance responses based on conversation history.\nIntegrate transformer-based models like GPT-2/T5 for dynamic responses.\n\nAGL Analysis:\nAGL\'s speech recognition system is typically designed for automotive use cases, such as voice commands for navigation, media control, and vehicle settings.\nIt is unlikely to include advanced context-aware response generation or transformer-based models like GPT-2/T5, as these are more common in conversational AI systems (e.g., virtual assistants like Alexa or Google Assistant).\nAGL\'s speech recognition is more focused on command-and-control rather than dynamic, context-aware conversations.\n\nConclusion:\nNot Present. AGL does not natively support context-aware responses or advanced transformer-based models for dynamic dialogue generation.'
              ),
              SizedBox(height: 20),
              _buildImplementationItem('2. Multi-Intent Handling & Custom Command Understanding', 
                'Feature Description:\nImprove the intent engine to recognize multiple intents in a single sentence using BERT-based NLU models.\nEnable support for custom user-defined commands to extend application flexibility.\n\nAGL Analysis:\nAGL\'s speech recognition system is likely built around predefined intents for automotive use cases (e.g., "Navigate to X," "Play Y," "Set temperature to Z").\nIt may not support multi-intent handling (e.g., "Navigate to X and play Y") or advanced NLU models like BERT out of the box.\nCustom command understanding would depend on the specific implementation and whether the system allows developers to extend the intent engine.\n\nConclusion:\nPartially Present. AGL may support basic intent recognition, but advanced multi-intent handling and custom command understanding are unlikely to be native features.'
              ),
              SizedBox(height: 20),
              _buildImplementationItem('3. Speaker Adaptation & Personalization', 
                'Feature Description:\nUse fine-tuned Whisper models to improve accuracy for different accents.\nImplement adaptive learning to personalize responses based on user interactions.\n\nAGL Analysis:\nAGL\'s speech recognition system may include basic speaker-independent models for voice recognition, but it is unlikely to include advanced speaker adaptation or fine-tuned Whisper models.\nPersonalization features (e.g., adapting to a user\'s voice or preferences) are not typically a focus of automotive-grade systems, as they prioritize universal usability over individual customization.\n\nConclusion:\nNot Present. AGL does not natively support speaker adaptation or personalized learning.'
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImplementationItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(description, style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
      ],
    );
  }
}
