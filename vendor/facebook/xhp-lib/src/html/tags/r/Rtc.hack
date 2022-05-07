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

final xhp class rtc extends element {
  use XHPChild\Validation;

  protected static function getChildrenDeclaration(): XHPChild\Constraint {
    return XHPChild\at_least_one_of(
      XHPChild\any_of(
        XHPChild\pcdata(),
        XHPChild\of_type<Category\Phrase>(),
      ),
    );
  }

  protected string $tagName = 'rtc';
}
