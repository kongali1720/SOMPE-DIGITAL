INSERT INTO categories (name, slug, description)
VALUES
    ('Kuliner', 'kuliner', 'Makanan, minuman, restoran, dan usaha kuliner.'),
    ('Pertanian', 'pertanian', 'Pertanian dan hasil produksi pertanian.'),
    ('Peternakan', 'peternakan', 'Peternakan dan hasil ternak.'),
    ('Perikanan', 'perikanan', 'Perikanan dan hasil perikanan.'),
    ('Kerajinan', 'kerajinan', 'Kerajinan lokal dan produk kreatif.'),
    ('Fashion', 'fashion', 'Fashion, pakaian, dan tekstil.'),
    ('Jasa', 'jasa', 'Berbagai layanan profesional dan jasa lokal.'),
    ('Perdagangan', 'perdagangan', 'Perdagangan dan distribusi barang.'),
    ('Teknologi', 'teknologi', 'Teknologi, software, dan layanan digital.'),
    ('Pariwisata', 'pariwisata', 'Pariwisata, perjalanan, dan hospitality.')
ON CONFLICT (slug) DO NOTHING;
