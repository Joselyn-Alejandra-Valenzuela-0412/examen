import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  MyPageView({Key? key}) : super(key: key);
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenido Deslizable'),
        backgroundColor: const Color(0xffc82663),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [
          _buildContentPage(
            context,
            title: "Tecnología",
            content:
                "Últimas noticias sobre avances tecnológicos y tendencias del mercado.",
            imageUrl:
                "https://images.unsplash.com/photo-1518770660439-4636190af475",
          ),
          _buildContentPage(
            context,
            title: "Finanzas",
            content:
                "Análisis de mercados financieros y consejos de inversión.",
            imageUrl:
                "https://images.unsplash.com/photo-1468254095679-bbcba94a7066",
          ),
          _buildContentPage(
            context,
            title: "Innovación",
            content:
                "Los proyectos más innovadores que están cambiando el mundo.",
            imageUrl:
                "https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3",
          ),
        ],
      ),
    );
  }

  Widget _buildContentPage(BuildContext context,
      {required String title,
      required String content,
      required String imageUrl}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xffc82663),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffc82663),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Acción para $title')),
                );
              },
              child:
                  const Text('Ver más', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
