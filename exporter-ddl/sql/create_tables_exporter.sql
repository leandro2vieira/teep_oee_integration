create table exportproduction
(
    id                   int not null
        constraint exportproduction_pkey
            primary key,
    generation_date datetime,
    company              int         default 1,
    origin               varchar(30) default 0,
    production_order               varchar(30),
    stage              int,
    production_sequence            int,
    product              varchar(30),
    resource              varchar(30),
    resource_group           varchar(30),
    tool      varchar(30),
    operator      varchar(30),
    shift      varchar(30),
    control      varchar(30),
    start     TIMESTAMP,
    "end"      TIMESTAMP,
    duration      int,
    batch_code      varchar(32),
    quantity           decimal(20, 10),
    quantity2           decimal(20, 10),
    quantity3           decimal(20, 10),
    conversion_rate    decimal(20, 10)
)
go

create table exportproduction_id_table
(
    id int identity
        primary key
)
go

create table exportstop
(
    id                   int not null
        constraint exportstop_pkey
            primary key,
    generation_date datetime,
    company              int         default 1,
    origin               varchar(30) default 0,
    production_order               varchar(30),
    stage              int,
    production_sequence            int,
    product              varchar(30),
    resource              varchar(30),
    resource_group           varchar(30),
    tool      varchar(30),
    operator      varchar(30),
    shift      varchar(30),
    control      varchar(30),
    start     TIMESTAMP,
    "end"      TIMESTAMP,
    duration      int,
    reason      varchar(30),
    setup           bit default 'False'
)
go

create table exportstop_id_table
(
    id int identity
        primary key
)
go

create table exportwaste
(
    id                   int not null
        constraint exportwaste_pkey
            primary key,
    generation_date datetime,
    company              int         default 1,
    origin               varchar(30) default 0,
    production_order               varchar(30),
    stage              int,
    production_sequence            int,
    product              varchar(30),
    resource              varchar(30),
    resource_group           varchar(30),
    tool      varchar(30),
    operator      varchar(30),
    shift      varchar(30),
    control      varchar(30),
    time     TIMESTAMP,
    reason      varchar(30),
    setup           bit default 'False',
    batch_code VARCHAR(32) default '',
    quantity DECIMAL(20, 10),
    quantity2 DECIMAL(20, 10) default 0,
    quantity3 DECIMAL(20, 10) default 0,
    conversion_rate DECIMAL(20,10) DEFAULT 1,
    classification VARCHAR(30),
    cause_step VARCHAR(30),
    cause_resource VARCHAR(30)
)
go

create table exportwaste_id_table
(
    id int identity
        primary key
)
go