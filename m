Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1474334wru;
        Mon, 16 Jul 2018 06:00:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeIu0P3Y8W+qILUa0ansqscduBO1o7kuLIEGe95I2vGvd8xuuzxr8ejb/nHrxU0Lyw2KxTo
X-Received: by 2002:aed:3cc3:: with SMTP id e3-v6mr15013387qtf.356.1531746013851;
        Mon, 16 Jul 2018 06:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746013; cv=none;
        d=google.com; s=arc-20160816;
        b=yz33Apbg97GUnQ4r1NGtELM62YlHDo+IK4dn08mHieneL+TlrbKby+oWPfw+QYOG4Y
         fhNi27VMCXXsRTPiLHx9GF4nZysi2IzOGP1fP2W7zvozPe4kJl+mDVVOEm7sBHFGHnO/
         DVTWCRTRcckl/THbDI4oGQ1KX0Hx9VkMb+cmfIDHqVAYUiiHbzQUGLxo5x8mFPgUYFJ2
         jbUrHD3iDpuBJiwzG5GIsaFepdUE7tVt6VWtHv53boI2W70jMeU0gD+hC7ybpOHVyu+E
         Hm0EMg0OPdsSf1d0e+LTxEkrXOyuhVHeHpe9Ap7YMDy32cNDcyRk+UvFsRv7IBvrvrOJ
         Y0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=yiDaxjcqLPE8/iNf4E7/YUAx4589ZIIgXZyg+nhRE7A=;
        b=dQ+WMpFmhh+u+P32fRNF5DW/FHz87nszk3FV0mO7o4gquypGmCwNinWj9EBCzgrvOt
         LuBatCoYuWLvlRNfJk5SJtM4AOipOsK8H1aY+krYL6WGZIobtb73EXxq8H3GkrpC95bx
         dtzAHXhUfoHCOf4sMeBXAO4NbrWP16OHuJtlAflTMHeE1gNVIL9CcSpiTyO0GFMYrixZ
         /ZVNdwqK0a815KdUyk6o/Z0oFPnL2jr9HRkyAqewFIeFuQa0BfuEEGvVw+KQluWKmNTo
         eETA4J0PpbMNDl7otuIH/dg/0AUhlelyIDoee6NbFFeUr22+lcjBrosiq2ZVxdbNZ+oW
         HmOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c15-v6si772397qvj.141.2018.07.16.06.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff36r-0001II-8E
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:00:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36M-00013p-UC
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36J-0001yM-Mo
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48734 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36J-0001xE-HR; Mon, 16 Jul 2018 08:59:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDA49401EF09;
	Mon, 16 Jul 2018 12:59:38 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48AB01C589;
	Mon, 16 Jul 2018 12:59:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:18 +0200
Message-Id: <1531745974-17187-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:38 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 01/17] qom/object: Add a new function
 object_initialize_child()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CTXrQUOMkV0B

A lot of code is using the object_initialize() function followed by a call
to object_property_add_child() to add the newly initialized object as a child
of the current object. Both functions increase the reference counter of the
new object, but many spots that call these two functions then forget to drop
one of the superfluous references. So the newly created object is often not
cleaned up correctly when the parent is destroyed. In the worst case, this
can cause crashes, e.g. because device objects are not correctly removed from
their parent_bus.

Since this is a common pattern between many code spots, let's introduce a
new function that takes care of calling all three required initialization
functions, first object_initialize(), then object_property_add_child() and
finally object_unref(). And since the function does a similar job like
object_new_with_props(), also allow to set additional properties via
varargs, and use user_creatable_complete() to make sure that the functions
can be used similarly.

And while we're at object.h, also fix some copy-n-paste errors in the
comments there ("to store the area" --> "to store the error").

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qom/object.h | 45 +++++++++++++++++++++++++++++++++++++++++--
 qom/object.c         | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index f3d2308..f0b0bf3 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -749,6 +749,47 @@ int object_set_propv(Object *obj,
 void object_initialize(void *obj, size_t size, const char *typename);
 
 /**
+ * object_initialize_child:
+ * @parentobj: The parent object to add a property to
+ * @propname: The name of the property
+ * @childobj: A pointer to the memory to be used for the object.
+ * @size: The maximum size available at @childobj for the object.
+ * @type: The name of the type of the object to instantiate.
+ * @errp: If an error occurs, a pointer to an area to store the error
+ * @...: list of property names and values
+ *
+ * This function will initialize an object. The memory for the object should
+ * have already been allocated. The object will then be added as child property
+ * to a parent with object_property_add_child() function. The returned object
+ * has a reference count of 1 (for the "child<...>" property from the parent),
+ * so the object will be finalized automatically when the parent gets removed.
+ *
+ * The variadic parameters are a list of pairs of (propname, propvalue)
+ * strings. The propname of %NULL indicates the end of the property list.
+ * If the object implements the user creatable interface, the object will
+ * be marked complete once all the properties have been processed.
+ */
+void object_initialize_child(Object *parentobj, const char *propname,
+                             void *childobj, size_t size, const char *type,
+                             Error **errp, ...) QEMU_SENTINEL;
+
+/**
+ * object_initialize_childv:
+ * @parentobj: The parent object to add a property to
+ * @propname: The name of the property
+ * @childobj: A pointer to the memory to be used for the object.
+ * @size: The maximum size available at @childobj for the object.
+ * @type: The name of the type of the object to instantiate.
+ * @errp: If an error occurs, a pointer to an area to store the error
+ * @vargs: list of property names and values
+ *
+ * See object_initialize_child() for documentation.
+ */
+void object_initialize_childv(Object *parentobj, const char *propname,
+                              void *childobj, size_t size, const char *type,
+                              Error **errp, va_list vargs);
+
+/**
  * object_dynamic_cast:
  * @obj: The object to cast.
  * @typename: The @typename to cast to.
@@ -1382,7 +1423,7 @@ Object *object_resolve_path_component(Object *parent, const gchar *part);
  * @obj: the object to add a property to
  * @name: the name of the property
  * @child: the child object
- * @errp: if an error occurs, a pointer to an area to store the area
+ * @errp: if an error occurs, a pointer to an area to store the error
  *
  * Child properties form the composition tree.  All objects need to be a child
  * of another object.  Objects can only be a child of one object.
@@ -1420,7 +1461,7 @@ void object_property_allow_set_link(const Object *, const char *,
  * @child: a pointer to where the link object reference is stored
  * @check: callback to veto setting or NULL if the property is read-only
  * @flags: additional options for the link
- * @errp: if an error occurs, a pointer to an area to store the area
+ * @errp: if an error occurs, a pointer to an area to store the error
  *
  * Links establish relationships between objects.  Links are unidirectional
  * although two links can be combined to form a bidirectional relationship
diff --git a/qom/object.c b/qom/object.c
index 4609e34..75d1d48 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -392,6 +392,60 @@ void object_initialize(void *data, size_t size, const char *typename)
     object_initialize_with_type(data, size, type);
 }
 
+void object_initialize_child(Object *parentobj, const char *propname,
+                             void *childobj, size_t size, const char *type,
+                             Error **errp, ...)
+{
+    va_list vargs;
+
+    va_start(vargs, errp);
+    object_initialize_childv(parentobj, propname, childobj, size, type, errp,
+                             vargs);
+    va_end(vargs);
+}
+
+void object_initialize_childv(Object *parentobj, const char *propname,
+                              void *childobj, size_t size, const char *type,
+                              Error **errp, va_list vargs)
+{
+    Error *local_err = NULL;
+    Object *obj;
+
+    object_initialize(childobj, size, type);
+    obj = OBJECT(childobj);
+
+    object_set_propv(obj, &local_err, vargs);
+    if (local_err) {
+        goto out;
+    }
+
+    object_property_add_child(parentobj, propname, obj, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+    if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
+        user_creatable_complete(obj, &local_err);
+        if (local_err) {
+            object_unparent(obj);
+            goto out;
+        }
+    }
+
+    /*
+     * Since object_property_add_child added a reference to the child object,
+     * we can drop the reference added by object_initialize(), so the child
+     * property will own the only reference to the object.
+     */
+    object_unref(obj);
+
+out:
+    if (local_err) {
+        error_propagate(errp, local_err);
+        object_unref(obj);
+    }
+}
+
 static inline bool object_property_is_child(ObjectProperty *prop)
 {
     return strstart(prop->type, "child<", NULL);
-- 
1.8.3.1

