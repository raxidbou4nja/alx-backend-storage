-- Create index idx_name_first on the table names for the first letter of name
CREATE INDEX idx_name_first ON names(name(1));
