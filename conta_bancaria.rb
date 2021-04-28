#Problema: transferir dinheiro entre contas

#Solucao

#criar contas no banco com um valor de caixa
class ContaBancaria 
  attr_accessor :valor
  def initialize(valor)
    @valor = valor
  end

#criar metodo de transferir o valor entre contas diferentes
  def transferir(conta, valor)
   if valor > 1000
   retirar_valor(valor)
   @valor -= 300
   adicionar_valor(conta,valor) 
   else
   adicionar_valor(conta,valor) 
   retirar_valor(valor)
   end
  end  

  private

  def retirar_valor(valor)
    @valor -= valor
  end

  def adicionar_valor(conta,valor)
  conta.valor += valor
  end
end

class ContaEspecial < ContaBancaria
  
  def transferir(conta,valor)
  super 
  @valor -= 50
  end

end

conta1 = ContaBancaria.new(2000)
p conta1.valor #2000
conta2 = ContaBancaria.new(3000)
p conta2.valor #3000
conta1.transferir(conta2, 1001)
p conta1.valor #699
p conta2.valor #4001
conta3 = ContaEspecial.new(200)
p conta3.valor #200
conta4 = ContaEspecial.new(250)
conta4.transferir(conta3, 50)
p conta3.valor #250
p conta4.valor #150


