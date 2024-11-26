#!/bin/bash

BASE_OUTPUT_DIR="results_q2a"
mkdir -p $BASE_OUTPUT_DIR


VALOR_MAXIMO=930000
TAMANHOS_ENTRADA=(9300000 93000000) 
N=50  # Substitua pelo valor calculado na 1a
ALGORITMOS=("QUICK" "MERGE" "COUNTING")


for TAMANHO_ENTRADA in "${TAMANHOS_ENTRADA[@]}"; do
    for ALGORITMO in "${ALGORITMOS[@]}"; do
       
        ALGORITMO_DIR="$BASE_OUTPUT_DIR/${ALGORITMO}_size_${TAMANHO_ENTRADA}"
        mkdir -p $ALGORITMO_DIR

        echo "Executando $N medições para $ALGORITMO com tamanho de entrada $TAMANHO_ENTRADA"
        for i in $(seq 1 $N); do
            echo "Medição $i para $ALGORITMO com tamanho $TAMANHO_ENTRADA..."
            java -cp bin MedidorDeOrdenacao $ALGORITMO $TAMANHO_ENTRADA $VALOR_MAXIMO >> "$ALGORITMO_DIR/medicao_$i.txt"
        done
        echo "Resultados para $ALGORITMO com tamanho $TAMANHO_ENTRADA salvos no diretório $ALGORITMO_DIR"
    done
done

echo "Medições concluídas! Resultados disponíveis no diretório $BASE_OUTPUT_DIR."
