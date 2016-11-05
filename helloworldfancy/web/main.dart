// Copyright (c) 2016, Luke Muller. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

void main() {
  querySelector("#button"). onClick.listen(sayHello);
}

void sayHello(MouseEvent event) {
  querySelector("#name").text = (querySelector("#name_box") as InputElement).value;
  (querySelector("#name_box") as InputElement).value = "";

  querySelector("#age").text = (querySelector("#age_box") as InputElement).value;
  (querySelector("#age_box") as InputElement).value = "";

  querySelector("#origin").text = (querySelector("#origin_box") as InputElement).value;
  (querySelector("#origin_box") as InputElement).value = "";
}
