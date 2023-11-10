# Autor: Nano Lima
# E-mail: nanolima@nanolima.eti.br
# ------------------------------------------------------
# O script deve ser agendado para executar toda noite
# após a realização do backup do SQL Server
# ------------------------------------------------------
# Variaveis - Porque amo usar espaços de memória

# Informações locais do servidor
$DIA  = (Get-Date).toString("yyyy-MM-dd")
$LOCAL_DIR = 'c:\temp'
$LOCAL_FILE = '*.pdf'
$LOGFILE = 'c:\temp\backuplog'

# Aqui que a "magica" começa

foreach ($THEFILE in Get-ChildItem -path $LOCAL_DIR\$LOCAL_FILE -Name)
{
	aws s3 cp $THEFILE $S3_BUCKET -debug $LOGFILE-$DIA.log
}


