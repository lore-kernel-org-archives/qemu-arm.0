Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2354963ejb;
        Mon, 20 Nov 2023 09:35:07 -0800 (PST)
X-Received: by 2002:adf:ea08:0:b0:32f:7c15:2ad7 with SMTP id q8-20020adfea08000000b0032f7c152ad7mr4949464wrm.38.1700501707780;
        Mon, 20 Nov 2023 09:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700501707; cv=none;
        d=google.com; s=arc-20160816;
        b=g/+wq6icJbEI2cK4r9Jvlj8GRCcsdTzgFaLJNkIrJvLd9utOHPm/oFvZ/DTc0dGdpB
         tNPtN3rQZ5TOg1MqRlR65f1BzzI/iJ91TX5ROn8vx75d0lu+Ima3pSXsWaHZ3WyIC8Ef
         vpTz59LM8yOZHWGrbTvoDxVcNOhQFk1QopcWTKe2vR40IYVbewjHrvvMumgQZL8mBTOT
         wFaQqpnhlybWm8M933hawmECxmnGht+lRj/YLgjvQPBEq5OZjt40P1WEb8ZSc6zIKBVv
         8GWQnP0p2bd51kckqNjTTHhe8rKRbqithe2iJqpL0Dk76zmDV56Wktq3vO7lojwKGM3a
         03Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=pxDVMDGr8B4qXH0/pCUMU+JxzeY5WrCdtQLxJO9oIRQ=;
        fh=KlbSfc2y1lBwVVuHB14St4FwSXfiQlN4tPIehUx9AdU=;
        b=WIjjYHvm+5RDk1bZb9hWr20u4JlGcT0GntCbyfIFhp+8rt0T0ZnGxYfR/WMu6Mg4uh
         IlW4kqTXro8GFuim3DEZhvEL+mFNcy2KmMfj7D9U6m3IUMAKn44q0PhahiinQt0ZeMZl
         G5vzZZIUC0PS8n7KiODQMdosSaY4l4hV8cJYoGG/rejQ6gFIwQVBmmZ5J2PkAZnJXpR3
         NqrKmRs9DYerUT4N/fdtvUBQnoGHk4gBySK84NaPXIagMGfTRYQ3GcHDDICe13NETefr
         5fCbk0uBM9kNxBvTAvfkMocIdQbJh5Adk/ez/2IxG2cFOF70lXrJRLeqcyzDu8hGOn8X
         YAjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmISzOTc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d5-20020adf9c85000000b0032fe005dee4sor1835965wre.0.2023.11.20.09.35.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Nov 2023 09:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmISzOTc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700501707; x=1701106507; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxDVMDGr8B4qXH0/pCUMU+JxzeY5WrCdtQLxJO9oIRQ=;
        b=kmISzOTcpQDVsvOE9d0zRY/V1ZtmFxeNYPBWPdIZ7LjEfcPuehAn3wh/p2aaYx8VC1
         zEiI/t5MMxwcGlo4v9Ns3iUk6O5hv7Djgfl8lp62Rq+J6KP7W8ygSuxLiccU3JTdl5bH
         b45Qe7js6Ld3vbxNM9RBbPr+ggvcO5WTQ7Fsnr1xxLgluVCGKV7gLb2R4KUGKuIUwPC8
         967m7CVGiQCCW4TRP3gxA78Idzfr8elFIVyZApG1CaO//BHqX+UqEqaaHb6WTR/k/SnH
         yOJw0ycKdyQYqQLizvW6QNi9DieM8gJwz4Qu79fe/hQfvF2pdjdA5U1a47fV2mQ6EtUn
         Rhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501707; x=1701106507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxDVMDGr8B4qXH0/pCUMU+JxzeY5WrCdtQLxJO9oIRQ=;
        b=k2HaSZSycOoucs/iAQ2fR1PFT0yk4U7fBHNEYGFEAlU81u+Fr6qSCNOaQ7VKtkzC6v
         sHmcbZHI1hyLZYXZq5sbVFiXs3dTlxLeKe62Jo0xJQ1wkSl72POxy6xWyWBYiJs4XmzY
         fQyfNXGTrfd8sF8OG77+s8PJRHZvsyc58Fex8eLXwZWzp55NHSah2PyA89SAsPQZgnNv
         X7sXDMfAA71oWD5l/NhsTZPywWK/4RBLXE5jndXBemSsd/nabk4a8Wm4ehSM9fhzEvkE
         U7WjjO95FkxiEJAvaTAgBq+OWVm8syNw+h0w6tLzuV+EnXuNyKKe0gErmIRCHSUsC//p
         da3w==
X-Gm-Message-State: AOJu0Yyk0ZvJ+5Bi4wE68yR5V7ZqlChd6XIN39h76lYcAgaK6i0gsUpr
	28yX0CIYN/zCG3LQ6HUKOVs61AHa
X-Google-Smtp-Source: AGHT+IHExRr+cegkf+W+Lwh470/nAIdg6gPffpWZXS/EEXp6XKSx4MPA4sYtw0hOSBAPLNHp3+ZwVg==
X-Received: by 2002:a5d:5f56:0:b0:332:c9ed:cc2c with SMTP id cm22-20020a5d5f56000000b00332c9edcc2cmr2339234wrb.3.1700501707346;
        Mon, 20 Nov 2023 09:35:07 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id d5-20020adfef85000000b0032fb46812c2sm11850633wro.12.2023.11.20.09.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:35:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Subject: [PATCH for-8.2] target/arm: Handle overflow in calculation of next timer tick
Date: Mon, 20 Nov 2023 17:35:06 +0000
Message-Id: <20231120173506.3729884-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BlQLIeDvFaV8

In commit edac4d8a168 back in 2015 when we added support for
the virtual timer offset CNTVOFF_EL2, we didn't correctly update
the timer-recalculation code that figures out when the timer
interrupt is next going to change state. We got it wrong in
two ways:
 * for the 0->1 transition, we didn't notice that gt->cval + offset
   can overflow a uint64_t
 * for the 1->0 transition, we didn't notice that the transition
   might now happen before the count rolls over, if offset > count

In the former case, we end up trying to set the next interrupt
for a time in the past, which results in QEMU hanging as the
timer fires continuously.

In the latter case, we would fail to update the interrupt
status when we are supposed to.

Fix the calculations in both cases.

The test case is Alex Bennée's from the bug report, and tests
the 0->1 transition overflow case.

Fixes: edac4d8a168 ("target-arm: Add CNTVOFF_EL2")
Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/60
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Thanks to Leonid for his recent patch which prodded me
into looking at this again. I preferred to fix both halves
of the if(), rather than just one, and I have thrown in
Alex's test case since it was conveniently to hand.
---
 target/arm/helper.c                       | 25 ++++++++++--
 tests/tcg/aarch64/system/vtimer.c         | 48 +++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  7 +++-
 3 files changed, 75 insertions(+), 5 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/vtimer.c

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff1970981ee..0430ae55edf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2646,11 +2646,28 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
         gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
 
         if (istatus) {
-            /* Next transition is when count rolls back over to zero */
-            nexttick = UINT64_MAX;
+            /*
+             * Next transition is when (count - offset) rolls back over to 0.
+             * If offset > count then this is when count == offset;
+             * if offset <= count then this is when count == offset + UINT64_MAX
+             * For the latter case we set nexttick to an "as far in future
+             * as possible" value and let the code below handle it.
+             */
+            if (offset > count) {
+                nexttick = offset;
+            } else {
+                nexttick = UINT64_MAX;
+            }
         } else {
-            /* Next transition is when we hit cval */
-            nexttick = gt->cval + offset;
+            /*
+             * Next transition is when (count - offset) == cval, i.e.
+             * when count == (cval + offset).
+             * If that would overflow, then again we set up the next interrupt
+             * for "as far in the future as possible" for the code below.
+             */
+            if (uadd64_overflow(gt->cval, offset, &nexttick)) {
+                nexttick = UINT64_MAX;
+            }
         }
         /*
          * Note that the desired next expiry time might be beyond the
diff --git a/tests/tcg/aarch64/system/vtimer.c b/tests/tcg/aarch64/system/vtimer.c
new file mode 100644
index 00000000000..42f2f7796c7
--- /dev/null
+++ b/tests/tcg/aarch64/system/vtimer.c
@@ -0,0 +1,48 @@
+/*
+ * Simple Virtual Timer Test
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <inttypes.h>
+#include <minilib.h>
+
+/* grabbed from Linux */
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
+int main(void)
+{
+    int i;
+
+    ml_printf("VTimer Test\n");
+
+    write_sysreg(cntvoff_el2, 1);
+    write_sysreg(cntv_cval_el0, -1);
+    write_sysreg(cntv_ctl_el0, 1);
+
+    ml_printf("cntvoff_el2=%lx\n", read_sysreg(cntvoff_el2));
+    ml_printf("cntv_cval_el0=%lx\n", read_sysreg(cntv_cval_el0));
+    ml_printf("cntv_ctl_el0=%lx\n", read_sysreg(cntv_ctl_el0));
+
+    /* Now read cval a few times */
+    for (i = 0; i < 10; i++) {
+        ml_printf("%d: cntv_cval_el0=%lx\n", i, read_sysreg(cntv_cval_el0));
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index b74a2534e38..d71659cc226 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -45,7 +45,8 @@ TESTS+=memory-sve
 
 # Running
 QEMU_BASE_MACHINE=-M virt -cpu max -display none
-QEMU_OPTS+=$(QEMU_BASE_MACHINE) -semihosting-config enable=on,target=native,chardev=output -kernel
+QEMU_BASE_ARGS=-semihosting-config enable=on,target=native,chardev=output
+QEMU_OPTS+=$(QEMU_BASE_MACHINE) $(QEMU_BASE_ARGS) -kernel
 
 # console test is manual only
 QEMU_SEMIHOST=-chardev stdio,mux=on,id=stdio0 -semihosting-config enable=on,chardev=stdio0 -mon chardev=stdio0,mode=readline
@@ -55,6 +56,10 @@ run-semiconsole: semiconsole
 run-plugin-semiconsole-with-%: semiconsole
 	$(call skip-test, $<, "MANUAL ONLY")
 
+# vtimer test needs EL2
+QEMU_EL2_MACHINE=-machine virt,virtualization=on,gic-version=2 -cpu cortex-a57 -smp 4
+run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_BASE_ARGS) -kernel
+
 # Simple Record/Replay Test
 .PHONY: memory-record
 run-memory-record: memory-record memory
-- 
2.34.1
