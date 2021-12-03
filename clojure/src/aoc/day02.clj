(ns aoc.day02
  (:require [aoc.core :as core]
            [clojure.string :as s]))

(defn normalize [s]
  (let [[dir v] (s/split s #" ")]
    [dir (Integer/parseInt v)]))

(defn calc-movement-p1 [[hor ver] [dir v]]
  (case dir
    "forward" [(+ hor v) ver]
    "up"      [hor (- ver v)]
    "down"    [hor (+ ver v)]))

(defn calc-movement-p2 [[hor ver aim] [dir v]]
  (case dir
    "forward" [(+ hor v) (+ ver (* v aim)) aim]
    "up"      [hor ver (- aim v)]
    "down"    [hor ver (+ aim v)]))

(defn part1 []
  (->> (core/get-input "day02")
       (map normalize)
       (reduce calc-movement-p1 [0 0])
       (reduce *)))

(defn part2 []
  (->> (core/get-input "day02")
       (map normalize)
       (reduce calc-movement-p2 [0 0 0])
       (take 2)
       (reduce *)))
