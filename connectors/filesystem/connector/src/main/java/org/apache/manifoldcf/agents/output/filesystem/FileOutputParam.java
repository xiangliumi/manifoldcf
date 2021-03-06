/* $Id: FileOutputParam.java 1299512 2013-05-31 22:59:38Z minoru $ */

/**
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements. See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.manifoldcf.agents.output.filesystem;

import java.util.HashMap;
import java.util.Map;

/** 
 * Parameters data for the elasticsearch output connector.
 */
public class FileOutputParam extends HashMap<ParameterEnum, String>
{
  private static final long serialVersionUID = -140994685772720029L;


  protected FileOutputParam(ParameterEnum[] params) {
    super(params.length);
  }

  final public Map<String, String> buildMap() {
    Map<String, String> rval = new HashMap<String, String>();
    for (Map.Entry<ParameterEnum, String> entry : this.entrySet()) {
      rval.put(entry.getKey().name(), entry.getValue());
    }
    return rval;
  }

}
