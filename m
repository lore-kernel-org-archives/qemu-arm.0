Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143181njb;
        Sat, 1 Feb 2025 08:43:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUKEyx431Ikb0nswBJUm4VEJ6pXQ8z97OLitMH7hsaFXsBcLMVQH3HxyYGHM0VJNMB1z2b0Bez7T0m5Dg==@linaro.org
X-Google-Smtp-Source: AGHT+IHlAfQNdLFo6+mcA1RSZbxTmDN4OQjbIuiZCstqRFEgmEFKO3qCdeQjnRi4NeJHMgnZQgdP
X-Received: by 2002:a05:622a:8e11:b0:46f:d6c3:2def with SMTP id d75a77b69052e-46fd6c33038mr134356611cf.49.1738428206157;
        Sat, 01 Feb 2025 08:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428206; cv=none;
        d=google.com; s=arc-20240605;
        b=SnrQCRX+vr2o8RTsySoH1fjN99ptUmIizTFAdkkwFIEDQ+N9RFUzEB3mS4PkgdlgKa
         YBjr0CukhYzs5/GYHT8cQQMv6s0frqfZeRF8s92SaZhAxizMghI32G7xBYxr/HKX7/1Y
         N+6O9WNkQk7dbHmGcmOsUU0PRdkYw5GHPywD9lHl2Oeold4VIoWq3HYMgZVgnp8RDGdW
         0Q8rl13ctbRldxPHS5AIktKifWd4gOsyekGxOqnSjy/U20dSKANNCjVI7V8EbAiYKBvP
         FN4Gwk2WeSA196PSbt0lnpTef8a+Cf8zvLxEb2emdSvWfUPRFWSDnhyTbjtyELV1l0DD
         HSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cIp/ry/DGiFODjiThDZlgJEFjr5yBLQ4629/fR6TMgU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Rf3Yf2YxAzldtr0Kx3jWgpcN/QNAxBoffW/wF8xP2SpIXvWjBFhz+RpE/evsEA1Uow
         qRmu8IKXX0iS93KFJ3tQwRjsgEobTf7hfzbhyTL7Trro1eqb732dQ8b/gx+SZpEPFuvU
         U8fpeIp9udw3JBU1EXz7F7uwMrtuzD/bXbPKA/4REfvIP5aqjhWb7gC5XNHiJxK5SIW7
         ORg79ey9OEBUaL2jaC4rqX6OyQ6lEpUrQeTV3pvNsgLPqpMCC9F7ZCGQAP5sBIn/CqYo
         x1Jd9pgaKl/7vw/ts3ha69kfjje51rbS+WDpG3KQ8WRfQH1xXSrRXMuM1HDa928B0IYT
         R5ZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yId57cI+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d21a6si64885751cf.426.2025.02.01.08.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yId57cI+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGXg-0005xy-GP; Sat, 01 Feb 2025 11:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXd-0005wg-Sv
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:21 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXb-00011o-Ae
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:21 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso18601115e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428018; x=1739032818; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cIp/ry/DGiFODjiThDZlgJEFjr5yBLQ4629/fR6TMgU=;
 b=yId57cI+iCfYFpjw6mJWVtFoqQpTZ3Twc2ma0msvqDfmbQfRnKAEC2dl0boJgUXJlB
 TxpkM5i/rGIjA0FEwTmXEMi5gCh4w5c6nTek0ZqwwJ+ugkEbLSWFWlCQ6SHyhhP47yfL
 lgMyi7x9RIYRe4qcVOimov2n7pH1YtMqPO0LNxUWT+Dl8JHLbRRJyAU+4lIH/wCPyI0+
 qRWRr0uBC7VhqULFGqm7k5HCXScr4KfvMjXah6WRx0jud04NMmeDuUK44dcn1m8L25Qd
 ptAcD/1GvWmlVfrQaB7hax4aF7K9L1pIdUS7JzrSzmQ5/t0P3xhT42I7QIj7ud3fzxLt
 owsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428018; x=1739032818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIp/ry/DGiFODjiThDZlgJEFjr5yBLQ4629/fR6TMgU=;
 b=OKTkSV3c9CKx81+wQFbzB6iSNiNB1fcVjOFSo7Qet2S+/QLCbpDYhNJTgnldnxcl6W
 Gb89wLZiBu5xNT1UiP6a4kXEjlhtNXldfgRRO/uXMA6U0aP41JN9HAAZ88OWGSFgyZeq
 2sCHAlhiHBEyo1Twod1SMHXkSyN5B8R4Hez++abwKO+m9YgOCqaWzrGVt7Hbh65Nwmtd
 k27/FZw6N5hlqqNZvM47PsWmkVA+w6a4ik7iEMYA/NCOQjVt+oSDJex1WSkisfovZuZZ
 g72HrU/gcjC3cybN5eK84vbyWVlZYPJ9piuWc25iDasy3TRmZZwoq1mQ9jGj9PLvg5rD
 +YOw==
X-Gm-Message-State: AOJu0YxNG1m9Yn4RgXpZdaZg0mIzvRq93qbjKGgDmBVDvdJz7cgnCPAd
 Z/+OPgM1YR/k1bZWuGqe3EPW5ozPhiAAhkKNF9f7+jKzlfwFBfgxI3tZpOXGaPBbb9X72ojChXV
 Q
X-Gm-Gg: ASbGncuOzcSCUhZ917TcU9FyF41byh2BERjjgTBtS0c0M7lr9l6LFfLtw558mKsgRBW
 vgshUC8IArcT6WnJ68D22jRB1JCNY+/1Yv4jqxZ+NF6mus6SxXZ1eZ+/q9mEv15HKlJOYNpBsb2
 P25UCM7Q6IP1A7bQFjOR7NA8/JJPsVfA7RWG96pMyZ0wDhIFsRfteWCWJH4ismLzT9IvcgmygPG
 ZNzF2ol/csYuU4WOUBqcQR4rM0tL8kOlJLntK29To6BS9FXs/4sV1zgxHWTSWYFrIz3JivwGklM
 +zbQhzlHlkt/P9UukEl4
X-Received: by 2002:a05:600c:c87:b0:434:fe3c:c662 with SMTP id
 5b1f17b1804b1-438e16fec01mr81524265e9.12.1738428017663; 
 Sat, 01 Feb 2025 08:40:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/69] tests/tcg/x86_64/fma: Test some x86
 fused-multiply-add cases
Date: Sat,  1 Feb 2025 16:39:05 +0000
Message-Id: <20250201164012.1660228-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 971leEPdgYsx

Add a test case which tests some corner case behaviour of
fused-multiply-add on x86:
 * 0 * Inf + SNaN should raise Invalid
 * 0 * Inf + QNaN shouldh not raise Invalid
 * tininess should be detected after rounding

There is also one currently-disabled test case:
 * flush-to-zero should be done after rounding

This is disabled because QEMU's emulation currently does this
incorrectly (and so would fail the test).  The test case is kept in
but disabled, as the justification for why the test running harness
has support for testing both with and without FTZ set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/tcg/x86_64/fma.c           | 109 +++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 tests/tcg/x86_64/fma.c

diff --git a/tests/tcg/x86_64/fma.c b/tests/tcg/x86_64/fma.c
new file mode 100644
index 00000000000..09c622ebc00
--- /dev/null
+++ b/tests/tcg/x86_64/fma.c
@@ -0,0 +1,109 @@
+/*
+ * Test some fused multiply add corner cases.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <stdio.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <inttypes.h>
+
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+
+/*
+ * Perform one "n * m + a" operation using the vfmadd insn and return
+ * the result; on return *mxcsr_p is set to the bottom 6 bits of MXCSR
+ * (the Flag bits). If ftz is true then we set MXCSR.FTZ while doing
+ * the operation.
+ * We print the operation and its results to stdout.
+ */
+static uint64_t do_fmadd(uint64_t n, uint64_t m, uint64_t a,
+                         bool ftz, uint32_t *mxcsr_p)
+{
+    uint64_t r;
+    uint32_t mxcsr = 0;
+    uint32_t ftz_bit = ftz ? (1 << 15) : 0;
+    uint32_t saved_mxcsr = 0;
+
+    asm volatile("stmxcsr %[saved_mxcsr]\n"
+                 "stmxcsr %[mxcsr]\n"
+                 "andl $0xffff7fc0, %[mxcsr]\n"
+                 "orl %[ftz_bit], %[mxcsr]\n"
+                 "ldmxcsr %[mxcsr]\n"
+                 "movq %[a], %%xmm0\n"
+                 "movq %[m], %%xmm1\n"
+                 "movq %[n], %%xmm2\n"
+                 /* xmm0 = xmm0 + xmm2 * xmm1 */
+                 "vfmadd231sd %%xmm1, %%xmm2, %%xmm0\n"
+                 "movq %%xmm0, %[r]\n"
+                 "stmxcsr %[mxcsr]\n"
+                 "ldmxcsr %[saved_mxcsr]\n"
+                 : [r] "=r" (r), [mxcsr] "=m" (mxcsr),
+                   [saved_mxcsr] "=m" (saved_mxcsr)
+                 : [n] "r" (n), [m] "r" (m), [a] "r" (a),
+                   [ftz_bit] "r" (ftz_bit)
+                 : "xmm0", "xmm1", "xmm2");
+    *mxcsr_p = mxcsr & 0x3f;
+    printf("vfmadd132sd 0x%" PRIx64 " 0x%" PRIx64 " 0x%" PRIx64
+           " = 0x%" PRIx64 " MXCSR flags 0x%" PRIx32 "\n",
+           n, m, a, r, *mxcsr_p);
+    return r;
+}
+
+typedef struct testdata {
+    /* Input n, m, a */
+    uint64_t n;
+    uint64_t m;
+    uint64_t a;
+    bool ftz;
+    /* Expected result */
+    uint64_t expected_r;
+    /* Expected low 6 bits of MXCSR (the Flag bits) */
+    uint32_t expected_mxcsr;
+} testdata;
+
+static testdata tests[] = {
+    { 0, 0x7ff0000000000000, 0x7ff000000000aaaa, false, /* 0 * Inf + SNaN */
+      0x7ff800000000aaaa, 1 }, /* Should be QNaN and does raise Invalid */
+    { 0, 0x7ff0000000000000, 0x7ff800000000aaaa, false, /* 0 * Inf + QNaN */
+      0x7ff800000000aaaa, 0 }, /* Should be QNaN and does *not* raise Invalid */
+    /*
+     * These inputs give a result which is tiny before rounding but which
+     * becomes non-tiny after rounding. x86 is a "detect tininess after
+     * rounding" architecture, so it should give a non-denormal result and
+     * not set the Underflow flag (only the Precision flag for an inexact
+     * result).
+     */
+    { 0x3fdfffffffffffff, 0x001fffffffffffff, 0x801fffffffffffff, false,
+      0x8010000000000000, 0x20 },
+    /*
+     * Flushing of denormal outputs to zero should also happen after
+     * rounding, so setting FTZ should not affect the result or the flags.
+     * QEMU currently does not emulate this correctly because we do the
+     * flush-to-zero check before rounding, so we incorrectly produce a
+     * zero result and set Underflow as well as Precision.
+     */
+#ifdef ENABLE_FAILING_TESTS
+    { 0x3fdfffffffffffff, 0x001fffffffffffff, 0x801fffffffffffff, true,
+      0x8010000000000000, 0x20 }, /* Enabling FTZ shouldn't change flags */
+#endif
+};
+
+int main(void)
+{
+    bool passed = true;
+    for (int i = 0; i < ARRAY_SIZE(tests); i++) {
+        uint32_t mxcsr;
+        uint64_t r = do_fmadd(tests[i].n, tests[i].m, tests[i].a,
+                              tests[i].ftz, &mxcsr);
+        if (r != tests[i].expected_r) {
+            printf("expected result 0x%" PRIx64 "\n", tests[i].expected_r);
+            passed = false;
+        }
+        if (mxcsr != tests[i].expected_mxcsr) {
+            printf("expected MXCSR flags 0x%x\n", tests[i].expected_mxcsr);
+            passed = false;
+        }
+    }
+    return passed ? 0 : 1;
+}
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index d6dff559c7d..be20fc64e88 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -18,6 +18,7 @@ X86_64_TESTS += adox
 X86_64_TESTS += test-1648
 X86_64_TESTS += test-2175
 X86_64_TESTS += cross-modifying-code
+X86_64_TESTS += fma
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
 TESTS=$(MULTIARCH_TESTS)
-- 
2.34.1

