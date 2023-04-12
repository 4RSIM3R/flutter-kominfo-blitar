import 'package:flutter/material.dart';
import 'package:flutter_training/model/example_model.dart';

class SubmitAttendancePage extends StatefulWidget {
  const SubmitAttendancePage({super.key});

  @override
  State<SubmitAttendancePage> createState() => _SubmitAttendancePageState();
}

class _SubmitAttendancePageState extends State<SubmitAttendancePage> {
  TextEditingController _rencanaController = TextEditingController();

  String? lokasiKerja;

  List<String> alatKerja = [];

  String suasana = 'sedih';

  @override
  void dispose() {
    _rencanaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Attendance'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _rencanaController,
              decoration: InputDecoration(
                label: Text("Rencana Pekerjaan"),
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                label: Text("Lokasi Kerja"),
              ),
              items: const [
                DropdownMenuItem(
                  value: "WFH",
                  child: Text("WFH"),
                ),
                DropdownMenuItem(
                  value: "WFO",
                  child: Text("WFO"),
                ),
              ],
              onChanged: (val) {
                setState(() {
                  lokasiKerja = val;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Alat Kerja yang dipilih: ${alatKerja.join(', ')}'),
            CheckboxListTile(
              title: Text('Laptop'),
              value: alatKerja.contains('laptop'),
              onChanged: (checked) {
                if (checked!) {
                  alatKerja.add('laptop');
                } else {
                  alatKerja.remove('laptop');
                }
                setState(() {});
              },
            ),
            CheckboxListTile(
              title: Text('Komputer'),
              value: alatKerja.contains('komputer'),
              onChanged: (checked) {
                if (checked!) {
                  alatKerja.add('komputer');
                } else {
                  alatKerja.remove('komputer');
                }
                setState(() {});
              },
            ),
            CheckboxListTile(
              title: Text('HP'),
              value: alatKerja.contains('hp'),
              onChanged: (checked) {
                if (checked!) {
                  alatKerja.add('hp');
                } else {
                  alatKerja.remove('hp');
                }
                setState(() {});
              },
            ),
            CheckboxListTile(
              title: Text('Lainya'),
              value: alatKerja.contains('lainya'),
              onChanged: (checked) {
                if (checked!) {
                  alatKerja.add('lainya');
                } else {
                  alatKerja.remove('lainya');
                }
                setState(() {});
              },
            ),
            SizedBox(height: 16),
            Text('Suasana Hati'),
            RadioListTile<String>(
              title: Text('Sedih'),
              value: 'sedih',
              groupValue: suasana,
              onChanged: (val) {
                setState(() {
                  suasana = val!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Senang'),
              value: 'senang',
              groupValue: suasana,
              onChanged: (val) {
                setState(() {
                  suasana = val!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Netral'),
              value: 'netral',
              groupValue: suasana,
              onChanged: (val) {
                setState(() {
                  suasana = val!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh StatelesWidget
class HelloMessage extends StatelessWidget {
  const HelloMessage({
    super.key,
    this.nama,
  });

  final String? nama;

  @override
  Widget build(BuildContext context) {
    return Text("Halo, ${nama ?? 'test'}");
  }
}

// Contoh StatefulWidget
class TombolBintang extends StatefulWidget {
  const TombolBintang({
    super.key,
    this.initialFavoriteNum = 0,
    this.initialIsLoved = false,
  });

  final int initialFavoriteNum;
  final bool initialIsLoved;

  @override
  State<TombolBintang> createState() => _TombolBintangState();
}

class _TombolBintangState extends State<TombolBintang> {
  // menggunakan keyword late
  // late: menunggu lifecycle initState selesai
  late int numFavorite = widget.initialFavoriteNum;

  // manual, tanpa keyword late
  // isFavorite diberi nilai awal sembari menunggu initState dijalankan
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    // ketika initState dijalankan, ubah nilai isFavorite menjadi widget.initialIsLoved
    isFavorite = widget.initialIsLoved;

    print('widget ditampilkan di layar');
  }

  @override
  void didUpdateWidget(covariant TombolBintang oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('parameter widget berubah');
  }

  @override
  void dispose() {
    print("widget favorite dihapus dari layar");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isFavorite = !isFavorite;

        if (isFavorite) {
          numFavorite++;
        } else {
          numFavorite--;
        }

        // memberitahu bahwa terdapat perubahan nilai pada state
        // sehingga method build() akan dipanggil ulang
        setState(() {});
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          Text(numFavorite.toString()),
        ],
      ),
    );
  }
}


// FilledButton(
//   onPressed: () async {
//     final result = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1999),
//       lastDate: DateTime(2045),
//     );

//     final time = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );

//     print(result);
//   },
//   child: Text('Pilih date'),
// ),