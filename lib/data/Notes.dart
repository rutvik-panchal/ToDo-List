class Notes {

  String _title;

  String _description;

  bool _isDone;

  Notes(this._title, this._description, this._isDone);

  String get title => this._title;

  String get description => this._description;

  bool get isDone => this._isDone;

}