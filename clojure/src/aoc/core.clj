(ns aoc.core
  (:require [clojure.java.io :as io]
            [clojure.string :as s]))

(defn get-input
  ([f]
   (get-input f #"\n"))
  ([f delim]
   (-> (io/resource f)
       slurp
       (s/split delim))))
