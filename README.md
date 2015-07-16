# Demographics parser

Parser for the Demographics XML format.

## Usage

    Demog.parse(file) do |record|
      ...
    end

Due to the size of demog files that can count Gbs of data, we don't do
in-memory parsing, but streaming records. Each record contains:

* voter\_id (string)
* reg\_date (YYYY-mm-dd)
* reg\_status (Active, Inactive, Cancelled)
* gender (Male, Female, Unknown)
* year\_of\_birth (YYYY)
* zip
* race (White, Black, Asian, Other)
* political\_party\_name (optional)
* overseas (boolean)
* military (boolean)
* disabled (boolean)
* protected (boolean)
* absentee\_ongoing (boolean)
* absentee\_in\_this\_election (boolean)
* precinct\_split\_id
* jurisdiction (string)
* locality
* congressional\_district (string)
