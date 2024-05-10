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
                description "web service developer"
            }
            
            webService = softwaresystem "Web Service" {
                description "web service requiring login system"
            }
        }
    
        group "Users" {
            webServiceUser = person "WebServiceUser" {
                description "web service user"
            }
        }
        
        group "PassGuard" {
            passGuardIdentity = softwaresystem "PassGuard Identity" {
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
                            description "verification_code, token issuer"
                        }
                        CodeRepository = component "Code Respository" {
                        }
                    }
                    
                    ClientModule = container "Client Module" {
                        description "PassGuard Client System, like web service"
                        ClientService = component "Client Service" {
                            description "client management"
                        }
                        ClientRepository = component "Client Repository" {
                        }
                    }
                    
                    CredentialModule = container "Credential Module" {
                        description "External Authenticator Connector"
                        OauthService = component "Oauth Service"{
                            description "OAuth2.0 connector"
                        }
                        OauthRepository = component "Oauth Repository" {
                        }
                        PassKeyService = component "Passkey Service" {
                            description "Passkey connector"
                        }
                        PasskeyRepository = component "Passkey Repository"{
                        }
                    }
                    
                    SessionModule = container "Session Module" {
                        SessionService = component "Session Service" {
                            description "session management"
                        }
                        SessionRepository = component "Session Repository" {}
                    }
                    
                    UserModule = container "User Module" {
                        description "PassGuard User System"
                        UserService = component "User Service" {
                            description "user management"
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
            autoLayout rl
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