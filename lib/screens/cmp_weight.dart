import 'package:flutter/material.dart';

class WeightCompare extends StatefulWidget {
  const WeightCompare({super.key});

  @override
  State<WeightCompare> createState() => _WeightCompareState();
}

class _WeightCompareState extends State<WeightCompare> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cur_weight=TextEditingController();
  TextEditingController prev_weight=TextEditingController();

createAlertDialog1(BuildContext context){
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Nice! You are loosing weight\nKeep Diet Continue"),
    );
  }
  
  );
}

createAlertDialog2(BuildContext context){
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Your weight is same as your previous weight\n Please tell Food Provider"),
    );
  }
  
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Compare Weight',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                     TextFormField(
                          
                          controller: cur_weight,
                          keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                              hintText: 'current weight',
                              fillColor: Colors.white,
                              filled: true,
                              //prefixIcon: Icon(Icons.numbers),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Enter Current Weight in kgs",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter weight';
                              }
                              
                              return null;
                            },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                         
                          controller: prev_weight,
                          keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                              hintText: 'previous weight',
                              fillColor: Colors.white,
                              filled: true,
                              //prefixIcon: Icon(Icons.numbers),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Enter Previous Weight in kgs",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter weight';
                              }
                              
                              return null;
                            },
                        ),
                  ]),
                ),
                SizedBox(height : 20),
                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () async{
                  if(_formKey.currentState!.validate())
                  {
                  double current_wt=double.parse(cur_weight.text);
                  double previous_wt=double.parse(prev_weight.text);
                  if(current_wt==previous_wt)
                  {
                    
                      createAlertDialog2(context)  ;      
                  }
  
                  else if(current_wt<previous_wt)
                  {
                    createAlertDialog1(context);
                  }
                  else if(current_wt>previous_wt)
                  {

                  }
                  }
                },
                
                color: Colors.deepOrangeAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Text(
                  "View Result",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              )
            ),
              ],
          ),
          
          )
        ],
      ),
    );
  }
}