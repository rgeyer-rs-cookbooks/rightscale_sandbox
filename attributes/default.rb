#  Copyright 2011 Ryan J. Geyer
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

default["rightscale_sandbox"]["grep_bin"] = value_for_platform("windows" => {"default" => "findstr"}, "default" => "grep")

# TODO: Is there a better way to do this? Like an attributes/windows.rb file?
if node["platform_family"] == "windows"
  default["rightscale_sandbox"]["home"] = `echo %RS_SANDBOX_HOME%`.strip
  default["rightscale_sandbox"]["gem_bin"] = "#{node["rightscale_sandbox"]["home"]}\\Ruby\\bin\\ruby.exe #{node["rightscale_sandbox"]["home"]}\\Ruby\\bin\\gem"
  default["rightscale_sandbox"]["rl_user_home_dir"] = `echo %USERPROFILE%`.strip
else
  default["rightscale_sandbox"]["home"] = "/opt/rightscale/sandbox/"
  default["rightscale_sandbox"]["gem_bin"] = "/opt/rightscale/sandbox/bin/gem"
  # TODO: Haven't found a use for this in Linux yet, nor have I found an elegant way to find it.
  default["rightscale_sandbox"]["rl_user_home_dir"] = nil
end