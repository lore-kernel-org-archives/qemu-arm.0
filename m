Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1504737wrq;
        Thu, 12 Jul 2018 08:31:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdpUuLvgTu/9Lif6kQ9RRHbFWQLS+pSDCk6cBVl1ZUV4P60ddwlgo6uxThgYuBwtlFl79Lx
X-Received: by 2002:a0c:90e1:: with SMTP id p88-v6mr2873190qvp.145.1531409488574;
        Thu, 12 Jul 2018 08:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531409488; cv=none;
        d=google.com; s=arc-20160816;
        b=DmE9uRT91l4/cx62GNwVNX6CHzjOb09lAHBCBJBw+dCedLlS+BpeohsbEJvHhc3FHD
         FJYZyKZXZXfYHub8zyXERnX0FaUYQH1eySU5LIUzAByuxY/UqcskxJPB0ITu+7mRhCNL
         vNx0m6v5cks/domWMSDI1A0SRIhiQLFRakjosNel4f22KtPQsKKrRpamRh3M8YmSFOpU
         nxDbii35VRmMIQZrVuzMS4Br+OpotAdfMRyxLElV4K4OtAek5rSGTVaL18qFaH7nPwR+
         fSpw5pGf9VUunTgNRmahWcMlWUbB7zpxS9IBMxCYICOEe1Wzb2dlG7eznYznxqoUiRkd
         jO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=QLeMqWLjNhbf4FWiHFxSp/RjR/ejH5EYkFq1yXnCcqc=;
        b=e5uUT+tUqeIaObWoyMTHBqMZkokC971kk4as4ufMxncjAfmRLvw6wPZquWOXFHltH3
         h7rItYwuTZoPiSl6SDKhirreIoJraM0CxGSkgQNNw5w645qJ7rp/oIIdbukapsOELtCV
         Ek/zDf5/WUfqZKJNbRf7M5pXouin8U4nV/MA94t3YAMiUXFtQNTL7rWpIqRR4fc/NiD7
         nauVWJfBpCArIhHoL4QUW59DwdlO6c5EhVdjuu6VZiBuXsN/JCdkkcNvWDBJLfPyjnaU
         ysXVvkThwxUCCbtO1leIe4Zbba9eXO3WG0+Hw0pBEVELScIfkUm05Oz4c4QqxU/SFrTG
         RiXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m27-v6si3450075qtm.216.2018.07.12.08.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddZ1-0005KR-Vy
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:31:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYk-0005Fs-GF
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYi-0007oG-Pv
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38062 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fddYi-0007n5-LE; Thu, 12 Jul 2018 11:31:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4231EC32E;
	Thu, 12 Jul 2018 15:31:08 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 956A31C66C;
	Thu, 12 Jul 2018 15:31:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jul 2018 17:30:59 +0200
Message-Id: <1531409463-3843-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1531409463-3843-1-git-send-email-thuth@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 12 Jul 2018 15:31:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 12 Jul 2018 15:31:08 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 1/5] qom/object: Add a new function
 object_initialize_as_child()
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
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kbFQOp23KpWq

A lot of code is using the object_initialize() function followed by a call to
object_property_add_child() to add the newly initialized object as a child of
the current object. Both functions increase the reference counter of the new
object, but many spots that call these two functions then forget to drop one
of the superfluous references. So the newly created object is often not cleaned
up correctly when the parent is destroyed. In the worst case, this can cause
crashes, e.g. because device objects are not correctly removed from their
parent_bus.
Since this is a common pattern between many code spots, let's introdcue a
new function that takes care of calling all three required initialization
functions, first object_initialize(), then object_property_add_child() and
finally object_unref().

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qom/object.h | 19 +++++++++++++++++++
 qom/object.c         | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index f3d2308..c1b254c 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -749,6 +749,25 @@ int object_set_propv(Object *obj,
 void object_initialize(void *obj, size_t size, const char *typename);
 
 /**
+ * object_initialize_as_child:
+ * @parentobj: The parent object to add a property to
+ * @propname: The name of the property
+ * @childobj: A pointer to the memory to be used for the object.
+ * @size: The maximum size available at @obj for the object.
+ * @type: The name of the type of the object to instantiate.
+ * @errp: If an error occurs, a pointer to an area to store the area
+ *
+ * This function will initialize an object. The memory for the object should
+ * have already been allocated. The object will then be added as child property
+ * to a parent with object_property_add_child() function. The returned object
+ * has a reference count of 1, and will be finalized when the last reference is
+ * dropped.
+ */
+void object_initialize_as_child(Object *parentobj, const char *propname,
+                                void *childobj, size_t size, const char *type,
+                                Error **errp);
+
+/**
  * object_dynamic_cast:
  * @obj: The object to cast.
  * @typename: The @typename to cast to.
diff --git a/qom/object.c b/qom/object.c
index 4609e34..de2ded0 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -392,6 +392,20 @@ void object_initialize(void *data, size_t size, const char *typename)
     object_initialize_with_type(data, size, type);
 }
 
+void object_initialize_as_child(Object *parentobj, const char *propname,
+                                void *childobj, size_t size, const char *type,
+                                Error **errp)
+{
+    object_initialize(childobj, size, type);
+    object_property_add_child(parentobj, propname, OBJECT(childobj), errp);
+    /*
+     * Since object_property_add_child added a reference to the child object,
+     * we can drop the initial reference from object_initialize now.
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

