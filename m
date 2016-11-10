Received: by 10.25.150.194 with SMTP id y185csp875878lfd;
        Thu, 10 Nov 2016 08:08:28 -0800 (PST)
X-Received: by 10.129.49.71 with SMTP id x68mr5708378ywx.176.1478794108879;
        Thu, 10 Nov 2016 08:08:28 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o65si1453709ybo.329.2016.11.10.08.08.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 08:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37CF66A6B3;
	Thu, 10 Nov 2016 16:08:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAAG86ns023413;
	Thu, 10 Nov 2016 11:08:24 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: pbonzini@redhat.com, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        christoffer.dall@linaro.org
Subject: [kvm-unit-tests PATCH v4 07/11] arm/arm64: gicv2: add an IPI test
Date: Thu, 10 Nov 2016 17:08:00 +0100
Message-Id: <1478794084-5273-8-git-send-email-drjones@redhat.com>
In-Reply-To: <1478794084-5273-1-git-send-email-drjones@redhat.com>
References: <1478794084-5273-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 10 Nov 2016 16:08:27 +0000 (UTC)
X-TUID: xvVzfzCnb7QM

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
v4: properly mask irqnr in ipi_handler
v2: add more details in the output if a test fails,
    report spurious interrupts if we get them
---
 arm/Makefile.common |   6 +-
 arm/gic.c           | 195 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 arm/unittests.cfg   |   7 ++
 lib/arm/asm/gic.h   |   6 ++
 4 files changed, 211 insertions(+), 3 deletions(-)
 create mode 100644 arm/gic.c

diff --git a/arm/Makefile.common b/arm/Makefile.common
index 41239c37e092..bc38183ab86e 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -9,9 +9,9 @@ ifeq ($(LOADADDR),)
 	LOADADDR = 0x40000000
 endif
 
-tests-common = \
-	$(TEST_DIR)/selftest.flat \
-	$(TEST_DIR)/spinlock-test.flat
+tests-common  = $(TEST_DIR)/selftest.flat
+tests-common += $(TEST_DIR)/spinlock-test.flat
+tests-common += $(TEST_DIR)/gic.flat
 
 all: test_cases
 
diff --git a/arm/gic.c b/arm/gic.c
new file mode 100644
index 000000000000..efefab7296d4
--- /dev/null
+++ b/arm/gic.c
@@ -0,0 +1,195 @@
+/*
+ * GIC tests
+ *
+ * GICv2
+ *   + test sending/receiving IPIs
+ *
+ * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#include <libcflat.h>
+#include <asm/setup.h>
+#include <asm/processor.h>
+#include <asm/gic.h>
+#include <asm/smp.h>
+#include <asm/barrier.h>
+#include <asm/io.h>
+
+static int gic_version;
+static int acked[NR_CPUS], spurious[NR_CPUS];
+static cpumask_t ready;
+
+static void nr_cpu_check(int nr)
+{
+	if (nr_cpus < nr)
+		report_abort("At least %d cpus required", nr);
+}
+
+static void wait_on_ready(void)
+{
+	cpumask_set_cpu(smp_processor_id(), &ready);
+	while (!cpumask_full(&ready))
+		cpu_relax();
+}
+
+static void check_acked(cpumask_t *mask)
+{
+	int missing = 0, extra = 0, unexpected = 0;
+	int nr_pass, cpu, i;
+
+	/* Wait up to 5s for all interrupts to be delivered */
+	for (i = 0; i < 50; ++i) {
+		mdelay(100);
+		nr_pass = 0;
+		for_each_present_cpu(cpu) {
+			smp_rmb();
+			nr_pass += cpumask_test_cpu(cpu, mask) ?
+				acked[cpu] == 1 : acked[cpu] == 0;
+		}
+		if (nr_pass == nr_cpus) {
+			report("Completed in %d ms", true, ++i * 100);
+			return;
+		}
+	}
+
+	for_each_present_cpu(cpu) {
+		if (cpumask_test_cpu(cpu, mask)) {
+			if (!acked[cpu])
+				++missing;
+			else if (acked[cpu] > 1)
+				++extra;
+		} else {
+			if (acked[cpu])
+				++unexpected;
+		}
+	}
+
+	report("Timed-out (5s). ACKS: missing=%d extra=%d unexpected=%d",
+	       false, missing, extra, unexpected);
+}
+
+static void ipi_handler(struct pt_regs *regs __unused)
+{
+	u32 irqstat = readl(gicv2_cpu_base() + GIC_CPU_INTACK);
+	u32 irqnr = irqstat & GICC_IAR_INT_ID_MASK;
+
+	if (irqnr != GICC_INT_SPURIOUS) {
+		writel(irqstat, gicv2_cpu_base() + GIC_CPU_EOI);
+		smp_rmb(); /* pairs with wmb in ipi_test functions */
+		++acked[smp_processor_id()];
+		smp_wmb(); /* pairs with rmb in check_acked */
+	} else {
+		++spurious[smp_processor_id()];
+		smp_wmb();
+	}
+}
+
+static void ipi_test_self(void)
+{
+	cpumask_t mask;
+
+	report_prefix_push("self");
+	memset(acked, 0, sizeof(acked));
+	smp_wmb();
+	cpumask_clear(&mask);
+	cpumask_set_cpu(0, &mask);
+	writel(2 << 24, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	check_acked(&mask);
+	report_prefix_pop();
+}
+
+static void ipi_test_smp(void)
+{
+	cpumask_t mask;
+	unsigned long tlist;
+
+	report_prefix_push("target-list");
+	memset(acked, 0, sizeof(acked));
+	smp_wmb();
+	tlist = cpumask_bits(&cpu_present_mask)[0] & 0xaa;
+	cpumask_bits(&mask)[0] = tlist;
+	writel((u8)tlist << 16, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	check_acked(&mask);
+	report_prefix_pop();
+
+	report_prefix_push("broadcast");
+	memset(acked, 0, sizeof(acked));
+	smp_wmb();
+	cpumask_copy(&mask, &cpu_present_mask);
+	cpumask_clear_cpu(0, &mask);
+	writel(1 << 24, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	check_acked(&mask);
+	report_prefix_pop();
+}
+
+static void ipi_enable(void)
+{
+	gicv2_enable_defaults();
+#ifdef __arm__
+	install_exception_handler(EXCPTN_IRQ, ipi_handler);
+#else
+	install_irq_handler(EL1H_IRQ, ipi_handler);
+#endif
+	local_irq_enable();
+}
+
+static void ipi_recv(void)
+{
+	ipi_enable();
+	cpumask_set_cpu(smp_processor_id(), &ready);
+	while (1)
+		wfi();
+}
+
+int main(int argc, char **argv)
+{
+	char pfx[8];
+	int cpu;
+
+	gic_version = gic_init();
+	if (!gic_version)
+		report_abort("No gic present!");
+
+	snprintf(pfx, 8, "gicv%d", gic_version);
+	report_prefix_push(pfx);
+
+	if (argc < 2) {
+
+		report_prefix_push("ipi");
+		ipi_enable();
+		ipi_test_self();
+		report_prefix_pop();
+
+	} else if (!strcmp(argv[1], "ipi")) {
+
+		report_prefix_push(argv[1]);
+		nr_cpu_check(2);
+
+		for_each_present_cpu(cpu) {
+			if (cpu == 0)
+				continue;
+			smp_boot_secondary(cpu, ipi_recv);
+		}
+		ipi_enable();
+		wait_on_ready();
+		ipi_test_self();
+		ipi_test_smp();
+
+		smp_rmb();
+		for_each_present_cpu(cpu) {
+			if (spurious[cpu]) {
+				printf("ipi: WARN: cpu%d got %d spurious "
+				       "interrupts\n",
+				       spurious[cpu], smp_processor_id());
+			}
+		}
+
+		report_prefix_pop();
+
+	} else {
+		report_abort("Unknown subtest '%s'", argv[1]);
+	}
+
+	return report_summary();
+}
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 3f6fa45c587e..68bf5cd6008f 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -54,3 +54,10 @@ file = selftest.flat
 smp = $MAX_SMP
 extra_params = -append 'smp'
 groups = selftest
+
+# Test GIC emulation
+[gicv2-ipi]
+file = gic.flat
+smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
+extra_params = -machine gic-version=2 -append 'ipi'
+groups = gic
diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
index ec92f1064dc0..328e078a9ae1 100644
--- a/lib/arm/asm/gic.h
+++ b/lib/arm/asm/gic.h
@@ -10,14 +10,20 @@
 
 #define GIC_CPU_CTRL			0x00
 #define GIC_CPU_PRIMASK			0x04
+#define GIC_CPU_INTACK			0x0c
+#define GIC_CPU_EOI			0x10
 
 #define GICC_ENABLE			0x1
 #define GICC_INT_PRI_THRESHOLD		0xf0
 
+#define GICC_IAR_INT_ID_MASK		0x3ff
+#define GICC_INT_SPURIOUS		1023
+
 #define GIC_DIST_CTRL			0x000
 #define GIC_DIST_CTR			0x004
 #define GIC_DIST_ENABLE_SET		0x100
 #define GIC_DIST_PRI			0x400
+#define GIC_DIST_SOFTINT		0xf00
 
 #define GICD_ENABLE			0x1
 #define GICD_INT_EN_SET_SGI		0x0000ffff
-- 
2.7.4
