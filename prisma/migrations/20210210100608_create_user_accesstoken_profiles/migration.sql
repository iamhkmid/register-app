-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191),
    `email` VARCHAR(191),
    `password` VARCHAR(191) NOT NULL,
    `role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    `date` DATETIME(3) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
UNIQUE INDEX `users.uuid_unique`(`uuid`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `access_token` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(191) NOT NULL,
    `access_token` VARCHAR(191) NOT NULL,
    `ip_address` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `userId` INTEGER NOT NULL,
UNIQUE INDEX `access_token.uuid_unique`(`uuid`),
UNIQUE INDEX `access_token_userId_unique`(`userId`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `profiles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(191) NOT NULL,
    `no_registrasi` VARCHAR(191) NOT NULL,
    `nama_lengkap` VARCHAR(191) NOT NULL,
    `prodi` VARCHAR(191) NOT NULL,
    `fakultas` VARCHAR(191) NOT NULL,
    `status_pembayaran` VARCHAR(191) NOT NULL,
    `tempat_lahir` VARCHAR(191) NOT NULL,
    `tgl_lahir` VARCHAR(191) NOT NULL,
    `jenis_kelamin` VARCHAR(191) NOT NULL,
    `tinggi_badan` VARCHAR(191) NOT NULL,
    `golongan_darah` VARCHAR(191) NOT NULL,
    `nama_ayah` VARCHAR(191) NOT NULL,
    `pekerjaan_ayah` VARCHAR(191) NOT NULL,
    `penghasilan_ayah` VARCHAR(191) NOT NULL,
    `no_hp_ayah` VARCHAR(191) NOT NULL,
    `nama_ibu` VARCHAR(191) NOT NULL,
    `pekerjaan_ibu` VARCHAR(191) NOT NULL,
    `penghasilan_ibu` VARCHAR(191) NOT NULL,
    `no_hp_ibu` VARCHAR(191) NOT NULL,
    `alamat_lengkap` VARCHAR(191) NOT NULL,
    `penyakit` VARCHAR(191),
    `agama` ENUM('Islam', 'Kristen', 'Hindu', 'Budha') NOT NULL,
    `anak_ke` VARCHAR(191) NOT NULL,
    `kewarganegaraan` VARCHAR(191) NOT NULL,
    `no_hp` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `userId` INTEGER NOT NULL,
UNIQUE INDEX `profiles.uuid_unique`(`uuid`),
UNIQUE INDEX `profiles.no_registrasi_unique`(`no_registrasi`),
UNIQUE INDEX `profiles_userId_unique`(`userId`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `access_token` ADD FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `profiles` ADD FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
