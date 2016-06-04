Received: by 10.25.27.66 with SMTP id b63csp799239lfb;
        Sat, 4 Jun 2016 11:17:10 -0700 (PDT)
X-Received: by 10.55.121.68 with SMTP id u65mr8500286qkc.92.1465064198394;
        Sat, 04 Jun 2016 11:16:38 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r30si7133025qtd.99.2016.06.04.11.16.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jun 2016 11:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7001C65421;
	Sat,  4 Jun 2016 18:16:37 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u54IG9o2008070;
	Sat, 4 Jun 2016 14:16:35 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: [kvm-unit-tests PATCH v2 10/10] arm/arm64: gic: don't just use zero
Date: Sat,  4 Jun 2016 20:16:05 +0200
Message-Id: <1465064165-14885-11-git-send-email-drjones@redhat.com>
In-Reply-To: <1465064165-14885-1-git-send-email-drjones@redhat.com>
References: <1465064165-14885-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Sat, 04 Jun 2016 18:16:37 +0000 (UTC)
X-TUID: ppdi+mxNwhw0

Allow user to select who sends ipis and with which irq,
rather than just always sending irq=0 from cpu0.

Signed-off-by: Andrew Jones <drjones@redhat.com>

---
v2: actually check that the irq received was the irq sent,
    and (for gicv2) that the sender is the expected one.
---
 arm/gic.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 16 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index fc7ef241de3e2..d3ab97d4ae470 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -11,6 +11,7 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 #include <libcflat.h>
+#include <util.h>
 #include <asm/setup.h>
 #include <asm/processor.h>
 #include <asm/gic.h>
@@ -33,6 +34,8 @@ static struct gic *gic;
 static int gic_version;
 static int acked[NR_CPUS], spurious[NR_CPUS];
 static cpumask_t ready;
+static int sender;
+static u32 irq;
 
 static void nr_cpu_check(int nr)
 {
@@ -85,7 +88,16 @@ static void check_acked(cpumask_t *mask)
 
 static u32 gicv2_read_iar(void)
 {
-	return readl(gicv2_cpu_base() + GIC_CPU_INTACK);
+	u32 iar = readl(gicv2_cpu_base() + GIC_CPU_INTACK);
+	int src = (iar >> 10) & 7;
+
+	if (src != sender) {
+		report("cpu%d received IPI from unexpected source cpu%d "
+		       "(expected cpu%d)",
+		       false, smp_processor_id(), src, sender);
+	}
+
+	return iar & 0x3ff;
 }
 
 static void gicv2_write_eoi(u32 irq)
@@ -99,9 +111,15 @@ static void ipi_handler(struct pt_regs *regs __unused)
 
 	if (iar != GICC_INT_SPURIOUS) {
 		gic->write_eoi(iar);
-		smp_rmb(); /* pairs with wmb in ipi_test functions */
-		++acked[smp_processor_id()];
-		smp_wmb(); /* pairs with rmb in check_acked */
+		if (iar == irq) {
+			smp_rmb(); /* pairs with wmb in ipi_test functions */
+			++acked[smp_processor_id()];
+			smp_wmb(); /* pairs with rmb in check_acked */
+		} else {
+			report("cpu%d received unexpected irq %u "
+			       "(expected %u)",
+			       false, smp_processor_id(), iar, irq);
+		}
 	} else {
 		++spurious[smp_processor_id()];
 		smp_wmb();
@@ -110,19 +128,19 @@ static void ipi_handler(struct pt_regs *regs __unused)
 
 static void gicv2_ipi_send_self(void)
 {
-	writel(2 << 24, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	writel(2 << 24 | irq, gicv2_dist_base() + GIC_DIST_SOFTINT);
 }
 
 static void gicv2_ipi_send_tlist(cpumask_t *mask)
 {
 	u8 tlist = (u8)cpumask_bits(mask)[0];
 
-	writel(tlist << 16, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	writel(tlist << 16 | irq, gicv2_dist_base() + GIC_DIST_SOFTINT);
 }
 
 static void gicv2_ipi_send_broadcast(void)
 {
-	writel(1 << 24, gicv2_dist_base() + GIC_DIST_SOFTINT);
+	writel(1 << 24 | irq, gicv2_dist_base() + GIC_DIST_SOFTINT);
 }
 
 #define ICC_SGI1R_AFFINITY_1_SHIFT	16
@@ -165,7 +183,7 @@ static void gicv3_ipi_send_tlist(cpumask_t *mask)
 
 		sgi1r = (MPIDR_TO_SGI_AFFINITY(cluster_id, 3)	|
 			 MPIDR_TO_SGI_AFFINITY(cluster_id, 2)	|
-			 /* irq << 24				| */
+			 irq << 24				|
 			 MPIDR_TO_SGI_AFFINITY(cluster_id, 1)	|
 			 tlist);
 
@@ -187,7 +205,7 @@ static void gicv3_ipi_send_self(void)
 
 static void gicv3_ipi_send_broadcast(void)
 {
-	gicv3_write_sgi1r(1ULL << 40);
+	gicv3_write_sgi1r(1ULL << 40 | irq << 24);
 	isb();
 }
 
@@ -199,7 +217,7 @@ static void ipi_test_self(void)
 	memset(acked, 0, sizeof(acked));
 	smp_wmb();
 	cpumask_clear(&mask);
-	cpumask_set_cpu(0, &mask);
+	cpumask_set_cpu(smp_processor_id(), &mask);
 	gic->ipi.send_self();
 	check_acked(&mask);
 	report_prefix_pop();
@@ -214,7 +232,7 @@ static void ipi_test_smp(void)
 	memset(acked, 0, sizeof(acked));
 	smp_wmb();
 	cpumask_copy(&mask, &cpu_present_mask);
-	for (i = 0; i < nr_cpus; i += 2)
+	for (i = smp_processor_id() & 1; i < nr_cpus; i += 2)
 		cpumask_clear_cpu(i, &mask);
 	gic->ipi.send_tlist(&mask);
 	check_acked(&mask);
@@ -224,7 +242,7 @@ static void ipi_test_smp(void)
 	memset(acked, 0, sizeof(acked));
 	smp_wmb();
 	cpumask_copy(&mask, &cpu_present_mask);
-	cpumask_clear_cpu(0, &mask);
+	cpumask_clear_cpu(smp_processor_id(), &mask);
 	gic->ipi.send_broadcast();
 	check_acked(&mask);
 	report_prefix_pop();
@@ -241,6 +259,15 @@ static void ipi_enable(void)
 	local_irq_enable();
 }
 
+static void ipi_send(void)
+{
+	ipi_enable();
+	wait_on_ready();
+	ipi_test_self();
+	ipi_test_smp();
+	exit(report_summary());
+}
+
 static void ipi_recv(void)
 {
 	ipi_enable();
@@ -300,19 +327,40 @@ int main(int argc, char **argv)
 		report_prefix_pop();
 
 	} else if (!strcmp(argv[1], "ipi")) {
+		int off, i = 1;
+		long val;
 
 		report_prefix_push(argv[1]);
+
+		while (--argc != 1) {
+			off = parse_keyval(argv[++i], &val);
+			if (off == -1)
+				continue;
+			argv[i][off] = '\0';
+			if (strcmp(argv[i], "sender") == 0)
+				sender = val;
+			else if (strcmp(argv[i], "irq") == 0)
+				irq = val;
+		}
+
 		nr_cpu_check(2);
 		ipi_enable();
 
 		for_each_present_cpu(cpu) {
 			if (cpu == 0)
 				continue;
-			smp_boot_secondary(cpu, ipi_recv);
+			if (cpu == sender)
+				smp_boot_secondary(cpu, ipi_send);
+			else
+				smp_boot_secondary(cpu, ipi_recv);
+		}
+		if (sender == 0)  {
+			wait_on_ready();
+			ipi_test_self();
+			ipi_test_smp();
+		} else {
+			ipi_recv();
 		}
-		wait_on_ready();
-		ipi_test_self();
-		ipi_test_smp();
 
 		smp_rmb();
 		for_each_present_cpu(cpu) {
-- 
2.4.11
