--liquibase formatted sql

--changeset ilk07:1
create table customers
(
    id           int auto_increment primary key,
    name         varchar(255) NOT NULL comment 'Имя покупателя',
    surname      varchar(255) NOT NULL comment 'Фамилия покупателя',
    age          smallint     NOT NULL comment 'Возраст покупателя',
    phone_number varchar(20) comment 'Номер телефона покупателя'
);
--rollback drop table customers

--changeset ilk07:2
create table orders
(
    id           int auto_increment primary key,
    date         date default (CURRENT_DATE) comment 'Дата покупки',
    customer_id  int not null comment 'ID покупателя в таблице customer',
    product_name varchar(255) not null comment 'Название товара',
    amount decimal not null default 0.00 comment 'Сумма к оплате',
    foreign key (customer_id) references customers (id)
);
--rollback drop table orders