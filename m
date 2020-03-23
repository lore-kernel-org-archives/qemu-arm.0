Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1177935lfi;
        Mon, 23 Mar 2020 01:50:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtDlxPLI1plYhBySkvKdB0kLhDBCjngUPfAeAfu46ymTGFztfI2pLM7qIQYLDCoa5v36wx3
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr19127144qke.219.1584953410824;
        Mon, 23 Mar 2020 01:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953410; cv=none;
        d=google.com; s=arc-20160816;
        b=kwgx5/4RVuBNP3V3cdK/OHl59Q9THdWyp5xyWOcIIRafCEVK+xS7Z8Q/t1xInSW6FO
         RGx1NRjucBxofzm9ivRhbahG2bqdaxJYfuwVzWCTXhjY/OADr59V6G/PVhOCTe6bMsoG
         gXOAhdyvE+QzarGJX7GK6ngLU06vp5APVC6DplBc6buDrOaxhs7VQ2KTyUq014okZ6eo
         sgQyD7i92NkoBqexhu1kWwdS1ZsffLFI+0vlcJ2uigSt+LlBlEuqThBjDkflYB0zKCKg
         b1la1jIPid1V6hSkC7PsDGgx775U31baFxOTs7Fma7fFEbA4l0QsxKruPaafMvynKF1G
         zRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=l3c+XiKS8WJssA8PHo8GKKWyszuBffSUYxnje2SlTA4=;
        b=EkhWVe3glQ+c4wnPcIsNhD+4ajE+9iq9GyHGpWHZcbpLG3UpeRkPvKJKy9pT1/bJNB
         YitbQHY4TV07HfN/XI0CsBCGWnMyl6YKNaMGRT/fwy4E+GrzsOCNZBdCd6AAdC3WucKv
         bHF/WyGrhyB9Zcs7GvVGWGXha/APPzgQ/UwVes3TCXC/u87+85OdgID+zlG5aCki6Szp
         GQQdfDQmOX1gnwuEV1TqTVytQfCafA53jDT7hpXGsNxo92iok8Mpc5FU4uxvEncF0db4
         Q7HSPmh1cLc/QCfqLTP+yyf9Sp/qNzETgBVZAgnt9QVNE1aB82Sr9S2Qrb/HSfHMTyS1
         jewA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b=TJQQDE1r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si8174448qvh.21.2020.03.23.01.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b=TJQQDE1r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGImg-000311-7d
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjf-0008Vo-EM
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjc-0003Al-Fx
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:47:03 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:17568
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjc-0003AO-7n; Mon, 23 Mar 2020 04:47:00 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8dp6p010660; Mon, 23 Mar 2020 01:46:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=l3c+XiKS8WJssA8PHo8GKKWyszuBffSUYxnje2SlTA4=;
 b=TJQQDE1riMkEiVPy6VdYwRyK9NOjzC6LcIC1W3mrHv0z0tuBsGv4KPPO08Dfw88MZDiz
 o9H8S74L2wIeIRw9NWGOkc0m0UJ9iI4b7q9bldLhe/BmR2GupPnWBac7cvOa0xaWI8qO
 ET7uAIS3l0jWdYqKih8uwHlLvVf3ccPd9tedbCVRfXIGESwVBQUK8UY6jec8mtC+MHMz
 sNNHrwDOf4IK6K5oa+gnIarfdKYUkw7/n3iONJOIuIbUzokVifodnpwL9ISspDvB2tfC
 gMGSppK1IerB3ODk9Il/ShWo3o0Qa1vRzPORxfGT8kjrMoLoSf6L1cDVZ8j5W68DLQ0E ag== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0a-0016f401.pphosted.com with ESMTP id 2ywg9ndrwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:46:57 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Mar
 2020 01:46:55 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:46:50 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 5/9] virtio-iommu: Add iommu notifier for map/unmap
Date: Mon, 23 Mar 2020 14:16:13 +0530
Message-ID: <20200323084617.1782-6-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323084617.1782-1-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
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
Cc: Eric Auger <eric.auger@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3lqzNuSY3qaR

This patch extends VIRTIO_IOMMU_T_MAP/UNMAP request to
notify registered iommu-notifier. Which will call vfio
notifier to map/unmap region in iommu.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/virtio/virtio-iommu.h |  2 +
 hw/virtio/virtio-iommu.c         | 67 +++++++++++++++++++++++++++++++-
 hw/virtio/trace-events           |  2 +
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 4efa09610a..e53586df70 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -38,6 +38,7 @@ typedef struct IOMMUDevice {
     uint64_t      page_size_mask;
     IOMMUMemoryRegion  iommu_mr;
     AddressSpace  as;
+    QLIST_ENTRY(IOMMUDevice) next;
 } IOMMUDevice;
 
 typedef struct IOMMUPciBus {
@@ -57,6 +58,7 @@ typedef struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
+    QLIST_HEAD(, IOMMUDevice) notifiers_list;
 } VirtIOIOMMU;
 
 #endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index a28818202c..bd464d4fb3 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -123,6 +123,38 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     }
 }
 
+static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr iova,
+                                    hwaddr paddr, hwaddr size)
+{
+    IOMMUTLBEntry entry;
+
+    entry.target_as = &address_space_memory;
+    entry.addr_mask = size - 1;
+
+    entry.iova = iova;
+    trace_virtio_iommu_notify_map(mr->parent_obj.name, iova, paddr, size);
+    entry.perm = IOMMU_RW;
+    entry.translated_addr = paddr;
+
+    memory_region_notify_iommu(mr, 0, entry);
+}
+
+static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
+                                      hwaddr size)
+{
+    IOMMUTLBEntry entry;
+
+    entry.target_as = &address_space_memory;
+    entry.addr_mask = size - 1;
+
+    entry.iova = iova;
+    trace_virtio_iommu_notify_unmap(mr->parent_obj.name, iova, size);
+    entry.perm = IOMMU_NONE;
+    entry.translated_addr = 0;
+
+    memory_region_notify_iommu(mr, 0, entry);
+}
+
 static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
 {
     if (!ep->domain) {
@@ -307,9 +339,12 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     uint64_t virt_start = le64_to_cpu(req->virt_start);
     uint64_t virt_end = le64_to_cpu(req->virt_end);
     uint32_t flags = le32_to_cpu(req->flags);
+    hwaddr size = virt_end - virt_start + 1;
     VirtIOIOMMUDomain *domain;
     VirtIOIOMMUInterval *interval;
     VirtIOIOMMUMapping *mapping;
+    VirtIOIOMMUEndpoint *ep;
+    IOMMUDevice *sdev;
 
     if (flags & ~VIRTIO_IOMMU_MAP_F_MASK) {
         return VIRTIO_IOMMU_S_INVAL;
@@ -339,9 +374,38 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
 
     g_tree_insert(domain->mappings, interval, mapping);
 
+    /* All devices in an address-space share mapping */
+    QLIST_FOREACH(sdev, &s->notifiers_list, next) {
+        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
+            if (ep->id == sdev->devfn) {
+                virtio_iommu_notify_map(&sdev->iommu_mr,
+                                        virt_start, phys_start, size);
+            }
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
 
+static void virtio_iommu_remove_mapping(VirtIOIOMMU *s,
+                                        VirtIOIOMMUDomain *domain,
+                                        VirtIOIOMMUInterval *interval)
+{
+    VirtIOIOMMUEndpoint *ep;
+    IOMMUDevice *sdev;
+
+    QLIST_FOREACH(sdev, &s->notifiers_list, next) {
+        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
+            if (ep->id == sdev->devfn) {
+                virtio_iommu_notify_unmap(&sdev->iommu_mr,
+                                          interval->low,
+                                          interval->high - interval->low + 1);
+            }
+        }
+    }
+    g_tree_remove(domain->mappings, (gpointer)(interval));
+}
+
 static int virtio_iommu_unmap(VirtIOIOMMU *s,
                               struct virtio_iommu_req_unmap *req)
 {
@@ -368,7 +432,7 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
         uint64_t current_high = iter_key->high;
 
         if (interval.low <= current_low && interval.high >= current_high) {
-            g_tree_remove(domain->mappings, iter_key);
+            virtio_iommu_remove_mapping(s, domain, iter_key);
             trace_virtio_iommu_unmap_done(domain_id, current_low, current_high);
         } else {
             ret = VIRTIO_IOMMU_S_RANGE;
@@ -663,6 +727,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
+    QLIST_INIT(&s->notifiers_list);
     virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
                 sizeof(struct virtio_iommu_config));
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index e83500bee9..d94a1cd8a3 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -73,3 +73,5 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
+virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
+virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
-- 
2.17.1

