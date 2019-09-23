Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2332658wrp;
        Sun, 22 Sep 2019 23:56:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6IXfg8des3MbpzVnbwlgoji4eqzP5BfHYA+BZiqzeotznbQ5gQSdzmT+oyO+UxIqM+KS4
X-Received: by 2002:a37:7d43:: with SMTP id y64mr16321291qkc.168.1569221809731;
        Sun, 22 Sep 2019 23:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569221809; cv=none;
        d=google.com; s=arc-20160816;
        b=Hw/PZjFdiPgQ8u62Sgej1aWuH82zvetJsxG2+GfBMp5ns4HQHj2zIW/6EaeaQnewLs
         g6OYRY7g7omaYyskppDrDGlNyYCIs0+7ok9VQqg3BRfLkggFPkf2GzJtipyKsU/q5bhw
         mGgc7LHGLhCO31x/dTLTfVgLVhLbtf9SIAgIEBzorNbR4yNmCS6sW0Yk/XieKEVTm+Iy
         upFcS819PEqDWKSIdBNyXVZHTN48zdEEksxtXrdL7ZTvp/DJXoNz3caoe0zqxxImdhvX
         KyFxes1klBatxpARTxyHym/DGDeFxJwP3U1ss4A+6tRTYtAb3xVR4vbzIjjSKjdVoKiS
         FPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=vF8GPtkBO/yzpOeo2+few60Ah6GQcdTHf61i45HwOQQ=;
        b=A4l+4KtHi3GNeQFQ1SLdVoz34kzFOpOdN0lipAHg2Xx2K32WGgr3xA+S+KJajmh4kN
         KkGU+5j/3c0msUGku4gpX3NFCBZQWgsB9blp93iit81I6IsikTzIOYWxkRGcIAn1+b+w
         4PQLGpZRTNLRJzYb4MXs6ERSdbNYkMWYt4AHEd6tRx54/M68usME7wZ+uFpXoXbR95nz
         U5bLWDgLzOq6dGFiO7ymIUJrkanM5bC5wGZtAJy1xcKB1NcRrMPpWMcY5Rrs1X2jrThV
         bIHCGM75+Z6R6YhyYaBxCTgl0Cmp0oiaCeOTFnXeGjmibo0DAPuHyQP1TBbyZZ7mKQKG
         H1Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si7791248qvd.191.2019.09.22.23.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 23:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCIH6-0006U7-HE
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 02:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iCIGg-0006Fb-10
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 02:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iCIGd-0006rY-QM
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 02:56:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41398)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iCIGd-0006r6-IG; Mon, 23 Sep 2019 02:56:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE86E87642;
 Mon, 23 Sep 2019 06:56:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08A9A5B681;
 Mon, 23 Sep 2019 06:56:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com, aik@ozlabs.ru,
 david@gibson.dropbear.id.au
Subject: [PATCH v3 2/2] memory: allow memory_region_register_iommu_notifier()
 to fail
Date: Mon, 23 Sep 2019 08:55:52 +0200
Message-Id: <20190923065552.10602-3-eric.auger@redhat.com>
In-Reply-To: <20190923065552.10602-1-eric.auger@redhat.com>
References: <20190923065552.10602-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 23 Sep 2019 06:56:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ep+4/qu5VtZB

Currently, when a notifier is attempted to be registered and its
flags are not supported (especially the MAP one) by the IOMMU MR,
we generally abruptly exit in the IOMMU code. The failure could be
handled more nicely in the caller and especially in the VFIO code.

So let's allow memory_region_register_iommu_notifier() to fail as
well as notify_flag_changed() callback.

All sites implementing the callback are updated. This patch does
not yet remove the exit(1) in the amd_iommu code.

in SMMUv3 we turn the warning message into an error message saying
that the assigned device would not work properly.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- turn the warning message into an error message
---
 exec.c                | 10 ++++++++--
 hw/arm/smmuv3.c       | 18 ++++++++++--------
 hw/i386/amd_iommu.c   | 17 ++++++++++-------
 hw/i386/intel_iommu.c |  8 +++++---
 hw/ppc/spapr_iommu.c  |  8 +++++---
 hw/vfio/common.c      |  8 ++++++--
 hw/virtio/vhost.c     |  9 +++++++--
 include/exec/memory.h | 21 ++++++++++++++++-----
 memory.c              | 31 ++++++++++++++++++++-----------
 9 files changed, 87 insertions(+), 43 deletions(-)

diff --git a/exec.c b/exec.c
index 8b998974f8..7379330756 100644
--- a/exec.c
+++ b/exec.c
@@ -663,7 +663,8 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
      */
     MemoryRegion *mr =3D MEMORY_REGION(iommu_mr);
     TCGIOMMUNotifier *notifier;
-    int i;
+    Error *err =3D NULL;
+    int i, ret;
=20
     for (i =3D 0; i < cpu->iommu_notifiers->len; i++) {
         notifier =3D g_array_index(cpu->iommu_notifiers, TCGIOMMUNotifie=
r *, i);
@@ -692,7 +693,12 @@ static void tcg_register_iommu_notifier(CPUState *cp=
u,
                             0,
                             HWADDR_MAX,
                             iommu_idx);
-        memory_region_register_iommu_notifier(notifier->mr, &notifier->n=
);
+        ret =3D memory_region_register_iommu_notifier(notifier->mr, &not=
ifier->n,
+                                                    &err);
+        if (ret) {
+            error_report_err(err);
+            exit(1);
+        }
     }
=20
     if (!notifier->active) {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index db051dcac8..e2fbb8357e 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1469,20 +1469,21 @@ static void smmuv3_class_init(ObjectClass *klass,=
 void *data)
     dc->realize =3D smmu_realize;
 }
=20
-static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
-                                       IOMMUNotifierFlag old,
-                                       IOMMUNotifierFlag new)
+static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                      IOMMUNotifierFlag old,
+                                      IOMMUNotifierFlag new,
+                                      Error **errp)
 {
     SMMUDevice *sdev =3D container_of(iommu, SMMUDevice, iommu);
     SMMUv3State *s3 =3D sdev->smmu;
     SMMUState *s =3D &(s3->smmu_state);
=20
     if (new & IOMMU_NOTIFIER_MAP) {
-        int bus_num =3D pci_bus_num(sdev->bus);
-        PCIDevice *pcidev =3D pci_find_device(sdev->bus, bus_num, sdev->=
devfn);
-
-        warn_report("SMMUv3 does not support notification on MAP: "
-                     "device %s will not function properly", pcidev->nam=
e);
+        error_setg(errp,
+                   "device %02x.%02x.%x requires iommu MAP notifier whic=
h is "
+                   "not currently supported", pci_bus_num(sdev->bus),
+                   PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
+        return -EINVAL;
     }
=20
     if (old =3D=3D IOMMU_NOTIFIER_NONE) {
@@ -1492,6 +1493,7 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryR=
egion *iommu,
         trace_smmuv3_notify_flag_del(iommu->parent_obj.name);
         QLIST_REMOVE(sdev, next);
     }
+    return 0;
 }
=20
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 08884523e2..d3726361dd 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1466,18 +1466,21 @@ static const MemoryRegionOps mmio_mem_ops =3D {
     }
 };
=20
-static void amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
-                                            IOMMUNotifierFlag old,
-                                            IOMMUNotifierFlag new)
+static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                           IOMMUNotifierFlag old,
+                                           IOMMUNotifierFlag new,
+                                           Error **errp)
 {
     AMDVIAddressSpace *as =3D container_of(iommu, AMDVIAddressSpace, iom=
mu);
=20
     if (new & IOMMU_NOTIFIER_MAP) {
-        error_report("device %02x.%02x.%x requires iommu notifier which =
is not "
-                     "currently supported", as->bus_num, PCI_SLOT(as->de=
vfn),
-                     PCI_FUNC(as->devfn));
-        exit(1);
+        error_setg(errp,
+                   "device %02x.%02x.%x requires iommu notifier which is=
 not "
+                   "currently supported", as->bus_num, PCI_SLOT(as->devf=
n),
+                   PCI_FUNC(as->devfn));
+        return -EINVAL;
     }
+    return 0;
 }
=20
 static void amdvi_init(AMDVIState *s)
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f1de8fdb75..771bed25c9 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2929,9 +2929,10 @@ static IOMMUTLBEntry vtd_iommu_translate(IOMMUMemo=
ryRegion *iommu, hwaddr addr,
     return iotlb;
 }
=20
-static void vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
-                                          IOMMUNotifierFlag old,
-                                          IOMMUNotifierFlag new)
+static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                         IOMMUNotifierFlag old,
+                                         IOMMUNotifierFlag new,
+                                         Error **errp)
 {
     VTDAddressSpace *vtd_as =3D container_of(iommu, VTDAddressSpace, iom=
mu);
     IntelIOMMUState *s =3D vtd_as->iommu_state;
@@ -2944,6 +2945,7 @@ static void vtd_iommu_notify_flag_changed(IOMMUMemo=
ryRegion *iommu,
     } else if (new =3D=3D IOMMU_NOTIFIER_NONE) {
         QLIST_REMOVE(vtd_as, next);
     }
+    return 0;
 }
=20
 static int vtd_post_load(void *opaque, int version_id)
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index e87b3d50f7..3d3bcc8649 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -205,9 +205,10 @@ static int spapr_tce_get_attr(IOMMUMemoryRegion *iom=
mu,
     return -EINVAL;
 }
=20
-static void spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
-                                          IOMMUNotifierFlag old,
-                                          IOMMUNotifierFlag new)
+static int spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                         IOMMUNotifierFlag old,
+                                         IOMMUNotifierFlag new,
+                                         Error **errp)
 {
     struct SpaprTceTable *tbl =3D container_of(iommu, SpaprTceTable, iom=
mu);
=20
@@ -216,6 +217,7 @@ static void spapr_tce_notify_flag_changed(IOMMUMemory=
Region *iommu,
     } else if (old !=3D IOMMU_NOTIFIER_NONE && new =3D=3D IOMMU_NOTIFIER=
_NONE) {
         spapr_tce_set_need_vfio(tbl, false);
     }
+    return 0;
 }
=20
 static int spapr_tce_table_post_load(void *opaque, int version_id)
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a0670cc63a..11312fc02f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -635,9 +635,13 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
                             section->offset_within_region,
                             int128_get64(llend),
                             iommu_idx);
-        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
=20
-        memory_region_register_iommu_notifier(mr, &giommu->n);
+        ret =3D memory_region_register_iommu_notifier(mr, &giommu->n, &e=
rr);
+        if (ret) {
+            g_free(giommu);
+            goto fail;
+        }
+        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
         memory_region_iommu_replay(giommu->iommu, &giommu->n);
=20
         return;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 34accdf615..9a65f034a5 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -672,8 +672,9 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
                                          iommu_listener);
     struct vhost_iommu *iommu;
     Int128 end;
-    int iommu_idx;
+    int iommu_idx, ret;
     IOMMUMemoryRegion *iommu_mr;
+    Error *err =3D NULL;
=20
     if (!memory_region_is_iommu(section->mr)) {
         return;
@@ -696,7 +697,11 @@ static void vhost_iommu_region_add(MemoryListener *l=
istener,
     iommu->iommu_offset =3D section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev =3D dev;
-    memory_region_register_iommu_notifier(section->mr, &iommu->n);
+    ret =3D memory_region_register_iommu_notifier(section->mr, &iommu->n=
, &err);
+    if (ret) {
+        error_report_err(err);
+        exit(1);
+    }
     QLIST_INSERT_HEAD(&dev->iommu_list, iommu, iommu_next);
     /* TODO: can replay help performance here? */
 }
diff --git a/include/exec/memory.h b/include/exec/memory.h
index a30245c25a..c16430726c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -288,10 +288,16 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      * @old_flags: events which previously needed to be notified
      * @new_flags: events which now need to be notified
+     *
+     * Returns 0 on success, or a negative errno; in particular
+     * returns -EINVAL if the new flag bitmap is not supported by the
+     * IOMMU memory region. In case of failure, the error object
+     * must be created
      */
-    void (*notify_flag_changed)(IOMMUMemoryRegion *iommu,
-                                IOMMUNotifierFlag old_flags,
-                                IOMMUNotifierFlag new_flags);
+    int (*notify_flag_changed)(IOMMUMemoryRegion *iommu,
+                               IOMMUNotifierFlag old_flags,
+                               IOMMUNotifierFlag new_flags,
+                               Error **errp);
     /* Called to handle memory_region_iommu_replay().
      *
      * The default implementation of memory_region_iommu_replay() is to
@@ -1067,13 +1073,18 @@ void memory_region_notify_one(IOMMUNotifier *noti=
fier,
  * memory_region_register_iommu_notifier: register a notifier for change=
s to
  * IOMMU translation entries.
  *
+ * Returns 0 on success, or a negative errno otherwise. In particular,
+ * -EINVAL indicates that at least one of the attributes of the notifier
+ * is not supported (flag/range) by the IOMMU memory region. In case of =
error
+ * the error object must be created.
+ *
  * @mr: the memory region to observe
  * @n: the IOMMUNotifier to be added; the notify callback receives a
  *     pointer to an #IOMMUTLBEntry as the opaque value; the pointer
  *     ceases to be valid on exit from the notifier.
  */
-void memory_region_register_iommu_notifier(MemoryRegion *mr,
-                                           IOMMUNotifier *n);
+int memory_region_register_iommu_notifier(MemoryRegion *mr,
+                                          IOMMUNotifier *n, Error **errp=
);
=20
 /**
  * memory_region_iommu_replay: replay existing IOMMU translations to
diff --git a/memory.c b/memory.c
index b9dd6b94ca..6df84a4f9c 100644
--- a/memory.c
+++ b/memory.c
@@ -1837,33 +1837,38 @@ bool memory_region_is_logging(MemoryRegion *mr, u=
int8_t client)
     return memory_region_get_dirty_log_mask(mr) & (1 << client);
 }
=20
-static void memory_region_update_iommu_notify_flags(IOMMUMemoryRegion *i=
ommu_mr)
+static int memory_region_update_iommu_notify_flags(IOMMUMemoryRegion *io=
mmu_mr,
+                                                   Error **errp)
 {
     IOMMUNotifierFlag flags =3D IOMMU_NOTIFIER_NONE;
     IOMMUNotifier *iommu_notifier;
     IOMMUMemoryRegionClass *imrc =3D IOMMU_MEMORY_REGION_GET_CLASS(iommu=
_mr);
+    int ret =3D 0;
=20
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         flags |=3D iommu_notifier->notifier_flags;
     }
=20
     if (flags !=3D iommu_mr->iommu_notify_flags && imrc->notify_flag_cha=
nged) {
-        imrc->notify_flag_changed(iommu_mr,
-                                  iommu_mr->iommu_notify_flags,
-                                  flags);
+        ret =3D imrc->notify_flag_changed(iommu_mr,
+                                        iommu_mr->iommu_notify_flags,
+                                        flags, errp);
     }
=20
-    iommu_mr->iommu_notify_flags =3D flags;
+    if (!ret) {
+        iommu_mr->iommu_notify_flags =3D flags;
+    }
+    return ret;
 }
=20
-void memory_region_register_iommu_notifier(MemoryRegion *mr,
-                                           IOMMUNotifier *n)
+int memory_region_register_iommu_notifier(MemoryRegion *mr,
+                                          IOMMUNotifier *n, Error **errp=
)
 {
     IOMMUMemoryRegion *iommu_mr;
+    int ret;
=20
     if (mr->alias) {
-        memory_region_register_iommu_notifier(mr->alias, n);
-        return;
+        return memory_region_register_iommu_notifier(mr->alias, n, errp)=
;
     }
=20
     /* We need to register for at least one bitfield */
@@ -1874,7 +1879,11 @@ void memory_region_register_iommu_notifier(MemoryR=
egion *mr,
            n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
=20
     QLIST_INSERT_HEAD(&iommu_mr->iommu_notify, n, node);
-    memory_region_update_iommu_notify_flags(iommu_mr);
+    ret =3D memory_region_update_iommu_notify_flags(iommu_mr, errp);
+    if (ret) {
+        QLIST_REMOVE(n, node);
+    }
+    return ret;
 }
=20
 uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_=
mr)
@@ -1927,7 +1936,7 @@ void memory_region_unregister_iommu_notifier(Memory=
Region *mr,
     }
     QLIST_REMOVE(n, node);
     iommu_mr =3D IOMMU_MEMORY_REGION(mr);
-    memory_region_update_iommu_notify_flags(iommu_mr);
+    memory_region_update_iommu_notify_flags(iommu_mr, NULL);
 }
=20
 void memory_region_notify_one(IOMMUNotifier *notifier,
--=20
2.20.1

