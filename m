Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4626648wrv;
        Tue, 30 Jul 2019 10:24:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvKAnb/TXJPa3xqTRljYlnPO8c5RpUXcfyaJV6t6azhTl4TGA7Zgen9WcNgtxGMNExqZX1
X-Received: by 2002:a17:906:6bc4:: with SMTP id t4mr93012191ejs.256.1564507462688;
        Tue, 30 Jul 2019 10:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564507462; cv=none;
        d=google.com; s=arc-20160816;
        b=NgHBG7GDiMtLB1M1EfSPpYZqY190dg/SRdC0MZTB15YaFwaqAAIPN1p85wFklPEo0D
         kUQoNkco3BjPJz/gSa9AhrXqAlVGtCwQqMsvPJIEn/8HOfVphZEIiKlAxm2A8zAcGJwY
         eQFrruz7IDxlwL2h/2tYvi31usuMlAYPMRPENLTsOS//rvPTLTFyc9v38ag2oyasbhQB
         /T2ABFKaZ9KYmxvNRdNQ3aR86ikOv4xw1TkdV6OQ7k66Dn/NO7u288i3CpkrxzFCxDeJ
         dbCpXu+nIxbsZ72fxc7gkT+bsY1etkpydccmFA5Hl+oGCZEK8/caEjbKLoNH0d6i6Z7F
         OzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=cwRxY68RxSdrMs6mULgsEYYWGGj1X/g6CDrty8A9n6c=;
        b=bBpV9WIFDH5SbFS6bMqeonDEbd9Evo8qInPLYjYAtXNq1jMcgbqu31D8BbSsJSxxTH
         vtVcp1PwAFskAlsZebulIo0+DLus2nz5zHC2KzS0OuDBXSH8UEZUCcUDNP87KoSvnwLH
         8oIrBp41lLMWAzXcfiRHP8WU+TSMybtechIIOch0IlZb3JZYgLUfwWAgI4PVhp7ghSTw
         uqBH7iGSCPQ8PC3d6p/+aP8/Jw0zHoRvZpXpK4E+deiwqMgKJmgqzGy4YyR/+TGByalf
         YAjNNd1d1qLVbd2nExB1Gg3qiqQMrs1PX9ur45IyHoE6yPnmNZOwqD3cB0TqubsCI6R/
         zk6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i44si19827220ede.407.2019.07.30.10.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 10:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsVrJ-0003s1-Pr
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 13:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60853)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hsVpi-00006R-MP
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 13:22:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hsVph-0000nK-Ex
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 13:22:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50713)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hsVph-0000mV-7X; Tue, 30 Jul 2019 13:22:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 752E6A96F2;
 Tue, 30 Jul 2019 17:22:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D52A60BE5;
 Tue, 30 Jul 2019 17:22:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, kevin.tian@intel.com
Date: Tue, 30 Jul 2019 19:21:26 +0200
Message-Id: <20190730172137.23114-5-eric.auger@redhat.com>
In-Reply-To: <20190730172137.23114-1-eric.auger@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 30 Jul 2019 17:22:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.2 v10 04/15] virtio-iommu: Decode the
 command payload
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
Cc: tn@semihalf.com, bharat.bhushan@nxp.com, peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCsDcVxg737z

This patch adds the command payload decoding and
introduces the functions that will do the actual
command handling. Those functions are not yet implemented.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v9 -> v10:
- make virtio_iommu_handle_* more compact and
  remove get_payload_size

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
 hw/virtio/virtio-iommu.c | 81 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f7dac39213..c7276116e7 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -61,3 +61,7 @@ virtio_iommu_set_features(uint64_t features) "features =
accepted by the driver =3D0
 virtio_iommu_device_status(uint8_t status) "driver status =3D %d"
 virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_=
t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=3D0x%"=
PRIx64" start=3D0x%"PRIx64" end=3D0x%"PRIx64" domain_range=3D%d probe_siz=
e=3D0x%x"
 virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_=
t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=3D0x%"=
PRIx64" start=3D0x%"PRIx64" end=3D0x%"PRIx64" domain_bits=3D%d probe_size=
=3D0x%x"
+virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=3D%d end=
point=3D%d"
+virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=3D%d end=
point=3D%d"
+virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_=
end, uint64_t phys_start, uint32_t flags) "domain=3D%d virt_start=3D0x%"P=
RIx64" virt_end=3D0x%"PRIx64 " phys_start=3D0x%"PRIx64" flags=3D%d"
+virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t vir=
t_end) "domain=3D%d virt_start=3D0x%"PRIx64" virt_end=3D0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index f239954396..658249c81e 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -33,29 +33,102 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
=20
+static int virtio_iommu_attach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_attach *req)
+{
+    uint32_t domain_id =3D le32_to_cpu(req->domain);
+    uint32_t ep_id =3D le32_to_cpu(req->endpoint);
+
+    trace_virtio_iommu_attach(domain_id, ep_id);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_detach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_detach *req)
+{
+    uint32_t domain_id =3D le32_to_cpu(req->domain);
+    uint32_t ep_id =3D le32_to_cpu(req->endpoint);
+
+    trace_virtio_iommu_detach(domain_id, ep_id);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_map(VirtIOIOMMU *s,
+                            struct virtio_iommu_req_map *req)
+{
+    uint32_t domain_id =3D le32_to_cpu(req->domain);
+    uint64_t phys_start =3D le64_to_cpu(req->phys_start);
+    uint64_t virt_start =3D le64_to_cpu(req->virt_start);
+    uint64_t virt_end =3D le64_to_cpu(req->virt_end);
+    uint32_t flags =3D le32_to_cpu(req->flags);
+
+    trace_virtio_iommu_map(domain_id, virt_start, virt_end, phys_start, =
flags);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_unmap(VirtIOIOMMU *s,
+                              struct virtio_iommu_req_unmap *req)
+{
+    uint32_t domain_id =3D le32_to_cpu(req->domain);
+    uint64_t virt_start =3D le64_to_cpu(req->virt_start);
+    uint64_t virt_end =3D le64_to_cpu(req->virt_end);
+
+    trace_virtio_iommu_unmap(domain_id, virt_start, virt_end);
+
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static int virtio_iommu_iov_to_req(struct iovec *iov,
+                                   unsigned int iov_cnt,
+                                   void *req, size_t req_sz)
+{
+    size_t sz, payload_sz =3D req_sz - sizeof(struct virtio_iommu_req_ta=
il);
+
+    sz =3D iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
+    if (unlikely(sz !=3D payload_sz)) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    return 0;
+}
+
 static int virtio_iommu_handle_attach(VirtIOIOMMU *s,
                                       struct iovec *iov,
                                       unsigned int iov_cnt)
 {
-    return VIRTIO_IOMMU_S_UNSUPP;
+    struct virtio_iommu_req_attach req;
+    int ret =3D virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req))=
;
+
+    return ret ? ret : virtio_iommu_attach(s, &req);
 }
 static int virtio_iommu_handle_detach(VirtIOIOMMU *s,
                                       struct iovec *iov,
                                       unsigned int iov_cnt)
 {
-    return VIRTIO_IOMMU_S_UNSUPP;
+    struct virtio_iommu_req_detach req;
+    int ret =3D virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req))=
;
+
+    return ret ? ret : virtio_iommu_detach(s, &req);
 }
 static int virtio_iommu_handle_map(VirtIOIOMMU *s,
                                    struct iovec *iov,
                                    unsigned int iov_cnt)
 {
-    return VIRTIO_IOMMU_S_UNSUPP;
+    struct virtio_iommu_req_map req;
+    int ret =3D virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req))=
;
+
+    return ret ? ret : virtio_iommu_map(s, &req);
 }
 static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
                                      struct iovec *iov,
                                      unsigned int iov_cnt)
 {
-    return VIRTIO_IOMMU_S_UNSUPP;
+    struct virtio_iommu_req_unmap req;
+    int ret =3D virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req))=
;
+
+    return ret ? ret : virtio_iommu_unmap(s, &req);
 }
=20
 static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *v=
q)
--=20
2.20.1

