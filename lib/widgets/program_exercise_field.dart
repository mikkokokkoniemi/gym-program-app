import 'package:flutter/material.dart';

class ProgramExerciseField extends StatelessWidget {
  final Map<String, dynamic> exercise;
  final Function setExercise;
  final Function removeExercise;

  const ProgramExerciseField({
    Key key,
    @required this.exercise,
    @required this.setExercise,
    @required this.removeExercise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(3)),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            trailing: IconButton(
                icon: Icon(Icons.clear, color: Colors.redAccent),
                onPressed: removeExercise),
            title: Column(
              children: <Widget>[
                TextFormField(
                  key: exercise['keys']['name'],
                  decoration:
                      InputDecoration(labelText: 'Name of the exercise'),
                  textInputAction: TextInputAction.next,
                  initialValue: exercise['name'],
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(exercise['focusNodes']['description']);
                  },
                  focusNode: exercise['focusNodes']['name'],
                  onSaved: (value) {
                    setExercise('name', value);
                  },
                  validator: (value) => value.isEmpty ? 'Provide a name' : null,
                ),
                TextFormField(
                  key: exercise['keys']['description'],
                  decoration: InputDecoration(labelText: 'Description'),
                  textInputAction: TextInputAction.next,
                  initialValue: exercise['description'],
                  focusNode: exercise['focusNodes']['description'],
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(exercise['focusNodes']['reps']);
                  },
                  onSaved: (value) {
                    setExercise('description', value);
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Provide a description' : null,
                ),
                TextFormField(
                  key: exercise['keys']['reps'],
                  decoration: InputDecoration(labelText: 'Repeats'),
                  textInputAction: TextInputAction.none,
                  initialValue: exercise['reps'],
                  focusNode: exercise['focusNodes']['reps'],
                  onFieldSubmitted: (_) {},
                  onSaved: (value) {
                    setExercise('reps', value);
                  },
                  validator: (value) => value.isEmpty ||
                          int.tryParse(value) == null ||
                          int.tryParse(value) <= 0
                      ? 'Provide a positive number'
                      : null,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
