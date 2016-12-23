{
  "steps": [
    {
      "sbg:x": 611,
      "inputs": [
        {
          "source": [
            "#input_archive_file"
          ],
          "id": "#SBG_Unpack_FASTQs.input_archive_file"
        }
      ],
      "id": "#SBG_Unpack_FASTQs",
      "outputs": [
        {
          "id": "#SBG_Unpack_FASTQs.output_fastq_files"
        }
      ],
      "sbg:y": 564,
      "run": {
        "sbg:categories": [
          "Other"
        ],
        "id": "admin/sbg-public-data/sbg-unpack-fastqs-1-0/4",
        "sbg:revision": 4,
        "sbg:toolkitVersion": "v1.0",
        "sbg:sbgMaintained": false,
        "temporaryFailCodes": [],
        "appUrl": "/public/apps/#tool/admin/sbg-public-data/sbg-unpack-fastqs-1-0/4",
        "outputs": [
          {
            "description": "Output FASTQ files.",
            "label": "Output FASTQ files",
            "outputBinding": {
              "sbg:metadata": {
                "paired_end": {
                  "script": "{\n  filepath = $self.path\n  filename = filepath.split(\"/\").pop();\n  if (filename.lastIndexOf(\".fastq\") !== 0)\n  \tp = filename[filename.lastIndexOf(\".fastq\") - 1 ]\n  if ((p == 1) || (p == 2))\n    return p\n  else\n    return \"\"\n}",
                  "class": "Expression",
                  "engine": "#cwl-js-engine"
                }
              },
              "glob": "decompressed_files/*.fastq",
              "sbg:inheritMetadataFrom": "#input_archive_file"
            },
            "sbg:fileTypes": "FASTQ",
            "type": [
              {
                "type": "array",
                "items": "File",
                "name": "output_fastq_files"
              }
            ],
            "id": "#output_fastq_files"
          }
        ],
        "sbg:createdBy": "markop",
        "sbg:cmdPreview": "/opt/sbg_unpack_fastqs.py --input_archive_file input_file.tar > out.txt",
        "y": 564,
        "sbg:project": "admin/sbg-public-data",
        "sbg:license": "Apache License 2.0",
        "sbg:job": {
          "inputs": {
            "input_archive_file": {
              "size": 0,
              "path": "input_file.tar",
              "class": "File",
              "secondaryFiles": []
            }
          },
          "allocatedResources": {
            "cpu": 1,
            "mem": 1000
          }
        },
        "stdout": "out.txt",
        "sbg:contributors": [
          "admin",
          "markop"
        ],
        "description": "**SBG Unpack FASTQs** performs the extraction of the input archive, containing FASTQ files. \nThis tool also sets the \"paired_end\" metadata field. It assumes that FASTQ file names are formatted in this manner:\nfirst pair reads FASTQ file        -  *1.fastq\nsecond pair reads FASTQ file  -  * 2.fastq. \nwhere * represents any string.\n**This tool is designed to be used for paired-end metadata with above mentioned name formatting only.**\nSupported formats are:\n1. TAR\n2. TAR.GZ (TGZ)\n3. TAR.BZ2 (TBZ2)\n4. GZ\n5. BZ2\n6. ZIP",
        "successCodes": [],
        "sbg:createdOn": 1447782696,
        "sbg:id": "admin/sbg-public-data/sbg-unpack-fastqs-1-0/4",
        "class": "CommandLineTool",
        "sbg:revisionsInfo": [
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 0,
            "sbg:modifiedBy": "markop",
            "sbg:modifiedOn": 1447782696
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 1,
            "sbg:modifiedBy": "markop",
            "sbg:modifiedOn": 1448463456
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 2,
            "sbg:modifiedBy": "markop",
            "sbg:modifiedOn": 1451493832
          },
          {
            "sbg:revisionNotes": "Changed description.",
            "sbg:revision": 3,
            "sbg:modifiedBy": "admin",
            "sbg:modifiedOn": 1471952990
          },
          {
            "sbg:revisionNotes": "Changed paired-end metadata for single end reads.",
            "sbg:revision": 4,
            "sbg:modifiedBy": "admin",
            "sbg:modifiedOn": 1471952990
          }
        ],
        "sbg:homepage": "https://igor.sbgenomics.com/",
        "arguments": [],
        "sbg:validationErrors": [],
        "x": 611,
        "requirements": [
          {
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine",
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ]
          }
        ],
        "sbg:revisionNotes": "Changed paired-end metadata for single end reads.",
        "inputs": [
          {
            "required": true,
            "label": "Input archive file",
            "id": "#input_archive_file",
            "sbg:fileTypes": "TAR, TAR.GZ, TGZ, TAR.BZ2, TBZ2,  GZ, BZ2, ZIP",
            "type": [
              "File"
            ],
            "description": "The input archive file, containing FASTQ files, to be unpacked.",
            "sbg:category": "",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--input_archive_file",
              "position": 0
            }
          }
        ],
        "label": "SBG Unpack FASTQs",
        "baseCommand": [
          "/opt/sbg_unpack_fastqs.py"
        ],
        "sbg:modifiedOn": 1471952990,
        "sbg:latestRevision": 4,
        "sbg:toolkit": "SBGTools",
        "sbg:modifiedBy": "admin",
        "hints": [
          {
            "class": "DockerRequirement",
            "dockerImageId": "df9e1c169beb",
            "dockerPull": "images.sbgenomics.com/markop/sbg-unpack-fastqs:1.0"
          },
          {
            "value": 1,
            "class": "sbg:CPURequirement"
          },
          {
            "value": 1000,
            "class": "sbg:MemRequirement"
          }
        ],
        "sbg:image_url": null,
        "sbg:toolAuthor": "Marko Petkovic, Seven Bridges Genomics",
        "stdin": ""
      },
      "scatter": "#SBG_Unpack_FASTQs.input_archive_file"
    },
    {
      "sbg:x": 904,
      "inputs": [
        {
          "source": [
            "#cutoff"
          ],
          "id": "#bt_count.cutoff"
        },
        {
          "source": [
            "#hashfile"
          ],
          "id": "#bt_count.hashfile"
        },
        {
          "source": [
            "#bf_size"
          ],
          "id": "#bt_count.bf_size"
        },
        {
          "source": [
            "#SBG_Unpack_FASTQs.output_fastq_files"
          ],
          "id": "#bt_count.fasta_in"
        }
      ],
      "id": "#bt_count",
      "outputs": [
        {
          "id": "#bt_count.bit_vector"
        },
        {
          "id": "#bt_count.bashScript"
        }
      ],
      "sbg:y": 451.6875,
      "run": {
        "stdout": "",
        "id": "https://cgc-api.sbgenomics.com/v2/apps/elehnert/sequence-bloom-tree-reference-apps/bt-count/26/raw/",
        "sbg:revision": 26,
        "sbg:sbgMaintained": false,
        "temporaryFailCodes": [],
        "outputs": [
          {
            "id": "#bit_vector",
            "type": [
              "null",
              "File"
            ],
            "outputBinding": {
              "glob": "*bf.bv",
              "sbg:inheritMetadataFrom": "#fasta_in"
            },
            "sbg:fileTypes": "BV"
          },
          {
            "type": [
              "null",
              "File"
            ],
            "outputBinding": {
              "glob": "*.sh"
            },
            "id": "#bashScript"
          }
        ],
        "sbg:createdBy": "elehnert",
        "sbg:cmdPreview": "bash runSBT_Count.sh",
        "sbg:project": "elehnert/sequence-bloom-tree-reference-apps",
        "sbg:job": {
          "inputs": {
            "fasta_in": [
              {
                "size": 0,
                "path": "/path/to/fasta_in-1.ext",
                "metadata": {
                  "sample_id": "test"
                },
                "class": "File",
                "secondaryFiles": []
              },
              {
                "size": 0,
                "path": "/path/to/fasta_in-2.ext",
                "metadata": {
                  "sample_id": "test"
                },
                "class": "File",
                "secondaryFiles": []
              }
            ],
            "cutoff": 4,
            "hashfile": {
              "size": 0,
              "path": "/path/to/hashfile.ext",
              "class": "File",
              "secondaryFiles": []
            },
            "bf_size": "10000"
          },
          "allocatedResources": {
            "cpu": 4,
            "mem": 1000
          }
        },
        "sbg:id": "elehnert/sequence-bloom-tree-reference-apps/bt-count/26",
        "description": "",
        "successCodes": [],
        "sbg:createdOn": 1471798566,
        "sbg:revisionsInfo": [
          {
            "sbg:revisionNotes": "Copy of elehnert/sequence-bloomtree-cesc/bt-count/2",
            "sbg:revision": 0,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1471798566
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 1,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1471798973
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 2,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1471798986
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 3,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1471891377
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 4,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472593170
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 5,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472593664
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 6,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472593802
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 7,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472595684
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 8,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472596318
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 9,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472596378
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 10,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472597035
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 11,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472603024
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 12,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472661597
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 13,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1472661619
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 14,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473380340
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 15,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473380360
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 16,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473381027
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 17,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473381457
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 18,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473381531
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 19,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473381576
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 20,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473382187
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 21,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473384204
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 22,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473391687
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 23,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473393564
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 24,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473779253
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 25,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473780173
          },
          {
            "sbg:revisionNotes": null,
            "sbg:revision": 26,
            "sbg:modifiedBy": "elehnert",
            "sbg:modifiedOn": 1473781214
          }
        ],
        "class": "CommandLineTool",
        "sbg:image_url": null,
        "sbg:validationErrors": [],
        "hints": [
          {
            "value": 1000,
            "class": "sbg:MemRequirement"
          },
          {
            "class": "DockerRequirement",
            "dockerImageId": "",
            "dockerPull": "cgc-images.sbgenomics.com/elehnert/sbt:0.3.5"
          },
          {
            "value": 4,
            "class": "sbg:CPURequirement"
          }
        ],
        "requirements": [
          {
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine",
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ]
          },
          {
            "class": "CreateFileRequirement",
            "fileDef": [
              {
                "fileContent": {
                  "script": "{\n filepath = $job.inputs.fasta_in[0].path\n filename = filepath.split(\"/\").pop();\n file_dot_sep = filename.split(\".\"); \n new_filename = filename.substr(0,filename.lastIndexOf(\".\")) + \".concatenated.bf.bv\"\n var list = [].concat($job.inputs.fasta_in)\n tmp = \"\"\n for (index = 0; index < list.length; ++index) {\n   tmp += \" \" + list[index].path\n }\n \n if ($job.inputs.cutoff) {\n  cutoff =  $job.inputs.cutoff}\n else {\n   cutoff = \"3\"}\n \n if ($job.inputs.bf_size) {\n  bf_size = $job.inputs.bf_size\n  }\n else {\n   bf_size = \"2000000000\"\n }\n  \n  \nreturn \"bt count --cutoff \" + cutoff + \" --threads \" + $job.allocatedResources.cpu + \" \" + $job.inputs.hashfile.path + \" \" + bf_size + \" <(cat\" + tmp + \")\" + \" \" + new_filename + \" && rm \" + tmp\n}",
                  "class": "Expression",
                  "engine": "#cwl-js-engine"
                },
                "filename": "runSBT_Count.sh"
              }
            ]
          }
        ],
        "sbg:modifiedOn": 1473781214,
        "inputs": [
          {
            "description": "The kmer count cutoff",
            "type": [
              "null",
              "int"
            ],
            "sbg:toolDefaultValue": "3",
            "id": "#cutoff",
            "label": "cutoff"
          },
          {
            "description": "The location of the hashfile written using the \"hashes\" function",
            "label": "hashfile",
            "id": "#hashfile",
            "sbg:fileTypes": "HH",
            "type": [
              "File"
            ],
            "sbg:toolDefaultValue": "1"
          },
          {
            "description": "bf_size determines the size of bloom filters used and should be set to an approximate count of the number of unique k-mers in your dataset.",
            "type": [
              "null",
              "string"
            ],
            "sbg:toolDefaultValue": "2000000000",
            "id": "#bf_size",
            "label": "bf_size"
          },
          {
            "description": "Input fasta/fastq being counted",
            "type": [
              {
                "type": "array",
                "items": "File",
                "name": "fasta_in"
              }
            ],
            "id": "#fasta_in",
            "sbg:fileTypes": "FASTA, FASTQ",
            "label": "fasta_in",
            "sbg:stageInput": null
          }
        ],
        "label": "bt count",
        "baseCommand": [
          "bash",
          "runSBT_Count.sh"
        ],
        "sbg:latestRevision": 26,
        "sbg:modifiedBy": "elehnert",
        "sbg:contributors": [
          "elehnert"
        ],
        "arguments": [],
        "stdin": ""
      },
      "scatter": "#bt_count.fasta_in"
    }
  ],
  "id": "https://cgc-api.sbgenomics.com/v2/apps/elehnert/sequence-bloom-tree-reference-apps/TCGA-Archive-SBT-count/35/raw/",
  "sbg:sbgMaintained": false,
  "outputs": [
    {
      "sbg:x": 1544,
      "label": "bit_vector",
      "required": false,
      "source": [
        "#bt_count.bit_vector"
      ],
      "id": "#bit_vector",
      "type": [
        "null",
        "File"
      ],
      "sbg:y": 432,
      "sbg:includeInPorts": true
    }
  ],
  "sbg:createdBy": "elehnert",
  "sbg:project": "elehnert/sequence-bloom-tree-reference-apps",
  "sbg:id": "elehnert/sequence-bloom-tree-reference-apps/TCGA-Archive-SBT-count/35",
  "sbg:canvas_zoom": 1,
  "description": "",
  "sbg:revision": 35,
  "sbg:createdOn": 1471798646,
  "sbg:contributors": [
    "elehnert"
  ],
  "class": "Workflow",
  "sbg:validationErrors": [],
  "requirements": [],
  "sbg:modifiedOn": 1473781241,
  "inputs": [
    {
      "sbg:x": 236,
      "type": [
        "File"
      ],
      "sbg:y": 307,
      "id": "#hashfile",
      "label": "hashfile"
    },
    {
      "sbg:x": 262,
      "label": "input_archive_file",
      "id": "#input_archive_file",
      "sbg:fileTypes": "TAR, TAR.GZ, TGZ, TAR.BZ2, TBZ2,  GZ, BZ2, ZIP",
      "type": [
        {
          "type": "array",
          "items": "File"
        }
      ],
      "sbg:y": 537,
      "sbg:includeInPorts": true
    },
    {
      "description": "The kmer count cutoff",
      "type": [
        "null",
        "int"
      ],
      "required": false,
      "id": "#cutoff",
      "label": "cutoff",
      "sbg:includeInPorts": false,
      "sbg:toolDefaultValue": "3"
    },
    {
      "description": "bf_size determines the size of bloom filters used and should be set to an approximate count of the number of unique k-mers in your dataset.",
      "type": [
        "null",
        "string"
      ],
      "required": false,
      "id": "#bf_size",
      "label": "bf_size",
      "sbg:includeInPorts": false,
      "sbg:toolDefaultValue": "2000000000"
    }
  ],
  "label": "SBT count - TCGA Archive",
  "hints": [
    {
      "value": "c4.2xlarge",
      "class": "sbg:AWSInstanceType"
    },
    {
      "value": "15",
      "class": "sbg:maxNumberOfParallelInstances"
    },
    {
      "value": "true",
      "class": "sbg:UseSbgFS"
    }
  ],
  "sbg:canvas_y": -191,
  "sbg:latestRevision": 35,
  "sbg:modifiedBy": "elehnert",
  "sbg:revisionsInfo": [
    {
      "sbg:revisionNotes": "Copy of elehnert/sequence-bloomtree-cesc/test/4",
      "sbg:revision": 0,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471798646
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 1,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471798938
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 2,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471799035
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 3,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471799273
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 4,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471799384
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 5,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471891459
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 6,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472593222
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 7,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472593516
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 8,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472593848
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 9,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472597451
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 10,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472599245
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 11,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472603742
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 12,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472634613
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 13,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472656316
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 14,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472660975
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 15,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472661649
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 16,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472675393
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 17,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473086478
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 18,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473383974
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 19,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473384232
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 20,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473384329
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 21,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473384378
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 22,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473389950
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 23,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473390853
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 24,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473390869
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 25,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473391710
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 26,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473393524
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 27,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473393747
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 28,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473393936
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 29,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473778628
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 30,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473779111
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 31,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473780031
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 32,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473780075
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 33,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473780209
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 34,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473780347
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 35,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473781241
    }
  ],
  "sbg:image_url": "https://cgc-brood.sbgenomics.com/static/elehnert/sequence-bloom-tree-reference-apps/TCGA-Archive-SBT-count/35.png",
  "sbg:canvas_x": -123
}
