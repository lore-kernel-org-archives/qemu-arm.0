Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4644090wre;
        Wed, 30 May 2018 04:48:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIRRVuEtInlxhty3/mWQUPzW3NBEtCbwv0Tynf0wUaK72B64+5s8XU4YEKal2BMtEPyIYzJ
X-Received: by 2002:ac8:2c8b:: with SMTP id 11-v6mr1993707qtw.160.1527680888039;
        Wed, 30 May 2018 04:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527680888; cv=none;
        d=google.com; s=arc-20160816;
        b=KVMlKdXa47Ipdpib3naFpiX34g6+S+5gnqfevJCxSzbijiWQ7DFWOx5jsJUBTqPpsY
         XKuD5jpQguwKpbuLNTCz6dMW+CtrCdmMHOH5PuhxtnpFuWDEvx0uEqcZ2JwfZDfWSx+1
         tezev5hWd1WlvHUMbfMfjx5fdTviAXfI5Xm0ebEA7cKAYMUZ72RNbq4mQbFT9lC9hNBi
         13mj3/sDH8kEoc4D+RvoBDcXN0wQMfT/mjkFTGYuwAjJFxrpMe0jxLpivMJYt1Zswk17
         1zDH4ykavzpW8aKtduR0tOF+XOR6ICjlN991Yvhh60dke8bgB53taqIvUgrHW6mlVCej
         5mkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6wVCtE9vphnsBGbHAxsNgcokzKzGjt6yQR0n0tZF6Uw=;
        b=dqXvV5QHLKrRgmnJ2HqwIhiIoVlD8WIZS8NifL/ac6rt6MCC25C+PvTKzElL2VuBB8
         KAyrHDqgU35kwjU4BlTela1j3KQvWr3+WJVpMCSS/cckCWdTfmWW7xRr2Jhy8XncJC1z
         GWaKmcVH3ujdkWIbYilYeWCgc34PouOy5IWR4S5G1geGpaQG0GT54YKmFc9ERUnX9Hxm
         k1NVehXoIhUEyNF+RlkJXRPzME7JOGmX+v+HauQaLgUdR2AUKtuHszkk4hNvrmKZzNHt
         dYBtydmJ44tFndPVUjdD7ogF7rMospm+51Tn23X4/jhvecWG2GaUw5mfEviA8KboWg/8
         E11Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c21-v6si4516732qkm.197.2018.05.30.04.48.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 04:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNzaJ-0006ME-F5
	for alex.bennee@linaro.org; Wed, 30 May 2018 07:48:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYH-0004m9-QN
	for qemu-arm@nongnu.org; Wed, 30 May 2018 07:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYG-00059J-F0
	for qemu-arm@nongnu.org; Wed, 30 May 2018 07:46:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48416 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNzYG-000595-AJ; Wed, 30 May 2018 07:46:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB8058163AD4;
	Wed, 30 May 2018 11:45:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3948A10EE95B;
	Wed, 30 May 2018 11:45:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 13:45:36 +0200
Message-Id: <1527680741-2725-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
References: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 11:45:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 11:45:59 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 3/8] hw/intc/arm_gicv3: Introduce
 redist-region-count array property
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qFDDKrmoAkui

To prepare for multiple redistributor regions, we introduce
an array of uint32_t properties that stores the redistributor
count of each redistributor region.

Non accelerated VGICv3 only supports a single redistributor region.
The capacity of all redist regions is checked against the number of
vcpus.

Machvirt is updated to set those properties, ie. a single
redistributor region with count set to the number of vcpus
capped by 123.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v2 -> v3:
- add missing return in arm_gic_realize
- in gicv3_init_irqs_and_mmio, compute/check rdist_capacity first
- rdist region 0 size set to MIN(smp_cpus, redist0_capacity)
- add GICV3_REDIST_SIZE
---
 hw/arm/virt.c                      | 11 ++++++++++-
 hw/intc/arm_gicv3.c                | 12 +++++++++++-
 hw/intc/arm_gicv3_common.c         | 38 +++++++++++++++++++++++++++++++++-----
 hw/intc/arm_gicv3_kvm.c            |  9 +++++++--
 include/hw/intc/arm_gicv3_common.h |  8 ++++++--
 5 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a3a28e2..ed79460 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -523,6 +523,15 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
     if (!kvm_irqchip_in_kernel()) {
         qdev_prop_set_bit(gicdev, "has-security-extensions", vms->secure);
     }
+
+    if (type == 3) {
+        uint32_t redist0_capacity =
+                    vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+        uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
+
+        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
+        qdev_prop_set_uint32(gicdev, "redist-region-count[0]", redist0_count);
+    }
     qdev_init_nofail(gicdev);
     gicbusdev = SYS_BUS_DEVICE(gicdev);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
@@ -1322,7 +1331,7 @@ static void machvirt_init(MachineState *machine)
      * many redistributors we can fit into the memory map.
      */
     if (vms->gic_version == 3) {
-        virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
+        virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
     } else {
         virt_max_cpus = GIC_NCPU;
     }
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 479c667..7044133 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -373,7 +373,17 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
+    if (s->nb_redist_regions != 1) {
+        error_setg(errp, "VGICv3 redist region number(%d) not equal to 1",
+                   s->nb_redist_regions);
+        return;
+    }
+
+    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     gicv3_init_cpuif(s);
 }
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 7b54d52..4c89e7d 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -169,11 +169,22 @@ static const VMStateDescription vmstate_gicv3 = {
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-                              const MemoryRegionOps *ops)
+                              const MemoryRegionOps *ops, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
+    int rdist_capacity = 0;
     int i;
 
+    for (i = 0; i < s->nb_redist_regions; i++) {
+        rdist_capacity += s->redist_region_count[i];
+    }
+    if (rdist_capacity < s->num_cpu) {
+        error_setg(errp, "Capacity of the redist regions(%d) "
+                   "is less than number of vcpus(%d)",
+                   rdist_capacity, s->num_cpu);
+        return;
+    }
+
     /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
      * GPIO array layout is thus:
      *  [0..N-1] spi
@@ -199,11 +210,18 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
     memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
                           "gicv3_dist", 0x10000);
-    memory_region_init_io(&s->iomem_redist, OBJECT(s), ops ? &ops[1] : NULL, s,
-                          "gicv3_redist", 0x20000 * s->num_cpu);
-
     sysbus_init_mmio(sbd, &s->iomem_dist);
-    sysbus_init_mmio(sbd, &s->iomem_redist);
+
+    s->iomem_redist = g_new0(MemoryRegion, s->nb_redist_regions);
+    for (i = 0; i < s->nb_redist_regions; i++) {
+        char *name = g_strdup_printf("gicv3_redist_region[%d]", i);
+
+        memory_region_init_io(&s->iomem_redist[i], OBJECT(s),
+                              ops ? &ops[1] : NULL, s, name,
+                              s->redist_region_count[i] * GICV3_REDIST_SIZE);
+        sysbus_init_mmio(sbd, &s->iomem_redist[i]);
+        g_free(name);
+    }
 }
 
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
@@ -285,6 +303,13 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void arm_gicv3_finalize(Object *obj)
+{
+    GICv3State *s = ARM_GICV3_COMMON(obj);
+
+    g_free(s->redist_region_count);
+}
+
 static void arm_gicv3_common_reset(DeviceState *dev)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
@@ -388,6 +413,8 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
+    DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
+                      redist_region_count, qdev_prop_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -409,6 +436,7 @@ static const TypeInfo arm_gicv3_common_type = {
     .instance_size = sizeof(GICv3State),
     .class_size = sizeof(ARMGICv3CommonClass),
     .class_init = arm_gicv3_common_class_init,
+    .instance_finalize = arm_gicv3_finalize,
     .abstract = true,
     .interfaces = (InterfaceInfo []) {
         { TYPE_ARM_LINUX_BOOT_IF },
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 93ac293..7e76b87 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -731,7 +731,11 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
+    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     for (i = 0; i < s->num_cpu; i++) {
         ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
@@ -755,7 +759,8 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
     kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
-    kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
+    kvm_arm_register_device(&s->iomem_redist[0], -1,
+                            KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
 
     if (kvm_has_gsi_routing()) {
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index bccdfe1..31971d7 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -35,6 +35,8 @@
 #define GICV3_MAXIRQ 1020
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
+#define GICV3_REDIST_SIZE 0x20000
+
 /* Number of SGI target-list bits */
 #define GICV3_TARGETLIST_BITS 16
 
@@ -210,7 +212,9 @@ struct GICv3State {
     /*< public >*/
 
     MemoryRegion iomem_dist; /* Distributor */
-    MemoryRegion iomem_redist; /* Redistributors */
+    MemoryRegion *iomem_redist; /* Redistributor Regions */
+    uint32_t *redist_region_count; /* redistributor count within each region */
+    uint32_t nb_redist_regions; /* number of redist regions */
 
     uint32_t num_cpu;
     uint32_t num_irq;
@@ -291,6 +295,6 @@ typedef struct ARMGICv3CommonClass {
 } ARMGICv3CommonClass;
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-                              const MemoryRegionOps *ops);
+                              const MemoryRegionOps *ops, Error **errp);
 
 #endif
-- 
2.5.5

