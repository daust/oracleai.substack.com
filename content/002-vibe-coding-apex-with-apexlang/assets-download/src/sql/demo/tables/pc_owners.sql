CREATE TABLE pc_owners (
    pc_owner_id  NUMBER        CONSTRAINT pc_owners_pk PRIMARY KEY,
    owner_name   VARCHAR2(100) CONSTRAINT pc_owners_name_nn NOT NULL,
    email        VARCHAR2(200),
    created      DATE          DEFAULT SYSDATE,
    created_by   VARCHAR2(100) DEFAULT SYS_CONTEXT('APEX$SESSION', 'APP_USER'),
    updated      DATE,
    updated_by   VARCHAR2(100),
    CONSTRAINT pc_owners_name_uk UNIQUE (owner_name)
);
