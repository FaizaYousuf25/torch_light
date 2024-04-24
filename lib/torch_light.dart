import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorchLight extends StatefulWidget {
  const TorchLight({super.key});


  @override
  State<TorchLight> createState() => _TorchLightState();
}

class _TorchLightState extends State<TorchLight> {
  final bgColor = const Color(0x00ffffff);
  final textColor = const Color(0xffE7F6F2);
  var isActive = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: const Text(
        "Torch Light",
        style: TextStyle(color: Colors.white),
      ),
    ),
    body:Column(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      isActive ? 'assets/t2.jpg' : 'assets/t1.jpg',
                      width: 200,
                      height: 200,
                      color: isActive ? null : Colors.black.withOpacity(0.15),
                      colorBlendMode: BlendMode.srcATop,
                    ),

                    SizedBox(
                      height: size.height * 0.1,
                    ),
                  ],
                           // color: Colors.redAccent,
                ),
              ),
            )),
        SizedBox(
          height: size.height * 0.05,
        ),
        CircleAvatar(
          minRadius: 30,
          maxRadius: 45,
          child: Transform.scale(
            scale: 1.5,
            child: IconButton(
              onPressed: () {
                isActive = !isActive;
                setState(() {});
                controller.toggle();
              },
              icon: const Icon(Icons.power_settings_new),
            )
          ),
        ),
      ],
    ),

    );
  }
}
