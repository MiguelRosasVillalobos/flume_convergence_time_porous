import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Configurar Matplotlib para usar texto en formato SVG
plt.rcParams["svg.fonttype"] = "none"
# Crear una figura con dimensiones específicas en centímetros
fig_width_cm = 7.5
fig_height_cm = 6.0

# Convertir las dimensiones de cm a pulgadas (1 pulgada = 2.54 cm)
fig_width_inch = fig_width_cm / 2.54
fig_height_inch = fig_height_cm / 2.54
# Cargar el archivo CSV
data = pd.read_csv("Kr_ai_s1.csv")

# Ordenar los datos por la columna 'a' de menor a mayor
data_sorted = data.sort_values("t")

# Encontrar el mínimo Kr y su correspondiente valor de 'a'
min_kr_index = data_sorted["Kr"].idxmin()
min_kr_value = data_sorted["Kr"][min_kr_index]
min_a_value = data_sorted["t"][min_kr_index]

# Crear el gráfico de línea para los datos ordenados
plt.figure(figsize=(fig_width_inch, fig_height_inch))
plt.plot(
    data_sorted["t"],
    data_sorted["Kr"] / 100,
    marker="D",
    linestyle="-",
    color="b",
    markersize=1,
    linewidth=1,
    label=r"$K_r$ vs. $t$",
)

# Añadir título y etiquetas con más detalles
plt.xlabel(r"$t$", fontsize=12)
plt.ylabel(r"$K_r$", fontsize=12)

# Mejorar las marcas en los ejes
plt.xticks(np.arange(40, 140, 20), fontsize=12)
plt.yticks(np.arange(0.3, 0.355, 0.01), fontsize=12)

# Añadir una cuadrícula más suave
plt.grid(True, which="both", linestyle="--", linewidth=0.7)

# Añadir un marco alrededor del gráfico
for spine in plt.gca().spines.values():
    spine.set_edgecolor("grey")

# Añadir leyenda
# plt.legend(loc="best", fontsize=17)

# Añadir anotación para el punto de mínimo Kr con el valor exacto y tamaño de letra aumentado
# plt.annotate(
#     f"min($K_r$) = {min_kr_value/100:.4f}",
#     xy=(min_a_value / 0.75, min_kr_value / 100),
#     xytext=(min_a_value / 0.75 + 0.15, min_kr_value / 100 ),
#     arrowprops=dict(facecolor="black", arrowstyle="->"),
#     fontsize=14,
#     bbox=dict(boxstyle="round,pad=0.3", edgecolor="black", facecolor="grey")
# )

# Ajustar el diseño para evitar recortes
plt.tight_layout()

# Guardar el gráfico en un archivo SVG
plt.savefig("figura.svg", format="svg")


# Mostrar el gráfico
plt.show()
