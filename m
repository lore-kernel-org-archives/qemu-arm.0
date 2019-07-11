Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp980300wrv;
        Thu, 11 Jul 2019 10:33:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycBPLfEVafKic6AgeTXFGCEJS427FJEdbvH0VuLn9ZSY0/P8/gPa3B8qwd5XOZYwGDlYLC
X-Received: by 2002:a50:87d0:: with SMTP id 16mr4711847edz.133.1562866403149;
        Thu, 11 Jul 2019 10:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866403; cv=none;
        d=google.com; s=arc-20160816;
        b=ATaDAihbLQqZM2CMGGQ1DTtKkY+Vf5ej+Q33q3FswGuGiII1PKPcUtI90ce4MTeCbO
         K/TY919vQ94Ct51mK/WUZ5hK6FrqrBijIIcbIf51nHpxu2oX0CDv6x9gHCKJ4/YW+oXY
         Cr0YrwluhKJLZ6KPhz0VhrLTCdPVFdjPAhF82fr7Z+giHgZDDY8g81kW6cI4pVFXf1XF
         d2N36RtN7Qn01meqt4u9co+AXT6/t8vN4P4snU3uJMDZlPRk+5yhoUvWc4+/jXi3WsVW
         K+fwgFjkzS6y+7m1BuTXeV3Bu0/QOjmLARFJtd+1zte5Il6bRHn5DgtiqleOY6RQmcnk
         p98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=BwLfsjDAyxShtbGoqEYdF1MebiSNjZ7ur1Do58WxQ8c=;
        b=pYC0z+DEWByKdqjgupsHYJdJS7BXYRQZAwpwTi1URckjeAJzRCsKh+qaWcUcOmTWTJ
         wDEAatmAL1hEvbsuTpRg6UO4Etw22Rc8V17pUCAl3h4+5Cv1PK+PX7waV1Bn6r4HfOSO
         RMmYF5Q+qjii6U6ZZLQmFtoTMTiG7J6R55W8Z60SF+k2hAuQouZmzkVganG2b48Hej6H
         6elp3sobjv01CstDqqFW3pl4oIYAxZCUjS3ehfsKyWpIeCc03pJe07j6j1VLISY2RjtY
         B3sO4n6GFJd/fDN8Mc8xuCahhO+tXZzNRPTODxADx1tF+T35FNubXH7DjsstjO17ZUcU
         XnzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p43si3885951edc.201.2019.07.11.10.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcwa-0000vZ-HS
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34817)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcv7-0004hb-Mv
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:31:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcv5-00045k-JY
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:31:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44728)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcuu-0003rj-9V; Thu, 11 Jul 2019 13:31:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 771D23082B6D;
 Thu, 11 Jul 2019 17:31:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 858F25C1B4;
 Thu, 11 Jul 2019 17:31:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:35 +0200
Message-Id: <20190711172845.31035-20-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 11 Jul 2019 17:31:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 19/29] vfio: Helper to get IRQ info including
 capabilities
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Auq+8QXXPcEO

As done for vfio regions, add helpers to retrieve irq info
including their optional capabilities.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c              | 97 +++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 include/hw/vfio/vfio-common.h |  7 +++
 3 files changed, 105 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4bbce6a43a..8a2d201058 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1007,6 +1007,25 @@ vfio_get_region_info_cap(struct vfio_region_info *=
info, uint16_t id)
     return NULL;
 }
=20
+struct vfio_info_cap_header *
+vfio_get_irq_info_cap(struct vfio_irq_info *info, uint16_t id)
+{
+    struct vfio_info_cap_header *hdr;
+    void *ptr =3D info;
+
+    if (!(info->flags & VFIO_IRQ_INFO_FLAG_CAPS)) {
+        return NULL;
+    }
+
+    for (hdr =3D ptr + info->cap_offset; hdr !=3D ptr; hdr =3D ptr + hdr=
->next) {
+        if (hdr->id =3D=3D id) {
+            return hdr;
+        }
+    }
+
+    return NULL;
+}
+
 static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
                                           struct vfio_region_info *info)
 {
@@ -1833,6 +1852,33 @@ retry:
     return 0;
 }
=20
+int vfio_get_irq_info(VFIODevice *vbasedev, int index,
+                      struct vfio_irq_info **info)
+{
+    size_t argsz =3D sizeof(struct vfio_irq_info);
+
+    *info =3D g_malloc0(argsz);
+
+    (*info)->index =3D index;
+retry:
+    (*info)->argsz =3D argsz;
+
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_IRQ_INFO, *info)) {
+        g_free(*info);
+        *info =3D NULL;
+        return -errno;
+    }
+
+    if ((*info)->argsz > argsz) {
+        argsz =3D (*info)->argsz;
+        *info =3D g_realloc(*info, argsz);
+
+        goto retry;
+    }
+
+    return 0;
+}
+
 int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
                              uint32_t subtype, struct vfio_region_info *=
*info)
 {
@@ -1868,6 +1914,42 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev,=
 uint32_t type,
     return -ENODEV;
 }
=20
+int vfio_get_dev_irq_info(VFIODevice *vbasedev, uint32_t type,
+                          uint32_t subtype, struct vfio_irq_info **info)
+{
+    int i;
+
+    for (i =3D 0; i < vbasedev->num_irqs; i++) {
+        struct vfio_info_cap_header *hdr;
+        struct vfio_irq_info_cap_type *cap_type;
+
+        if (vfio_get_irq_info(vbasedev, i, info)) {
+            continue;
+        }
+
+        hdr =3D vfio_get_irq_info_cap(*info, VFIO_IRQ_INFO_CAP_TYPE);
+        if (!hdr) {
+            g_free(*info);
+            continue;
+        }
+
+        cap_type =3D container_of(hdr, struct vfio_irq_info_cap_type, he=
ader);
+
+        trace_vfio_get_dev_irq(vbasedev->name, i,
+                               cap_type->type, cap_type->subtype);
+
+        if (cap_type->type =3D=3D type && cap_type->subtype =3D=3D subty=
pe) {
+            return 0;
+        }
+
+        g_free(*info);
+    }
+
+    *info =3D NULL;
+    return -ENODEV;
+}
+
+
 bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_=
type)
 {
     struct vfio_region_info *info =3D NULL;
@@ -1883,6 +1965,21 @@ bool vfio_has_region_cap(VFIODevice *vbasedev, int=
 region, uint16_t cap_type)
     return ret;
 }
=20
+bool vfio_has_irq_cap(VFIODevice *vbasedev, int region, uint16_t cap_typ=
e)
+{
+    struct vfio_region_info *info =3D NULL;
+    bool ret =3D false;
+
+    if (!vfio_get_region_info(vbasedev, region, &info)) {
+        if (vfio_get_region_info_cap(info, cap_type)) {
+            ret =3D true;
+        }
+        g_free(info);
+    }
+
+    return ret;
+}
+
 /*
  * Interfaces for IBM EEH (Enhanced Error Handling)
  */
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 5de97a8882..c04a8c12d8 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -114,6 +114,7 @@ vfio_region_mmaps_set_enabled(const char *name, bool =
enabled) "Region %s mmaps e
 vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas=
) "Device %s region %d: %d sparse mmap entries"
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long =
end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t=
 subtype) "%s index %d, %08x/%0x8"
+vfio_get_dev_irq(const char *name, int index, uint32_t type, uint32_t su=
btype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
 vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size, uint64=
_t nb_granules, bool leaf) "nested IOTLB invalidate asid=3D%d, addr=3D0x%=
"PRIx64" granule_size=3D0x%"PRIx64" nb_granules=3D0x%"PRIx64" leaf=3D%d"
 vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=3D%d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.=
h
index a88b4dd986..79d48df351 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -200,6 +200,13 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, u=
int32_t type,
 bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_=
type);
 struct vfio_info_cap_header *
 vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id);
+int vfio_get_irq_info(VFIODevice *vbasedev, int index,
+                      struct vfio_irq_info **info);
+int vfio_get_dev_irq_info(VFIODevice *vbasedev, uint32_t type,
+                          uint32_t subtype, struct vfio_irq_info **info)=
;
+bool vfio_has_irq_cap(VFIODevice *vbasedev, int irq, uint16_t cap_type);
+struct vfio_info_cap_header *
+vfio_get_irq_info_cap(struct vfio_irq_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
=20
--=20
2.20.1

