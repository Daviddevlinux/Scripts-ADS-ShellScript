#!/bin/bash


OUTPUT_DIR="results_questao3"
mkdir -p $OUTPUT_DIR

# Parâmetros fixos
TAXA_CHEGADA=9.5
TEMPO_SERVICO=0.84
TEMPO_OBSERVACAO=30


NUM_SERVIDORES_MIN=1
NUM_SERVIDORES_MAX=20


run_simulation() {
    local NUM_SERVIDORES=$1

    echo "Executando com Taxa de Chegada: $TAXA_CHEGADA, Tempo de Serviço: $TEMPO_SERVICO, Servidores: $NUM_SERVIDORES, Tempo de Observação: $TEMPO_OBSERVACAO..."
    
 
    java -cp "bin:lib/*" ServidorWeb $TAXA_CHEGADA $TEMPO_SERVICO $NUM_SERVIDORES $TEMPO_OBSERVACAO > "$OUTPUT_DIR/servers-$NUM_SERVIDORES.txt"

    echo "Resultados salvos em: $OUTPUT_DIR/servers-$NUM_SERVIDORES.txt"
}

for NUM_SERVIDORES in $(seq $NUM_SERVIDORES_MIN $NUM_SERVIDORES_MAX); do
    run_simulation $NUM_SERVIDORES
done

echo "Simulações concluídas! Resultados disponíveis em $OUTPUT_DIR."
