# Pavios-Clean

This is the "clean" task for use with [Pavios](https://npmjs.org/package/pavios).

## Installation

```
npm install --save-dev pavios pavios-clean
```

## Use

See the [config guide](https://github.com/rioc0719/pavios#config-guide) for information on how to use this package.

### Configuration

This task accepts one configuration option:

- `directory: [String]`: An array of strings (fileglobs) that will be passed to [del](https://npmjs.org/package/del) and deleted.
