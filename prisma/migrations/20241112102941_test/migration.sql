/*
  Warnings:

  - You are about to drop the column `noOfMembers` on the `SupportGroup` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `SupportGroup` DROP COLUMN `noOfMembers`;

-- CreateTable
CREATE TABLE `TherapistAvailable` (
    `therapistId` INTEGER NOT NULL,
    `slot_start` DATETIME(3) NOT NULL,
    `slot_end` DATETIME(3) NOT NULL,

    PRIMARY KEY (`therapistId`, `slot_start`, `slot_end`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ChatGroup` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `supportGroupId` INTEGER NOT NULL,

    UNIQUE INDEX `ChatGroup_supportGroupId_key`(`supportGroupId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ChatMessage` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `content` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_UserChats` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_UserChats_AB_unique`(`A`, `B`),
    INDEX `_UserChats_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `TherapistAvailable` ADD CONSTRAINT `TherapistAvailable_therapistId_fkey` FOREIGN KEY (`therapistId`) REFERENCES `Therapist`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChatGroup` ADD CONSTRAINT `ChatGroup_supportGroupId_fkey` FOREIGN KEY (`supportGroupId`) REFERENCES `SupportGroup`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChatMessage` ADD CONSTRAINT `ChatMessage_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserChats` ADD CONSTRAINT `_UserChats_A_fkey` FOREIGN KEY (`A`) REFERENCES `ChatGroup`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserChats` ADD CONSTRAINT `_UserChats_B_fkey` FOREIGN KEY (`B`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
