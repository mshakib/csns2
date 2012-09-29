-- This script removes everything in a CSNS database.

set client_min_messages=WARNING;

drop sequence hibernate_sequence;

drop function quarter(integer);
drop function quarter();
drop function quarter(date);

alter table forum_topics drop constraint fk_forum_topic_last_post;
alter table forum_topics drop constraint fk_forum_topic_first_post;
alter table forums drop constraint fk_forum_last_post;
drop table forum_post_attachments;
drop table forum_posts;
drop table forum_topics;
drop table forum_selections;
drop table forum_moderators;
drop table forums;

drop table surveys_taken;
drop table survey_responses;
drop table surveys;

drop table department_additional_graduate_courses;
drop table department_graduate_courses;
drop table department_additional_undergraduate_courses;
drop table department_undergraduate_courses;
drop table department_reviewers;
drop table department_instructors;
drop table department_faculty;
drop table department_administrators;
drop table departments;

alter table files drop constraint files_submission_id_fkey;
drop table submissions;
drop trigger assignments_ts_trigger on assignments;
drop function assignments_ts_trigger_function();
drop table assignments;

drop table enrollments;
drop table section_instructors;
drop table sections;
drop trigger courses_ts_trigger on courses;
drop function courses_ts_trigger_function();
drop table courses;

drop table grades;

drop table answer_selections;
drop table answers;
drop table answer_sections;
drop table answer_sheets;
drop table question_correct_selections;
drop table question_choices;
drop table questions;
drop table question_sections;
drop table question_sheets;

drop table subscriptions;

drop table files;

drop table persistent_logins;
drop table authorities;
drop table users;
