CREATE OR REPLACE TRIGGER pc_projects_bir
    BEFORE INSERT OR UPDATE ON pc_projects
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        IF :NEW.pc_project_id IS NULL THEN
            :NEW.pc_project_id := pc_projects_seq.NEXTVAL;
        END IF;
        :NEW.created    := SYSDATE;
        :NEW.created_by := NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER);
    END IF;
    IF UPDATING THEN
        :NEW.updated    := SYSDATE;
        :NEW.updated_by := NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER);
    END IF;
END;
/
