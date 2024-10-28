-- DB作成
CREATE DATABASE sample_app_db;
-- 作成したDBに接続
\c sample_app_db;
-- ユーザ情報格納用テーブルの作成
CREATE TABLE users 
(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- セッション情報格納用テーブルの作成
CREATE TABLE sessions (
    session_id VARCHAR(255) PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    expiration_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- USER ID用シーケンス作成
CREATE SEQUENCE user_id_seq START 1;

-- 初期データの投入
INSERT INTO users
(
    user_id,
    username,
    email,
    password,
    created_at
) 
VALUES
(
    nextval('user_id_seq'),
    'test',
    'test@gmail.com',
    '$2b$10$CxzvtogagUFxm.iuLdMicOsZPNjb2PRK8GggIH3emJildFB7BpujO',
    CURRENT_TIMESTAMP
);
