Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD985C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:18:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYLU-0007fp-Hc; Tue, 30 Jun 2026 09:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLL-0007bm-HB
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLI-0005uE-OT
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-697ebe536b6so7222918a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782825455; x=1783430255; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kiv3T2X3MPRW5SD8A7Rf6XWjbqkuU8QNMH2kC0RrRb4=;
 b=MAEzW1KuQbDoePYDCtmxFSrWngRlPd+l/U70bEl9ve3De2W57sSMc/tMGU83h2Kwtn
 BfqZ8fB2F+xPyxXh/G/tiWQen8FEhBAMW/nCqe+ACRR5d1jFuCsB7hIkgUzPKnMXCO3i
 yxV7ktTcnqvHHbTEihrO1rk0Y3rHli+3ylDZZ8y1Rb94hqR5AUuNzJzqsFS6kQ8kbX/m
 nBYfDswkl6FrdcuMR6Zn8YuMN8R7Dy8cNtbSW3yUDDSeEGDoQJ/qWeY1L1YVaH79xBcB
 trrBVn8Syq+DSrjeSLJDPaX7bkYCPKiCB/pyewuLtuF3vFBs+enCtPe5jjpqczbu8hmO
 YouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825455; x=1783430255;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Kiv3T2X3MPRW5SD8A7Rf6XWjbqkuU8QNMH2kC0RrRb4=;
 b=sb94Rc+cWoCWdasV+gPUkSe8gGp7Ij8n8ESw457TLd5MZHsaPzWyeZhdhedHQCA/+e
 ErDhnaC5KEel/F0+FbKGXIwDmgmS5Fvyr5oojnWH3CJJ6RTA2E8ZrlAPxRHVzzmEF5tR
 oQ7Lcd2aBdBnEktcVlZ89t90Samj/9mHH7DQ+qUDxyHZ3o3tBbWN2rmRWF21MJVfFx97
 CkBwUSRNkbwyiUSrSXONgM6muzdW+hSep4/yy5pu3ZB12aOihhdSWhWvVEDUgtbL3mM2
 UmrEz9vLS9EfeyBmT/CC8r+fAhf5rXT8yE7Y15nUUAKusKAjYv8li/rp/GxlcKJ5KFOQ
 dLeA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpq1FomHJdgj/oWRw15w36q49F6lMTe6y1NmbRR6LCu+UcaozbHPkLoFIzw8qcogk1f95wy4lW70w==@nongnu.org
X-Gm-Message-State: AOJu0YwIOZeoSdcASGhKbFAavH7x552NZT7Elvq0Lt4uj2leAhisKIbQ
 HE9Z01kRiHPSCgCXYwy9oYfedMYQoY4zEa79gFEE+VlYA/spXoSS2H3lHkz6Af8AqD37Mkmu0Vg
 rBED365Q=
X-Gm-Gg: AfdE7ckHzD55xegVpIgRgistcRIdQlpiTYPDMEV54VatD08eYisk/HuQzWH1oyyr1ic
 Qt7DeCjKodQ7IDaZMgtqm0m77FMkpEwEQbxRYxMPKDy4PeEprB0K8hsP+P6h/TnUkVX6QVu5axF
 1gX4AAmdugrs9nAZFGXzp4rqQ75zSv+evCQRY93Xijw2vs/F4A/+huYoQuu3dFhHoCPYdQcyCq2
 51J7g2OB8aPd9PByoJvzrXLOH6Vvpl5GUF2YWq/8xC6nvKg93Ys/fLoFEOOdgkfb/Zfw+YcrPnR
 KeOQkyHaD1TDGnWBKpYGWwf/q7n8ZIQNdNeX4LTuOlSpvM0V4xXlUapxdOxIMQiB+8WtvE24oop
 BscqU6hvugTT1XGWiXGZUf92wrFNHpMPrVO0Hx0g/I0EV8kpqwEGJNnhjoUcRvOCapNJ+TI04zd
 /MnZTZ44wIXmr59Co=
X-Received: by 2002:a05:6402:1476:b0:698:3b7c:be63 with SMTP id
 4fb4d7f45d1cf-69879e3ec89mr2017684a12.31.1782825455115; 
 Tue, 30 Jun 2026 06:17:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:a648:9a45:1aff:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c3a42f6sm1201535a12.6.2026.06.30.06.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 06:17:34 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 30 Jun 2026 14:16:37 +0100
Subject: [PATCH v3 6/6] tests/tcg/arm: Tests for new FPRCVT instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-jmac-fprcvt-v3-6-f4840d5e0a7f@linaro.org>
References: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
In-Reply-To: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ed1-x52e.google.com
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

We autodetect the presence of FPRCVT in the test cross compiler,
which is a recent feature in GCC and not supported by many distros
yet. If this is in place, we compile the existing fcvt.c test with
an extra compiler flag which uses the new SIMD instructions; the
output from the test is unchanged.

The existing [US]CVTF instructions do not have a test, so no new
tests are added for the SIMD versions. They have been tested manually
to check the new SIMD versions produce the same numerical results as
the existing versions.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 14 +++++++++++++-
 tests/tcg/arm/fcvt.c              |  7 +++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 6203ac9b51..32f2689273 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -28,9 +28,21 @@ config-cc.mak: Makefile
 	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
 	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
 	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
-	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme $$fnia, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
+	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme $$fnia, CROSS_AS_HAS_ARMV9_SME); \
+	    $(call cc-option,-march=armv9-a+fprcvt,         CROSS_CC_HAS_ARMV9_FPRCVT)) 3> config-cc.mak
 -include config-cc.mak
 
+ifneq ($(CROSS_CC_HAS_ARMV9_FPRCVT),)
+AARCH64_TESTS += fcvt-fprcvt
+fcvt-fprcvt: LDFLAGS += -lm
+fcvt-fprcvt: CFLAGS += $(CROSS_CC_HAS_ARMV9_FPRCVT) -DFPRCVT
+fcvt-fprcvt: fcvt.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-fcvt-fprcvt: fcvt-fprcvt
+	$(call run-test,$<,$(QEMU) $<)
+	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
+endif
+
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
 AARCH64_TESTS += dcpop
 dcpop: CFLAGS += $(CROSS_CC_HAS_ARMV8_2)
diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index ecebbb0247..7c0cc4367e 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -171,8 +171,14 @@ static void convert_single_to_integer(void)
 #if defined(__arm__)
         /* asm("vcvt.s32.f32 %s0, %s1" : "=t" (output) : "t" (input)); */
         output = input;
+#else
+#ifdef FPRCVT
+        asm("fcvtzs d0, %s1\r\n"
+            "fmov %0, d0" :
+            "=r" (output) : "w" (input));
 #else
         asm("fcvtzs %0, %s1" : "=r" (output) : "w" (input));
+#endif
 #endif
         print_int64(i, output);
     }
@@ -425,6 +431,7 @@ int main(int argc, char *argv[argc])
     convert_double_to_integer();
     convert_half_to_integer();
 
+
     /* And now with ARM alternative FP16 */
 #if defined(__arm__)
     asm("vmrs r1, fpscr\n\t"

-- 
2.43.0


