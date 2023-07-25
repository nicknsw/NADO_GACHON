
import 'package:flutter/material.dart';

class GradeCalculatorScreen extends StatefulWidget {
  @override
  _GradeCalculatorScreenState createState() => _GradeCalculatorScreenState();
}

class _GradeCalculatorScreenState extends State<GradeCalculatorScreen> {
  List<double> weightings = [];
  List<List<int>> gradesList = [];
  List<List<int>> creditsList = [];
  int numSemesters = 0;

  void _calculate() {
    // Check if all the required data is provided
    if (gradesList.isEmpty || creditsList.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('오류'),
            content: Text('모든 학기의 성적과 학점 정보를 입력해주세요.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
      return;
    }

    // TODO: Implement the calculation logic for totalFinalScore

    double totalFinalScore = 0;
    // TODO: Implement the calculation logic based on gradesList and creditsList

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('계산 결과'),
          content: Text('최종 합산 점수는 $totalFinalScore 입니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  int numSubjects = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('학생부 성적산출 계산기'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('과목 수를 입력하세요:'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  numSubjects = int.tryParse(value) ?? 0;
                  numSemesters = numSubjects; // 과목 개수와 학기 개수를 동일하게 설정
                  weightings = List.generate(numSemesters, (index) => 0);
                  gradesList = List.generate(numSemesters, (index) => []);
                  creditsList = List.generate(numSemesters, (index) => []);
                });
              },
            ),
            SizedBox(height: 16),
            for (int i = 0; i < numSemesters; i++)
              SemesterInfoInput(
                semesterIndex: i,
                numSubjects: numSubjects,
                onWeightingChanged: (value) {
                  setState(() {
                    weightings[i] = double.tryParse(value) ?? 0;
                  });
                },
                onGradeChanged: (index, grade) {
                  setState(() {
                    gradesList[i][index] = grade;
                  });
                },
                onCreditChanged: (index, credit) {
                  setState(() {
                    creditsList[i][index] = credit;
                  });
                },
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _calculate();
              },
              child: Text('계산하기'),
            ),
          ],
        ),
      ),
    );
  }
}