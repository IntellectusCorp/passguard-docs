 workspace {
    model { 
        bigdata = softwareSystem "Software System" {
            oem = container "DEV" "자율주행 개발사" {
                tags "stakeholder"
            }
            insurers = container "Insurers" "보험사" {
                tags "stakeholder"
            }
            goverment = container "Goverment" "교통 기관" {
                tags "stakeholder"
            }

            webapp = container "API Provider" "자율주행 빅데이터 API" { 
                oem -> this "교통사고 데이터 탐색"
                insurers -> this "교통사고 사례 검색"
                goverment -> this "모니터링 데이터 수집"
            } 
            ir = container "Information Retrieval" { 
                webapp -> this "입력값 NLP & 쿼리 생성 및 요청" 
            } 
            analyticsApp = container "분석 시스템" {
                oem -> this "분석 및 시각화"
            }
            analyticsApp2 = container "유사 사례 검색 시스템" {
                insurers -> this "분석"
            }
            analyticsApp3 = container "교통 관제" {
                goverment -> this "모니터링"
            }
            ai1 = container "사고 회피 AI 모델 강화" {
                oem -> this "기계학습"
            }
            ai2 = container "사고 예측 AI 모델 강화" {
                goverment -> this "기계학습"
            }
        }

        figure = deploymentEnvironment "figure" {
            deploymentNode "자율주행 개발사" {
                containerInstance oem
                containerInstance analyticsApp
                containerInstance ai1
            }
            deploymentNode "보험사" {
                containerInstance insurers
                containerInstance analyticsApp2
            }
            deploymentNode "교통 인프라 기관" {
                containerInstance goverment
                containerInstance analyticsApp3
                containerInstance ai2
            }
            deploymentNode "자율주행 빅데이터 플랫폼" {
                containerInstance webapp             
            }
        }
    }
    views { 
        deployment * figure { 
            include *
            autolayout lr
        } 
        styles {
        element "stakeholder" {
                background #08427b
                color #ffffff
                fontSize 22
                shape Person
            }
    }
        theme default 
    }   
}