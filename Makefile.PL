
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "General purpose, MongoDB-style query and update language",
  "AUTHOR" => "Ido Perlmuter <ido\@ido50.net>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MQUL",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MQUL",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Compare" => 0,
    "Data::Types" => 0,
    "DateTime::Format::W3CDTF" => 0,
    "Exporter" => 0,
    "Scalar::Util" => 0,
    "Try::Tiny" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => 0
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Data::Compare" => 0,
  "Data::Types" => 0,
  "DateTime::Format::W3CDTF" => 0,
  "Exporter" => 0,
  "Scalar::Util" => 0,
  "Test::More" => 0,
  "Try::Tiny" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



