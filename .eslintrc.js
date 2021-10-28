module.exports = {
  root: true,
  parser: '@typescript-eslint/parser',
  plugins: [
    '@typescript-eslint',
  ],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'standard-with-typescript',
  ],
  parserOptions: {
    project: './tsconfig.json'
  },
  "rules": {
    "@typescript-eslint/space-before-function-paren": "off",
    "@typescript-eslint/restrict-template-expressions": "off",
    "no-multiple-empty-lines": "off"
  }
};
