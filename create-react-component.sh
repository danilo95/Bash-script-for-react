# Check if a folder and component name is provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Uso: $0 <folder_name> <component_name>"
  exit 1
fi

# Variables
CARPETA=$1
COMPONENTE=$2

# src folder directory
SRC_DIR="src"

# Check if src exists
if [ ! -d "$SRC_DIR" ]; then
  echo "Error: The folder '$SRC_DIR' does not exist. Make sure you are in the main directory of the React project."
  exit 1
fi

# Create component folder
COMPONENTE_DIR="$SRC_DIR/$CARPETA"
mkdir -p "$COMPONENTE_DIR"

# Change to component folder directory
cd "$COMPONENTE_DIR"

# Create component files
echo "import React from 'react';" > $COMPONENTE.js
echo "" >> $COMPONENTE.js
echo "const $COMPONENTE = () => {" >> $COMPONENTE.js
echo "  return (" >> $COMPONENTE.js
echo "    <div>" >> $COMPONENTE.js
echo "      {/* Component content */}" >> $COMPONENTE.js
echo "    <h1>" >> $COMPONENTE.js
echo "     $COMPONENTE" >> $COMPONENTE.js
echo "    </h1>" >> $COMPONENTE.js
echo "    </div>" >> $COMPONENTE.js
echo "  );" >> $COMPONENTE.js
echo "};" >> $COMPONENTE.js
echo "" >> $COMPONENTE.js
echo "export default $COMPONENTE;" >> $COMPONENTE.js


# Create test file 
echo "import React from 'react';" > "${COMPONENTE}.test.js"
echo "import { render } from '@testing-library/react';" >> "${COMPONENTE}.test.js"
echo "import $COMPONENTE from './$COMPONENTE';" >> "${COMPONENTE}.test.js"
echo "" >> "${COMPONENTE}.test.js"
echo "test('renders $COMPONENTE component', () => {" >> "${COMPONENTE}.test.js"
echo "  const { getByText } = render(<$COMPONENTE />);" >> "${COMPONENTE}.test.js"
echo "  const linkElement = getByText(/$COMPONENTE/i);" >> "${COMPONENTE}.test.js"
echo "  expect(linkElement).toBeInTheDocument();" >> "${COMPONENTE}.test.js"
echo "});" >> "${COMPONENTE}.test.js"

# Inform the user everything was OK
echo "React component '$COMPONENTE' created in folder '$CARPETA'."