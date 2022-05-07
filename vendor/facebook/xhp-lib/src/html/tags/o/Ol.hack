/*
 *  Copyright (c) 2004-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\XHP\HTML;

use namespace Facebook\XHP\ChildValidation as XHPChild;

final xhp class ol extends element implements Category\Flow, Category\Palpable {
  use XHPChild\Validation;
  attribute
    bool reversed,
    int start,
    enum {'1', 'a', 'A', 'i', 'I'} type;

  protected static function getChildrenDeclaration(): XHPChild\Constraint {
    return XHPChild\any_number_of(XHPChild\of_type<li>());
  }

  protected string $tagName = 'ol';
}
