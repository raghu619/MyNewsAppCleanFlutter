import 'package:flutter/material.dart';
import 'package:mynews_app_clean/core/constants/palette.dart';

class NewsViewPage extends StatelessWidget {
  const NewsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Palette.deepBlue,
            size: 20,
          ),
          onPressed: (() {
            Navigator.pop(context);
          }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 300,
                color: Palette.lightGrey,
                child: Image.network(
                  'https://elements-cover-images-0.imgix.net/0f478ac6-76ca-4281-a339-a5d08004ad87?auto=compress%2Cformat&fit=max&w=1370&s=ee5a0253b0c57f7dcc81151b0d1ee18c',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                '8/8/2022',
                style: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Author name, Publisher name',
                style: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                '''Lorem ipsum, or lipsum as it is sometimes known, 
                is dummy text used in laying out print, graphic or web designs. 
                The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's 
                De Finibus Bonorum et Malorum for use in a type specimen book. 
                It usually begins with:Lorem ipsum, or lipsum as it is sometimes known, 
                is dummy text used in laying out print, graphic or web designs. 
                The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's 
                De Finibus Bonorum et Malorum for use in a type specimen book. 
                It usually begins with:''',
                style: TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
