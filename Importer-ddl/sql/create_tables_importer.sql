create table importresourcegroup
(
    id         int not null
        constraint importresourcegroup_pkey
            primary key,
    code       varchar(32),
    description  varchar(128),
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importresourcegroup_id_table
(
    id int identity
        primary key
)
go

create table importresource
(
    id               int not null
        constraint importresource_pkey
            primary key,
    company          int             default 1,
    code           varchar(30),
    description        varchar(128),
    resource_group_code            varchar(32),
    active            bit             default 'false',
    status_imp       varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importresource_id_table
(
    id int identity
        primary key
)
go

create table importstopreason
(
    id         int not null
        constraint importstopreason_pkey
            primary key,
    company    int default 1,
    code     varchar(30),
    description  varchar(128),
    abbreviation varchar(16),
    password      varchar(32),
    color        varchar(1),
    scheduled bit default 'False',
    active      bit default 'True',
    setup      bit default 'False',
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importstopreason_id_table
(
    id int identity
        primary key
)
go

create table importwastereason
(
    id         int not null
        constraint importwastereason_pkey
            primary key,
    company    int default 1,
    code     varchar(30),
    description  varchar(128),
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importwastereason_id_table
(
    id int identity
        primary key
)
go

create table importoperator
(
    id         int not null
        constraint importoperator_pkey
            primary key,
    company    int default 1,
    code     varchar(30),
    name       varchar(128),
    active      bit default 'True',
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importoperator_id_table
(
    id int identity
        primary key
)
go

create table importtool
(
    id                        int not null
        constraint importtool_pkey
            primary key,
    company                   int             default 1,
    code                    varchar(30),
    description                 varchar(128),
    status_imp                varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importtool_id_table
(
    id int identity
        primary key
)
go

create table importtoolsettings
(
    id                        int not null
        constraint importtoolsettings_pkey
            primary key,
    company                   int             default 1,
    tool_code                   varchar(30),
    resource_code                   varchar(30),
    product_code                 varchar(30),
    multiplication_coefficient decimal(20, 10) default 1,
    depreciation               decimal(20, 10) default 0,
    cycle_time               int,
    cycle_limit              int,
    stop_limit             int,
    status_imp                varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importtoolsettings_id_table
(
    id int identity
        primary key
)
go


create table importproduct
(
    id         int not null
        constraint importproduct_pkey
            primary key,
    company    int default 1,
    code     varchar(30),
    version     varchar(30) default '',
    description  varchar(128),
    expected_time    int DEFAULT 0,
    box_conversion    VARCHAR(30),
    external_id    VARCHAR(30),
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importproduct_id_table
(
    id int identity
        primary key
)
go


create table importproductionorder
(
    id             int not null
        constraint importproductionorder_pkey
            primary key,
    company        int             default 1,
    origin         varchar(30)     default 0,
    code         varchar(30),
    description      varchar(128),
    product_code        varchar(30),
    derivation      varchar(30),
    order         int             default 1,
    measurement_unit varchar(128)    default 'PC',
    customer_name   varchar(128)    default '',
    quantity     decimal(20, 10) default 1,
    grouped_production_order      varchar(30),
    fraction  decimal(10, 9)  default 1,
    deadline    datetime,
    priority     decimal(20, 10) default 1,
    status_imp     varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
)
go

create table importproductionorder_id_table
(
    id int identity
        primary key
)
go

create table importproductionsequence
(
    id                   int not null
        constraint importproductionsequence_pkey
            primary key,
    company              int         default 1,
    origin               varchar(30) default 0,
    production_order_code               varchar(30),
    sequence            int,
    stage              int,
    resource_code              varchar(30),
    tool_code           varchar(30),
    operation_code      varchar(30),
    operation_description      varchar(128),
    quantity           decimal(20, 10),
    quantity2           decimal(20, 10),
    tare           decimal(20, 10) default 0,
    expected_start_date datetime,
    expected_end_date    datetime,
    expected_setup       bigint      default 0,
    expected_time       bigint      default 0,
    conversion_rate    int,
    measurement_unit       varchar(4),
    situation             varchar(1),
        check ([situacao] = 'L' OR [situacao] = 'F' OR [situacao] = 'C'),
    status_imp           varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N' OR [status_imp] = 'E')
    
)
go

create table importproductionsequence_id_table
(
    id int identity
        primary key
)
go

create table importcomponents
(
    id                   int not null
        constraint importcomponents_pkey
            primary key,
    barcode              varchar(128),
    code               varchar(128),
    description               varchar(128),
    total_quantity            decimal(20, 10),
    total_weight              decimal(20, 10),
    current_quantity          decimal(20, 10),
    current_weight            decimal(20, 10),,
    type      varchar(30),
    conversion_rate    int,
    status             varchar(1),
        check ([status] = 'L' OR [status] = 'F' OR [status] = 'C'),
    extras           varchar(500)
    
)
go

create table importcomponents_id_table
(
    id int identity
        primary key
)
go

create table importcomponentsproductionorder
(
    id                   int not null
        constraint importcomponentsproductionorder_pkey
            primary key,
    code              varchar(128),
    code_production_order               varchar(30),
    origin_production_order               varchar(30),
    stage_production_sequence            int,
    production_sequence              int,
    reserved_quantity          decimal(20, 10),
    reserved_weight          decimal(20, 10),
    current_quantity          decimal(20, 10),
    current_weight          decimal(20, 10),
    status             varchar(1),
        check ([status] = 'L' OR [status] = 'F' OR [status] = 'C'),
    extras           varchar(500)
    
)
go

create table importcomponentsproductionorder_id_table
(
    id int identity
        primary key
)
go