library isitaword;

import 'package:isitaword/words.dart';

export 'package:isitaword/isitaword.dart';

//returns true if the word is found in the words list
//returns false if the word isn't found in the words list
bool isItAWord(String word) {
  if (words.contains(word)) {
    return true;
  }
  return false;
}
