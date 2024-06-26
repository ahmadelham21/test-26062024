const soal2A = (n) => {
  for (let i = 1; i <= n; i++) {
    let line = " ";
    for (let j = 1; j <= i; j++) {
      line += i;
    }
    console.log(line);
  }
};
soal2A(5);

const soal2B = (n) => {
  for (let i = 1; i <= n; i++) {
    let line = " ";
    for (let j = i; j > 0; j--) {
      line += j;
    }
    console.log(line);
  }
};

soal2B(5);

const soal2C = (n) => {
  for (let i = 1; i <= n; i++) {
    let num = i;
    let line = "";
    for (let j = 1; j <= i; j++) {
      line += num;
      num++;
    }
    console.log(line);
  }
};

soal2C(5);


const soal2D = (n) => {
  for (let i = 1; i <= n; i++) {
    let line = "";
    for (let j = 0; j < n; j++) {
      line += i + j * n + " ";
    }
    console.log(line);
  }
};

soal2D(5);
