Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u2sm5734412wmc.22.2021.04.28.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 03:18:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4D0661FF90;
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
Subject: [kvm-unit-tests PATCH v1 4/4] arm64: split its-migrate-unmapped-collection into KVM and TCG variants
Date: Wed, 28 Apr 2021 11:18:44 +0100
Message-Id: <20210428101844.22656-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428101844.22656-1-alex.bennee@linaro.org>
References: <20210428101844.22656-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ozKFdx2ujt86

When running the test in TCG we are basically running on bare metal so
don't rely on having a particular kernel errata applied.

You might wonder why we handle this with a totally new test name
instead of adjusting the append as we have before? Well the
run_migration shell script uses eval "$@" which unwraps the -append
leading to any second parameter being split and leaving QEMU very
confused and the test hanging. This seemed simpler than re-writing all
the test running logic in something sane ;-)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
---
 arm/gic.c         |  7 ++++++-
 arm/unittests.cfg | 11 ++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index 96a329d..3bc7477 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -843,7 +843,7 @@ static void test_migrate_unmapped_collection(void)
 		goto do_migrate;
 	}
 
-	if (!errata(ERRATA_UNMAPPED_COLLECTIONS)) {
+	if (!errata(ERRATA_UNMAPPED_COLLECTIONS) && !under_tcg) {
 		report_skip("Skipping test, as this test hangs without the fix. "
 			    "Set %s=y to enable.", ERRATA_UNMAPPED_COLLECTIONS);
 		test_skipped = true;
@@ -1017,6 +1017,11 @@ int main(int argc, char **argv)
 		report_prefix_push(argv[1]);
 		test_migrate_unmapped_collection();
 		report_prefix_pop();
+	} else if (!strcmp(argv[1], "its-migrate-unmapped-collection-tcg")) {
+		under_tcg = true;
+		report_prefix_push(argv[1]);
+		test_migrate_unmapped_collection();
+		report_prefix_pop();
 	} else if (strcmp(argv[1], "its-introspection") == 0) {
 		report_prefix_push(argv[1]);
 		test_its_introspection();
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index d4dbc8b..e8f2e74 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -214,13 +214,22 @@ extra_params = -machine gic-version=3 -append 'its-pending-migration'
 groups = its migration
 arch = arm64
 
-[its-migrate-unmapped-collection]
+[its-migrate-unmapped-collection-kvm]
 file = gic.flat
 smp = $MAX_SMP
+accel = kvm
 extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
 groups = its migration
 arch = arm64
 
+[its-migrate-unmapped-collection-tcg]
+file = gic.flat
+smp = $MAX_SMP
+accel = tcg
+extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection-tcg'
+groups = its migration
+arch = arm64
+
 # Test PSCI emulation
 [psci]
 file = psci.flat
-- 
2.20.1
