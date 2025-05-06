import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key}) : super(key: key);

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;
  final Color _primaryColor = const Color(0xffc82663);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: const Text(
          'Proceso Paso a Paso',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: _primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Desliza o usa los botones para navegar entre pasos'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: _primaryColor, // Color para los íconos activos
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stepper(
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_currentStep != 0)
                        TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('ANTERIOR'),
                        ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryColor,
                        ),
                        onPressed: details.onStepContinue,
                        child: Text(
                          _currentStep == 3 ? 'FINALIZAR' : 'SIGUIENTE',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
              steps: [
                Step(
                  title: const Text('Paso 1: Registro'),
                  content: const Text('Completa tus datos personales básicos'),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.indexed
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Paso 2: Verificación'),
                  content:
                      const Text('Confirma tu correo electrónico y teléfono'),
                  isActive: _currentStep >= 1,
                  state: _currentStep >= 1
                      ? StepState.indexed
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Paso 3: Configuración'),
                  content: const Text('Personaliza tus preferencias de cuenta'),
                  isActive: _currentStep >= 2,
                  state: _currentStep >= 2
                      ? StepState.indexed
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Paso 4: Confirmación'),
                  content: const Text('Revisa y confirma toda la información'),
                  isActive: _currentStep >= 3,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.indexed,
                ),
              ],
              onStepTapped: (int newIndex) {
                setState(() {
                  _currentStep = newIndex;
                });
              },
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep != 3) {
                  setState(() {
                    _currentStep += 1;
                  });
                } else {
                  // Acción al finalizar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡Proceso completado con éxito!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              onStepCancel: () {
                if (_currentStep != 0) {
                  setState(() {
                    _currentStep -= 1;
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
