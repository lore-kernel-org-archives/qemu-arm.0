Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D83EE9B25A
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 12:12:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vurFm-0005jV-Lt; Tue, 24 Feb 2026 07:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vurFJ-0005aO-8n
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:10:34 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vurFF-0005t0-DB
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:10:32 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-658b6757f7fso1550445a12.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 04:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771935020; x=1772539820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2r5F7G6zukd8hzqhZtnhQrq7IzbWlPfcE0ATMILzLqc=;
 b=zxFXRIFJfskH2xi21BSQOAzQyqeUv1vcxL+5whennNUtt3Sy64u8PEGZ4Uhf9flzaA
 2YxAeoxEkEoZeF9mV60qxRb6TGA1IftgNsrzFaJFpTtSSkftTiPUUeNDx2c03vs9qQHN
 yhHEo2ZlQAeJtpk5hA0MniStH8KBEQhIucSS9c+k+dFgeePEL/jRXZpkO8n5husm06je
 T2S8Vo0UzWRSwdINKOux6Yfv+o91nyZBFwAVhMrMjhrrvZSBpd9GVK3d2EqCwQXbcBgc
 h9i8qenAeKIssJAxbeiDwbQDTKQ6C4Go/3XceaD4/b+AcJ8DiBrwajByfHbJI6escQtJ
 OQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771935020; x=1772539820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2r5F7G6zukd8hzqhZtnhQrq7IzbWlPfcE0ATMILzLqc=;
 b=SEWwnPmZ1VI9bGj666wsMcVv4tbg470GatMCkVjNg8GuUAYuKpPra8JIl/avemTTY8
 gdVg/od9EaKC/BKC/nxbqoZdpF4+Kof9/CCNA8pe6JPr6EJE0WF17SeAheciqxhf8JEt
 zg7VigClh366vkjmL3nJjPLDOB4S6csUjBnfb+gE5TzMjXicQZOBLWbs0czWCOAnMy5u
 dnqR06sITlRv90+2Un6RSSm3E0Z2ORCGz5j1I4fzaR2xtSb3VHUbsG9MVRV/skDQxEIL
 PleoJKtga8G5IMojDN5ZMe+3VXJQ2yhvW1NNmhgtUTQRJSzLoC8Wualfd5AmhAe4NWnQ
 wsjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlmaCnejWXB63QkdESksVV57lQu55fA+ojyD9+6IgneKJdVx5I5AbR7p+m7ZnyRyWj/EMvoMeU1Q==@nongnu.org
X-Gm-Message-State: AOJu0YxbR3AvqFGCz2W3veRh0tBQmfdX+5pEGCI6P4REXl8eWP1KaRzO
 GiQ9lHGtYRgvVJnqKZ7mVkhUIy7RhxpjZ0CoGMq5tWibmzsP/MOgUDe05JA0V/0QHUaN/T7lpwt
 TdWQh
X-Gm-Gg: ATEYQzynVez/+Hmo+1Vp7mvSrugFmoLoQ5O4cam8iQqrorNdlkCHPqcXP3rzfCjrA5M
 IDxlDA8HMEIzObYvbxfQ8n5nYtyjsvKynz/FukBagYts6UI6jTHQoYUUiIqj41x81ALQt0XFyCV
 9s2WaHMcDp9ODzv5a28+yOOevHS+6vS/TJxzMzaiJr31VnLMXC8D/UzTgvjcgP6aG86fwyN9tLU
 lBUdLRZxCjqIW2os9oytaP0M6wLmJJcS6LtHt/IKzEQJUsDL4uM/LhdAVe17b/Weima7/gfMVyh
 CkTpxO0XMqKteGrtkPB0LF4LzvUx5Rpssj776rEvPMNsFYE3GT279X8vmPQRClhzvdBQCFSqrzM
 adFPbVChVDBrkKcwT6ufI3cz1iIVebBFmuhD7AQKBiYe2y/L9+/eMrpsrjCzyowzICM8Q4Fib4U
 ACvpVQiTRx/FrdDMJFqmN29Vg=
X-Received: by 2002:a05:6402:3581:b0:658:b9d8:1fbb with SMTP id
 4fb4d7f45d1cf-65ea4eb4ec6mr7382983a12.10.1771935020411; 
 Tue, 24 Feb 2026 04:10:20 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eab9a0844sm3531655a12.6.2026.02.24.04.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 04:10:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 261C65F8D5;
 Tue, 24 Feb 2026 12:10:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 eca <noreply@eca.dev>
Subject: [PATCH 6/8] tests/tcg/aarch64: Add WFX instructions system test
Date: Tue, 24 Feb 2026 12:10:12 +0000
Message-ID: <20260224121014.279248-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224121014.279248-1-alex.bennee@linaro.org>
References: <20260224121014.279248-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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

This commit adds a new system-mode TCG test to verify the behavior of
WFI, WFE, WFIT, and WFET instructions on AArch64.

The test ensures:
- WFI correctly wakes on a timer interrupt.
- WFE returns immediately if the event register is set (via SEV).
- WFIT and WFET correctly sleep until the specified timeout.

🤖 Generated with [eca](https://eca.dev)

Co-Authored-By: eca <noreply@eca.dev>

---
ajb:
  - removed an excess setting of QEMU_OPTS in the Makefile
---
 tests/tcg/aarch64/system/wfx.c            | 113 ++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |   2 +
 2 files changed, 115 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/wfx.c

diff --git a/tests/tcg/aarch64/system/wfx.c b/tests/tcg/aarch64/system/wfx.c
new file mode 100644
index 00000000000..59436c381fd
--- /dev/null
+++ b/tests/tcg/aarch64/system/wfx.c
@@ -0,0 +1,113 @@
+/*
+ * WFX Instructions Test (WFI, WFE, WFIT, WFET)
+ *
+ * Copyright (c) 2024 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdint.h>
+#include <minilib.h>
+
+#define __stringify_1(x...) #x
+#define __stringify(x...)   __stringify_1(x)
+
+#define read_sysreg(r) ({                                           \
+            uint64_t __val;                                         \
+            asm volatile("mrs %0, " __stringify(r) : "=r" (__val)); \
+            __val;                                                  \
+})
+
+#define write_sysreg(r, v) do {                     \
+        uint64_t __val = (uint64_t)(v);             \
+        asm volatile("msr " __stringify(r) ", %x0"  \
+                 : : "rZ" (__val));                 \
+} while (0)
+
+#define isb() asm volatile("isb" : : : "memory")
+#define sev() asm volatile("sev" : : : "memory")
+#define wfi() asm volatile("wfi" : : : "memory")
+#define wfe() asm volatile("wfe" : : : "memory")
+#define wfit(reg) asm volatile("wfit %0" : : "r" (reg) : "memory")
+#define wfet(reg) asm volatile("wfet %0" : : "r" (reg) : "memory")
+
+static void wait_ticks(uint64_t ticks)
+{
+    uint64_t start = read_sysreg(cntvct_el0);
+    while ((read_sysreg(cntvct_el0) - start) < ticks) {
+        /* spin */
+    }
+}
+
+int main(void)
+{
+    uint64_t start, end, elapsed;
+    uint64_t timeout;
+
+    ml_printf("WFX Test\n");
+
+    /* 1. Test WFI with timer interrupt */
+    ml_printf("Testing WFI...");
+    /* Setup virtual timer to fire in 100000 ticks (~2ms at 50MHz) */
+    start = read_sysreg(cntvct_el0);
+    write_sysreg(cntv_tval_el0, 100000);
+    write_sysreg(cntv_ctl_el0, 1); /* Enable timer, no mask */
+    isb();
+
+    /*
+     * We don't have a full interrupt handler, but WFI should wake up
+     * when the interrupt is pending even if we have it masked at the CPU.
+     * PSTATE.I is set by boot code.
+     */
+    wfi();
+    end = read_sysreg(cntvct_el0);
+    elapsed = end - start;
+    if (elapsed < 100000) {
+        ml_printf("FAILED: WFI woke too early (%ld ticks)\n", elapsed);
+        return 1;
+    }
+    ml_printf("PASSED (elapsed %ld ticks)\n", elapsed);
+    write_sysreg(cntv_ctl_el0, 0); /* Disable timer */
+
+    /* 2. Test WFE and SEV */
+    ml_printf("Testing WFE/SEV...");
+    sev(); /* Set event register */
+    start = read_sysreg(cntvct_el0);
+    wfe(); /* Should return immediately */
+    end = read_sysreg(cntvct_el0);
+    elapsed = end - start;
+    if (elapsed > 1000) { /* Should be very fast */
+        ml_printf("FAILED: WFE slept despite SEV (%ld ticks)\n", elapsed);
+        return 1;
+    }
+    ml_printf("PASSED\n");
+
+    /* 3. Test WFIT */
+    ml_printf("Testing WFIT...");
+    start = read_sysreg(cntvct_el0);
+    timeout = start + 200000;
+    wfit(timeout);
+    end = read_sysreg(cntvct_el0);
+    elapsed = end - start;
+    if (elapsed < 200000) {
+        ml_printf("FAILED: WFIT woke too early (%ld ticks)\n", elapsed);
+        return 1;
+    }
+    ml_printf("PASSED (elapsed %ld ticks)\n", elapsed);
+
+    /* 4. Test WFET */
+    ml_printf("Testing WFET...");
+    start = read_sysreg(cntvct_el0);
+    timeout = start + 200000;
+    wfet(timeout);
+    end = read_sysreg(cntvct_el0);
+    elapsed = end - start;
+    if (elapsed < 200000) {
+        ml_printf("FAILED: WFET woke too early (%ld ticks)\n", elapsed);
+        return 1;
+    }
+    ml_printf("PASSED (elapsed %ld ticks)\n", elapsed);
+
+    ml_printf("ALL WFX TESTS PASSED\n");
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index f7a7d2b800f..84342c52cd7 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -102,6 +102,8 @@ run-pauth-3:
 	$(call skip-test, "RUN of pauth-3", "not built")
 endif
 
+wfx: CFLAGS += -march=armv8.7-a
+
 ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
 QEMU_MTE_ENABLED_MACHINE=-M virt,mte=on -cpu max -display none
 QEMU_OPTS_WITH_MTE_ON = $(QEMU_MTE_ENABLED_MACHINE) $(QEMU_BASE_ARGS) -kernel
-- 
2.47.3


