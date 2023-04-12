import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class SubmitAttendancePage extends StatefulWidget {
  const SubmitAttendancePage({super.key});

  @override
  State<SubmitAttendancePage> createState() => _SubmitAttendancePageState();
}

class _SubmitAttendancePageState extends State<SubmitAttendancePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _deskripsiController = TextEditingController();
  String? _lokasi;
  final List<String> _alatKerja = [];
  String? _suasanaHati;
  XFile? _image;
  Position? _position;

  @override
  void dispose() {
    _deskripsiController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();

    setState(() {
      _position = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Attendance'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _deskripsiController,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi pekerjaan yang akan dilakukan',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi pekerjaan harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _lokasi,
                  decoration: const InputDecoration(
                    labelText: 'Lokasi bekerja',
                  ),
                  items: const [
                    DropdownMenuItem(value: 'WFO', child: Text('WFO')),
                    DropdownMenuItem(value: 'WFH', child: Text('WFH')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _lokasi = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Lokasi bekerja harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Text('Alat kerja: ${_alatKerja.join(', ')}'),
                FormField<List<String>>(
                  initialValue: _alatKerja,
                  builder: (state) => Column(
                    children: [
                      CheckboxListTile(
                        title: const Text('Laptop'),
                        value: _alatKerja.contains('Laptop'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              _alatKerja.add('Laptop');
                            } else {
                              _alatKerja.remove('Laptop');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Komputer'),
                        value: _alatKerja.contains('Komputer'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              _alatKerja.add('Komputer');
                            } else {
                              _alatKerja.remove('Komputer');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('HP'),
                        value: _alatKerja.contains('HP'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              _alatKerja.add('HP');
                            } else {
                              _alatKerja.remove('HP');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Lainya'),
                        value: _alatKerja.contains('Lainya'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              _alatKerja.add('Lainya');
                            } else {
                              _alatKerja.remove('Lainya');
                            }
                          });
                        },
                      ),
                      if (state.hasError)
                        Text(
                          state.errorText!,
                          style: const TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap pilih salah satu!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                const Text('Suasana hati'),
                RadioListTile<String>(
                  title: const Text('Senang'),
                  value: 'Senang',
                  groupValue: _suasanaHati,
                  onChanged: (value) {
                    setState(() {
                      _suasanaHati = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Sedih'),
                  value: 'Sedih',
                  groupValue: _suasanaHati,
                  onChanged: (value) {
                    setState(() {
                      _suasanaHati = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Netral'),
                  value: 'Netral',
                  groupValue: _suasanaHati,
                  onChanged: (value) {
                    setState(() {
                      _suasanaHati = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Ambil Selfie'),
                ),
                const SizedBox(height: 16.0),
                if (_image != null)
                  Image.file(
                    File(_image!.path),
                    height: 200.0,
                  ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_position == null
                        ? 'Lokasi belum tersedia'
                        : 'Lat: ${_position!.latitude}, Lng: ${_position!.longitude}'),
                    ElevatedButton(
                      onPressed: _getCurrentLocation,
                      child: const Text('Perbarui Lokasi'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
