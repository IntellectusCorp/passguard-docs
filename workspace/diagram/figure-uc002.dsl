 workspace {
    model { 
        bigdata = softwareSystem "Software System" {
            dev = container "AI엔지니어" "자율주행AI개발사" {
                tags "stakeholder"
            }
            registModel = container "자율주행 AI 모델 정보 입력" {
                tags "usecase"
                dev -> this "입력"
            }
            processNL = container "자연어 처리 및 분석" {
                tags "usecase"
                registModel -> this "프로세싱"
            }
            registSampleData = container "자율주행 AI 학습데이터 샘플 입력" {
                tags "usecase"
                dev -> this "업로드"
            }
            processSample = container "샘플 데이터 분석" {
                tags "usecase"
                registSampleData -> this "프로세싱"
            }
            curateData = container "학습용 데이터 추천" {
                tags "usecase"
                processNL -> this "프로세싱"
                processSample -> this "프로세싱"
            }
        }

        figure = deploymentEnvironment "figure" {
            deploymentNode "자율주행 개발사" {
                containerInstance dev
            }
            deploymentNode "자율주행 빅데이터 플랫폼" {
                containerInstance registModel
                containerInstance registSampleData
                containerInstance processNL
                containerInstance processSample
                containerInstance curateData
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
        }
        theme default 
    }   
}