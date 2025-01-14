// Copyright (c) 2024, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/error/codes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../dart/resolution/context_collection_resolution.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(AugmentationWithoutDeclarationTest);
  });
}

@reflectiveTest
class AugmentationWithoutDeclarationTest extends PubPackageResolutionTest {
  test_class() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }

  test_class_constructor() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment A.named();
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_class_field() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment int foo = 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_class_field_static() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment static int foo = 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_class_getter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment int get foo => 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_class_getter_static() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment static int get foo => 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_class_method() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment void foo() {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_class_method_static() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment static void foo() {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_class_method_valid() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {
  void foo() {}
}
''');

    await assertNoErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment void foo() {}
}
''');
  }

  test_class_setter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment set foo(int _) {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_class_setter_static() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

class A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment class A {
  augment static set foo(int _) {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_enum() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment enum A {}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }

  test_enum_constructor() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

enum A {v}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment enum A {;
  augment const A.named();
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_enum_field() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

enum A {v}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment enum A {;
  augment final int foo = 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_enum_getter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

enum A {v}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment enum A {;
  augment int get foo => 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_enum_method() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

enum A {v}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment enum A {;
  augment void foo() {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_enum_setter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

enum A {v}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment enum A {;
  augment set foo(int _) {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_extension() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension A {}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }

  test_extension_getter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

extension A on int {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension A {
  augment int get foo => 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 51, 7),
    ]);
  }

  test_extension_method() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

extension A on int {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension A {
  augment void foo() {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 51, 7),
    ]);
  }

  test_extension_setter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

extension A on int {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension A {
  augment set foo(int _) {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 51, 7),
    ]);
  }

  test_extensionType() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension type A(int it) {}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }

  test_extensionType_constructor() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

extension type A(int it) {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension type A(int it) {
  augment A.named() : this(0);
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 64, 7),
    ]);
  }

  test_extensionType_getter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

extension type A(int it) {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension type A(int it) {
  augment int get foo => 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 64, 7),
    ]);
  }

  test_extensionType_method() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

extension type A(int it) {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension type A(int it) {
  augment void foo() {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 64, 7),
    ]);
  }

  test_extensionType_setter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

extension type A(int it) {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment extension type A(int it) {
  augment set foo(int _) {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 64, 7),
    ]);
  }

  test_mixin() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment mixin A {}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }

  test_mixin_field() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

mixin A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment mixin A {
  augment int foo = 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_mixin_getter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

mixin A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment mixin A {
  augment int get foo => 0;
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_mixin_method() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

mixin A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment mixin A {
  augment void foo() {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_mixin_method_valid() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

mixin A {
  void foo() {}
}
''');

    await assertNoErrorsInCode(r'''
augment library 'a.dart';

augment mixin A {
  augment void foo() {}
}
''');
  }

  test_mixin_setter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

mixin A {}
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment mixin A {
  augment set foo(int _) {}
}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 47, 7),
    ]);
  }

  test_topLevel_function() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment void foo() {}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }

  test_topLevel_function_valid() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';

void foo() {}
''');

    await assertNoErrorsInCode(r'''
augment library 'a.dart';

augment void foo() {}
''');
  }

  test_topLevel_getter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment int get foo => 0;
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }

  test_topLevel_setter() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment set foo(int _) {}
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }

  test_topLevel_variable() async {
    newFile('$testPackageLibPath/a.dart', r'''
import augment 'test.dart';
''');

    await assertErrorsInCode(r'''
augment library 'a.dart';

augment int foo = 0;
''', [
      error(CompileTimeErrorCode.AUGMENTATION_WITHOUT_DECLARATION, 27, 7),
    ]);
  }
}
