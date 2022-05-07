/*
 *  Copyright (c) 2004-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\XHP\ChildValidation;

use namespace Facebook\XHP\{ChildValidation as XHPChild, Core as x};

/** Verify that a new child declaration matches the legacy codegen. */
trait Validation {
  require extends x\node;

  abstract protected static function getChildrenDeclaration(
  ): XHPChild\Constraint;

  <<__Override>>
  final protected static function __legacySerializedXHPChildrenDeclaration(
  ): mixed {
    return static::getChildrenDeclaration()->legacySerialize();
  }
}
