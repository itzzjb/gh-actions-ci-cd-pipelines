# Creates a file to capture standard out
# Removes the file if it exists
rm -rf npm-install-output.txt
# Creates a blank file
touch npm-install-output.txt

# Run NPM install (Mentions vulnerabilities at the end). Output goes into file.
npm install >> npm-install-output.txt

# Catch all vulnerabilities
# search_term="found [0-9]{1,6} vulnerabilities ([0-9]{1,6} low, [0-9]{1,6} moderate, [0-9]{1,6} high)"

# Only high vulnerabilities
search_term=", [0-9]{1,6} high)"

if grep -REo "$only_high_vulnerabilities" npm-install-output.txt
then
  if ! grep -o "found 0 vulnerabilities" npm-install-output.txt
  then
    echo "Yes, security vulnerabilities found."
    exit 1
  fi
fi

echo "No, security vulnerabilities found."
