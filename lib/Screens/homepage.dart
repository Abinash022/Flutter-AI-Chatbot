import 'package:aichatterbox/Constant/feature_box.dart';
import 'package:aichatterbox/Constant/pallete.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordSpoken = '';

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  Future<void> initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  Future<void> startListening() async {
    await _speechToText.listen(onResult: speechResult);
    setState(() {});
  }

  void speechResult(result) {
    setState(() {
      _wordSpoken = '${result.recognizedWords}';
    });
  }

  @override
  void dispose() {
    super.dispose();
    _speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('AIChatterbox'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: Visibility(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 80,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await _speechToText.hasPermission &&
              _speechToText.isNotListening) {
            await startListening();
          } else if (_speechToText.isListening) {
            stopListening();
          } else {
            initSpeech();
          }
        },
        child: Icon(_speechToText.isListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}
