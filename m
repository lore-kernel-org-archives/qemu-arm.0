Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp616174lfe;
        Wed, 18 Mar 2020 03:15:43 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtfq/ANLUnLKtwxrwOOQ/d5b+GnAvcFdB+QD9hKlip8w1JJbTFHWzMxoJdHesoGPm/gNtQO
X-Received: by 2002:ac8:1c72:: with SMTP id j47mr3631927qtk.377.1584526543522;
        Wed, 18 Mar 2020 03:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584526543; cv=none;
        d=google.com; s=arc-20160816;
        b=uuM/J9yKFCT/cIoLGVFRcLdsb1e6JeoBVz5G/KriPB4XlnR1s9tGR+KeJQo2IgnZEN
         DxQ4b1eG+CTUKuqwkikRoKcnhVr+Tx7Qky6utRwW1frxoXcq6vQAW8oGsImkoZKROz/h
         f5vWV1SKXDAQuDAgMu13LvBHxQ/wxfy0ib5BG0Pt3e6YJi3GTdPtvDOzlzzMtxoSPx8i
         XU3BANsXL6rjkMTZKri5MIPMl/X6IhFiGLmo68Mn7QmYjOu5Rt+CsnfSgTUsl4PnLtrM
         X07fIW3N+AupJP08MgGAgdk2U0XhIR+NsK4zNe97Yod6ixut02tMfUid/Maopkn4o64p
         dSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=H70ira2xI4tp3d4NOT3PQrNRuE9cpJhM0WachNeWQc4=;
        b=n87prU3uuhYpYoLBpfLBlTGU4elobxTdIBh0cGvzBlTh9yCS+aK93NA54CHHMYSMMW
         8zhyy022/5RF+vUS1nNNveBQu8iLAeICvUAmznzzYeIpSZnC0VJevAjQuJVxhopkWxkh
         McqwQmDJaGqm2o4vnAA64BLqFeMXDxlLb4dcgw+8IVmyKGYnbaFTXCRhkf6pottWno2h
         /Qp80N5hEtWl2hooqC8vhO+vl2ecZpF1HZtJmhXF++AjF+HKe6zHFVYNrwhFkFsVUSHr
         ELq+6lmxyTpEcnaioKNNnaOZsUD6N04BE5NovusVLyfHdMerJNfyjo28nxXNZ1Ubocgg
         M4XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=RMqK6DZR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si3717061qkx.19.2020.03.18.03.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 03:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=RMqK6DZR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEVji-0006ns-TV
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 06:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgz-0002wn-PX
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 06:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgy-0005Cy-AK
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 06:12:53 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:7028)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgy-0005AF-4k; Wed, 18 Mar 2020 06:12:52 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IACGVT031196; Wed, 18 Mar 2020 03:12:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=H70ira2xI4tp3d4NOT3PQrNRuE9cpJhM0WachNeWQc4=;
 b=RMqK6DZROWHvl415vE9qM1Y3H+cAuz51UAMzxajdb3zmL3iA5DLt6h7B2zzruLgio+Ka
 Tb8/SF2BUf3ZN+uKta38tThj+LXPz2VMpe9lO0Vgyts3+u5gBGW/E0aXy1cAHoMrNEmS
 HsTggBaKXxZT4CuIISSLyMcErku15DTadEUyA6FCmCgc06bUKLYd7nHaK2DSxH05odHY
 3XuD9Uc0V8ga+JLawhBWI67iXbAa+CNxsfKn8j28VsL/lAfh5fS4B9M9UAsPsOh9Td6q
 Yl6rFWsVtMmAbX2Q1MSWs2sDGjnQajT4ajCiZSroteArRaIRxBg1wNHJQ44nrrs0z1Jw KA== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yu9rp9tw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 03:12:49 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Mar
 2020 03:12:47 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Mar 2020 03:12:42 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v8 7/8] virtio-iommu: add iommu replay
Date: Wed, 18 Mar 2020 15:41:58 +0530
Message-ID: <20200318101159.8767-8-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318101159.8767-1-bbhushan2@marvell.com>
References: <20200318101159.8767-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
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
X-TUID: oxedxNUvfrOF

Default replay does not work with virtio-iommu,
so this patch provide virtio-iommu replay functionality.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/virtio-iommu.c | 44 ++++++++++++++++++++++++++++++++++++++++
 hw/virtio/trace-events   |  1 +
 2 files changed, 45 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4d522a636a..b68644f7c3 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -771,6 +771,49 @@ static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     s->config.page_size_mask = page_size_mask;
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
@@ -989,6 +1032,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = virtio_iommu_translate;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
+    imrc->replay = virtio_iommu_replay;
 }
 
 static const TypeInfo virtio_iommu_info = {
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index d94a1cd8a3..8bae651191 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -75,3 +75,4 @@ virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid)
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
 virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
 virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
+virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
-- 
2.17.1

