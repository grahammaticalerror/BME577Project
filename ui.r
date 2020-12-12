library(shinyWidgets)
library(eeptools)
library(tidyverse)
#install.packages("shinyalert")
library(shinyalert)
library(shiny)# How we create the app.
library(shinycssloaders) # Adds spinner icon to loading outputs.
library(shinydashboard) # The layout used for the ui page.
library(leaflet) # Map making. Leaflet is more supported for shiny.
library(dplyr)  
library(shinyjs)
library(tidyr)

Allergies <- read.csv("allergies_by_variable_wider.csv")
Careplans <- read.csv("careplans_wider.csv")
#Conditions <- read.csv("DATA//conditions_wider.csv")
Devices <- read.csv("devices_wider.csv")
Imaging_Studies <- read.csv("imagingstudies_wider.csv")
Immunizations <- read.csv("Immune_wider.csv")
#Medications <- read.csv("DATA//medications_wider.csv")
Observations <- read.csv("merged_Observations.csv")
#Organizations <- read.csv("merged_Organizations.csv")
PatientSex <- read.csv("Patients_wider_sex.csv")
PatientEthnicity <- read.csv("Patients_wider_ethnicity.csv")
Payers <- read.csv("Payers_wider.csv")
#Procedures <- read.csv("DATA//procedures_wider.csv")
SmokingStatus <- read.csv("smokingstatus.csv")
BMI <- read.csv("bodymassindex.csv")



shinyUI(fluidPage(
    useShinyjs(),
    useShinyalert(),
    
    
    #####################  Navbar to display tab panels    ------------------------------------
    navbarPage("", id = "MainTab",
               
    ###################MaintabPanel  ---------------------------------------
    tabPanel("Variable Selection",
                        
                        
                        
                        
     #App title
     titlePanel(strong(style = "color:blue", "Diagnostix Patient Aggregator")), 
                        
                        
     #Modify sidebarlayout to change side/main panel positions/sizing
     sidebarLayout(position = "left",
                                      
     #enter code here to add things to side panel
                                      
     #sidebarPanel title
      sidebarPanel((""), fluid = TRUE,
                                                   
                                                   
                                                   
      ### For variable category submission -- Pretty toggles for each category + corresponding 
      ### dropdown checklist for specific variables
           #Toggle for Allergies
           prettyToggle(
                        inputId = "AllergyCategory",
                       label_on = "Allergies",
                        label_off = "Allergies",
                        icon_on = icon("ok-circle", lib = "glyphicon"),
                        icon_off = icon("remove-circle", lib = "glyphicon"),
                        shape = "round",
                        plain = TRUE,
                        value = FALSE),
                                                   #Toggle for Careplans
                                                   prettyToggle(
                                                       inputId = "CareplanCategory",
                                                       label_on = "Careplans",
                                                       label_off = "Careplans",
                                                       icon_on = icon("ok-circle", lib = "glyphicon"),
                                                       icon_off = icon("remove-circle", lib = "glyphicon"),
                                                       plain = TRUE,
                                                       value = FALSE),
                                                   #Toggle for Conditions
                                                  # prettyToggle(
                                                   #  inputId = "ConditionCategory",
                                                    #   label_on = "Conditions",
                                                     #  label_off = "Conditions",
                                                      # icon_on = icon("ok-circle", lib = "glyphicon"),
                                                       #icon_off = icon("remove-circle", lib = "glyphicon"),
                                                       #plain = TRUE,
                                                       #value = FALSE),
                                                   #Toggle for Devices
                                                   prettyToggle(
                                                       inputId = "DeviceCategory",
                                                       label_on = "Devices",
                                                       label_off = "Devices",
                                                       icon_on = icon("ok-circle", lib = "glyphicon"),
                                                       icon_off = icon("remove-circle", lib = "glyphicon"),
                                                       plain = TRUE,
                                                       value = FALSE),
                                                   #Toggle for Imaging Studies
                                                   prettyToggle(
                                                       inputId = "ImagingCategory",
                                                       label_on = "Imaging Studies",
                                                       label_off = "Imaging Studies",
                                                       icon_on = icon("ok-circle", lib = "glyphicon"),
                                                       icon_off = icon("remove-circle", lib = "glyphicon"),
                                                       plain = TRUE,
                                                       value = FALSE),
                                                   #Toggle for Medications
                                      #             prettyToggle(
                                       #                inputId = "MedicationCategory",
                                        #               label_on = "Medications",
                                         #              label_off = "Medications",
                                          #             icon_on = icon("ok-circle", lib = "glyphicon"),
                                           #            icon_off = icon("remove-circle", lib = "glyphicon"),
                                            #           plain = TRUE,
                                             #          value = FALSE),
                                                   #Toggle for Procedures
                                    #               prettyToggle(
                                     #                  inputId = "ProcedureCategory",
                                      #                 label_on = "Procedures",
                                       #                label_off = "Procedures",
                                        #               icon_on = icon("ok-circle", lib = "glyphicon"),
                                         #              icon_off = icon("remove-circle", lib = "glyphicon"),
                                          #             plain = TRUE,
                                           #            value = FALSE),
                                                   #Toggle for Insurance
                                                   prettyToggle(
                                                       inputId = "PayerCategory",
                                                       label_on = "Insurance",
                                                       label_off = "Insurance",
                                                       icon_on = icon("ok-circle", lib = "glyphicon"),
                                                       icon_off = icon("remove-circle", lib = "glyphicon"),
                                                       plain = TRUE,
                                                       value = FALSE),
                                                   #Toggle for Sex
                                                   prettyToggle(
                                                       inputId = "SexCategory",
                                                       label_on = "Sex",
                                                       label_off = "Sex",
                                                       icon_on = icon("ok-circle", lib = "glyphicon"),
                                                       icon_off = icon("remove-circle", lib = "glyphicon"),
                                                       plain = TRUE,
                                                       value = FALSE),
                                                   #Toggle for Race/Ethnicity
                                                   prettyToggle(
                                                       inputId = "RaceEthnicityCategory",
                                                       label_on = "Race & Ethnicity",
                                                       label_off = "Race & Ethnicity",
                                                       icon_on = icon("ok-circle", lib = "glyphicon"),
                                                       icon_off = icon("remove-circle", lib = "glyphicon"),
                                                       plain = TRUE,
                                                       value = FALSE),
                                                   #Toggle for Age
                                                   prettyToggle(
                                                       inputId = "AgeCategory",
                                                       label_on = "Age",
                                                       label_off = "Age",
                                                       icon_on = icon("ok-circle", lib = "glyphicon"),
                                                       icon_off = icon("remove-circle", lib = "glyphicon"),
                                                       plain = TRUE,
                                                       value = FALSE),
                                                   
                                                   
                                                   #actionbutton for Pretty Toggle choice submission  
                                                   actionButton("submit_categories", "Submit Categories", icon = NULL, width = NULL)
                                                   
                                                   
                                                   
                                      ),
                                      
                                      #enter code here to add things to main panel
                                      mainPanel(textOutput("Variable Categories"),
                                                
                                                
                                                
                                                #multi-variable selection for Allergies
                                                selectizeInput(inputId = "AllergyVariables", label = "Types of Allergies:", choices = Allergies[,2:16], multiple = TRUE),
                                                
                                                #multi-variable selection for Careplans
                                                selectizeInput(inputId = "CareplanVariables", label = "Types of Careplans:", choices = Careplans, multiple = TRUE),
                                                
                                                #multi-variable selection for Conditions
                                       #         selectizeInput(inputId = "ConditionVariables", label = "Types of Conditions:", choices = Conditions, multiple = TRUE),
                                                
                                                #multi-variable selection for Devices
                                                selectizeInput(inputId = "DeviceVariables", label = "Types of Devices:", choices = Devices, multiple = TRUE),
                                                
                                                #multi-variable selection for Imaging Studies
                                                selectizeInput(inputId = "ImagingVariables", label = "Imaging Studies:", choices = Imaging_Studies, multiple = TRUE),
                                                
                                                #multi-variable selection for Medications
                                       #         selectizeInput(inputId = "MedicationVariables", label = "Medications:", choices = Medications, multiple = TRUE),
                                                
                                                #multi-variable selection for Procedures
                                       #        selectizeInput(inputId = "ProcedureVariables", label = "Procedures:", choices = Procedures, multiple = TRUE),
                                                
                                                #multi-variable selection for Payers
                                                selectizeInput(inputId = "PayerVariables", label = "Payers:", choices = Payers, multiple = TRUE),
                                                
                                                #multi-variable selection for Patient Sex
                                                selectizeInput(inputId = "PatientSex", label = "Sex:", choices = PatientSex[8:9], multiple = TRUE), 
                                                
                                                #mult-variable selection for Patient Race/Ethnicity
                                                selectizeInput(inputId = "PatientRaceEthnicity", label = "Race & Ethnicity:", choices = PatientEthnicity[7:16], multiple = TRUE), 
                                                
                                                #actionbutton for varSelectInput choice submission + reveal of second 'output' tab
                                                actionButton("submit_variables", "Submit Variables", icon  = NULL, width = NULL)
                                      )
                        )
                        
                        
               ),
               
               ##################### tabsetPanel for data display       ---------------
               tabPanel("Patient Results", "INSERT SCREENING RESULTS FOR CHECKBOX IN THIS FIELD"
                        
                        # dataTableOutput('FilteredPatients')
                        
               )
    )
)
)
