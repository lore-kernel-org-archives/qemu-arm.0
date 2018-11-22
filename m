Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp947100wrt;
        Thu, 22 Nov 2018 09:16:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X7XBBUlcf2tRRMfjslWm4dTvnpt07rvRzGNDBLyCzzCQ63Flt8Fn9rCbz+qkzDrU2S4zW+
X-Received: by 2002:a25:5342:: with SMTP id h63-v6mr11464450ybb.473.1542907017230;
        Thu, 22 Nov 2018 09:16:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907017; cv=none;
        d=google.com; s=arc-20160816;
        b=rBi2vj1gfLDaeL1NM17+kYBR0g2fVfhzGRJJWBQqYq9oHoYfzh3kHXfbE6NBXoHScm
         F7yUCGDEYZvNAXdpiQ70vRN/Sey7uXrqII/3RqCS9h2GhiKDucaFWDN2R3CSVfFkCArJ
         oDRl3L4GUG/08T5V9XPJcNArB2Xw6lTZtTVujVf6ux3m5XtU85wIG8eOVdlHFe5XWECj
         xFfSeLZmnBGj5p3viYMXaITCAH+jFM039gwAi7Ufc2h0zNw03OOeSk4uHfXfRxd4s8jS
         +C8bboOJn9G07tgbKgH+QMX2oIvN2jK3Xxpt1kwwZ7LE/WiwqCKwD1YXafJ1NXFqV6US
         j/Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=lLxZrWzH2qVkEjHMjkxZo0Ae+9LJvAa0JxZnaAOiqT8=;
        b=A/zyUUvLoStY0N37bSnEMHAeMHQinC86P0b/sQ+3OIzs8Q2I6MFNvooUmDM0hF/TFb
         Z1Mg3SrsBvqXfIO5/cIpkLd41wR7h5aJdYZkYAP9Sy4Aea7WIUnWxgOUixN+n8OvfvUV
         tnRBwk5Qi7pS99BoIIQHzxVC03f/e9lPgCCYNpKXrIhI2RyUsj3T5jvd5hEc2V2aep0B
         xmw7qyG6UWtbFWD++FrEP39WAND6zzFhaGeWwmaFMOJYSIsXo1N1ey1bClUK+A/WLGPr
         uh9zRKmCKkMAhz3Ljpl3wWm8OqlSAshB9WEv+ZuoHPZ8fF3J1l3k3J5XlAbMevz1Piiu
         oLsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e78-v6si31954976ybh.261.2018.11.22.09.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:16:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPsb2-0005CX-48
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:16:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsaK-0004iq-RQ
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsaI-0005Yj-Ug
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsaE-0005VN-Qs; Thu, 22 Nov 2018 12:16:08 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C4F4308339C;
	Thu, 22 Nov 2018 17:16:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E154660920;
	Thu, 22 Nov 2018 17:16:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:25 +0100
Message-Id: <20181122171538.12359-5-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 22 Nov 2018 17:16:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v9 04/17] virtio-iommu: Decode the command payload
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
X-TUID: EKS4tCXx33D0

This patch adds the command payload decoding and
introduces the functions that will do the actual
command handling. Those functions are not yet implemented.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v7 -> v8:
- handle new domain parameter in detach
- remove reserved checks

v5 -> v6:
- change map/unmap semantics (remove size)

v4 -> v5:
- adopt new v0.5 terminology

v3 -> v4:
- no flags field anymore in struct virtio_iommu_req_unmap
- test reserved on attach/detach, change trace proto
- rebase on v2.10.0.
---
 hw/virtio/trace-events   |  4 ++
 hw/virtio/virtio-iommu.c | 95 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 95 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 84da904d8b..e6177ca0e4 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -55,3 +55,7 @@ virtio_iommu_set_features(uint64_t features) "features accepted by the driver =0
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
 virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t domain_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
 virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t domain_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
+virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
+virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
+virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
+virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index d8894f047b..fc95751c40 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -33,29 +33,116 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+static int virtio_iommu_attach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_attach *req)
+{
+    uint32_t domain_id = le32_to_cpu(req->domain);
+    uint32_t ep_id = le32_to_cpu(req->endpoint);
+
+    trace_virtio_iommu_attach(domain_id, ep_id);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_detach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_detach *req)
+{
+    uint32_t domain_id = le32_to_cpu(req->domain);
+    uint32_t ep_id = le32_to_cpu(req->endpoint);
+
+    trace_virtio_iommu_detach(domain_id, ep_id);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_map(VirtIOIOMMU *s,
+                            struct virtio_iommu_req_map *req)
+{
+    uint32_t domain_id = le32_to_cpu(req->domain);
+    uint64_t phys_start = le64_to_cpu(req->phys_start);
+    uint64_t virt_start = le64_to_cpu(req->virt_start);
+    uint64_t virt_end = le64_to_cpu(req->virt_end);
+    uint32_t flags = le32_to_cpu(req->flags);
+
+    trace_virtio_iommu_map(domain_id, virt_start, virt_end, phys_start, flags);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_unmap(VirtIOIOMMU *s,
+                              struct virtio_iommu_req_unmap *req)
+{
+    uint32_t domain_id = le32_to_cpu(req->domain);
+    uint64_t virt_start = le64_to_cpu(req->virt_start);
+    uint64_t virt_end = le64_to_cpu(req->virt_end);
+
+    trace_virtio_iommu_unmap(domain_id, virt_start, virt_end);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+#define get_payload_size(req) (\
+sizeof((req)) - sizeof(struct virtio_iommu_req_tail))
+
 static int virtio_iommu_handle_attach(VirtIOIOMMU *s,
                                       struct iovec *iov,
                                       unsigned int iov_cnt)
 {
-    return -ENOENT;
+    struct virtio_iommu_req_attach req;
+    size_t sz, payload_sz;
+
+    payload_sz = get_payload_size(req);
+
+    sz = iov_to_buf(iov, iov_cnt, 0, &req, payload_sz);
+    if (sz != payload_sz) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    return virtio_iommu_attach(s, &req);
 }
 static int virtio_iommu_handle_detach(VirtIOIOMMU *s,
                                       struct iovec *iov,
                                       unsigned int iov_cnt)
 {
-    return -ENOENT;
+    struct virtio_iommu_req_detach req;
+    size_t sz, payload_sz;
+
+    payload_sz = get_payload_size(req);
+
+    sz = iov_to_buf(iov, iov_cnt, 0, &req, payload_sz);
+    if (sz != payload_sz) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    return virtio_iommu_detach(s, &req);
 }
 static int virtio_iommu_handle_map(VirtIOIOMMU *s,
                                    struct iovec *iov,
                                    unsigned int iov_cnt)
 {
-    return -ENOENT;
+    struct virtio_iommu_req_map req;
+    size_t sz, payload_sz;
+
+    payload_sz = get_payload_size(req);
+
+    sz = iov_to_buf(iov, iov_cnt, 0, &req, payload_sz);
+    if (sz != payload_sz) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    return virtio_iommu_map(s, &req);
 }
 static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
                                      struct iovec *iov,
                                      unsigned int iov_cnt)
 {
-    return -ENOENT;
+    struct virtio_iommu_req_unmap req;
+    size_t sz, payload_sz;
+
+    payload_sz = get_payload_size(req);
+
+    sz = iov_to_buf(iov, iov_cnt, 0, &req, payload_sz);
+    if (sz != payload_sz) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    return virtio_iommu_unmap(s, &req);
 }
 
 static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
-- 
2.17.2

