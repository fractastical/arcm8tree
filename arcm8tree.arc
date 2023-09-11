(def hash-data-and-metadata (data metadata)
  (tostring data metadata)) ; Placeholder, replace with a real hash function if needed.

(def insert-into-octree (octree point data metadata)
  (let node (find-or-create-node-for-point octree point)
    (= (node 'data) data)
    (= (node 'metadata) metadata)
    (= (node 'hash) (hash-data-and-metadata data metadata))))

(def verify-data-and-metadata (node)
  (= (node 'hash) (hash-data-and-metadata (node 'data) (node 'metadata))))

(def compute-merkle-hash (node)
  (if (no (node 'children))
      (node 'hash)
      (let children-hashes (map compute-merkle-hash (node 'children))
        (hash-data-and-metadata (apply tostring children-hashes) (node 'hash)))))
