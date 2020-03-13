Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2221450lfc;
        Fri, 13 Mar 2020 07:38:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvCLMXtnTe3xBCaJArKPNO5S4oxM7HtG/fz8TuG9xZ2MvyXVNyPN9ozHbxLxEF5z6SjVsTU
X-Received: by 2002:a37:9ec8:: with SMTP id h191mr13273308qke.260.1584110336149;
        Fri, 13 Mar 2020 07:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110336; cv=none;
        d=google.com; s=arc-20160816;
        b=B1k7Nps63CLnTER3VyTTVNrft90ruz6K1lKlbbVjXaoc3ZyiPCmhTw/siuFACGmsX8
         WxreQ/RcfZPjndnxlBgdqg74w/pkrz2qS+uJ0R0xsn0Pno2MnVY/78bzMj3VzUV1Y49+
         eEqFq/2gG1sMcDNjGKvLeNf8nGceT7iZp7hFx918FKtBYowzF66vPL4AoKSLSc7DTM2t
         KH3FL/eAOLp29bXYHM49dnWtGhKsOu5c0/3BhoxCRCS8Bdvb5/5L05LvIqZKlIqEJQ+E
         9BC36zvsSVtveYRCIk1KuwqiKf2GQXLg4eHsNP0jdFzb2XwDE/vq19vXWid+hf7H2Qq8
         7zVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=+icZQ+2dZ1MJRUktX6WWQN23OKRsL0uBg2iaa3i4miw=;
        b=TnrHhFDuFNfWj1PblWHY6/8rTy75TOppuG+Hq17bBY5v5RnkcTqLaDt6m+mfCYzqN2
         qeakm8dvnZsmi5e8uyO741HXdto4fqEBHIif3FyjCz6frLkObqpzEMCdoDgMxPonI9fN
         MEGyMNhbHQXi9MpkQqgXeceRbbZ7fEd5tfR4GfoBFG+ZJTvm2sT1euzvfY+kE6wb8k+h
         9lcxlX1uCr4YaIBP4F8JNxyg3+Oyer8WwFNIOpz2nakLqH/l33goLbiTqzGfiDj2GJNK
         VsnTuUOUnSCwpywD9TC8FA4/S9a/b6CHSw3ZbDbsQOYKw0R5npmmPDy/p4zNYa21yrJL
         01Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b="xaX/VK18";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si5838266qtl.44.2020.03.13.07.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b="xaX/VK18";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClSh-0005WV-Fl
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeY7-00074A-Tb
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 03:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeY6-0004gX-N7
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 03:16:03 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:36740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeY3-0004WF-6x; Fri, 13 Mar 2020 03:15:59 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D79r9I009668; Fri, 13 Mar 2020 00:15:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=+icZQ+2dZ1MJRUktX6WWQN23OKRsL0uBg2iaa3i4miw=;
 b=xaX/VK18i2IrvG2Z/rhgGFzO4KEWaJvndBmoquh0EMMNok+rZL3n42/yqe6jW+ZC9UNH
 iTkWJEBaSk+hpJl7b4YNz+MDvnnIw027eiqPROzfjztLyJLkm4CRQTvv+gnkWyb61zWm
 p+WgeuOODWD9OC0LEVXXx25lWGD/74cYsQ13QKXqG7cr/dtaX2B7FmLgJW0q/EC8CtCl
 FvGt+BUNil3PApvQsYzQasY93W5ovBO9PGdDL7dtb2VWYUHK9ERov6Fy0EYhqf4QMfUU
 CQpb1z2fr8h2QS7qfLty1QYDxiDsAOZDq5UmJ6rrJGqCPYmEykigfMcUSHKqQ+NA8Di9 vQ== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yqt7f2s6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:15:57 -0700
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 00:15:55 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:15:51 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v6 4/5] virtio-iommu: add iommu replay
Date: Fri, 13 Mar 2020 12:45:31 +0530
Message-ID: <20200313071532.26533-4-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313071532.26533-1-bbhushan2@marvell.com>
References: <20200313071532.26533-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_02:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:36:05 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Id/wTEtIADh6

Default replay does not work with virtio-iommu,
so this patch provide virtio-iommu replay functionality.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 44 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index d94a1cd8a3..8bae651191 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -75,3 +75,4 @@ virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid)
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
 virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
 virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
+virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2006f72901..bcc9895b76 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -760,6 +760,49 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
 
+static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
+{
+    VirtIOIOMMUMapping *mapping = (VirtIOIOMMUMapping *) value;
+    VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    trace_virtio_iommu_remap(interval->low, mapping->phys_addr,
+                             interval->high - interval->low + 1);
+    /* unmap previous entry and map again */
+    virtio_iommu_notify_unmap(mr, interval->low,
+                              interval->high - interval->low + 1);
+
+    virtio_iommu_notify_map(mr, interval->low, mapping->phys_addr,
+                            interval->high - interval->low + 1);
+    return false;
+}
+
+static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    uint32_t sid;
+    VirtIOIOMMUEndpoint *ep;
+
+    sid = virtio_iommu_get_bdf(sdev);
+
+    qemu_mutex_lock(&s->mutex);
+
+    if (!s->endpoints) {
+        goto unlock;
+    }
+
+    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep || !ep->domain) {
+        goto unlock;
+    }
+
+    g_tree_foreach(ep->domain->mappings, virtio_iommu_remap, mr);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -976,6 +1019,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = virtio_iommu_translate;
+    imrc->replay = virtio_iommu_replay;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.17.1

