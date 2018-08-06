Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3445234wru;
        Mon, 6 Aug 2018 13:18:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeg5lj5H58jwLDZghZ5JWFmXGxrLzbrq7v4gA0bpIbaniU8AvWuE5jYpDjYtYEqI8jf33VJ
X-Received: by 2002:a0c:e984:: with SMTP id z4-v6mr14166518qvn.227.1533586710683;
        Mon, 06 Aug 2018 13:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533586710; cv=none;
        d=google.com; s=arc-20160816;
        b=M2f7KQmv+DpIwLRTxVbCizY5liqkhtpkyTjMPLHegPupC3QVIHcwI34PuQ/7+dyC3g
         +FQ8sj/ScRmYeWJD2El5QQGf7lREshTQgx/wk0VVCmoEsxrAFA52siWxGa+XTQFTfMJv
         Bt0fu0bPhWybbN9qCkjIB9iRGuQ0Z0d+bO8s28Ud5t57qJ6NxEQP6Nl4/YNU8ftiq6Qv
         xW4yoclW6ksjWRwozVVyY8GOG74yF6HdomU+VpiHcOzy682CNA2jHqvrVJVks2sf/EfM
         mQsHMVavhY/8Tzj4wZaMq7HrVQTs5T7zyfLrgs+es8OTtAqcLmDP3ZgHREpImOKxx8Vx
         WuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0Vr3+XD1AJPU49CyWiqusIxD7fYKD0x5Vg3H1fbxpbI=;
        b=jOj9fGXeOBn8qizO76oVFWpx7ddnFoYeVRBCP1gPoisksW6bZDniYYG0KfpkcjfXyl
         ipvYArj6tDGAnok7BPlRP2ZsDy0mG+2/HOmuyjHcNZPKLuxrBIyr3b1MCHY+cj2lt4xr
         stXiOaaoYlbll67JLaPffs1iXJyV7+SCvvWo+tLKqCYhgmwWzRzpgDjPBJ+9+NX8+Scd
         pQLHNcolMPDqsOou4gEI2Nd2XS80pSYfMpedJP6TbIE12iH1KuvYq9QLiR6eUp/TLSgB
         nUWHu7Qjck5hK1Fq9iNWq5SScJiZwBo3n01h5UZYGfpdhCQBMdWXNrBJZplMQErqs5ff
         WHNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4-v6si3015025qkl.297.2018.08.06.13.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmlxV-0000G9-QS
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:18:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluP-0006EP-Q5
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluO-0006h4-CF
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46960 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmluO-0006gg-0z; Mon, 06 Aug 2018 16:15:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9399A87A70;
	Mon,  6 Aug 2018 20:15:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18001215670D;
	Mon,  6 Aug 2018 20:15:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:35 +0200
Message-Id: <1533586484-5737-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 06 Aug 2018 20:15:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 06 Aug 2018 20:15:15 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 07/16] virtio-iommu: Implement map/unmap
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ty2mm74mi8cx

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
 hw/virtio/virtio-iommu.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f4d6b4b..926c50b 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -63,3 +63,6 @@ virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=%d"
 virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=%d"
 virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
+virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4cb6e15..f3a6799 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/iov.h"
 #include "qemu-common.h"
 #include "hw/virtio/virtio.h"
@@ -58,6 +59,13 @@ typedef struct viommu_interval {
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
@@ -253,10 +261,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
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
@@ -265,10 +300,65 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
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
2.5.5

