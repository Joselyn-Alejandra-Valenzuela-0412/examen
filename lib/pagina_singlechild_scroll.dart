import 'package:flutter/material.dart';

class MySingleChildScrollView extends StatelessWidget {
  const MySingleChildScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: const Color(0xffc82663),
        title: const Text(
          'Tech Market News',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Artículo compartido'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Text(
              'Tech stocks manage modest rally after lackluster US jobs report',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff333333),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffc82663).withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Image.network(
                  'data:image/webp;base64,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',
                  fit: BoxFit.cover,
                  height: 220,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 220,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(
                  color: const Color(0xffc82663).withOpacity(0.2),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Update: Tech stocks have given up all gains since this post went up, with both the Nasdaq and the basket of software stocks we track in the red. From a slightly later perspective, concern about near full-employment and resulting rising interest rates appears to have won the in-market sentiment battle. The relationship between economic news and the value of technology stocks has been a fun puzzle in recent months.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: 700,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                  border: Border.all(
                    color: const Color(0xffc82663).withOpacity(0.2),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'We find ourselves, then, in the weird situation when a poor jobs report could indicate that the economy is stronger (closer to full employment) than anticipated, implying that wages and prices will continue to rise, inducing the Fed to raise rates. Which, as noted above, would mean that higher-risk assets would sell off and less risky assets would become more attractive. And yet tech stocks are a touch higher because, well, it appears that the markets are deciding that the poor-ish report will net out positive for tech shares, which have sold off sharply in recent weeks. Or that the lackluster jobs report will prove less Fed-provoking than a strong jobs report, in essence.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffc82663),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Leer más artículos',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
