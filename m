Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF81098797
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 15:53:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3c8H-0007cc-UW; Fri, 20 Mar 2026 11:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c82-0007WX-Gk
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:14 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c7z-0005VX-S8
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:14 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6686d06c411so3314058a12.3
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774021870; x=1774626670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gpxMBpssTBiyClKYiW1/NzisCMEhju5aJAH+eV1EPU=;
 b=boBEDiipWOUGU6wT0er29xAj2wRNeX0Re5TCmnKhWt4LNsp7QBt0en6n+SKyXmPrQU
 9LycfEuiOjNCJrNkFhmYF8gLHlRGYQYPBR1igl2ZklNw3TbIe5N1hrEyiau2KCNUstcg
 OwSNLMc97jWzPuYLFbkDg76jHThQaJYe9MUWReA/sYY92v6oQvFWgOulkhxlspRK7uYg
 0wwQjvM7L2JQPgqVPbsOAxklqJ7lA3/MIKO89YGy7j2bjD9T3/LIFSzbuFJPMXS0Dqm+
 xM9HO9ZLcbDNgwlW3RrdqVm+SNaX2Ymnv9DnGzgVHZumzG/FsQi7DtYXNZU+XqL97sKI
 zKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774021870; x=1774626670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1gpxMBpssTBiyClKYiW1/NzisCMEhju5aJAH+eV1EPU=;
 b=Zm2N4Dms5enyudYMw04SzlTgHaZcCMfk1nTwSry06eBZknFDdww4jlCVFP1XWEB8XH
 mgsPGCKkd9j/7vFzB4o3iDxykKwgcfPyno3qD/AJR05GX/Qx1HAwbHZ0M22Au56AS2/j
 cP07BiC+RTbSRWpsUAvzSG/o2lhJ0ibwGYYAROHqc0pHtp2OQ0Kj4Y6phEk1ngcM5EYQ
 aLKCUTUSztu191TSTAiiPMdoXZXe76FcM7qo7gA0xj9ZzAq/Ptu7MqwuhOeRWlEc00zs
 3zCRsQFmuKfZoLTtKId6F9Vvh2fGTSHT5ND6SPnchXH8JzT8p1exAb/SrmtceXQGMLzf
 yV/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXfDD40RdpOo3J4Q47baXWhzuR2+6Is9bcFFCvaGpshZH37x3n6YeLPeM7DD2ZqtPfrbCFaCo9Cw==@nongnu.org
X-Gm-Message-State: AOJu0YxpF3r/0HryekI7ESHJr0xog5KxUmVT6613p643BmGhEUl4lhn4
 DkTaQ3Niod6mVOCIeQjNx9OfV/p+8BjDGOqD6hw+dcQQjoK++9nQwu1jJrlbA1mNGJQ=
X-Gm-Gg: ATEYQzz7pxMhrgVnin0AZ2kBjTdmDm053BeDyOMNlUyh3/d5Jd5S+R+WWYKavwEc0yA
 ZsPNciB3vEPV70kxIFwQdMHZd5T5ERajRlfZJqLDU7eNi3eJXxP72SuCSkmL83RZsfFxPMPz68C
 efLBv0dxeYR98rpGIY7QtjMWCWIA8SO1dZMT2brtCun6O4sTO5vmipnUObloDBYn+ngS85g/ABV
 kCSnD5zQV8jwM8ZFGvpOzhsWyjmZI5y9Tc7UtEoJrVrzoMF1HB3y6HUX/Fv7vDIzY4gU0i2WnOO
 JRCAoCrYq+8v5LUtQ8TZ5At3gcQwDhBpFR9kk/fy4fQ9BwRnlbzIaJ34llbaJcIeSKyC38tsLkf
 H1cqKfxm73BtYjC+DS1V6CJ/jh6cRzBOck6UZaj3HzRZcaWqqQ+QYoOMc7+cBfd5Hc6b3eBLUAS
 +iUC2P8upQwpdvV+I1e/LWU+Q=
X-Received: by 2002:a17:907:a807:b0:b96:e3db:9e04 with SMTP id
 a640c23a62f3a-b982f4faea3mr248933266b.53.1774021869964; 
 Fri, 20 Mar 2026 08:51:09 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f42f0dsm172731966b.12.2026.03.20.08.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:51:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D1A7D5F909;
 Fri, 20 Mar 2026 15:51:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Warner Losh <imp@bsdimp.com>, qemu-arm@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Brad Smith <brad@comstyle.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 1/8] tests/tcg: allow filtering of TCG tests
Date: Fri, 20 Mar 2026 15:51:00 +0000
Message-ID: <20260320155107.2143191-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320155107.2143191-1-alex.bennee@linaro.org>
References: <20260320155107.2143191-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


