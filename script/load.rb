require "sequel"
require "csv"

password = ENV["DB_PWD"]
DB = Sequel.connect "sqlite://db/development.sqlite3"

courses = CSV.read "db/data.csv", col_sep: "|"

courses.each do |course|
  DB[:projects].insert(
    name: course[0],
    ends_at: course[2],
    created_at: Time.now,
    updated_at: Time.now
  )
  puts "Created #{course[0]}"
end

