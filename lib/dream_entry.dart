class DreamEntry {
  String date;
  String sleepAt;
  String wakeAt;
  String quality;
  String? notes;

  DreamEntry({
    required this.date,
    required this.sleepAt,
    required this.wakeAt,
    required this.quality,
    this.notes,
  });
}
