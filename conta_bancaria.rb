#Problema: transferir dinheiro entre contas

#Solucao

#criar contas no banco com um valor de caixa
class ContaBancaria 
  attr_accessor :valor, :proprietario
  def initialize(valor, proprietario = "Usuario Anonimo")
    @proprietario = proprietario
    @valor = valor
  end

  def saldo
    @valor
  end

  def taxa
    taxa = 300
  end

#criar metodo de transferir o valor entre contas diferentes
  def transferir(conta, valor)
    
   if self.saldo > valor
    if valor > 1000 #Se a transferencia for maior que 1000 
     retirar_valor(valor+self.taxa)
     depositar_valor(conta,valor) 
    else
     depositar_valor(conta,valor) 
     retirar_valor(valor)
    end
   else
     p "Nao e possivel transferir R$#{valor} para #{conta.proprietario}"   
   end
  
  end  

  private

  def retirar_valor(valor)
    @valor -= valor
  end

  def depositar_valor(conta,valor)
  conta.valor += valor
  end
end

class ContaEspecial < ContaBancaria
  
  def transferir(conta,valor)
  super 
  @valor -= 50
  end

end

#testes 

conta1 = ContaBancaria.new(2000, "Caio")
p conta1.saldo #2000
conta2 = ContaBancaria.new(3000)
p conta2.saldo #3000
conta1.transferir(conta2, 1001)
p conta1.saldo #699
p conta2.saldo #4001
conta3 = ContaEspecial.new(200)
p conta3.saldo #200
conta4 = ContaBancaria.new(250)
conta4.transferir(conta3, 50)
p conta3.saldo #250
p conta4.saldo #150
conta5 = ContaBancaria.new(50)
conta5.transferir(conta1,100) #"Nao e possivel transferir R$100 para Caio"



