CREATE TABLE lottery_user (
    user_id        INT PRIMARY KEY,
    user_password  VARCHAR2(64) NOT NULL,
    first_name     VARCHAR2(20) NOT NULL,
    middle_name    VARCHAR2(20),
    last_name      VARCHAR2(20),
    email_id       VARCHAR2(320) UNIQUE NOT NULL,
    mobile_no      VARCHAR2(15) UNIQUE NOT NULL,
    date_of_birth  DATE NOT NULL,
    updated_dt     TIMESTAMP DEFAULT current_timestamp NOT NULL,
    user_version   INT DEFAULT 1 NOT NULL
);

CREATE TABLE slot (
    slot_id        INT PRIMARY KEY,
    slot_date      DATE NOT NULL,
    available_flg  INT NOT NULL,
    active_flg     NUMBER(1, 0) NOT NULL,
    updated_dt     TIMESTAMP DEFAULT current_timestamp NOT NULL,
    slot_version   INT DEFAULT 1 NOT NULL
);

CREATE TABLE lottery (
    lottery_id       INT PRIMARY KEY,
    user_id          INT
        REFERENCES lottery_user ( user_id )
    NOT NULL,
    slot_id          INT
        REFERENCES slot ( slot_id )
    NOT NULL,
    active_flg       NUMBER(1, 0) NOT NULL,
    archieve_flg     NUMBER(1, 0) NOT NULL,
    lotteryamount    DECIMAL(9, 2) NOT NULL,
    updated_dt       TIMESTAMP DEFAULT current_timestamp NOT NULL,
    lottery_version  INT DEFAULT 1 NOT NULL
);

CREATE TABLE payment (
    payment_id            INT PRIMARY KEY,
    user_id               INT
        REFERENCES lottery_user ( user_id )
    NOT NULL,
    lottery_id            INT
        REFERENCES lottery ( lottery_id )
    NOT NULL,
    amount                DECIMAL(9, 2) NOT NULL,
    payment_reference_id  VARCHAR2(255) DEFAULT NULL NOT NULL,
    payment_status        VARCHAR2(15) NOT NULL,
    updated_dt            TIMESTAMP DEFAULT current_timestamp NOT NULL,
    payment_version       INT DEFAULT 1 NOT NULL
);
commit;