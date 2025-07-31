Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D11C87FCC
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 20:32:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhZwF-0004yW-8v; Thu, 31 Jul 2025 16:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uhYOk-00030O-Gy
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:53:03 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uhYOi-0007ix-5w
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:53:01 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2403ceef461so770245ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753987977; x=1754592777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QyrYdLkR5Cz2ox+ZPvgu+hFep4K/vYOt7VSdpfk/NM8=;
 b=THGASg+hWfxxTpZtawbN/MHv3LIscrx0ILpF40SqL4SdVp77QD9IEJq7PWoUQ/qHKu
 wjhZJD1/cTEUcOZ4AkvzVTTQ8ze+ueqduy5D0jhTcKs3Fkm7k0hPOopsaP0BktnvQ5So
 rH66nsjFTSWDnobeJXCfMlNManEGJbzYZB0wxwhNbVZb9zLI0RDKsbSE/Y3XFDk9b9Bb
 /G+euSJs0bYsxqoUvjorzQvOuDmxq7ornwdYOh4snDIvd1QWsw/dn/n6yew73kufG/T7
 n9sT0qKjK8D2lwOBDqVKuRWDzQHUmwWcsAvT/tQH/xIarPQcvLSaxUbelDMTtTOjTbIK
 UhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753987977; x=1754592777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QyrYdLkR5Cz2ox+ZPvgu+hFep4K/vYOt7VSdpfk/NM8=;
 b=J7XO43m+YLB1K1v4NCdXHBGwR9tobZJEWADPWJuO96aRtiEyJFuZjajRmCoxputTwy
 Mo8EBTcZlkt3/ZkwrUBqrMcojEFL8VJTm5Xjh5JpuPp4Ii3PhE4Xyo+QkrJzayQVm2Cl
 l2k1jpsynLt71tc3igy92RkLxcPLCOXbYJ/hw61jGfCUqxFrv3nVAuhxZEQ47kc9GMK1
 M1UBA9gpQZWZa8dGcXkpE7blISd5EWd7d8SE7azsLzBYr28/ry0Gnh2hQ+gcpzyaptSw
 DkRuJgKkI24BiRJv27nYkSNAHUcfh4y6m0mYVSsuRaV+nFtkazErVWRoN8uS9Y2FSAlO
 maOQ==
X-Gm-Message-State: AOJu0YxDtZ5LglI3SZ+vBxRjVH1Q1IbA6zOYpJYZDfcaH0ezcCnznJvR
 bxdEw8GQg1sT7CuUCLIiR/+E0qj92CncSreMNTPeAv1rzMoa9xbXCubjq6G6nepTQAA=
X-Gm-Gg: ASbGncsOipFbPPLolLd9WLVSjRcSCchIkz9iD+5zkdjYmJ5XVyX2BZjoGd/egOFInZY
 2HIOH8hYIdo7OZrTTeIkvIMPa9EzPkcoPdEnPgT+1P3Fhc8So/4xbUP+2qcJPLl1vkdGFXuxoQc
 HR98Bo0mAGhyBBSLtaShe151SdvmkMnPlyYxNGC2kDJrKZFQcb+GIusPSnoIPnkrqHKlbEZ1Gtq
 VCLrqcBGsEn3o934D6UQWw7yu7pFHsPCfufEOqvT7Kl6KtDYSO6HbyMxHRajrYvOTfp/8W+ZWEM
 aiV+/8n2FVlGqu9QDC5/+a5gtwN3tvjUaTILmaIhrmjQas4Xx8q2+q8rp0lZrzANuU1L7FadrGO
 n174Kfwtm1yG1rPl3pyGVCbsq5MNQ0QCrGPS69A==
X-Google-Smtp-Source: AGHT+IEPGnxui1szgyTJY9LcrQYDojdJQNv1GjHgctQTDG37w0iyOi3Wz9JQ1MCWORE1TRmkc9tgyg==
X-Received: by 2002:a17:902:f08d:b0:240:10dc:b795 with SMTP id
 d9443c01a7336-24096a73014mr96763115ad.1.1753987977508; 
 Thu, 31 Jul 2025 11:52:57 -0700 (PDT)
Received: from gromero0.. ([152.243.37.35]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975a66sm24075335ad.95.2025.07.31.11.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 11:52:56 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, pierrick.bouvier@linaro.org,
 manos.pitsidianakis@linaro.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH] tests/tcg: Fix run for tests with specific plugin
Date: Thu, 31 Jul 2025 18:52:32 +0000
Message-Id: <20250731185232.2351818-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Commit 25aaf0cb7f (“tests/tcg: reduce the number of plugin test
combinations”) added support for running tests with specific plugins
passed via the EXTRA_RUNS variable.

However, due to the optimization, the rules generated as a shuffled
combination of tests and plugins might not correctly generate the rules
for the tests passed via EXTRA_RUNS.

This commit fixes it by correctly generating the rules for the tests
that require a specific plugin to run.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/tcg/Makefile.target                     | 21 ++++++++++++++++---
 tests/tcg/multiarch/Makefile.target           |  2 +-
 .../multiarch/system/Makefile.softmmu-target  |  2 +-
 tests/tcg/x86_64/Makefile.softmmu-target      |  2 +-
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 18afd5be19..e7bc66b5a0 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -170,6 +170,10 @@ endif
 PLUGINS=$(filter-out $(DISABLE_PLUGINS), \
 	$(patsubst %.c, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.c))))
 
+strip-plugin = $(wordlist 1, 1, $(subst -with-, ,$1))
+extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
+extract-test = $(subst run-plugin-,,$(wordlist 1, 1, $(subst -with-, ,$1)))
+
 # We need to ensure expand the run-plugin-TEST-with-PLUGIN
 # pre-requistes manually here as we can't use stems to handle it. We
 # only expand MULTIARCH_TESTS which are common on most of our targets
@@ -179,6 +183,13 @@ PLUGINS=$(filter-out $(DISABLE_PLUGINS), \
 
 ifneq ($(MULTIARCH_TESTS),)
 
+# Extract extra tests from the extra test+plugin combination.
+EXTRA_TESTS_WITH_PLUGIN=$(foreach test, \
+                        $(EXTRA_RUNS_WITH_PLUGIN),$(call extract-test,$(test)))
+# Exclude tests that were specified to run with specific plugins from the tests
+# which can run with any plugin combination.
+MULTIARCH_TESTS:=$(filter-out $(EXTRA_TESTS_WITH_PLUGIN), $(MULTIARCH_TESTS))
+
 NUM_PLUGINS := $(words $(PLUGINS))
 NUM_TESTS := $(words $(MULTIARCH_TESTS))
 
@@ -186,19 +197,23 @@ define mod_plus_one
   $(shell $(PYTHON) -c "print( ($(1) % $(2)) + 1 )")
 endef
 
+# Rules for running tests with any plugin combination, i.e., no specific plugin.
 $(foreach _idx, $(shell seq 1 $(NUM_TESTS)), \
 	$(eval _test := $(word $(_idx), $(MULTIARCH_TESTS))) \
 	$(eval _plugin := $(word $(call mod_plus_one, $(_idx), $(NUM_PLUGINS)), $(PLUGINS))) \
 	$(eval run-plugin-$(_test)-with-$(_plugin): $(_test) $(_plugin)) \
 	$(eval RUN_TESTS+=run-plugin-$(_test)-with-$(_plugin)))
 
+# Rules for running extra tests with specific plugins.
+RULE_TEXT := $(foreach f,$(EXTRA_RUNS_WITH_PLUGIN), \
+  $(f): $(call extract-test,$(f)) $(call extract-plugin,$(f)))
+$(eval $(RULE_TEXT))
+
 endif # MULTIARCH_TESTS
 endif # CONFIG_PLUGIN
 
-strip-plugin = $(wordlist 1, 1, $(subst -with-, ,$1))
-extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
-
 RUN_TESTS+=$(EXTRA_RUNS)
+RUN_TESTS+=$(EXTRA_RUNS_WITH_PLUGIN)
 
 # Some plugins need additional arguments above the default to fully
 # exercise things. We can define them on a per-test basis here.
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 38345ff880..8dc65d7a06 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -201,7 +201,7 @@ run-plugin-test-plugin-mem-access-with-libmem.so: \
 	$(SRC_PATH)/tests/tcg/multiarch/check-plugin-output.sh \
 	$(QEMU) $<
 
-EXTRA_RUNS += run-plugin-test-plugin-mem-access-with-libmem.so
+EXTRA_RUNS_WITH_PLUGIN += run-plugin-test-plugin-mem-access-with-libmem.so
 endif
 
 # Update TESTS
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index 4171b4e6aa..98c4eda5e0 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -77,5 +77,5 @@ run-plugin-memory-with-libmem.so: memory libmem.so
 run-plugin-memory-with-libmem.so: PLUGIN_ARGS=$(COMMA)region-summary=true
 run-plugin-memory-with-libmem.so: CHECK_PLUGIN_OUTPUT_COMMAND=$(MULTIARCH_SYSTEM_SRC)/validate-memory-counts.py $@.out
 
-EXTRA_RUNS += run-plugin-memory-with-libmem.so
+EXTRA_RUNS_WITH_PLUGIN += run-plugin-memory-with-libmem.so
 endif
diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index 3e30ca9307..4e65f58b57 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -40,5 +40,5 @@ run-plugin-patch-target-with-libpatch.so:		\
 run-plugin-patch-target-with-libpatch.so:		\
 	CHECK_PLUGIN_OUTPUT_COMMAND=$(X64_SYSTEM_SRC)/validate-patch.py $@.out
 run-plugin-patch-target-with-libpatch.so: patch-target libpatch.so
-EXTRA_RUNS+=run-plugin-patch-target-with-libpatch.so
+EXTRA_RUNS_WITH_PLUGIN+=run-plugin-patch-target-with-libpatch.so
 endif
-- 
2.34.1


