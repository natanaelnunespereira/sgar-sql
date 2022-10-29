# Sistema de Gerenciamento e Automação de Refeitório

Esta documentação apresenta o desenvolvimento de um banco de dados para o Sistema de Gerenciamento e Automação de Refeitório.

## Regras de negócio

### Funcionais

- Cadastro de usuários
  - Cadastro de usuários que irão operar o sistema.
- Cadastro de entrantes
  - Cadastro de entrantes ao refeitório e suas permissões.
- Emissão de passes
  - Gerar passes para externos e demais servidores.
- Emissão de relatórios
  - O sistema será capaz de exportar relatórios úteis quanto ao fluxo de entrantes.
- Controle de entrantes
  - O sistema será capaz de controlar os entrantes e sua devida autenticação, de acordo com sua patente e suas devidas permissões.

### Não-funcionais

- O entrante só poderá entrar nas dependências do refeitório caso o sistema conceda a permissão, entretanto, o funcionário da portaria do refeitório deverá garantir que ninguém entre sem a devida autorização.
