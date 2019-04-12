Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp363584wrx;
        Fri, 12 Apr 2019 03:08:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyp8cVCmRKC8T8VyJYlDO+EpwOuiOAn3wRfJ23TjpQBaNvJzwvMx+sOsmR1cWEpKX3tuziI
X-Received: by 2002:a7b:cd08:: with SMTP id f8mr10609445wmj.86.1555063694948;
        Fri, 12 Apr 2019 03:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063694; cv=none;
        d=google.com; s=arc-20160816;
        b=J5PEBo03k2hLnTkudAppKNDAYXiQ+xLEaJbj2bSilMxVfF56IrChRJIUxAlIYToX5S
         Wv+YoIEgkwaTMNjwYGlZeNArpl0Ify/Uo/Uh3khw94kXJWKzu6mPcKR1dZlvEbOk4B5L
         WSZbY7BcRDy7K7RVPIz79QXJ0ziXrVY2qrx1+CUIFqlNK28wjxp4DxC3Oj6bGC/aSFwW
         lf9bhLtvikAX6/bgPwPlAgqVcjPouZspMIO70B4Elv28PxczJ2glF368ABCEGy62u5iI
         xm1O7hdVmFmGlNOV4bqpnKPrq1fPfLoJmNPg3PPpV9NaYBGxaJjwfA+KGMo94KYVs6gZ
         6idg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Hmc8JXSfBsCA6fyrtBxKLNU0T2BCTSVMVVWBfWTDUgw=;
        b=WqkNxyFvZAXPFQ60msHWd0OwrF8NKpzTD3GmuWUNMcRblThlAjaJqsBrB49YFkajlV
         v/3AF7P8ZCIEIWLzGk0okTEjF56/T814NmllWj0L/r27nHINwvYOrqC5ECXx2hZQJERW
         XO0Ff2K534GniOWE/6NcvFdtlgMFWMwwDy354jJ5SKFsSraEmjYC0MOUyeB2p6wxl5M9
         /zfpjFmUisLaJlpv0GKQiZUcsMTD+x1BPLXG09ZOjJAZ2w0DcgbiNI8omOYonGlZzL/U
         YEEBjVOZAgj5hixV7l+own/q/qbvuLtQWHryUoM6kZDGkj5/r3ydscVTCXdnILUVEbkn
         hvSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si26504053wrx.449.2019.04.12.03.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEt6T-0004KD-Uj
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:08:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3P-0001Ar-SH
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3O-0003ye-Pr
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt3O-0003x0-8H; Fri, 12 Apr 2019 06:05:02 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77E1A3082B51;
	Fri, 12 Apr 2019 10:05:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE57C19C65;
	Fri, 12 Apr 2019 10:04:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:35 +0200
Message-Id: <20190412100354.6409-9-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 12 Apr 2019 10:05:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 08/27] hw/vfio/common: Force nested if iommu
 requires it
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vyb4tetjDuiu

In case we detect the address space is translated by
a virtual IOMMU which requires nested stages, let's set up
the container with the VFIO_TYPE1_NESTING_IOMMU iommu_type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- add "nested only is selected if requested by @force_nested"
  comment in this patch
---
 hw/vfio/common.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f88fd10ca3..49ce874244 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1119,14 +1119,19 @@ static void vfio_put_address_space(VFIOAddressSpa=
ce *space)
  * vfio_get_iommu_type - selects the richest iommu_type (v2 first)
  */
 static int vfio_get_iommu_type(VFIOContainer *container,
+                               bool force_nested,
                                Error **errp)
 {
-    int iommu_types[] =3D { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
+    int iommu_types[] =3D { VFIO_TYPE1_NESTING_IOMMU,
+                          VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
                           VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU =
};
     int i;
=20
     for (i =3D 0; i < ARRAY_SIZE(iommu_types); i++) {
         if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) =
{
+            if (iommu_types[i] =3D=3D VFIO_TYPE1_NESTING_IOMMU && !force=
_nested) {
+                continue;
+            }
             return iommu_types[i];
         }
     }
@@ -1135,11 +1140,11 @@ static int vfio_get_iommu_type(VFIOContainer *con=
tainer,
 }
=20
 static int vfio_init_container(VFIOContainer *container, int group_fd,
-                               Error **errp)
+                               bool force_nested, Error **errp)
 {
     int iommu_type, ret;
=20
-    iommu_type =3D vfio_get_iommu_type(container, errp);
+    iommu_type =3D vfio_get_iommu_type(container, force_nested, errp);
     if (iommu_type < 0) {
         return iommu_type;
     }
@@ -1175,6 +1180,14 @@ static int vfio_connect_container(VFIOGroup *group=
, AddressSpace *as,
     VFIOContainer *container;
     int ret, fd;
     VFIOAddressSpace *space;
+    IOMMUMemoryRegion *iommu_mr;
+    bool force_nested =3D false;
+
+    if (as !=3D &address_space_memory && memory_region_is_iommu(as->root=
)) {
+        iommu_mr =3D IOMMU_MEMORY_REGION(as->root);
+        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                     (void *)&force_nested);
+    }
=20
     space =3D vfio_get_address_space(as);
=20
@@ -1235,12 +1248,18 @@ static int vfio_connect_container(VFIOGroup *grou=
p, AddressSpace *as,
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
=20
-    ret =3D vfio_init_container(container, group->fd, errp);
+    ret =3D vfio_init_container(container, group->fd, force_nested, errp=
);
     if (ret) {
         goto free_container_exit;
     }
=20
+    if (force_nested && container->iommu_type !=3D VFIO_TYPE1_NESTING_IO=
MMU) {
+            error_setg(errp, "nested mode requested by the virtual IOMMU=
 "
+                       "but not supported by the vfio iommu");
+    }
+
     switch (container->iommu_type) {
+    case VFIO_TYPE1_NESTING_IOMMU:
     case VFIO_TYPE1v2_IOMMU:
     case VFIO_TYPE1_IOMMU:
     {
--=20
2.20.1

