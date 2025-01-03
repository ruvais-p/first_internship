import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/doseSelector.dart';
import 'package:medi/utils/listtitle.dart';
import 'package:medi/utils/texts.dart';
import 'package:medi/utils/titlecontainer.dart';

class AddItem extends StatefulWidget {
  AddItem({super.key, required this.compartNo});
  final int compartNo;
  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  //variables for pill count
  int _selectedPillCount = 10;
  int _lastselectedPillCount = 9;
  //variables for date
  DateTime _selectedDate = DateTime.now();
  //variable for duration
  Duration _duration = Duration(hours: 0, minutes: 10);
  //controllers
  late FixedExtentScrollController _typeofMedicineController;
  late FixedExtentScrollController _typeofTakeController;
  late FixedExtentScrollController _typeofTimesAdayController;
  late FixedExtentScrollController _iconController;
  late FixedExtentScrollController _pillcountController;
  //index
  late int _compartementIndex;
  int _typeofMedicineIndex = 0;
  int _typeofTakeIndex = 0;
  int _typeofTimesAdayIndex = 0;
  int _timeTakenIndex = 0;
  int _iconIndex = 0;
  //condition checkers
  List<bool> checkedState = [
    false, //Type of Medicine
    false, //Number of pills
    false, //icon
    false, //Take
    false, //date
    false, //times
    false, //light window
  ];
  //lists
  List<String> typeofMedicine = [
    "Pill",
    "Tablet",
    "Liquid",
    "Capsule",
    "Syrup",
    "Injection",
    "Inhaler",
    "Powder",
    "Spray",
  ];
  List<String> typeofTake = ["Every Day", "Selected Days", "Days Interval"];
  List<String> typeofTimesAday = [
    "Single a day",
    "Twice a day",
    "Thrice a day",
    "Four times a day",
    "Five times a day",
    "Six times a day",
    "Seven times a day",
    "Eight times a day",
    "Nine times a day",
    "Ten times a day",
  ];
  List<String> timeTaken = [
    "Before food",
    "After food",
    "With food",
    "Without food",
    "As needed",
  ];
  List<String> MedIcons = [
    "lib/assets/images/icons/1.png",
    "lib/assets/images/icons/2.png",
    "lib/assets/images/icons/3.png",
    "lib/assets/images/icons/4.png",
    "lib/assets/images/icons/5.png",
    "lib/assets/images/icons/6.png",
    "lib/assets/images/icons/7.png",
    "lib/assets/images/icons/8.png",
    "lib/assets/images/icons/9.png",
    "lib/assets/images/icons/10.png",
    "lib/assets/images/icons/11.png",
    "lib/assets/images/icons/12.png",
  ];
  void _showDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dose Information'),
          content: Text('Details for Dose $index'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
              primary: PRIMARY_COLOR,
              onPrimary: Colors.white,
              onBackground: PRIMARY_COLOR,
              surface: Colors.white,
              onSurface: Colors.black,
              onSurfaceVariant: PRIMARY_COLOR,
            )),
            child: child!);
      },
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  //initState
  @override
  void initState() {
    super.initState();
    _compartementIndex = widget.compartNo;
    _typeofMedicineController =
        FixedExtentScrollController(initialItem: _typeofMedicineIndex);
    _typeofTakeController =
        FixedExtentScrollController(initialItem: _typeofTakeIndex);
    _typeofTimesAdayController =
        FixedExtentScrollController(initialItem: _typeofTimesAdayIndex);
    _pillcountController =
        FixedExtentScrollController(initialItem: _lastselectedPillCount);
    _iconController = FixedExtentScrollController(initialItem: _iconIndex);
  }

  //dispose
  @override
  void dispose() {
    _typeofMedicineController.dispose();
    _typeofTakeController.dispose();
    _typeofTimesAdayController.dispose();
    _pillcountController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  List<String> compartment = ["1", "2", "3", "4", "5", "Other"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Texts(
            text: "Add a new Medicine",
            color: Colors.black,
            size: 24,
            fw: FontWeight.w400),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black54,
            size: 28,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Texts(
                text: "Save",
                color: PRIMARY_COLOR,
                size: 20,
                fw: FontWeight.w400),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TitleContainer(title: "Medicine"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              height: 65,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name of Medicine';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
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
                  labelText: "Name of Medicine",
                  labelStyle: MAJOR_FONT(
                    textStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  counterStyle: MAJOR_FONT(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //..................................................................Type
            GestureDetector(
              onTap: () {
                setState(() {
                  checkedState[0] = true;
                });
                _typeofMedicineController.dispose();
                _typeofMedicineController = FixedExtentScrollController(
                    initialItem: _typeofMedicineIndex);
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
                          typeofMedicineBuilder(),
                          // Space at the bottom for aesthetics
                        ],
                      ),
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Texts(
                          text: checkedState[0] ? "TYPE OF MEDICINE" : "",
                          color: PRIMARY_COLOR,
                          size: 15,
                          fw: FontWeight.w500),
                    ],
                  ),
                  ListTitle(
                    title: checkedState[0]
                        ? typeofMedicine[_typeofMedicineIndex]
                        : "Type of Medicine",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //..................................................................no. of pills
            GestureDetector(
              onTap: () {
                setState(() {
                  checkedState[1] = true;
                });
                _pillcountController.dispose();
                _pillcountController = FixedExtentScrollController(
                    initialItem: _lastselectedPillCount);
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
                          Center(
                            child: SizedBox(
                              height: 250,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CupertinoPicker(
                                  selectionOverlay:
                                      CupertinoPickerDefaultSelectionOverlay(
                                    background: PRIMARY_COLOR.withOpacity(0.3),
                                  ),
                                  scrollController: _pillcountController,
                                  itemExtent: 40,
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      _selectedPillCount = index + 1;
                                      _lastselectedPillCount =
                                          index; // Adding 1 to convert index to number
                                    });
                                  },
                                  children: List.generate(50, (index) {
                                    return Center(
                                      child: Text(
                                        (index + 1)
                                            .toString(), // Adding 1 to convert index to number
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    );
                                  }),
                                ),
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
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Texts(
                          text: checkedState[1]
                              ? "TOTAL PILLS YOU'RE ADDING"
                              : "",
                          color: PRIMARY_COLOR,
                          size: 15,
                          fw: FontWeight.w500),
                    ],
                  ),
                  ListTitle(
                    title: checkedState[1]
                        ? "$_selectedPillCount"
                        : "Total pills You're adding",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //..................................................................Icon
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Texts(
                    text: "Icon",
                    color: Colors.black,
                    size: 20,
                    fw: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  checkedState[2] = true;
                });
                _iconController.dispose();
                _iconController =
                    FixedExtentScrollController(initialItem: _iconIndex);
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
                          iconbuildPicker(),
                          // Space at the bottom for aesthetics
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 355,
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1.5)),
                child:
                    checkedState[2] ? Image.asset(MedIcons[_iconIndex]) : null,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Texts(
                    text: "Compartment",
                    color: Colors.black,
                    size: 20,
                    fw: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            //..................................................................Compartment
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    compartment.length,
                    (index) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _compartementIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                                width: 50.5,
                                height: 52,
                                duration: const Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == _compartementIndex
                                      ? PRIMARY_COLOR
                                      : Colors.white,
                                  border: Border.all(
                                    color: index == _compartementIndex
                                        ? PRIMARY_COLOR
                                        : Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Texts(
                                    text: compartment[index],
                                    color: index == _compartementIndex
                                        ? Colors.white
                                        : Colors.black,
                                    size: 16,
                                    fw: FontWeight.w600)),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            TitleContainer(title: "Schedule"),
            const SizedBox(
              height: 20,
            ),
            //..................................................................Take
            GestureDetector(
              onTap: () {
                setState(() {
                  checkedState[3] = true;
                });
                _typeofTakeController.dispose();
                _typeofTakeController =
                    FixedExtentScrollController(initialItem: _typeofTakeIndex);
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
                          typeofTakebuildPicker(),
                          // Space at the bottom for aesthetics
                        ],
                      ),
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Texts(
                          text: checkedState[3] ? "HOW OFTEN DO YOU TAKE" : "",
                          color: PRIMARY_COLOR,
                          size: 15,
                          fw: FontWeight.w500),
                    ],
                  ),
                  ListTitle(
                      title: checkedState[3]
                          ? typeofTake[_typeofTakeIndex]
                          : "How often do You take")
                ],
              ),
            ),
            //..................................................................Start date
            GestureDetector(
              onTap: () {
                _selectDate(context);
                setState(() {
                  checkedState[4] = true;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Texts(
                          text: checkedState[4] ? "START DATE" : "",
                          color: PRIMARY_COLOR,
                          size: 15,
                          fw: FontWeight.w500),
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
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  checkedState[4]
                                      ? DateFormat('dd MMMM yyyy')
                                          .format(_selectedDate)
                                      : "START DATE",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              CupertinoIcons.calendar,
                              color: Colors.black87,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 9,
                          endIndent: 9,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TitleContainer(title: "Reminders"),
            SizedBox(
              height: 25,
            ),
            //..................................................................times per day
            GestureDetector(
              onTap: () {
                setState(() {
                  checkedState[5] = true;
                });
                _typeofTimesAdayController.dispose();
                _typeofTimesAdayController = FixedExtentScrollController(
                    initialItem: _typeofTimesAdayIndex);
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
                          typeofTimesAdaybuildPicker(),
                          // Space at the bottom for aesthetics
                        ],
                      ),
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Texts(
                          text: checkedState[5] ? "HOW MANY TIMES A DAY?" : "",
                          color: PRIMARY_COLOR,
                          size: 15,
                          fw: FontWeight.w500),
                    ],
                  ),
                  ListTitle(
                      title: checkedState[5]
                          ? typeofTimesAday[_typeofTimesAdayIndex]
                          : "Single a day"),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            //..............................................................Dose
            checkedState[5]
                ? Container(
                    child: DoseSelector(
                    itemCount: _typeofTimesAdayIndex + 1,
                  ))
                : SizedBox(),
            //..................................................................Time
            GestureDetector(
              onTap: () async {
                setState(() {
                  checkedState[5] = true;
                });
                Duration? selectedDuration = await showDurationPicker(
                  context: context,
                  initialTime: _duration,
                  baseUnit: BaseUnit.minute,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(30), // Custom border radius
                    color: Colors.white, // Custom background color
                  ),
                );
                if (selectedDuration != null && selectedDuration != _duration) {
                  setState(() {
                    _duration = selectedDuration;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        checkedState[5] ? "LIGHT WINDOW" : "",
                        style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
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
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  checkedState[5]
                                      ? "${_duration.inHours.toString()}h ${(_duration.inMinutes % 60).toString()}m"
                                      : "Light Window",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 9,
                          endIndent: 9,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),
            TitleContainer(title: "Other"),
            SizedBox(
              height: 30,
            ),
            //..................................................................Note
            TextField(
              maxLines: 2,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  hintText: "Note...",
                  hintStyle: MAJOR_FONT(
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.black54,
                        width: 1.5,
                      ))),
            )
          ]),
        ),
      ),
    );
  }

  //Builders
  Widget typeofMedicineBuilder() {
    return Column(
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
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                background: PRIMARY_COLOR.withOpacity(0.3),
              ),
              scrollController: _typeofMedicineController,
              itemExtent: 40,
              onSelectedItemChanged: (value) {
                setState(() {
                  _typeofMedicineIndex = value;
                });
              },
              children: typeofMedicine
                  .map(
                    (item) => Center(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget iconbuildPicker() {
    return Column(
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
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                background: PRIMARY_COLOR.withOpacity(0.3),
              ),
              scrollController: _iconController,
              itemExtent: 100,
              onSelectedItemChanged: (value) {
                setState(() {
                  _iconIndex = value;
                });
              },
              children: MedIcons.map(
                (item) => Center(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(item), fit: BoxFit.fill)),
                )),
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget typeofTakebuildPicker() {
    return Column(
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
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                background: PRIMARY_COLOR.withOpacity(0.3),
              ),
              scrollController: _typeofTakeController,
              itemExtent: 40,
              onSelectedItemChanged: (value) {
                setState(() {
                  _typeofTakeIndex = value;
                });
              },
              children: typeofTake
                  .map(
                    (item) => Center(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget typeofTimesAdaybuildPicker() {
    return Column(
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
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                background: PRIMARY_COLOR.withOpacity(0.3),
              ),
              scrollController: _typeofTimesAdayController,
              itemExtent: 40,
              onSelectedItemChanged: (value) {
                setState(() {
                  _typeofTimesAdayIndex = value;
                });
              },
              children: typeofTimesAday
                  .map(
                    (item) => Center(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _DoseTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Texts(
                text: subtitle,
                color: PRIMARY_COLOR,
                size: 15,
                fw: FontWeight.w500),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
