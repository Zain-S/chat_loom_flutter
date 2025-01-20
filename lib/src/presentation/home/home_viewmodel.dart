class StoryViewModel {
  final StoryRepository _storyRepository;

  StoryViewModel(this._storyRepository);

  Future<StoryModel> getStory() {
    return _storyRepository.fetchStory();
  }
}
