Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3109781wme;
        Sun, 13 May 2018 07:35:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo6nWz2AFL6c7Tco/Mm/NCkubVphGHHLgv/Ucb2tSyjE+CE0QiEAZlLeSOiV6QbMZVHLAhi
X-Received: by 2002:a37:7a44:: with SMTP id v65-v6mr4779021qkc.439.1526222147745;
        Sun, 13 May 2018 07:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222147; cv=none;
        d=google.com; s=arc-20160816;
        b=OYId2qaSlh46qH0bKKAmTPgKY1Z8TEEkX1WVcTbCqo+vB+9ZnNisZeFdYIwqwGZSNm
         MLbLLz4U36zQdmum829NLZEg3G5NgvWBdRtVOLuO2e6zZqPlmXBAwJMBgvuyKDTk+6le
         XKBGJ19cZZ9xcRhCLhbBZ86BFeAkMsFMQFK1dBwhfiGUJVvk3RYQY5rgUcfNLV/zzMTI
         jKa5Ie3TE1SD5xS6mtode00vmqg6Bsk5H5/v/Tkf5sePyLtwsjhCSblf7lVOwqI/s4s1
         ixDn3k0GfvVjPVCobB2fz1ckLaGyyvOa0rC+yxnonZigA0d+f/CfhSfeyuWy/+5nQRH3
         x5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tmR/px3obkYFTc3Wu2M0UEho3dVNKvaPzO5y9HDudxM=;
        b=Ac/YY2v2us1y9zt+R8zcFUDY2FzjQbUE1IHCxsDXD1bQajMKsxYeOT+Y6JjdK0uWsp
         zv870Q5SgYjO3oW5xqHjV1KE/mQDeUhd20dlWaisOeorVNs9G0gE3EtwG9a3DZG6g0xk
         jNsvz7+/fS5YP9Iud4RpS+kKsMQF/v1Ae4CbhMNmGtQxzv1Mz3vY5fcnhpmlYwn/pZYP
         as1va0Nabue9N7Es3HOwLWpf8vI+I11m5iMXKyzXSDuOHg+n1Zf8SFKkCqP8vO11yPT3
         6s2dfdX+pJLbQSOHyugiNGJdeo2KAoY5TKzWBbw1z8Y+KfheKKJ8gcY+waZLJY6aegnz
         UEHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a8-v6si436911qtb.175.2018.05.13.07.35.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHs6F-00083a-4S
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:35:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5z-0007zo-6B
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5x-0006OX-VQ
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52388 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fHs5x-0006OG-Qn; Sun, 13 May 2018 10:35:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6134A7D846;
	Sun, 13 May 2018 14:35:29 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFAA48445F;
	Sun, 13 May 2018 14:35:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sun, 13 May 2018 16:35:10 +0200
Message-Id: <1526222114-5324-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sun, 13 May 2018 14:35:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sun, 13 May 2018 14:35:29 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 3/7] hw/intc/arm_gicv3: Introduce
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
X-TUID: aDfrzqNl8opv

To prepare for multiple redistributor regions, we introduce
an array of uint32_t properties that stores the redistributor
count of each redistributor region.

Non accelerated VGICv3 only supports a single redistributor region.
The capacity of all redist regions is checked against the number of
vcpus.

Machvirt is updated to set the count to 123 vcpus for the unique
redistributor region we currently have.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c                      |  6 ++++++
 hw/intc/arm_gicv3.c                | 11 ++++++++++-
 hw/intc/arm_gicv3_common.c         | 35 ++++++++++++++++++++++++++++++-----
 hw/intc/arm_gicv3_kvm.c            |  9 +++++++--
 include/hw/intc/arm_gicv3_common.h |  6 ++++--
 5 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 11b9f59..c9d842d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -525,6 +525,12 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
     if (!kvm_irqchip_in_kernel()) {
         qdev_prop_set_bit(gicdev, "has-security-extensions", vms->secure);
     }
+
+    if (type == 3) {
+        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
+        qdev_prop_set_uint32(gicdev , "redist-region-count[0]",
+                             vms->memmap[VIRT_GIC_REDIST].size / 0x20000);
+    }
     qdev_init_nofail(gicdev);
     gicbusdev = SYS_BUS_DEVICE(gicdev);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 479c667..38d57ac 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -373,7 +373,16 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
+    if (s->nb_redist_regions != 1) {
+        error_setg(errp, "VGICv3 redist region number(%d) not equal to 1",
+                   s->nb_redist_regions);
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
index 7b54d52..f405ae1 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -169,9 +169,10 @@ static const VMStateDescription vmstate_gicv3 = {
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-                              const MemoryRegionOps *ops)
+                              const MemoryRegionOps *ops, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
+    int rdist_capacity = 0;
     int i;
 
     /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
@@ -199,11 +200,25 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
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
+                              ops ? &ops[1] : NULL, s,
+                              name, 0x20000 * s->redist_region_count[i]);
+        sysbus_init_mmio(sbd, &s->iomem_redist[i]);
+        rdist_capacity += s->redist_region_count[i];
+        g_free(name);
+    }
+    if (rdist_capacity < s->num_cpu) {
+        error_setg(errp, "Capacity of the redist regions(%d) "
+                   "is less than number of vcpus(%d)",
+                   rdist_capacity, s->num_cpu);
+    }
+
 }
 
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
@@ -285,6 +300,13 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
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
@@ -388,6 +410,8 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
+    DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
+                      redist_region_count, qdev_prop_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -409,6 +433,7 @@ static const TypeInfo arm_gicv3_common_type = {
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
index bccdfe1..538dcc5 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -210,7 +210,9 @@ struct GICv3State {
     /*< public >*/
 
     MemoryRegion iomem_dist; /* Distributor */
-    MemoryRegion iomem_redist; /* Redistributors */
+    MemoryRegion *iomem_redist; /* Redistributor Regions */
+    uint32_t *redist_region_count; /* redistributor count within each region */
+    uint32_t nb_redist_regions; /* number of redist regions */
 
     uint32_t num_cpu;
     uint32_t num_irq;
@@ -291,6 +293,6 @@ typedef struct ARMGICv3CommonClass {
 } ARMGICv3CommonClass;
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-                              const MemoryRegionOps *ops);
+                              const MemoryRegionOps *ops, Error **errp);
 
 #endif
-- 
2.5.5

