/*
  Warnings:

  - You are about to drop the column `nama` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `date` on the `users` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `users` DROP COLUMN `nama`,
    DROP COLUMN `date`,
    ADD COLUMN     `name` VARCHAR(191);

-- AlterIndex
ALTER TABLE `access_token` RENAME INDEX `access_token_userId_unique` TO `access_token.userId_unique`;

-- AlterIndex
ALTER TABLE `profiles` RENAME INDEX `profiles_userId_unique` TO `profiles.userId_unique`;
