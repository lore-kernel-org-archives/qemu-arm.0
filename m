Received: by 10.25.208.194 with SMTP id h185csp746807lfg;
        Mon, 25 Apr 2016 00:13:11 -0700 (PDT)
X-Received: by 10.140.137.71 with SMTP id 68mr34410407qhj.82.1461568391138;
        Mon, 25 Apr 2016 00:13:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16si9969029qhc.88.2016.04.25.00.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 00:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auahh-0008IS-A6
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 03:13:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auahe-0008DR-9I
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 03:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auaha-0008U4-5Y
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 03:13:06 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:54846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1auahR-0008S4-7a; Mon, 25 Apr 2016 03:12:53 -0400
Received: from 172.24.1.47 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFY19825; Mon, 25 Apr 2016 15:12:32 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 25 Apr 2016 15:12:21 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2016 15:11:45 +0800
Message-ID: <1461568306-14624-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.571DC361.0061, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7abc92cbece194ef24b54c4a8fe58dae
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-arm] [PATCH v3 2/3] hw/arm/virt: Add PMU node for virt machine
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
Cc: drjones@redhat.com, shannon.zhao@linaro.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uyh3PyD63nyb

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a virtual PMU device for virt machine while use PPI 7 for PMU
overflow interrupt number.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  4 ++++
 include/sysemu/kvm.h  |  1 +
 stubs/kvm.c           |  5 +++++
 target-arm/kvm64.c    | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 83 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 56d35c7..c3632d8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -428,6 +428,38 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
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
+        if (!armcpu->has_pmu) {
+            return;
+        }
+
+        kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ));
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
@@ -1246,6 +1278,8 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vbi, pic, gic_version, vms->secure);
 
+    fdt_add_pmu_nodes(vbi, gic_version);
+
     create_uart(vbi, pic, VIRT_UART, sysmem);
 
     if (vms->secure) {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ecd8589..b50f095 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -40,6 +40,10 @@
 #define ARCH_TIMER_NS_EL1_IRQ 14
 #define ARCH_TIMER_NS_EL2_IRQ 10
 
+#define VIRTUAL_PMU_IRQ 7
+
+#define PPI(irq) ((irq) + 16)
+
 enum {
     VIRT_FLASH,
     VIRT_MEM,
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 0e18f15..90c2c54 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -523,4 +523,5 @@ int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source);
  * Returns: 0 on success, or a negative errno on failure.
  */
 int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target);
+void kvm_arm_pmu_create(CPUState *cs, int irq);
 #endif
diff --git a/stubs/kvm.c b/stubs/kvm.c
index ddd6204..58a348a 100644
--- a/stubs/kvm.c
+++ b/stubs/kvm.c
@@ -6,3 +6,8 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
 {
     return 0;
 }
+
+void kvm_arm_pmu_create(CPUState *cs, int irq)
+{
+    return;
+}
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index b364789..22fe2a3 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -382,6 +382,45 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
     return NULL;
 }
 
+static bool kvm_arm_pmu_support_ctrl(CPUState *cs, struct kvm_device_attr *attr)
+{
+    return kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr) == 0;
+}
+
+void kvm_arm_pmu_create(CPUState *cs, int irq)
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
+        return;
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
+}
 
 static inline void set_feature(uint64_t *features, int feature)
 {
-- 
2.0.4


