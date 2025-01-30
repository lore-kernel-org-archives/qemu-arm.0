Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181820njb;
        Thu, 30 Jan 2025 10:23:17 -0800 (PST)
X-Received: by 2002:a5d:64c4:0:b0:38b:f4e6:21aa with SMTP id ffacd0b85a97d-38c5a956b96mr3068776f8f.5.1738261397297;
        Thu, 30 Jan 2025 10:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261397; cv=none;
        d=google.com; s=arc-20240605;
        b=iv7QOlvzUlifv+ZUyTlJ2zu7QSa9FpKq6qVM3/GwWT0nZwj16p0NOIM8WKyV7vdJRx
         rw6G4E9s11oA1/fUhCl1JfTiceN0Zp3xau9u/ayR62uAfXkvPSd121rpGxoZR52UuGwk
         Z0IA5Fxe81s+G9NhLnWtHKFvDt1NOiIqE8ohK9t1IWxr0ir7Btuz/EAOFf2RVdJEA/Tl
         HJb1TwdmyIFdyxBbvcB4ez422vI3Hr9GqlE4PH4GAA/awg5fJY9GByQQBiK7nApIuCW9
         UfNt1K5MNIMQkmLrv55XUH+UFD0jsvXvQARqySnYb8UbNOTEX3sRuRbfuEVahfoQAmHu
         oPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PQ3INqN7YHVgBd+O3rmiUMiDsje4n5n7QZ4vk3TY7Qg=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=T1CIoLC+n1yNFusK54FTyt625sJuA2JXULlloCM47ua9U+q9BlHFbQ5L3FvoY37U7h
         hlggI4mHbsVLEuwIs06D8IqPSezGVJska6joHu6VwkzzboWdZnRZzRCB+H1PNK4RKX8R
         g8rU7mCpfMwq+dqLeDUdbz+g5OHjqrHrZseBqgHHye26nFpeVqVRlF7FfgYxGEf9xEd7
         Sj2VE+iUZbENIRv9/rb7qDyHwaB+lAKURk8Xa3TcfMAMAGdThYCRuYZuzVDNQmoSNEzM
         kAkBmXsMmvb660I3AH7uM2dzQ2l5PboYdrIHufFGmJc1VAUjQA8g6T4gXIzIZYO7OYy4
         TIUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwXeECRz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c53a1bf20sor1247337f8f.2.2025.01.30.10.23.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwXeECRz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261397; x=1738866197; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQ3INqN7YHVgBd+O3rmiUMiDsje4n5n7QZ4vk3TY7Qg=;
        b=nwXeECRzgJMOljHtR+UHxrO6OXUJIhxTyQ5l6Ve2XvuKxcJ36hX2lFU9ZzUkitoFh1
         LOhd2COTYRehSyD43hzi/GrkCPm+Q0sJy/dTRk7rHhQDJoF1DoFOInqUmeHzaN00z/cl
         orudHuqqYgRztMWeAYibt/Lo09FiwuUDWQj8NhYw2Kg9iSJsm9GhpJ/rD8g+PvDrH3Ya
         P1IKDnHGAiZGlW6yALuFp1sRGbv448YnjOATi+GyfSL8npBlDG/1sQIKD3Nz0YoZlCjm
         nq16MlQWzjA9boitDIei7GU/xNxEcrRNISu3IPOK9FVRXcPXGmyYaeDrd/2XuPHa3jPE
         93uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261397; x=1738866197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQ3INqN7YHVgBd+O3rmiUMiDsje4n5n7QZ4vk3TY7Qg=;
        b=uxbpQOhL4TN4EvJcIYQ6t5oyFaf12D7wGLRb3a8Koqz8Qq2aTMfZbdySxco+FUmQDw
         Xj2LACK8o55J+3nGtg/2ir607BCsoiaDxowo71Wnv//zuksRat8TrNMPv1CCepQuOXQu
         qn6RRFUG7OR2k5xA/yCO0nQ8kltFfPrbllaAoAZwCxdLMqNILPgNV71pWu9o32EuCXKd
         vEyLiB0frWOVwC6t9rw63LDooovUAK7kE5Ca0EWeTZFYIJqYerrXELGzhIR70H24a8/O
         nt6IE+EMQ5oL6/Td7itbAbxYs8P7No+B8wTSUcFaCwqhZBYfsKa4IWE90q9gcaDgNrzG
         OxOQ==
X-Gm-Message-State: AOJu0YxY0L1nwor61XYePzQhoM1oj5FqYK6fwFLDe51vT+Ij4s3LFSux
	tsfM1zUhIflfIVklcHXI8fbTy6yTjbExSYab21wBCRg3ttJ1dc0FwoRCunG3g2v31g==
X-Gm-Gg: ASbGncsYawm5BJgDfN0VJmfLcM1UWZgiphlLrSEs7pgi0jw6eMU8yRSsYSIlmT6Eilj
	/B4SXEH6W9MDCh+0clk13ev71VmrHB5+Wm4M8heooOuFnQNntkqZarWvwXiD9/qH40x8+jPpiBL
	xRONQXktLnUa571uCIMSF9985giVLGd+HxHzBFfl1S79FbOQS2oyHFDWiahqWxyul4BdPX6zKUj
	5O6ZYFVGv6qsDMAJylhH1xIs/J8QweOU6O0Zso3xRDfp2FFtDEw1MmPZFQk0RxovPqwYjVBZaNc
	+BB2DJedEF04ZhbpOkOmpw==
X-Google-Smtp-Source: AGHT+IFk46o9MJfRxDQ5fp1zop2gX0pBdlLuXLQqomMqheDgghI/upyTVaZIVnOv9Ncrv7Wp4oLxvQ==
X-Received: by 2002:a05:6000:1fae:b0:38a:a019:30dd with SMTP id ffacd0b85a97d-38c5a96f0b7mr3987385f8f.8.1738261396692;
        Thu, 30 Jan 2025 10:23:16 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 05/14] target/arm: Make CP_ACCESS_TRAPs to AArch32 EL3 be Monitor traps
Date: Thu, 30 Jan 2025 18:23:00 +0000
Message-Id: <20250130182309.717346-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yIexgmjOvi3k

In system register access pseudocode the common pattern for
AArch32 registers with access traps to EL3 is:

at EL1 and EL2:
  if HaveEL(EL3) && !ELUsingAArch32(EL3) && (SCR_EL3.TERR == 1) then
     AArch64.AArch32SystemAccessTrap(EL3, 0x03);
  elsif HaveEL(EL3) && ELUsingAArch32(EL3) && (SCR.TERR == 1) then
     AArch32.TakeMonitorTrapException();
at EL3:
  if (PSTATE.M != M32_Monitor) && (SCR.TERR == 1) then
     AArch32.TakeMonitorTrapException();

(taking as an example the ERRIDR access pseudocode).

This implements the behaviour of (in this case) SCR.TERR that
"Accesses to the specified registers from modes other than Monitor
mode generate a Monitor Trap exception" and of SCR_EL3.TERR that
"Accesses of the specified Error Record registers at EL2 and EL1
are trapped to EL3, unless the instruction generates a higher
priority exception".

In QEMU we don't implement this pattern correctly in two ways:
 * in access_check_cp_reg() we turn the CP_ACCESS_TRAP_EL3 into
   an UNDEF, not a trap to Monitor mode
 * in the access functions, we check trap bits like SCR.TERR
   only when arm_current_el(env) < 3 -- this is correct for
   AArch64 EL3, but misses the "trap non-Monitor-mode execution
   at EL3 into Monitor mode" case for AArch32 EL3

In this commit we fix the first of these two issues, by
making access_check_cp_reg() handle CP_ACCESS_TRAP_EL3
as a Monitor trap. This is a kind of exception that we haven't
yet implemented(!), so we need a new EXCP_MON_TRAP for it.

This diverges from the pseudocode approach, where every access check
function explicitly checks for "if EL3 is AArch32" and takes a
monitor trap; if we wanted to be closer to the pseudocode we could
add a new CP_ACCESS_TRAP_MONITOR and make all the accessfns use it
when appropriate.  But because there are no non-standard cases in the
pseudocode (i.e.  where either it raises a Monitor trap that doesn't
correspond to an AArch64 SystemAccessTrap or where it raises a
SystemAccessTrap that doesn't correspond to a Monitor trap), handling
this all in one place seems less likely to result in future bugs
where we forgot again about this special case when writing an
accessor.

(The cc of stable here is because "hw/intc/arm_gicv3_cpuif: Don't
downgrade monitor traps for AArch32 EL3" which is also cc:stable
will implicitly use the new EXCP_MON_TRAP code path.)

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/helper.c        | 11 +++++++++++
 target/arm/tcg/op_helper.c | 13 ++++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2213c277348..4cb672c120b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -62,6 +62,7 @@
 #define EXCP_NMI            26
 #define EXCP_VINMI          27
 #define EXCP_VFNMI          28
+#define EXCP_MON_TRAP       29   /* AArch32 trap to Monitor mode */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5d9eca35c04..c5cd27b249f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9684,6 +9684,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_NMI] = "NMI",
             [EXCP_VINMI] = "Virtual IRQ NMI",
             [EXCP_VFNMI] = "Virtual FIQ NMI",
+            [EXCP_MON_TRAP] = "Monitor Trap",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -10250,6 +10251,16 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         mask = CPSR_A | CPSR_I | CPSR_F;
         offset = 0;
         break;
+    case EXCP_MON_TRAP:
+        new_mode = ARM_CPU_MODE_MON;
+        addr = 0x04;
+        mask = CPSR_A | CPSR_I | CPSR_F;
+        if (env->thumb) {
+            offset = 2;
+        } else {
+            offset = 4;
+        }
+        break;
     default:
         cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
         return; /* Never happens.  Keep compiler happy.  */
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 1161d301b71..1ba727e8e9f 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -758,6 +758,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, key);
     CPAccessResult res = CP_ACCESS_OK;
     int target_el;
+    uint32_t excp;
 
     assert(ri != NULL);
 
@@ -851,8 +852,18 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
     }
 
  fail:
+    excp = EXCP_UDEF;
     switch (res & ~CP_ACCESS_EL_MASK) {
     case CP_ACCESS_TRAP:
+        /*
+         * If EL3 is AArch32 then there's no syndrome register; the cases
+         * where we would raise a SystemAccessTrap to AArch64 EL3 all become
+         * raising a Monitor trap exception. (Because there's no visible
+         * syndrome it doesn't matter what we pass to raise_exception().)
+         */
+        if ((res & CP_ACCESS_EL_MASK) == 3 && !arm_el_is_aa64(env, 3)) {
+            excp = EXCP_MON_TRAP;
+        }
         break;
     case CP_ACCESS_TRAP_UNCATEGORIZED:
         /* Only CP_ACCESS_TRAP traps are direct to a specified EL */
@@ -888,7 +899,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         g_assert_not_reached();
     }
 
-    raise_exception(env, EXCP_UDEF, syndrome, target_el);
+    raise_exception(env, excp, syndrome, target_el);
 }
 
 const void *HELPER(lookup_cp_reg)(CPUARMState *env, uint32_t key)
-- 
2.34.1
