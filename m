Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6325087wrg;
        Mon, 27 May 2019 05:03:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDbOsvI+peR0i3MDkqE7IpeHj3d3kAWCPWKhj4hwPa6crOx3RULUjLgLqi9AB9z9VhAyqK
X-Received: by 2002:a37:de06:: with SMTP id h6mr11113808qkj.322.1558958621816;
        Mon, 27 May 2019 05:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558958621; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3vPHkxGMGl09V7Km/w0dLY9i5Ip+af1MZbFakCHCXzS4Z/44DyPaA5X0dnXgLz5y5
         rCzhjdZPBl4F4D82wsFgywIvjSRmy4QLgA/EQXBqhgDGuqKYBazEtVqIg6sWJpIlCL0A
         vhed8BgpNelH75A6Jgvgb8sadSyplt3xQX4s1Qlo1buSEDba4F7jDbeJ0RmR8x1hWeTU
         gWr0Mh/xPvmEJG47z9OJg7mxaFg0pkVmqsRkvpf06ocTJsguPDnvHsTQLwJY/5uixGeH
         nyE6XPXmpvSIrTDWe8yg568bz6yLDQvQShzoWtkXPaNlEJzNG53JzaUv3+yFRX/ssea8
         g5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=48XWu7Y9kHMwbbeJDc33E0GYOIEbiTOQdCNBCYwRpGU=;
        b=cH9KsOARyq03syZsf26hwcUnroYEgfiD0xAEIoaFYAWCp1xQ0GpWbhuI99Flt4vT0I
         N4svKgSag4tQYFE5l4/DDEtIYAI+BhimJ4buKpRS4uu14M8xd3jlTgULdwiaw+xE2nJ8
         5kiTOwGrgizSOARJS3nZeK1TyS9kQcyCRfWFC2o8Z+TjyHx4SGqJfJxMEFa+8Rsro556
         PSlXMvneW6BkdcPN+AhvCK7KZiPSY5HfNiXABWQlt+oM26Yes45RSSF0Jti3s/f/Lfph
         CXbnqvJ+bsO4V5n3WUtqctzd3Rhf/1witZuF6xA/4TOMWUatvY7Xk6k/xvwcPTyj2xaW
         UKAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l123si2010410qke.27.2019.05.27.05.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 05:03:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVELq-0002Nf-Sb
	for alex.bennee@linaro.org; Mon, 27 May 2019 08:03:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3f-0004fJ-4S
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3d-0004u5-Vl
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE3b-0004on-4W; Mon, 27 May 2019 07:44:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 591A381DE8;
	Mon, 27 May 2019 11:44:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68C2A5D962;
	Mon, 27 May 2019 11:44:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:57 +0200
Message-Id: <20190527114203.2762-22-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 27 May 2019 11:44:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 21/27] hw/vfio/common: Register a MAP notifier
 for MSI binding
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ej27KmaCRTyG

Instantiate a MAP notifier to register the MSI stage 1
binding (gIOVA -> gDB) to the host. This allows the host
to build a nested mapping towards the physical doorbell:
guest IOVA -> guest Doorbell -> physical doorbell.
          Stage1          Stage 2

The unregistration is done on VFIO container deallocation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- only register the notifier if the IOMMU translates MSIs
- record the msi bindings in a container list and unregister on
  container release
---
 hw/vfio/common.c              | 69 +++++++++++++++++++++++++++++++++++
 include/hw/vfio/vfio-common.h |  8 ++++
 2 files changed, 77 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 084e3f30e6..532ede0e70 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -510,6 +510,56 @@ static void vfio_iommu_unmap_notify(IOMMUNotifier *n=
, IOMMUTLBEntry *iotlb)
     }
 }
=20
+static void vfio_iommu_msi_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *i=
otlb)
+{
+    VFIOGuestIOMMU *giommu =3D container_of(n, VFIOGuestIOMMU, n);
+    VFIOContainer *container =3D giommu->container;
+    int ret;
+
+    struct vfio_iommu_type1_bind_msi ustruct;
+    VFIOMSIBinding *binding;
+
+    QLIST_FOREACH(binding, &container->msibinding_list, next) {
+        if (binding->iova =3D=3D iotlb->iova) {
+            return;
+        }
+    }
+    ustruct.argsz =3D sizeof(struct vfio_iommu_type1_bind_msi);
+    ustruct.flags =3D 0;
+
+    ustruct.iova =3D iotlb->iova;
+    ustruct.gpa =3D iotlb->translated_addr;
+    ustruct.size =3D iotlb->addr_mask + 1;
+    ret =3D ioctl(container->fd, VFIO_IOMMU_BIND_MSI , &ustruct);
+    if (ret) {
+        error_report("%s: failed to register the stage1 MSI binding (%d)=
",
+                     __func__, ret);
+    }
+    binding =3D  g_new0(VFIOMSIBinding, 1);
+    binding->iova =3D ustruct.iova;
+    binding->gpa =3D ustruct.gpa;
+    binding->size =3D ustruct.size;
+
+    QLIST_INSERT_HEAD(&container->msibinding_list, binding, next);
+}
+
+static void vfio_container_unbind_msis(VFIOContainer *container)
+{
+    VFIOMSIBinding *binding, *tmp;
+
+    QLIST_FOREACH_SAFE(binding, &container->msibinding_list, next, tmp) =
{
+        struct vfio_iommu_type1_unbind_msi ustruct;
+
+        /* the MSI doorbell is not used anymore, unregister it */
+        ustruct.argsz =3D sizeof(struct vfio_iommu_type1_unbind_msi);
+        ustruct.flags =3D 0;
+        ustruct.iova =3D binding->iova;
+        ioctl(container->fd, VFIO_IOMMU_UNBIND_MSI , &ustruct);
+        QLIST_REMOVE(binding, next);
+        g_free(binding);
+    }
+}
+
 static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb=
)
 {
     VFIOGuestIOMMU *giommu =3D container_of(n, VFIOGuestIOMMU, n);
@@ -837,6 +887,8 @@ static void vfio_listener_region_add(MemoryListener *=
listener,
                                                        MEMTXATTRS_UNSPEC=
IFIED);
=20
         if (container->iommu_type =3D=3D VFIO_TYPE1_NESTING_IOMMU) {
+            bool translate_msi;
+
             /* Config notifier to propagate guest stage 1 config changes=
 */
             giommu =3D vfio_alloc_guest_iommu(container, iommu_mr, offse=
t);
             iommu_config_notifier_init(&giommu->n, vfio_iommu_nested_not=
ify,
@@ -853,6 +905,21 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
                                       iommu_idx);
             QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_ne=
xt);
             memory_region_register_iommu_notifier(section->mr, &giommu->=
n);
+
+            memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_MSI_TRANSL=
ATE,
+                                         (void *)&translate_msi);
+            if (translate_msi) {
+                giommu =3D vfio_alloc_guest_iommu(container, iommu_mr, o=
ffset);
+                iommu_iotlb_notifier_init(&giommu->n,
+                                          vfio_iommu_msi_map_notify,
+                                          IOMMU_NOTIFIER_IOTLB_MAP,
+                                          section->offset_within_region,
+                                          int128_get64(llend),
+                                          iommu_idx);
+                QLIST_INSERT_HEAD(&container->giommu_list, giommu,
+                                  giommu_next);
+                memory_region_register_iommu_notifier(section->mr, &giom=
mu->n);
+            }
         } else {
             /* MAP/UNMAP IOTLB notifier */
             giommu =3D vfio_alloc_guest_iommu(container, iommu_mr, offse=
t);
@@ -1629,6 +1696,8 @@ static void vfio_disconnect_container(VFIOGroup *gr=
oup)
             g_free(giommu);
         }
=20
+        vfio_container_unbind_msis(container);
+
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
         g_free(container);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.=
h
index 686d99ff8c..c862d87725 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -64,6 +64,13 @@ typedef struct VFIOAddressSpace {
     QLIST_ENTRY(VFIOAddressSpace) list;
 } VFIOAddressSpace;
=20
+typedef struct VFIOMSIBinding {
+    hwaddr iova;
+    hwaddr gpa;
+    hwaddr size;
+    QLIST_ENTRY(VFIOMSIBinding) next;
+} VFIOMSIBinding;
+
 struct VFIOGroup;
=20
 typedef struct VFIOContainer {
@@ -83,6 +90,7 @@ typedef struct VFIOContainer {
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
+    QLIST_HEAD(, VFIOMSIBinding) msibinding_list;
     QLIST_ENTRY(VFIOContainer) next;
 } VFIOContainer;
=20
--=20
2.20.1

