Received: by 10.25.0.23 with SMTP id 23csp1977983lfa;
        Wed, 7 Jun 2017 01:38:50 -0700 (PDT)
X-Received: by 10.55.215.130 with SMTP id t2mr23622488qkt.188.1496824730808;
        Wed, 07 Jun 2017 01:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496824730; cv=none;
        d=google.com; s=arc-20160816;
        b=0eiVBx2zIwlB7F3YmVfx2PqfeL+91lDv0bCpyZgSqC9ZJf6AiCG0DTAMwReQOG4lvm
         h/To+KLS3hbUSqyqV8jg16TYmQULrRU2l3aGIekzf4RVWaqpwQIXkgcFfc/7G8+Lu8bF
         g/Wttyjf1mK40hScwaKx79yHddprlZstszh70aekCJdlISNJ1fBXdx9Dko+EV7PUPz/D
         rO041nN5fiNV2znTAJW36rgD+wTyaYjRF9oRshxyuBlM+BMQomyVGYE7vCP9PLFCc9p/
         zDIxv6LRo7MyH5YBerAtE4g/ZcfIZejCfmzY4/6Cx6u4DnTC3hCAaiyP9twEM0bDqZM6
         eQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=naZ9jXWBbxDoNE5pflzrm3HYqMctwZ1YXOxuuu9RzEI=;
        b=DGweVTJsAwfqm+F3djOFmQDjIybdUxe0rhZki3XZHIprQi9W31arugjg56XEwzo1q2
         g+vETBTnqZd0pCmPR/CuGN+KL9udgqFQF4f/INWUP9264PNCfFAvgp2C3BgcTr+UvLn/
         Y2Jo+yMgTSRGNG8hmR6Fv3HuzWbiMdVPEpGtUAJ15J0W8omPVPRKJEE8/bfw/QXpfrPH
         hbANeaUNVl1+82NMRZlQCCO60RJouI2fG1fxv11rioTi+CxuFmfl8eD2mWKmY+OgNqQn
         zSAYRwKWyhggHXIPatfa3DakL3jbjyqcltgFq0rGETPNxJP7VSLtKnfUNTnQFYmX6rwi
         qBWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si1204111qkl.315.2017.06.07.01.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 01:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIWUK-0005Jd-2V
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 04:38:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWSK-0003Rn-Hv
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWSJ-00012H-GZ
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43234)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIWSJ-00011y-88; Wed, 07 Jun 2017 04:36:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 227858046A;
	Wed,  7 Jun 2017 08:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 227858046A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 227858046A
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E00BB176B2;
	Wed,  7 Jun 2017 08:36:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 10:35:52 +0200
Message-Id: <1496824556-1883-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 07 Jun 2017 08:36:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 4/8] virtio-iommu: Decode the command payload
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5pMgk3OusvGu

This patch adds the command payload decoding and
introduces the functions that will do the actual
command handling. Those functions are not yet implemented.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  7 ++++
 hw/virtio/virtio-iommu.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 100 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index e24d8fa..fba1da6 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -25,3 +25,10 @@ virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s g
 virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_pages: %d actual: %d"
 virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: %d oldactual: %d"
 virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: %"PRIx64" num_pages: %d"
+
+# hw/virtio/virtio-iommu.c
+#
+virtio_iommu_attach(uint32_t as, uint32_t dev, uint32_t flags) "as=%d dev=%d flags=%d"
+virtio_iommu_detach(uint32_t dev, uint32_t flags) "dev=%d flags=%d"
+virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr, uint64_t size, uint32_t flags) "as= %d phys_addr=0x%"PRIx64" virt_addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d"
+virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size, uint32_t reserved) "as= %d virt_addr=0x%"PRIx64" size=0x%"PRIx64" reserved=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 86129ef..ea1caa7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -35,29 +35,118 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+static int virtio_iommu_attach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_attach *req)
+{
+    uint32_t asid = le32_to_cpu(req->address_space);
+    uint32_t devid = le32_to_cpu(req->device);
+    uint32_t reserved = le32_to_cpu(req->reserved);
+
+    trace_virtio_iommu_attach(asid, devid, reserved);
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
+    trace_virtio_iommu_detach(devid, reserved);
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
+    uint32_t flags = le32_to_cpu(req->flags);
+
+    trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
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

