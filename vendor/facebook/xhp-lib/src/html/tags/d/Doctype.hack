/*
 *  Copyright (c) 2004-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\XHP\HTML;

use namespace Facebook\XHP\{ChildValidation as XHPChild, Core as x};
use namespace HH\Lib\C;

/**
 * Render an <html /> element within a DOCTYPE, XHP has chosen to only support
 * the HTML5 doctype.
 */
final xhp class doctype extends x\primitive {
  use XHPChild\Validation;

  protected static function getChildrenDeclaration(): XHPChild\Constraint {
    return XHPChild\of_type<html>();
  }

  <<__Override>>
  protected async function stringifyAsync(): Awaitable<string> {
    return '<!DOCTYPE html>'.
      (await self::renderChildAsync(C\onlyx($this->getChildren())));
  }
}
