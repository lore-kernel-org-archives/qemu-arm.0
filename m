Received: by 10.28.71.27 with SMTP id u27csp214226wma;
        Mon, 12 Feb 2018 11:09:20 -0800 (PST)
X-Google-Smtp-Source: AH8x224uCOXcF2r7gncRwCoWBxdWMnTsPYgyzRVPuBvt0D91013AjdBvi19k7ZpEtl9knFpO4jtI
X-Received: by 10.13.209.198 with SMTP id t189mr1918640ywd.277.1518462560192;
        Mon, 12 Feb 2018 11:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462560; cv=none;
        d=google.com; s=arc-20160816;
        b=Cgo4+2ToDe2OtPZa+b6W+G86ts9ZA6Rb5lNjTidrQby2/VgV+WwJYLP7fKet0OAM89
         SgDjQhNm3+CpA0VZA0Uf5+VasWOXVQNOfrdRRL+zEuXtt2WDQX5jegIGq1xH4+oWs13l
         TbCjQmtPlDKGmn54w+s6c9WfG6HY9dopnJJfsaAq51hwYmDuf4QbEy5r/V/WXbhcg0SI
         karQ/yT5ilsrY05H/Sez6Hgq4h4zPFv/wmWvgSkpmAmcPOi5270rqiiJMZMfF5ZBltkL
         dA5lV+DT83BxNo7WsVlDCG7szAxdHqcCyvkXFBJs9FI/gd0hNKkqzuhc7j9oL46beLJY
         95+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bRY0yAqTEFlPFaX88Eqpyu1mRQ/OtoPdpAVtF8mT9F4=;
        b=DtJdLLN5XOFgZXuTQdH3udxiYHYxtKSZME2FuA/SGD3eQbSrl/eDYhJqOFwEysR0LF
         jcM4s7NWTikbOJDzOfrWKtrGAwoKyO3yYCxo8TcDDvXRv2s2UcjkAu+hCfIk9Tfa5bkO
         IC1bhDPeVk9fCts37POhHni8awy2IGR+Mh7RlHO+bzQil+Mjmx1s853T37BLmkzu48/F
         JrgTvdbZKl52aV2223XFXWDPQJaVPSLUFdBkSUuKD2UyKRRIiPsPshv9gymfezN3nOtz
         ODEHBNXWO+8tez9eHPtQ2fnFlgflS94xXe7EUxdg8H7MG47EfeNMYN85aGpeCKb1rrKR
         RyIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2si319782ywc.161.2018.02.12.11.09.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:09:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJTb-0000K8-Hn
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:09:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJK9-0000OI-ON
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJK8-0003Wy-J3
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:33 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34204 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJK8-0003WL-Ds; Mon, 12 Feb 2018 13:59:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC3808182D2F;
	Mon, 12 Feb 2018 18:59:31 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A2CC100858F;
	Mon, 12 Feb 2018 18:59:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:09 +0000
Message-Id: <1518461904-5305-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:59:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:59:31 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 07/22] virtio-iommu: Decode the command payload
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
X-TUID: FtpaR9CkHSnu

This patch adds the command payload decoding and
introduces the functions that will do the actual
command handling. Those functions are not yet implemented.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v5 -> v6:
- change map/unmap semantics (remove size)

v4 -> v5:
- adopt new v0.5 terminology

v3 -> v4:
- no flags field anymore in struct virtio_iommu_req_unmap
- test reserved on attach/detach, change trace proto
- rebase on v2.10.0.
---
 hw/virtio/trace-events   |   6 ++-
 hw/virtio/virtio-iommu.c | 104 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 105 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 0094703..15e876f 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -37,4 +37,8 @@ vhost_iommu_region_del(void *p, const char *mr) "dev %p mr %s"
 virtio_iommu_set_features(uint64_t features) "features accepted by the driver =0x%"PRIx64
 virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
-virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t ioasid_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" ioasid_bits=%d probe_size=0x%x"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t domain_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
+virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
+virtio_iommu_detach(uint32_t ep_id) "endpoint=%d"
+virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
+virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 52430dc..6cbf007 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -35,29 +35,125 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+static int virtio_iommu_attach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_attach *req)
+{
+    uint32_t domain_id = le32_to_cpu(req->domain);
+    uint32_t ep_id = le32_to_cpu(req->endpoint);
+    uint32_t reserved = le32_to_cpu(req->reserved);
+
+    trace_virtio_iommu_attach(domain_id, ep_id);
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
+    uint32_t ep_id = le32_to_cpu(req->endpoint);
+    uint32_t reserved = le32_to_cpu(req->reserved);
+
+    trace_virtio_iommu_detach(ep_id);
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
1.9.1

