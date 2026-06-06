-- ============================================================
-- Project Control - Installation Script
-- Run from an authenticated SQLcl session connected to the
-- target schema. Execute from the src/sql/demo directory:
--   cd src/sql/demo
--   sql <connection> @install.sql
-- ============================================================

-- 1. Tables (dependency order: lookup tables first, tasks last)
@tables/pc_projects.sql
@tables/pc_owners.sql
@tables/pc_milestones.sql
@tables/pc_deliverables.sql
@tables/pc_tasks.sql

-- 2. Sequences
@sequences/pc_sequences.sql

-- 3. Triggers
@triggers/pc_projects_bir.sql
@triggers/pc_owners_bir.sql
@triggers/pc_milestones_bir.sql
@triggers/pc_deliverables_bir.sql
@triggers/pc_tasks_bir.sql

-- 4. Views
@views/pc_tasks_v.sql

PROMPT Install complete.
