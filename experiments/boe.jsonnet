{
    "dataset_reader": {
      "type": "bbc",
      "token_indexers": {
          "tokens": {
              "type": "single_id"
          }
      }
    },
    "train_data_path": "data/bbc-train.csv",
    "validation_data_path": "data/bbc-validate.csv",
    "model": {
      "type": "bbc",
      "text_field_embedder": {
        "token_embedders": {
          "tokens": {
            "type": "embedding",
            "embedding_dim": 100
          }
        }
      },
      "encoder": {
        "type": "bag_of_embeddings",
        "embedding_dim": 100,
        "averaged": true
      }
    },
    "iterator": {
      "type": "bucket",
      "sorting_keys": [["text", "num_tokens"]],
      "batch_size": 10
    },
    "trainer": {
      "num_epochs": 100,
      "patience": 10,
      "cuda_device": -1,
      "grad_clipping": 5.0,
      "validation_metric": "+acc1",
      "optimizer": {
        "type": "adagrad"
      }
    }
  }
