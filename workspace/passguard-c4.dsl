/*
 * This is a combined version of the following workspaces, with automatic layout enabled:
 *
 * - "Big Bank plc - System Landscape" (https://structurizr.com/share/28201/)
 * - "Big Bank plc - Internet Banking System" (https://structurizr.com/share/36141/)
*/
workspace "PassGuard"  {
    description "This is to describe the project called passguard, which is to provide common technical capabilities to the developer." 
    
    !docs docs

    model {
    
        group "WebService" {
             webServiceDeveloper = person "WebServiceDeveloper" {
                description "웹 서비스 개발자"
            }
            
            webService = softwaresystem "Web Service" {
                description "인증 시스템이 필요한 웹 서비스"
            }
        }
    
        group "Users" {
            webServiceUser = person "WebServiceUser" {
                description "웹 서비스의 사용자"
            }
        }
        
        group "PassGuard" {
            passGuardIdentity = softwaresystem "PassGuard Identity" {
                description "PassGuard 인증 시스템"
                
                frontend = container "PassGuard Identity Web" {
                    description "Authenticator(Client Device)"
                    tags "Web Browser"
                }
                
                group "PassGuard Backend" {
                    IdentityModule = container "Identity Module" {
                        IdentityUsecase = component "Identity User Usecase" {
                            description "PassGuard Identity Solution Usecase"
                        }
                    }
                    
                    AuthModule = container "Auth Module" {
                        description "Internal Credential System"
                        AuthService = component "Auth Service" {
                            description "코드 발급기, 토큰 발급기"
                        }
                        CodeRepository = component "Code Respository" {
                        }
                    }
                    
                    ClientModule = container "Client Module" {
                        description "PassGuard Client System, like web service"
                        ClientService = component "Client Service" {
                            description "client 정보 조회 및 검증 서비스"
                        }
                        ClientRepository = component "Client Repository" {
                        }
                    }
                    
                    CredentialModule = container "Credential Module" {
                        description "External Authenticator Connector"
                        OauthService = component "Oauth Service"{
                            description "OAuth2.0 연동 서비스"
                        }
                        OauthRepository = component "Oauth Repository" {
                            description "OAuth2.0 인증 정보 저장소"
                        }
                        PassKeyService = component "Passkey Service" {
                            description "Passkey 연동 서비스"
                        }
                        PasskeyRepository = component "Passkey Repository"{
                            description "Passkey 인증 정보 저장소"
                        }
                    }
                    
                    SessionModule = container "Session Module" {
                        description "인증 세션 모듈"
                        SessionService = component "Session Service" {
                            description "세션 조회 및 변경 기능 제공"
                        }
                        SessionRepository = component "Session Repository" {}
                    }
                    
                    UserModule = container "User Module" {
                        description "PassGuard User System"
                        UserService = component "User Service" {
                            description "사용자 정보 기본 서비스"
                        }
                        UserRepository = component "User Repository" {
                            
                        }
                    }
                    
                    db = container "PassGuard Database" {
                        technology "DynamoDB"
                    
                        CodeStorage = component "Code Storage" {}
                        UserStorage = component "User Storage" {}
                        ClientStorage = component "Client Storage" {}
                        OauthStorage = component "Oauth Storage" {}
                        PasskeyStorage = component "Passkey Storage" {}
                        SessionStorage = component "Session Storage" {}
                    }
                }
            }
        }
        # software level dependencies
        webServiceUser -> passGuardIdentity
        webService -> passGuardIdentity
        
        # container level dependencies
        frontend -> IdentityModule
        
        # component level dependencies
        IdentityUsecase -> AuthService
        IdentityUsecase -> ClientService
        IdentityUsecase -> UserService
        IdentityUsecase -> SessionService
        IdentityUsecase -> OauthService
        IdentityUsecase -> PasskeyService
        
        AuthService -> CodeRepository
        CodeRepository -> CodeStorage
        
        ClientService -> ClientRepository
        ClientRepository -> ClientStorage
        
        UserService -> UserRepository
        UserRepository -> UserStorage
        
        OauthService -> OauthRepository
        OauthRepository -> OauthStorage
        
        PasskeyService -> PasskeyRepository
        PasskeyRepository -> PasskeyStorage

        SessionService -> SessionRepository
        SessionRepository -> SessionStorage
    }
        

    views {
        properties {
                structurizr.groups true
                "c4plantuml.elementProperties" "true"
            }

        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }
        
        container passGuardIdentity "ContainerView" {
            include *
            autolayout
        }
        
        component CredentialModule "ComponentView" {
            include *
            autolayout
        }


        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Customer" {
                background #08427b
            }
            element "Bank Staff" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
    }
}