Received: by 10.25.21.156 with SMTP id 28csp601035lfv;
        Fri, 15 Jul 2016 06:01:41 -0700 (PDT)
X-Received: by 10.13.225.72 with SMTP id k69mr13279143ywe.32.1468587672049;
        Fri, 15 Jul 2016 06:01:12 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f189si5198189qke.182.2016.07.15.06.01.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jul 2016 06:01:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25475710A2;
	Fri, 15 Jul 2016 13:01:11 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-44.brq.redhat.com [10.40.204.44])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u6FD0gcF018213;
	Fri, 15 Jul 2016 09:01:08 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        wei@redhat.com
Subject: [kvm-unit-tests PATCH v3 09/10] arm/arm64: gicv3: add an IPI test
Date: Fri, 15 Jul 2016 15:00:40 +0200
Message-Id: <1468587641-7300-10-git-send-email-drjones@redhat.com>
In-Reply-To: <1468587641-7300-1-git-send-email-drjones@redhat.com>
References: <1468587641-7300-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 15 Jul 2016 13:01:11 +0000 (UTC)
X-TUID: m3hILJfZjJxC

Signed-off-by: Andrew Jones <drjones@redhat.com>

---
v2: use IRM for gicv3 broadcast
---
 arm/gic.c         | 157 ++++++++++++++++++++++++++++++++++++++++++++++++++----
 arm/unittests.cfg |   6 +++
 2 files changed, 154 insertions(+), 9 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index cf7ec1c90413c..fc7ef241de3e2 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -3,6 +3,8 @@
  *
  * GICv2
  *   . test sending/receiving IPIs
+ * GICv3
+ *   . test sending/receiving IPIs
  *
  * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
  *
@@ -16,6 +18,18 @@
 #include <asm/barrier.h>
 #include <asm/io.h>
 
+struct gic {
+	struct {
+		void (*enable)(void);
+		void (*send_self)(void);
+		void (*send_tlist)(cpumask_t *);
+		void (*send_broadcast)(void);
+	} ipi;
+	u32 (*read_iar)(void);
+	void (*write_eoi)(u32);
+};
+
+static struct gic *gic;
 static int gic_version;
 static int acked[NR_CPUS], spurious[NR_CPUS];
 static cpumask_t ready;
@@ -69,12 +83,22 @@ static void check_acked(cpumask_t *mask)
 	       false, missing, extra, unexpected);
 }
 
+static u32 gicv2_read_iar(void)
+{
+	return readl(gicv2_cpu_base() + GIC_CPU_INTACK);
+}
+
+static void gicv2_write_eoi(u32 irq)
+{
+	writel(irq, gicv2_cpu_base() + GIC_CPU_EOI);
+}
+
 static void ipi_handler(struct pt_regs *regs __unused)
 {
-	u32 iar = readl(gicv2_cpu_base() + GIC_CPU_INTACK);
+	u32 iar = gic->read_iar();
 
 	if (iar != GICC_INT_SPURIOUS) {
-		writel(iar, gicv2_cpu_base() + GIC_CPU_EOI);
+		gic->write_eoi(iar);
 		smp_rmb(); /* pairs with wmb in ipi_test functions */
 		++acked[smp_processor_id()];
 		smp_wmb(); /* pairs with rmb in check_acked */
@@ -84,6 +108,89 @@ static void ipi_handler(struct pt_regs *regs __unused)
 	}
 }
 
+static void gicv2_ipi_send_self(void)
+{
+	writel(2 << 24, gicv2_dist_base() + GIC_DIST_SOFTINT);
+}
+
+static void gicv2_ipi_send_tlist(cpumask_t *mask)
+{
+	u8 tlist = (u8)cpumask_bits(mask)[0];
+
+	writel(tlist << 16, gicv2_dist_base() + GIC_DIST_SOFTINT);
+}
+
+static void gicv2_ipi_send_broadcast(void)
+{
+	writel(1 << 24, gicv2_dist_base() + GIC_DIST_SOFTINT);
+}
+
+#define ICC_SGI1R_AFFINITY_1_SHIFT	16
+#define ICC_SGI1R_AFFINITY_2_SHIFT	32
+#define ICC_SGI1R_AFFINITY_3_SHIFT	48
+#define MPIDR_TO_SGI_AFFINITY(cluster_id, level) \
+	(MPIDR_AFFINITY_LEVEL(cluster_id, level) << ICC_SGI1R_AFFINITY_## level ## _SHIFT)
+
+static void gicv3_ipi_send_tlist(cpumask_t *mask)
+{
+	u16 tlist;
+	int cpu;
+
+	for_each_cpu(cpu, mask) {
+		u64 mpidr = cpus[cpu], sgi1r;
+		u64 cluster_id = mpidr & ~0xffUL;
+
+		tlist = 0;
+
+		while (cpu < nr_cpus) {
+			if ((mpidr & 0xff) >= 16) {
+				printf("cpu%d MPIDR:aff0 is %d (>= 16)!\n",
+					cpu, (int)(mpidr & 0xff));
+				break;
+			}
+
+			tlist |= 1 << (mpidr & 0xf);
+
+			cpu = cpumask_next(cpu, mask);
+			if (cpu >= nr_cpus)
+				break;
+
+			mpidr = cpus[cpu];
+
+			if (cluster_id != (mpidr & ~0xffUL)) {
+				--cpu;
+				break;
+			}
+		}
+
+		sgi1r = (MPIDR_TO_SGI_AFFINITY(cluster_id, 3)	|
+			 MPIDR_TO_SGI_AFFINITY(cluster_id, 2)	|
+			 /* irq << 24				| */
+			 MPIDR_TO_SGI_AFFINITY(cluster_id, 1)	|
+			 tlist);
+
+		gicv3_write_sgi1r(sgi1r);
+	}
+
+	/* Force the above writes to ICC_SGI1R_EL1 to be executed */
+	isb();
+}
+
+static void gicv3_ipi_send_self(void)
+{
+	cpumask_t mask;
+
+	cpumask_clear(&mask);
+	cpumask_set_cpu(smp_processor_id(), &mask);
+	gicv3_ipi_send_tlist(&mask);
+}
+
+static void gicv3_ipi_send_broadcast(void)
+{
+	gicv3_write_sgi1r(1ULL << 40);
+	isb();
+}
+
 static void ipi_test_self(void)
 {
 	cpumask_t mask;
@@ -93,7 +200,7 @@ static void ipi_test_self(void)
 	smp_wmb();
 	cpumask_clear(&mask);
 	cpumask_set_cpu(0, &mask);
-	writel(2 << 24, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	gic->ipi.send_self();
 	check_acked(&mask);
 	report_prefix_pop();
 }
@@ -101,14 +208,15 @@ static void ipi_test_self(void)
 static void ipi_test_smp(void)
 {
 	cpumask_t mask;
-	unsigned long tlist;
+	int i;
 
 	report_prefix_push("target-list");
 	memset(acked, 0, sizeof(acked));
 	smp_wmb();
-	tlist = cpumask_bits(&cpu_present_mask)[0] & 0xaa;
-	cpumask_bits(&mask)[0] = tlist;
-	writel((u8)tlist << 16, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	cpumask_copy(&mask, &cpu_present_mask);
+	for (i = 0; i < nr_cpus; i += 2)
+		cpumask_clear_cpu(i, &mask);
+	gic->ipi.send_tlist(&mask);
 	check_acked(&mask);
 	report_prefix_pop();
 
@@ -117,14 +225,14 @@ static void ipi_test_smp(void)
 	smp_wmb();
 	cpumask_copy(&mask, &cpu_present_mask);
 	cpumask_clear_cpu(0, &mask);
-	writel(1 << 24, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	gic->ipi.send_broadcast();
 	check_acked(&mask);
 	report_prefix_pop();
 }
 
 static void ipi_enable(void)
 {
-	gicv2_enable_defaults();
+	gic->ipi.enable();
 #ifdef __arm__
 	install_exception_handler(EXCPTN_IRQ, ipi_handler);
 #else
@@ -141,6 +249,28 @@ static void ipi_recv(void)
 		wfi();
 }
 
+struct gic gicv2 = {
+	.ipi = {
+		.enable = gicv2_enable_defaults,
+		.send_self = gicv2_ipi_send_self,
+		.send_tlist = gicv2_ipi_send_tlist,
+		.send_broadcast = gicv2_ipi_send_broadcast,
+	},
+	.read_iar = gicv2_read_iar,
+	.write_eoi = gicv2_write_eoi,
+};
+
+struct gic gicv3 = {
+	.ipi = {
+		.enable = gicv3_enable_defaults,
+		.send_self = gicv3_ipi_send_self,
+		.send_tlist = gicv3_ipi_send_tlist,
+		.send_broadcast = gicv3_ipi_send_broadcast,
+	},
+	.read_iar = gicv3_read_iar,
+	.write_eoi = gicv3_write_eoir,
+};
+
 int main(int argc, char **argv)
 {
 	char pfx[8];
@@ -153,6 +283,15 @@ int main(int argc, char **argv)
 	snprintf(pfx, 8, "gicv%d", gic_version);
 	report_prefix_push(pfx);
 
+	switch (gic_version) {
+	case 2:
+		gic = &gicv2;
+		break;
+	case 3:
+		gic = &gicv3;
+		break;
+	}
+
 	if (argc < 2) {
 
 		report_prefix_push("ipi");
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index bb364675043f0..043a20e26e98c 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -58,3 +58,9 @@ file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
 extra_params = -machine gic-version=2 -append 'ipi'
 groups = gic
+
+[gicv3-ipi]
+file = gic.flat
+smp = $MAX_SMP
+extra_params = -machine gic-version=3 -append 'ipi'
+groups = gic
-- 
2.7.4
