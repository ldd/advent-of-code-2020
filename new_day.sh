day=$1
year=2020
new_day_path=lib/day${day}
input_file=input/day${day}.txt
output_file=${new_day_path}/aoc_2020.day${day}.ex

# if necessary, make a new directory for the new day
# copy the template to start working on parts 1 & 2
mkdir -p ${new_day_path}/
cp ./template.ex ${output_file}

perl -pi.bak -e "s|Day0|Day${day}|g" ${output_file}
rm ${output_file}.bak

# download the input if it doesn't exist yet
if [ ! -f ${input_file} ]; then
  source .env
  curl "https://adventofcode.com/${year}/day/${day}/input" -H "cookie: session=${ADVENT_SESSION}" -o ${input_file}
fi