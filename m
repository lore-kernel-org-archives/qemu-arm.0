Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b14sm7950544wrf.75.2021.04.28.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 03:18:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 27D401FF87;
	Wed, 28 Apr 2021 11:18:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: shashi.mallela@linaro.org,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v1 1/4] arm64: split its-trigger test into KVM and TCG variants
Date: Wed, 28 Apr 2021 11:18:41 +0100
Message-Id: <20210428101844.22656-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428101844.22656-1-alex.bennee@linaro.org>
References: <20210428101844.22656-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: h08s471dCnAl

A few of the its-trigger tests rely on IMPDEF behaviour where caches
aren't flushed before invall events. However TCG emulation doesn't
model any invall behaviour and as we can't probe for it we need to be
told. Split the test into a KVM and TCG variant and skip the invall
tests when under TCG.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
---
 arm/gic.c         | 60 +++++++++++++++++++++++++++--------------------
 arm/unittests.cfg | 11 ++++++++-
 2 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index 98135ef..96a329d 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -36,6 +36,7 @@ static struct gic *gic;
 static int acked[NR_CPUS], spurious[NR_CPUS];
 static int irq_sender[NR_CPUS], irq_number[NR_CPUS];
 static cpumask_t ready;
+static bool under_tcg;
 
 static void nr_cpu_check(int nr)
 {
@@ -734,32 +735,38 @@ static void test_its_trigger(void)
 	/*
 	 * re-enable the LPI but willingly do not call invall
 	 * so the change in config is not taken into account.
-	 * The LPI should not hit
+	 * The LPI should not hit. This does however depend on
+	 * implementation defined behaviour - under QEMU TCG emulation
+	 * it can quite correctly process the event directly.
 	 */
-	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
-	stats_reset();
-	cpumask_clear(&mask);
-	its_send_int(dev2, 20);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, -1, -1),
-			"dev2/eventid=20 still does not trigger any LPI");
-
-	/* Now call the invall and check the LPI hits */
-	stats_reset();
-	cpumask_clear(&mask);
-	cpumask_set_cpu(3, &mask);
-	its_send_invall(col3);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, 0, 8195),
-			"dev2/eventid=20 pending LPI is received");
-
-	stats_reset();
-	cpumask_clear(&mask);
-	cpumask_set_cpu(3, &mask);
-	its_send_int(dev2, 20);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, 0, 8195),
-			"dev2/eventid=20 now triggers an LPI");
+	if (under_tcg) {
+		report_skip("checking LPI triggers without invall");
+	} else {
+		gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
+		stats_reset();
+		cpumask_clear(&mask);
+		its_send_int(dev2, 20);
+		wait_for_interrupts(&mask);
+		report(check_acked(&mask, -1, -1),
+		       "dev2/eventid=20 still does not trigger any LPI");
+
+		/* Now call the invall and check the LPI hits */
+		stats_reset();
+		cpumask_clear(&mask);
+		cpumask_set_cpu(3, &mask);
+		its_send_invall(col3);
+		wait_for_interrupts(&mask);
+		report(check_acked(&mask, 0, 8195),
+		       "dev2/eventid=20 pending LPI is received");
+
+		stats_reset();
+		cpumask_clear(&mask);
+		cpumask_set_cpu(3, &mask);
+		its_send_int(dev2, 20);
+		wait_for_interrupts(&mask);
+		report(check_acked(&mask, 0, 8195),
+		       "dev2/eventid=20 now triggers an LPI");
+	}
 
 	report_prefix_pop();
 
@@ -981,6 +988,9 @@ int main(int argc, char **argv)
 	if (argc < 2)
 		report_abort("no test specified");
 
+	if (argc == 3 && strcmp(argv[2], "tcg") == 0)
+		under_tcg = true;
+
 	if (strcmp(argv[1], "ipi") == 0) {
 		report_prefix_push(argv[1]);
 		nr_cpu_check(2);
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index f776b66..c72dc34 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -184,13 +184,22 @@ extra_params = -machine gic-version=3 -append 'its-introspection'
 groups = its
 arch = arm64
 
-[its-trigger]
+[its-trigger-kvm]
 file = gic.flat
 smp = $MAX_SMP
+accel = kvm
 extra_params = -machine gic-version=3 -append 'its-trigger'
 groups = its
 arch = arm64
 
+[its-trigger-tcg]
+file = gic.flat
+smp = $MAX_SMP
+accel = tcg
+extra_params = -machine gic-version=3 -append 'its-trigger tcg'
+groups = its
+arch = arm64
+
 [its-migration]
 file = gic.flat
 smp = $MAX_SMP
-- 
2.20.1
