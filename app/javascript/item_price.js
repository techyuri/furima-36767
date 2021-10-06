function price_count() {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById('add-tax-price');
  addTaxDom.innerHTML = Math.floor(inputValue/10);
  const SalesProfit = document.getElementById('profit');
  SalesProfit.innerHTML = inputValue - addTaxDom.innerHTML
  })
}
window.addEventListener("load", price_count); 