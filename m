Received: by 10.28.71.27 with SMTP id u27csp849340wma;
        Fri, 19 Jan 2018 07:08:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBosAxbiEjNYbUjzzTVPJosbWuvpyoUfdVxUOuHG39Siu2UL6jmGpxLyUgHB4h6hagK4ZOh2+
X-Received: by 10.13.223.6 with SMTP id i6mr9686575ywe.503.1516374525264;
        Fri, 19 Jan 2018 07:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374525; cv=none;
        d=google.com; s=arc-20160816;
        b=C+pfTLXafc1nMK3ShZTofJiuh51qmwRbbCzHcZ6N7YqrdJ2UFHJ1/w/iT6sSJCROfx
         pytaY479U5q1Zi35Q8Ir5FMpAskCCjXbt7JtuDjH0kxMVB21Ta3ZptYeHzul0ejbriim
         3oi5Npz2JHxaC8pv+ZvnchxMf0tQ31bacOlRnKfUZOnhhoqdjLDbrfbTwwd8Pvvl1jhq
         Rs212G/AWT9EKzuoRpMx1ewm3YZ3ldTgYo3xZ9pqYv01DD5mW1leJqw05IflHp4QjpXl
         km8bb2/k/naH6APawxjgCyFfPWc2+5kSdoj9g+cfLGdhffKxavLQQJekkOelWEraa8xQ
         pTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=GAek3KRuD+4zc+ZzCKG8eKz9agpDeYst4Jf0mDu3ivY=;
        b=RXQryOF+Qt7RPGLl71vN4puQUioFcpC5DHr6aFwBtkoRjNPo4iwdAg2AE6Y1CPocBT
         Vurqx+rD0b4bXSNJHCJldkeIiqHnBV9GwtOFisohK9NB6dZBZPV3eBh2j/V4Xm7F3U1v
         rnaeLZzqI4Ghibf8SzppwsumV4GLvXuaxz+1Gjm3pCyxkOdiEXjGy5Wgrk11k/XqfgAj
         RVafc3Sn7CSI8KsfDK0MlT+9KuQuFmrA0a8xEL7nl7753rTYoymnNQaWA16m4g/z9k2V
         kn8zZqimO5Gul8xaKrADGF42B1Lpjnn3Q5DFHuCJFU64NLk86JnoWb4NgOGxAc1vvS6a
         4F0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si9328ybj.748.2018.01.19.07.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:08:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYHc-0003Ki-I5
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:08:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYBp-0006Ss-0d
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:02:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYBl-00073f-QF
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:02:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55928)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYBl-00073F-IM; Fri, 19 Jan 2018 10:02:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91705C05678E;
	Fri, 19 Jan 2018 15:02:40 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 252455C1B7;
	Fri, 19 Jan 2018 15:02:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:04 +0000
Message-Id: <1516373355-305-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 19 Jan 2018 15:02:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 11/22] virtio-iommu: Implement map/unmap
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
X-TUID: VtnEd0OoNw4x

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
index 59c75da..3ce9b82 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -42,3 +42,6 @@ virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=%d"
 virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=%d"
 virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
+virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index b30d761..f530eca 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -58,6 +58,13 @@ typedef struct viommu_interval {
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
@@ -253,10 +260,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     uint64_t virt_addr = le64_to_cpu(req->virt_addr);
     uint64_t size = le64_to_cpu(req->size);
     uint32_t flags = le32_to_cpu(req->flags);
+    viommu_domain *domain;
+    viommu_interval *interval;
+    viommu_mapping *mapping;
+
+    interval = g_malloc0(sizeof(*interval));
+
+    interval->low = virt_addr;
+    interval->high = virt_addr + size - 1;
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
 
     trace_virtio_iommu_map(domain_id, phys_addr, virt_addr, size, flags);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    mapping = g_malloc0(sizeof(*mapping));
+    mapping->virt_addr = virt_addr;
+    mapping->phys_addr = phys_addr;
+    mapping->size = size;
+    mapping->flags = flags;
+
+    g_tree_insert(domain->mappings, interval, mapping);
+
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_unmap(VirtIOIOMMU *s,
@@ -265,10 +299,63 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint64_t virt_addr = le64_to_cpu(req->virt_addr);
     uint64_t size = le64_to_cpu(req->size);
+    viommu_mapping *mapping;
+    viommu_interval interval;
+    viommu_domain *domain;
 
     trace_virtio_iommu_unmap(domain_id, virt_addr, size);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
+    if (!domain) {
+        error_report("%s: no domain", __func__);
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+    interval.low = virt_addr;
+    interval.high = virt_addr + size - 1;
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
1.9.1

