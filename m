Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467B0FCA168
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 17:49:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzejb-0000t4-K5; Mon, 09 Mar 2026 13:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzein-0000Zl-Ir
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:48:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzeii-0002oc-UP
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:48:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso21811865e9.3
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 10:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773078523; x=1773683323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gpxMBpssTBiyClKYiW1/NzisCMEhju5aJAH+eV1EPU=;
 b=xBA//Q5Ojrrme3GUm80fjn5WZlK/LcQTt3QighVRu8DhYTrgQBedepKRBqdoOK/wLI
 RNQbAfQSLMhh1MW9EeMLxmoMNnauosiqGAtWLneMh9iCFnDkZsIOHQGy7CBa3+cO9+5i
 UtgKNRiALdZxEICrY6S6kgKrGXsZfAaI405D/RfBp04+/f6qJxNCgSVKKDedwKGbZe9R
 eBxuEf0Qw6YnQAgfJKdHOT1vl+g56PRE8fExiytpmHxLy9POhqgg9olSqKFJp1tDn9eB
 M8q75Q9TP4wJqtvC9sxVCuOSmBMsvkAroB+0EsfG2ikD/oyjXNOagLWQ60y6aHEMK2uM
 wKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773078523; x=1773683323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1gpxMBpssTBiyClKYiW1/NzisCMEhju5aJAH+eV1EPU=;
 b=xIwW+x4YISEyNxBfpHZRX9XkR2K5cO7IFUAWAVdBDD3wtLO9jdNEu2yJmzFxV3J5K4
 SIGpBAYSR4q4RTrgasrNKUKYXIzXd1XjU0JHvMCsE7gWU257p5Atnvz6TNwyyIoyvPS1
 pZY7QWFcPOXRZDv3QeyNhN6g+qUDRogHKrTe/gVAYT0sBN+RQVHCiIoyEeam2x2mgO2s
 PSOJv0lrIx974f+lTrWAhLfxfx/nnTWVAuC7dFn49E/Istsn13qtyCKLPfUlEbQINW6F
 p2xOUfBLVGEUiPUrpeu0D40ctiZ/4D44cdPCZ7Q2a02/G/w/huoY1GzefUE6C2L+VK9/
 r79A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBZIrCvLGoazV41QqJGtd3u8DP3zaKCFiDYEW4IOaduflLmTrL/MABDVGwSserNz1OnXZvFNrDQQ==@nongnu.org
X-Gm-Message-State: AOJu0YwJfvdAym3Pku5aD0pBPRRka3RoxPZltJb1rYq8sTzRDrHaaUTx
 z+WUp6tWNwQHZuhCpBsvQies/srIzEQSJQSDrRuDLIFunBs8UbjcWqnMccty997Te4k=
X-Gm-Gg: ATEYQzxQY86nFVfKib86Ri2/Pp5B/2IhjlW7jvd0eBNsTROSH/5T5LKqrlOe1puqZwj
 0UxTKk2Tc+GHq9OKS8X+t7sxnOCXH+q2r1rWyPixqNFPn+UocCTb+QPjwNzw4055doRgtlI106R
 tWV9jnKwzPdF34QdIwN47N/XK6npFnYp6EcrXvDVyOQeFuZ4pfz88OOl2280ikuLKJRWbW+NqBF
 FX8Dicv+WwgKfi2Tq6AE3M2Qj353bjtUw0UXpedFLR+aheonH34zzTzB2SXcMsOHUW7FECGgR9y
 WAtWpy/UiRWESWKZjV87tOff8PUIMWs48mRAHXXu0+AgsNUutFSUyEZIxxy0At/UA/yfAF2U/Ob
 3TqsqPsfbWmkpITWONQdfqDgZq0001Uydq6puVzRtP1AfcqkLfuLPE9MmjNGaghkra8OD5bPcWf
 mzwcfQahQMD9lszuZadQxBGEs=
X-Received: by 2002:a05:600c:4e8e:b0:485:3abe:ab86 with SMTP id
 5b1f17b1804b1-4853abeac80mr74143575e9.4.1773078523347; 
 Mon, 09 Mar 2026 10:48:43 -0700 (PDT)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f6b7sm6293355e9.9.2026.03.09.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 10:48:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CE47C5F89A;
 Mon, 09 Mar 2026 17:48:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/5] tests/tcg: allow filtering of TCG tests
Date: Mon,  9 Mar 2026 17:48:38 +0000
Message-ID: <20260309174841.4184117-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309174841.4184117-1-alex.bennee@linaro.org>
References: <20260309174841.4184117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

We have a lot of TCG tests now which can be fiddly if we just want to
check one particular test type across the targets. Introduce
TCG_TEST_FILTER to allow this:

  make check-tcg TCG_TEST_FILTER=gdb

to run all the gdb tests across the suites.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include    |  8 +++++---
 tests/tcg/Makefile.target | 12 +++++++++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 59b9a4b9220..f257288194d 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -16,9 +16,11 @@ check-help:
 	@echo " $(MAKE) check-tracetool               Run tracetool generator tests"
 	@echo " $(MAKE) check-block                   Run block tests"
 ifneq ($(filter $(all-check-targets), check-softfloat),)
-	@echo " $(MAKE) check-tcg                     Run TCG tests"
 	@echo " $(MAKE) check-softfloat               Run FPU emulation tests"
-	@echo " $(MAKE) run-tcg-tests-TARGET-softmmu  Run TCG tests for a given target"
+	@echo " $(MAKE) check-tcg                     Run TCG tests"
+	@echo " $(MAKE) run-tcg-tests-TARGET          Run TCG tests for a given target"
+	@echo
+	@echo "The variable TCG_TEST_FILTER will select the subset of matching tests."
 endif
 	@echo
 	@echo " $(MAKE) check-report.junit.xml        Generates an aggregated XML test report"
@@ -64,7 +66,7 @@ $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) SPEED=$(SPEED) run, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) SPEED=$(SPEED) TCG_TEST_FILTER=$(TCG_TEST_FILTER) run, \
         "RUN", "$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index af72903f898..1b83824ff4e 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -254,8 +254,15 @@ endif
 gdb-%: %
 	gdb --args $(QEMU) $(QEMU_OPTS) $<
 
+# Filter tests based on TCG_TEST_FILTER if set
+ifdef TCG_TEST_FILTER
+FILTERED_RUN_TESTS=$(foreach test,$(RUN_TESTS),$(if $(findstring $(TCG_TEST_FILTER),$(test)),$(test)))
+else
+FILTERED_RUN_TESTS=$(RUN_TESTS)
+endif
+
 .PHONY: run
-run: $(RUN_TESTS)
+run: $(FILTERED_RUN_TESTS)
 
 clean:
 	rm -f $(TESTS) *.o $(CLEANFILES)
@@ -269,3 +276,6 @@ help:
 	@echo "Built with $(CC)"
 	@echo "Available tests:"
 	@$(foreach t,$(RUN_TESTS),echo "  $t";)
+	@echo ""
+	@echo "Environment variables:"
+	@echo "  TCG_TEST_FILTER=<pattern>  Filter tests matching pattern"
-- 
2.47.3


