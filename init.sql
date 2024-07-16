CREATE TABLE IF NOT EXISTS packshot_thumbnail (
    ID SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS packshot (
    ID SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS photos (
    id SERIAL PRIMARY KEY,
    packshot_id INT NOT NULL,
    packshot_thumbnail_id INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (packshot_id) REFERENCES packshot(ID),
    FOREIGN KEY (packshot_thumbnail_id) REFERENCES packshot_thumbnail(ID)
);

CREATE TABLE IF NOT EXISTS media (
    id SERIAL PRIMARY KEY,
    photos_id INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (photos_id) REFERENCES photos(id)
);

CREATE TABLE IF NOT EXISTS thumbnail (
    id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    photos_id INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (photos_id) REFERENCES photos(id)
);

CREATE TABLE IF NOT EXISTS product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    SKU VARCHAR(50) UNIQUE,
    brand VARCHAR(100),
    url VARCHAR(255),
    silhouette VARCHAR(100),
    navigation_target_group VARCHAR(100),
    photos_id INT,
    FOREIGN KEY (photos_id) REFERENCES photos(id)
);


CREATE TABLE IF NOT EXISTS simples (
    id SERIAL PRIMARY KEY,
    issuedAt DATE NOT NULL,
    size VARCHAR(50) NOT NULL,
    sku VARCHAR(50) UNIQUE,
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);


CREATE TABLE IF NOT EXISTS price_updates (
    id SERIAL PRIMARY KEY,
    issuedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    product_id INT NOT NULL,
    promotional_price NUMERIC(10, 2),
    original_price NUMERIC(10, 2) NOT NULL,
    previous_price NUMERIC(10, 2),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

