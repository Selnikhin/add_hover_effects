import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hover effects'),
        centerTitle: true,
      ),
      body: Center(
        child: OnHoverButton(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue, width: 4),
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: Text(
              'Hover effects',
              style: TextStyle(fontSize: 32, color: Colors.black),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class OnHoverButton extends StatefulWidget {
  final Widget child;

  const OnHoverButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..scale(
          1.1); //изменение параметра ( к примеру на 1.5 ведет к увелечению уплывания)
    // так же можно задавать параметры  по осям (0,-8,0)
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: transform,
          child: widget.child),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
