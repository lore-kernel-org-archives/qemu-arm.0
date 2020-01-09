Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2220498lff;
        Thu, 9 Jan 2020 06:47:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKcUdQzaz4scRw01VrnRk2/WwMWHD8IpUj2fMP+fw/WU42jKmUaVXeSlsTzrZ+bs2LM/HV
X-Received: by 2002:a37:9fce:: with SMTP id i197mr9404660qke.466.1578581231832;
        Thu, 09 Jan 2020 06:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578581231; cv=none;
        d=google.com; s=arc-20160816;
        b=Xepo1jdAXtPhTs6vzhX1PUJH7m1JhmFZaHFo1NLlOtUG26P2MbdbMSEyELMQABAyY0
         MSw18SHPrIzANQxHQhGk45waPJiYYS4Khq9j556nuJnX6RiyzWYIoEOEmTUd69Lo4rKv
         Af8WP4FbHff2LahgLFvFmFKjBCtvYPzr3edCScqcnAQVKrp/YiYJfvaraiAwULlRCT9x
         NFiokeJmNRBv6tfpCBYcStwUM/OLoCHeYXULddVfln2V7Q0j35GTw3clqkhHciLAwCGv
         1JzyHwZm4XkcqTV7TzPQFAbiSQAQCGy2yMJJNGt2ZOcKYDcjID8Lf8EFpWVr76WHAbRo
         k+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TrG2D7PGes+Tk9KPVWW7GanYjnyyioK1Zu85/7Dy2Ys=;
        b=cUzjngdAqoRzabRTc4E48B0yCIe3rElyrFuOI/UGaMZH/vCRiLkUhighhE402o4RrM
         9RswfYFjJWz7KhK1MyE/8bTmZh2UFDjaeGDJg0ZOYSE/Pb3A6Lo7A3euvVbT1Sim2j+S
         4FTLBNh23h8SG9Lm2j9ySlU1DRuZNMH8B5XPQOFzn4O8DOT6B4nq5jPJg5gIxtUoY+Zb
         TwdIJF6+NlZVSE4aXPbFracDKAphph3jH7/fhdfjZLaG5S/QglmKXSasVIgbFFeO1BYV
         MfVeBSr1gbgj2OwR7VeWWuNAchdrLRWcbjpjvTIHk21A/Bjs1I90NmM8A8HJdX1OqUEH
         +Qnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BRsfdVMv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16si3659199qkg.275.2020.01.09.06.47.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 06:47:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BRsfdVMv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipZ5a-00023c-PI
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 09:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipZ2X-00071p-MF
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:44:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipZ2W-0006dB-2E
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:44:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55891
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipZ2V-0006Z0-RK
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578581039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TrG2D7PGes+Tk9KPVWW7GanYjnyyioK1Zu85/7Dy2Ys=;
 b=BRsfdVMvTD+Q2ipxa8+v2uPQQ0cCPtaV1oZPDcD3bo83823qEmXdVVCVdUXmM0JOEzYcVJ
 4QNy5UWiNN3wG+1d2/2cNV/D5mP70yQvWLTtsYSMiFVw1x0wSpMS5BCAyG+k81j7FXrhWP
 jhqYouop8RxCyCPljb/qTUsJvh1uZXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-kSR_DaZyNKqGgozK4YSneQ-1; Thu, 09 Jan 2020 09:43:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42E32800D4C;
 Thu,  9 Jan 2020 14:43:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA40260FCC;
 Thu,  9 Jan 2020 14:43:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v12 03/13] virtio-iommu: Decode the command payload
Date: Thu,  9 Jan 2020 15:43:09 +0100
Message-Id: <20200109144319.15912-4-eric.auger@redhat.com>
In-Reply-To: <20200109144319.15912-1-eric.auger@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: kSR_DaZyNKqGgozK4YSneQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EfmrAZWiQFID

This patch adds the command payload decoding and
introduces the functions that will do the actual
command handling. Those functions are not yet implemented.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

v11 -> v12:
- ADded Jean and Peter's R-b

v10 -> v11:
- use a macro for handle command functions

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
 hw/virtio/trace-events   |  4 +++
 hw/virtio/virtio-iommu.c | 76 +++++++++++++++++++++++++++++++++-------
 2 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 02d93d7f63..f7141aa2f6 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -60,3 +60,7 @@ virtio_iommu_get_features(uint64_t features) "device supp=
orts features=3D0x%"PRIx6
 virtio_iommu_device_status(uint8_t status) "driver status =3D %d"
 virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t =
end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=3D0x%"PRIx=
64" start=3D0x%"PRIx64" end=3D0x%"PRIx64" domain_range=3D%d probe_size=3D0x=
%x"
 virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t =
end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=3D0x%"PRIx=
64" start=3D0x%"PRIx64" end=3D0x%"PRIx64" domain_bits=3D%d probe_size=3D0x%=
x"
+virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=3D%d endpo=
int=3D%d"
+virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=3D%d endpo=
int=3D%d"
+virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_en=
d, uint64_t phys_start, uint32_t flags) "domain=3D%d virt_start=3D0x%"PRIx6=
4" virt_end=3D0x%"PRIx64 " phys_start=3D0x%"PRIx64" flags=3D%d"
+virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_=
end) "domain=3D%d virt_start=3D0x%"PRIx64" virt_end=3D0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 7e55eda67e..9d1b997df7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -34,31 +34,83 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
=20
-static int virtio_iommu_handle_attach(VirtIOIOMMU *s,
-                                      struct iovec *iov,
-                                      unsigned int iov_cnt)
+static int virtio_iommu_attach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_attach *req)
 {
+    uint32_t domain_id =3D le32_to_cpu(req->domain);
+    uint32_t ep_id =3D le32_to_cpu(req->endpoint);
+
+    trace_virtio_iommu_attach(domain_id, ep_id);
+
     return VIRTIO_IOMMU_S_UNSUPP;
 }
-static int virtio_iommu_handle_detach(VirtIOIOMMU *s,
-                                      struct iovec *iov,
-                                      unsigned int iov_cnt)
+
+static int virtio_iommu_detach(VirtIOIOMMU *s,
+                               struct virtio_iommu_req_detach *req)
 {
+    uint32_t domain_id =3D le32_to_cpu(req->domain);
+    uint32_t ep_id =3D le32_to_cpu(req->endpoint);
+
+    trace_virtio_iommu_detach(domain_id, ep_id);
+
     return VIRTIO_IOMMU_S_UNSUPP;
 }
-static int virtio_iommu_handle_map(VirtIOIOMMU *s,
-                                   struct iovec *iov,
-                                   unsigned int iov_cnt)
+
+static int virtio_iommu_map(VirtIOIOMMU *s,
+                            struct virtio_iommu_req_map *req)
 {
+    uint32_t domain_id =3D le32_to_cpu(req->domain);
+    uint64_t phys_start =3D le64_to_cpu(req->phys_start);
+    uint64_t virt_start =3D le64_to_cpu(req->virt_start);
+    uint64_t virt_end =3D le64_to_cpu(req->virt_end);
+    uint32_t flags =3D le32_to_cpu(req->flags);
+
+    trace_virtio_iommu_map(domain_id, virt_start, virt_end, phys_start, fl=
ags);
+
     return VIRTIO_IOMMU_S_UNSUPP;
 }
-static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
-                                     struct iovec *iov,
-                                     unsigned int iov_cnt)
+
+static int virtio_iommu_unmap(VirtIOIOMMU *s,
+                              struct virtio_iommu_req_unmap *req)
 {
+    uint32_t domain_id =3D le32_to_cpu(req->domain);
+    uint64_t virt_start =3D le64_to_cpu(req->virt_start);
+    uint64_t virt_end =3D le64_to_cpu(req->virt_end);
+
+    trace_virtio_iommu_unmap(domain_id, virt_start, virt_end);
+
     return VIRTIO_IOMMU_S_UNSUPP;
 }
=20
+static int virtio_iommu_iov_to_req(struct iovec *iov,
+                                   unsigned int iov_cnt,
+                                   void *req, size_t req_sz)
+{
+    size_t sz, payload_sz =3D req_sz - sizeof(struct virtio_iommu_req_tail=
);
+
+    sz =3D iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
+    if (unlikely(sz !=3D payload_sz)) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    return 0;
+}
+
+#define virtio_iommu_handle_req(__req)                                  \
+static int virtio_iommu_handle_ ## __req(VirtIOIOMMU *s,                \
+                                         struct iovec *iov,             \
+                                         unsigned int iov_cnt)          \
+{                                                                       \
+    struct virtio_iommu_req_ ## __req req;                              \
+    int ret =3D virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req)); =
\
+                                                                        \
+    return ret ? ret : virtio_iommu_ ## __req(s, &req);                 \
+}
+
+virtio_iommu_handle_req(attach)
+virtio_iommu_handle_req(detach)
+virtio_iommu_handle_req(map)
+virtio_iommu_handle_req(unmap)
+
 static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOIOMMU *s =3D VIRTIO_IOMMU(vdev);
--=20
2.20.1

