# Contributing

First off, thanks for taking the time to contribute. You're amazing! 🎉 😘 ✨

The following is a set of guidelines for contributing. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

- [Reporting Bugs](#reporting-bugs)
- [Suggesting Feature Requests or Enhancements](#suggesting-feature-requests-or-enhancements)
- [Pull Requests](#pull-requests)
  * [Check Code Style](#check-code-style)
  * [Test](#test)
  * [Commit](#commit)
  * [Yes! Pull request](#yes-pull-request)
- [Code of Conduct](#code-of-conduct)

## Reporting Bugs

Bugs are tracked as GitHub issues, tagged with a `bug` label. Search before you create an issue. When you create an issue, please provide the following information by filling in the template.

## Suggesting Feature Requests or Enhancements

Enhancements or feature requests are tracked as GitHub issues, tagged with an `enhancement` label. When you create an issue, please provide the following information by filling in the template.

## Pull Requests

### Check Code Style

Run `make lint` and make sure all the tests pass.

### Test

Run `make test` and verify all the tests pass.

### Commit

#### Commit Message Format

```
<Type>: Short description (fix #1234)

Longer description here if necessary

BREAKING CHANGE: only contain breaking change
```

#### Type
Must be one of the following:

* **feat**: A new feature
* **fix**: A bug fix
* **breaking**: A breaking change
* **docs**: Documentation only changes
* **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
* **refactor**: A code change that neither fixes a bug nor adds a feature
* **perf**: A code change that improves performance
* **test**: Adding missing or correcting existing tests
* **chore**: Changes to the build process or auxiliary tools and libraries such as documentation generation
* **revert**: Reverting changes

#### Subject

* use the imperative, __present__ tense: "change" not "changed" nor "changes"
* don't capitalize the first letter
* no dot (.) at the end
* reference GitHub issues at the end. If the commit doesn’t completely fix the issue, then use `(refs #1234)` instead of `(fixes #1234)`.

#### Body

* use the imperative, __present__ tense: "change" not "changed" nor "changes".
* the motivation for the change and contrast this with previous behavior.

### Yes! Pull request

Make your pull request, then describe your changes.

#### Title

Follow other PR title format on below.
```
    <Type>: Short Description (fix #111)
    <Type>: Short Description (fix #123, #111, #122)
    <Type>: Short Description (ref #111)
```
* use present tense: 'change' not 'changed' or 'changes'

#### Description

If it has related to issues, add links to the issues (like `#123`) in the description.

## Code of Conduct

See the [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).
