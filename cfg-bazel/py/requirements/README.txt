# Bazel Python environment setup

## How to generate requirements-lock-3-10.txt from requirements-3-10.in

```
sudo apt install python3-pip python3-venv
python3 -m venv myenv   # Replace 'myenv' with your preferred environment name
source myenv/bin/activate
pip install pip-tools
pip-compile --output-file requirements-lock-3-10.txt requirements-3-10.in
```
