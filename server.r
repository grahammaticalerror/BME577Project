server <- function(input, output, session) {
    
    #Hides tabs before submission button is hit
    hideTab( inputId = "MainTab", target = "Patient Results")
    
    #Hides varSelectInput submission button before first submit button is pressed
    hide("submit_variables")
    
    #Hide varselect dropdowns for all variables
    hide("AllergyVariables")
    hide("CareplanVariables")
   # hide("ConditionVariables")
    hide("DeviceVariables")
    hide("ImagingVariables")
    #hide("MedicationVariables")
    #hide("ProcedureVariables")
    hide("PayerVariables")
    hide("PatientSex")
    hide("PatientRaceEthnicity")
    
    #Triggers the multiselect menu reveal after hitting PrettyToggle 'variable category' submit button
    observeEvent(input$submit_categories, {
        
        
        if (input$AllergyCategory == TRUE) 
            show("AllergyVariables", anim = TRUE, animType = "fade", time = 0.5)
        else hide("AllergyVariables")
        
        if (input$CareplanCategory == TRUE) 
            show("CareplanVariables", anim = TRUE, animType = "fade", time = 0.5)
        else hide("CareplanVariables")
        
 #       if (input$ConditionCategory == TRUE) 
  #          show("ConditionVariables", anim = TRUE, animType = "fade", time = 0.5)
   #     else hide("ConditionVariables")
        
        if (input$DeviceCategory == TRUE) 
            show("DeviceVariables", anim = TRUE, animType = "fade", time = 0.5)
        else hide("DeviceVariables")
        
        if (input$ImagingCategory == TRUE) 
            show("ImagingVariables", anim = TRUE, animType = "fade", time = 0.5)
        else hide("ImagingVariables")
        
  #      if (input$MedicationCategory == TRUE) 
   #         show("MedicationVariables", anim = TRUE, animType = "fade", time = 0.5)
    #    else hide("MedicationVariables")
        
 #       if (input$ProcedureCategory == TRUE) 
  #          show("ProcedureVariables", anim = TRUE, animType = "fade", time = 0.5)
   #     else hide("ProcedureVariables")
        
        if (input$PayerCategory == TRUE)
            show("PayerVariables", anim = TRUE, animType = "fade", time = 0.5)
        else hide("PayerVariables")
        
        if (input$SexCategory == TRUE)
            show("PatientSex", anim = TRUE, animType = "fade", time = 0.5)
        else hide("PatientSex")
        
        if (input$RaceEthnicityCategory == TRUE)
            show("PatientRaceEthnicity", anim = TRUE, animType = "fade", time = 0.5)
        else hide("PatientRaceEthnicity")
        
        CategorySelectOutput <- as.logical(list(input$AllergyCategory, input$CareplanCategory, input$ConditionCategory, 
                                                input$DeviceCategory, input$ImagingCategory, input$MedicationCategory, input$ProcedureCategory,
                                                input$PayerCategory, input$SexCategory, input$RaceEthnicityCategory))
        
        
        if (any(CategorySelectOutput) == TRUE )
            show("submit_variables", anim = TRUE, animType = "fade", time = 0.5)
        else { hide("submit_variables") 
            shinyalert("Uhhh... excuse me??", text = "Please select at least one category", type = "error", closeOnEsc = FALSE, closeOnClickOutside = TRUE, showConfirmButton = FALSE, timer = 0, animation = TRUE, size = "m", immediate = TRUE)
        }
        
    }
    )
    
    # Event observation following submission of selected variables  
    observeEvent(input$submit_variables,
                 
                 showTab(inputId = "MainTab", target = "Patient Results", select = TRUE) 
                 
                 # FilteredPatients <- data.frame(Patients[2])
                 
                 
                 
                 
    )
    
    #Table output
    # output$FilteredPatients <- renderDataTable(PatientDataTable(),
    #                                           options = list,
    #                                          searchDelay = 500,
    #                                         env)
    
    #Reactive function for creating patient table               
    
    #observeEvent(input$submit_variables,              
    #            PatientDataTable <- reactive({ 
    #             
    #            data.table::as.data.table( 
    #             select(allergies_by_variable_wider[,2:16], input$AllergyVariables) %>%
    #              select(careplans_wider , input$CareplanVariables) %>%
    #             select(conditions_wider , input$ConditionVariables) %>%
    #            select(devices_wider , input$DeviceVariables) %>%
    #           select(imagingstudies_wider , input$ImagingVariables) %>%
    #          select(medications_wider , input$MedicationVariables) %>%
    #         select(procedures_wider , input$ProcedureVariables) %>%
    #        select(Payers_wider , input$PayerVariables) %>%
    #       select(Patients_wider_sex[8:9] , input$PatientSex) %>%
    #      select(Patients_wider_ethnicity[7:16] , input$PatientRaceEthnicity) 
    # )
    #})
    #)
    
    
    
    
    
    
}
