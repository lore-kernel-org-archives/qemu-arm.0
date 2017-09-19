Received: by 10.223.172.38 with SMTP id v35csp4643373wrc;
        Tue, 19 Sep 2017 00:51:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB8QKuH7cnH9HM2WZpTUdTDcPnU8ZzSRdPx+UctaiUJc3+NE4brjJ2p3KnxfcAHpA2E65Ny
X-Received: by 10.200.5.132 with SMTP id a4mr742698qth.318.1505807474862;
        Tue, 19 Sep 2017 00:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807474; cv=none;
        d=google.com; s=arc-20160816;
        b=Idl9fWCGwdKteuJCkYeiaIRPbgbkEyGOEjyLcPReKpBnzR4qxoSSpUycavxgOQqsvJ
         HwEi+H5RO+oTvUqrK/X87oZD090PmCYqxNMQsYp8DpbWyPpbwdAa4Cnc99D7ZRCFoEPg
         iOfwvQyday5C7U61M1ZUI7n8yNIChX3h7OLW25n9HaUsYqzaLXYgAotD02LajkCgLUMa
         qT7jozYw4Ib+KwPxIO47oXl0h/kDtdRwxW9hvbm++ljMsBLtUm85GTgna887oGKhyg+F
         sZ4/3JB4HIrsPU4G1GA5IjUK7ArL5P6GAhIu1k+KDWxuyAT/sWQxkK3yfZjEohzqStcj
         kgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=z96T9eyQ19/HyoAbGhe18eAI4xXV5YGUEHgWAEVymvs=;
        b=SVFiQgYhVcqiQj8fadsuy1jW5DAHnwfeIhrIjIUFgq2JuxEX2Rc6RY+I3MHwygBEsy
         XyFOLHuMAbbXOELSIeGzj0fzUSdw8/2iaewi2QQ2Y/LDxSaNqMgCx164uqBNvqaf14A3
         6pgU9Qfk8NBsbtPWmXHQJxj68Di0pbQdSB7gZNFTLdO/Ufc+xuWhnTQPbE37glZtFY9G
         HZv3Hpm3oVMg0K69F0yzmxFubP7MR6HIaOOyWb79QJ+MxH3385s0q1PasH8Vo02Z7RlY
         nWoWkPlrYNESopvvjsX0Q1m2csKw/bHgWCOx2bUYAyUh6mpAx3T4gnK60Sb0cDjdy/9u
         gb7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a42si9024372qtk.92.2017.09.19.00.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDJI-0002EU-HU
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:51:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDGn-0000AB-8j
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDGj-00012z-0s
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:48:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDGi-00012e-O1; Tue, 19 Sep 2017 03:48:32 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90537883DA;
	Tue, 19 Sep 2017 07:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 90537883DA
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8F7B60466;
	Tue, 19 Sep 2017 07:48:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:40 +0200
Message-Id: <1505807208-9063-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 19 Sep 2017 07:48:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 08/16] virtio-iommu: Implement map/unmap
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZjQ9nC7ePjyC

This patch implements virtio_iommu_map/unmap.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- implement unmap semantics as specified in v0.4
---
 hw/virtio/trace-events   |  3 ++
 hw/virtio/virtio-iommu.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 74b92d3..da298c1 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -42,3 +42,6 @@ virtio_iommu_get_dev(uint32_t devid) "Alloc devid=%d"
 virtio_iommu_put_dev(uint32_t devid) "Free devid=%d"
 virtio_iommu_get_as(uint32_t asid) "Alloc asid=%d"
 virtio_iommu_put_as(uint32_t asid) "Free asid=%d"
+virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index bd859fb..6f1a7d1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -56,6 +56,13 @@ typedef struct viommu_interval {
     uint64_t high;
 } viommu_interval;
 
+typedef struct viommu_mapping {
+    uint64_t virt_addr;
+    uint64_t phys_addr;
+    uint64_t size;
+    uint32_t flags;
+} viommu_mapping;
+
 static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
 {
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
@@ -264,10 +271,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     uint64_t virt_addr = le64_to_cpu(req->virt_addr);
     uint64_t size = le64_to_cpu(req->size);
     uint32_t flags = le32_to_cpu(req->flags);
+    viommu_as *as;
+    viommu_interval *interval;
+    viommu_mapping *mapping;
+
+    interval = g_malloc0(sizeof(*interval));
+
+    interval->low = virt_addr;
+    interval->high = virt_addr + size - 1;
+
+    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
+    if (!as) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
+    mapping = g_tree_lookup(as->mappings, (gpointer)interval);
+    if (mapping) {
+        g_free(interval);
+        return VIRTIO_IOMMU_S_INVAL;
+    }
 
     trace_virtio_iommu_map(asid, phys_addr, virt_addr, size, flags);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    mapping = g_malloc0(sizeof(*mapping));
+    mapping->virt_addr = virt_addr;
+    mapping->phys_addr = phys_addr;
+    mapping->size = size;
+    mapping->flags = flags;
+
+    g_tree_insert(as->mappings, interval, mapping);
+
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_unmap(VirtIOIOMMU *s,
@@ -276,10 +310,63 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     uint32_t asid = le32_to_cpu(req->address_space);
     uint64_t virt_addr = le64_to_cpu(req->virt_addr);
     uint64_t size = le64_to_cpu(req->size);
+    viommu_mapping *mapping;
+    viommu_interval interval;
+    viommu_as *as;
 
     trace_virtio_iommu_unmap(asid, virt_addr, size);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
+    if (!as) {
+        error_report("%s: no as", __func__);
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+    interval.low = virt_addr;
+    interval.high = virt_addr + size - 1;
+
+    mapping = g_tree_lookup(as->mappings, (gpointer)(&interval));
+
+    while (mapping) {
+        viommu_interval current;
+        uint64_t low  = mapping->virt_addr;
+        uint64_t high = mapping->virt_addr + mapping->size - 1;
+
+        current.low = low;
+        current.high = high;
+
+        if (low == interval.low && size >= mapping->size) {
+            g_tree_remove(as->mappings, (gpointer)(&current));
+            interval.low = high + 1;
+            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
+                interval.low, interval.high);
+        } else if (high == interval.high && size >= mapping->size) {
+            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
+                interval.low, interval.high);
+            g_tree_remove(as->mappings, (gpointer)(&current));
+            interval.high = low - 1;
+        } else if (low > interval.low && high < interval.high) {
+            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
+            g_tree_remove(as->mappings, (gpointer)(&current));
+        } else {
+            break;
+        }
+        if (interval.low >= interval.high) {
+            return VIRTIO_IOMMU_S_OK;
+        } else {
+            mapping = g_tree_lookup(as->mappings, (gpointer)(&interval));
+        }
+    }
+
+    if (mapping) {
+        error_report("****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
+                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported",
+                     __func__, interval.low, size,
+                     mapping->virt_addr, mapping->size);
+    } else {
+        return VIRTIO_IOMMU_S_OK;
+    }
+
+    return VIRTIO_IOMMU_S_INVAL;
 }
 
 #define get_payload_size(req) (\
-- 
2.5.5

