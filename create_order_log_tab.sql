DROP TABLE IF EXISTS public.order_log;

CREATE TABLE public.order_log
(
    "NO" integer NOT NULL,
    "SECCODE" text COLLATE pg_catalog."default" NOT NULL,
    "BUYSELL" "char" NOT NULL,
    "TIME" bigint NOT NULL,
    "ORDERNO" integer NOT NULL,
    "ACTION" integer NOT NULL,
    "PRICE" real NOT NULL,
    "VOLUME" bigint NOT NULL,
    "TRADENO" bigint,
    "TRADEPRICE" real,
    CONSTRAINT order_log_pkey PRIMARY KEY ("NO")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.order_log
    OWNER to postgres;

-- Внимание! PostgreSQL Server имеет ограниченные права доступа к файлам. Команда COPY будет работать
-- только если загружаемый файл с данными находится в папке с публичным доступом (~\User\Public для Windows,
-- /tmp для Mac). Можно использовать команду \COPY, которая обходит все права достпупа, но ее нужно запускать
-- из терминала Shell SQL (psql). Ниже представлены оба вариант. Используйте тот, который Вам больше нравится.

copy public.order_log  FROM 'C:/Users/Public/OrderLog20151123.csv' DELIMITER ',' CSV HEADER;
-- \copy public.order_log  FROM 'C:/Users/Public/OrderLog20151123.csv' DELIMITER ',' CSV HEADER;
