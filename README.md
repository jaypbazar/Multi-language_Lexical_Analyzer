# <center>Multi-language Lexical Analyzer
---
## Members:
- Bazar, Jayp 
-
-
---
## Introduction
&lt;Put a short description of the application here&gt;

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
   ```powershell
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