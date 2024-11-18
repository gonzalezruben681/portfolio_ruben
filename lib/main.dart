import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.heeboTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFE5E5E5),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1D1D1E),
        textTheme: GoogleFonts.heeboTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Row(
          children: [
            Image.asset('img/logo_ruben_light.png', height: 40),
            const SizedBox(width: 8),
            Text(
              "Rubén Portfolio",
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.black),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Cambiar tema',
          ),
        ],
      ),
      drawer: _buildDrawer(theme, context),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHomeSection(theme),
            _buildProjectsSection(theme),
            _buildAboutSection(theme),
            _buildContactSection(theme),
            _buildFooter(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(ThemeData theme, BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
            child: Row(
              children: [
                Image.asset('img/logo_ruben_light.png', height: 40),
                const SizedBox(width: 8),
                Text(
                  "Rubén Portfolio",
                  style:
                      theme.textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close, color: Colors.white)),
              ],
            ),
          ),
          ListTile(
            title: Text('HOME', style: theme.textTheme.bodyLarge),
            onTap: () {
              Navigator.of(context).pop();
              _scrollToSection(_homeKey);
            },
          ),
          ListTile(
            title: Text('PROJECTOS', style: theme.textTheme.bodyLarge),
            onTap: () {
              Navigator.of(context).pop();
              _scrollToSection(_projectsKey);
            },
          ),
          ListTile(
            title: Text('SOBRE MI', style: theme.textTheme.bodyLarge),
            onTap: () {
              Navigator.of(context).pop();
              _scrollToSection(_aboutKey);
            },
          ),
          ListTile(
            title: Text('CONTACTO', style: theme.textTheme.bodyLarge),
            onTap: () {
              Navigator.of(context).pop();
              _scrollToSection(_contactKey);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHomeSection(ThemeData theme) {
    return Container(
      key: _homeKey,
      padding: const EdgeInsets.all(16),
      color: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hola, soy Rubén Darío González.",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Flutter Developer",
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            "Apasionado por la tecnología y sus posibilidades.",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.email),
                tooltip: "Email",
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.code),
                tooltip: "GitHub",
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.work),
                tooltip: "LinkedIn",
              ),
            ],
          ),
          Image.asset(
            'img/home-img.png',
            height: 300,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(ThemeData theme) {
    return Padding(
      key: _projectsKey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mis Proyectos",
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const ProjectCard(
            title: "Portfolio",
            description:
                "Website personal\nHTML-CSS/SCSS, Bootstrap y JavaScript",
            image: 'img/porfolio_dark.png',
            githubUrl:
                "https://github.com/gonzalezruben681/portfolio_web.github.io",
            liveUrl:
                "https://gonzalezruben681.github.io/portfolio_web.github.io/html/index.html",
          ),
          const SizedBox(height: 16),
          const ProjectCard(
            title: "Próximamente...",
            description: "...",
            image: 'img/contenido-no-disponible.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(ThemeData theme) {
    return Container(
      key: _aboutKey,
      padding: const EdgeInsets.all(16),
      color: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sobre mí",
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Hola. Mi nombre es Rubén Darío González, soy de Colombia "
            "y actualmente vivo en México. Me apasiona la tecnología y el diseño.",
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Herramientas:", style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    const Text("Figma, Photoshop, Sony Vegas, VS Code"),
                    const SizedBox(height: 16),
                    Text("Desarrollo:", style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    const Text("Dart/Flutter"),
                  ],
                ),
              ),
              Image.asset(
                'img/ruben.png',
                height: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(ThemeData theme) {
    return Container(
      key: _contactKey,
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Image.asset(
            'img/contact-image-light.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 55),
                Text(
                  "Contacto",
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.email),
                  label: const Text("gonzalezruben681@gmail.com"),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          "Made by Rubén Darío González - Copyright 2024",
          style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String? githubUrl;
  final String? liveUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.githubUrl,
    this.liveUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(image, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (githubUrl != null)
                      TextButton(
                        onPressed: () {},
                        child: const Text("GitHub Repo"),
                      ),
                    if (liveUrl != null)
                      TextButton(
                        onPressed: () {},
                        child: const Text("Ver en vivo"),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
