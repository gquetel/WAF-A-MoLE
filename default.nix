{
  lib,
  python311,
  fetchFromGitHub,
}:

python311.pkgs.buildPythonApplication rec {
  pname = "wafamole";
  version = "unstable-2024-10-11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gquetel";
    repo = "WAF-A-MoLE";
    rev = "93f66e1caf1bc14cd41339d24daf51a582b86ca8";
    hash = "sha256-VGHpOv1G1QTClZXti/AfJh7faGn9X50Dw6s/o+x6S2o=";
  };

  build-system = [
    python311.pkgs.setuptools
    python311.pkgs.wheel
  ];

  dependencies = with python311.pkgs; [
    click
    joblib
    keras
    networkx
    numpy
    scikit-learn
    sqlparse
    tensorflow
  ];

  pythonImportsCheck = [
    "wafamole"
  ];

  meta = {
    description = "A guided mutation-based fuzzer for ML-based Web Application Firewalls";
    homepage = "https://github.com/gquetel/WAF-A-MoLE";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "wafamole";
  };
}
