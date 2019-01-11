#!/bin/bash

protoc --plugin="/home/zhyc/share/pt_cpp/protobuf-d/build/protoc-gen-d" --d_out=../source -I./ zipkin.proto 