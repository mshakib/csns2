create table prereg_schedules (
    id                          bigint primary key,
    department_id               bigint not null references departments(id),
    term                        integer not null,
    prereg_start                timestamp,
    prereg_end                  timestamp,
    default_section_capacity    integer not null default 30,
    deleted                     boolean not null default 'f'
);

create table prereg_sections (
    id              bigint primary key,
    schedule_id     bigint references prereg_schedules(id),
    course_id       bigint references courses(id),
    section_number  integer not null default 1,
    type            varchar(255),
    class_number    varchar(255),
    days            varchar(255),    
    start_time      varchar(255),
    end_time        varchar(255),
    location        varchar(255),
    capacity        integer not null default 30,
    linked_to       bigint references prereg_sections(id)
);

create table prereg_registrations (
    id          bigint primary key,
    student_id  bigint not null references users(id),
    schedule_id bigint not null references prereg_schedules(id),
    comments    varchar(8000),
    date        timestamp not null default current_timestamp
);

create table prereg_registration_sections (
    registration_id bigint not null references prereg_registrations(id),
    section_id      bigint not null references prereg_sections(id),
  primary key (registration_id, section_id)
);
