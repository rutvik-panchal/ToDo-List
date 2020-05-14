class Notes {
  int _id;

  String _title;

  String _description;

  bool _isDone;

  Notes(this._id, this._title, this._description, this._isDone);

  String get title => this._title;

  String get description => this._description;

  bool get isDone => this._isDone;

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'title': _title,
      'description': _description,
      'isdone': _isDone,
    };
  }
}