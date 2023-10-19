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
            _buildGridView(),
            SizedBox(height: 10),
            buildbooknowbutton(),
            SizedBox(height: 10),
            _buildHorizontalContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
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
          child: Card(
            elevation: selectedOption == index ? 8.0 : 2.0,
            margin: EdgeInsets.all(8.0),
            color: selectedOption == index ? Colors.indigo : Colors.white,
            child: Center(
              child: Text('Option $index'),
            ),
          ),
        );
      },
    );
  }
  Widget buildbooknowbutton() {
    return Container(
      height: 60.0, // You can adjust this height as needed
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Handle button press logic here
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
              onPrimary: Colors.white,
            ),
            child: Text(
              'Book Now',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildContainerWidget(ContainerData data) {
    // Get the screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive text sizes based on screen width
    final titleFontSize = screenWidth * 0.05; // 5% of screen width
    final subtitleFontSize = screenWidth * 0.04; // 4% of screen width

    // Calculate responsive container margin based on screen width
    final containerMargin = EdgeInsets.symmetric(horizontal: screenWidth * 0.05); // 5% of screen width

    // Calculate responsive SizedBox height based on screen height
    final sizedBoxHeight = screenHeight * 0.1; // 10% of screen height

    return Container(
      margin: containerMargin,
      padding: EdgeInsets.all(1.0),
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
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          Text(
            data.subtitle,
            style: TextStyle(
              fontSize: subtitleFontSize,
            ),
          ),
          SizedBox(height: sizedBoxHeight),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle "Redeem Now" button click
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                overlayColor: MaterialStateProperty.all<Color>(Colors.indigo),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.indigo, width: 0.8),
                ),
              ),
              child: Text(
                "Redeem Now",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int pageCount) {
    List<Widget> indicators = List.generate(pageCount, (int index) {
      return Container(
        width: 10.0,
        height: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == index ? Colors.blue : Colors.grey, // Customize indicator colors
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 30, // Set the desired height for the dot indicator
          child: Row(
            children: indicators,
          ),
        ),
      ],
    );
  }
  Widget _buildHorizontalContainer() {
    // Define a list of data for the horizontal containers
    List<ContainerData> containers = [
      ContainerData(
        title: "Up To 20% OFF",
        subtitle: "On All the cabinates",

      ),
      ContainerData(
        title: "Container 2",
        subtitle: "Subtitle 2",

      ),
      // Add more containers as needed
    ];

    return Column(
      children: <Widget>[
        Container(
          height: 190, // Set the desired height for the horizontal container
          child: PageView.builder(
            controller: pageController,
            itemCount: containers.length,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _buildContainerWidget(containers[index]);
            },
          ),
        ),
        SizedBox(height: 10),
        _buildPageIndicator(containers.length),
      ],
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