import 'package:flutter/material.dart';


class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int selectedOption = -1;
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  void selectOption(int index) {
    setState(() {
      selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildGridView(),
            SizedBox(height: 10),
            buildBookNowButton(),
            SizedBox(height: 10),
            buildHorizontalContainer(),
          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectOption(index);
          },
          child: CustomCard(
            selectedOption: selectedOption,
            index: index,
          ),
        );
      },
    );
  }

  Widget buildBookNowButton() {
    return CustomButton(
      text: 'Book Now',
      onPressed: () {
        // Handle button press logic here
      },
    );
  }

  Widget buildHorizontalContainer() {
    List<ContainerData> containers = [
      ContainerData(
        title: "Up To 20% OFF",
        subtitle: "On All the cabinets",
      ),
      ContainerData(
        title: "Container 2",
        subtitle: "Subtitle 2",
      ),
      // Add more containers as needed
    ];

    return Column(
      children: <Widget>[
        CustomContainerSlider(
          containers: containers,
          pageController: pageController,
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          },
        ),
        SizedBox(height: 10),
        buildPageIndicator(containers.length),
      ],
    );
  }

  Widget buildPageIndicator(int pageCount) {
    List<Widget> indicators = List.generate(pageCount, (int index) {
      return Container(
        width: 10.0,
        height: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == index ? Colors.blue : Colors.grey,
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 30,
          child: Row(children: indicators),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final int selectedOption;
  final int index;

  CustomCard({required this.selectedOption, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: selectedOption == index ? 8.0 : 2.0,
      margin: EdgeInsets.all(8.0),
      color: selectedOption == index ? Colors.indigo : Colors.white,
      child: Center(
        child: Text('Option $index'),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
              onPrimary: Colors.white,
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainerSlider extends StatelessWidget {
  final List<ContainerData> containers;
  final PageController pageController;
  final Function(int) onPageChanged;

  CustomContainerSlider({
    required this.containers,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: PageView.builder(
        controller: pageController,
        itemCount: containers.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return CustomContainerWidget(data: containers[index]);
        },
      ),
    );
  }
}

class CustomContainerWidget extends StatelessWidget {
  final ContainerData data;

  CustomContainerWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.title,
            style: TextStyle(
              fontSize: 20, // You can adjust the font size
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          Text(
            data.subtitle,
            style: TextStyle(
              fontSize: 16, // You can adjust the font size
            ),
          ),
          SizedBox(height: 20, // You can adjust the height
          ),
          CustomButton(
            text: "Redeem Now",
            onPressed: () {
              // Handle "Redeem Now" button click
            },
          ),
        ],
      ),
    );
  }
}

class ContainerData {
  final String title;
  final String subtitle;

  ContainerData({
    required this.title,
    required this.subtitle,
  });
}
