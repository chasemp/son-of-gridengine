/*___INFO__MARK_BEGIN__*/
/*************************************************************************
 *
 *  The Contents of this file are made available subject to the terms of
 *  the Sun Industry Standards Source License Version 1.2
 *
 *  Sun Microsystems Inc., March, 2001
 *
 *
 *  Sun Industry Standards Source License Version 1.2
 *  =================================================
 *  The contents of this file are subject to the Sun Industry Standards
 *  Source License Version 1.2 (the "License"); You may not use this file
 *  except in compliance with the License. You may obtain a copy of the
 *  License at http://gridengine.sunsource.net/Gridengine_SISSL_license.html
 *
 *  Software provided under this License is provided on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
 *  WITHOUT LIMITATION, WARRANTIES THAT THE SOFTWARE IS FREE OF DEFECTS,
 *  MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE, OR NON-INFRINGING.
 *  See the License for the specific provisions governing your rights and
 *  obligations concerning the Software.
 *
 *   The Initial Developer of the Original Code is: Sun Microsystems, Inc.
 *
 *   Copyright: 2001 by Sun Microsystems, Inc.
 *
 *   All Rights Reserved.
 *
 ************************************************************************/
/*___INFO__MARK_END__*/
/**
 *  Generated from java_jgdi_descriptor.jsp
 *  !!! DO NOT EDIT THIS FILE !!!
 */
<%
  com.sun.grid.cull.CullDefinition cullDef = (com.sun.grid.cull.CullDefinition)params.get("cullDef");
  com.sun.grid.cull.JavaHelper jh = (com.sun.grid.cull.JavaHelper)params.get("javaHelper");
%>
package com.sun.grid.jgdi.rmi;


import java.rmi.RemoteException; 
import java.rmi.Remote;
import com.sun.grid.jgdi.configuration.reflect.AbstractClassDescriptor;
import com.sun.grid.jgdi.configuration.reflect.PlainListPropertyDescriptor;
import com.sun.grid.jgdi.configuration.reflect.SimplePropertyDescriptor;

<% // Import all cull object names;
    com.sun.grid.cull.CullObject cullObj = null;
    String classname = null;
    String idlname = null;
    for (String name : cullDef.getObjectNames()) {
      cullObj = cullDef.getCullObject(name); 
      if(cullObj.getType() == cullObj.TYPE_PRIMITIVE) {
         continue;
      }
      if(cullObj.getType() == cullObj.TYPE_MAPPED) {
         continue;
      }
      if(!cullObj.isRootObject()) {
        continue;
      }
%>import <%=jh.getFullClassName(cullObj)%>;
<% } // end of for %>
/**
 *
 * 
 */
public class JGDIRemoteDescriptor extends AbstractClassDescriptor {
   

   public JGDIRemoteDescriptor() {
       super(JGDIRemote.class, null);
       
       PlainListPropertyDescriptor lpd = null;

<%
     for (String name : cullDef.getObjectNames()) {
      cullObj = cullDef.getCullObject(name); 
      if (cullObj.getType() == cullObj.TYPE_PRIMITIVE) {
         continue;
      }
      if (cullObj.getType() == cullObj.TYPE_MAPPED) {
         continue;
      }
      classname = cullObj.getName();
      idlname = cullObj.getIdlName();
      
  if (!cullObj.hasGetListOperation()) {
%>
      // add( new SimplePropertyDescriptor(JGDIRemote.class, "<%=idlname%>", <%=idlname%>.class,  "<%=name%>", -1, false, true, false));
<% } else { %>
      add( new PlainListPropertyDescriptor(JGDIRemote.class, "<%=idlname%>", <%=idlname%>.class, "<%=name%>", -1, false, false, true));
<% } %>      
<% 
   } // end of for
%>
   }
   
   public void validate(Object bean) throws com.sun.grid.jgdi.configuration.reflect.InvalidObjectException {
      // TODO
   }
}
