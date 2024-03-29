void easy() {
  drawXO(); //don't need to reference clickXO(), always listening
  int AI_Turn = drawCounter % 2;
  if (AI_Turn == 1) randomChoice();
  Boolean win = winCheck();
  if (win == true) winDraw();
}

void medium() {
  Boolean win = false;
  int AI_Turn = drawCounter % 2;
  Boolean firstAI_turn = true;
  drawXO();
  if (AI_Turn==1) {
    if (firstAI_turn==true) {
      randomChoice();
      firstAI_turn = false;
      println("First Turn", firstAI_turn);
    }
    if ( AI_Turn == 1 && firstAI_turn == false ) {
      blockWin();
      println("Inside AI", firstAI_turn);
    }
  }
  win = winCheck();
  if (win == true) winDraw();
}
//println ("First Drawcounter", drawCounter);
//println ("First AI_Turn", AI_Turn);
//println("Outside AI", firstAI_turn);

void impossible() {
}

void randomChoice() {
  Boolean randomeChosen = false;
  int[] nums = new int[9];
  int index = int(random(nums.length));
  if (noDraw[index]==true ) {
    while (randomeChosen == false) {
      index = int(random(nums.length));
      if (noDraw[index]==false) randomeChosen = true;
    }
  }
  drawCounter++; //drawCounter=drawCounter+1
  int XOclick = drawCounter % 2;
  if (XOclick == 1) {
    clickX[index] = true;
    noDraw[index] = true;
    noStroke();
    rect(spaceX[index], spaceY[index], spaceWidth, spaceHeight);
    textDraw(X, titleFont, height, black, CENTER, CENTER, spaceX[index], spaceY[index], spaceWidth, spaceHeight);
    stroke(1);
    lines();
  } else if (XOclick == 0) {
    clickO[index] = true;
    noDraw[index] = true;
    noStroke();
    rect(spaceX[index], spaceY[index], spaceWidth, spaceHeight);
    textDraw(O, titleFont, height, black, CENTER, CENTER, spaceX[index], spaceY[index], spaceWidth, spaceHeight);
    stroke(1);
    lines();
  } else {
  }//Empty else decision
  println("Random Index:", index);
}
