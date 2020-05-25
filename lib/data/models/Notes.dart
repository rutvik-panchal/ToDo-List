class Notes {
  String _title;

  String _description;

  bool _isDone;

  String _image;

  Notes(this._title, this._description, this._isDone, this._image);

  String get title => this._title;

  String get description => this._description;

  bool get isDone => this._isDone;

  String get image => this._image;

  Map<String, dynamic> toMap() {
    return {
      'title': _title,
      'description': _description,
      'isdone': _isDone,
      'image': _image,
    };
  }
}