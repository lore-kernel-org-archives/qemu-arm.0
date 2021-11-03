Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4294629lfv;
        Tue, 2 Nov 2021 21:05:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykcOQbXw4HYE75Nx5NvcS49rysPHxe3+V7wOLoe4ieVMaYm3QAeq+3sEj6wyQ/WkNclRJd
X-Received: by 2002:a54:4e97:: with SMTP id c23mr8523202oiy.153.1635912348984;
        Tue, 02 Nov 2021 21:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635912348; cv=none;
        d=google.com; s=arc-20160816;
        b=vZJpTWpZX8qtfaWC9TFTFT47z1ozSqKm61flqirpyj3VGDSclFF64tHdkVfdUaR4kp
         BKHYW1hkSNKwUIkWxAMbhH65Bt+H4C0o6Vn3lG8B7lb81xzvYVvgIJKVhQ4LoA8DYnOo
         +tFBiGcqELF3fbPB/HpwmHY/oZbFYZU5NVrn+Rr96/Fc+B7FhwSq8XvqLLDkFzGPs13T
         wj7FKU2ovxjKLxKB85wVZ6poy/j26uTzXRIqlcljvld3wq00tgtwtnibpyBYK7YLI/CH
         EY+ulXuR1phO63iYRmR45MJoKzWCdKtOyI8r6GwkD3CNbnTtdrx5Q3UG4qz02Mew2gTi
         c+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j3xcIy2m2TMlH3aTyvVTXEM5j7IHz1QAadoWnnY7f2s=;
        b=F1helhPXYjM7pYioGjpp3xCd1MzzUZ+eg0qCmP47qYyTDuV+FX9jAVXrPIkULgA0M9
         NDs8sHf1/Dw+9LVng4wPd/tQ9NGWuJ0Y/EE14Hm2aYWEwxuXb+DyzG4pbPUeGxlIqtkU
         K843VJdkmjTjEw2daz4WToBbZdCSUCOhW5CIt1Ta3nJJdRRLLgcuV0tKYrFJf9lTvXhE
         yTrdtKSTACv4AlAESjjjxXiaalRPhkx6zerrvjujYX71V4LK1Ii0XEDx9fDgos39Aimd
         g95NLaFUiyRmTs6R9DjUTJnd3j97oePLoyfvjkzl515/xQwxAuGHpzfQ2PUYK6XmgFIz
         MzAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JeL6e5zC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d66si1097298oia.286.2021.11.02.21.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 21:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JeL6e5zC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi7X2-0006fq-6Z
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 00:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VN-0005G1-Q6
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:04:06 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:44633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VL-0000wM-E1
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:04:05 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id v2so1470366qve.11
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 21:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3xcIy2m2TMlH3aTyvVTXEM5j7IHz1QAadoWnnY7f2s=;
 b=JeL6e5zCxxONpWPtKVZ/l5YNS4AcWs48xxKKlqdHbKIiM8xq9QwFcRpEsUrTauMkJ+
 4CevVkNSr+T/uEroVwfeBjY1tipbjzVhrGEPDvl8xUaiwgaPNhS5i90vngod+RCSt48K
 x1y3OMzu0uCeOmq9G1RJBJLE0O6w+96W9cT3kf6u0Uk3q+Iae0pByexyjJbnHH+J8YNg
 Pn4qGdu1WLa9yIBfhOwjAM3V5FJq4lPVLv90HrsfZuucfiuI1P3rtFGRnCK1qm4Dyrkz
 b0ly/4u17rC3kfU+FX8Lk3HpzG3UP4SfP9t0MITEUazTPPbwGg/TAYXKW+rlxANQHeaD
 BMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3xcIy2m2TMlH3aTyvVTXEM5j7IHz1QAadoWnnY7f2s=;
 b=GmlQ/V7oKpqq2oSeD/+tSuSoo2QeqHK92FDH9xrx6JMaciJnWr7FprQ2CPS5MGSe0x
 dVqiGr1Y5Kk7EeZaho1962VBfgrWnoQxCInC2jvh27cc9UuenEmFK7jELtkXeTcnanHp
 hggM61HS0JqhMv4JwA58JQ8BElbYB4nPCkCEoQmTxpWoZN51ibVD6qCAtmd/6vc22B4D
 VBbe/ugld6SfvZ/JhyGTMhC6jFqAmsd87nHtlEw8cU5u/tKKrSShXP7YnJXvQ9DCYtgV
 Ejx5t7fcxlbYBrnJnMK5o0LVypZWOAp3bwiwgXxZIYxuTr1xiOY5Cfy5vqf5n1uCTgbV
 Ph7w==
X-Gm-Message-State: AOAM532ymtADq68cSLP0ZSKYCTbZUFuDR27V00RWNPemI4MFF1jtZdBe
 hTX1S+8Ozfu0H2A2PE/LDNtDnqWaUxhkrA==
X-Received: by 2002:ad4:5f4c:: with SMTP id p12mr24008002qvg.11.1635912240400; 
 Tue, 02 Nov 2021 21:04:00 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:04:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/10] tests/tcg: Add arm and aarch64 pc alignment tests
Date: Wed,  3 Nov 2021 00:03:52 -0400
Message-Id: <20211103040352.373688-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eFPc4GBs3CMl

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/pcalign-a64.c   | 37 +++++++++++++++++++++++++
 tests/tcg/arm/pcalign-a32.c       | 46 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +--
 tests/tcg/arm/Makefile.target     |  4 +++
 4 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c

diff --git a/tests/tcg/aarch64/pcalign-a64.c b/tests/tcg/aarch64/pcalign-a64.c
new file mode 100644
index 0000000000..6b9277f919
--- /dev/null
+++ b/tests/tcg/aarch64/pcalign-a64.c
@@ -0,0 +1,37 @@
+/* Test PC misalignment exception */
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <stdio.h>
+
+static void *expected;
+
+static void sigbus(int sig, siginfo_t *info, void *vuc)
+{
+    assert(info->si_code == BUS_ADRALN);
+    assert(info->si_addr == expected);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    void *tmp;
+
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+
+    if (sigaction(SIGBUS, &sa, NULL) < 0) {
+        perror("sigaction");
+        return EXIT_FAILURE;
+    }
+
+    asm volatile("adr %0, 1f + 1\n\t"
+                 "str %0, %1\n\t"
+                 "br  %0\n"
+                 "1:"
+                 : "=&r"(tmp), "=m"(expected));
+    abort();
+}
diff --git a/tests/tcg/arm/pcalign-a32.c b/tests/tcg/arm/pcalign-a32.c
new file mode 100644
index 0000000000..3c9c8cc97b
--- /dev/null
+++ b/tests/tcg/arm/pcalign-a32.c
@@ -0,0 +1,46 @@
+/* Test PC misalignment exception */
+
+#ifdef __thumb__
+#error "This test must be compiled for ARM"
+#endif
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <stdio.h>
+
+static void *expected;
+
+static void sigbus(int sig, siginfo_t *info, void *vuc)
+{
+    assert(info->si_code == BUS_ADRALN);
+    assert(info->si_addr == expected);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    void *tmp;
+
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+
+    if (sigaction(SIGBUS, &sa, NULL) < 0) {
+        perror("sigaction");
+        return EXIT_FAILURE;
+    }
+
+    asm volatile("adr %0, 1f + 2\n\t"
+                 "str %0, %1\n\t"
+                 "bx  %0\n"
+                 "1:"
+                 : "=&r"(tmp), "=m"(expected));
+
+    /*
+     * From v8, it is CONSTRAINED UNPREDICTABLE whether BXWritePC aligns
+     * the address or not.  If so, we can legitimately fall through.
+     */
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 2c05c90d17..1d967901bd 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -8,8 +8,8 @@ VPATH 		+= $(ARM_SRC)
 AARCH64_SRC=$(SRC_PATH)/tests/tcg/aarch64
 VPATH 		+= $(AARCH64_SRC)
 
-# Float-convert Tests
-AARCH64_TESTS=fcvt
+# Base architecture tests
+AARCH64_TESTS=fcvt pcalign-a64
 
 fcvt: LDFLAGS+=-lm
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 5ab59ed6ce..f509d823d4 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -29,6 +29,10 @@ run-fcvt: fcvt
 	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
+# PC alignment test
+ARM_TESTS += pcalign-a32
+pcalign-a32: CFLAGS+=-marm
+
 ifeq ($(CONFIG_ARM_COMPATIBLE_SEMIHOSTING),y)
 
 # Semihosting smoke test for linux-user
-- 
2.25.1

