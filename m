Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2866407wrd;
        Fri, 21 Sep 2018 01:35:57 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdbri/jlAwgrT23i4ckomnzPBl/Bgma/yJFB79ijg8AXwn9tEvjxLe7+dHOMMtqeaQ73vpPZ
X-Received: by 2002:a37:188e:: with SMTP id 14-v6mr4818391qky.83.1537518957707;
        Fri, 21 Sep 2018 01:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518957; cv=none;
        d=google.com; s=arc-20160816;
        b=iwM0DPyTkFOmfGM+JB7uoaQxXbcC/3pTRXJhH4gf0OiUy70MGZtZOTUHohKO36kULY
         fGXPggPCTC2mfE9OB64VXr6TILgq1OCeD4a0YX77c0F2UbmCEKq1xoBuR+hISE7Dav/8
         v+mWRUDjoBxnkkJumGBlun5Ru4lR7dX6yFqu5xEhv/QWfjVn5Fb9Dp5ugrzdfxr7/gDq
         OSuK1NJTdKBsJUgTtNk950crS0gKCKjlZBGymjOMAZBnw+XonWV9lkspE0NKItjLCqMe
         eFwO86WRdydPo2d+JI8rQ2w/Uz14KWyeriTbPtES3LYMexkqMIWlvPNqIFbN4QvOgb/X
         AyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=TvwTnowSbuNgDiN+wy94armFgbJrGn2CDsiMY3sC6Mg=;
        b=GvlzVpgIKeC53xFUCheoDwfDT+ehuTOIv6zUWFH88EmPQ2DvF4jPKX1SQQ9gwktf6v
         blsz5SkHrIRSmD72WS4XlgFn+IALydqKfZA1gmPuClxnsiOf93MOAkWOmEbjNZc7yHLI
         T5TSV+146p09gEmKIi9xVgg16DSJ0nB4vK4w+GORPDNtgeuBNp4eXLdJhuIBG90SM9Hj
         VpLX7ygSPO+l+V9FWTHEQS7SNp6uPobF9FA7kaCBBT6x0zRwcvqhyx8d3Kce0req3ABb
         ySfu3+VY6MxPNPNy+Pq2Zr54z2GckyCTcYYQhFnEMTGnJdd5j3ooOsloK7RnA+/63G9/
         PkSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64-v6si168305qkc.44.2018.09.21.01.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gur-0002yT-6p
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:35:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GfO-0004RM-Hk
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GfL-00046l-BF
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GfL-00045n-2o; Fri, 21 Sep 2018 04:19:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57C7E30832EF;
	Fri, 21 Sep 2018 08:19:54 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 109017D665;
	Fri, 21 Sep 2018 08:19:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:02 +0200
Message-Id: <20180921081819.9203-12-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 21 Sep 2018 08:19:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 11/28] memory: Add IOMMUConfigNotifier
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M6UtqftoL2Ov

With this patch, an IOMMUNotifier can now be either
an IOTLB notifier or a config notifier. A config notifier
is supposed to be called on guest translation config change.
This gives host a chance to update the physical IOMMU
configuration so that is consistent with the guest view.

The notifier is passed an IOMMUConfig. The first type of
configuration introduced here consists in the PASID
configuration.

We introduce the associated helpers, iommu_config_notifier_init,
memory_region_config_notify_iommu

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- use pasid_table config
- pass IOMMUNotifierFlag flags to iommu_config_notifier_init
  to prepare for other config flags
- Introduce IOMMUConfig
- s/IOMMU_NOTIFIER_S1_CFG/IOMMU_NOTIFIER_PASID_CFG
- remove unused IOMMUStage1ConfigType
---
 hw/vfio/common.c      | 14 +++++++---
 include/exec/memory.h | 62 +++++++++++++++++++++++++++++++++++++++++--
 memory.c              | 34 ++++++++++++++++++++++--
 3 files changed, 102 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 19dfc279d6..5dcb502f42 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -624,10 +624,16 @@ static void vfio_listener_region_del(MemoryListener *listener,
         VFIOGuestIOMMU *giommu;
 
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
-            if (MEMORY_REGION(giommu->iommu) == section->mr &&
-                giommu->n.iotlb_notifier.start == section->offset_within_region) {
-                memory_region_unregister_iommu_notifier(section->mr,
-                                                        &giommu->n);
+            if (MEMORY_REGION(giommu->iommu) == section->mr) {
+                if (is_iommu_iotlb_notifier(&giommu->n) &&
+                    giommu->n.iotlb_notifier.start ==
+                        section->offset_within_region) {
+                    memory_region_unregister_iommu_notifier(section->mr,
+                                                            &giommu->n);
+                } else if (is_iommu_config_notifier(&giommu->n)) {
+                    memory_region_unregister_iommu_notifier(section->mr,
+                                                            &giommu->n);
+                }
                 QLIST_REMOVE(giommu, giommu_next);
                 g_free(giommu);
                 break;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5ef9bf6d21..d4486d4e6b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -26,6 +26,9 @@
 #include "qom/object.h"
 #include "qemu/rcu.h"
 #include "hw/qdev-core.h"
+#ifdef CONFIG_LINUX
+#include <linux/iommu.h>
+#endif
 
 #define RAM_ADDR_INVALID (~(ram_addr_t)0)
 
@@ -74,6 +77,14 @@ struct IOMMUTLBEntry {
     IOMMUAccessFlags perm;
 };
 
+typedef struct IOMMUConfig {
+    union {
+#ifdef __linux__
+        struct iommu_pasid_table_config pasid_cfg;
+#endif
+          };
+} IOMMUConfig;
+
 /*
  * Bitmap for different IOMMUNotifier capabilities. Each notifier can
  * register with one or multiple IOMMU Notifier capability bit(s).
@@ -84,13 +95,19 @@ typedef enum {
     IOMMU_NOTIFIER_UNMAP = 0x1,
     /* Notify entry changes (newly created entries) */
     IOMMU_NOTIFIER_MAP = 0x2,
+    /* Notify stage 1 config changes */
+    IOMMU_NOTIFIER_PASID_CFG = 0x4,
 } IOMMUNotifierFlag;
 
 #define IOMMU_NOTIFIER_IOTLB_ALL (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
+#define IOMMU_NOTIFIER_CONFIG_ALL (IOMMU_NOTIFIER_PASID_CFG)
 
 struct IOMMUNotifier;
+struct IOMMUConfig;
 typedef void (*IOMMUNotify)(struct IOMMUNotifier *notifier,
                             IOMMUTLBEntry *data);
+typedef void (*IOMMUConfigNotify)(struct IOMMUNotifier *notifier,
+                                  IOMMUConfig *cfg);
 
 typedef struct IOMMUIOLTBNotifier {
     IOMMUNotify notify;
@@ -99,9 +116,16 @@ typedef struct IOMMUIOLTBNotifier {
     hwaddr end;
 } IOMMUIOLTBNotifier;
 
+typedef struct IOMMUConfigNotifier {
+    IOMMUConfigNotify notify;
+} IOMMUConfigNotifier;
+
 struct IOMMUNotifier {
     IOMMUNotifierFlag notifier_flags;
-    IOMMUIOLTBNotifier iotlb_notifier;
+    union {
+        IOMMUIOLTBNotifier iotlb_notifier;
+        IOMMUConfigNotifier config_notifier;
+    };
     int iommu_idx;
     QLIST_ENTRY(IOMMUNotifier) node;
 };
@@ -143,6 +167,16 @@ static inline void iommu_iotlb_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
     n->iommu_idx = iommu_idx;
 }
 
+static inline void iommu_config_notifier_init(IOMMUNotifier *n,
+                                              IOMMUConfigNotify fn,
+                                              IOMMUNotifierFlag flags,
+                                              int iommu_idx)
+{
+    n->notifier_flags = flags;
+    n->iommu_idx = iommu_idx;
+    n->config_notifier.notify = fn;
+}
+
 /*
  * Memory region callbacks
  */
@@ -639,6 +673,17 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
                                                        uint64_t length,
                                                        void *host),
                                        Error **errp);
+
+static inline bool is_iommu_iotlb_notifier(IOMMUNotifier *n)
+{
+    return n->notifier_flags & IOMMU_NOTIFIER_IOTLB_ALL;
+}
+
+static inline bool is_iommu_config_notifier(IOMMUNotifier *n)
+{
+    return n->notifier_flags & IOMMU_NOTIFIER_CONFIG_ALL;
+}
+
 #ifdef __linux__
 
 /**
@@ -1045,6 +1090,19 @@ void memory_region_iotlb_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                       int iommu_idx,
                                       IOMMUTLBEntry entry);
 
+/**
+ * memory_region_config_notify_iommu: notify a change in a translation
+ * configuration structure.
+ * @iommu_mr: the memory region that was changed
+ * @iommu_idx: the IOMMU index for the translation table which has changed
+ * @flag: config change type
+ * @config: new guest config
+ */
+void memory_region_config_notify_iommu(IOMMUMemoryRegion *iommu_mr,
+                                       int iommu_idx,
+                                       IOMMUNotifierFlag flag,
+                                       IOMMUConfig *config);
+
 /**
  * memory_region_iotlb_notify_one: notify a change in an IOMMU translation
  *                                 entry to a single notifier
@@ -1062,7 +1120,7 @@ void memory_region_iotlb_notify_one(IOMMUNotifier *notifier,
 
 /**
  * memory_region_register_iommu_notifier: register a notifier for changes to
- * IOMMU translation entries.
+ * IOMMU translation entries or translation config settings.
  *
  * @mr: the memory region to observe
  * @n: the IOMMUNotifier to be added; the notify callback receives a
diff --git a/memory.c b/memory.c
index 8ee5cbdbad..2c320bc14b 100644
--- a/memory.c
+++ b/memory.c
@@ -49,6 +49,8 @@ static GHashTable *flat_views;
 
 typedef struct AddrRange AddrRange;
 
+struct iommu_pasid_table_config;
+
 /*
  * Note that signed integers are needed for negative offsetting in aliases
  * (large MemoryRegion::alias_offset).
@@ -1800,7 +1802,9 @@ void memory_region_register_iommu_notifier(MemoryRegion *mr,
     /* We need to register for at least one bitfield */
     iommu_mr = IOMMU_MEMORY_REGION(mr);
     assert(n->notifier_flags != IOMMU_NOTIFIER_NONE);
-    assert(n->iotlb_notifier.start <= n->iotlb_notifier.end);
+    if (is_iommu_iotlb_notifier(n)) {
+        assert(n->iotlb_notifier.start <= n->iotlb_notifier.end);
+    }
     assert(n->iommu_idx >= 0 &&
            n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
 
@@ -1870,6 +1874,13 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
     memory_region_update_iommu_notify_flags(iommu_mr);
 }
 
+static void
+memory_region_config_notify_one(IOMMUNotifier *notifier,
+                                IOMMUConfig *cfg)
+{
+    notifier->config_notifier.notify(notifier, cfg);
+}
+
 void memory_region_iotlb_notify_one(IOMMUNotifier *notifier,
                                     IOMMUTLBEntry *entry)
 {
@@ -1904,12 +1915,31 @@ void memory_region_iotlb_notify_iommu(IOMMUMemoryRegion *iommu_mr,
     assert(memory_region_is_iommu(MEMORY_REGION(iommu_mr)));
 
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
-        if (iommu_notifier->iommu_idx == iommu_idx) {
+        if (iommu_notifier->iommu_idx == iommu_idx &&
+            is_iommu_iotlb_notifier(iommu_notifier)) {
             memory_region_iotlb_notify_one(iommu_notifier, &entry);
         }
     }
 }
 
+void memory_region_config_notify_iommu(IOMMUMemoryRegion *iommu_mr,
+                                       int iommu_idx,
+                                       IOMMUNotifierFlag flag,
+                                       IOMMUConfig *config)
+{
+    IOMMUNotifier *iommu_notifier;
+
+    assert(memory_region_is_iommu(MEMORY_REGION(iommu_mr)));
+
+    IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
+        if (iommu_notifier->iommu_idx == iommu_idx &&
+            is_iommu_config_notifier(iommu_notifier) &&
+            iommu_notifier->notifier_flags == flag) {
+            memory_region_config_notify_one(iommu_notifier, config);
+        }
+    }
+}
+
 int memory_region_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
                                  enum IOMMUMemoryRegionAttr attr,
                                  void *data)
-- 
2.17.1

