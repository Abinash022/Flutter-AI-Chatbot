import 'package:aichatterbox/Constant/feature_box.dart';
import 'package:aichatterbox/Constant/pallete.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('AIChatterbox'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Pallete.assistantCircleColor,
                backgroundImage: AssetImage('Assets/13114752_5157509.jpg'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Pallete.borderColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Good Morning, What task can I do for You ? ',
                  style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Cera Pro',
                      color: Pallete.mainFontColor),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 10, left: 40),
              child: const Text(
                'Here are the few commands',
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    fontSize: 20,
                    color: Pallete.mainFontColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Feature Box

            const FeatureBox(
                color: Pallete.firstSuggestionBoxColor,
                headerText: 'CHAT-GPT',
                descriptionText:
                    'Conversational capabilities, language understanding, and generation. Smarter way to stay organized.'),

            const FeatureBox(
                color: Pallete.secondSuggestionBoxColor,
                headerText: 'DALL-E',
                descriptionText:
                    'Image generation based on textual prompts, enabling the creation of unique and novel visual concepts.'),

            const FeatureBox(
                color: Pallete.thirdSuggestionBoxColor,
                headerText: 'Smart Voice Assistant',
                descriptionText:
                    'This advanced smart voice assistant seamlessly integrates the powerful language understanding and generation capabilities of ChatGPT with the creative image generation abilities of DALL·E.'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.mic),
      ),
    );
  }
}
