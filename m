Received: by 10.223.188.70 with SMTP id a6csp1302512wrh;
        Fri, 1 Sep 2017 10:38:16 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb55wXq8EWheWLG0B0WdJDmXSsGyobZZgiGJTE0PpbBwcpoKytV/D/DbmMv5jfBCZf5BmZcV
X-Received: by 10.55.200.11 with SMTP id c11mr3430937qkj.303.1504287496343;
        Fri, 01 Sep 2017 10:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504287496; cv=none;
        d=google.com; s=arc-20160816;
        b=nC00knSFbG8c+Xzbgc4sSCQhgRcjnNYITNSnD+ctcK+1VjZSababEyMMCIqJQpm3zq
         ULnHeV+/iGeSk81m3tJl2nxYjvTZjDDNZqV9U+aC9r+oqNEKlq8CDs0Ilm+XXM3HzxA8
         8EyuPZQkTSe4mcjiPzb4Sc/T2sbNR1uIfbi9W4kRIy8YBZ/454PqVzAkUfXYfE/2Xeu3
         joi7VcTjslmUIHuRKVjXNsFMlOCm4MWdMqP7CRl9BioS0+VIjKJ3oDBEVuzVGjbzn6VD
         qg8rChg/UKdS5EH8LrWgI4eOE8dBleD1KvcioYdFcubHhCacX5r9ZCdjZYcNHwxKt0yw
         CzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=2dfNVnfWDH/mGHDYzcY41ymj08rj9AD0hWh5rrP4Nkc=;
        b=iFbMthZ1f6f50FK1us79IJvR0fJsJxImnZ1mR+EDye2J0QWQRotDQUITRvy3XvDsSO
         VudlVrAxU4KzXo4FaQRSVvIKu1lapCksun8TYEwF2iyUBj3xnTHKYh6yvTo/JzcYga1b
         KM0DtZ1QPmsbsopfLpVC6+5r8IFLtgQ328LIMWuz++xP6yzY6AcJvptz8zSkt6a0qn2E
         ys2Smz9F4YWwsU7uqqmmjt8fhAdPwB6B/nbqcT7nnCUQSZrr7YhmRr2FE3BNnrL7hZcg
         q+3otwsjCo5fi9WTrSZD6oOK2YuQD1ZGOODFmUFqX0jQUTiT9a64uyMg+M8X49DzzzYD
         94Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b4si10713079qkd.190.2017.09.01.10.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnptW-0003Sa-3W
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:38:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpgr-0007ZK-U9
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 13:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpgn-0004qW-Mt
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 13:25:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52436)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpgc-0004fU-TX; Fri, 01 Sep 2017 13:24:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E879A81DF5;
	Fri,  1 Sep 2017 17:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E879A81DF5
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B93D7627DE;
	Fri,  1 Sep 2017 17:24:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:23 +0200
Message-Id: <1504286483-23327-21-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 01 Sep 2017 17:24:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 20/20] hw/arm/smmuv3: [not for upstream] Add
 caching-mode option
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	edgar.iglesias@gmail.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mICkSa2GJLwY

In VFIO use cases, the virtual smmu translates IOVA->IPA (stage 1)
whereas the physical SMMU translates IPA -> host PA (stage 2).

The 2 stages of the physical SMMU are currently not used.
Instead both stage 1 and stage2 mappings are combined together
and programmed in a single stage (S1) in the physical SMMU.

The drawback of this approach is each time the IOVA->IPA mapping
is changed by the guest, the host must be notified to re-program
the physical SMMU with the combined stages.

So we need to trap into the QEMU device each time the guest alters
the configuration or TLB data. Unfortunately the SMMU does not
expose any caching mode as the Intel IOMMU. On Intel, this caching
mode HW bit informs the OS that each time it updates the remapping
structures (even on map) it must invalidate the caches. Those
invalidate commands are used to notify the host that it must
recompute S1+S2 mappings and reprogram the HW.

As we don't have the HW bit on ARM, we currently rely on a
a FW quirk on guest smmuv3 driver side. When this FW quirk is
applied the driver performs TLB invalidations on map and
sends SMMU_CMD_TLBI_NH_VA_AM commands.

Those TLB invalidations are used to trap changes in the
translation tables.

We introduced a new implemented defined SMMU_CMD_TLBI_NH_VA_AM
command since it allows to inavlidate a whole range instead
of invalidating a single page (native SMMU_CMD_TLBI_NH_VA command).

As a consequence anybody wanting to use virtual smmuv3 in VFIO
use case must add
-device smmuv3,caching-mode
to the option line.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c          |  7 +++++++
 hw/arm/sysbus-fdt.c      | 11 ++++++++++-
 hw/arm/virt-acpi-build.c |  7 ++++++-
 include/hw/arm/smmuv3.h  |  1 +
 include/hw/arm/virt.h    |  1 +
 5 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 55dc80b..bb35e50 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1122,6 +1122,12 @@ static const VMStateDescription vmstate_smmuv3 = {
     },
 };
 
+static Property smmuv3_dev_properties[] = {
+    DEFINE_PROP_BOOL("caching-mode", SMMUV3State, cm, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+
 static void smmuv3_instance_init(Object *obj)
 {
     /* Nothing much to do here as of now */
@@ -1131,6 +1137,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->props   = smmuv3_dev_properties;
     dc->reset   = smmu_reset;
     dc->vmsd    = &vmstate_smmuv3;
     dc->realize = smmu_realize;
diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 4583acf..cfb40a4 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -440,6 +440,7 @@ static int add_smmuv3_fdt_node(SysBusDevice *sbdev, void *opaque)
     const char *parent_node = data->pbus_node_name;
     PlatformBusDevice *pbus = data->pbus;
     VirtMachineState *vms = data->vms;
+    SMMUV3State *smmu = SMMU_V3_DEV(sbdev);
     void *guest_fdt = data->fdt;
     char *nodename, *node_path;
     int i;
@@ -471,6 +472,10 @@ static int add_smmuv3_fdt_node(SysBusDevice *sbdev, void *opaque)
     qemu_fdt_setprop_string(guest_fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop(guest_fdt, nodename, "dma-coherent", NULL, 0);
 
+    if (smmu->cm) {
+        qemu_fdt_setprop(guest_fdt, nodename, "tlbi-on-map", NULL, 0);
+    }
+
     qemu_fdt_setprop_cell(guest_fdt, nodename, "#iommu-cells", 1);
 
     smmu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
@@ -487,7 +492,11 @@ static int add_smmuv3_fdt_node(SysBusDevice *sbdev, void *opaque)
     qemu_fdt_setprop_cells(guest_fdt, node_path, "iommu-map",
                      0x0, smmu_phandle, 0x0, 0x10000);
 
-    vms->smmu_info.type = VIRT_IOMMU_SMMUV3;
+    if (smmu->cm) {
+        vms->smmu_info.type = VIRT_IOMMU_SMMUV3_CACHING_MODE;
+    } else {
+        vms->smmu_info.type = VIRT_IOMMU_SMMUV3;
+    }
     vms->smmu_info.reg.base = data->base + mmio_base;
     vms->smmu_info.reg.size = 0x20000;
     vms->smmu_info.irq_base = irq_number;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8395898..cc10e79 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -426,7 +426,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     its->its_count = cpu_to_le32(1);
     its->identifiers[0] = 0; /* MADT translation_id */
 
-    if (vms->smmu_info.type == VIRT_IOMMU_SMMUV3) {
+    if (vms->smmu_info.type == VIRT_IOMMU_SMMUV3 ||
+        vms->smmu_info.type == VIRT_IOMMU_SMMUV3_CACHING_MODE) {
         int irq =  vms->smmu_info.irq_base;
 
         /* SMMUv3 node */
@@ -438,6 +439,10 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         smmu->type = ACPI_IORT_NODE_SMMU_V3;
         smmu->length = cpu_to_le16(node_size);
+
+        if (vms->smmu_info.type == VIRT_IOMMU_SMMUV3_CACHING_MODE) {
+            smmu->model = 0x3; /* ACPI_IORT_SMMU_V3_CACHING_MODE */
+        }
         smmu->mapping_count = cpu_to_le32(1);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->smmu_info.reg.base);
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index 0c8973d..16ae5c6 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -58,6 +58,7 @@ typedef struct SMMUV3State {
     qemu_irq     irq[4];
     SMMUQueue    cmdq, evtq;
 
+    bool cm; /* caching mode */
 } SMMUV3State;
 
 typedef enum {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index fd6f34f..7669a7c 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -90,6 +90,7 @@ typedef struct {
 typedef enum VirtIOMMUType {
     VIRT_IOMMU_NONE,
     VIRT_IOMMU_SMMUV3,
+    VIRT_IOMMU_SMMUV3_CACHING_MODE,
     VIRT_IOMMU_VIRTIO,
 } VirtIOMMUType;
 
-- 
2.5.5

