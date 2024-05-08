# НИЯУ МИФИ. ИИКС. Лабораторная работа №4. Давыдов М. Б21-505. 2024.

## Запуск и подключение к PostgreSQL

```bash
# Запуск
docker run --name postgres -e POSTGRES_PASSWORD=secretpassword  -e POSTGRES_DB=market -p 5432:5432  -d postgres:latest
# Подключение
psql -h localhost -d market --user=postgres # пароль вводится в интерактивном режиме 
```

## Загрузка данных в PostgreSQL из Sqlite3
```bash
pgloader sqlite:///$(pwd)/db.db pgsql://postgres:12345@localhost/market
```

### Отличия в процессе восстановления базы данных.

1) Поле `id` следует указывать не как `INT AUTOINCREMENT`, а `SERIAL`, что является одним и тем же. Пример исправленного запроса:

```sql
CREATE TABLE Users (
    id  SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);
```

2) Реляционное поле следует указывать непосредственно после его объявления:

```sql
CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES Categories(id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,
);
```

3) Порядок объявления таблиц важен:

```sql 
CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES Categories(id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL
);
```

## Заключение

В ходе выполнения этой лабораторной работы были усвоены отличия PostgreSQL от Sqlite3 и произведена миграция из одной базы даных в другую.
