Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp979962wrv;
        Thu, 11 Jul 2019 10:33:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeJbGEJf+hw1/nhMZm4uI5zIhdtn4GIyW/3KN5DhsWEfIUvgH7LF3he9z0v8J0+L1zEP9c
X-Received: by 2002:a17:906:ca56:: with SMTP id jx22mr4220505ejb.201.1562866382444;
        Thu, 11 Jul 2019 10:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866382; cv=none;
        d=google.com; s=arc-20160816;
        b=rv7TxH+MOtIV1/lQAu7TnwqWqY46ezUc2BvNG5nCDm2Rd7mn1rcSHRmd2LJ9sj+DGv
         GxTAs6Vuk++ESarHQEz8bR490IEtYK41uJXWpfPiQJpS7kn7MqwyWX4Yxg3D1G0ydA4E
         eMBvq4XqRaeq89UATYZ57ni35m2FeZi0SGgeIcixS/vylJd7iUCUO7leAJg/8fsJ/IF9
         dAuzoT/LbEVdxjHey8uONA/8t6sNO03F9rH3imIv/WqOz1jpcrTL4bzqKm2q4eQ7+vW7
         HJrqtYvghJ/LmdQC/EvAABLUYzCn4ZePWa5lUJJF1B+xeBMhbHQ+fvhkZepMwiDbK4vi
         H4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Q0Q0+oEx/M3sseCacMLiUjQWZp/GbVsZk0Ac7TNVUSI=;
        b=uDpomYzWrE8NLieHmv9+Y4dilCe8M8MGYxLFGlfnVM+fRXyuwGlrXVeEOixpcbpsoa
         ZCwwyt3dG+QwnkGLT2gzgOt0JLoLKVUb5oWMWeo70dGmkfM/P0uq3kbTRKiRjA/5Ggq9
         iyjweanzrStZxTpWRA4O3wMOQ+1D+Sd9eCueYlqTQtWnWDS0nnD1fay3zQ8gLJ3EKCyu
         DBvE+1ya+4ixU2Yn32qnndZT0lbihxVl6wAd7H7731uE5d8tGylTZ8PDCZ5jd/mLOm+b
         Up45MM50K6jIvHKMiPYtAeebVnb6PAYlATIXSjlUESwKlWaOs2U9bqhiAZXb4mMclSDL
         E61Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si3174225ejb.236.2019.07.11.10.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcwG-00009k-9a
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34440)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcuM-0001mn-Fz
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:31:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcuK-0003Fn-ET
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:31:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcuI-0003Du-HQ; Thu, 11 Jul 2019 13:31:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 97E4A8665F;
 Thu, 11 Jul 2019 17:30:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61F205C1B4;
 Thu, 11 Jul 2019 17:30:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:30 +0200
Message-Id: <20190711172845.31035-15-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 11 Jul 2019 17:30:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 14/29] vfio: Force nested if iommu requires it
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TcIF8eHlpob3

In case we detect the address space is translated by
a virtual IOMMU which requires HW nested paging to
integrate with VFIO, let's set up the container with
the VFIO_TYPE1_NESTING_IOMMU iommu_type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- fail immediatly if nested is wanted but not supported

v2 -> v3:
- add "nested only is selected if requested by @force_nested"
  comment in this patch
---
 hw/vfio/common.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index d622191fe6..46a1a089a4 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1144,27 +1144,38 @@ static void vfio_put_address_space(VFIOAddressSpa=
ce *space)
  * vfio_get_iommu_type - selects the richest iommu_type (v2 first)
  */
 static int vfio_get_iommu_type(VFIOContainer *container,
+                               bool want_nested,
                                Error **errp)
 {
-    int iommu_types[] =3D { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
+    int iommu_types[] =3D { VFIO_TYPE1_NESTING_IOMMU,
+                          VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
                           VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU =
};
-    int i;
+    int i, ret =3D -EINVAL;
=20
     for (i =3D 0; i < ARRAY_SIZE(iommu_types); i++) {
         if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) =
{
-            return iommu_types[i];
+            if (iommu_types[i] =3D=3D VFIO_TYPE1_NESTING_IOMMU && !want_=
nested) {
+                continue;
+            }
+            ret =3D iommu_types[i];
+            break;
         }
     }
-    error_setg(errp, "No available IOMMU models");
-    return -EINVAL;
+    if (ret < 0) {
+        error_setg(errp, "No available IOMMU models");
+    } else if (want_nested && ret !=3D VFIO_TYPE1_NESTING_IOMMU) {
+        error_setg(errp, "Nested mode requested but not supported");
+        ret =3D -EINVAL;
+    }
+    return ret;
 }
=20
 static int vfio_init_container(VFIOContainer *container, int group_fd,
-                               Error **errp)
+                               bool want_nested, Error **errp)
 {
     int iommu_type, ret;
=20
-    iommu_type =3D vfio_get_iommu_type(container, errp);
+    iommu_type =3D vfio_get_iommu_type(container, want_nested, errp);
     if (iommu_type < 0) {
         return iommu_type;
     }
@@ -1200,6 +1211,14 @@ static int vfio_connect_container(VFIOGroup *group=
, AddressSpace *as,
     VFIOContainer *container;
     int ret, fd;
     VFIOAddressSpace *space;
+    IOMMUMemoryRegion *iommu_mr;
+    bool nested =3D false;
+
+    if (as !=3D &address_space_memory && memory_region_is_iommu(as->root=
)) {
+        iommu_mr =3D IOMMU_MEMORY_REGION(as->root);
+        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                     (void *)&nested);
+    }
=20
     space =3D vfio_get_address_space(as);
=20
@@ -1260,12 +1279,13 @@ static int vfio_connect_container(VFIOGroup *grou=
p, AddressSpace *as,
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
=20
-    ret =3D vfio_init_container(container, group->fd, errp);
+    ret =3D vfio_init_container(container, group->fd, nested, errp);
     if (ret) {
         goto free_container_exit;
     }
=20
     switch (container->iommu_type) {
+    case VFIO_TYPE1_NESTING_IOMMU:
     case VFIO_TYPE1v2_IOMMU:
     case VFIO_TYPE1_IOMMU:
     {
--=20
2.20.1

