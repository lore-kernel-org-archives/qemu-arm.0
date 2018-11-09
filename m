Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp574931wrw;
        Fri, 9 Nov 2018 03:39:47 -0800 (PST)
X-Google-Smtp-Source: AJdET5c0gH6qCmE1oVULcfQD8i8B4qYclmOSx38QIBFDmIoDpNrm/nnF0G5JzbQN+3GTq0suaOsy
X-Received: by 2002:ad4:5282:: with SMTP id v2mr8324695qvr.195.1541763587192;
        Fri, 09 Nov 2018 03:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763587; cv=none;
        d=google.com; s=arc-20160816;
        b=j0PzWb4tQoaHtMqALCDUb+J0jjHEOIpcrq8nb3dVz21Si999AY2KTyDRR9Sm3gsFYx
         AqzcjDe8329Oc8EMQQrem2Eutpp3wA43inl42jIlxJ8c/YTOFo2z74HUYbbHhDIkUECe
         QL5/84jGHZV++DWuzfMsSbSrkNFHkXd1lpdErU/qD0y9kUDz6gAoT8eT60JxfS1hNBaM
         7TEL8+DBbewU5u3XlYfIkry5m9HgLux6EPO1mVNBg5yBPDdpkupJtM68MCCvUJw31w8/
         NCSIFgseGYGvuMaabzGRR51yPJ2lO2LFp38KjCcUrj6J0/OlEYUAbGDETMtykPzZLLNd
         xfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=c61USOTE9cHvkJGRNqYKDz6/MDa8DA1kRitPFQDrkAQ=;
        b=pAk+gom3oMgTnBNJBzIfqBIvRw3+wYM1A4YeVzq7jkD2IxBl4V0l7FpgIld155Nhak
         IyPQZAdr84lTD/YBuVQaRi/FUCCdsZqZKmcdDPaUP9EdVLMDx5RbH9X6mTvRjDOedVoS
         QR6JMSZhmjkjYdpbitt7YJMJvqZgWVhHRNsKpPqg7/CftjuOjZOKlvNU92xX1kgqiBqb
         jTBROalYnRtS4dnj4yI9FUdpOCNu03Ec6UwhA6LQD4343pPakUsbEVmtG/3UEeqnjuPC
         Iotvr6n+KQd52pBSuNoUcr0IzLVYoCe5ugkxidmwgq+2vjiyrs4zBY2w4NCmsPHULp9l
         hqlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m185-v6si5126351qkb.188.2018.11.09.03.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL58c-00004y-L8
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:39:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50C-0006uC-RK
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL507-0001Km-5R
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:31:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58664)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL506-0001Gf-Si; Fri, 09 Nov 2018 06:30:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BAE27AE95;
	Fri,  9 Nov 2018 11:30:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C431D5C219;
	Fri,  9 Nov 2018 11:30:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:51 +0100
Message-Id: <20181109112957.10067-13-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 09 Nov 2018 11:30:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 12/18] virtio-iommu: Implement fault reporting
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HXXXhbvx9raq

The event queue allows to report asynchronous errors.
The translate function now injects faults when relevant.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 67 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 19824c3e91..053a07b3fc 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -71,3 +71,4 @@ virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRI
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start, uint64_t end, uint32_t flags, size_t filled) "dev= %d, subtype=%d start=0x%"PRIx64" end=0x%"PRIx64" flags=%d filled=0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
+virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index e6ad8a0c61..e5ab3db834 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -686,17 +686,63 @@ push:
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
                                             IOMMUAccessFlags flag,
                                             int iommu_idx)
 {
     IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
     VirtIOIOMMU *s = sdev->viommu;
-    uint32_t sid;
+    uint32_t sid, flags;
     viommu_endpoint *ep;
     viommu_mapping *mapping;
     viommu_interval interval;
     bool bypass_allowed;
+    bool read_fault, write_fault;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -721,6 +767,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     if (!ep) {
         if (!bypass_allowed) {
             error_report("%s sid=%d is not known!!", __func__, sid);
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_UNKNOWN,
+                                      0, sid, 0);
         } else {
             entry.perm = flag;
         }
@@ -732,6 +780,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s %02x:%02x.%01x not attached to any domain\n",
                           __func__, PCI_BUS_NUM(sid), PCI_SLOT(sid), PCI_FUNC(sid));
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_DOMAIN,
+                                      0, sid, 0);
         } else {
             entry.perm = flag;
         }
@@ -743,14 +793,25 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s no mapping for 0x%"PRIx64" for sid=%d\n",
                       __func__, addr, sid);
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
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Permission error on 0x%"PRIx64"(%d): allowed=%d\n",
                       addr, flag, mapping->flags);
+        flags |= VIRTIO_IOMMU_FAULT_F_ADDRESS;
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                  flags, sid, addr);
         goto unlock;
     }
     entry.translated_addr = addr - mapping->virt_addr + mapping->phys_addr;
-- 
2.17.2

