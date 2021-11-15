import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/styles.dart';

class InfoCard extends StatelessWidget {
  final String title, value;
  final Color? topColor;
  final bool? isActive;
  final Function onTap;
  const InfoCard(
      {Key? key,
      required this.title,
      required this.value,
      this.topColor,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: kLightGrey.withOpacity(0.1),
                  blurRadius: 12),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: topColor ?? kActive,
                      height: 5,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: '$title\n',
                      style: TextStyle(
                          fontSize: 18,
                          color: isActive! ? kActive : kLightGrey)),
                  TextSpan(
                      text: '$value\n',
                      style: TextStyle(
                          fontSize: 40,
                          color: isActive! ? kActive : kLightGrey)),
                ]),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
