# --- AULA 2: COMANDOS ESSENCIAIS DO SQL --- #

# 1. APRESENTAÇÃO
-- A hashtagmovie é um banco de dados que tem como principal objetivo armazenar as informações de desempenho dos filmes alugados pelo serviço de streaming da empresa ao longo do período. 

-- Esse banco de dados é composto por 5 tabelas:
	# alugueis: armazena os dados relacionados aos aluguéis dos filmes
    # atores: armazena os dados dos atores dos diferentes filmes
    # atuacoes: tabela contendo a participação de cada ator no respectivo filme
    # clientes: tabela com os dados dos clientes da empresa
    # filmes: dados sobre os filmes disponíveis para aluguel


-- Esses dados serão fundamentais para que futuramente sejam feitas análises dos dados para tomadas de decisão de curto e longo prazo, como:

-- i) Decisão de investir em determinados filmes baseado na sua popularidade (nota)
-- ii) Número total de locações definirá a RECEITA DA EMPRESA
-- iii) A média de avaliação dos filmes definirá a SATISFAÇÃO DOS CLIENTES
-- iv) O número de clientes ativos definirá o ENGAJAMENTO DOS CLIENTES

-- O projeto então terá alguns objetivos, como:	
		-- Descobrir as preferências dos clientes de acordo com região e sexo
		-- Popularidade dos filmes por gênero e ano de lançamento
        -- Filmes com nota acima da média
        -- Dentre outros
        
-- Para que a gente seja capaz de realizar todas essas análises no SQL (aula 3), precisaremos aprender os COMANDOS ESSENCIAIS, que serão mostrados na aula de hoje (e continuaremos na aula 3).



# =======        PARTE 1:       =======#
# =======  COMANDOS DE SELEÇÃO  =======#


-- SELECT, SELECT LIMIT, SELECT DISTINCT 

-- 1. Você foi alocado como analista responsável da hashtagmovie. 
-- Seu primeiro desafio é fazer um reconhecimento das tabelas do banco de dados, isso será importante para as próximas etapas do projeto.
-- Além disso, identifique a quantidade de linhas

select * from alugueis; -- 578 alugueis
select * from atores; -- 145 atores
select * from atuacoes; -- 213 atuacoes
select * from clientes; -- 123 clientes
select * from filmes; -- 71 filmes




-- 2. Pensando que as tabelas do SQL podem ter milhões de linhas, para fazer o reconhecimento de tabelas nem sempre é necessário visualizar todas as linhas, basta verificar as N primeiras linhas. 

-- Por isso, uma boa prática para selecionar os dados no SQL é limitar a quantidade de linhas que são visualizadas na tabela. 
-- a) Utilize o comando LIMIT para visualizar apenas as 10 primeiras linhas da tabela de FILMES.

select * from filmes limit 10;
select * from alugueis limit 10;
select * from atores limit 10;
select * from atuacoes limit 10;
select * from clientes limit 10;

-- b) Utilize o comando LIMIT para visualizar apenas as 50 primeiras linhas da tabela de CLIENTES.
select * from clientes limit 50;

-- 3. O responsável pela criação das tabelas disse que os filmes se dividem em um total de 7 GÊNEROS: 1) Comédia; 2) Drama; 3) Ficção e Fantasia; 4) Mistério e Suspense; 5) Arte; 6) Animação; 7) Ação e Aventura.

-- Nesse momento, você terá o IMPORTANTE trabalho de verificar se todos esses gêneros estão de fato presentes na tabela FILMES. Caso não esteja, você deverá reportar ao responsável.

select distinct genero from filmes ;

-- 4. A empresa sabe que precisa expandir seu mercado para o máximo de estados possível. Como analista dos dados, você deverá identificar quais são os estados onde atualmente a empresa possui clientes. Quantos são esses estados no total? Pensando que o país tem 27 UF (26 estados + DF), ainda há espaço para expandir para quantos estados?

select distinct estado from clientes; -- Estamos atuando em 11 estados, podem expandir para mais 16 estados



# =====================         PARTE 2:        =======================#
# =====================  COMANDOS DE ORDENAÇÃO  =======================#

-- ORDER BY ASC, ORDER BY DESC

-- 1. Faça uma análise em cima do ano de nascimento de cada um dos atores. Ordene a tabela de atores para mostrar os atores com os anos de nascimento do maior para o menor.

select * from atores order by ano_nascimento desc;
select * from atores order by ano_nascimento asc;


-- 2. O setor de controle de dados vai precisar fazer uma segmentação dos clientes, separando por ordem alfabética. Faça uma ordenação na tabela de clientes a partir da coluna nome_cliente para facilitar o trabalho dos seus colegas.

select * from clientes order by nome_cliente asc;
select * from clientes order by nome_cliente desc;


-- 3. Na tabela de clientes, tente descobrir qual foi o cliente com a data de criação de conta mais antiga, ou seja, o primeiro cliente cadastrado na base.
select * from clientes order by data_criacao_conta asc;

select * from clientes order by data_criacao_conta asc limit 1; -- mostra apenas a linha da pessoa mais antiga cadastrada.


-- 4. A empresa gostaria de saber quais são os TOP 5 filmes com a maior duração. Você seria capaz de fazer essa análise?

select * from filmes order by duracao desc limit 5; -- mostra apenas os 5 filmes com maior duração.


# ================================         PARTE 3:        =================================#
# =================================  COMANDOS DE FILTRAGEM  ================================#

-- WHERE (padrão, AND/OR, IN, BETWEEN)


-- 1. A empresa deseja incluir em seu catálogo mais filmes do gênero de COMÉDIA. Para isso, ela deverá adquirir os direitos de transmissão junto ao estúdio responsável.

-- Porém, a empresa deve tomar cuidado para não negociar um filme que já existe em seu catálogo.

-- O seu trabalho, portanto, é listar todos os filmes do gênero COMÉDIA e fornecer essas informações ao seu gestor.

select * from filmes where genero = "Comédia"; -- total de 10 filmes


-- 2. A equipe de estratégia fez um levantamento com os críticos de cinema mais conhecidos e descobriram que o ano de 2003 foi um dos anos de sucesso do cinema. Alguns desses críticos foram contratados para ajudar na melhoria do catálogo de filmes, e querem sugerir mais opções de filmes que foram lançados em 2003.

-- Para isso, os críticos contratados precisarão da lista de filmes que a empresa já tem, para que eles possam avaliar se esses filmes realmente são boas opções de se ter no catálogo, e também aproveitar para sugerir outros títulos.

-- O seu trabalho, portanto, é fazer uma consulta ao banco de dados para essa solicitação do projeto. 

select * from filmes where ano_lancamento = 2003; -- todos os filmes do ano de 2003

-- 3. Um dos analistas da equipe percebeu que alguns filmes do gênero Drama, com mais de 120 minutos de duração, não tinham uma boa avaliação dos clientes. Por isso, ele levantou a ideia de se analisar com mais cuidado todos os filmes que se enquadrassem nesses critérios, para verificar se de fato eles estão tendo um baixo rendimento.

-- O seu trabalho é listar todos esses filmes para que seja possível realizar essa análise.

select * from filmes where genero = 'Drama' and duracao >= 120; -- 15 filmes dentro do genero drama tem 120 ou mais ou mais minutos


-- 4. A empresa está percebendo que os países do: Canadá, Austrália e Irlanda do Norte estão produzindo bons filmes nos últimos anos. Vendo esse movimento, a empresa decidiu listar todos os atores dessas nacionalidades para pesquisar filmes relacionados e avaliar a possibilidade de incluir mais opções no catálogo, referentes ao cinema desses 3 países.

-- O seu trabalho é listar todos os atores de nacionalidade: Canadá, Austrália e Irlanda do Norte para facilitar essa análise.

select * from atores where nacionalidade in ('Canada', 'Austrália', 'Irlanda do Norte');

-- 5. A empresa decidiu criar uma opção de catálogo alternativa para os seus filmes: agora, os clientes poderão escolher, por exemplo, alugar filmes na faixa de duração entre 90 min e 100 minutos. Seu trabalho será o de iniciar essa organização, e começar mostrando os filmes que possuem uma duração neste intervalo.

select * from filmes where duracao between 90 and 100;

# ====================================        PARTE 4:       ========================================#
# ======================================  FUNÇÕES MATEMÁTICAS  ======================================#

-- Funções de Agregação: COUNT, COUNT DISTINCT, SUM, MIN, MAX, AVG

-- 1. A tabela de ALUGUEIS tem o registro de todos os aluguéis feitos no serviço de streaming da empresa.

-- a) Descubra a quantidade total de alugueis de filmes feitos para todo o período (utilize a coluna id_aluguel para esse cálculo).

select * from alugueis;
select count(id_aluguel)from alugueis; -- 578 alugueis

-- b) Descubra a quantidade total de alugueis de filmes feitos para todo o período (utilize a coluna nota para esse cálculo).

select * from alugueis;
select count(nota) from alugueis;-- 328 filmes receberam notas dos clientes


-- c) Você viu alguma diferença no resultado? O que aconteceu?

-- Houve diferença pois as celulas em branco não contam.

-- 2. O setor de catálogo precisa saber quantos gêneros de filmes existem na empresa atualmente. Você saberia fazer essa análise?

select count(distinct genero) from filmes;


-- 3. Quantos minutos no total a empresa possui de filmes catalogados?

select sum(duracao) from filmes;

-- 4. Qual é a duração em minutos do filme mais longo disponível no catálogo? E qual a duração do filme mais curto?

select max(duracao), min(duracao) from filmes;

-- 5. Qual é a média de satisfação dos clientes da empresa em relação aos filmes alugados?

select * from alugueis;
select avg(nota) from alugueis;