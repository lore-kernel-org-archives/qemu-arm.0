Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp990919wrv;
        Thu, 11 Jul 2019 10:44:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybDBgiB61k/KbSuRU/8BNjBiuZ97gqxydC1n1U5X99x6c0S3dr9HEuygEAYj7vrBiRTvFo
X-Received: by 2002:a50:ac24:: with SMTP id v33mr4877162edc.30.1562867098936;
        Thu, 11 Jul 2019 10:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562867098; cv=none;
        d=google.com; s=arc-20160816;
        b=GpxuzyMm8Y4EK8XVX+oOH0kozoWskVlVHfUxMakqwUesTaxpzNwy9i9KV0FzsOAgFj
         VbBB4CbfNWrnrQ6TS933UhelqhtSjZzQaxevl5Zcswr1LjgNzjXawNE4nARp8WgSCBod
         xTCe1JFZbtbyRQmiOqr7FAvirdfqIPIfC5GYn3K/8nP6DTje9yhA5rivlZQvA9F+V1ds
         KkvbwSwlYneUSaxsQ3zl2dDs11YQj4lDnUxnEPDgHYELRGsLIzfCyIm2JnhMYDWi5MHY
         cNLXGQoglt/nyyUFt3oGO6uzw9aFvnRSrH38gzU4VBjLudCCnKeJNLprYvTv/uhQikAu
         Tq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Q0Q0+oEx/M3sseCacMLiUjQWZp/GbVsZk0Ac7TNVUSI=;
        b=Fyhy2eMRC+vYolyvM99Lka3rDjlK29zMTNsVRlzPMScVJqFj1SvVV4KsK8zAzkmKZF
         8Uaz8gRf9Xvnlo0tszfOwDilFrD/vMksULhpGsPxbz7HhXfUDfdLycmsQrTmMKMZKewF
         G8a+NpP8NLKGV4rKEOyvCmyfbR658SUFu7kJiC9PnRpdnzNlTVCxbZBOkD0k5A91YLMx
         +jHoErpW5WsclmfRgcn3VwtqRXzjC5Mem1nkxT7tv4BQI38CUiVcE/M3x4goB6c6B5N2
         wU6/syumNG+HkYldX+8pMMXWMo7VpqQ3Akl0ZBVeBcosFdqpq00PNL39piIxtj6nLiDq
         09uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si3700700edg.93.2019.07.11.10.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld7o-0003KR-Gc
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38611)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld4a-0006Ah-KC
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:41:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld4Z-0005AG-6x
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:41:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36022)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld4T-000512-9c; Thu, 11 Jul 2019 13:41:31 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 37759308A98D;
 Thu, 11 Jul 2019 17:41:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E4076092E;
 Thu, 11 Jul 2019 17:41:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:18 +0200
Message-Id: <20190711173933.31203-15-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 11 Jul 2019 17:41:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 14/29] vfio: Force nested if iommu requires it
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
X-TUID: W7mKif2ll0YY

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

