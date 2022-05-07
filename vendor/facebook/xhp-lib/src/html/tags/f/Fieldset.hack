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

final xhp class fieldset
  extends element
  implements Category\Flow, Category\Sectioning, Category\Palpable {
  use XHPChild\Validation;
  attribute
    bool disabled,
    string form,
    string name;

  protected static function getChildrenDeclaration(): XHPChild\Constraint {
    return XHPChild\sequence(
      XHPChild\optional(XHPChild\of_type<legend>()),
      XHPChild\any_number_of(
        XHPChild\any_of(XHPChild\pcdata(), XHPChild\of_type<Category\Flow>()),
      ),
    );
  }

  protected string $tagName = 'fieldset';
}
