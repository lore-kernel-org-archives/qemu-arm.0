Received: by 10.28.71.27 with SMTP id u27csp850596wma;
        Fri, 19 Jan 2018 07:09:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBouoC57DPdcv/tm75NEO1HpE3ffMXR+2rL4F5wSY+I4a9CFBhI5Tua/qbx1LeZjfABm0OyIC
X-Received: by 10.37.95.15 with SMTP id t15mr29770456ybb.453.1516374587850;
        Fri, 19 Jan 2018 07:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374587; cv=none;
        d=google.com; s=arc-20160816;
        b=wkHJ/t8uFuzIUniZPN1nLqP2Ti7s4mCfRXKjMOBHW2X6HTV1sqbVBoCAUIDCGA/W+k
         nS4S3TUoPMASHb5hh3lcNRy8re8Ki/0FW6RN1xOCuGBX256uo4Rs2Xh0tFpnKqUegBjm
         l4MU/oTQeC5yEO4zhkTvBwkjc3bq9Mw+6q3qSIgUtmOIDc3FbPUXxD+T/cMpWQk6sQ6f
         18UGbx5867nUFlo2enTL52NoIkKjxXwhBqQloJFdr4U0E8prRE//o3jq234UOscr5AP5
         AVbLbLU5vxLCgVolS3UCl0xrn5bdiPzHyL8Ld7LnbuWUovCfI99rxdhJtKZKbS4DzV0H
         MOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ZsiC7CZwNsvIEUBFsYXHvV65ht5hfeNaBvzINb6cqIw=;
        b=HoUaL02TIPUmYdyXAMinevfdOLPnH6Mpb0iDq8c6ELVCsZm0xY1hgvYjfsZfasUWid
         drJTpzXb3UNbgstRkij54O5Kk8DYetxl+AnRbVX7OTL3LmgvWr2CB95BT6vxbUJhH//q
         ioPR+kejNGbNr8L2FJGEGdteG26m9mVjngNmKGndem7O0bCPiNpOk+aihdFHVGAFgySP
         oGfXulN8Dzfp80q8T4utTAKNHYUFMBH/dAokeKAB+qdYUjgYA7Rte0UDWxs0b5rV1p5H
         rGtI7qwbU1RQFjhfopaPH8fZ2wFe3c8fjC5OKrG3rRY4j9+fPlJKRNbGKtYnoPuvsZiX
         WMxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si630183ybb.292.2018.01.19.07.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYId-0003xk-78
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:09:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYEO-0000PU-2M
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 10:05:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYEJ-00015V-Gj
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 10:05:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYE8-0000rc-45; Fri, 19 Jan 2018 10:05:08 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1955A776C4;
	Fri, 19 Jan 2018 15:05:07 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B1145C1B7;
	Fri, 19 Jan 2018 15:04:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:08 +0000
Message-Id: <1516373355-305-16-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 19 Jan 2018 15:05:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 15/22] virtio-iommu: Implement fault reporting
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
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /uYvYpAOELgK

The event queue allows to report asynchronous errors.
The translate function now injects faults when relevant.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 67 +++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 6a502cc..b6f1812 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -48,3 +48,4 @@ virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRI
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
+virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 306a633..ec5cfce 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -693,15 +693,61 @@ push:
     }
 }
 
+static void virtio_iommu_report_fault(VirtIOIOMMU *viommu, uint8_t reason,
+                                      uint32_t flags, uint32_t endpoint,
+                                      uint64_t address)
+{
+    VirtIODevice *vdev = &viommu->parent_obj;
+    VirtQueue *vq = viommu->event_vq;
+    struct virtio_iommu_fault fault;
+    VirtQueueElement *elem;
+    size_t sz;
+
+    memset(&fault, 0, sizeof(fault));
+    fault.reason = reason;
+    fault.flags = flags;
+    fault.endpoint = endpoint;
+    fault.address = address;
+
+    for (;;) {
+        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
+
+        if (!elem) {
+            virtio_error(vdev,
+                         "no buffer available in event queue to report event");
+            return;
+        }
+
+        if (iov_size(elem->in_sg, elem->in_num) < sizeof(fault)) {
+            virtio_error(vdev, "error buffer of wrong size");
+            virtqueue_detach_element(vq, elem, 0);
+            g_free(elem);
+            continue;
+        }
+        break;
+    }
+    /* we have a buffer to fill in */
+    sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
+                      &fault, sizeof(fault));
+    assert(sz == sizeof(fault));
+
+    trace_virtio_iommu_report_fault(reason, flags, endpoint, address);
+    virtqueue_push(vq, elem, sz);
+    virtio_notify(vdev, vq);
+    g_free(elem);
+
+}
+
 static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                             IOMMUAccessFlags flag)
 {
     IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
     VirtIOIOMMU *s = sdev->viommu;
-    uint32_t sid;
+    uint32_t sid, flags;
     viommu_endpoint *ep;
     viommu_mapping *mapping;
     viommu_interval interval;
+    bool read_fault, write_fault;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -722,12 +768,16 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
     if (!ep) {
         error_report("%s sid=%d is not known!!", __func__, sid);
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_UNKNOWN,
+                                  0, sid, 0);
         goto unlock;
     }
 
     if (!ep->domain) {
         error_report("%s %02x:%02x.%01x not attached to any domain", __func__,
                      PCI_BUS_NUM(sid), PCI_SLOT(sid), PCI_FUNC(sid));
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_DOMAIN,
+                                  0, sid, 0);
         goto unlock;
     }
 
@@ -735,13 +785,24 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     if (!mapping) {
         error_report("%s no mapping for 0x%"PRIx64" for sid=%d", __func__,
                      addr, sid);
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                  0, sid, addr);
         goto unlock;
     }
 
-    if (((flag & IOMMU_RO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
-        ((flag & IOMMU_WO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+    read_fault = (flag & IOMMU_RO) &&
+                    !(mapping->flags & VIRTIO_IOMMU_MAP_F_READ);
+    write_fault = (flag & IOMMU_WO) &&
+                    !(mapping->flags & VIRTIO_IOMMU_MAP_F_WRITE);
+
+    flags = read_fault ? VIRTIO_IOMMU_FAULT_F_READ : 0;
+    flags |= write_fault ? VIRTIO_IOMMU_FAULT_F_WRITE : 0;
+    if (flags) {
         error_report("Permission error on 0x%"PRIx64"(%d): allowed=%d",
                      addr, flag, mapping->flags);
+        flags |= VIRTIO_IOMMU_FAULT_F_ADDRESS;
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                  flags, sid, addr);
         goto unlock;
     }
     entry.translated_addr = addr - mapping->virt_addr + mapping->phys_addr;
-- 
1.9.1

