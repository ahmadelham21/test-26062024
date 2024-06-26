function filterAndSortArray(arr) {
  let filteredArray = arr.filter((i) => i % 3 !== 0);

  filteredArray.sort((a, b) => a - b);

  return filteredArray;
}
let numList = [12, 9, 13, 6, 10, 4, 7, 2];
let result = filterAndSortArray(numList);
console.log("n = [" + result.join(", ") + "]");
