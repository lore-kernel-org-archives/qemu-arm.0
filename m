Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2298330lfg;
        Mon, 2 Mar 2020 02:56:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqyP2qzqWZmnSXxnEIycPOJcngq1n7WzX8WzSF5kyXwusw+nnAmORE6F4IVrx6LOanFRrXED
X-Received: by 2002:a37:64d5:: with SMTP id y204mr15135587qkb.443.1583146574049;
        Mon, 02 Mar 2020 02:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583146574; cv=none;
        d=google.com; s=arc-20160816;
        b=PdonQ9lz149Zyob779TX/F1bCE+Jvlpt02ksC5/+p2bBtYArZvc1fuXYN+nS9B843M
         gQ8G5IMN+H8kMCiOBBe+OwQvCwAJ2o0h7zWwpLFJkZD7AorLNg63b0wWa2BT8VlBwsib
         yRvwt91vwlyKkFMH/psEaSdUHS2CLa8jYrW5FWlcwOvb5dFmhbsEwYF44Uui858ql/U2
         +vly5oSGEPiT7mG14djb2cVzn6U9w/TgogQnmLnP6jgCvzayigscs/n5qapQ0mtTYxWN
         inX//XKoMTh8RyXW1EmBrpHVwK8zq0Nx+FzvPqOlzEsVrViNWC188ApyRYcyXrKHOaZk
         Xrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0ZwQ/Y/HxlMFfEeyYufYwgTCzmOzN8BKUwCoemgUYoE=;
        b=cWIm6Hc2QA+P4I52guJ2Wk2LxprPa5MA9i1bTfJPG1ygufdmZXDHaEadZ7VgsS6QJd
         fK4a/FQCg7R9+8229Ifj87NzmKxJqNNWPQJgA6rA8p82PLt6L+jEFTHwQxv77YPqGNzc
         /8Fx+TpNWvQGjwRJyCOK02ty+9BocYso/Ed/A9NOO6H4Jj/tXvy1JcnmdHN/7y2rcpGj
         8g+31Z0rTbOWvatVnSLZfqRr+il3Nlh6zYOY5gCUN+3g7X+oql49V6R4UeHkeuC2ko9N
         Jk+svbEngWwFL6/io1/43ganol1qPMOiqNCy6S7G6DfXMgV5omINTiWH77ZQyYCjMUM5
         DD6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tl+5IuG1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si5774129qtc.384.2020.03.02.02.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 02:56:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tl+5IuG1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8ik9-000852-FQ
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 05:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijU-0007pC-OF
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijT-000432-9p
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42000
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8ijT-00042y-6B
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583146530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZwQ/Y/HxlMFfEeyYufYwgTCzmOzN8BKUwCoemgUYoE=;
 b=Tl+5IuG1wzi+FNRuIea8zZrmd+YeMx9qcxz8P4CWkC/BLH6+BsA7h+Ci2xeMdB7BVSrUtQ
 s2nmLIsLxIcUjtMt040hGj5zQTpbivFjOAByY0cb9ar2l7d8WDoiydATfikOn+I+jsH8Xu
 3iAdvzp3hY2HXrpk5Hq6/FILgXg2MTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-Sc64xXyDOYqUQtcxRTYy3A-1; Mon, 02 Mar 2020 05:55:29 -0500
X-MC-Unique: Sc64xXyDOYqUQtcxRTYy3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A1E9800EB5;
 Mon,  2 Mar 2020 10:55:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD50939D;
 Mon,  2 Mar 2020 10:55:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 2/6] hw/arm/virt: Introduce VirtGICType enum type
Date: Mon,  2 Mar 2020 11:55:12 +0100
Message-Id: <20200302105516.5972-3-eric.auger@redhat.com>
In-Reply-To: <20200302105516.5972-1-eric.auger@redhat.com>
References: <20200302105516.5972-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pMPPjv3ERUpL

We plan to introduce yet another value for the gic version (nosel).
As we already use exotic values such as 0 and -1, let's introduce
a dedicated enum type and let vms->gic_version take this
type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- replaced defines by enum VirtGICType
- use that new type for vms->gic_version
---
 hw/arm/virt.c         | 30 +++++++++++++++---------------
 include/hw/arm/virt.h | 11 +++++++++--
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c093f0ab85..b449a445de 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -298,7 +298,7 @@ static void fdt_add_timer_nodes(const VirtMachineState =
*vms)
         irqflags =3D GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
     }
=20
-    if (vms->gic_version =3D=3D 2) {
+    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_2) {
         irqflags =3D deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
                              (1 << vms->smp_cpus) - 1);
@@ -439,7 +439,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
     qemu_fdt_setprop_cell(vms->fdt, nodename, "#address-cells", 0x2);
     qemu_fdt_setprop_cell(vms->fdt, nodename, "#size-cells", 0x2);
     qemu_fdt_setprop(vms->fdt, nodename, "ranges", NULL, 0);
-    if (vms->gic_version =3D=3D 3) {
+    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_3) {
         int nb_redist_regions =3D virt_gicv3_redist_region_count(vms);
=20
         qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
@@ -518,7 +518,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *v=
ms)
         }
     }
=20
-    if (vms->gic_version =3D=3D 2) {
+    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_2) {
         irqflags =3D deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
                              (1 << vms->smp_cpus) - 1);
@@ -1469,7 +1469,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState=
 *vms, int idx)
          * purposes are to make TCG consistent (with 64-bit KVM hosts)
          * and to improve SGI efficiency.
          */
-        if (vms->gic_version =3D=3D 3) {
+        if (vms->gic_version =3D=3D VIRT_GIC_VERSION_3) {
             clustersz =3D GICV3_TARGETLIST_BITS;
         } else {
             clustersz =3D GIC_TARGETLIST_BITS;
@@ -1560,15 +1560,15 @@ static void machvirt_init(MachineState *machine)
     /* We can probe only here because during property set
      * KVM is not available yet
      */
-    if (vms->gic_version <=3D 0) {
-        /* "host" or "max" */
+    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST ||
+        vms->gic_version =3D=3D VIRT_GIC_VERSION_MAX) {
         if (!kvm_enabled()) {
-            if (vms->gic_version =3D=3D 0) {
+            if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST) {
                 error_report("gic-version=3Dhost requires KVM");
                 exit(1);
             } else {
                 /* "max": currently means 3 for TCG */
-                vms->gic_version =3D 3;
+                vms->gic_version =3D VIRT_GIC_VERSION_3;
             }
         } else {
             vms->gic_version =3D kvm_arm_vgic_probe();
@@ -1627,7 +1627,7 @@ static void machvirt_init(MachineState *machine)
     /* The maximum number of CPUs depends on the GIC version, or on how
      * many redistributors we can fit into the memory map.
      */
-    if (vms->gic_version =3D=3D 3) {
+    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_3) {
         virt_max_cpus =3D
             vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
         virt_max_cpus +=3D
@@ -1855,7 +1855,7 @@ static void virt_set_its(Object *obj, bool value, Err=
or **errp)
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(obj);
-    const char *val =3D vms->gic_version =3D=3D 3 ? "3" : "2";
+    const char *val =3D vms->gic_version =3D=3D VIRT_GIC_VERSION_3 ? "3" :=
 "2";
=20
     return g_strdup(val);
 }
@@ -1865,13 +1865,13 @@ static void virt_set_gic_version(Object *obj, const=
 char *value, Error **errp)
     VirtMachineState *vms =3D VIRT_MACHINE(obj);
=20
     if (!strcmp(value, "3")) {
-        vms->gic_version =3D 3;
+        vms->gic_version =3D VIRT_GIC_VERSION_3;
     } else if (!strcmp(value, "2")) {
-        vms->gic_version =3D 2;
+        vms->gic_version =3D VIRT_GIC_VERSION_2;
     } else if (!strcmp(value, "host")) {
-        vms->gic_version =3D 0; /* Will probe later */
+        vms->gic_version =3D VIRT_GIC_VERSION_HOST; /* Will probe later */
     } else if (!strcmp(value, "max")) {
-        vms->gic_version =3D -1; /* Will probe later */
+        vms->gic_version =3D VIRT_GIC_VERSION_MAX; /* Will probe later */
     } else {
         error_setg(errp, "Invalid gic-version value");
         error_append_hint(errp, "Valid values are 3, 2, host, max.\n");
@@ -2139,7 +2139,7 @@ static void virt_instance_init(Object *obj)
                                     "physical address space above 32 bits"=
,
                                     NULL);
     /* Default GIC type is v2 */
-    vms->gic_version =3D 2;
+    vms->gic_version =3D VIRT_GIC_VERSION_2;
     object_property_add_str(obj, "gic-version", virt_get_gic_version,
                         virt_set_gic_version, NULL);
     object_property_set_description(obj, "gic-version",
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 02f500cb8e..c0827cacdf 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -95,6 +95,13 @@ typedef enum VirtIOMMUType {
     VIRT_IOMMU_VIRTIO,
 } VirtIOMMUType;
=20
+typedef enum VirtGICType {
+    VIRT_GIC_VERSION_MAX,
+    VIRT_GIC_VERSION_HOST,
+    VIRT_GIC_VERSION_2,
+    VIRT_GIC_VERSION_3,
+} VirtGICType;
+
 typedef struct MemMapEntry {
     hwaddr base;
     hwaddr size;
@@ -123,7 +130,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
-    int32_t gic_version;
+    VirtGICType gic_version;
     VirtIOMMUType iommu;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
@@ -162,7 +169,7 @@ static inline int virt_gicv3_redist_region_count(VirtMa=
chineState *vms)
     uint32_t redist0_capacity =3D
                 vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
=20
-    assert(vms->gic_version =3D=3D 3);
+    assert(vms->gic_version =3D=3D VIRT_GIC_VERSION_3);
=20
     return vms->smp_cpus > redist0_capacity ? 2 : 1;
 }
--=20
2.20.1

