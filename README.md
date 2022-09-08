# PHP CodeSniffer GitHub Action

This action is deprecated in favor of much faster and better-supported solution, please update your Actions accordingly:

```
- name: Setup PHP
  uses: shivammathur/setup-php@v2
  with:
    php-version: '8.1'
    tools: cs2pr, phpcs

- name: Run phpcs
  run: phpcs -q --report=checkstyle src | cs2pr
```

Details [here](https://github.com/marketplace/actions/setup-php-action#tools-with-checkstyle-support).

<img src="https://leonardo.osnova.io/491e4ce9-72d9-9417-29f7-9934ce7ec8ad/" alt="How Annotations Works" title="How Annotations Works" width="560" height="432" />

F