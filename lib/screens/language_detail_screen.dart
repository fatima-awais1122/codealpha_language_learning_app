import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LanguageDetailScreen extends StatelessWidget {
  final String language;

  const LanguageDetailScreen({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1020),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1020),
        elevation: 0,
        title: Text(
          "$language Details",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoCard("Difficulty Level", _getDifficulty(language)),
            _infoCard("Spoken In", _getCountries(language)),
            _infoCard("Number of Speakers", _getSpeakers(language)),
            _infoCard("Career Benefits", _getBenefits(language)),

            const SizedBox(height: 25),
            const Text(
              "Resources 📚",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            // ✅ Real clickable links
            _resourceTile("YouTube Tutorials", _getYouTubeLink(language)),
            _resourceTile(
              "Free Online Courses",
              "https://www.coursera.org/courses?query=$language",
            ),
            _resourceTile(
              "Official Language Resources",
              "https://en.wikipedia.org/wiki/${language}_language",
            ),
          ],
        ),
      ),
    );
  }

  // Info Card
  Widget _infoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF182033),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Resource Tile with clickable link
  Widget _resourceTile(String resource, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw Exception("Could not launch $url");
        }
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF182033),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Icon(Icons.link, color: Color(0xFF00D4FF)),
            const SizedBox(width: 12),
            Text(
              resource,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods for dynamic values
  String _getDifficulty(String lang) {
    switch (lang) {
      case "Spanish":
        return "Easy";
      case "French":
        return "Medium";
      case "German":
        return "Hard";
      case "Italian":
        return "Medium";
      default:
        return "Medium";
    }
  }

  String _getCountries(String lang) {
    switch (lang) {
      case "Spanish":
        return "Spain, Latin America";
      case "French":
        return "France, Canada, Africa";
      case "German":
        return "Germany, Austria, Switzerland";
      case "Italian":
        return "Italy, Switzerland";
      default:
        return "Worldwide";
    }
  }

  String _getSpeakers(String lang) {
    switch (lang) {
      case "Spanish":
        return "500+ million";
      case "French":
        return "300+ million";
      case "German":
        return "130+ million";
      case "Italian":
        return "85+ million";
      default:
        return "Millions worldwide";
    }
  }

  String _getBenefits(String lang) {
    switch (lang) {
      case "Spanish":
        return "Travel, International Business, Culture";
      case "French":
        return "Diplomacy, Fashion, Culinary Arts";
      case "German":
        return "Engineering, Research, Technology";
      case "Italian":
        return "Art, History, Tourism";
      default:
        return "Global Opportunities";
    }
  }

  // ✅ YouTube links per language
  String _getYouTubeLink(String lang) {
    switch (lang) {
      case "Spanish":
        return "https://www.youtube.com/@ButterflySpanish";
      case "French":
        return "https://www.youtube.com/@LearnFrenchwithAlexa";
      case "German":
        return "https://www.youtube.com/@LearnGermanwithAnja";
      case "Italian":
        return "https://www.youtube.com/@LearnItalianwithLucrezia";
      default:
        return "https://www.youtube.com";
    }
  }
}
