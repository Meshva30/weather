import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/provider/weatherprovider.dart';

import 'model/weathermodel.dart';

TextEditingController txtlocation = TextEditingController(text: "surat");

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue = Provider.of(context, listen: true);
    WeatherProvider weatherProviderFalse = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: weatherProviderFalse
                .weatherJsonParsing(weatherProviderTrue.location),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                WeatherModel? weatherData = snapshot.data as WeatherModel?;

                return SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: weatherData!.current!.isDay == 1
                            ? const AssetImage('assets/day.jpg')
                            : const AssetImage('assets/night.avif'),
                      )),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 50, right: 10, left: 10),
                        child: Column(children: [
                          Container(
                            height: 300,
                            width: 350,
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: weatherData!.current!.isDay == 1
                                        ? const AssetImage('assets/m1.png')
                                        : const AssetImage('assets/r1.gif'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: 55,
                            width: 420,
                            decoration: BoxDecoration(
                              color: const Color(0xff272727),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: InkWell(
                                  onTap: () {
                                    String location = txtlocation.text;
                                    weatherProviderFalse
                                        .changeLocation(location);
                                  },
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(15),
                              ),
                              onSubmitted: (value) {
                                weatherProviderFalse.changeLocation(value);
                              },
                            ),
                          ),
                          Consumer<WeatherProvider>(
                              builder: (context, provider, child) {
                            if (provider.weathermodel == null) {
                              return const CircularProgressIndicator();
                            }
                            WeatherModel weatherData = provider.weathermodel!;
                            return Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  weatherData.location!.location.toString(),
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    color: Colors.black45,
                                  ),
                                ),
                                Text(
                                  '${weatherData.current?.tempC}°',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 60,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${weatherData.current!.condition!.text}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      color: Colors.black45),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Hourly Forecast',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Weekly Forecast',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                '12 PM',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                height: 55,
                                                width: 55,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/l1.png'))),
                                              ),
                                              const Text(
                                                '8',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 150,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                '12 PM',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                height: 55,
                                                width: 55,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/l1.png'))),
                                              ),
                                              const Text(
                                                '8',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 150,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                '12 PM',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                height: 55,
                                                width: 55,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/l1.png'))),
                                              ),
                                              const Text(
                                                '8',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 150,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                '12 PM',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                height: 55,
                                                width: 55,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/l1.png'))),
                                              ),
                                              const Text(
                                                '8',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 150,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                '12 PM',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                height: 55,
                                                width: 55,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/l1.png'))),
                                              ),
                                              const Text(
                                                '8',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 150,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                '12 PM',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                height: 55,
                                                width: 55,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/l1.png'))),
                                              ),
                                              const Text(
                                                '8',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ]),
                      ),
                    ),
                  ]),
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
