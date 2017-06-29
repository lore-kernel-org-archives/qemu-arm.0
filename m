Received: by 10.25.227.6 with SMTP id a6csp4219837lfh;
        Thu, 29 Jun 2017 04:14:49 -0700 (PDT)
X-Received: by 10.55.137.6 with SMTP id l6mr18827135qkd.83.1498734889073;
        Thu, 29 Jun 2017 04:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498734889; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7R/uXXE6NUgUpKsX0gZU0TuuH8RMQ4H8tgECD60wzqUiFaAelbtpAIdlWzeBAFYNZ
         EPFw0HF24JDD/gWe4yFOgEbeeexWh2SgI+3AY/Ti+2JS1ukQd2FhjqbSPvROeOJ/4Uus
         aGcMnbx6mR8o4fcXKbezz0KSFW01rfdZHpcU6w10iKefG5p5jYizeS/E2RD9z6KnENqt
         zcKVxavNxW5xwTUGp3ipLuiZwJg04sholb+G1J//xTgvmN7KTodwIAZs6UEfl08npUAr
         v4Gitz1qUDzi7ALOIl3vLUNPn3350ANSsiXLpa0sU2GbENjabsKc+mCgIxd8h25Bo8x+
         YxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=Fsa3k/WAPpgIHyfoHFP85fQWY3AvBCMHrsSHmiTzZx0=;
        b=i5LreoS9MWMn6dz+ocSBtNqMBRGlXUnFcLV/N6dweu2NzwC2E7KoB9i2rT3NrvzsKv
         altht8ShHKjKU+VeSdPwHx3o+yzERA9qz2R8kLRGvdQTT2lH4yDVV+PHvg8tEjbNXIte
         PkEkKM3egukj5ELmZ2lgRoN6TXJQcZ/jEmvp/RA73/z5AjlYaoYFgadjl9HB7f76JegG
         A8XT+mume0+uah7E5gYGsWVUd9RUojCw7dG3bTMBin+B9UfNxQdpbLKjVGyEcSTkS4IC
         484gZXWyQkWmfJRIeNq+jtAKxeAnK20gmYrOK9dVHdwanx7+DMobuahquKmIrT62pfBA
         8quw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 36si4578228qts.94.2017.06.29.04.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Jun 2017 04:14:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQXPK-0000RD-Ii
	for alex.bennee@linaro.org; Thu, 29 Jun 2017 07:14:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dQXPF-0000Qi-Gu
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 07:14:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dQXPB-0004SU-Gx
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 07:14:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dQXPB-0004SE-7E; Thu, 29 Jun 2017 07:14:37 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5BA3D648F;
	Thu, 29 Jun 2017 11:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B5BA3D648F
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B5BA3D648F
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DF5817978;
	Thu, 29 Jun 2017 11:14:26 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Jun 2017 13:14:23 +0200
Message-Id: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 29 Jun 2017 11:14:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] qom: enforce readonly nature of link's check
 callback
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
Cc: famz@redhat.com, mst@redhat.com, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, afaerber@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wcQ5F25wtHRM

link's check callback is supposed to verify/permit setting it,
however currently nothing restricts it from misusing it
and modifying target object from within.
Make sure that readonly semantics are checked by compiler
to prevent callback's misuse.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
Fam,
 it probably conflicts with yours DEFINE_PROP_LINK series,
 feel free to include this patch if you'll have to respin

---
 include/hw/qdev-properties.h | 3 ++-
 include/qom/object.h         | 6 +++---
 hw/core/qdev-properties.c    | 3 ++-
 hw/display/xlnx_dp.c         | 2 +-
 hw/ipmi/ipmi.c               | 2 +-
 hw/mem/pc-dimm.c             | 2 +-
 hw/misc/ivshmem.c            | 2 +-
 qom/object.c                 | 8 ++++----
 8 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 306bbab..6dfe16e 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -234,7 +234,8 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
  * This function should be used as the check() argument to
  * object_property_add_link().
  */
-void qdev_prop_allow_set_link_before_realize(Object *obj, const char *name,
+void qdev_prop_allow_set_link_before_realize(const Object *obj,
+                                             const char *name,
                                              Object *val, Error **errp);
 
 #endif
diff --git a/include/qom/object.h b/include/qom/object.h
index 5ecc2d1..5223692 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -788,7 +788,7 @@ ObjectClass *object_get_class(Object *obj);
  *
  * Returns: The QOM typename of @obj.
  */
-const char *object_get_typename(Object *obj);
+const char *object_get_typename(const Object *obj);
 
 /**
  * type_register_static:
@@ -1320,7 +1320,7 @@ typedef enum {
  * callback function.  It allows the link property to be set and never returns
  * an error.
  */
-void object_property_allow_set_link(Object *, const char *,
+void object_property_allow_set_link(const Object *, const char *,
                                     Object *, Error **);
 
 /**
@@ -1353,7 +1353,7 @@ void object_property_allow_set_link(Object *, const char *,
  */
 void object_property_add_link(Object *obj, const char *name,
                               const char *type, Object **child,
-                              void (*check)(Object *obj, const char *name,
+                              void (*check)(const Object *obj, const char *name,
                                             Object *val, Error **errp),
                               ObjectPropertyLinkFlags flags,
                               Error **errp);
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 2a82768..95e5fdb 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -25,7 +25,8 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
     }
 }
 
-void qdev_prop_allow_set_link_before_realize(Object *obj, const char *name,
+void qdev_prop_allow_set_link_before_realize(const Object *obj,
+                                             const char *name,
                                              Object *val, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index f43eb09..3ed81ff 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -515,7 +515,7 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
     s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;
 }
 
-static void xlnx_dp_set_dpdma(Object *obj, const char *name, Object *val,
+static void xlnx_dp_set_dpdma(const Object *obj, const char *name, Object *val,
                               Error **errp)
 {
     XlnxDPState *s = XLNX_DP(obj);
diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
index 5cf1caa..a2fd1eb 100644
--- a/hw/ipmi/ipmi.c
+++ b/hw/ipmi/ipmi.c
@@ -90,7 +90,7 @@ static TypeInfo ipmi_interface_type_info = {
     .class_init = ipmi_interface_class_init,
 };
 
-static void isa_ipmi_bmc_check(Object *obj, const char *name,
+static void isa_ipmi_bmc_check(const Object *obj, const char *name,
                                Object *val, Error **errp)
 {
     IPMIBmc *bmc = IPMI_BMC(val);
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 9e8dab0..380cb30 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -366,7 +366,7 @@ static void pc_dimm_get_size(Object *obj, Visitor *v, const char *name,
     visit_type_int(v, name, &value, errp);
 }
 
-static void pc_dimm_check_memdev_is_busy(Object *obj, const char *name,
+static void pc_dimm_check_memdev_is_busy(const Object *obj, const char *name,
                                       Object *val, Error **errp)
 {
     Error *local_err = NULL;
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index abeaf3d..e25016c 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -1005,7 +1005,7 @@ static const TypeInfo ivshmem_common_info = {
     .class_init    = ivshmem_common_class_init,
 };
 
-static void ivshmem_check_memdev_is_busy(Object *obj, const char *name,
+static void ivshmem_check_memdev_is_busy(const Object *obj, const char *name,
                                          Object *val, Error **errp)
 {
     if (host_memory_backend_is_mapped(MEMORY_BACKEND(val))) {
diff --git a/qom/object.c b/qom/object.c
index 7a05e35..a429e64 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -735,7 +735,7 @@ out:
     return ret;
 }
 
-const char *object_get_typename(Object *obj)
+const char *object_get_typename(const Object *obj)
 {
     return obj->class->type->name;
 }
@@ -1395,7 +1395,7 @@ out:
     g_free(type);
 }
 
-void object_property_allow_set_link(Object *obj, const char *name,
+void object_property_allow_set_link(const Object *obj, const char *name,
                                     Object *val, Error **errp)
 {
     /* Allow the link to be set, always */
@@ -1403,7 +1403,7 @@ void object_property_allow_set_link(Object *obj, const char *name,
 
 typedef struct {
     Object **child;
-    void (*check)(Object *, const char *, Object *, Error **);
+    void (*check)(const Object *, const char *, Object *, Error **);
     ObjectPropertyLinkFlags flags;
 } LinkProperty;
 
@@ -1519,7 +1519,7 @@ static void object_release_link_property(Object *obj, const char *name,
 
 void object_property_add_link(Object *obj, const char *name,
                               const char *type, Object **child,
-                              void (*check)(Object *, const char *,
+                              void (*check)(const Object *, const char *,
                                             Object *, Error **),
                               ObjectPropertyLinkFlags flags,
                               Error **errp)
-- 
2.7.4

