Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6313550wrg;
        Mon, 27 May 2019 04:50:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGPa/vlJ+6Y3yD+zkrY34vn7Sd6rO+JlPB6fVRkso7VIEYBiq3eyqNKCFoMdkHpji4Mt/v
X-Received: by 2002:ac8:2a63:: with SMTP id l32mr79358115qtl.117.1558957819932;
        Mon, 27 May 2019 04:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957819; cv=none;
        d=google.com; s=arc-20160816;
        b=AZcJI9ApInqCwRDMDxHJsh7wIxXtNKW5In6n0/UCUT7NFHua9JCpv2zg/iYfZDbIdx
         vE88AUxNriKgDMepjmTmLc0ghnp+RpsG7s8cbVVuYZJfdyztM/2+z6v3F3P3kSbjFby+
         lpBXLDWV2Vj3MJUrxI9c9xDE6/xRRJIcHa/ziWuzTYJNpWLBfu3rH155N430MQKCJpLm
         YGxOC9phYrxazBMOG6OTqV1pjqj9FiGaUx258eluJrrL+0EoQGmkjgU5JAY1HtwOSs9a
         IWi04Grjynwuj8vqcL8F4uFyLokAuUqmHp4fPodO4aTP++oIsqAu+99no+kK6jZCL/um
         spUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=r7jJt4TDVuU2kIrJMj12PDXrn3fgZKiOUfN58AJprnI=;
        b=jbMAHWtunctLvmMWDR6cv/p3FhEzQ8vXaPtNZrJDpaY8tKpHnAY76kcYBYJWE5NdsL
         utphbE15b9l+PLxOxY8216Oc7RV39exCVLDnYNtvH8CRDOkSV9NjsSClhl3pSATURcjj
         ya56HdHCGpgD3BACZmL9vY9ygbvszWPh5Mg3AFv6PzYpESi07vzAFg1fASygN0MRwgYw
         0NER1UdmzoP8Nw/B3dp+DVWvr6yUaPRLaweR9+CjSMAeJ9bu1+ePALBeJk0WNzdU2Ln9
         24kN2Pp9eGqMo+nCwEl87mQmOueaV2CsvSDDehiCY4Uqv2EYwvEgh5Bv0+4KYeS3xlXH
         3KeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si1291369qth.184.2019.05.27.04.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:50:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVE8x-0000Cg-Co
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:50:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2T-0003dt-HS
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:43:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2R-0003jp-UP
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:43:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE2R-0003jK-KU; Mon, 27 May 2019 07:43:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB994C057E65;
	Mon, 27 May 2019 11:43:34 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D08CA5D97A;
	Mon, 27 May 2019 11:43:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:46 +0200
Message-Id: <20190527114203.2762-11-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 27 May 2019 11:43:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 10/27] memory: Add IOMMUConfigNotifier
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qm6o20dRMiCX

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
 hw/vfio/common.c      | 15 ++++++++-----
 include/exec/memory.h | 52 ++++++++++++++++++++++++++++++++++++++++++-
 memory.c              | 25 +++++++++++++++++++++
 3 files changed, 86 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4183772618..75fb568f95 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -720,11 +720,16 @@ static void vfio_listener_region_del(MemoryListener=
 *listener,
         VFIOGuestIOMMU *giommu;
=20
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
-            if (MEMORY_REGION(giommu->iommu) =3D=3D section->mr &&
-                is_iommu_iotlb_notifier(&giommu->n) &&
-                giommu->n.iotlb_notifier.start =3D=3D section->offset_wi=
thin_region) {
-                memory_region_unregister_iommu_notifier(section->mr,
-                                                        &giommu->n);
+            if (MEMORY_REGION(giommu->iommu) =3D=3D section->mr) {
+                if (is_iommu_iotlb_notifier(&giommu->n) &&
+                    giommu->n.iotlb_notifier.start =3D=3D
+                        section->offset_within_region) {
+                    memory_region_unregister_iommu_notifier(section->mr,
+                                                            &giommu->n);
+                } else {
+                    memory_region_unregister_iommu_notifier(section->mr,
+                                                            &giommu->n);
+                }
                 QLIST_REMOVE(giommu, giommu_next);
                 g_free(giommu);
                 break;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 42d10b29ef..701cb83367 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -26,6 +26,9 @@
 #include "qom/object.h"
 #include "qemu/rcu.h"
 #include "hw/qdev-core.h"
+#ifdef CONFIG_LINUX
+#include <linux/iommu.h>
+#endif
=20
 #define RAM_ADDR_INVALID (~(ram_addr_t)0)
=20
@@ -74,6 +77,14 @@ struct IOMMUTLBEntry {
     IOMMUAccessFlags perm;
 };
=20
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
@@ -84,13 +95,18 @@ typedef enum {
     IOMMU_NOTIFIER_IOTLB_UNMAP =3D 0x1,
     /* Notify entry changes (newly created entries) */
     IOMMU_NOTIFIER_IOTLB_MAP =3D 0x2,
+    /* Notify stage 1 config changes */
+    IOMMU_NOTIFIER_CONFIG_PASID =3D 0x4,
 } IOMMUNotifierFlag;
=20
 #define IOMMU_NOTIFIER_IOTLB_ALL (IOMMU_NOTIFIER_IOTLB_MAP | IOMMU_NOTIF=
IER_IOTLB_UNMAP)
+#define IOMMU_NOTIFIER_CONFIG_ALL (IOMMU_NOTIFIER_CONFIG_PASID)
=20
 struct IOMMUNotifier;
 typedef void (*IOMMUNotify)(struct IOMMUNotifier *notifier,
                             IOMMUTLBEntry *data);
+typedef void (*IOMMUConfigNotify)(struct IOMMUNotifier *notifier,
+                                  IOMMUConfig *cfg);
=20
 typedef struct IOMMUIOLTBNotifier {
     IOMMUNotify notify;
@@ -99,10 +115,15 @@ typedef struct IOMMUIOLTBNotifier {
     hwaddr end;
 } IOMMUIOLTBNotifier;
=20
+typedef struct IOMMUConfigNotifier {
+    IOMMUConfigNotify notify;
+} IOMMUConfigNotifier;
+
 struct IOMMUNotifier {
     IOMMUNotifierFlag notifier_flags;
     union {
         IOMMUIOLTBNotifier iotlb_notifier;
+        IOMMUConfigNotifier config_notifier;
     };
     int iommu_idx;
     QLIST_ENTRY(IOMMUNotifier) node;
@@ -147,6 +168,16 @@ static inline void iommu_iotlb_notifier_init(IOMMUNo=
tifier *n, IOMMUNotify fn,
     n->iommu_idx =3D iommu_idx;
 }
=20
+static inline void iommu_config_notifier_init(IOMMUNotifier *n,
+                                              IOMMUConfigNotify fn,
+                                              IOMMUNotifierFlag flags,
+                                              int iommu_idx)
+{
+    n->notifier_flags =3D flags;
+    n->iommu_idx =3D iommu_idx;
+    n->config_notifier.notify =3D fn;
+}
+
 /*
  * Memory region callbacks
  */
@@ -647,6 +678,12 @@ static inline bool is_iommu_iotlb_notifier(IOMMUNoti=
fier *n)
 {
     return n->notifier_flags & IOMMU_NOTIFIER_IOTLB_ALL;
 }
+
+static inline bool is_iommu_config_notifier(IOMMUNotifier *n)
+{
+    return n->notifier_flags & IOMMU_NOTIFIER_CONFIG_ALL;
+}
+
 #ifdef CONFIG_POSIX
=20
 /**
@@ -1054,6 +1091,19 @@ void memory_region_iotlb_notify_iommu(IOMMUMemoryR=
egion *iommu_mr,
                                       int iommu_idx,
                                       IOMMUTLBEntry entry);
=20
+/**
+ * memory_region_config_notify_iommu: notify a change in a translation
+ * configuration structure.
+ * @iommu_mr: the memory region that was changed
+ * @iommu_idx: the IOMMU index for the translation table which has chang=
ed
+ * @flag: config change type
+ * @config: new guest config
+ */
+void memory_region_config_notify_iommu(IOMMUMemoryRegion *iommu_mr,
+                                       int iommu_idx,
+                                       IOMMUNotifierFlag flag,
+                                       IOMMUConfig *config);
+
 /**
  * memory_region_iotlb_notify_one: notify a change in an IOMMU translati=
on
  *                                 entry to a single notifier
@@ -1071,7 +1121,7 @@ void memory_region_iotlb_notify_one(IOMMUNotifier *=
notifier,
=20
 /**
  * memory_region_register_iommu_notifier: register a notifier for change=
s to
- * IOMMU translation entries.
+ * IOMMU translation entries or translation config settings.
  *
  * @mr: the memory region to observe
  * @n: the IOMMUNotifier to be added; the notify callback receives a
diff --git a/memory.c b/memory.c
index 924396a3ce..d90d8ea67e 100644
--- a/memory.c
+++ b/memory.c
@@ -1935,6 +1935,13 @@ void memory_region_unregister_iommu_notifier(Memor=
yRegion *mr,
     memory_region_update_iommu_notify_flags(iommu_mr);
 }
=20
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
@@ -1977,6 +1984,24 @@ void memory_region_iotlb_notify_iommu(IOMMUMemoryR=
egion *iommu_mr,
     }
 }
=20
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
+        if (iommu_notifier->iommu_idx =3D=3D iommu_idx &&
+            is_iommu_config_notifier(iommu_notifier) &&
+            iommu_notifier->notifier_flags =3D=3D flag) {
+            memory_region_config_notify_one(iommu_notifier, config);
+        }
+    }
+}
+
 int memory_region_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
                                  enum IOMMUMemoryRegionAttr attr,
                                  void *data)
--=20
2.20.1

