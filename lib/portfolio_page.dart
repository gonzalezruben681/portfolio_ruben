import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_ruben/widgets/project_card.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  bool _isDarkMode = false;

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
      backgroundColor:
          _isDarkMode ? theme.scaffoldBackgroundColor : Colors.grey[200],
      appBar: AppBar(
        backgroundColor:
            _isDarkMode ? theme.scaffoldBackgroundColor : Colors.grey[200],
        title: Row(
          children: [
            Image.asset(
                _isDarkMode
                    ? 'img/logo_ruben_light.png'
                    : 'img/logo_ruben_dark.png',
                height: 40),
            const SizedBox(width: 8),
            Text(
              "Rubén Portfolio",
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.black),
            ),
          ],
        ),
        iconTheme:
            IconThemeData(color: _isDarkMode ? Colors.white : Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
            icon: _isDarkMode
                ? const Icon(Icons.brightness_7)
                : const Icon(
                    Icons.brightness_6,
                    color: Colors.black,
                  ),
            tooltip: _isDarkMode ? 'Modo claro' : 'Modo oscuro',
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
      backgroundColor: _isDarkMode ? Colors.black : Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: _isDarkMode
                    ? theme.scaffoldBackgroundColor
                    : Colors.grey[200]),
            child: Row(
              children: [
                Image.asset(
                    _isDarkMode
                        ? 'img/logo_ruben_light.png'
                        : 'img/logo_ruben_dark.png',
                    height: 40),
                const SizedBox(width: 8),
                Text("Rubén Portfolio",
                    style: theme.textTheme.titleLarge?.copyWith(
                        color: _isDarkMode ? Colors.white : Colors.black)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close,
                        color: _isDarkMode ? Colors.white : Colors.black)),
              ],
            ),
          ),
          ListTile(
            title: Text('HOME',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: _isDarkMode ? Colors.white : Colors.black,
                )),
            onTap: () {
              Navigator.of(context).pop();
              _scrollToSection(_homeKey);
            },
          ),
          ListTile(
            title: Text('PROJECTOS',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: _isDarkMode ? Colors.white : Colors.black,
                )),
            onTap: () {
              Navigator.of(context).pop();
              _scrollToSection(_projectsKey);
            },
          ),
          ListTile(
            title: Text('SOBRE MI',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: _isDarkMode ? Colors.white : Colors.black,
                )),
            onTap: () {
              Navigator.of(context).pop();
              _scrollToSection(_aboutKey);
            },
          ),
          ListTile(
            title: Text('CONTACTO',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: _isDarkMode ? Colors.white : Colors.black,
                )),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hola, soy Rubén Darío González.",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Flutter Developer",
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: _isDarkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 16),
          Text(
            "Apasionado por la tecnología y sus posibilidades.",
            style: theme.textTheme.bodyLarge
                ?.copyWith(color: _isDarkMode ? Colors.white : Colors.black),
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
                icon: const FaIcon(FontAwesomeIcons.github),
                tooltip: "GitHub",
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.linkedin),
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
            style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: _isDarkMode ? Colors.white : Colors.black),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sobre mí",
              style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? Colors.white : Colors.black)),
          const SizedBox(height: 8),
          Text(
            "Hola. Mi nombre es Rubén Darío González, soy de Colombia "
            "y actualmente vivo en México. Me apasiona la tecnología y el diseño.",
            style: theme.textTheme.bodyLarge
                ?.copyWith(color: _isDarkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Herramientas:",
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: _isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text("Figma, Photoshop, Sony Vegas, VS Code",
                        style: TextStyle(
                            color: _isDarkMode ? Colors.white : Colors.black)),
                    const SizedBox(height: 16),
                    Text(
                      "Desarrollo:",
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: _isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Dart/Flutter",
                      style: TextStyle(
                          color: _isDarkMode ? Colors.white : Colors.black),
                    ),
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
            _isDarkMode
                ? 'img/contact-image-light.png'
                : 'img/contact-image.png',
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
                  style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _isDarkMode ? Colors.white : Colors.black),
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
      color: _isDarkMode ? Colors.black : Colors.grey[200],
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          "Made by Rubén Darío González - Copyright 2024",
          style: theme.textTheme.bodyLarge
              ?.copyWith(color: _isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
