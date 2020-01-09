Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2221685lff;
        Thu, 9 Jan 2020 06:48:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxw/1Kk3gsejBceIiv9DMx8R4z1mokNaubkrdvqM4f+vfGXbcwXhgij1ciuu21fh3VHb5OX
X-Received: by 2002:a05:620a:201d:: with SMTP id c29mr9662808qka.91.1578581295017;
        Thu, 09 Jan 2020 06:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578581295; cv=none;
        d=google.com; s=arc-20160816;
        b=EJPkcgRfAi87fjIeD2/DbLsnoSwsCdWpU2E+mr1R0/QLDcxEZf/WXzrqoN4vU7tiDb
         yqP5343QLP1jadu/dK0gbqkDbR5iJFc/EfW46YldA9qvwv+94WgNComTWH1YBKABdf3/
         zjsMPsObQ4EW9THRHoDKbErAANLwIB84+7HivsfRzsE3BTqjq2TkxtH2Nk0kyRIVpW4R
         6LJHj+cG24VGlCCUPJMIada7+8KYb670SH2Y5XwnOmi/kBN2GHBRae6uwQkG9ko3ESvL
         /uNOXVZjivsCvVUkc8M5pSUJsxp9m9jN28iJioZnzmjkU8I/aDUXC3CTZlduHN5E2uZa
         J7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PxeudYTFblJ6JKPuQQTTEY/LxUaD7mogxypp6FzR5PM=;
        b=wYuB1tDIBmgF0APJBsMRtCHrlBpJmWl/hBlkCZMt1F8GxqMBcdiAjQfr8nwTvl4YV8
         tqcHQPsnCtr1ZVcBcAO7ZIM5i6Cm7dsHgSxj7GowK4yjk9QXJiv914KobdtqhHKD7GeX
         NoAz7myVmZZb3llPO6JClfPVL2y4AN0afLkPVKFbMsNLO1NrMtP5mH3Cv4+Q34SPFeF5
         G4XXS/P/8J6pPFUoN0tBizJP6OFqIz4NuaE57hQgh9p5fqxzHOFWn7KKfB2uz5Gf9Ue4
         2S2sluu5orvxzu3i8XiWZ7lYZpvutsPgkDQEl3ZY1JKv0f3soC386OejvUfFBwVLbcSX
         3uOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FQd3vUBk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d190si3560510qkg.344.2020.01.09.06.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 06:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FQd3vUBk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipZ6b-0003SA-UQ
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 09:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipZ2u-0007b9-Kx
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:44:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipZ2t-00007n-6S
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:44:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40853
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipZ2t-00005Y-1g
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578581062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxeudYTFblJ6JKPuQQTTEY/LxUaD7mogxypp6FzR5PM=;
 b=FQd3vUBky0X4fGivnB+jy1qavsp6rQRs4T2YLqGjN9WVYxSO13PK/iTwzqBhO7ibB1YkKo
 5ck8b9CCAh3eERR9Ln+PjTiv1ezbOakEYTOAo5M5pXhCkDBR12dbS7RU1OiH0aT4s0S9vx
 amEj2uZdEgQyY7pL1/zNcGNFuczUXHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-IZbepVMHPnCJNcBD71ZJ1w-1; Thu, 09 Jan 2020 09:44:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CD8A107ACC5;
 Thu,  9 Jan 2020 14:44:20 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32FE560FC6;
 Thu,  9 Jan 2020 14:44:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v12 07/13] virtio-iommu: Implement map/unmap
Date: Thu,  9 Jan 2020 15:43:13 +0100
Message-Id: <20200109144319.15912-8-eric.auger@redhat.com>
In-Reply-To: <20200109144319.15912-1-eric.auger@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: IZbepVMHPnCJNcBD71ZJ1w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-TUID: GgCWpt+8Kvvq

This patch implements virtio_iommu_map/unmap.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
- check unmanaged managed flags on map
- fix leak

v10 -> v11:
- revisit the implementation of unmap according to Peter's suggestion
- removed virt_addr and size from viommu_mapping struct
- use g_tree_lookup_extended()
- return VIRTIO_IOMMU_S_RANGE in case a mapping were
  to be split on unmap (instead of INVAL)

v5 -> v6:
- use new v0.6 fields
- replace error_report by qemu_log_mask

v3 -> v4:
- implement unmap semantics as specified in v0.4
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 69 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 15595f8cd7..22162d6583 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -64,6 +64,7 @@ virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "=
domain=3D%d endpoint=3D%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=3D%d endpo=
int=3D%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_en=
d, uint64_t phys_start, uint32_t flags) "domain=3D%d virt_start=3D0x%"PRIx6=
4" virt_end=3D0x%"PRIx64 " phys_start=3D0x%"PRIx64" flags=3D%d"
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_=
end) "domain=3D%d virt_start=3D0x%"PRIx64" virt_end=3D0x%"PRIx64
+virtio_iommu_unmap_done(uint32_t domain_id, uint64_t virt_start, uint64_t =
virt_end) "domain=3D%d virt_start=3D0x%"PRIx64" virt_end=3D0x%"PRIx64
 virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int =
flag) "mr=3D%s rid=3D%d addr=3D0x%"PRIx64" flag=3D%d"
 virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
 virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=3D%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 63b2d30f28..6df6ad98f6 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -18,6 +18,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/iov.h"
 #include "qemu-common.h"
 #include "hw/qdev-properties.h"
@@ -55,6 +56,11 @@ typedef struct VirtIOIOMMUInterval {
     uint64_t high;
 } VirtIOIOMMUInterval;
=20
+typedef struct VirtIOIOMMUMapping {
+    uint64_t phys_addr;
+    uint32_t flags;
+} VirtIOIOMMUMapping;
+
 static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
 {
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
@@ -304,10 +310,39 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     uint64_t virt_start =3D le64_to_cpu(req->virt_start);
     uint64_t virt_end =3D le64_to_cpu(req->virt_end);
     uint32_t flags =3D le32_to_cpu(req->flags);
+    VirtIOIOMMUDomain *domain;
+    VirtIOIOMMUInterval *interval;
+    VirtIOIOMMUMapping *mapping;
+
+    if (flags & ~VIRTIO_IOMMU_MAP_F_MASK) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
+    domain =3D g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
+    if (!domain) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
+    interval =3D g_malloc0(sizeof(*interval));
+
+    interval->low =3D virt_start;
+    interval->high =3D virt_end;
+
+    mapping =3D g_tree_lookup(domain->mappings, (gpointer)interval);
+    if (mapping) {
+        g_free(interval);
+        return VIRTIO_IOMMU_S_INVAL;
+    }
=20
     trace_virtio_iommu_map(domain_id, virt_start, virt_end, phys_start, fl=
ags);
=20
-    return VIRTIO_IOMMU_S_UNSUPP;
+    mapping =3D g_malloc0(sizeof(*mapping));
+    mapping->phys_addr =3D phys_start;
+    mapping->flags =3D flags;
+
+    g_tree_insert(domain->mappings, interval, mapping);
+
+    return VIRTIO_IOMMU_S_OK;
 }
=20
 static int virtio_iommu_unmap(VirtIOIOMMU *s,
@@ -316,10 +351,40 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     uint32_t domain_id =3D le32_to_cpu(req->domain);
     uint64_t virt_start =3D le64_to_cpu(req->virt_start);
     uint64_t virt_end =3D le64_to_cpu(req->virt_end);
+    VirtIOIOMMUMapping *iter_val;
+    VirtIOIOMMUInterval interval, *iter_key;
+    VirtIOIOMMUDomain *domain;
+    int ret =3D VIRTIO_IOMMU_S_OK;
=20
     trace_virtio_iommu_unmap(domain_id, virt_start, virt_end);
=20
-    return VIRTIO_IOMMU_S_UNSUPP;
+    domain =3D g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
+    if (!domain) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no domain\n", __func__);
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+    interval.low =3D virt_start;
+    interval.high =3D virt_end;
+
+    while (g_tree_lookup_extended(domain->mappings, &interval,
+                                  (void **)&iter_key, (void**)&iter_val)) =
{
+        uint64_t current_low =3D iter_key->low;
+        uint64_t current_high =3D iter_key->high;
+
+        if (interval.low <=3D current_low && interval.high >=3D current_hi=
gh) {
+            g_tree_remove(domain->mappings, iter_key);
+            trace_virtio_iommu_unmap_done(domain_id, current_low, current_=
high);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: domain=3D %d Unmap [0x%"PRIx64",0x%"PRIx64"] forbidde=
n as "
+                "it would split existing mapping [0x%"PRIx64", 0x%"PRIx64"=
]\n",
+                __func__, domain_id, interval.low, interval.high,
+                current_low, current_high);
+            ret =3D VIRTIO_IOMMU_S_RANGE;
+            break;
+        }
+    }
+    return ret;
 }
=20
 static int virtio_iommu_iov_to_req(struct iovec *iov,
--=20
2.20.1

