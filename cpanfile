requires 'perl', '5.008005';

# requires 'Some::Module', 'VERSION';

on 'test' => sub {
    requires 'Test::More', '0.88';
    requires 'File::Next';
    requires 'Filesys::Notify::Simple';
};

on 'develop' => sub {
  requires 'Module::Install';
  requires 'Module::Install::CPANfile';
  requires 'Module::Install::AuthorTests';
  requires 'Module::Install::Repository';
};
