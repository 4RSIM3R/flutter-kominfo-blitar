import 'package:flutter/material.dart';
import 'package:flutter_training/model/example_model.dart';

class SubmitAttendancePage extends StatelessWidget {
  const SubmitAttendancePage({super.key});

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
          children: [
            const TextField(
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
              onChanged: (_) {},
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