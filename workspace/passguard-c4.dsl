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

            identityService = softwaresystem "Identity Service" {
                description "Identity Solution Provider."
                
                loginWebApplication = container "Login Web Application" {
                    description "Login Web Application to athenticate"
                    technology "NextJS"
                    tags "Web Browser"
                }
                
                authenticationAPIProvider = container "Authentication API Provider" {
                    description "API server"
                    technology "NestJS"
                    
                    idTokenService = component "Identify Token Service" {
                        description "manage authentication token"
                        technology "NextJS Service"
                    }
                }
                
                database = container "Database" {
                    description "Stores identification related data to athenticate"    
                    technology "MySQL"
                    tags "Database"
                }
            }
        }
        
        # relationships between people and software systems
        externelDeveloper -> identityService "use authtication capability"

        # relationships to/from containers
        3rdPartyApplication -> loginWebApplication
        loginWebApplication -> authenticationAPIProvider

        # relationships to/from components
        idTokenService -> database

    }

    views {
        systemlandscape "SystemLandscape" {
            include *
            exclude 3rdPartyApplication
            autoLayout
        }

        systemcontext identityService "SystemContext" {
            include *
            exclude externelDeveloper
            animation {
                identityService
                
            }
            autoLayout
            description "The system context diagram for the Internet Banking System."
            properties {
                structurizr.groups false
            }
        }

        container identityService "Containers" {
            include *
            autoLayout
            description "The container diagram for the Internet Banking System."
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