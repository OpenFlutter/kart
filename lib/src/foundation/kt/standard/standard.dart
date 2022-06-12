/*
 * Copyright (c) 2022.  OpenFlutter Project
 *
 *   Licensed to the Apache Software Foundation (ASF) under one or more contributor
 * license agreements.  See the NOTICE file distributed with this work for
 * additional information regarding copyright ownership.  The ASF licenses this
 * file to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

extension KtStandardExtension<T> on T {
  /// Calls the specified function [block] with this value as its argument and returns its result.
  /// Example:
  ///
  ///       String? str;
  ///       var result = str?.let((self) {
  ///         return self.isNotEmpty;
  ///       }); // null
  ///
  R let<R>(R Function(T self) block) {
    return block(this);
  }

  T apply(void Function() block) {
    block();
    return this;
  }

  R also<R>(R Function(T self) func) {
    return func(this);
  }

  R run<R>(R Function() func) {
    return func();
  }

  T? takeIf(bool Function(T self) predicate) {
    if (predicate(this)) {
      return this;
    } else {
      return null;
    }
  }
}

extension KtStandardExtension2<T> on T {

}
///Executes the given function action specified number of times.
/// A zero-based index of current iteration is passed as a parameter to action.
repeat(int times, Function(int index) action) {
  for (int index = 0; index < times; index++) {
    action(index);
  }
}
