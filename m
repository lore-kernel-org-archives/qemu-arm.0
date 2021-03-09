Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2405673lfg;
        Mon, 8 Mar 2021 19:19:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgEe3n0GKsJrU6Ryap5M7DAzZhV4G7Vzkna9JadpK4Nr3nvi3ig/4fjQdsrjMDjJBdZLme
X-Received: by 2002:a6b:6618:: with SMTP id a24mr21662229ioc.100.1615259991761;
        Mon, 08 Mar 2021 19:19:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615259991; cv=none;
        d=google.com; s=arc-20160816;
        b=JRTstidOanXSOs0T89pHgx7N4KShGxeGyYII7uPYAippn2EvMLF9vILYHZqqJPb4kW
         Gd295TT+APIZAbgKFDd/iZjWSncCdwG2Lc3q85VoDbbilkXUH5WCeT99unLynqDVlQhR
         VvoMeKW2Sf2a8B5edb4mbELKIeuScLBrtmUPeqpWb6X8IGowF5s0nF1QiTGISNpRiP71
         FRBky6M2CwZCJEiQ5U/jy63GbKgMcHJCYWm1acRL/7AGqYm9Xx8AhiDSKAjahmnEsCZa
         qFfLoUhTZVljOgOf5OXjIGQs+P7M+OtV4OVVf8tHPnNHCrdJa2v1Rs4YMFKnXkPa8SDr
         exaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=/kIrjla22Km6kxiWklA1JFeeSZuz65iC7YpmRtjdDxk=;
        b=ADm+Iqv38gu4AVN61DAqpRUM2luuWiZOJXK2QmddtBbLWsINrQ3aDXD9cj3AXzoeME
         S8WgPKwo13ZilHlNRJILLf8SaWkekA6HOoK3j420zVUlFa8atw5edFBWcVez4//ul4zp
         zwJVB4E73a+5IK8BAkVxjzgnPsOs+Tn7bvw0id3adnKdAuHO64pjL8H2y2WLu8bCO1Pu
         mmr61AcESxoxw5W2N4FryMBjOp77YVxd6fbEb03bN0d8XqJKmgvPauN1hSGphadyJ/Kj
         NrkEghpAvO+gMjdqXmL6G7SiUK5Ig8wCzkYnkF9oXStTonQZCvbmRnU18uptA024bc9Z
         qmVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si13108892ilz.157.2021.03.08.19.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 19:19:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJSuU-00068z-Us
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 22:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lJSuM-00068n-0M; Mon, 08 Mar 2021 22:19:42 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lJSuI-0000Dv-Ij; Mon, 08 Mar 2021 22:19:41 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DvgP21rYRzMkpc;
 Tue,  9 Mar 2021 11:17:10 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 11:19:14 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Kirti Wankhede <kwankhede@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [PATCH v2] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
Date: Tue, 9 Mar 2021 11:19:13 +0800
Message-ID: <20210309031913.11508-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, jiangkunkun@huawei.com,
 Peter Xu <peterx@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PGwFk+ZksyFv

For now the switch of vfio dirty page tracking is integrated into
@vfio_save_handler. The reason is that some PCI vendor driver may
start to track dirty base on _SAVING state of device, so if dirty
tracking is started before setting device state, vfio will report
full-dirty to QEMU.

However, the dirty bmap of all ramblocks are fully set when setup
ram saving, so it's not matter whether the device is in _SAVING
state when start vfio dirty tracking.

Moreover, this logic causes some problems [1]. The object of dirty
tracking is guest memory, but the object of @vfio_save_handler is
device state, which produces unnecessary coupling and conflicts:

1. Coupling: Their saving granule is different (perVM vs perDevice).
   vfio will enable dirty_page_tracking for each devices, actually
   once is enough.

2. Conflicts: The ram_save_setup() traverses all memory_listeners
   to execute their log_start() and log_sync() hooks to get the
   first round dirty bitmap, which is used by the bulk stage of
   ram saving. However, as vfio dirty tracking is not yet started,
   it can't get dirty bitmap from vfio. Then we give up the chance
   to handle vfio dirty page at bulk stage.

Move the switch of vfio dirty_page_tracking into vfio_memory_listener
can solve above problems. Besides, Do not require devices in SAVING
state for vfio_sync_dirty_bitmap().

[1] https://www.spinics.net/lists/kvm/msg229967.html

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
---

changelog:

v2:
 - use log_global_(start|stop) to switch vfio dirty tracking. (Paolo)
 - add the initial design idea.

---
 hw/vfio/common.c    | 49 ++++++++++++++++++++++++++++++++++++---------
 hw/vfio/migration.c | 35 --------------------------------
 2 files changed, 40 insertions(+), 44 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763..a27aa9dda8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -311,7 +311,7 @@ bool vfio_mig_active(void)
     return true;
 }
 
-static bool vfio_devices_all_saving(VFIOContainer *container)
+static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
 {
     VFIOGroup *group;
     VFIODevice *vbasedev;
@@ -329,13 +329,8 @@ static bool vfio_devices_all_saving(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
-                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
-                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
-                        return false;
-                }
-                continue;
-            } else {
+            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
+                && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
                 return false;
             }
         }
@@ -987,6 +982,40 @@ static void vfio_listener_region_del(MemoryListener *listener,
     }
 }
 
+static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
+{
+    int ret;
+    struct vfio_iommu_type1_dirty_bitmap dirty = {
+        .argsz = sizeof(dirty),
+    };
+
+    if (start) {
+        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
+    } else {
+        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
+    }
+
+    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+    if (ret) {
+        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
+                     dirty.flags, errno);
+    }
+}
+
+static void vfio_listener_log_global_start(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    vfio_set_dirty_page_tracking(container, true);
+}
+
+static void vfio_listener_log_global_stop(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    vfio_set_dirty_page_tracking(container, false);
+}
+
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
                                  uint64_t size, ram_addr_t ram_addr)
 {
@@ -1128,7 +1157,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
         return;
     }
 
-    if (vfio_devices_all_saving(container)) {
+    if (vfio_devices_all_dirty_tracking(container)) {
         vfio_sync_dirty_bitmap(container, section);
     }
 }
@@ -1136,6 +1165,8 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
 static const MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
+    .log_global_start = vfio_listener_log_global_start,
+    .log_global_stop = vfio_listener_log_global_stop,
     .log_sync = vfio_listerner_log_sync,
 };
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 00daa50ed8..c0f646823a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -395,40 +395,10 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static int vfio_set_dirty_page_tracking(VFIODevice *vbasedev, bool start)
-{
-    int ret;
-    VFIOMigration *migration = vbasedev->migration;
-    VFIOContainer *container = vbasedev->group->container;
-    struct vfio_iommu_type1_dirty_bitmap dirty = {
-        .argsz = sizeof(dirty),
-    };
-
-    if (start) {
-        if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
-            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
-        } else {
-            return -EINVAL;
-        }
-    } else {
-            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
-    }
-
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
-    if (ret) {
-        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
-                     dirty.flags, errno);
-        return -errno;
-    }
-    return ret;
-}
-
 static void vfio_migration_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    vfio_set_dirty_page_tracking(vbasedev, false);
-
     if (migration->region.mmaps) {
         vfio_region_unmap(&migration->region);
     }
@@ -469,11 +439,6 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_set_dirty_page_tracking(vbasedev, true);
-    if (ret) {
-        return ret;
-    }
-
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
 
     ret = qemu_file_get_error(f);
-- 
2.19.1

