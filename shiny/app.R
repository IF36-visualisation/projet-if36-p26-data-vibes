library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)
library(scales)

# Chargement des données depuis le dossier data du projet
epl <- read_csv("../data/results.csv", show_col_types = FALSE) %>%
  mutate(
    TotalGoals = FTHG + FTAG,
    TotalShots = HS + AS,
    TotalCards = HY + AY + HR + AR
  )

saisons <- sort(unique(epl$Season))
equipes <- sort(unique(c(epl$HomeTeam, epl$AwayTeam)))

ui <- dashboardPage(
  dashboardHeader(title = "Premier League"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Buts par saison", tabName = "buts", icon = icon("chart-line")),
      menuItem("Équipes sanctionnées", tabName = "cartons", icon = icon("exclamation-triangle")),
      menuItem("Tirs et buts", tabName = "tirs", icon = icon("bullseye"))
    ),
    
    br(),
    
    selectInput(
      inputId = "saison",
      label = "Choisir une saison :",
      choices = c("Toutes les saisons", saisons),
      selected = "Toutes les saisons"
    ),
    
    selectInput(
      inputId = "equipe",
      label = "Choisir une équipe :",
      choices = c("Toutes les équipes", equipes),
      selected = "Toutes les équipes"
    ),
    
    sliderInput(
      inputId = "top_n",
      label = "Nombre d'équipes à afficher :",
      min = 5,
      max = 20,
      value = 10,
      step = 1
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "buts",
        fluidRow(
          box(
            width = 12,
            title = "Évolution du nombre moyen de buts par saison",
            status = "primary",
            solidHeader = TRUE,
            plotlyOutput("plot_buts", height = "450px")
          )
        )
      ),
      
      tabItem(
        tabName = "cartons",
        fluidRow(
          box(
            width = 12,
            title = "Équipes les plus sanctionnées",
            status = "warning",
            solidHeader = TRUE,
            plotlyOutput("plot_cartons", height = "500px")
          )
        )
      ),
      
      tabItem(
        tabName = "tirs",
        fluidRow(
          box(
            width = 12,
            title = "Relation entre tirs et buts",
            status = "success",
            solidHeader = TRUE,
            plotlyOutput("plot_tirs", height = "500px")
          )
        )
      )
    )
  )
)

server <- function(input, output, session) {
  
  data_filtre <- reactive({
    data <- epl
    
    if (input$saison != "Toutes les saisons") {
      data <- data %>% filter(Season == input$saison)
    }
    
    if (input$equipe != "Toutes les équipes") {
      data <- data %>%
        filter(HomeTeam == input$equipe | AwayTeam == input$equipe)
    }
    
    data
  })
  
  output$plot_buts <- renderPlotly({
    data_plot <- data_filtre() %>%
      group_by(Season) %>%
      summarise(
        Moyenne_buts = mean(TotalGoals, na.rm = TRUE),
        Nb_matchs = n(),
        .groups = "drop"
      )
    
    p <- ggplot(data_plot, aes(
      x = Season,
      y = Moyenne_buts,
      text = paste(
        "Saison :", Season,
        "<br>Moyenne de buts :", round(Moyenne_buts, 2),
        "<br>Nombre de matchs :", Nb_matchs
      )
    )) +
      geom_line(group = 1, linewidth = 1) +
      geom_point(size = 2) +
      scale_y_continuous(
        breaks = seq(0, 5, 0.5),
        limits = c(0, 5)
      ) +
      labs(
        title = "Évolution du nombre moyen de buts par saison",
        x = "Saison",
        y = "Nombre moyen de buts par match"
      ) +
      theme_minimal(base_size = 12) +
      theme(
        plot.title = element_text(face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.minor = element_blank()
      )
    
    ggplotly(p, tooltip = "text")
  })
  
  output$plot_cartons <- renderPlotly({
    data_equipes <- bind_rows(
      data_filtre() %>%
        transmute(
          Team = HomeTeam,
          Cards = HY + HR
        ),
      data_filtre() %>%
        transmute(
          Team = AwayTeam,
          Cards = AY + AR
        )
    ) %>%
      filter(!is.na(Team), !is.na(Cards)) %>%
      group_by(Team) %>%
      summarise(
        Matchs = n(),
        Cartons_moyens = mean(Cards, na.rm = TRUE),
        .groups = "drop"
      ) %>%
      filter(Matchs >= 5) %>%
      arrange(desc(Cartons_moyens)) %>%
      slice_head(n = input$top_n) %>%
      mutate(
        Team = reorder(Team, Cartons_moyens)
      )
    
    p <- ggplot(data_equipes, aes(
      x = Team,
      y = Cartons_moyens,
      text = paste(
        "Équipe :", Team,
        "<br>Cartons moyens :", round(Cartons_moyens, 2),
        "<br>Matchs :", Matchs
      )
    )) +
      geom_col(width = 0.7) +
      coord_flip() +
      scale_y_continuous(
        breaks = seq(0, 5, 0.5),
        limits = c(0, 5)
      ) +
      labs(
        title = "Équipes les plus sanctionnées en moyenne",
        x = "Équipe",
        y = "Nombre moyen de cartons par match"
      ) +
      theme_minimal(base_size = 12) +
      theme(
        plot.title = element_text(face = "bold"),
        panel.grid.minor = element_blank()
      )
    
    ggplotly(p, tooltip = "text")
  })
  
  output$plot_tirs <- renderPlotly({
    data_plot <- data_filtre() %>%
      filter(!is.na(TotalShots), !is.na(TotalGoals))
    
    p <- ggplot(data_plot, aes(
      x = TotalShots,
      y = TotalGoals,
      text = paste(
        "Match :", HomeTeam, "-", AwayTeam,
        "<br>Saison :", Season,
        "<br>Tirs :", TotalShots,
        "<br>Buts :", TotalGoals
      )
    )) +
      geom_jitter(
        width = 0.25,
        height = 0.10,
        alpha = 0.35,
        size = 1.8
      ) +
      geom_smooth(method = "lm", se = FALSE, linewidth = 1) +
      scale_x_continuous(
        breaks = seq(0, 60, 5),
        limits = c(0, 60)
      ) +
      scale_y_continuous(
        breaks = seq(0, 10, 1),
        limits = c(0, 10)
      ) +
      labs(
        title = "Relation entre le nombre total de tirs et le nombre total de buts",
        x = "Nombre total de tirs dans le match",
        y = "Nombre total de buts dans le match"
      ) +
      theme_minimal(base_size = 12) +
      theme(
        plot.title = element_text(face = "bold"),
        panel.grid.minor = element_blank()
      )
    
    ggplotly(p, tooltip = "text")
  })
}

shinyApp(ui = ui, server = server)
