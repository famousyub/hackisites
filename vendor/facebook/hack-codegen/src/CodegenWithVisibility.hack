/*
 *  Copyright (c) 2015-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HackCodegen;

enum CodegenPHPMethodVisibility: string as string {
  V_PUBLIC = 'public';
  V_PRIVATE = 'private';
  V_PROTECTED = 'protected';
}

trait CodegenWithVisibility {
  private CodegenPHPMethodVisibility $visibility =
    CodegenPHPMethodVisibility::V_PUBLIC;

  public function setPrivate(): this {
    $this->visibility = CodegenPHPMethodVisibility::V_PRIVATE;
    return $this;
  }

  public function setPublic(): this {
    $this->visibility = CodegenPHPMethodVisibility::V_PUBLIC;
    return $this;
  }

  public function setProtected(): this {
    $this->visibility = CodegenPHPMethodVisibility::V_PROTECTED;
    return $this;
  }

  public function getVisibility(): string {
    return $this->visibility;
  }
}
