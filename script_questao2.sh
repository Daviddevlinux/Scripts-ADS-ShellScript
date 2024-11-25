#!/bin/bash

OUTPUT_DIR="results_questao2"
mkdir -p $OUTPUT_DIR

TEMPO_SERVICO=0.84
NUM_SERVIDORES=10
TEMPO_OBSERVACAO=30


TAXAS_CHEGADA=(5 10 15 20 25 30) # Modifique se necessário

run_simulation() {
    local TAXA_CHEGADA=$1

    echo "Executando com Taxa de Chegada: $TAXA_CHEGADA, Tempo de Serviço: $TEMPO_SERVICO, Servidores: $NUM_SERVIDORES, Tempo de Observação: $TEMPO_OBSERVACAO..."
    
    
    java -cp "bin:lib/*" ServidorWeb $TAXA_CHEGADA $TEMPO_SERVICO $NUM_SERVIDORES $TEMPO_OBSERVACAO > "$OUTPUT_DIR/taxa-$TAXA_CHEGADA.txt"

    echo "Resultados salvos em: $OUTPUT_DIR/taxa-$TAXA_CHEGADA.txt"
}

for TAXA in "${TAXAS_CHEGADA[@]}"; do
    run_simulation $TAXA
done

echo "Simulações concluídas! Resultados disponíveis em $OUTPUT_DIR."
