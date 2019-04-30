require 'net/http'
require 'pry'

url = URI('http://localhost:3001/votes')

all_candidates = {
  t1_candidates: ["Kennedy Stewart", 
                  "Ken Sim", 
                  "Shuana Sylvester",
                  "Hector Bremner", 
                  "David Chen", 
                  "Sean Cassidy",
                  "Connie Fogal",
                  "Mike Hansen"],

  t2_candidates: ["Jason Lamarche",
                  "Rollergirl",
                  "Ping Chan", 
                  "John Yano",
                  "Tim Ly",
                  "Satie Shottha", 
                  "Maynard Aubichon"]
}

loop do 
  sector = ['t1', 't2'].sample

  candidates = all_candidates["#{sector}_candidates".to_sym]
  vote_count = candidates.each_with_object([]) do |_, arr|
    arr << rand(0..1000)
  end

  Net::HTTP.post_form(url, {
    sector: sector,
    "name[]": candidates,
    "vote_count[]": vote_count
  })

  sleep 0.5 
end

