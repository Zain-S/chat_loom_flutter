class StoryRepository {
  Future<StoryModel> fetchStory() {
    // Simulate network request
    return Future.delayed(
      Duration(seconds: 2),
      () => StoryModel(
        title: 'A Flutter Story',
        author: 'John Doe',
        summary: 'This is a story about Flutter and MVVM.',
      ),
    );
  }
}

class StoryModel {
  final String title;
  final String author;
  final String summary;

  StoryModel({required this.title, required this.author, required this.summary});
}
