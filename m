Received: by 10.25.208.137 with SMTP id h131csp1145776lfg;
        Mon, 16 May 2016 00:58:23 -0700 (PDT)
X-Received: by 10.55.180.133 with SMTP id d127mr29211926qkf.131.1463385474381;
        Mon, 16 May 2016 00:57:54 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o94si21861757qge.94.2016.05.16.00.57.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 May 2016 00:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72FA58553D;
	Mon, 16 May 2016 07:57:53 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-50.brq.redhat.com [10.40.204.50])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u4G7vPBO018488;
	Mon, 16 May 2016 03:57:51 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: [kvm-unit-tests PATCH 10/10] arm/arm64: gic: don't just use zero
Date: Mon, 16 May 2016 09:57:24 +0200
Message-Id: <1463385444-12916-11-git-send-email-drjones@redhat.com>
In-Reply-To: <1463385444-12916-1-git-send-email-drjones@redhat.com>
References: <1463385444-12916-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 16 May 2016 07:57:53 +0000 (UTC)
X-TUID: 4/fD4felmpif

Allow user to select who sends ipis and with which irq, rather
than just always sending irq=0 from cpu0.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 arm/gic.c | 53 ++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index ec8e0a26ff724..b76b946f2c106 100644
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
@@ -31,6 +32,7 @@ struct gic {
 
 static struct gic *gic;
 static int gic_version;
+static int sender, irq;
 static int acked[NR_CPUS];
 static cpumask_t ready;
 
@@ -92,19 +94,19 @@ static void ipi_handler(struct pt_regs *regs __unused)
 
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
@@ -147,7 +149,7 @@ static void gicv3_ipi_send_tlist(cpumask_t *mask)
 
 		sgi1r = (MPIDR_TO_SGI_AFFINITY(cluster_id, 3)	|
 			 MPIDR_TO_SGI_AFFINITY(cluster_id, 2)	|
-			 /* irq << 24				| */
+			 irq << 24				|
 			 MPIDR_TO_SGI_AFFINITY(cluster_id, 1)	|
 			 tlist);
 
@@ -184,7 +186,7 @@ static void ipi_test_self(void)
 	memset(acked, 0, sizeof(acked));
 	smp_wmb();
 	cpumask_clear(&mask);
-	cpumask_set_cpu(0, &mask);
+	cpumask_set_cpu(smp_processor_id(), &mask);
 	gic->ipi.send_self();
 	check_acked(&mask);
 	report_prefix_pop();
@@ -199,7 +201,7 @@ static void ipi_test_smp(void)
 	memset(acked, 0, sizeof(acked));
 	smp_wmb();
 	cpumask_copy(&mask, &cpu_present_mask);
-	for (i = 0; i < nr_cpus; i += 2)
+	for (i = smp_processor_id() & 1; i < nr_cpus; i += 2)
 		cpumask_clear_cpu(i, &mask);
 	gic->ipi.send_tlist(&mask);
 	check_acked(&mask);
@@ -209,7 +211,7 @@ static void ipi_test_smp(void)
 	memset(acked, 0, sizeof(acked));
 	smp_wmb();
 	cpumask_copy(&mask, &cpu_present_mask);
-	cpumask_clear_cpu(0, &mask);
+	cpumask_clear_cpu(smp_processor_id(), &mask);
 	gic->ipi.send_broadcast();
 	check_acked(&mask);
 	report_prefix_pop();
@@ -226,6 +228,15 @@ static void ipi_enable(void)
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
@@ -284,6 +295,19 @@ int main(int argc, char **argv)
 		ipi_test_self();
 
 	} else if (!strcmp(argv[0], "ipi")) {
+		int off, i = 0;
+		long val;
+
+		while (--argc) {
+			off = parse_keyval(argv[++i], &val);
+			if (off == -1)
+				continue;
+			argv[i][off] = '\0';
+			if (strcmp(argv[i], "sender") == 0)
+				sender = val;
+			else if (strcmp(argv[i], "irq") == 0)
+				irq = val;
+		}
 
 		report_prefix_push(argv[0]);
 		nr_cpu_check(2);
@@ -292,11 +316,18 @@ int main(int argc, char **argv)
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
 		report_prefix_pop();
 
 	} else {
-- 
2.4.11
