#!/bin/bash


BASE_OUTPUT_DIR="results_q1a"
mkdir -p $BASE_OUTPUT_DIR


TAMANHO_ENTRADA=9300000
VALOR_MAXIMO=930000
ALGORITMOS=("QUICK" "MERGE" "COUNTING")
NUM_MEDICOES=30


for ALGORITMO in "${ALGORITMOS[@]}"; do
 
    ALGORITMO_DIR="$BASE_OUTPUT_DIR/$ALGORITMO"
    mkdir -p $ALGORITMO_DIR

    echo "Executando $NUM_MEDICOES medições para o algoritmo: $ALGORITMO"
    for i in $(seq 1 $NUM_MEDICOES); do
        echo "Medição $i para $ALGORITMO..."

        java -cp bin MedidorDeOrdenacao $ALGORITMO $TAMANHO_ENTRADA $VALOR_MAXIMO >> "$ALGORITMO_DIR/medicao_$i.txt"
    done
    echo "Resultados para $ALGORITMO salvos no diretório $ALGORITMO_DIR"
done

echo "Medições concluídas! Resultados disponíveis no diretório $BASE_OUTPUT_DIR."
