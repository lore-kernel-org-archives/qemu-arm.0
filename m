Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1687508lfp;
        Sat, 8 Feb 2020 04:01:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUQ0yV8wjPLryRTH4BXOKO/VdA9UvDrMLy64IZSlnF0olK1iV9wPdigN8pYEfPw4xyM4h6
X-Received: by 2002:ad4:4e24:: with SMTP id dm4mr2531627qvb.170.1581163278337;
        Sat, 08 Feb 2020 04:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581163278; cv=none;
        d=google.com; s=arc-20160816;
        b=Gh++htbSK132dTsdQCpAVa5wA3876LAemGcLhvKsOVH73XX9zNhy11b4XRk8CHQNMk
         qoIjg0yQwWUIcKTY+12GKpYR5fyqeVk9TvKH2Xrcm9q7p187F95+Xb8T7A6nkIXKgLwN
         fiSGnCoEBT8XNpJOzqhufumpR77jCnyWQixsKfg5bSJIvdqoWsC9WMrZd0lYKuiJBdoq
         DWaa2ob+PmPyBflBaN66BC2z/TZLeKAPlVm7Dc/SrAMzvSs8cBNTJxDaMk+woqxIDu3U
         kwYRCgdbAhkwLuwgI5PCNKodqm9AoWP913nfAkfFcZnai77Hblq69h9sbOHDW+a2ckcQ
         crAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Tp3RuluiPpZ9S8eljJbOleock9JQpMa5GbkYco3/994=;
        b=btaYAvT6SUvSitor5tx7i5g1/chw/HkM+myWE9AehK2FwLOx07ulwbbyqItFZxj1jC
         BLR686o2IdbmbVInKyXpqJqs/2xKeDi2u17kLbCGruRfSANnMLtLN2fAwwDihCdXuTFb
         HF5TA4PR1eLZ662vk9GpbTMVFrLMfGhur/kJmeu9RcirjT24t3ID4V4i8uVEi+nVA5Yc
         nnVcraJNY7XFkJDBcwpKkupHseoB6TKo7956s63BkWVtkV4pn7SFh+nj3L9ch2KTl5PW
         wY/aF07Ra+DnGoYnf3ndQXriY3WYchDgyFcHKAhrK2oL5kQNVKm4oP+wwBHpjMvXpY1B
         gbgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TR5ObbKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si1307221qvu.9.2020.02.08.04.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 04:01:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TR5ObbKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0OnV-0005hC-NB
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 07:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j0OnA-0005Ni-EP
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:00:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j0On8-00007e-NV
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:00:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48506
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j0On8-00007F-I0
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581163254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tp3RuluiPpZ9S8eljJbOleock9JQpMa5GbkYco3/994=;
 b=TR5ObbKvMzluCaAqsgmZDoc1ywy2MVAJyBHZYFNPsJljHeU6EPlBm698/lA0T/Yk3tBNk4
 uh67aBsoxXSQwkAClpP232sB1besDlX8gopYuqbQ+68Djwt/VXozuQo6RV8k1IhzpkoDL4
 zGzCOw6L6jHPlm0wTQQhGjlOuvirBHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-sm9VMXTCOwCCmcPjzp5E9g-1; Sat, 08 Feb 2020 07:00:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4085018A5510;
 Sat,  8 Feb 2020 12:00:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 206CF5C545;
 Sat,  8 Feb 2020 12:00:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v15 2/9] virtio-iommu: Decode the command payload
Date: Sat,  8 Feb 2020 13:00:15 +0100
Message-Id: <20200208120022.1920-3-eric.auger@redhat.com>
In-Reply-To: <20200208120022.1920-1-eric.auger@redhat.com>
References: <20200208120022.1920-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: sm9VMXTCOwCCmcPjzp5E9g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
X-TUID: WCIfYHZ92Nia

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
index 30579267d5..86dcdc09a1 100644
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

