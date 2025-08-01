Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B98C87FD3
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 00:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhdUN-0003kG-Li; Thu, 31 Jul 2025 20:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uhdOs-0007w9-W8
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 20:13:31 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uhdOq-0001kB-Mx
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 20:13:30 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-240763b322fso10438305ad.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 17:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754007199; x=1754611999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=puyOmxGd5nbAUKxa4bS/YO3K65xgCmHZUgpZjwuLvOY=;
 b=YhGxl2qN3KE4VJ02gClvVaKXei4CnfGlaVNm1hQo7yVkAUVdaGqel0PtqlpsZQLqwY
 bSABEYcIqYfQPDlsMqmY/dnE2HYA5XJ5B3PRA5/MVbaoVwkMmHiEsuq+HuqVokwUT7jp
 zFfHQAtWqR3P0Pxmz/LsgO66k/sNQF1SeB17FjFSfkx0eftRYiRgX0PN9a2ZvTpzXTW+
 NbRxDsGKsEb8qT+ZH+4I0OO6YPa/lIhR1w2ttvfvw8UpNGmOlwBf7nfE8/qNk1XSgmcs
 u+M2txjs24fpgYn8sypG07VXG9bQahpNX24qih/YlCm/gawZpQbkU5/47nozHeE99eQj
 3V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754007199; x=1754611999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=puyOmxGd5nbAUKxa4bS/YO3K65xgCmHZUgpZjwuLvOY=;
 b=VNMDnVQ7Hkm8qfwaUb2utUqP7gzg8f3Z4kcpnKSQ/CBf49CHafsqA3sbZGy2y0BZis
 Xj8KGKpdEb7hU+Z2JFaMjnQxu05REr9Aq4XgFGj7pVY1YU4/Nwb4ztIEZ9u7oOmNiajI
 JEGVRDJJSuTJaRQV53KPVmjaFOEqRQtrb/jmSPSprUh1j2bnvFpKEUhTR6gaocp9ZcHa
 hOwLPoJznzSurs7XloGU0fp3g4z3qb29f0CqnpjoEDIzgMpfDQ1tc2Mi0urn2IMBkr7y
 AUFzY0I2TFbfXC4wu/1hIOBJBnbJppgBsa1HMp4S9axEAfkSRy2IEoDtTwL0933lKS7p
 nD8A==
X-Gm-Message-State: AOJu0Yyhp3367mWDNQ9QNdHIU3b0sMcf3hjSB2MNwTMb1RS71PBaVevd
 oqph7Ng0LMlb93WOUL7kiYVBQJlUZDoPeQ7Yz3e6cRhor7AiVXoR6zkKDFsKH0nxxH8=
X-Gm-Gg: ASbGncvZIiA0o3jtaLX1Y2VjAoEiRv0gA5ovf5LO+s/j7Vu1uZFzF3eb/UXvEKnHMn5
 E3PQijc30zfdvUor0VOLCapAowuxigvOTIqXMCcK3E4SLZf09sLI2Xc8/zQA2oMeiCWWM1UCCuo
 9P8T/kLxNU32AC2z3HfkOnRlDqX5EDB5W9SkctphEq2tFNUsHYJRqsU/VxGieIhQfIe8/xOTq8I
 kZMKs5U9WvtSIHKBkLVlGV3hq4jmyXVPjZL80Hv68lFqjsUGYD9GpVIe6VrGjgbaQQdWFj/rNcQ
 1/AwpDf9mSEduAtOH5ZRiWZ6xpSxfntfIFw4XBntAFeiZgCtNbKAC36PdU2uaKhzuN12rpJJznt
 0e3sMJU8/9bGfitq2+ayklOo2GEI=
X-Google-Smtp-Source: AGHT+IGHF62TxgPqvJmlTwcX9rGAZqDUXXtOfDQVWBm5/qeGiVStZKpeuhzZVncIUgF6kXTqVk7hqQ==
X-Received: by 2002:a17:903:1b6d:b0:240:8fee:e500 with SMTP id
 d9443c01a7336-24096b76dffmr122340575ad.50.1754007199035; 
 Thu, 31 Jul 2025 17:13:19 -0700 (PDT)
Received: from gromero0.. ([152.243.37.35]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f1ebc1sm27993855ad.67.2025.07.31.17.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 17:13:18 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, pierrick.bouvier@linaro.org,
 manos.pitsidianakis@linaro.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v2] tests/tcg: Fix run for tests with specific plugin
Date: Fri,  1 Aug 2025 00:13:05 +0000
Message-Id: <20250801001305.2352554-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62b.google.com
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
combination of tests and plugins might not cover the rules required to
run the tests with a specific plugin passed via EXTRA_RUNS.

This commit fixes it by correctly generating the rules for the tests
that require a specific plugin to run, which are now passed via the
EXTRA_RUNS_WITH_PLUGIN instead of via the EXTRA_RUNS variable.

The fix essentially excludes the tests passed via EXTRA_RUNS_WITH_PLUGIN
from the rules created by the shuffled combination of tests and plugins,
to avoid running the tests twice, and generates the rules for the
test/plugin combinations listed in the EXTRA_RUNS_WITH_PLUGIN variable.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/tcg/Makefile.target                     | 20 ++++++++++++++++---
 tests/tcg/multiarch/Makefile.target           |  2 +-
 .../multiarch/system/Makefile.softmmu-target  |  2 +-
 tests/tcg/x86_64/Makefile.softmmu-target      |  2 +-
 4 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 18afd5be19..af72903f89 100644
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
+# which can run with any plugin combination, so we don't run it twice.
+MULTIARCH_TESTS:=$(filter-out $(EXTRA_TESTS_WITH_PLUGIN), $(MULTIARCH_TESTS))
+
 NUM_PLUGINS := $(words $(PLUGINS))
 NUM_TESTS := $(words $(MULTIARCH_TESTS))
 
@@ -186,19 +197,22 @@ define mod_plus_one
   $(shell $(PYTHON) -c "print( ($(1) % $(2)) + 1 )")
 endef
 
+# Rules for running tests with any plugin combination, i.e., no specific plugin.
 $(foreach _idx, $(shell seq 1 $(NUM_TESTS)), \
 	$(eval _test := $(word $(_idx), $(MULTIARCH_TESTS))) \
 	$(eval _plugin := $(word $(call mod_plus_one, $(_idx), $(NUM_PLUGINS)), $(PLUGINS))) \
 	$(eval run-plugin-$(_test)-with-$(_plugin): $(_test) $(_plugin)) \
 	$(eval RUN_TESTS+=run-plugin-$(_test)-with-$(_plugin)))
 
+# Rules for running extra tests with specific plugins.
+$(foreach f,$(EXTRA_RUNS_WITH_PLUGIN), \
+    $(eval $(f): $(call extract-test,$(f)) $(call extract-plugin,$(f))))
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


