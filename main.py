import subprocess

def run_flex_and_gcc(lang_file):
    """
    Runs the Flex lexical analyzer generator and GCC compiler for the given .l file.
    - Runs Flex on the selected .l file to generate lex.yy.c.
    - Compiles lex.yy.c using GCC to produce the lexer executable.
    - Prints error messages if either step fails.
    """
    # Run flex on the selected .l file
    flex_result = subprocess.run(['flex', lang_file], capture_output=True, text=True)
    if flex_result.returncode != 0:
        print('Flex Error:', flex_result.stderr)
        return
    
    # Run gcc on the generated lex.yy.c
    gcc_result = subprocess.run(['gcc', 'lex.yy.c', '-o', 'lexer'], capture_output=True, text=True)
    if gcc_result.returncode != 0:
        print('GCC Error:', gcc_result.stderr)
        return
    
    print('Compilation successful. Executable: lexer.exe')


def main():
    """
    Main program loop for the multi-language lexical analyzer.
    - Prompts the user to select a language definition file.
    - Compiles the lexer for the selected language.
    - Asks the user to choose input type (terminal or file).
    - Executes the lexer with the provided input and displays the output.
    - Repeats until the user chooses to exit.
    """
    lang_files = {'1': 'c_lang.l', '2': 'java_lang.l', '3': 'python_lang.l'}
    while True:
        subprocess.run('cls', shell=True)
        print("Choose a language: \n  1. C\n  2. Java\n  3. Python\n  4. Exit")
        
        choice = input("Enter your choice (1-4): ").strip()
        
        if choice == '4':
            print("Exiting...")
            break
        lang_file = lang_files.get(choice)
        if lang_file:
            run_flex_and_gcc(lang_file)
        else:
            print("Invalid choice.")

        # Ask for input type
        while True:
            print('Choose input type:')
            print('1. Terminal input')
            print('2. Text file input')
            
            input_choice = input('Enter your choice (1-2): ').strip()
            
            match input_choice:
                case '1':
                    # Get user input from terminal and run lexer
                    user_input = input('Enter the input for the lexer (end with Enter):\n')
                    lexer_proc = subprocess.run(['lexer.exe'], input=user_input, capture_output=True, text=True)
                    print('Lexer Output:\n', lexer_proc.stdout)
                    break
                case '2':
                    # Read input from a text file and run lexer
                    file_name = input('Enter the path to the input text file (with file extension): ').strip()
                    try:
                        with open(file_name, 'r') as f:
                            file_content = f.read()
                        lexer_proc = subprocess.run(['lexer.exe'], input=file_content, capture_output=True, text=True)
                        print('Lexer Output:\n', lexer_proc.stdout)
                    except FileNotFoundError:
                        print('File not found. Please try again.')
                        continue
                    break
                case _:
                    print('Invalid choice. Please enter 1 or 2.')

        input('Press Enter to continue...')

if __name__ == "__main__":
    main()