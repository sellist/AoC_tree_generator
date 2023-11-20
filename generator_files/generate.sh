#!/bin/bash

input_years() {
    echo "-----------------------------------"
    echo "Welcome to AoC file tree generator!"
    echo "Please make sure your template files are named 'solution_template' and 'testing_template' !"
    echo "Happy holidays!"
    echo "-----------------------------------"

    while true; do
        read -p "From which year would you like to generate files? (AoC started in 2015!): " start_year
        if [[ ! $start_year =~ ^[0-9]+$ || $start_year -lt 2015 ]]; then
            echo "Not a valid year."
        else
            echo "Accepted $start_year."
            break
        fi
    done

    while true; do
        read -p "Up to which year would you like to generate files? (It's currently $(date +%Y)!): " end_year
        if [[ ! $end_year =~ ^[0-9]+$ || $end_year -gt $(date +%Y) ]]; then
            echo "Please enter up to the current year."
        else
            echo "Accepted $end_year."
            break
        fi
    done

    read -p "Which file extension are your templates? No '.', just the name please :)" ext_choice

    DELIM="/"
    ext_choice=$ext_choice
    start=$start_year
    end=$end_year
}

create_structure() {
    main_dir=()
    common_dir=()

    for ((year = start; year <= end; year++)); do
        main_dir+=("advent_of_code_$year")
    done

    for ((day = 1; day <= 25; day++)); do
        common_dir+=("day_$(printf "%02d" $day)")
    done

    path=$0
    parent_directory=$(dirname $path)
    par_dir=$(dirname $parent_directory)

    for dir1 in "${main_dir[@]}"; do
        for dir2 in "${common_dir[@]}"; do
            day_dir="$par_dir$DELIM$dir1$DELIM$dir2"

            if ! test -d "$day_dir"; then
                mkdir -p "$day_dir"; 
                cp $par_dir$DELIM"generator_files"$DELIM"solution_template."$ext_choice $day_dir$DELIM"solution."$ext_choice
                cp $par_dir$DELIM"generator_files"$DELIM"testing_template."$ext_choice $day_dir$DELIM"tests."$ext_choice
                touch $day_dir$DELIM"input.txt"
            else
                echo "Passing over $dir1$DELIM$dir2 as the path is currently occupied."
            fi

        done
        echo "Created $dir1"
        echo "Placeholder readme! Please change me!" > $par_dir$DELIM$dir1$DELIM"readme.md"
    done
}

input_years

echo "Generating trees between $start and $end..."
sleep 1
create_structure
echo "Finished. happy coding!"
sleep 1