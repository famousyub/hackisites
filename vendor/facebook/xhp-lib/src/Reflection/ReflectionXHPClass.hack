/*
 *  Copyright (c) 2004-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\XHP;

use namespace Facebook\XHP\Core as x;
use namespace HH\Lib\C;

class ReflectionXHPClass {
  public function __construct(private classname<x\node> $className) {
    invariant(
      \class_exists($this->className),
      'Invalid class name: %s',
      $this->className,
    );
  }

  public function getReflectionClass(): \ReflectionClass {
    return new \ReflectionClass($this->getClassName());
  }

  public function getClassName(): classname<x\node> {
    return $this->className;
  }

  public function getChildren(): ReflectionXHPChildrenDeclaration {
    $class = $this->getClassName();
    return $class::__xhpReflectionChildrenDeclaration();
  }

  public function getAttribute(string $name): ReflectionXHPAttribute {
    $map = $this->getAttributes();
    invariant(
      C\contains_key($map, $name),
      'Tried to get attribute %s for XHP element %s, which does not exist',
      $name,
      $this->getClassName(),
    );
    return $map[$name];
  }

  public function getAttributes(): dict<string, ReflectionXHPAttribute> {
    $class = $this->getClassName();
    return $class::__xhpReflectionAttributes();
  }

  public function getCategories(): keyset<string> {
    $class = $this->getClassName();
    return $class::__xhpReflectionCategoryDeclaration();
  }
}
