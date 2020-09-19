function calculation() {

  const fee = 0.1;
  let tagInput = document.getElementById('item-price');
  const tagOutput = document.getElementById('add-tax-price');
  const tagOutputTotal = document.getElementById('profit');

  tagInput.addEventListener('input', function(){
    var str = this.value;
    let fee_price = str * fee;
    let num = Math.round(fee_price);
    tagOutput.innerHTML = num;
    let total_price = tagOutput.innerHTML;
    let total= this.value - total_price;
    tagOutputTotal.innerHTML = total;
  });
};

window.addEventListener('load',calculation)

