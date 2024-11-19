import 'package:flutter/material.dart';

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