Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3448257wru;
        Mon, 6 Aug 2018 13:22:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeOiZGynrqBUVqzqbcn9YzOSBzhNMB7I/3yDUxwO8AhXBJrsk4xRjvU+3IfrpygT+l+CQNN
X-Received: by 2002:ac8:3473:: with SMTP id v48-v6mr15114664qtb.400.1533586932500;
        Mon, 06 Aug 2018 13:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533586932; cv=none;
        d=google.com; s=arc-20160816;
        b=kP4iC9+9AS/hG6TXEgbOjH9lJ2kgOsYDp+i/1RQYz4tBtequox+J1MaWYE7vJqMy7X
         fS1zDRqFOPkX9DOigk2vKrOMvVPLyaQM6GpzN3usNsyLHZKIRvOjnUl7tCeUMcF3QWix
         fXe3AH9LxaMns20DWmNZLGUmCy0JGKJYfg2fB6BbMzGvu+6IKU6+X7vxuQnMB5D96r8q
         s/xUHE+TO3haOE8ps0NNh4pdh8BCwOOmX3cGVRVp6dZF2Rmw4F8HEp5GZdyQaaT6UXqO
         C5H2rNPndOkUZpEG4LQXdF+PF0r9iVJD3IJyhDXlaaK6RlDByjlUvQwToWM+LlF4oltO
         bpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bqiaf2kyLRyjkM/joy7d/XiiSIYZ3OBBKGtT+cvE7r0=;
        b=kmiasTnMCuAp1f0DNyJ3cagLl1aAN7ohEIew7HO8xdICny1nhp0PmI2+IHmVjwofe8
         XzkrnYlRoQRcrhINFzzoubsbruH/ZnH1goXHX/EkNsI4evT2tYNCeJeXQzYMJOBFCX3+
         rJxVMmcoPDfcpGFYwKjUyp4BwwlVX0gPgJ9NNqdoWAdM98RHS4/RDa+P7Qq7Q3RXnR4s
         2efnqrcBU7YGrqt7Xq9YjYShcxqgAB77sjcpL+HC5V4A7PJr2rxOt6MPVLiAzri36GEE
         q8KIvn6I9o0hgTvY3gfD7EqPRX+rkYXVtdBM8qNat8FcWP/U56G62vxsXJxSabJv9AmF
         2DTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n19-v6si8419159qkl.205.2018.08.06.13.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmm15-00035G-Sj
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:22:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluf-0006XF-35
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlud-0006zj-QW
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56826 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmlua-0006uP-VY; Mon, 06 Aug 2018 16:15:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FAE67C6A9;
	Mon,  6 Aug 2018 20:15:28 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6212E2156711;
	Mon,  6 Aug 2018 20:15:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:39 +0200
Message-Id: <1533586484-5737-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 20:15:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 20:15:28 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v7 11/16] virtio-iommu: Implement fault reporting
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
Cc: wei@redhat.com, kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e3j725r9PsHp

The event queue allows to report asynchronous errors.
The translate function now injects faults when relevant.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 67 +++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 69aba56..9a60366 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -69,3 +69,4 @@ virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRI
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start, uint64_t end, uint32_t flags, size_t filled) "dev= %d, subtype=%d start=0x%"PRIx64" end=0x%"PRIx64" flags=%d filled=0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
+virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index ec0cf1e..7b77b3b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -693,16 +693,62 @@ push:
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
+    bool read_fault, write_fault;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -723,6 +769,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
     if (!ep) {
         error_report("%s sid=%d is not known!!", __func__, sid);
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_UNKNOWN,
+                                  0, sid, 0);
         goto unlock;
     }
 
@@ -730,6 +778,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s %02x:%02x.%01x not attached to any domain\n",
                       __func__, PCI_BUS_NUM(sid), PCI_SLOT(sid), PCI_FUNC(sid));
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_DOMAIN,
+                                  0, sid, 0);
         goto unlock;
     }
 
@@ -738,14 +788,25 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
2.5.5

