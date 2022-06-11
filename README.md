# task_graph

TaskGraph is a command line tool that takes a list of task as a dependency graph,
and highlights which tasks are available based on completed work.

## Example

TaskGraph takes a list of tasks defined in a yaml file:

```yaml
Upload to Github:
  completed: true
Write documentation:
  completed: false
Explain how TaskGraph works:
  depends_on:
    - Write documentation
```

We can then run TaskGraph on that file:

```
./task_graph example.yaml
```

<!-- Add picture showing output -->
