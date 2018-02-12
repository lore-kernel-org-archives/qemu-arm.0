Received: by 10.28.71.27 with SMTP id u27csp212576wma;
        Mon, 12 Feb 2018 11:07:37 -0800 (PST)
X-Google-Smtp-Source: AH8x227ZcbsqgzaCL24CvecrKEYDVIvy07flql9qKb1m6PM4wR2bLzhg+Z/19PcZ/HFIpCpQQLPE
X-Received: by 10.37.66.194 with SMTP id p185mr5147982yba.236.1518462457231;
        Mon, 12 Feb 2018 11:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462457; cv=none;
        d=google.com; s=arc-20160816;
        b=dqS5zNceIrdyEvZOa5XNyprGo7qtdZY4L7X9yRdltNHGCEcCnaKw/HKS58H9iHUOHz
         IlD0mAe9BrvZNRJJlvMAJRMqyqqQoDziS/K+EUP77r9Y0p8FVInop5SFN6mg7tdmKLh9
         uhcdNl7qB8OTIYE8iOefDII3Aq7mV002gaWHGdjD0TO4K27pDO5XpB4Jnpqyp0TVLurQ
         JWujdMHPEFfiYMyf9P61x1IaJMu74lQWMOMv4ib1tNe/Sobym0h+ETwkMDhLEvFEQzie
         Fn23kDRoPKLHOi4ckqHHUQEIPj5YofLAwBoWFF8aEZcJ63Fo7WeAsfWsKZnOFH7lvv7c
         dHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=mOAey/Qwdy0WEqHLr9KFTl+QcZ735pcXZ6SGynjDQeE=;
        b=a8l/dGjUtC+Z9wFJv6KUIyCZpPALlDhGYXZmLA3J4jpnAHszye7aVd3GPwXjEOUcyZ
         dv0rfuT77dFmWNtBJ1BZmtTWjI2CdcTp8n30U59C1SkdXnCTNuctsghpK9kVMXEEkOq2
         +0mkt/T/PCSv5Ntc3K25TVqBV4rTdutO5SdAtNlCZ0JUJ2pF9yKTWLkawV+MdP1lcuCI
         f+0mWI/1PVobDbPnOqAYl7v3PPcHjqAFvenrxDIlNVkaCA9rXC14LCsy+wmY8///3Hyt
         xPSq4t7ShwDtIs0BB/JYS4vGSO61pf7jzQBwM9PCBjv0p+SJG0Q+iz8dtVw/Jbgnukt6
         LYOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d64si1637463ybi.596.2018.02.12.11.07.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:07:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJRw-0007I2-GY
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:07:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJL0-0001JU-PH
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKw-00058v-2Q
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:26 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37872 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJKv-000571-FO; Mon, 12 Feb 2018 14:00:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E14CF404084E;
	Mon, 12 Feb 2018 19:00:20 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3765E1008591;
	Mon, 12 Feb 2018 19:00:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:17 +0000
Message-Id: <1518461904-5305-16-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 12 Feb 2018 19:00:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 12 Feb 2018 19:00:21 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 15/22] virtio-iommu: Implement fault reporting
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
X-TUID: kIFx/joZTvJ1

The event queue allows to report asynchronous errors.
The translate function now injects faults when relevant.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 67 +++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index e3a916c..ce718e8 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -54,3 +54,4 @@ virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRI
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
+virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c81a24b..010e8e0 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -697,15 +697,61 @@ push:
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
@@ -726,6 +772,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
     if (!ep) {
         error_report("%s sid=%d is not known!!", __func__, sid);
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_UNKNOWN,
+                                  0, sid, 0);
         goto unlock;
     }
 
@@ -733,6 +781,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s %02x:%02x.%01x not attached to any domain\n",
                       __func__, PCI_BUS_NUM(sid), PCI_SLOT(sid), PCI_FUNC(sid));
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_DOMAIN,
+                                  0, sid, 0);
         goto unlock;
     }
 
@@ -741,14 +791,25 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
1.9.1

