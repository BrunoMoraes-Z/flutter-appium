import 'package:appium_sample/shared/widgets/key_button.dart';
import 'package:appium_sample/shared/widgets/key_row.dart';
import 'package:appium_sample/shared/widgets/key_text.dart';
import 'package:function_tree/function_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatorView extends HookWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = useValueNotifier<String>('');
    final memory = useValueNotifier<String>('');

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final panelHeight = height * 0.42;
    final bodyHeight = height * 0.58;

    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            height: panelHeight,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: memory,
                  builder: (context, _) {
                    return Container(
                      // decoration: const BoxDecoration(
                      //   color: Colors.brown,
                      // ),
                      alignment: Alignment.bottomRight,
                      width: width,
                      height: panelHeight * 0.75,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Text(
                          memory.value,
                          key: ValueKey('lbl_memory'),
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: current,
                  builder: (context, _) {
                    return Container(
                      // decoration: const BoxDecoration(
                      //   color: Colors.indigo,
                      // ),
                      width: width,
                      height: panelHeight * 0.25,
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Text(
                          current.value,
                          key: ValueKey('lbl_screen'),
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Material(
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              height: bodyHeight,
              child: Column(
                children: [
                  KeyRow(
                    height: height,
                    keys: [
                      KeyButton(
                        key: const Key('btn_7'),
                        icon: const KeyText(text: '7'),
                        onTap: () {
                          current.value = '${current.value}7';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_8'),
                        icon: const KeyText(text: '8'),
                        onTap: () {
                          current.value = '${current.value}8';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_9'),
                        icon: const KeyText(text: '9'),
                        onTap: () {
                          current.value = '${current.value}9';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_plus'),
                        icon: const FaIcon(
                          FontAwesomeIcons.plus,
                          size: 30,
                        ),
                        backgroundColor: Colors.amberAccent,
                        onTap: () {
                          if (memory.value.isEmpty && current.value.isEmpty)
                            return;
                          if (memory.value.isEmpty) {
                            memory.value = '${current.value}+';
                          } else {
                            var lastChar = memory.value.characters.last;
                            if (lastChar != '+') {
                              memory.value = memory.value
                                  .substring(0, memory.value.length - 1);
                              memory.value = '${memory.value}+';
                            } else {
                              if (current.value.isEmpty) return;
                              memory.value = '${memory.value}${current.value}';
                              memory.value = '${memory.value.interpret()}+';
                            }
                          }
                          current.value = '';
                        },
                      ),
                    ],
                  ),
                  KeyRow(
                    height: height,
                    keys: [
                      KeyButton(
                        key: const Key('btn_4'),
                        icon: const KeyText(text: '4'),
                        onTap: () {
                          current.value = '${current.value}4';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_5'),
                        icon: const KeyText(text: '5'),
                        onTap: () {
                          current.value = '${current.value}5';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_6'),
                        icon: const KeyText(text: '6'),
                        onTap: () {
                          current.value = '${current.value}6';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_minus'),
                        icon: const FaIcon(
                          FontAwesomeIcons.minus,
                          size: 30,
                        ),
                        backgroundColor: Colors.amberAccent,
                        onTap: () {
                          if (memory.value.isEmpty && current.value.isEmpty)
                            return;
                          if (memory.value.isEmpty) {
                            memory.value = '${current.value}-';
                          } else {
                            var lastChar = memory.value.characters.last;
                            if (lastChar != '-') {
                              memory.value = memory.value
                                  .substring(0, memory.value.length - 1);
                              memory.value = '${memory.value}-';
                            } else {
                              if (current.value.isEmpty) return;
                              memory.value = '${memory.value}${current.value}';
                              memory.value = '${memory.value.interpret()}-';
                            }
                          }
                          current.value = '';
                        },
                      ),
                    ],
                  ),
                  KeyRow(
                    height: height,
                    keys: [
                      KeyButton(
                        key: const Key('btn_1'),
                        icon: const KeyText(text: '1'),
                        onTap: () {
                          current.value = '${current.value}1';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_2'),
                        icon: const KeyText(text: '2'),
                        onTap: () {
                          current.value = '${current.value}2';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_3'),
                        icon: const KeyText(text: '3'),
                        onTap: () {
                          current.value = '${current.value}3';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_times'),
                        icon: const FaIcon(
                          FontAwesomeIcons.times,
                          size: 35,
                        ),
                        backgroundColor: Colors.amberAccent,
                        onTap: () {
                          if (memory.value.isEmpty && current.value.isEmpty)
                            return;
                          if (memory.value.isEmpty) {
                            memory.value = '${current.value}*';
                          } else {
                            var lastChar = memory.value.characters.last;
                            if (lastChar != '*') {
                              memory.value = memory.value
                                  .substring(0, memory.value.length - 1);
                              memory.value = '${memory.value}*';
                            } else {
                              if (current.value.isEmpty) return;
                              memory.value = '${memory.value}${current.value}';
                              memory.value = '${memory.value.interpret()}*';
                            }
                          }
                          current.value = '';
                        },
                      ),
                    ],
                  ),
                  KeyRow(
                    height: height,
                    keys: [
                      KeyButton(
                        key: const Key('btn_clear'),
                        icon: const FaIcon(
                          FontAwesomeIcons.trash,
                          size: 30,
                        ),
                        backgroundColor: Colors.redAccent,
                        onTap: () {
                          current.value = '';
                          memory.value = '';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_0'),
                        icon: const KeyText(text: '0'),
                        onTap: () {
                          current.value = '${current.value}0';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_equals'),
                        icon: const FaIcon(
                          FontAwesomeIcons.equals,
                          size: 30,
                        ),
                        backgroundColor: Colors.greenAccent,
                        onTap: () {
                          if (!current.value.isEmpty) {
                            memory.value = '${memory.value}${current.value}';
                          }
                          current.value = '${memory.value.interpret()}';
                          memory.value = '';
                        },
                      ),
                      KeyButton(
                        key: const Key('btn_divide'),
                        icon: const FaIcon(
                          FontAwesomeIcons.divide,
                          size: 30,
                        ),
                        backgroundColor: Colors.amberAccent,
                        onTap: () {
                          if (memory.value.isEmpty && current.value.isEmpty)
                            return;
                          if (memory.value.isEmpty) {
                            memory.value = '${current.value}/';
                          } else {
                            var lastChar = memory.value.characters.last;
                            if (lastChar != '/') {
                              memory.value = memory.value
                                  .substring(0, memory.value.length - 1);
                              memory.value = '${memory.value}/';
                            } else {
                              if (current.value.isEmpty) return;
                              memory.value = '${memory.value}${current.value}';
                              memory.value = '${memory.value.interpret()}/';
                            }
                          }
                          current.value = '';
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
