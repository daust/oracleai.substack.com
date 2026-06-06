CREATE TABLE pc_projects (
    pc_project_id  NUMBER         CONSTRAINT pc_projects_pk PRIMARY KEY,
    project_name   VARCHAR2(100)  CONSTRAINT pc_projects_name_nn NOT NULL,
    description    VARCHAR2(4000),
    created        DATE           DEFAULT SYSDATE,
    created_by     VARCHAR2(100)  DEFAULT SYS_CONTEXT('APEX$SESSION', 'APP_USER'),
    updated        DATE,
    updated_by     VARCHAR2(100),
    CONSTRAINT pc_projects_name_uk UNIQUE (project_name)
);
