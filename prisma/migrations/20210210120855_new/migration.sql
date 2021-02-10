-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "access_token" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid" TEXT NOT NULL,
    "access_token" TEXT NOT NULL,
    "ip_address" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    "userId" INTEGER NOT NULL,
    FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "profiles" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid" TEXT NOT NULL,
    "no_registrasi" TEXT NOT NULL,
    "nama_lengkap" TEXT NOT NULL,
    "prodi" TEXT NOT NULL,
    "fakultas" TEXT NOT NULL,
    "status_pembayaran" TEXT NOT NULL,
    "tempat_lahir" TEXT NOT NULL,
    "tgl_lahir" TEXT NOT NULL,
    "jenis_kelamin" TEXT NOT NULL,
    "tinggi_badan" TEXT NOT NULL,
    "golongan_darah" TEXT NOT NULL,
    "nama_ayah" TEXT NOT NULL,
    "pekerjaan_ayah" TEXT NOT NULL,
    "penghasilan_ayah" TEXT NOT NULL,
    "no_hp_ayah" TEXT NOT NULL,
    "nama_ibu" TEXT NOT NULL,
    "pekerjaan_ibu" TEXT NOT NULL,
    "penghasilan_ibu" TEXT NOT NULL,
    "no_hp_ibu" TEXT NOT NULL,
    "alamat_lengkap" TEXT NOT NULL,
    "penyakit" TEXT,
    "agama" TEXT NOT NULL,
    "anak_ke" TEXT NOT NULL,
    "kewarganegaraan" TEXT NOT NULL,
    "no_hp" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    "userId" INTEGER NOT NULL,
    FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "users.uuid_unique" ON "users"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "access_token.uuid_unique" ON "access_token"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "access_token.userId_unique" ON "access_token"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "profiles.uuid_unique" ON "profiles"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "profiles.no_registrasi_unique" ON "profiles"("no_registrasi");

-- CreateIndex
CREATE UNIQUE INDEX "profiles.userId_unique" ON "profiles"("userId");
