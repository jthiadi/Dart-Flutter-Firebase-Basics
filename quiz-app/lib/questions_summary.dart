import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['user_answer'] == data['correct_answer']
                            ? Color.fromARGB(255, 150, 198, 241)
                            : Color.fromARGB(255, 249, 133, 241),
                      ),

                      child: Text(
                                ((data['question_index'] as int) + 1).toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                    ),

                    SizedBox(width: 25.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data['user_answer'] as String,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 202, 171, 252),
                                  height: 1.5)
                              ),

                          Text(data['correct_answer'] as String,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 181, 254, 246),
                                  height: 1.5,
                                )
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
