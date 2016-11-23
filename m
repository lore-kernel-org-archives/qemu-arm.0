Received: by 10.25.150.194 with SMTP id y185csp2540004lfd;
        Wed, 23 Nov 2016 04:40:15 -0800 (PST)
X-Received: by 10.55.150.193 with SMTP id y184mr2743517qkd.296.1479904815650;
        Wed, 23 Nov 2016 04:40:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y22si11862610qta.210.2016.11.23.04.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 04:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9WqU-000848-Gp
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 07:40:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c9WqP-0007zf-5e
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 07:40:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c9WqL-0005HM-3y
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 07:40:09 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34503)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1c9WqK-0005H7-Pe; Wed, 23 Nov 2016 07:40:05 -0500
Received: by mail-pf0-x243.google.com with SMTP id y68so685491pfb.1;
	Wed, 23 Nov 2016 04:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YDLDqGAKPmvIF1La3T+tmZsZkk5Cqw9bNcK7glpJuIU=;
	b=Ybisxv8QEh7BJlStc/lUn5aE+oPiIJblLRLHChOrZky9bTgavGm1k7tDq3OwWOFHMx
	D/YejI8D5lG9VeI2ns6BU6ZeXAh9k2r9SqRVwrG993vcNb2K7sXuTqaw/nMEUz9WrO1A
	T5bjZAW4CFVF/mRoy17HeuG7DvuYIOFtnLBdYYdQ1eevQl70vOcK/yVuOExh3vMrUQDt
	R6EjXV9LyA26s9Xh1gWVUqA2qF+OwTiIO6LFiUmdBEnbDOE49UIP02bSgkjcX0IeGc0T
	+oUsQSOSNPSKXJTvCPPrXjqNwwKaP++fsvykKSFzgWBwXUJppo7hMI482oMnujCoaaS5
	hV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YDLDqGAKPmvIF1La3T+tmZsZkk5Cqw9bNcK7glpJuIU=;
	b=GMt+HBr+/TveRAdOEcq9JKWikuLLb/2Sr7BUH/RQLrTQcfRTQAqbXW0BeR1btxCYUr
	hvaqfjkw3pbHpgj/YwO7dPtxCHzzvgihHWm6qatKEJRwUSczR1T9m4wqcoBZjaTc782d
	LmtMF37uyWa2VYPznBrdMpCtyVkGADg34FHplfkeMW4dfvku6+gRb+ciELu6FO0fHw2m
	Ata3fUGnG7IJfsS/hjnRXrXxgcghh+dzpGJWihZaB2+SWdamlMsAzqjh0kvTUf0qVhtw
	dQ/i2NLEcV5zVhpNsC5pxvZQvuWuny5EK/ahfpWZl06XKEB5Z/+ZkvxTyHY8Da4hZ0QH
	2hYA==
X-Gm-Message-State: AKaTC03fIY39XHVBzPzzsIKZL+nnGndM1ST49nKSHmeLkrTF/4Wujd9dBjqJMA49gJQ9Ng==
X-Received: by 10.84.128.195 with SMTP id a61mr6200380pla.55.1479904803517;
	Wed, 23 Nov 2016 04:40:03 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	s65sm34818356pgb.25.2016.11.23.04.40.00
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Nov 2016 04:40:03 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed, 23 Nov 2016 18:09:24 +0530
Message-Id: <1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v6 4/4] hw/intc/arm_gicv3_kvm: Reset GICv3 cpu
 interface registers
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
Cc: vijay.kilari@gmail.com, marc.zyngier@arm.com, p.fedin@samsung.com,
	qemu-devel@nongnu.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vLwV8nJ95Vda

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Reset CPU interface registers of GICv3 when CPU is reset.
For this, object interface is used, which is called from
arm_cpu_reset function.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_kvm.c        | 37 +++++++++++++++++++++++++++++++++++++
 include/hw/arm/linux-boot-if.h | 28 ++++++++++++++++++++++++++++
 target-arm/cpu.c               | 31 +++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 77af32d..267c2d6 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -29,6 +29,7 @@
 #include "gicv3_internal.h"
 #include "vgic_common.h"
 #include "migration/migration.h"
+#include "hw/arm/linux-boot-if.h"
 
 #ifdef DEBUG_GICV3_KVM
 #define DPRINTF(fmt, ...) \
@@ -604,6 +605,36 @@ static void kvm_arm_gicv3_get(GICv3State *s)
     }
 }
 
+static void  arm_gicv3_reset_cpuif(ARMDeviceResetIf *obj,
+                                      unsigned int cpu_num)
+{
+    GICv3CPUState *c;
+    GICv3State *s = ARM_GICV3_COMMON(obj);
+
+    if (!s && !s->cpu) {
+        return;
+    }
+
+    c = &s->cpu[cpu_num];
+    if (!c) {
+        return;
+    }
+
+    /* Initialize to actual HW supported configuration */
+    kvm_gicc_access(s, ICC_CTLR_EL1, cpu_num,
+                    &c->icc_ctlr_el1[GICV3_NS], false);
+
+    c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
+    c->icc_pmr_el1 = 0;
+    c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
+    c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
+    c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
+
+    c->icc_sre_el1 = 0x7;
+    memset(c->icc_apr, 0, sizeof(c->icc_apr));
+    memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
+}
+
 static void kvm_arm_gicv3_reset(DeviceState *dev)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
@@ -688,6 +719,7 @@ static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ARMGICv3CommonClass *agcc = ARM_GICV3_COMMON_CLASS(klass);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_CLASS(klass);
+    ARMDeviceResetIfClass *adrifc = ARM_DEVICE_RESET_IF_CLASS(klass);
 
     agcc->pre_save = kvm_arm_gicv3_get;
     agcc->post_load = kvm_arm_gicv3_put;
@@ -695,6 +727,7 @@ static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
     kgc->parent_reset = dc->reset;
     dc->realize = kvm_arm_gicv3_realize;
     dc->reset = kvm_arm_gicv3_reset;
+    adrifc->arm_device_reset = arm_gicv3_reset_cpuif;
 }
 
 static const TypeInfo kvm_arm_gicv3_info = {
@@ -703,6 +736,10 @@ static const TypeInfo kvm_arm_gicv3_info = {
     .instance_size = sizeof(GICv3State),
     .class_init = kvm_arm_gicv3_class_init,
     .class_size = sizeof(KVMARMGICv3Class),
+    .interfaces = (InterfaceInfo []) {
+        { TYPE_ARM_DEVICE_RESET_IF },
+        { },
+    },
 };
 
 static void kvm_arm_gicv3_register_types(void)
diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boot-if.h
index aba4479..4a8affd 100644
--- a/include/hw/arm/linux-boot-if.h
+++ b/include/hw/arm/linux-boot-if.h
@@ -40,4 +40,32 @@ typedef struct ARMLinuxBootIfClass {
     void (*arm_linux_init)(ARMLinuxBootIf *obj, bool secure_boot);
 } ARMLinuxBootIfClass;
 
+#define TYPE_ARM_DEVICE_RESET_IF "arm-device-reset-if"
+#define ARM_DEVICE_RESET_IF_CLASS(klass) \
+    OBJECT_CLASS_CHECK(ARMDeviceResetIfClass, (klass), TYPE_ARM_DEVICE_RESET_IF)
+#define ARM_DEVICE_RESET_IF_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(ARMDeviceResetIfClass, (obj), TYPE_ARM_DEVICE_RESET_IF)
+#define ARM_DEVICE_RESET_IF(obj) \
+    INTERFACE_CHECK(ARMDeviceResetIf, (obj), TYPE_ARM_DEVICE_RESET_IF)
+
+typedef struct ARMDeviceResetIf {
+    /*< private >*/
+    Object parent_obj;
+} ARMDeviceResetIf;
+
+typedef struct ARMDeviceResetIfClass {
+    /*< private >*/
+    InterfaceClass parent_class;
+
+    /*< public >*/
+    /** arm_device_reset: Reset the device when cpu is reset is
+     * called. Some device registers like GICv3 cpu interface registers
+     * required to be reset when CPU is reset instead of GICv3 device
+     * reset. This callback is called when arm_cpu_reset is called.
+     *
+     * @obj: the object implementing this interface
+     * @cpu_num: CPU number being reset
+     */
+    void (*arm_device_reset)(ARMDeviceResetIf *obj, unsigned int cpu_num);
+} ARMDeviceResetIfClass;
 #endif
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 99f0dbe..44806be 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -30,6 +30,7 @@
 #include "hw/loader.h"
 #endif
 #include "hw/arm/arm.h"
+#include "hw/arm/linux-boot-if.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
@@ -113,6 +114,21 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
     assert(oldvalue == newvalue);
 }
 
+static int do_arm_device_reset(Object *obj, void *opaque)
+{
+    if (object_dynamic_cast(obj, TYPE_ARM_DEVICE_RESET_IF)) {
+        ARMDeviceResetIf *adrif = ARM_DEVICE_RESET_IF(obj);
+        ARMDeviceResetIfClass *adrifc = ARM_DEVICE_RESET_IF_GET_CLASS(obj);
+        CPUState *cpu = opaque;
+
+        if (adrifc->arm_device_reset) {
+            adrifc->arm_device_reset(adrif, cpu->cpu_index);
+        }
+    }
+    return 0;
+}
+
+
 /* CPUClass::reset() */
 static void arm_cpu_reset(CPUState *s)
 {
@@ -228,6 +244,8 @@ static void arm_cpu_reset(CPUState *s)
                               &env->vfp.standard_fp_status);
     tlb_flush(s, 1);
 
+    object_child_foreach_recursive(object_get_root(),
+                                   do_arm_device_reset, s);
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
@@ -1595,6 +1613,19 @@ static void cpu_register(const ARMCPUInfo *info)
     g_free((void *)type_info.name);
 }
 
+static const TypeInfo arm_device_reset_if_info = {
+    .name = TYPE_ARM_DEVICE_RESET_IF,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(ARMDeviceResetIfClass),
+};
+
+static void arm_device_reset_register_types(void)
+{
+    type_register_static(&arm_device_reset_if_info);
+}
+
+type_init(arm_device_reset_register_types)
+
 static const TypeInfo arm_cpu_type_info = {
     .name = TYPE_ARM_CPU,
     .parent = TYPE_CPU,
-- 
1.9.1

