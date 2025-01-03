import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi/Pages/add_medicine_page.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/listtitle.dart';
import 'package:medi/utils/texts.dart';

// Dose data model
class Dose {
  int timeTakeIndex;
  bool isDoseSelected;
  TimeOfDay selectedTime;
  String quantity;

  Dose({
    required this.timeTakeIndex,
    required this.isDoseSelected,
    required this.selectedTime,
    required this.quantity,
  });
}

class DoseSelector extends StatefulWidget {
  final int itemCount;

  DoseSelector({required this.itemCount, Key? key}) : super(key: key);

  @override
  State<DoseSelector> createState() => _DoseSelectorState();
}

class _DoseSelectorState extends State<DoseSelector> {
  bool checkState = true; // is time of a day selected?

  List<String> timeTaken = [
    "Before food",
    "After food",
    "With food",
    "Without food",
    "As needed",
  ];
  List<String> unit = [
    "Dose",
    "ml",
    "Ounces",
  ];

  late List<int> _timeTakeindexList;
  late List<bool> _isDoseselected;
  late List<TimeOfDay> _selectedTimeList;
  late List<String> _quantities; // List to store quantities

  late FixedExtentScrollController _typeofTimeTAke;

  @override
  void initState() {
    super.initState();
    _initLists();
    _typeofTimeTAke = FixedExtentScrollController();
  }

  void _initLists() {
    _timeTakeindexList = List<int>.generate(widget.itemCount, (index) => 0);
    _isDoseselected = List<bool>.generate(widget.itemCount, (index) => false);
    _selectedTimeList =
        List<TimeOfDay>.generate(widget.itemCount, (index) => TimeOfDay.now());
    _quantities = List<String>.generate(widget.itemCount, (index) => "");
  }

  @override
  void didUpdateWidget(covariant DoseSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.itemCount != oldWidget.itemCount) {
      setState(() {
        _initLists();
      });
    }
  }

  @override
  void dispose() {
    _typeofTimeTAke.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context, int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTimeList[index],
    );
    if (picked != null && picked != _selectedTimeList[index]) {
      setState(() {
        _selectedTimeList[index] = picked;
      });
    }
  }

  void _showDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Dose ${index + 1}'),
              content: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    _typeofTimeTAke.dispose();
                    _typeofTimeTAke = FixedExtentScrollController(
                        initialItem: _timeTakeindexList[index]);
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 400,
                                height: 250,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CupertinoPicker(
                                    useMagnifier: true,
                                    selectionOverlay:
                                        CupertinoPickerDefaultSelectionOverlay(
                                      background:
                                          PRIMARY_COLOR.withOpacity(0.3),
                                    ),
                                    scrollController: _typeofTimeTAke,
                                    itemExtent: 40,
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        _timeTakeindexList[index] = value;
                                        // Update the parent state
                                        this.setState(() {});
                                      });
                                    },
                                    children: timeTaken
                                        .map((item) => Center(
                                              child: Text(
                                                item,
                                                style: TextStyle(
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (checkState)
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Texts(
                              text: "TIME FOR MEDICINE?",
                              color: PRIMARY_COLOR,
                              size: 15,
                              fw: FontWeight.w500,
                            ),
                          ],
                        ),
                      if (checkState)
                        ListTitle(title: timeTaken[_timeTakeindexList[index]]),
                      if (checkState) SizedBox(height: 10),
                      Container(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            onChanged: (value) {
                              // Update quantity list when text field value changes
                              _quantities[index] = value;
                              // Update the parent state
                              this.setState(() {});
                            },
                            keyboardType: TextInputType.number,
                            style: MAJOR_FONT(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.search_rounded,
                                color: Colors.black87,
                                size: 30,
                              ),
                              labelText: "Quantity",
                              labelStyle: MAJOR_FONT(
                                textStyle: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "TIME",
                            style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text(
                          _selectedTimeList[index].format(context),
                        ),
                        trailing: Icon(Icons.access_time),
                        onTap: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: _selectedTimeList[index],
                          );
                          if (picked != null &&
                              picked != _selectedTimeList[index]) {
                            setState(() {
                              _selectedTimeList[index] = picked;
                              // Update the parent state
                              this.setState(() {});
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Save'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Update the parent state
                    this.setState(() {});
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: widget.itemCount * 75.0,
            child: ListView.builder(
              itemCount: widget.itemCount,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showDialog(context, index);
                    setState(() {
                      _isDoseselected[index] = true;
                    });
                  },
                  child: _DoseTile(
                    _isDoseselected[index]
                        ? "${timeTaken[_timeTakeindexList[index]]} | ${_selectedTimeList[index].format(context)} |  ${_quantities[index]}"
                        : "Dose ${index + 1}",
                    _isDoseselected[index] ? "Dose ${index + 1}" : "",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _DoseTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Texts(
              text: subtitle,
              color: PRIMARY_COLOR,
              size: 15,
              fw: FontWeight.w500,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 25,
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                indent: 9,
                endIndent: 9,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
