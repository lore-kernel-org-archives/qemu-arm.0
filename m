Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp419325lfm;
        Wed, 24 Jun 2020 06:27:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSXaDBRPLx31bvHfQ4GXKQx2CM949DdLFYIEzDVBVbq8641T3p6yjXj5UaHTHFLGcS9ed4
X-Received: by 2002:a25:348a:: with SMTP id b132mr47427711yba.491.1593005251453;
        Wed, 24 Jun 2020 06:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593005251; cv=none;
        d=google.com; s=arc-20160816;
        b=SsuFNfWwT/KJdSHNsvGS/ceUkjr6TYDqoI4wrQmDtZrJ+pPk3duc/Q5ODi/H3tTeKh
         ksj4njlyllxVNRmFUarrOkX0Ko0pSBorGg0xFzgb1b0z9nTEFKsNXIlWVlgeUHWGcI6A
         1rBBamlNYBgk7td3SlVZKg7kR9so0Ppfruu1vM6aOMwBNnCykI5TqkzGzFD0jSpAwmEN
         1j9EDXpaU1sbO/FbTElfKERRtI8bMEPrAo0FxvRgHxVv7cXOqg9m2/O6HXLLpn5dmx70
         LbDvp9mwwMmGroHCI+4CIvzlWm427UbfrgzH8OFCGt4kjXB0lbNGMN5iBVPTUlD4BRf5
         iUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MWXvmyqWoIxSs98UdCxr8fJGHpnAa7vxi+UAOVmabs0=;
        b=V54GHXEjGNhN77BU3AzWoRCYkq2yTrKsnIOR2SpcMnVbb1A3qAYJutdEHLy0l4e76U
         4OctGbIPCiGsQgXIYki0XfUVnV+uDDmrLHHdlCm8sYU/cCCuE5cN3XpU8WuxKKgqlW+e
         uyAIEkqFI0MQLX3Py0HoiZkfc5oGF37b47mwbWMZnclGocJDQ2+BBjB84FwH1wJMeM7T
         Mae3+lkS3u6RDj2UeZ24HY62emuk4qL/vj+foM7zfskyzdILxyeSSVvwq5gyqCHBMva7
         TjuVrlKHC0M89bGoVukwKIbr064aUGIep4u/MA5SG1iDg3rPqtjzlyJBU1IMM74M18mC
         h4Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXzsbBRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si19983491ybk.162.2020.06.24.06.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 06:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXzsbBRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo5R4-0007pD-Oq
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 09:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo5Qs-0007k7-Vy
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 09:27:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36092
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo5QQ-0001h8-5D
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 09:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593005209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWXvmyqWoIxSs98UdCxr8fJGHpnAa7vxi+UAOVmabs0=;
 b=aXzsbBRTmyA/YtCxE9afp2vXc8JI73alycoN0Xr/a6yFtRHg962qfZKnvnbWbiyqTOEZ1u
 f9cPbtSTMZWeOnlg0a3Wm8c7c+cJyn8v3JWx6Pzz9W/EswGA00rpGSlwisl3Cdxq34xqy0
 lwtPv6+TeYXvOIXhkq/lGhVB5JCBFvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-QHnZrfHWO5uH9uZY85090w-1; Wed, 24 Jun 2020 09:26:45 -0400
X-MC-Unique: QHnZrfHWO5uH9uZY85090w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81C2D804003;
 Wed, 24 Jun 2020 13:26:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19CF810016DA;
 Wed, 24 Jun 2020 13:26:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v5 2/5] virtio-iommu: Implement RESV_MEM probe request
Date: Wed, 24 Jun 2020 15:26:22 +0200
Message-Id: <20200624132625.27453-3-eric.auger@redhat.com>
In-Reply-To: <20200624132625.27453-1-eric.auger@redhat.com>
References: <20200624132625.27453-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e9faCyngTNAG

This patch implements the PROBE request. At the moment,
only THE RESV_MEM property is handled. The first goal is
to report iommu wide reserved regions such as the MSI regions
set by the machine code. On x86 this will be the IOAPIC MSI
region, [0xFEE00000 - 0xFEEFFFFF], on ARM this may be the ITS
doorbell.

In the future we may introduce per device reserved regions.
This will be useful when protecting host assigned devices
which may expose their own reserved regions

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v4 -> v5:
- assert if reserved region type is different from RESERVED or
  MSI

v3 -> v4:
- removed any reference to the NONE property that does not
  exist anymore.

v2 -> v3:
- on probe, do not fill the reminder of the buffer with zeroes
  as the buffer was already zero initialized (Bharat)

v1 -> v2:
- move the unlock back to the same place
- remove the push label and factorize the code after the out label
- fix a bunch of cpu_to_leX according to the latest spec revision
- do not remove sizeof(last) from free space
- check the ep exists
---
 include/hw/virtio/virtio-iommu.h |  2 +
 hw/virtio/virtio-iommu.c         | 92 ++++++++++++++++++++++++++++++--
 hw/virtio/trace-events           |  1 +
 3 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index e653004d7c..49eb105cd8 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -53,6 +53,8 @@ typedef struct VirtIOIOMMU {
     GHashTable *as_by_busptr;
     IOMMUPciBus *iommu_pcibus_by_bus_num[PCI_BUS_MAX];
     PCIBus *primary_bus;
+    ReservedRegion *reserved_regions;
+    uint32_t nb_reserved_regions;
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 483883ec1d..aabc3e36b1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -38,6 +38,7 @@
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
+#define VIOMMU_PROBE_SIZE 512
 
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
@@ -378,6 +379,63 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     return ret;
 }
 
+static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
+                                               uint8_t *buf, size_t free)
+{
+    struct virtio_iommu_probe_resv_mem prop = {};
+    size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
+    int i;
+
+    total = size * s->nb_reserved_regions;
+
+    if (total > free) {
+        return -ENOSPC;
+    }
+
+    for (i = 0; i < s->nb_reserved_regions; i++) {
+        prop.head.type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_RESV_MEM);
+        prop.head.length = cpu_to_le16(length);
+        prop.subtype = s->reserved_regions[i].type;
+        assert(prop.subtype == VIRTIO_IOMMU_RESV_MEM_T_RESERVED ||
+               prop.subtype == VIRTIO_IOMMU_RESV_MEM_T_MSI);
+        prop.start = cpu_to_le64(s->reserved_regions[i].low);
+        prop.end = cpu_to_le64(s->reserved_regions[i].high);
+
+        memcpy(buf, &prop, size);
+
+        trace_virtio_iommu_fill_resv_property(ep, prop.subtype,
+                                              prop.start, prop.end);
+        buf += size;
+    }
+    return total;
+}
+
+/**
+ * virtio_iommu_probe - Fill the probe request buffer with
+ * the properties the device is able to return
+ */
+static int virtio_iommu_probe(VirtIOIOMMU *s,
+                              struct virtio_iommu_req_probe *req,
+                              uint8_t *buf)
+{
+    uint32_t ep_id = le32_to_cpu(req->endpoint);
+    size_t free = VIOMMU_PROBE_SIZE;
+    ssize_t count;
+
+    if (!virtio_iommu_mr(s, ep_id)) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
+    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
+    if (count < 0) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    buf += count;
+    free -= count;
+
+    return VIRTIO_IOMMU_S_OK;
+}
+
 static int virtio_iommu_iov_to_req(struct iovec *iov,
                                    unsigned int iov_cnt,
                                    void *req, size_t req_sz)
@@ -407,15 +465,27 @@ virtio_iommu_handle_req(detach)
 virtio_iommu_handle_req(map)
 virtio_iommu_handle_req(unmap)
 
+static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
+                                     struct iovec *iov,
+                                     unsigned int iov_cnt,
+                                     uint8_t *buf)
+{
+    struct virtio_iommu_req_probe req;
+    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
+
+    return ret ? ret : virtio_iommu_probe(s, &req, buf);
+}
+
 static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
     struct virtio_iommu_req_head head;
     struct virtio_iommu_req_tail tail = {};
+    size_t output_size = sizeof(tail), sz;
     VirtQueueElement *elem;
     unsigned int iov_cnt;
     struct iovec *iov;
-    size_t sz;
+    void *buf = NULL;
 
     for (;;) {
         elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
@@ -452,6 +522,17 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
         case VIRTIO_IOMMU_T_UNMAP:
             tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
             break;
+        case VIRTIO_IOMMU_T_PROBE:
+        {
+            struct virtio_iommu_req_tail *ptail;
+
+            output_size = s->config.probe_size + sizeof(tail);
+            buf = g_malloc0(output_size);
+
+            ptail = (struct virtio_iommu_req_tail *)
+                        (buf + s->config.probe_size);
+            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
+        }
         default:
             tail.status = VIRTIO_IOMMU_S_UNSUPP;
         }
@@ -459,12 +540,13 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
 
 out:
         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
-                          &tail, sizeof(tail));
-        assert(sz == sizeof(tail));
+                          buf ? buf : &tail, output_size);
+        assert(sz == output_size);
 
-        virtqueue_push(vq, elem, sizeof(tail));
+        virtqueue_push(vq, elem, sz);
         virtio_notify(vdev, vq);
         g_free(elem);
+        g_free(buf);
     }
 }
 
@@ -667,6 +749,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
     s->config.domain_range.end = 32;
+    s->config.probe_size = VIOMMU_PROBE_SIZE;
 
     virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
     virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
@@ -676,6 +759,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
 
     qemu_mutex_init(&s->mutex);
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 6427a0047d..23109f69bb 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -74,3 +74,4 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
+virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start, uint64_t end) "dev= %d, type=%d start=0x%"PRIx64" end=0x%"PRIx64
-- 
2.20.1

