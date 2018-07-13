Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp425280wrq;
        Fri, 13 Jul 2018 01:28:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeJAlx1vAZh22e1AN3nVKkpkN+Im62XHgXRDM22GXL3W3RONy7W3wPtJh1uSuIuHjr7JnRb
X-Received: by 2002:a37:a0c1:: with SMTP id j184-v6mr4642830qke.126.1531470497330;
        Fri, 13 Jul 2018 01:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470497; cv=none;
        d=google.com; s=arc-20160816;
        b=y5u0tcEqsoezawgZFN43C3KvYuFt0slwsNbqd6uE8ZbRQgQVPqK4g72kjlPhz1o5gF
         irX0DTtB6jlKET4ZEe1qHlhoDYShtQi0TrRshAGAm6qdJ4u8kbM/e9LCMIkdHaXJIozh
         eaBaO0yzBzI6nHxgZXCntoI12nqxJJ/y6F+XdSMv/6hKujvASil5jH8bBMXzPY1YadcO
         4PLOrhKyeLQKnjUCwz/GdW/HaS67zZXAcTWCK9qN4Eq5bzBCUz0glkwgjBRw7n/hmax3
         vYXEmAb+d73haxAJA1gctkuZr0u9an9BOHUHnuX6mSGKDxZ2mos473yUbCRcnvYZkuQ/
         RLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+Xsty1ArCxX6RLKp9t11W376DLre41ShSJKlddjLgXo=;
        b=TDhUkAMD+Lgb2MYknN1bo9miI8Qunl/v4mUWB8r0sXxTXILF9/BnP3rpPoGM8GdWcJ
         l64TIhmNlj5AP9R3HA3bYmjg926mIA/8L18GJvSHcBJmK+PJBsXTMIlOusSuUMcSyBaH
         zD3ax3GxBqQIn1kU5DEdAG2CxWq6gjWFdRF0YB1sZbAVJYaJUC888P4uVRfLMNiPogYM
         sOj2AeBbWjcw907PxcVYUOP2PqkP6TaMOZTAfarzLogmo796ckdTrNqgNsxAfGWyR6j/
         f7YfRAYWPr5KiFeDXDOyxzwBcH7TcaxZVAWLiRIO7RGrVWwH69QAsIsKuTvnKHfUB4+U
         egxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10-v6si2040415qtw.366.2018.07.13.01.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:28:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtR2-0002H8-Mj
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:28:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQe-00028o-PO
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:27:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQd-00049l-G4
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:27:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54408 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQd-00049L-Ak; Fri, 13 Jul 2018 04:27:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3ABB4075742;
	Fri, 13 Jul 2018 08:27:50 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1D12026D6B;
	Fri, 13 Jul 2018 08:27:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:29 +0200
Message-Id: <1531470464-21522-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 13 Jul 2018 08:27:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 13 Jul 2018 08:27:50 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 01/16] qom/object: Add a new function
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
X-TUID: 22nFDwsfAFbj

A lot of code is using the object_initialize() function followed by a call
to object_property_add_child() to add the newly initialized object as a child
of the current object. Both functions increase the reference counter of the
new object, but many spots that call these two functions then forget to drop
one of the superfluous references. So the newly created object is often not
cleaned up correctly when the parent is destroyed. In the worst case, this
can cause crashes, e.g. because device objects are not correctly removed from
their parent_bus.

Since this is a common pattern between many code spots, let's introdcue a
new function that takes care of calling all three required initialization
functions, first object_initialize(), then object_property_add_child() and
finally object_unref().

And while we're at object.h, also fix some copy-n-paste errors in the
comments there ("to store the area" --> "to store the error").

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qom/object.h | 23 +++++++++++++++++++++--
 qom/object.c         | 15 +++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index f3d2308..3362db0 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -749,6 +749,25 @@ int object_set_propv(Object *obj,
 void object_initialize(void *obj, size_t size, const char *typename);
 
 /**
+ * object_initialize_child:
+ * @parentobj: The parent object to add a property to
+ * @propname: The name of the property
+ * @childobj: A pointer to the memory to be used for the object.
+ * @size: The maximum size available at @obj for the object.
+ * @type: The name of the type of the object to instantiate.
+ * @errp: If an error occurs, a pointer to an area to store the error
+ *
+ * This function will initialize an object. The memory for the object should
+ * have already been allocated. The object will then be added as child property
+ * to a parent with object_property_add_child() function. The returned object
+ * has a reference count of 1 (for the "child<...>" property from the parent),
+ * so the object will get finalized automatically when the parent gets removed.
+ */
+void object_initialize_child(Object *parentobj, const char *propname,
+                             void *childobj, size_t size, const char *type,
+                             Error **errp);
+
+/**
  * object_dynamic_cast:
  * @obj: The object to cast.
  * @typename: The @typename to cast to.
@@ -1382,7 +1401,7 @@ Object *object_resolve_path_component(Object *parent, const gchar *part);
  * @obj: the object to add a property to
  * @name: the name of the property
  * @child: the child object
- * @errp: if an error occurs, a pointer to an area to store the area
+ * @errp: if an error occurs, a pointer to an area to store the error
  *
  * Child properties form the composition tree.  All objects need to be a child
  * of another object.  Objects can only be a child of one object.
@@ -1420,7 +1439,7 @@ void object_property_allow_set_link(const Object *, const char *,
  * @child: a pointer to where the link object reference is stored
  * @check: callback to veto setting or NULL if the property is read-only
  * @flags: additional options for the link
- * @errp: if an error occurs, a pointer to an area to store the area
+ * @errp: if an error occurs, a pointer to an area to store the error
  *
  * Links establish relationships between objects.  Links are unidirectional
  * although two links can be combined to form a bidirectional relationship
diff --git a/qom/object.c b/qom/object.c
index 4609e34..7be7638 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -392,6 +392,21 @@ void object_initialize(void *data, size_t size, const char *typename)
     object_initialize_with_type(data, size, type);
 }
 
+void object_initialize_child(Object *parentobj, const char *propname,
+                             void *childobj, size_t size, const char *type,
+                             Error **errp)
+{
+    object_initialize(childobj, size, type);
+    object_property_add_child(parentobj, propname, OBJECT(childobj), errp);
+    /*
+     * Since object_property_add_child added a reference to the child object,
+     * we can drop the reference added by object_initialize(), so the child
+     * property will own the only reference to the object.
+     */
+    object_unref(OBJECT(childobj));
+}
+
+
 static inline bool object_property_is_child(ObjectProperty *prop)
 {
     return strstart(prop->type, "child<", NULL);
-- 
1.8.3.1

