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
    
        group "Users" {
            
            externelDeveloper = person "Ext.Developer" {
               description "A user of this system, usually who are going to implement some software system. "
            }
        }
        
        group "3rd Party System" {
        
            3rdPartyApplication = softwaresystem "3rd-Party Application" {
                description "A system to use PassGuard as a identity provider"
            }
        }
        
        
        group "PassGuard" {

            identitySolution = softwaresystem "Identity Solution" {
                description "Identity Solution Provider."
                
                loginWebApplication = container "Login Web Application" {
                    description "Authenticator(Client Device)"
                    technology "NextJS"
                    tags "Web Browser"
                }

                passguardServerApplication = container "PassGuard Server Application" {
                    description "API server"
                    technology "NestJS"

                    group "Application Layer" {

                        loginService = component "Login Service" {
                            technology "NextJS Service"
                            properties {
                                "Layer" "Application"
                            }
                        }
                    }

                    group "Business Logic Layer"{
                        
                        authenticationService = component "Authentication Service" {
                            description "Business Logic: Authentication Service"
                            technology "NextJS Service"
                            properties {
                                "Layer" "Business Logic"
                            }
                        }

                        authorizationService = component "Authorization Service" {
                            description "Business Logic: Authorization Service"
                            technology "NextJS Service"
                            properties {
                                "Layer" "Business Logic"
                            }
                        }
                    }

                    group "Infrastructure Layer"{
                        
                        repository = component "General Repository" {
                            description "Business Logic: Authentication Service"
                            technology "prisma"
                            properties {
                                "Layer" "Infrastructure"
                            }
                        }
                    }
                }
                
                database = container "Database" {
                    description "Stores identification related data to athenticate"    
                    technology "MySQL"
                    tags "Database"

                    userDataModel = component "userDataModel" {
                        description "User Data Model"
                    } 

                    serviceDataModel = component "serviceDataModel" {
                        description "Service Data Model"
                    }

                    credentialDataModel = component "credentialDataModel" {
                        description "Credential Data Model"
                    }
                }
            }
        }
        
        # relationships between people and software systems
        externelDeveloper -> identitySolution "use authtication capability"

        # relationships to/from containers
        passguardServerApplication -> database
        3rdPartyApplication -> loginWebApplication
        loginWebApplication -> passguardServerApplication
        loginWebApplication -> loginWebApplication


        # relationships to/from components
        loginService -> authenticationService
        authenticationService -> repository

        loginWebApplication -> loginService

        repository -> database

    }

    views {
        properties {
                structurizr.groups true
                "c4plantuml.elementProperties" "true"
            }

        systemlandscape "SystemLandscape" {
            include *
            exclude 3rdPartyApplication
            autoLayout
        }

        systemcontext identitySolution "SystemContext" {
            include *
            exclude externelDeveloper
            animation {
                identitySolution
            }
            autoLayout
            description "The system context diagram for the Internet Banking System."
            properties {
                structurizr.groups false
            }
        }

        container identitySolution "Containers" {
            include *
            autoLayout
            description "The container diagram for the Internet Banking System."
        }

        component passguardServerApplication "ServerComponentVeiw" {
            description ""
            include *
            autoLayout
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