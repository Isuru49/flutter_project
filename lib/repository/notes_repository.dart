import 'package:flutter/material.dart';
import 'package:flutter_project/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesRepository{
  static const _dbName = 'notes_database.db';
  static const _tableName = 'notes';

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createdAt TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  static insert({required Note note}) async {
    final db = await _database();
    await db.insert(
      _tableName,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Note>> getNotes() async {
    final db = await _database();

    final List<Map<String, Object?>> noteMaps = await db.query(_tableName);

    return [
      for (final noteMap in noteMaps)
        Note(
          id: noteMap['id'] as int,
          title: noteMap['title'] as String,
          description: noteMap['description'] as String,
          createdAt: DateTime.parse(noteMap['createdAt'] as String),
        ),
    ];
  }

}