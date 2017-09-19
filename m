Received: by 10.223.172.38 with SMTP id v35csp4641432wrc;
        Tue, 19 Sep 2017 00:48:18 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBmX7x1IlvQXlNP5dXS7sHRXlIR9LQ9ERdmBGWo5o7Ug4eLyxvobOA38Vy/cxGKNaxNkobU
X-Received: by 10.200.28.46 with SMTP id a43mr723819qtk.179.1505807298645;
        Tue, 19 Sep 2017 00:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807298; cv=none;
        d=google.com; s=arc-20160816;
        b=GsTxAitQ2Xcg+c8XZWXk9K7f6pWQzuL4xB0FaHlpeYuk05b9apQ4WTnBVr0TiSViIk
         RSzmG2MO8MvX6ADvy/t8vottOhyIGCHAvuQwVtuy/tk8Rpy67dHywebWMc5f3PIUL7ww
         a8wB/clhajB1wngbwzE/7vuR7lEp6u7dawv4jcc+1Eb/JAlawdm/irCMkp+wmpvG+pRA
         VhJqKRzN1S6cjH03kdD84zeREMBi2MMZO32t3jsP/ZHoDHZrWkDKFZ9M3ACciSE7yiL1
         FRaieG5ieUt8zH1xUXMH+sjE9zcmnhet0Ot/pvfjlPUd7KGTo8mpjG1aMi7TiShJ6Twi
         QoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=A9LJpSNJ+ojZFmFAegMCjkQEuIPJUffu6a+QOzANYv4=;
        b=J+tP9IbayCGIbHMR/dgqt6l0sWqawNzG9GHk+SHOz2YCO7j9hDJtA1e2wUIUtXreqh
         B1EaB0FvrMGpbYt/tmbiM0fRNMxQuNrcan4AwjjnQW8hgpNDSzGSUd3UW/diO6/AWb6a
         QS6nRGoJCsgylntdJG9HegSArI9g5Q5e1OZMKuDFu/SGNyvOxSGK7IYJW6LS7dL+v9kI
         FgRSBYtekxryBtoZbHZv9UdJ/tGaRohv+eE1zYouw7BnoYz/1Pvonh+YokYtdkH+T8TM
         /ConatR4z1GwtdU0+cdOWcpuL6XTKI0A4dLeyOo9j4QNJid+L9x2CVcBzCeAfKKOH9l+
         tQyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m2si8690246qtk.191.2017.09.19.00.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDGS-00089A-8a
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:48:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDG7-00083N-4G
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:47:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDG6-0000iT-06
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:47:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDG5-0000hX-Mo; Tue, 19 Sep 2017 03:47:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E4FF2C975D;
	Tue, 19 Sep 2017 07:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8E4FF2C975D
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF81D61342;
	Tue, 19 Sep 2017 07:47:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:36 +0200
Message-Id: <1505807208-9063-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 19 Sep 2017 07:47:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 04/16] virtio-iommu: Decode the command payload
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
X-TUID: SRbGmmbeTVxE

This patch adds the command payload decoding and
introduces the functions that will do the actual
command handling. Those functions are not yet implemented.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- no flags field anymore in struct virtio_iommu_req_unmap
- test reserved on attach/detach, change trace proto

v3 -> v4:
- rebase on v2.10.0.
---
 hw/virtio/trace-events   |   4 ++
 hw/virtio/virtio-iommu.c | 104 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 104 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 98cf9a1..a35dc62 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -32,3 +32,7 @@ virtio_iommu_set_features(uint64_t features) "features accepted by the driver =0
 virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
 virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t ioasid_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" ioasid_bits=%d probe_size=0x%x"
+virtio_iommu_attach(uint32_t as, uint32_t dev) "as=%d dev=%d"
+virtio_iommu_detach(uint32_t dev) "dev=%d"
+virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr, uint64_t size, uint32_t flags) "as= %d phys_addr=0x%"PRIx64" virt_addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d"
+virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size) "as= %d virt_addr=0x%"PRIx64" size=0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 36e5b5f..51f9003 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -35,29 +35,125 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+static int virtio_iommu_attach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_attach *req)
+{
+    uint32_t asid = le32_to_cpu(req->address_space);
+    uint32_t devid = le32_to_cpu(req->device);
+    uint32_t reserved = le32_to_cpu(req->reserved);
+
+    trace_virtio_iommu_attach(asid, devid);
+
+    if (reserved) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_detach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_detach *req)
+{
+    uint32_t devid = le32_to_cpu(req->device);
+    uint32_t reserved = le32_to_cpu(req->reserved);
+
+    trace_virtio_iommu_detach(devid);
+
+    if (reserved) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_map(VirtIOIOMMU *s,
+                            struct virtio_iommu_req_map *req)
+{
+    uint32_t asid = le32_to_cpu(req->address_space);
+    uint64_t phys_addr = le64_to_cpu(req->phys_addr);
+    uint64_t virt_addr = le64_to_cpu(req->virt_addr);
+    uint64_t size = le64_to_cpu(req->size);
+    uint32_t flags = le32_to_cpu(req->flags);
+
+    trace_virtio_iommu_map(asid, phys_addr, virt_addr, size, flags);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_unmap(VirtIOIOMMU *s,
+                              struct virtio_iommu_req_unmap *req)
+{
+    uint32_t asid = le32_to_cpu(req->address_space);
+    uint64_t virt_addr = le64_to_cpu(req->virt_addr);
+    uint64_t size = le64_to_cpu(req->size);
+
+    trace_virtio_iommu_unmap(asid, virt_addr, size);
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
2.5.5

