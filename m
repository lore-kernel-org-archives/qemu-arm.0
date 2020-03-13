Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2217676lfc;
        Fri, 13 Mar 2020 07:36:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vscSiWXy8mMZnBpllMi12SNnVJbmHvMubzz+nhlistz5Iu6XaEKXBmmM6W71v9YbwX6IZwt
X-Received: by 2002:a37:8641:: with SMTP id i62mr11468813qkd.290.1584110165692;
        Fri, 13 Mar 2020 07:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110165; cv=none;
        d=google.com; s=arc-20160816;
        b=fbTNpH1HT3QDjLN5HgpOOjel0L0gnBRtOZrlZl/34KaeY0UoKk8lf2ETzT5dG30e99
         GHpQcWAlN9WDe3jMUvIP+mekme7aoaBqW7anxW1PAvyHB95bmHmZ6+1zHVd2hFx+83Qu
         ikd4cPy96ZcpW7hzUHHboiHl7I4kM6vh+ZycAnxT8feT2Vxboa7wGn9pc4T3wxocaoZD
         jUro3DfIPQjFOS7HFAvdsK/LGv7cPvyh84XTaY145xN9GbzCeGoJg21yvtXunXaGGirI
         HIbkvG2FFgdyvOeIwxehjZVS6yJ5dO9RvPzBgkHK0bZ24w/WQfLf/w9IQigcnUVmI0Rs
         y56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=LjywHiaOudVGVnAq4/GJUsKnBJ0ndzG4l4NRbVS34SM=;
        b=A2X/JlOJkfuJ9g9HVjy2nd3fkJttis5MWaqjm2HlAyk8TuulQ9xGChh4pABREFqobs
         kGNtW9a4d/aKvuIHv6KJkavigyQVuoOHu57NPtDw2EdaVjoyUSOCy60oIYzhs4fL77KH
         JCCcNWG1x32ArkpACUU28gczfiPPdFR7oSh0+v1YNRQD/piAOLmQ4rJk9H1soLF21cGJ
         GXlSnHkZQT+NzC2C2W10i/b8nGf5vtsfg6TWg3Sa9EqPpsd/YA/S1FGCKKtibFkljkjd
         bKJg0Mb7aKvCABvbBwjDyBgojOU49IBllCHJcp5oqVaoxlxQw+1rcniYm1TB/Dsrvt62
         573Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b=c6eKI6qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si5036293qka.328.2020.03.13.07.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b=c6eKI6qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:59978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClPx-0008Ix-4V
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3Z-0005tU-K4
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3Y-0001fE-AS
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:33 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:40254
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3Y-0001cn-1v; Fri, 13 Mar 2020 03:48:32 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D7iq87022612; Fri, 13 Mar 2020 00:48:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=LjywHiaOudVGVnAq4/GJUsKnBJ0ndzG4l4NRbVS34SM=;
 b=c6eKI6qkQOk7Iv5QgcY/3s1pJzpwcfn4kj+4NYmjwgMSD8S4p5IiNwGrEHwlpz8n1hd/
 qPyHPw8TWxXQnBbdhR+040pX2/jxWeGjyOl933BCU0npAP6VnhQnfqKveipwMk7hugK1
 9olorg6YkcC/tRT4fdM1ra/ESE313aP88FZ05t9l/3z4Ggi3DTu90A7s8RyPv0zisLeY
 FWCdlYcTa7aky3vxW6Ox8xPjF1hISYtCSvYmyAJF+kpQW0pIQ5uqTH3PHbYwbQDigFIh
 zqE6MViHKzf4x+iikQjtDWHGhJRKBiu1Bu+Kv+JzIHZBc4sXhR0eqF8SOY0rLKoKjNY+ xQ== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0a-0016f401.pphosted.com with ESMTP id 2yqt7t2va8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:48:29 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 00:48:28 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:48:24 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v7 2/5] virtio-iommu: Add iommu notifier for map/unmap
Date: Fri, 13 Mar 2020 13:18:08 +0530
Message-ID: <20200313074811.27175-3-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313074811.27175-1-bbhushan2@marvell.com>
References: <20200313074811.27175-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_03:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:35:46 -0400
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
Cc: Eric Auger <eric.auger@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FZ77StT7Gzdj

This patch extends VIRTIO_IOMMU_T_MAP/UNMAP request to
notify registered iommu-notifier. Which will call vfio
notifier to map/unmap region in iommu.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events           |  2 +
 hw/virtio/virtio-iommu.c         | 66 +++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-iommu.h |  6 +++
 3 files changed, 73 insertions(+), 1 deletion(-)

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
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4cee8083bc..e51344a53e 100644
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
+    VirtioIOMMUNotifierNode *node;
     VirtIOIOMMUDomain *domain;
     VirtIOIOMMUInterval *interval;
     VirtIOIOMMUMapping *mapping;
+    VirtIOIOMMUEndpoint *ep;
 
     if (flags & ~VIRTIO_IOMMU_MAP_F_MASK) {
         return VIRTIO_IOMMU_S_INVAL;
@@ -339,9 +374,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
 
     g_tree_insert(domain->mappings, interval, mapping);
 
+    /* All devices in an address-space share mapping */
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
+            if (ep->id == node->iommu_dev->devfn) {
+                virtio_iommu_notify_map(&node->iommu_dev->iommu_mr,
+                                        virt_start, phys_start, size);
+            }
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
 
+static void virtio_iommu_remove_mapping(VirtIOIOMMU *s, VirtIOIOMMUDomain *domain,
+                                        VirtIOIOMMUInterval *interval)
+{
+    VirtioIOMMUNotifierNode *node;
+    VirtIOIOMMUEndpoint *ep;
+
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
+            if (ep->id == node->iommu_dev->devfn) {
+                virtio_iommu_notify_unmap(&node->iommu_dev->iommu_mr,
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
@@ -368,7 +431,7 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
         uint64_t current_high = iter_key->high;
 
         if (interval.low <= current_low && interval.high >= current_high) {
-            g_tree_remove(domain->mappings, iter_key);
+            virtio_iommu_remove_mapping(s, domain, iter_key);
             trace_virtio_iommu_unmap_done(domain_id, current_low, current_high);
         } else {
             ret = VIRTIO_IOMMU_S_RANGE;
@@ -655,6 +718,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
+    QLIST_INIT(&s->notifiers_list);
     virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
                 sizeof(struct virtio_iommu_config));
 
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 6f67f1020a..4539c8ae72 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -44,6 +44,11 @@ typedef struct IOMMUPciBus {
     IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
 } IOMMUPciBus;
 
+typedef struct VirtioIOMMUNotifierNode {
+    IOMMUDevice *iommu_dev;
+    QLIST_ENTRY(VirtioIOMMUNotifierNode) next;
+} VirtioIOMMUNotifierNode;
+
 typedef struct VirtIOIOMMU {
     VirtIODevice parent_obj;
     VirtQueue *req_vq;
@@ -56,6 +61,7 @@ typedef struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
+    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
 } VirtIOIOMMU;
 
 #endif
-- 
2.17.1

