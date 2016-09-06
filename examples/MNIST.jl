using Flux, MNIST

@time begin
  const data = [(trainfeatures(i), onehot(trainlabel(i), 0:9)) for i = 1:60_000]
  const train = data[1:50_000]
  const test = data[50_001:60_000]
  nothing
end

m = Chain(
  Input(784),
  Dense(128), relu,
  Dense( 64), relu,
  Dense( 10), softmax)

model = mxnet(m, 784)

@time Flux.train!(model, train, test, epoch = 1, η=0.001)