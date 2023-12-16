# Template Copier Shell Script

This shell script allows you to copy template files from a predefined template directory to your current working directory. It uses `fzf` for file and language selection, providing a user-friendly interface for template selection.

## Prerequisites

- `fzf`
- `bat` (optional)

## Installation

1. Clone this repository
```bash
git clone https://github.com/andrewzn69/templates
```
2. Navigate to the `templates` directory
```bash
cd templates
```
3. Make the script executable
```bash
chmod +x templates.sh
```
4. Optional: Add Script alias to your `.bashrc` or `.zshrc` file
```bash
alias templates="~/path/to/templates.sh"
```

## Usage
```bash
./templates
```
or
```bash
templates
```

## Troubleshooting

If you get an error about `fzf` not being found, make sure you have `fzf` installed and in your `PATH`.

If you get an error about the template directory not existing, make sure the `TEMPLATE_DIR` variable points to a valid directory.

## Contributing
Feel free to open an issue or submit a pull request if you have any suggestions or improvements.

