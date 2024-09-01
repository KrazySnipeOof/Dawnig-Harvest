import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final TextEditingController insuranceRateController = TextEditingController();
  final TextEditingController squareFeetController = TextEditingController();
  final TextEditingController costPerSquareFootController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController hoursPerYearController = TextEditingController();
  final TextEditingController repairsPercentController = TextEditingController();
  final TextEditingController hoursOfServiceController = TextEditingController();
  final TextEditingController gallonsPerHourController = TextEditingController();
  final TextEditingController costPerGallonController = TextEditingController();
  final TextEditingController acresUsedController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  double result1 = 0;
  double result2 = 0;
  double result3 = 0;
  double result4 = 0;
  double hourlyFixedCost = 0;
  double hourlyRepairsCost = 0;
  double hourlyFuelCost = 0;
  double hourlyLubeCost = 0;
  double hourlyVariableCost = 0;
  double totalHourlyCost = 0;
  double yearlyVariableCost = 0;
  double yearlyFixedCost = 0;
  double costPerAcre = 0;

  String name1 = "";
  String name2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculations'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Column(
            children: const [
              Text(
                'Equipment Cost/Maintenance',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Divider(
                color: Color.fromARGB(137, 129, 114, 114),
                height: 1.0,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Annual Depreciation
            Row(
              children: [
                const Text('( 1 ) Annual Depreciation of '),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: firstController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Most Recent Price of Equipment',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: secondController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Years of Useful Life',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double a = double.tryParse(firstController.text) ?? 0;
                  double b = double.tryParse(secondController.text) ?? 0;
                  name1 = nameController.text;
                  if (b != 0) {
                    result1 = a / b;
                  } else {
                    result1 = 0; // Avoid division by zero
                  }
                });
              },
              child: const Text("Calculate Depreciation"),
            ),
            const SizedBox(height: 10),
            Text(
              "Result: $name1 depreciates at a rate of ${NumberFormat('#,##0.0000').format(result1)} dollars per year",
              style: const TextStyle(fontSize: 20),
            ),

            // Average Annual Insurance
            const Text('( 2 ) Average Annual Insurance'),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: insuranceRateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insurance Rate (e.g., 0.12 for nonmotorized)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double a = double.tryParse(firstController.text) ?? 0;
                  double insuranceRate = double.tryParse(insuranceRateController.text) ?? 0;
                  result2 = (a / 2) * insuranceRate;
                });
              },
              child: const Text("Calculate Insurance"),
            ),
            const SizedBox(height: 10),
            Text(
              "Average Annual Insurance: ${NumberFormat('#,##0.0000').format(result2)} dollars",
              style: const TextStyle(fontSize: 20),
            ),

            // Annual Housing
            const Text('( 3 ) Annual Housing Cost'),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: squareFeetController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Square Feet Storage Needed',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: costPerSquareFootController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Cost Per Square Foot',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double squareFeet = double.tryParse(squareFeetController.text) ?? 0;
                  double costPerSquareFoot = double.tryParse(costPerSquareFootController.text) ?? 0;
                  double yearsOfLife = double.tryParse(secondController.text) ?? 0;
                  double newCostPerSquareFoot = (costPerSquareFoot / yearsOfLife) +
                      (costPerSquareFoot * 0.015);
                  result3 = squareFeet * newCostPerSquareFoot;
                });
              },
              child: const Text("Calculate Housing Cost"),
            ),
            const SizedBox(height: 10),
            Text(
              "Annual Housing Cost: ${NumberFormat('#,##0.0000').format(result3)} dollars",
              style: const TextStyle(fontSize: 20),
            ),

            // Average Annual Interest Rate
            const Text('( 4 ) Average Annual Interest Rate'),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: interestRateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Interest Rate (%)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double a = double.tryParse(firstController.text) ?? 0;
                  double interestRate = double.tryParse(interestRateController.text) ?? 0;
                  result4 = (a / 2) * (interestRate / 100);
                });
              },
              child: const Text("Calculate Interest Rate"),
            ),
            const SizedBox(height: 10),
            Text(
              "Average Annual Interest Rate: ${NumberFormat('#,##0.0000').format(result4)} dollars",
              style: const TextStyle(fontSize: 20),
            ),

            // Hourly Fixed Costs
            const Text('( 5 ) Hourly Fixed Costs'),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: hoursPerYearController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hours Per Year',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double hoursPerYear = double.tryParse(hoursPerYearController.text) ?? 0;
                  if (hoursPerYear != 0) {
                    hourlyFixedCost = (result1 + result2 + result3 + result4) / hoursPerYear;
                  } else {
                    hourlyFixedCost = 0; // Avoid division by zero
                  }
                });
              },
              child: const Text("Calculate Hourly Fixed Costs"),
            ),
            const SizedBox(height: 10),
            Text(
              "Hourly Fixed Costs: ${NumberFormat('#,##0.0000').format(hourlyFixedCost)} dollars per hour",
              style: const TextStyle(fontSize: 20),
            ),

            // Hourly Repairs Costs
            const Text('( 6 ) Hourly Repairs Costs'),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: repairsPercentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Repairs Percentage',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double priceOfEquipment = double.tryParse(firstController.text) ?? 0;
                  double repairsPercent = double.tryParse(repairsPercentController.text) ?? 0;
                  double hoursOfService = double.tryParse(hoursOfServiceController.text) ?? 0;
                  if (hoursOfService != 0) {
                    hourlyRepairsCost = ((priceOfEquipment * repairsPercent) / 100) / hoursOfService;
                  } else {
                    hourlyRepairsCost = 0; // Avoid division by zero
                  }
                });
              },
              child: const Text("Calculate Hourly Repairs Costs"),
            ),
            const SizedBox(height: 10),
            Text(
              "Hourly Repairs Costs: ${NumberFormat('#,##0.0000').format(hourlyRepairsCost)} dollars per hour",
              style: const TextStyle(fontSize: 20),
            ),

            // Hourly Fuel Cost
            const Text('( 7 ) Hourly Fuel Cost'),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: gallonsPerHourController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Gallons Per Hour',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: costPerGallonController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Cost Per Gallon',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double gallonsPerHour = double.tryParse(gallonsPerHourController.text) ?? 0;
                  double costPerGallon = double.tryParse(costPerGallonController.text) ?? 0;
                  hourlyFuelCost = gallonsPerHour * costPerGallon;
                });
              },
              child: const Text("Calculate Hourly Fuel Cost"),
            ),
            const SizedBox(height: 10),
            Text(
              "Hourly Fuel Cost: ${NumberFormat('#,##0.0000').format(hourlyFuelCost)} dollars per hour",
              style: const TextStyle(fontSize: 20),
            ),

            // Hourly Lube Cost
            const Text('( 8 ) Hourly Lube Cost (10% of Fuel Cost)'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hourlyLubeCost = hourlyFuelCost * 0.10;
                });
              },
              child: const Text("Calculate Hourly Lube Cost"),
            ),
            const SizedBox(height: 10),
            Text(
              "Hourly Lube Cost: ${NumberFormat('#,##0.0000').format(hourlyLubeCost)} dollars per hour",
              style: const TextStyle(fontSize: 20),
            ),

            // Hourly Variable Cost
            const Text('( 9 ) Hourly Variable Cost'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hourlyVariableCost = hourlyRepairsCost + hourlyFuelCost + hourlyLubeCost;
                });
              },
              child: const Text("Calculate Hourly Variable Cost"),
            ),
            const SizedBox(height: 10),
            Text(
              "Hourly Variable Cost: ${NumberFormat('#,##0.0000').format(hourlyVariableCost)} dollars per hour",
              style: const TextStyle(fontSize: 20),
            ),

            // Total Hourly Cost
            const Text('( 10 ) Total Hourly Cost'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  totalHourlyCost = hourlyFixedCost + hourlyVariableCost;
                });
              },
              child: const Text("Calculate Total Hourly Cost"),
            ),
            const SizedBox(height: 10),
            Text(
              "Total Hourly Cost: ${NumberFormat('#,##0.0000').format(totalHourlyCost)} dollars per hour",
              style: const TextStyle(fontSize: 20),
            ),

            // Yearly Fixed Costs
            const Text('( 11 ) Yearly Fixed Costs'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  yearlyFixedCost = hourlyFixedCost * (double.tryParse(hoursPerYearController.text) ?? 0);
                });
              },
              child: const Text("Calculate Yearly Fixed Costs"),
            ),
            const SizedBox(height: 10),
            Text(
              "Yearly Fixed Costs: ${NumberFormat('#,##0.0000').format(yearlyFixedCost)} dollars",
              style: const TextStyle(fontSize: 20),
            ),

            // Yearly Variable Costs
            const Text('( 12 ) Yearly Variable Costs'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  yearlyVariableCost = hourlyVariableCost * (double.tryParse(hoursPerYearController.text) ?? 0);
                });
              },
              child: const Text("Calculate Yearly Variable Costs"),
            ),
            const SizedBox(height: 10),
            Text(
              "Yearly Variable Costs: ${NumberFormat('#,##0.0000').format(yearlyVariableCost)} dollars",
              style: const TextStyle(fontSize: 20),
            ),

            // Cost Per Acre
            const Text('( 13 ) Cost Per Acre'),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                controller: acresUsedController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Acres Used Per Year',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double acresUsed = double.tryParse(acresUsedController.text) ?? 0;
                  if (acresUsed != 0) {
                    costPerAcre = (yearlyFixedCost + yearlyVariableCost) / acresUsed;
                  } else {
                    costPerAcre = 0; // Avoid division by zero
                  }
                });
              },
              child: const Text("Calculate Cost Per Acre"),
            ),
            const SizedBox(height: 10),
            Text(
              "Cost Per Acre: ${NumberFormat('#,##0.0000').format(costPerAcre)} dollars per acre",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    firstController.dispose();
    secondController.dispose();
    insuranceRateController.dispose();
    squareFeetController.dispose();
    costPerSquareFootController.dispose();
    interestRateController.dispose();
    hoursPerYearController.dispose();
    repairsPercentController.dispose();
    hoursOfServiceController.dispose();
    gallonsPerHourController.dispose();
    costPerGallonController.dispose();
    acresUsedController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
