
UN = bits => bits.reduce((acc,bit,i) => acc + bit*2**i, 0)
N = bits => bits.pop() == 1 ? -((2**bits.length)-UN(bits)) : UN(bits)
CMB = a => b => {
  if (a.length != b.length) { throw "Must be same length" }
  return a.map((_,i) => [a[i],b[i]])
}

ADD = a => b => CMB(a)(b).reduce( ({acc,OF},ab) => ({acc:[...acc,(ab[0]+ab[1]+OF)%2],OF:(ab[0]+ab[1]+OF >= 2)}),({acc:[],OF:0}))

a = [0,1,1,1,1]
b = [1,1,1,1,1]
c = ADD(a)(b)
console.log(a)
console.log(N(a))
console.log(b)
console.log(N(b))
console.log(c)
console.log(N(c.acc))
