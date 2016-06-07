Received: by 10.25.27.66 with SMTP id b63csp1783399lfb;
        Mon, 6 Jun 2016 19:49:20 -0700 (PDT)
X-Received: by 10.55.40.155 with SMTP id o27mr18914510qko.165.1465267760820;
        Mon, 06 Jun 2016 19:49:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 86si12805283qkq.217.2016.06.06.19.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 19:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bA74y-0005cd-6C
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 22:49:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA731-0004MD-L7
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 22:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA72x-0003aY-Kc
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 22:47:19 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:14296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bA72w-0003XW-LY; Mon, 06 Jun 2016 22:47:15 -0400
Received: from 172.24.1.137 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CCU77800; Tue, 07 Jun 2016 10:46:42 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.235.1; Tue, 7 Jun 2016 10:46:32 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2016 10:46:16 +0800
Message-ID: <1465267577-1808-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
References: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.57563595.0132, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 05da7307167b66222075530ebccd18a4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-devel] [PATCH v5 2/3] hw/arm/virt: Add PMU node for virt
 machine
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3AO28vDCuHX6

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a virtual PMU device for virt machine while use PPI 7 for PMU
overflow interrupt number.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c         | 33 +++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  4 ++++
 target-arm/kvm32.c    |  6 ++++++
 target-arm/kvm64.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 target-arm/kvm_arm.h  |  7 +++++++
 5 files changed, 91 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8e46137..f5ffe65 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -436,6 +436,37 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
     qemu_fdt_setprop_cell(vbi->fdt, "/intc", "phandle", vbi->gic_phandle);
 }
 
+static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
+{
+    CPUState *cpu;
+    ARMCPU *armcpu;
+    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
+
+    CPU_FOREACH(cpu) {
+        armcpu = ARM_CPU(cpu);
+        if (!armcpu->has_pmu ||
+            !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
+            return;
+        }
+    }
+
+    if (gictype == 2) {
+        irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
+                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
+                             (1 << vbi->smp_cpus) - 1);
+    }
+
+    armcpu = ARM_CPU(qemu_get_cpu(0));
+    qemu_fdt_add_subnode(vbi->fdt, "/pmu");
+    if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
+        const char compat[] = "arm,armv8-pmuv3";
+        qemu_fdt_setprop(vbi->fdt, "/pmu", "compatible",
+                         compat, sizeof(compat));
+        qemu_fdt_setprop_cells(vbi->fdt, "/pmu", "interrupts",
+                               GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_PMU_IRQ, irqflags);
+    }
+}
+
 static void create_v2m(VirtBoardInfo *vbi, qemu_irq *pic)
 {
     int i;
@@ -1259,6 +1290,8 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vbi, pic, gic_version, vms->secure);
 
+    fdt_add_pmu_nodes(vbi, gic_version);
+
     create_uart(vbi, pic, VIRT_UART, sysmem);
 
     if (vms->secure) {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 82703d2..9650193 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -41,6 +41,10 @@
 #define ARCH_TIMER_NS_EL1_IRQ 14
 #define ARCH_TIMER_NS_EL2_IRQ 10
 
+#define VIRTUAL_PMU_IRQ 7
+
+#define PPI(irq) ((irq) + 16)
+
 enum {
     VIRT_FLASH,
     VIRT_MEM,
diff --git a/target-arm/kvm32.c b/target-arm/kvm32.c
index c03e3e5..c35c676 100644
--- a/target-arm/kvm32.c
+++ b/target-arm/kvm32.c
@@ -522,3 +522,9 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
 {
     return false;
 }
+
+int kvm_arm_pmu_create(CPUState *cs, int irq)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
+    return 0;
+}
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 75383c8..2d6a310 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -382,6 +382,47 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
     return NULL;
 }
 
+static bool kvm_arm_pmu_support_ctrl(CPUState *cs, struct kvm_device_attr *attr)
+{
+    return kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr) == 0;
+}
+
+int kvm_arm_pmu_create(CPUState *cs, int irq)
+{
+    int err;
+
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
+        .addr = (intptr_t)&irq,
+        .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
+        .flags = 0,
+    };
+
+    if (!kvm_arm_pmu_support_ctrl(cs, &attr)) {
+        return 0;
+    }
+
+    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, &attr);
+    if (err < 0) {
+        fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
+                strerror(-err));
+        abort();
+    }
+
+    attr.group = KVM_ARM_VCPU_PMU_V3_CTRL;
+    attr.attr = KVM_ARM_VCPU_PMU_V3_INIT;
+    attr.addr = 0;
+    attr.flags = 0;
+
+    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, &attr);
+    if (err < 0) {
+        fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
+                strerror(-err));
+        abort();
+    }
+
+    return 1;
+}
 
 static inline void set_feature(uint64_t *features, int feature)
 {
diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
index 345233c..a419368 100644
--- a/target-arm/kvm_arm.h
+++ b/target-arm/kvm_arm.h
@@ -194,6 +194,8 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
 
 int kvm_arm_vgic_probe(void);
 
+int kvm_arm_pmu_create(CPUState *cs, int irq);
+
 #else
 
 static inline int kvm_arm_vgic_probe(void)
@@ -201,6 +203,11 @@ static inline int kvm_arm_vgic_probe(void)
     return 0;
 }
 
+static inline int kvm_arm_pmu_create(CPUState *cs, int irq)
+{
+    return 0;
+}
+
 #endif
 
 static inline const char *gic_class_name(void)
-- 
2.0.4


