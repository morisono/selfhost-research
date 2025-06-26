input="table.md"

pandoc -f markdown -t html $input \
  | pup 'table tr json{}' \
  | jq -r '
      .[]
      | [.children[]?.text]
      | @csv' > TB_(date +%Y-%m-%d).csv