function itemPrice() {

  const priceForm = document.getElementById("item-price");
  priceForm.addEventListener("input", () => {
    const price = priceForm.value;
    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.innerHTML = Math.floor(price * 0.1);
    const totalPrice = document.getElementById("profit");
    totalPrice.innerHTML = Math.floor(price - Math.floor(price * 0.1));
  });
};

window.addEventListener('load', itemPrice);