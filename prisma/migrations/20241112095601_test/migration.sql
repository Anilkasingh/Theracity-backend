-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_name` VARCHAR(191) NOT NULL,
    `user_email` VARCHAR(191) NOT NULL,
    `user_password` VARCHAR(191) NOT NULL,
    `activitiesCompleted` INTEGER NULL,
    `createdOn` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_user_email_key`(`user_email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Therapist` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `therapistName` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `secondName` VARCHAR(191) NULL,
    `therapistEmail` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `specialization` VARCHAR(191) NOT NULL,
    `createdOn` DATETIME(3) NOT NULL,
    `updatedOn` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Therapist_therapistEmail_key`(`therapistEmail`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TherapySession` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NOT NULL,
    `time` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `feedback` VARCHAR(191) NULL,
    `userId` INTEGER NOT NULL,
    `therapistId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ChatbotInteraction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NOT NULL,
    `query` VARCHAR(191) NOT NULL,
    `response` VARCHAR(191) NOT NULL,
    `activitySuggestions` VARCHAR(191) NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SupportGroup` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `groupName` VARCHAR(191) NOT NULL,
    `noOfMembers` INTEGER NULL,
    `moderatorId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Moderator` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `modEmail` VARCHAR(191) NOT NULL,
    `modName` VARCHAR(191) NOT NULL,
    `modPassword` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Moderator_modEmail_key`(`modEmail`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_UserGroups` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_UserGroups_AB_unique`(`A`, `B`),
    INDEX `_UserGroups_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `TherapySession` ADD CONSTRAINT `TherapySession_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TherapySession` ADD CONSTRAINT `TherapySession_therapistId_fkey` FOREIGN KEY (`therapistId`) REFERENCES `Therapist`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChatbotInteraction` ADD CONSTRAINT `ChatbotInteraction_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SupportGroup` ADD CONSTRAINT `SupportGroup_moderatorId_fkey` FOREIGN KEY (`moderatorId`) REFERENCES `Moderator`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserGroups` ADD CONSTRAINT `_UserGroups_A_fkey` FOREIGN KEY (`A`) REFERENCES `SupportGroup`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserGroups` ADD CONSTRAINT `_UserGroups_B_fkey` FOREIGN KEY (`B`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
