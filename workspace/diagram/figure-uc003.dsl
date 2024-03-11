 workspace {
    model { 
        bigdata = softwareSystem "Software System" {
            gov = container "도로 관제 시스템" "도로 관리 기관" {
                tags "stakeholder"
            }
            dataOwner = container "데이터 소유자" "센서퓨전" {
                tags "stakeholder"
            }
            sensor = container "카메라" "도로 주행 자동차 카메라" {
            }
            dataset = container "Data Fabric 데이터 세트" "데이터 세트" {
                tags "dataset"
                sensor -> this "업데이트"
            }
            createPipeline = container "데이터 스트리밍 파이프라인 생성" {
                tags "usecase"
                gov -> this
            }
            streamingPipeline = container "데이터 스트리밍 파이프라인" {
                tags "usecase" "streaming"
                createPipeline -> this
            }
            registDataset = container "데이터 세트 등록" {
                tags "usecase"
                dataOwner -> this
            }

            registDataset -> dataset
            streamingPipeline -> dataset
            streamingPipeline -> gov
        }

        figure = deploymentEnvironment "figure" {
            deploymentNode "도로 관리 기관" {
                containerInstance gov
            }
            deploymentNode "자율주행 빅데이터 플랫폼" {
                containerInstance streamingPipeline
                containerInstance createPipeline
            }
            deploymentNode "분산 데이터 세트" {
                containerInstance dataset
                containerInstance sensor
            }
        }
    }
    views { 
        deployment * figure { 
            include *
            autolayout
        } 
        styles {
            element "stakeholder" {
                background #08427b
                color #ffffff
                fontSize 22
                shape Person
            }
            element "usecase" {
                background #ffffff
                color #000000
                fontSize 28
                shape Circle
            }
            element "dataset" {
                shape Folder
            }
            element "streaming" {
                shape Pipe
            }
        }
        theme default 
    }   
}