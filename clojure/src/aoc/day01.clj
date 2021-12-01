(ns aoc.day01
  (:require [aoc.core :as core]))

(defn part1 []
  (->> (core/get-input "day01")
       (map #(Integer/parseInt %))
       (partition 2 1)
       (filter (partial apply <))
       (count)))

(defn part2 []
  (->> (core/get-input "day01") 
       (map #(Integer/parseInt %))
       (partition 3 1)
       (map (partial reduce +))
       (partition 2 1)
       (filter (partial apply <))
       (count)))
