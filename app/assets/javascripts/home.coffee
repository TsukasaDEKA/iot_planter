# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# window.draw_graph = ->
#     ctx = document.getElementById("myChart").getContext('2d')
#     barNum = gon.data_num
#     labels = new Array(barNum)
#     bgColors = new Array(barNum)
#     bdColors = new Array(barNum)
#     for i in [0...barNum]
#         labels[i] = 'data' + i
#         bgColors[i] = 'rgba(256, 192, 192, 1)'
#         bdColors[i] = 'rgba(256, 192, 192, 1)'
#     myChart = new Chart(ctx, {
#         type: 'bar',
#         data: {
#             labels: labels
#             datasets: [{
#                 label: '# of Votes',
#                 data: gon.data,
#                 backgroundColor: bgColors,
#                 borderColor: bdColors,
#                 borderWidth: 1
#             }]
#         },
#         options: {
#             scales: {
#                 yAxes: [{
#                     ticks: {
#                         beginAtZero:true
#                     }
#                 }]
#             }
#         }
#     })
