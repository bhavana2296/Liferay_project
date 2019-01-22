create index IX_9E4A5F11 on LB_Entry (groupId, guestbookId);
create index IX_71F137A1 on LB_Entry (groupId, status);
create index IX_4B829B5 on LB_Entry (status);
create index IX_6A047603 on LB_Entry (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_CB28A145 on LB_Entry (uuid_[$COLUMN_LENGTH:75$], groupId);

create index IX_D5C9E72 on LB_Guestbook (groupId, status);
create index IX_59E3A3C4 on LB_Guestbook (status);
create index IX_3C05E952 on LB_Guestbook (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_123C9C54 on LB_Guestbook (uuid_[$COLUMN_LENGTH:75$], groupId);