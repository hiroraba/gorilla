requires 'perl', '5.008005';

requires 'File::Next';
requires 'Filesys::Notify::Simple';

on 'test' => sub {
  requires 'Test::More', '0.88';
};

on 'develop' => sub {
  requires 'Module::Install';
  requires 'Module::Install::CPANfile';
  requires 'Module::Install::AuthorTests';
  requires 'Module::Install::Repository';
};
