Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2218454lfc;
        Fri, 13 Mar 2020 07:36:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtes9/fo6kJlPyG3Qk4Ly1MGOIkpj8UzNYP1pwmdcIOH0WDOWcN6BD63wMXMTjRFc07vSd1
X-Received: by 2002:ae9:dfc6:: with SMTP id t189mr12937328qkf.131.1584110205153;
        Fri, 13 Mar 2020 07:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110205; cv=none;
        d=google.com; s=arc-20160816;
        b=a9vhhJowO/Lh3zMBfnsS8IsiOu5TXLKmPcrCFPhge+ToQJbsPqY8pwyipNIKmnuuYu
         xOwNfPmY6aNdooVtar0qNqvm/RRHaolaHXTlv1/+MWFivBiLCu92yCWFN12w26wlz0ee
         JniE+dl5VtRuYhOlYVj+0d5iM3Tg0l5x0oDRrlap40v+JJCWpeFxMZ4guY7oqTaqoIBN
         QeiV9IU9MCJpQXeQZaq/dqGi50J8kd5ugsWO7j1hjweNIb8HDyI1QXWz/6SUCxHwvl3a
         FRwn3gaIcvpmqm8kCrDXa3DMXSVQhvBLBc+m1NjqSH8UGnxTp5qcAEkI5ItO2uFFQ9PB
         h57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=+icZQ+2dZ1MJRUktX6WWQN23OKRsL0uBg2iaa3i4miw=;
        b=Z0Adfey96auMH7Iayh2S1O93pSa34o9z8uExS/alYczQJ9xiJQzC1onbYAdRm7G88H
         FpBtwTu/aLUz5yyb2I2pld9/qO8/lTGYmN61W5llzAyMFkq4MiGrt7BSUVtkQ76QSJG9
         2DQwIvxYR4YXHM0CFF33ZYZPDUYnLMKQdh9mEt8pPzYxtHXJFD6FkIsNan/ntucodNK9
         ZLJp8DqWU5MuV2/FMkadG3rHBhLIzaH5JS9DcxbX1W/G5YWWKHzyECntqDn9p+XdDSbg
         t+NkGN66PQk4HTitisoDxNVNkhlcT9BBn4424Ai43Rx8ogFWPoboQU69ni+7UCgVhXHG
         CdBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=lQtB4j7I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q30si4934902qtl.27.2020.03.13.07.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:36:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=lQtB4j7I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:60006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClQa-0001Hj-Hh
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33075)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3j-000643-OW
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3i-00025c-LN
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:43 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:13678)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3i-00025A-H8; Fri, 13 Mar 2020 03:48:42 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D7kFxk020335; Fri, 13 Mar 2020 00:48:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=+icZQ+2dZ1MJRUktX6WWQN23OKRsL0uBg2iaa3i4miw=;
 b=lQtB4j7IX/jaoJkpYZQ2CqoykXc8FSnnNFY7aabGIAn3us4XGxr+2OH7msZZ26FA3JAB
 BX4GMiNV0VrVg885P9Bm3rdBthcrOPDFAUvIF3KRS9k5UBEUZj1XxNlsJXKj4O5Hg+Ia
 5jyXoapEWU76CyVmTlAspcDzsaJS9Z+YfpKTMPkjeN2iBWtFpevIbajTkNk31muup6VJ
 /d/MOBgvMdIE0vtCkVqCK5j+1KXORRQ2K3G+iyZ9VXC2PG49hLFbdD7tiTkJcbD2X2oJ
 KrbX7tqZvnSTzpR4WTIUdDor3mCY84lwoN5dNarMI8J0HTgyNN5LR33e/8Ku3XdWegco Zg== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yqt7f2vpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:48:40 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 00:48:38 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:48:34 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v7 4/5] virtio-iommu: add iommu replay
Date: Fri, 13 Mar 2020 13:18:10 +0530
Message-ID: <20200313074811.27175-5-bbhushan2@marvell.com>
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
X-TUID: TPA7gMONwJH/

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

