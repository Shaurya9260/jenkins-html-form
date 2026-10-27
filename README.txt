Jenkins HTML Form Practical (Windows)

Files:
- index.html: the HTML contact form
- Jenkinsfile: Jenkins Pipeline definition
- test.ps1: automated checks for the form and its required fields

Quick workflow:
1. Create a GitHub repository.
2. Upload all three files (index.html, Jenkinsfile, test.ps1) to the repository root.
3. In Jenkins, choose New Item -> Pipeline.
4. Under Pipeline, choose "Pipeline script from SCM".
5. SCM: Git; Repository URL: your GitHub repository URL; Branch: */main; Script Path: Jenkinsfile.
6. Save, then click Build Now.
7. Open the build -> Console Output. Look for PASS lines and "All HTML form tests passed."

Important:
- This Jenkinsfile uses Windows' bat step and PowerShell, matching a Windows Jenkins setup.
- The Jenkins agent must run on Windows and have PowerShell available.
- If your GitHub repository uses "master" rather than "main", change the branch setting accordingly.
