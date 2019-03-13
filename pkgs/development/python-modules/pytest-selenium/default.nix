{ lib
, buildPythonPackage
, fetchPypi
, pytest
}:

buildPythonPackage rec {
  pname = "pytest-selenium";
  version = "1.16.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0axbrpqal3cqw9zq6dakdbg49pnf5gvyvq6yn93hp1ayc7fnhzk3";
  };

  buildInputs = [ pytest ];

  checkPhase = ''
    pytest testing/test_driver.py
  '';

  meta = {
    description = "pytest-selenium is a plugin for pytest that provides support for running Selenium based tests.";
    homepage = https://github.com/pytest-dev/pytest-selenium;
    maintainers = with lib.maintainers; [ cfraz89 ];
    license = lib.licenses.mpl20;
  };
}
