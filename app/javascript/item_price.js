function post (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     console.log(inputValue);
     const addTaxDom = document.getElementById("add-tax-price");
     const SalesProfit = document.getElementById("profit");
     addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
     SalesProfit.innerHTML = Math.floor(inputValue * 0.9)
    })
};

window.addEventListener('load', post);