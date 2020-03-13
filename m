Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2224718lfc;
        Fri, 13 Mar 2020 07:41:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvdZLSFBo49KJgdKXw31mMqikstp1b/bs3lC+VKScvLLPF4vXu5Y6i6ioWwmQRbAEBOuI/i
X-Received: by 2002:a0c:fec4:: with SMTP id z4mr5861251qvs.234.1584110498234;
        Fri, 13 Mar 2020 07:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110498; cv=none;
        d=google.com; s=arc-20160816;
        b=jh2qXMh2yDE1s9dpZ+uGbJRZb2xfVp+ssjyJ6egrSRTNkDbSBSp5CpI7AXF5hjJl3M
         G0UKzIrFoz/gAV6QwgwDB4Ym5U/QfpWLUJmI9nBohZdXhuw7dP5pA8wqv6/I5ood0Bx9
         I+P6LuMM4jVJpYkL7NwXDsREFaFpt5fbCksh6TqEx+V3nyAiEG4TWJK3yuVKgiRZG89g
         LE61IuIPLW2eXrA/jec3ttAjgXF4h09ulx/u+yw5E0inHPz7Nou9zap9tDHXhxAO0ndQ
         wTuOuzZbayM6JzaT+pmSzcFoFgG8maWLcPXtOxkU5cl1BFj2TxZ45W1FuKKj5yhfGBEm
         ys6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=d2iWCXJz4dJ2g2X4/WjavG5MxgCZeaMWghSwegVnILA=;
        b=YRfd87uAhWzr+Hko70aUVm90JkTFccV7CNazf7efI2SPvfaXoNidcc2dZqdQZS0pRF
         JHtSnc66sFRgXZMBirz6l0rAlR8sB2myYvVUcoCQio9urSFVCE/OZiklwoQ95iYU16nL
         B/psAPOE4RUxd1IYnD95mkzocA9Cv8Ehe2UbLf+nstNTDLbtW5QQYRmahmQtbZnpJVL6
         rV/Hhp5zYv+2W9lUjEd4ZO5gcFDCZH3geVrfCEq/C+JWTzPhzZRsGgsm542D+I/UZ/QA
         0XH4u3InS/9MZ95hIhoRbLALYMRYftRSWQe0rfk+hdX8ffuI2x9eedA8W2r6VV36qzpH
         OlEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=w6P2iJT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n79si5187491qke.46.2020.03.13.07.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=w6P2iJT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:60172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClVJ-0003eo-Lf
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3p-00065g-4P
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3o-0002HN-1P
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:49 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:62722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3n-0002Gc-TO; Fri, 13 Mar 2020 03:48:47 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D7jtkP020297; Fri, 13 Mar 2020 00:48:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=d2iWCXJz4dJ2g2X4/WjavG5MxgCZeaMWghSwegVnILA=;
 b=w6P2iJT7tLEhvYJ0kNUy0zsfOUW7F2AGR4rCyBgaCNMJhIXPESSy4xj3aRYzZ5a1W0cz
 v+N2VFoMbPDk/cX+qlSH00+GlruvD9K4ATh0/mjGuCwnt+efvL6hElsGSE8k7FGWoeGK
 DOIdF+vmH3Dwmw34a2cgvM1dl+gRJ3ZPgww5k7IQwO9Q4LCithpuk0wQS0C6EaNse/6t
 w+4iFwYHjHs1ngw2tUvtKLiTVuQYmukRf3jKJbbxSI/ZW7VBJWsGUqsbDeBm5hs/jxQx
 q0gxNnTkxmKT5hCk5A421GHamJcDJP7eSKDIagXZ/Cx4C7EdmPK624zs2tPJerzcYX0L Lg== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yqt7f2vpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:48:45 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 00:48:43 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:48:39 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v7 5/5] virtio-iommu: add iommu notifier memory-region
Date: Fri, 13 Mar 2020 13:18:11 +0530
Message-ID: <20200313074811.27175-6-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313074811.27175-1-bbhushan2@marvell.com>
References: <20200313074811.27175-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_03:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:35:47 -0400
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
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bak+kx0374GA

Finally add notify_flag_changed() to for memory-region
access flag iommu flag change notifier

Finally add the memory notifier

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/trace-events   |  2 ++
 hw/virtio/virtio-iommu.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8bae651191..a486adcf6d 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -76,3 +76,5 @@ virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uin
 virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
 virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
 virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier node for memory region %s"
+virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier node for memory region %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index bcc9895b76..7744410f72 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -803,6 +803,37 @@ unlock:
     qemu_mutex_unlock(&s->mutex);
 }
 
+static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
+                                             IOMMUNotifierFlag old,
+                                             IOMMUNotifierFlag new,
+                                             Error **errp)
+{
+    IOMMUDevice *sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    VirtioIOMMUNotifierNode *node = NULL;
+    VirtioIOMMUNotifierNode *next_node = NULL;
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
+        node = g_malloc0(sizeof(*node));
+        node->iommu_dev = sdev;
+        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
+        return 0;
+    }
+
+    /* update notifier node with new flags */
+    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
+        if (node->iommu_dev == sdev) {
+            if (new == IOMMU_NOTIFIER_NONE) {
+                trace_virtio_iommu_notify_flag_del(iommu_mr->parent_obj.name);
+                QLIST_REMOVE(node, next);
+                g_free(node);
+            }
+        }
+    }
+    return 0;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -1020,6 +1051,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = virtio_iommu_translate;
     imrc->replay = virtio_iommu_replay;
+    imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.17.1

