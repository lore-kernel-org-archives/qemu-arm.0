Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1134753lfe;
        Fri, 20 Mar 2020 10:07:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs3jORHouX3ztUj4DMbIXe7gMkFLHEaME//cIvh/YxNfkLdBVYJIxxe6/Z42mYpgYjoNW5j
X-Received: by 2002:a37:9c8b:: with SMTP id f133mr9167854qke.482.1584724058431;
        Fri, 20 Mar 2020 10:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584724058; cv=none;
        d=google.com; s=arc-20160816;
        b=e4X36kLH0n0HWgpGTQMz6t7lmh237dCJV7xOj9wK32ajk+3HXtfNzu1ut/YPh4jxlM
         isa8MpEuqIUdUNbWd9fGsynxDwu6sW9QMj1ien62Z/uqNCCdhhV7nE1sqWCWIUqSqhYL
         AA0WkKpCaKSv9y8BmLkK+4mil+Emq1Khc13+pKLwhCmWBDLI3OuZuTaI7ZhuoWCowEz1
         AbR1h/fUfAECwk98YoYp/+r0dt872c4HKB6PDMwBLVPG7Xjsn1t/IqXg+wrBS8RwoxYa
         foqNfrM3UDgECgSM6cxpBfH8vkBryB+r+JHmRxmrrmqQvvWOG7c6vcKFBm88hLHnLjph
         zV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iRCYvNyp6k+qiCSb86uDVd7Udi0kz2LeIPXWk7Yjpd8=;
        b=ncGKyuJQn58CApe3xomaqEhfa74EP69fIWPCmyrMdReGujIO9/xsq4mXS7/EnNk87p
         B8Vs0BhSQ1vJUATwvBs3xTXf3xCIV/ehgA0EMwwIad19Vb8+FIJednHjRoX+J9tHvkfS
         V4CM/hya9g2/eH5WMLgLd06/3eNooNLRmKb0CaL/33dcKP5n8ofvVIJE3Z0QNcJP5lN6
         HW0z8xUTQhJZHAvP2wjC0PED5fL9Vtr59zAg6LXWkCU5PmG5K/uoRzjB2D7aqyUvj08V
         hS1tn/LLjolSdMCsZr7Y3wjzlK91WhwjPr/v3co/kTquoCKrLgOpEEwHx30e0JsTYMxl
         5Emg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PgGYJK4x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si3944929qke.304.2020.03.20.10.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PgGYJK4x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL7R-0007Dc-Oe
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL2s-0008S1-GN
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL2r-00086J-0Z
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:02:54 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:32764)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL2q-00086D-Sr
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRCYvNyp6k+qiCSb86uDVd7Udi0kz2LeIPXWk7Yjpd8=;
 b=PgGYJK4x3Ox4ddmnDlTfWLs5LELXc6ujbsCMNgtwaE9lV14iwgPyVMQYH4lXSr8zPt8zHo
 nssnsNSaVA8jvWK0ZHITcZVD4dZQW/3cl95UPc8YixZ5IVJOuYUEfyON/s81v1cb6eHZu6
 yIV33lGoW7pEQ6YjRn7CbPAAqFO+X54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-jAqFT69jNhSSmEhFlqzApA-1; Fri, 20 Mar 2020 13:02:51 -0400
X-MC-Unique: jAqFT69jNhSSmEhFlqzApA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE6288E249E;
 Fri, 20 Mar 2020 17:02:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EACB1CFC5;
 Fri, 20 Mar 2020 17:02:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 14/24] vfio: Helper to get IRQ info including capabilities
Date: Fri, 20 Mar 2020 17:58:30 +0100
Message-Id: <20200320165840.30057-15-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfmJJiGqqR5x

As done for vfio regions, add helpers to retrieve irq info
including their optional capabilities.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c              | 97 +++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 include/hw/vfio/vfio-common.h |  7 +++
 3 files changed, 105 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4d51b1f63b..327fedf7e4 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1014,6 +1014,25 @@ vfio_get_region_info_cap(struct vfio_region_info *in=
fo, uint16_t id)
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
+    for (hdr =3D ptr + info->cap_offset; hdr !=3D ptr; hdr =3D ptr + hdr->=
next) {
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
@@ -1842,6 +1861,33 @@ retry:
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
                              uint32_t subtype, struct vfio_region_info **i=
nfo)
 {
@@ -1877,6 +1923,42 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, u=
int32_t type,
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
+        cap_type =3D container_of(hdr, struct vfio_irq_info_cap_type, head=
er);
+
+        trace_vfio_get_dev_irq(vbasedev->name, i,
+                               cap_type->type, cap_type->subtype);
+
+        if (cap_type->type =3D=3D type && cap_type->subtype =3D=3D subtype=
) {
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
 bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_ty=
pe)
 {
     struct vfio_region_info *info =3D NULL;
@@ -1892,6 +1974,21 @@ bool vfio_has_region_cap(VFIODevice *vbasedev, int r=
egion, uint16_t cap_type)
     return ret;
 }
=20
+bool vfio_has_irq_cap(VFIODevice *vbasedev, int region, uint16_t cap_type)
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
@@ -114,6 +114,7 @@ vfio_region_mmaps_set_enabled(const char *name, bool en=
abled) "Region %s mmaps e
 vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) =
"Device %s region %d: %d sparse mmap entries"
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long en=
d) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t s=
ubtype) "%s index %d, %08x/%0x8"
+vfio_get_dev_irq(const char *name, int index, uint32_t type, uint32_t subt=
ype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
 vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size, uint64_t=
 nb_granules, bool leaf) "nested IOTLB invalidate asid=3D%d, addr=3D0x%"PRI=
x64" granule_size=3D0x%"PRIx64" nb_granules=3D0x%"PRIx64" leaf=3D%d"
 vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=3D%d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8ca34146d7..2ef39cbbc3 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -200,6 +200,13 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, uin=
t32_t type,
 bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_ty=
pe);
 struct vfio_info_cap_header *
 vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id);
+int vfio_get_irq_info(VFIODevice *vbasedev, int index,
+                      struct vfio_irq_info **info);
+int vfio_get_dev_irq_info(VFIODevice *vbasedev, uint32_t type,
+                          uint32_t subtype, struct vfio_irq_info **info);
+bool vfio_has_irq_cap(VFIODevice *vbasedev, int irq, uint16_t cap_type);
+struct vfio_info_cap_header *
+vfio_get_irq_info_cap(struct vfio_irq_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
=20
--=20
2.20.1

