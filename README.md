# <center>Multi-language Lexical Analyzer
---
## Members:
- Bazar, Jayp S.
- Nanale, Krizia Belle L.
- Parañal, Mary Rachel L.
---
## Introduction
<p>This Multi-language Lexical Analyzer is a software tool developed to perform lexical analysis on source code written in *C, Java, or Python*. Lexical analysis, the first phase of a compiler, involves breaking down source code into a sequence of tokens such as keywords, identifiers, literals, operators, and symbols.

---
## Features
<p>The Multi-language Lexical Analyzer offers a range of functionalities that demonstrates the core principles of lexical analysis while supporting different programming languages.

- **Multi-language support**: Allow analysis of source code written in C, Java, and Python.
- **Dual input modes**: Users can input code directly through the terminal or load it from a text file.
- **Token classification**: Identifies and categorizes tokens into:
    - **Keywords** - Reserved words such as `int`, `def`, `public`
    - **Identifiers** - Variable and function names like `main`, `sum`
    - **Literals** - Numeric values like `123`, `3.14`
    - **Operators** - Symbols such as `+`, `=`, `==`
    - **Delimiters** - Syntax-related characters like `;`, `{`, `}`
- **Error detection and reporting**: Clearly flags unrecognized or invalid tokens.

---
## Requirements
- Python 3.10 or higher (must be available in your system PATH)
- GCC compiler (for compiling C code, e.g., via MinGW, Cygwin, or WSL; must be in PATH)
- Flex lexical analyzer generator (must be in PATH)
- Windows OS (the program uses 'cls' and expects 'lexer.exe')

    Note: All required programs must be accessible from the command line (added to your system PATH).
---
## How to run the program
1. Clone the repository:
   ```
   git clone https://github.com/jaypbazar/Multi-language_Lexical_Analyzer.git
   ```
   
   ```
   cd Multi-language_Lexical_Analyzer
   ```
2. Make sure Python, GCC, and Flex are installed and available in your system PATH.
3. Open a terminal in the project directory.
4. Run the main program:
   ```powershell
   python main.py
   ```
5. Follow the on-screen prompts to:
   - Select a language (C, Java, or Python)
   - Choose input type (terminal or text file)
   - Provide your input for lexical analysis
6. View the lexer output in the terminal.

Note: If you encounter errors about missing programs, ensure all requirements are installed and accessible from the command line.

---

### Sample Outputs:
![Choosing a language](sample_outputs/1.png)
![Choosing input type](sample_outputs/2.png)
![Choosing input type](sample_outputs/3.png)
