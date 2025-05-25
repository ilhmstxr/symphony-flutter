class Wisata {
  final int id;
  final String judul;
  final String deskripsi;
  final String jamBuka;
  final String hariBuka;
  final String gambar; // Tambahkan atribut gambar

  Wisata({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.jamBuka,
    required this.hariBuka,
    required this.gambar,
  });

  // Konversi dari Map ke Wisata
  factory Wisata.fromMap(Map<String, dynamic> map) {
    return Wisata(
      id: map['id'],
      judul: map['judul'],
      deskripsi: map['deskripsi'],
      jamBuka: map['jam_buka'],
      hariBuka: map['hari_buka'],
      gambar: map['gambar'],
    );
  }

  // Konversi dari Wisata ke Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
      'jam_buka': jamBuka,
      'hari_buka': hariBuka,
      'gambar': gambar,
    };
  }
}
