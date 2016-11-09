# /*"
# * Copyright (C) 2008 Subscription Insights Portal authors"
# *"
# * Licensed under the Apache License, Version 2.0 (the "License");"
# * you may not use this file except in compliance with the License."
# * You may obtain a copy of the License at"
# *"
# *      http://www.apache.org/licenses/LICENSE-2.0"
# *"
# * Unless required by applicable law or agreed to in writing, software"
# * distributed under the License is distributed on an "AS IS" BASIS,"
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied."
# * See the License for the specific language governing permissions and"
# * limitations under the License."
# */"
echo "Build is done by now. Copying dependencies..."
mvn dependency:copy-dependencies || { echo "Error: maven dependency:copy-dependencies failed"; exit 1; }
echo "Cleaning up existing zip if any..."
rm -f libs.zip || { echo "Error: Cleaning lib zip"; exit 1; }
rm -f build.zip || { echo "Error: Cleaning binaries zip"; exit 1; }
rm -f testbuild.zip || { echo "Error: Cleaning test binaries zip"; exit 1; }
mkdir -p target/test-classes;touch target/test-classes/placeholder.class || { echo "Error: Creating placeholder for test-classes"; exit 1; }
echo "Zipping artifacts begin..."
zip libs.zip $(git ls-files -o | grep -e target/dependency/.*jar) || { echo "Error: Zipping libs failed"; exit 1; }
zip build.zip $(git ls-files -o | grep -e target/classes) || { echo "Error: Zipping binaries failed"; exit 1; }
zip testbuild.zip $(git ls-files -o | grep -e target/test-classes) || { echo "Error: Zipping test binaries failed"; exit 1; }
echo "Zipping artifacts DONE!!!"
# Modified by Insights Service at 2016-11-09 18:57:07.876154
