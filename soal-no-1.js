const yesOrNo = (n) => {
  for (let i = 1; i < n; i++) {
    if (i % 3 == 0 && i % 4 == 0) {
      console.log("OKYES");
    } else if (i % 3 == 0) {
      console.log("OK");
    } else if (i % 4 == 0) {
      console.log("YES");
    } else {
      console.log(i);
    }
  }
};

yesOrNo(20);
