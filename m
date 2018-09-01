Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp621900wrd;
        Sat, 1 Sep 2018 07:28:58 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZzz5sdnGgaEVobUYIEhJVaWiPt/IGo26o6/xXAaNaDLgdc2IP3SBP3XLNvt1IGPALcdfXw
X-Received: by 2002:a37:35cb:: with SMTP id c194-v6mr18795188qka.352.1535812138336;
        Sat, 01 Sep 2018 07:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812138; cv=none;
        d=google.com; s=arc-20160816;
        b=0qvgqMYVf0MwZuEM5V6WV9WaP9BQEfd0HKJmxBYB0cHpyOwcf85GQNqwAfgljK/eic
         QCEMLu/1Bkox10+itj1wpNp6eMveGljLBx0XLTYptibiIc0UL4J4qDwsuaOedfarVkTj
         VLfLK2eb1PmVLEvr2XLI+19I0Vk+lhOlNAKwZJ+M7BfWr8jLk5xC617up3Xpdf5rulHu
         4evM2rYt5kQNe1aJeV42iK/5MrriRS4FTfd50+fpts/SOkgzQAANjLIXCFupiccOjYpH
         2RVzE/GRbbuG5NH5JZw0aGvvuc8IgE/TB/m5xHXwYzBNJWtTV0pntIIA04RCUpyw3Hmj
         DY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=zTCy4xA+je6L2YLvXIXYk1YNwhqVeaETE7NNmKWRt00=;
        b=0WiRZ38+E9puGqYVRHvBEaPZVwygrfay/3fSJxBncRTWequO5466wnU3lao52XBICK
         qetyzdyptFP2czxRkZmt1p51y06Ksrx67T2890/HHZ+m+HcUBAke78w44Wa+7DucuRE7
         2/PwLlAzDRboU1EZ92p2gio6Nw1wBXfZNEfXgOBcGjUWWgulmK/o1Tny9iwiu52QZS/j
         Wf+ioWQ1g9XvMKcMvJJ/cqB1+i3je/hFwiXzKq0cDXr9ZK/wBLU5LC3MPK5KOaSJu8u0
         GEv251yvDavMeywLLGzKXHwiFvfq4AEdyroJgc80zDAOIKJZ9sCXiDWsDAQwhNz5oUxV
         h9sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c24-v6si4349225qtm.92.2018.09.01.07.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6tV-0000Ja-Pa
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:28:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qM-0005sK-FV
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oq-0005mP-3v
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:24:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54276 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6ok-0005hi-KR; Sat, 01 Sep 2018 10:24:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AABC402347E;
	Sat,  1 Sep 2018 14:24:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C7F72166B41;
	Sat,  1 Sep 2018 14:23:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:23:02 +0200
Message-Id: <20180901142312.11662-11-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Sat, 01 Sep 2018 14:24:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Sat, 01 Sep 2018 14:24:02 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 10/20] memory: Add IOMMUConfigNotifier
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RuQNMAQnMHcC

With this patch, an IOMMUNotifier can now be either
an IOTLB notifier or a config notifier. A config notifier
is supposed to be called on guest translation config change.
This gives host a chance to update the physical IOMMU
configuration so that is consistent with the guest view.

The notifier is passed an iommu_guest_stage_config struct.

We introduce the associated helpers, iommu_config_notifier_init,
memory_region_config_notify_iommu

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c      | 14 ++++++++----
 include/exec/memory.h | 52 +++++++++++++++++++++++++++++++++++++++++--
 memory.c              | 32 ++++++++++++++++++++++++--
 3 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index b6673fcf49..7bd3cc250d 100644
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
index 5ef9bf6d21..e89fd95fc5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -84,13 +84,23 @@ typedef enum {
     IOMMU_NOTIFIER_UNMAP = 0x1,
     /* Notify entry changes (newly created entries) */
     IOMMU_NOTIFIER_MAP = 0x2,
+    /* Notify stage 1 config changes */
+    IOMMU_NOTIFIER_S1_CFG = 0x4,
 } IOMMUNotifierFlag;
 
 #define IOMMU_NOTIFIER_IOTLB_ALL (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
+#define IOMMU_NOTIFIER_CONFIG_ALL (IOMMU_NOTIFIER_S1_CFG)
+
+typedef enum {
+    IOMMU_ARM_SMMUV3 = 0x1,
+} IOMMUStage1ConfigType;
 
 struct IOMMUNotifier;
+struct iommu_guest_stage_config;
 typedef void (*IOMMUNotify)(struct IOMMUNotifier *notifier,
                             IOMMUTLBEntry *data);
+typedef void (*IOMMUConfigNotify)(struct IOMMUNotifier *notifier,
+                                  struct iommu_guest_stage_config *cfg);
 
 typedef struct IOMMUIOLTBNotifier {
     IOMMUNotify notify;
@@ -99,9 +109,16 @@ typedef struct IOMMUIOLTBNotifier {
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
@@ -143,6 +160,15 @@ static inline void iommu_iotlb_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
     n->iommu_idx = iommu_idx;
 }
 
+static inline void iommu_config_notifier_init(IOMMUNotifier *n,
+                                              IOMMUConfigNotify fn,
+                                              int iommu_idx)
+{
+    n->notifier_flags = IOMMU_NOTIFIER_S1_CFG;
+    n->iommu_idx = iommu_idx;
+    n->config_notifier.notify = fn;
+}
+
 /*
  * Memory region callbacks
  */
@@ -639,6 +665,17 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
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
@@ -1045,6 +1082,17 @@ void memory_region_iotlb_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                       int iommu_idx,
                                       IOMMUTLBEntry entry);
 
+/**
+ * memory_region_config_notify_iommu: notify a change in a translation
+ * configuration structure.
+ * @iommu_mr: the memory region that was changed
+ * @iommu_idx: the IOMMU index for the translation table which has changed
+ * @config: new guest config
+ */
+void memory_region_config_notify_iommu(IOMMUMemoryRegion *iommu_mr,
+                                       int iommu_idx,
+                                       struct iommu_guest_stage_config *config);
+
 /**
  * memory_region_iotlb_notify_one: notify a change in an IOMMU translation
  *                                 entry to a single notifier
@@ -1062,7 +1110,7 @@ void memory_region_iotlb_notify_one(IOMMUNotifier *notifier,
 
 /**
  * memory_region_register_iommu_notifier: register a notifier for changes to
- * IOMMU translation entries.
+ * IOMMU translation entries or translation config settings.
  *
  * @mr: the memory region to observe
  * @n: the IOMMUNotifier to be added; the notify callback receives a
diff --git a/memory.c b/memory.c
index 8ee5cbdbad..ea2a09b0dd 100644
--- a/memory.c
+++ b/memory.c
@@ -49,6 +49,8 @@ static GHashTable *flat_views;
 
 typedef struct AddrRange AddrRange;
 
+struct iommu_guest_stage_config;
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
+                                struct iommu_guest_stage_config *cfg)
+{
+    notifier->config_notifier.notify(notifier, cfg);
+}
+
 void memory_region_iotlb_notify_one(IOMMUNotifier *notifier,
                                     IOMMUTLBEntry *entry)
 {
@@ -1904,12 +1915,29 @@ void memory_region_iotlb_notify_iommu(IOMMUMemoryRegion *iommu_mr,
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
+                                       struct iommu_guest_stage_config *config)
+{
+    IOMMUNotifier *iommu_notifier;
+
+    assert(memory_region_is_iommu(MEMORY_REGION(iommu_mr)));
+
+    IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
+        if (iommu_notifier->iommu_idx == iommu_idx &&
+            is_iommu_config_notifier(iommu_notifier)) {
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

