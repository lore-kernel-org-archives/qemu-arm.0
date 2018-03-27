Received: by 10.28.71.155 with SMTP id m27csp732933wmi;
        Tue, 27 Mar 2018 07:20:43 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtYZW+vYQJEqMnPLjv9zIbvIcM991jrohv0HWsDDpT4LEPLcTCJAOKcgRBHxK7OJYzJGZvt
X-Received: by 10.237.41.129 with SMTP id o1mr63449766qtd.202.1522160443698;
        Tue, 27 Mar 2018 07:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160443; cv=none;
        d=google.com; s=arc-20160816;
        b=kLsU31hSXa9/6GUGP8lw1kwTckf8FaD7j2gwxffOEiGWnNze/BZ/l5X4P3UUze/aTr
         hHlDgy7bb95szfd0qOKIGXljCIeIzqNn3ENVbB3r5E4jFxpYsEQ9SiPI2//myQfvq2pz
         QBkvQY/RhMX89YvW504tXBJ4fRJe3Xibch0o8RWPBCr6l8hMj+qJkFdLtLT2r+rW/fzx
         gzAG9tj8ll96dS8wGo0YEwSB1MtJ+juSsuT2Jktr5jHLY0xXzVa6MZqWt2FDQqaxIJQX
         gTh8TXwUd8T4278JZg41ibV2+5W/TWFzKQGrl8iFOR6NKLgi5H18KtEGC/jOfHupjsQO
         dPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=x8DCIBnu5SolsPzvODJ4cJao65VNG+HZISDGyzLOl7A=;
        b=Im2lIvrOWmFhTHzSuxt/s+w7RWZGms6NHNMwkmsPJ1FNFOMIVSbQhSW/efzxMq22J3
         5y7Z9wEPo1mDHT39KGKrRhozQAbotbQC3ZeXUPoaio0L5iyUmpz883WeY5xc8+jBOGiP
         oGDcFvVaWkg/zNac0MvImTjqHlsuz3lq7Yvr628u4FqBvgZFp39sgskMq/QeTwcP3ypa
         ZSBu4XHgP/4+Xe184Dq3s0df6JtapkmzDNNKfONjHWbQCM31UzPdf9yssx5ywZ5g5Jwe
         en/nHuHNKaXkk1EiAzw1l2W8kXJHAKnSKYnnFXNg+okFJ/OMuoetn/JWtES9ljM2jrdu
         /Oqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g36si1531362qtd.54.2018.03.27.07.20.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pSt-0000GT-4Y
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:20:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOO-0003JW-Vj
	for qemu-devel@nongnu.org; Tue, 27 Mar 2018 10:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOI-0006ka-Pg
	for qemu-devel@nongnu.org; Tue, 27 Mar 2018 10:16:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60758 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pO5-0006Ut-MM; Tue, 27 Mar 2018 10:15:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 031084068026;
	Tue, 27 Mar 2018 14:15:45 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A5FA6F9E4;
	Tue, 27 Mar 2018 14:15:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:18 +0200
Message-Id: <1522160122-10744-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 27 Mar 2018 14:15:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 27 Mar 2018 14:15:45 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 4/8] hw/intc/arm_gicv3: Implement
 register_redist_region API
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
Cc: wei@redhat.com, marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QDSgdg8BQaxB

This patch defines and implements the register_redist_region() API
for both arm_gicv3 and arm_gicv3_kvm. Virt machine now directly calls
the function to set the single redistributor region. The associated
memory region init is removed from gicv3_init_irqs_and_mmio.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c                      |  6 +++++-
 hw/intc/arm_gicv3.c                | 21 +++++++++++++++++++++
 hw/intc/arm_gicv3_common.c         | 10 ++++++----
 hw/intc/arm_gicv3_kvm.c            | 38 +++++++++++++++++++++++++++++++++++---
 include/hw/intc/arm_gicv3_common.h |  5 +++--
 5 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 94dcb12..0eef6aa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -526,7 +526,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
     gicbusdev = SYS_BUS_DEVICE(gicdev);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
     if (type == 3) {
-        sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
+        ARMGICv3CommonClass *agcc = ARM_GICV3_COMMON_GET_CLASS(gicdev);
+
+        agcc->register_redist_region((GICv3State *)gicdev,
+                                 vms->memmap[VIRT_GIC_REDIST].base,
+                                 vms->memmap[VIRT_GIC_REDIST].size >> 17);
     } else {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
     }
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 479c667..37f7564 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -378,6 +378,26 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
     gicv3_init_cpuif(s);
 }
 
+static int arm_gicv3_register_redist_region(GICv3State *s, hwaddr base,
+                                            uint32_t count)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
+
+    if (s->nb_redist_regions > 0) {
+        return -EINVAL;
+    }
+
+    s->redist_region[s->nb_redist_regions].base = base;
+    s->redist_region[s->nb_redist_regions].count = count;
+    memory_region_init_io(&s->redist_region[s->nb_redist_regions].mr, OBJECT(s),
+                          gic_ops, s, "gicv3_redist", 0x20000 * count);
+    sysbus_init_mmio(sbd, &s->redist_region[s->nb_redist_regions].mr);
+    sysbus_mmio_map(sbd, 1, base);
+    s->nb_redist_regions++;
+
+    return 0;
+}
+
 static void arm_gicv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -385,6 +405,7 @@ static void arm_gicv3_class_init(ObjectClass *klass, void *data)
     ARMGICv3Class *agc = ARM_GICV3_CLASS(klass);
 
     agcc->post_load = arm_gicv3_post_load;
+    agcc->register_redist_region = arm_gicv3_register_redist_region;
     device_class_set_parent_realize(dc, arm_gic_realize, &agc->parent_realize);
 }
 
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index cb4ee0e..c662e06 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -199,12 +199,8 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
     memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
                           "gicv3_dist", 0x10000);
-    memory_region_init_io(&s->redist_region[0].mr, OBJECT(s),
-                          ops ? &ops[1] : NULL, s,
-                          "gicv3_redist", 0x20000 * s->num_cpu);
 
     sysbus_init_mmio(sbd, &s->iomem_dist);
-    sysbus_init_mmio(sbd, &s->redist_region[0].mr);
 }
 
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
@@ -384,6 +380,12 @@ static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
     }
 }
 
+static inline
+bool arm_gicv3_common_support_multiple_redist_regions(GICv3State *s)
+{
+    return s->support_multiple_redist_regions;
+}
+
 static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index a07bc55..b6a3faf 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -755,9 +755,6 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
     kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd);
-    kvm_arm_register_device(&s->redist_region[0].mr, -1,
-                            KVM_DEV_ARM_VGIC_GRP_ADDR,
-                            KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
 
     if (kvm_has_gsi_routing()) {
         /* set up irq routing */
@@ -788,6 +785,40 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static int kvm_arm_gicv3_register_redist_region(GICv3State *s, hwaddr base,
+                                                uint32_t count)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
+    int n = s->nb_redist_regions;
+    char *name;
+
+    if (!s->dev_fd) {
+        return -ENODEV;
+    }
+
+    if (n > 0) {
+        return -EINVAL;
+    }
+
+    name = g_strdup_printf("gicv3_redist_region[%d]", n);
+
+    s->redist_region[n].base = base;
+    s->redist_region[n].count = count;
+    memory_region_init_io(&s->redist_region[n].mr, OBJECT(s),
+                          NULL, s, name, count * 0x20000);
+    sysbus_init_mmio(sbd, &s->redist_region[n].mr);
+
+    kvm_arm_register_device(&s->redist_region[n].mr, -1,
+                            KVM_DEV_ARM_VGIC_GRP_ADDR,
+                            KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
+
+    sysbus_mmio_map(sbd, n + 1, base); /* first region is DIST */
+
+    s->nb_redist_regions++;
+    g_free(name);
+    return 0;
+}
+
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -796,6 +827,7 @@ static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
 
     agcc->pre_save = kvm_arm_gicv3_get;
     agcc->post_load = kvm_arm_gicv3_put;
+    agcc->register_redist_region = kvm_arm_gicv3_register_redist_region;
     device_class_set_parent_realize(dc, kvm_arm_gicv3_realize,
                                     &kgc->parent_realize);
     device_class_set_parent_reset(dc, kvm_arm_gicv3_reset, &kgc->parent_reset);
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 3cf132f..549ccc3 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -220,6 +220,7 @@ struct GICv3State {
     MemoryRegion iomem_dist; /* Distributor */
     GICv3RDISTRegion redist_region[GICV3_MAX_RDIST_REGIONS];
     uint32_t nb_redist_regions;
+    bool support_multiple_redist_regions;
 
     uint32_t num_cpu;
     uint32_t num_irq;
@@ -297,8 +298,8 @@ typedef struct ARMGICv3CommonClass {
 
     void (*pre_save)(GICv3State *s);
     void (*post_load)(GICv3State *s);
-    /* register an RDIST region at @base, containing @pfns 64kB pages */
-    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t pfns);
+    /* register an RDIST region at @base, containing @count redistributors */
+    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t count);
 } ARMGICv3CommonClass;
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-- 
2.5.5

