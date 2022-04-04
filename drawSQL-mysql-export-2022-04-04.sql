USE db;

CREATE TABLE `User`(
    `id` INT UNSIGNED NOT NULL /*AUTO_INCREMENT*/,
    `name` VARCHAR(255) NOT NULL,
    `nickname` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_id_primary`(`id`);
CREATE TABLE `Review`(
    `id` INT UNSIGNED NOT NULL /*AUTO_INCREMENT*/,
    `movie_id` INT NULL,
    `user_id` INT NOT NULL,
    `text` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Review` ADD PRIMARY KEY `review_id_primary`(`id`);
CREATE TABLE `Poster`(
    `id` INT UNSIGNED NOT NULL /*AUTO_INCREMENT*/,
    `movie_id` INT NOT NULL,
    `link` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Poster` ADD PRIMARY KEY `poster_id_primary`(`id`);
CREATE TABLE `Movie`(
    `id` INT UNSIGNED NOT NULL /*AUTO_INCREMENT*/,
    `name_rus` VARCHAR(255) NOT NULL,
    `name_native` VARCHAR(255) NOT NULL,
    `year` YEAR NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `rating` DECIMAL(8, 2) NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    `Movie` ADD PRIMARY KEY `movie_id_primary`(`id`);
CREATE TABLE `Genre`(
    `id` INT UNSIGNED NOT NULL /*AUTO_INCREMENT*/,
    `name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Genre` ADD PRIMARY KEY `genre_id_primary`(`id`);
CREATE TABLE `Country`(
    `id` INT UNSIGNED NOT NULL /*AUTO_INCREMENT*/,
    `name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Country` ADD PRIMARY KEY `country_id_primary`(`id`);
CREATE TABLE `Movie_genre`(
    `id` INT UNSIGNED NOT NULL /*AUTO_INCREMENT*/,
    `movie_id` INT UNSIGNED NOT NULL,
    `genre_id` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `Movie_genre` ADD PRIMARY KEY `movie_genre_id_primary`(`id`);
CREATE TABLE `Movie_country`(
    `id` INT UNSIGNED NOT NULL /*AUTO_INCREMENT*/,
    `movie_id` INT UNSIGNED NOT NULL,
    `country_id` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `Movie_country` ADD PRIMARY KEY `movie_country_id_primary`(`id`);
ALTER TABLE
    `Review` ADD CONSTRAINT `review_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `User`(`id`);
ALTER TABLE
    `Movie_genre` ADD CONSTRAINT `movie_genre_movie_id_foreign` FOREIGN KEY(`movie_id`) REFERENCES `Movie`(`id`);
ALTER TABLE
    `Review` ADD CONSTRAINT `review_movie_id_foreign` FOREIGN KEY(`movie_id`) REFERENCES `Movie`(`id`);
ALTER TABLE
    `Movie_country` ADD CONSTRAINT `movie_country_movie_id_foreign` FOREIGN KEY(`movie_id`) REFERENCES `Movie`(`id`);
ALTER TABLE
    `Poster` ADD CONSTRAINT `poster_movie_id_foreign` FOREIGN KEY(`movie_id`) REFERENCES `Movie`(`id`);
ALTER TABLE
    `Movie_country` ADD CONSTRAINT `movie_country_country_id_foreign` FOREIGN KEY(`country_id`) REFERENCES `Country`(`id`);
ALTER TABLE
    `Movie_genre` ADD CONSTRAINT `movie_genre_genre_id_foreign` FOREIGN KEY(`genre_id`) REFERENCES `Genre`(`id`);