use 5.008005;
use strict;
use warnings;

use Module::Build 0.3601;

my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601",
  },
  "dist_abstract" => "Gorilla is Test Tool.",
  "dist_author" => [
    "Hiroki Matsuo <hiroraba\@gmail.com>"
  ],
  "dist_name" => "Gorilla",
  "dist_version" => "v0.0.1",
  "license" => "perl",
  "module_name" => "Gorilla",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Module::CPANfile" => "0.9025",
    "perl" => "5.008005",
    "File::Next" => 0,
    "Filesys::Notify::Simple" => 0
  },
  "script_files" => {
    "bin/gorilla"
  }
);

my $build = Module::Build->new(%module_build_args);
$build->create_build_script;
