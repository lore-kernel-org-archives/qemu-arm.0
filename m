Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp954790wrt;
        Thu, 22 Nov 2018 09:23:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5e1JZwkRzeaeg4qk4QYtkGR5Mou1nTj54c0a6hwu/qDoGudslrIakorbGeCvS92eioE0Mm1
X-Received: by 2002:a81:3548:: with SMTP id c69mr12185960ywa.247.1542907419439;
        Thu, 22 Nov 2018 09:23:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907419; cv=none;
        d=google.com; s=arc-20160816;
        b=gvP8JubGjTho/BbnxlOklkDz1By+potRCQCW22icjpQgcW0zsVT/mI2YMSRZyU9mY+
         jq6jeV8SivHD93B5eZGMIk3UU8m/na5/rtSPoJRv/wrN2ET87gDMTfJ8ShT4xm4mh2BL
         FubZjyIyN2vw46aSHVlIYmM2oJRWz8eAfURDA5hf4s0WlH9W8Iy/rdAhQRWoYhPT0PWE
         vxbHZfUV6MApbPrLSngiHHQUVjQoVettTaopzf50vcaHv5QEEy0lJyXNCzJZCiCm3I/H
         Wy/anEopHV6gM6lNLg7kKrvEzqttUx+Sl+P7OkeyjOy8sViAJZhoQmidtu0/AvTu71PN
         bwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=4jhDRTlp0ezWu4GahpBaMq8uGDBpIPQytstyiwqEkXQ=;
        b=UrqTwUDtp2GX2b5YTuVS9jDmL4OLsqe7Hk2rnhxzDEfdH2AffGJFckfrl8Sc0wWuX3
         mOEad0Sw3FEZjSAWnStYIhTzaWhdowOnsrLIgkhfqV18cKf03U2+Dfbf24GD2Hd3mnvU
         V7TEx6u9TRCpW1Bx/DJRka7jZiVFOwaHUSi+cKYXaGVR89Xacgcc3nWLKl4gT0EwR6dN
         UjXTkck5gqt2cIYPmi0dE6oz9+kd93sn49XP54JjtMxPmrizMFQkc8uiFvYxrVA0vDkc
         Yiqo/gZjX4+moM50AlYbRTsbkWSOBWtnXR868altQyUOchWE9L96MAI6qZZm0YH3hyH3
         RXig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p130si17447814ywc.85.2018.11.22.09.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:23:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPshW-0002im-2W
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:23:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsb0-0005Lw-N6
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 12:16:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsat-0006HJ-9n
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 12:16:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsaY-0005u3-SK; Thu, 22 Nov 2018 12:16:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B651030014CF;
	Thu, 22 Nov 2018 17:16:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F5A660610;
	Thu, 22 Nov 2018 17:16:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:29 +0100
Message-Id: <20181122171538.12359-9-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 22 Nov 2018 17:16:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v9 08/17] virtio-iommu: Implement map/unmap
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XaYGLdjQlc4C

This patch implements virtio_iommu_map/unmap.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5 -> v6:
- use new v0.6 fields
- replace error_report by qemu_log_mask

v3 -> v4:
- implement unmap semantics as specified in v0.4
---
 hw/virtio/trace-events   |  3 ++
 hw/virtio/virtio-iommu.c | 94 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 4b15086872..b3c5c2604e 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -65,3 +65,6 @@ virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=%d"
 virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=%d"
 virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
+virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 5c231f865c..23f7dc6f7f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/iov.h"
 #include "qemu-common.h"
 #include "hw/virtio/virtio.h"
@@ -57,6 +58,13 @@ typedef struct viommu_interval {
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
@@ -244,10 +252,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     uint64_t virt_start = le64_to_cpu(req->virt_start);
     uint64_t virt_end = le64_to_cpu(req->virt_end);
     uint32_t flags = le32_to_cpu(req->flags);
+    viommu_domain *domain;
+    viommu_interval *interval;
+    viommu_mapping *mapping;
+
+    interval = g_malloc0(sizeof(*interval));
+
+    interval->low = virt_start;
+    interval->high = virt_end;
+
+    domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
+    if (!domain) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
+    mapping = g_tree_lookup(domain->mappings, (gpointer)interval);
+    if (mapping) {
+        g_free(interval);
+        return VIRTIO_IOMMU_S_INVAL;
+    }
 
     trace_virtio_iommu_map(domain_id, virt_start, virt_end, phys_start, flags);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    mapping = g_malloc0(sizeof(*mapping));
+    mapping->virt_addr = virt_start;
+    mapping->phys_addr = phys_start;
+    mapping->size = virt_end - virt_start + 1;
+    mapping->flags = flags;
+
+    g_tree_insert(domain->mappings, interval, mapping);
+
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_unmap(VirtIOIOMMU *s,
@@ -256,10 +291,65 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint64_t virt_start = le64_to_cpu(req->virt_start);
     uint64_t virt_end = le64_to_cpu(req->virt_end);
+    uint64_t size = virt_end - virt_start + 1;
+    viommu_mapping *mapping;
+    viommu_interval interval;
+    viommu_domain *domain;
 
     trace_virtio_iommu_unmap(domain_id, virt_start, virt_end);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
+    if (!domain) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no domain\n", __func__);
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+    interval.low = virt_start;
+    interval.high = virt_end;
+
+    mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
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
+            g_tree_remove(domain->mappings, (gpointer)(&current));
+            interval.low = high + 1;
+            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
+                interval.low, interval.high);
+        } else if (high == interval.high && size >= mapping->size) {
+            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
+                interval.low, interval.high);
+            g_tree_remove(domain->mappings, (gpointer)(&current));
+            interval.high = low - 1;
+        } else if (low > interval.low && high < interval.high) {
+            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
+            g_tree_remove(domain->mappings, (gpointer)(&current));
+        } else {
+            break;
+        }
+        if (interval.low >= interval.high) {
+            return VIRTIO_IOMMU_S_OK;
+        } else {
+            mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
+        }
+    }
+
+    if (mapping) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
+                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported\n",
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
2.17.2

