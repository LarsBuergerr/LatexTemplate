# INTERNSHIP PROTOCOL 2022 LARS BUERGER #

Latest Version as PDF here -> [PDF](https://bitbucket.hyperstone.de/projects/PG/repos/lars-buerger-playground/browse/InternshipProtocol/main.pdf)

---

## Compilation of the latex document ##

<br>
<br>

### Required packages for msys 64 environment ###
<br>

  - `pacman -S mingw-w64-x86_64-texlive-bin`
  - `pacman -S mingw-w64-x86_64-texlive-latex-recommended `
  - `pacman -S mingw-w64-x86_64-texlive-latex-extra `
  - `pacman -S mingw-w64-x86_64-texlive-bibtex-extra `
  - `pacman -S mingw-w64-x86_64-python-pygments `

<br>

### Executable command ###

<br>

 `del main.pdf && pdflatex --shell-escape -aux-directory=./outdata main && cd outdata & set BIBINPUTS="C:\Users\simon.rauch\01_Git\playground\InternshipProtocol;%BIBINPUTS%" & set BSTINPUTS="C:\Users\simon.rauch\01_Git\playground\InternshipProtocol;%BSTINPUTS%" & bibtex main && cd.. && pdflatex --shell-escape -aux-directory=./outdata main && pdflatex --shell-escape -aux-directory=./outdata main`


### Command Explanation ###

<br>

1. `del main.pdf`
    * Deletes current version of the pdf file

2. `pdflatex --shell-escape -aux-directory=./outdir main`
    * Compiles the .tex file with the additional argument "--shell-escape" for the minted packages and moves all output files in the "outdir" directory

3. `cd outdata & set BIBINPUTS="C:\Users\simon.rauch\01_Git\playground\InternshipProtocol;%BIBINPUTS%" & set BSTINPUTS="C:\Users\simon.rauch\01_Git\playground\InternshipProtocol;%BSTINPUTS%" & bibtex main`
    * jumpes into created directory, compiles bibtex and jumpes back

4. `pdflatex --shell-escape -aux-directory=./outdata main && pdflatex --shell-escape -aux-directory=./outdata main`
    * compiles the .tex files 2 times again (just dont ask why, we also cant explain :])

<br>

### Compilation via Makefile ###

<br>

The only things that have to be changed are the Variables `TARGET_PDF` (should be `your_main_texfile.pdf`)
 and `PROJECT_PATH` should be your local path that contains your latex project and your ready to go.
Other than per the giant command above the project can also be compiled via the Makefile in the project. <br>
Just hit `make` to compile or `make clean` to delete delete the output directory and the current pdf file!


