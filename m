Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2879188wrd;
        Fri, 21 Sep 2018 01:52:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63hOxR/cvuQMR/0CPTI7uHUgggoP2zd7tpEEWbOLre46jvm119oEAOYDVKVFBKn/QEmM3Rw
X-Received: by 2002:a05:6214:4a:: with SMTP id c10mr817857qvr.191.1537519961652;
        Fri, 21 Sep 2018 01:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537519961; cv=none;
        d=google.com; s=arc-20160816;
        b=E925V2qXXPyrnaWrtnrHNdlU9TcGvGbE+CMG0bw7yqbihsp7NqmEbraSK42CivLidr
         qAJwh1GWt1xRJj0EWZ2CEbXMMVFdH6r9TyjvkI4kB4Fn3xWNSCtSz7jaKmz/nQy1RoVI
         YJeiU6ocFS56HefGLbjmr3SMPgIB/4bsMWxApam/gvb57Qp83kUpG9Qze8Tp4TRS8Bdr
         QxfwcRpViYOV1TecEnmyie7Yw83pAUBbduOv4KcKzTeEBVOyOgdbBNV5KEOJCBuC8IYd
         Ywhp8Jcc10SP2NUhi44gSaAgct1NgE9y7trTAMFLSAf1rGj9kzpBQJh3+ZgoCU/U8Em8
         KjVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=0paK+6Lmtk7t8myBCiLLv664RkVX8mqjDlZncpIa608=;
        b=yQYKYkC67Me3C+gkPzMSE8QptM2I9/7Kit4rNqJD84ovK7r0WrGjgCQW/8xjl6ilSz
         J+zA8gQ/dLAQRfcMwueLWmmDsffvTZrmEeGXWT83vkXW4Gc3BnXHeAkQxeRGZL6Eob3F
         x2xI/TQgChmsyZRE1tHOtWeQLgQXXUe/tUsMsIxBFn4eA6RQ/LW1z3CtMznwrGHvdbVR
         fQRO7OQgu08jNcQe/GH+rYjx5UWIDZvpPF1J67BUBNztOAeoJHTdzaoLraokm6Nwdt2I
         Y2856HResUU6IkOQ63L+YZCG35Z11vz9lM5vTfAm/la+3wSP/nS4w31PRGB4P3t3+kq9
         t5wA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7-v6si434373qtt.307.2018.09.21.01.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3HB3-0002Qh-51
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:52:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GhF-00065s-3o
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GhB-0008GE-Sk
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GhB-0008D3-HR; Fri, 21 Sep 2018 04:21:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE5994E919;
	Fri, 21 Sep 2018 08:21:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6F657D90A;
	Fri, 21 Sep 2018 08:21:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:17 +0200
Message-Id: <20180921081819.9203-27-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 21 Sep 2018 08:21:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 26/28] hw/vfio/common: Handle fault_handler
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
X-TUID: 9M4qw4tVSfpl

We introduce a new IOMMU notifier, whose role is to register
the fault notifier.

The patch also implements the userspace fault handler. When the
eventfd is signalled, the fault handler injects the set of
collected faults into the IOMMU memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c              | 118 ++++++++++++++++++++++++++++++++++
 include/hw/vfio/vfio-common.h |   1 +
 2 files changed, 119 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 172ddd396f..9548e962e5 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -37,12 +37,16 @@
 #include "sysemu/kvm.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "qemu/event_notifier.h"
+#include "qemu/main-loop.h"
 
 struct vfio_group_head vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
 struct vfio_as_head vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
 
+#define MAX_QUERIED_FAULT_EVENTS 10
+
 #ifdef CONFIG_KVM
 /*
  * We have a single VFIO pseudo device per KVM VM.  Once created it lives
@@ -349,6 +353,111 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
     return true;
 }
 
+/*
+ * At the moment we retrieve MAX_QUERIED_FAULT_EVENTS events
+ * TODO: loop until the ioctl returns count = 0
+ */
+static void vfio_iommu_fault_handler(void *data)
+{
+    VFIOGuestIOMMU *giommu = (VFIOGuestIOMMU *)data;
+    IOMMUMemoryRegion *iommu = giommu->iommu;
+    struct vfio_iommu_type1_get_fault_events *ustruct;
+    size_t fault_buffer_size =
+        MAX_QUERIED_FAULT_EVENTS * sizeof(struct iommu_fault);
+    size_t argsz = sizeof(*ustruct) + fault_buffer_size;
+    int ret;
+
+    ustruct = g_malloc0(argsz);
+    ustruct->argsz = argsz;
+    ustruct->count = 0;
+
+    ret = ioctl(giommu->container->fd, VFIO_IOMMU_GET_FAULT_EVENTS, ustruct);
+    if (ret) {
+        error_report("%s: failed to get pending faults (%d)",
+                     __func__, ret);
+    }
+
+    assert(ustruct->count > 0);
+    memory_region_inject_faults(iommu, ustruct->count, ustruct->events);
+
+    g_free(ustruct);
+
+    ret = event_notifier_test_and_clear(giommu->fault_notifier);
+    if (!ret) {
+        error_report("Error when clearing fd=%d (ret = %d)",
+                     event_notifier_get_fd(giommu->fault_notifier), ret);
+    }
+}
+
+static void
+vfio_iommu_fault_handler_register(IOMMUNotifier *n, IOMMUConfig *cfg)
+
+{
+    VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
+    VFIOContainer *container = giommu->container;
+    struct vfio_iommu_type1_set_fault_eventfd info;
+    int ret;
+
+    info.argsz = sizeof(info);
+    info.flags = 0;
+
+    giommu->fault_notifier = g_malloc0(sizeof(EventNotifier));
+    ret = event_notifier_init(giommu->fault_notifier, 0);
+    if (ret) {
+        error_report("%s: failed to init fault eventfd (%d)",
+                     __func__, ret);
+        goto out;
+    }
+
+    info.eventfd = event_notifier_get_fd(giommu->fault_notifier);
+    qemu_set_fd_handler(info.eventfd, vfio_iommu_fault_handler, NULL, giommu);
+
+    memcpy(&info.config, &cfg->fault_cfg, sizeof(cfg->fault_cfg));
+
+    ret = ioctl(container->fd, VFIO_IOMMU_SET_FAULT_EVENTFD, &info);
+    if (ret) {
+        error_report("%s: failed to setup iommu fault propagation (%d)",
+                     __func__, ret);
+        goto cleanup;
+    }
+    return;
+cleanup:
+    qemu_set_fd_handler(info.eventfd, NULL, NULL, NULL);
+    event_notifier_cleanup(giommu->fault_notifier);
+out:
+    g_free(giommu->fault_notifier);
+}
+
+static void vfio_iommu_fault_handler_unregister(IOMMUNotifier *n)
+{
+    VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
+    VFIOContainer *container = giommu->container;
+    struct vfio_iommu_type1_set_fault_eventfd info;
+    int eventfd, ret;
+
+    if (!(n->notifier_flags & IOMMU_NOTIFIER_INIT_CFG) ||
+        !giommu->fault_notifier) {
+        return;
+    }
+
+    eventfd = event_notifier_get_fd(giommu->fault_notifier);
+    if (eventfd < 0) {
+        return;
+    }
+
+    info.argsz = sizeof(info);
+    info.flags = 0;
+    info.eventfd = -1;
+    ret = ioctl(container->fd, VFIO_IOMMU_SET_FAULT_EVENTFD, &info);
+    if (ret) {
+        error_report("%s: failed to stop iommu fault propagation (%d)",
+                     __func__, ret);
+    }
+    qemu_set_fd_handler(eventfd, NULL, NULL, NULL);
+    event_notifier_cleanup(giommu->fault_notifier);
+    g_free(giommu->fault_notifier);
+}
+
 /* Program the guest @cfg on physical IOMMU stage 1 (nested mode) */
 static void vfio_iommu_nested_notify(IOMMUNotifier *n,
                                      IOMMUConfig *cfg)
@@ -754,6 +863,14 @@ static void vfio_listener_region_add(MemoryListener *listener,
             QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
             memory_region_register_iommu_notifier(section->mr, &giommu->n);
 
+            /* Config notifier to register fault handler */
+            giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
+            iommu_config_notifier_init(&giommu->n,
+                                       vfio_iommu_fault_handler_register,
+                                       IOMMU_NOTIFIER_INIT_CFG, iommu_idx);
+            QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
+            memory_region_register_iommu_notifier(section->mr, &giommu->n);
+
             /* IOTLB unmap notifier to propagate guest IOTLB invalidations */
             giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
             iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_unmap_notify,
@@ -846,6 +963,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
                 } else if (is_iommu_config_notifier(&giommu->n)) {
                     memory_region_unregister_iommu_notifier(section->mr,
                                                             &giommu->n);
+                    vfio_iommu_fault_handler_unregister(&giommu->n);
                 }
                 QLIST_REMOVE(giommu, giommu_next);
                 g_free(giommu);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 821def0565..db9cd93d77 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -91,6 +91,7 @@ typedef struct VFIOGuestIOMMU {
     hwaddr iommu_offset;
     IOMMUNotifier n;
     QLIST_ENTRY(VFIOGuestIOMMU) giommu_next;
+    EventNotifier *fault_notifier;
 } VFIOGuestIOMMU;
 
 typedef struct VFIOHostDMAWindow {
-- 
2.17.1

