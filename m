Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276880ejb;
        Sat, 20 May 2023 09:29:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5k2VjvJGMMONtF4kzKMLpbxrh5ZaPTHK/8Z0ZFlvJGDlMeOZ5NoZaq5PGih0DbMWNZe53P
X-Received: by 2002:ac8:5747:0:b0:3f5:3991:97a5 with SMTP id 7-20020ac85747000000b003f5399197a5mr11081879qtx.54.1684600189131;
        Sat, 20 May 2023 09:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600189; cv=none;
        d=google.com; s=arc-20160816;
        b=mVpROiprnET2SMIMgnMTkjpY2hPGcVTRHDvVY/mFV3OD0ZeGnfifO4xGw7huYGH4GX
         6gu02cEG9Euxis4OGJ9jE3umXeuiuyxRg32WoK6xmMpgPo6UUVmGC8Q4JtD9j0Y0WwmE
         EJmkMIypR5TclKcAhA5VF0+JoVYZkHV9mPubth7LdxxTprWU9CbJ2RCCFbkCUa7zh7oM
         EM2d4j4E4xRj/18bhztINnJWa0tYUJJTf14TT0PcyhWJHJSE/E0/05ouasHrKaYKPvSy
         +CDPkagldVTYMSaU50ptw3dKXyk7i/s4CpqIs32J7ISyhzOfwv7oJ1NLAE3X1YvyAQZX
         hjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=frmGIXxr84Ww41VQFYmyyhkxPgV+QZOjqj6i0A0DQ+A=;
        b=NZMWT+AO6bOWf9SfDJQy6qKGoc7VxpyBF66eibH3d8GxIYxXuIF8LBY8eDBavT33Dl
         tPP2PRCoVjnILv7ED0P1DtMAGe1xjlsh8DVZrbSVWK18ZR93wV/DsJdOdWw6iENIdWTK
         jyg1Y3/RaCTpOgsO1K23HMc8lwpD3fXVvS11ysA2zpmREyLHpUzUkuZnzslP5NC42zVX
         KFxbu6fAr8ZN2fFQg2TW/h4irBQbvNXW5UTNdwLyX5JxtZdw0/eqMDvG1qH2WQ6NqiS9
         Y/XSpagRnjGGaknMf3IBtKX8o+BPftzTo49WBNXqEXa725HvYRm/FnEhAaTH94pAcRkf
         1wug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j0ddd/BW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05622a010900b003ef37486d9csi1308495qtw.321.2023.05.20.09.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j0ddd/BW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PPq-0003aG-2o; Sat, 20 May 2023 12:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPn-0003Xz-Ta
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:43 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPl-00034v-H5
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:43 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-528dd896165so3066269a12.2
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600000; x=1687192000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frmGIXxr84Ww41VQFYmyyhkxPgV+QZOjqj6i0A0DQ+A=;
 b=j0ddd/BWfqAwWCBp9V2e2w0sN/fZcGA7IrEFyVG8TlViwstyE6fti3rUSDbLBXv1sA
 ZL9n9Aa/qGl9Li5knkAJo40OmALD8cvNfUz8Xj53+TnABgZP/7SDvnC0x4I5vRhOt3WQ
 cHW57QotbSIEgcOYw4YoI9Y/z1Oi71nMUeFSBrKcOZP7Gnj9nAdBF99L3oispDWCzW0F
 yj65wTjbo29g4W/C3BjJrJkAc76yLpNqOZ19FViSwdE4lLSXmTaAtE7XF8yiIrwW6Ilz
 Z4JL84lDFC13wzmLDXWoK7KbW9VUTfNSh9gW+UlroD/klNy58v3ImMdBdKr7+iLc3QAo
 EOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600000; x=1687192000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frmGIXxr84Ww41VQFYmyyhkxPgV+QZOjqj6i0A0DQ+A=;
 b=IFmt5Y73OHeh3nGCJgGvhS5bOR+x+eNfzPU3d5etPXf6cniDrfv7ZMPNIFzOk3pZkV
 saEICaaph4vDVnK/rW8s1FSuZEtygU0AI3w/Sctnmb2zjbALZHaNQ4uLGbJlU8LGHTv/
 HmXNwgv8aL1rKitkdC6aMYSj2cw/f4/nisZZqwaXhNDra3M747Rk8+lL18Ut8RNakgl/
 SUhRCR7pI8EKwk5nOCJEeZezbJDDeJ3VcgqVhsESqy8hje4Mq83vswOnnI5LxkbIwbuA
 A/wy5or/yMW22wpW1+8vXb1/KQ5IkZkh29lViAutP3+pM2IMKaOH05ODoz2/2LdGposJ
 S5tw==
X-Gm-Message-State: AC+VfDwDWqDkj+tFu+rJdRaRWZMijEBF/I0AtIsmBiWe2km9EWRyqbzC
 h/uMn+c9U7tqOu/3xguZDAXAAg==
X-Received: by 2002:a17:902:c944:b0:1a6:46f2:4365 with SMTP id
 i4-20020a170902c94400b001a646f24365mr7895420pla.30.1684599999734; 
 Sat, 20 May 2023 09:26:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 04/27] tcg/i386: Use host/cpuinfo.h
Date: Sat, 20 May 2023 09:26:11 -0700
Message-Id: <20230520162634.3991009-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +1hQGL5xlKTH

Use the CPUINFO_* bits instead of the individual boolean
variables that we had been using.  Remove all of the init
code that was moved over to cpuinfo-i386.c.

Note that have_avx512* check both AVX512{F,VL}, as we had
previously done during tcg_target_init.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  28 +++++----
 tcg/i386/tcg-target.c.inc | 123 ++------------------------------------
 2 files changed, 22 insertions(+), 129 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 0b5a2c68c5..0106946996 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -25,6 +25,8 @@
 #ifndef I386_TCG_TARGET_H
 #define I386_TCG_TARGET_H
 
+#include "host/cpuinfo.h"
+
 #define TCG_TARGET_INSN_UNIT_SIZE  1
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 31
 
@@ -111,16 +113,22 @@ typedef enum {
 # define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_BY_REF
 #endif
 
-extern bool have_bmi1;
-extern bool have_popcnt;
-extern bool have_avx1;
-extern bool have_avx2;
-extern bool have_avx512bw;
-extern bool have_avx512dq;
-extern bool have_avx512vbmi2;
-extern bool have_avx512vl;
-extern bool have_movbe;
-extern bool have_atomic16;
+#define have_bmi1         (cpuinfo & CPUINFO_BMI1)
+#define have_popcnt       (cpuinfo & CPUINFO_POPCNT)
+#define have_avx1         (cpuinfo & CPUINFO_AVX1)
+#define have_avx2         (cpuinfo & CPUINFO_AVX2)
+#define have_movbe        (cpuinfo & CPUINFO_MOVBE)
+#define have_atomic16     (cpuinfo & CPUINFO_ATOMIC_VMOVDQA)
+
+/*
+ * There are interesting instructions in AVX512, so long as we have AVX512VL,
+ * which indicates support for EVEX on sizes smaller than 512 bits.
+ */
+#define have_avx512vl     ((cpuinfo & CPUINFO_AVX512VL) && \
+                           (cpuinfo & CPUINFO_AVX512F))
+#define have_avx512bw     ((cpuinfo & CPUINFO_AVX512BW) && have_avx512vl)
+#define have_avx512dq     ((cpuinfo & CPUINFO_AVX512DQ) && have_avx512vl)
+#define have_avx512vbmi2  ((cpuinfo & CPUINFO_AVX512VBMI2) && have_avx512vl)
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div2_i32         1
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 8b9a5f00e5..bfe9d98b7e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -158,42 +158,14 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 # define SOFTMMU_RESERVE_REGS  0
 #endif
 
-/* The host compiler should supply <cpuid.h> to enable runtime features
-   detection, as we're not going to go so far as our own inline assembly.
-   If not available, default values will be assumed.  */
-#if defined(CONFIG_CPUID_H)
-#include "qemu/cpuid.h"
-#endif
-
 /* For 64-bit, we always know that CMOV is available.  */
 #if TCG_TARGET_REG_BITS == 64
-# define have_cmov 1
-#elif defined(CONFIG_CPUID_H)
-static bool have_cmov;
+# define have_cmov      true
 #else
-# define have_cmov 0
-#endif
-
-/* We need these symbols in tcg-target.h, and we can't properly conditionalize
-   it there.  Therefore we always define the variable.  */
-bool have_bmi1;
-bool have_popcnt;
-bool have_avx1;
-bool have_avx2;
-bool have_avx512bw;
-bool have_avx512dq;
-bool have_avx512vbmi2;
-bool have_avx512vl;
-bool have_movbe;
-bool have_atomic16;
-
-#ifdef CONFIG_CPUID_H
-static bool have_bmi2;
-static bool have_lzcnt;
-#else
-# define have_bmi2 0
-# define have_lzcnt 0
+# define have_cmov      (cpuinfo & CPUINFO_CMOV)
 #endif
+#define have_bmi2       (cpuinfo & CPUINFO_BMI2)
+#define have_lzcnt      (cpuinfo & CPUINFO_LZCNT)
 
 static const tcg_insn_unit *tb_ret_addr;
 
@@ -3961,93 +3933,6 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 
 static void tcg_target_init(TCGContext *s)
 {
-#ifdef CONFIG_CPUID_H
-    unsigned a, b, c, d, b7 = 0, c7 = 0;
-    unsigned max = __get_cpuid_max(0, 0);
-
-    if (max >= 7) {
-        /* BMI1 is available on AMD Piledriver and Intel Haswell CPUs.  */
-        __cpuid_count(7, 0, a, b7, c7, d);
-        have_bmi1 = (b7 & bit_BMI) != 0;
-        have_bmi2 = (b7 & bit_BMI2) != 0;
-    }
-
-    if (max >= 1) {
-        __cpuid(1, a, b, c, d);
-#ifndef have_cmov
-        /* For 32-bit, 99% certainty that we're running on hardware that
-           supports cmov, but we still need to check.  In case cmov is not
-           available, we'll use a small forward branch.  */
-        have_cmov = (d & bit_CMOV) != 0;
-#endif
-
-        /* MOVBE is only available on Intel Atom and Haswell CPUs, so we
-           need to probe for it.  */
-        have_movbe = (c & bit_MOVBE) != 0;
-        have_popcnt = (c & bit_POPCNT) != 0;
-
-        /* There are a number of things we must check before we can be
-           sure of not hitting invalid opcode.  */
-        if (c & bit_OSXSAVE) {
-            unsigned bv = xgetbv_low(0);
-
-            if ((bv & 6) == 6) {
-                have_avx1 = (c & bit_AVX) != 0;
-                have_avx2 = (b7 & bit_AVX2) != 0;
-
-                /*
-                 * There are interesting instructions in AVX512, so long
-                 * as we have AVX512VL, which indicates support for EVEX
-                 * on sizes smaller than 512 bits.  We are required to
-                 * check that OPMASK and all extended ZMM state are enabled
-                 * even if we're not using them -- the insns will fault.
-                 */
-                if ((bv & 0xe0) == 0xe0
-                    && (b7 & bit_AVX512F)
-                    && (b7 & bit_AVX512VL)) {
-                    have_avx512vl = true;
-                    have_avx512bw = (b7 & bit_AVX512BW) != 0;
-                    have_avx512dq = (b7 & bit_AVX512DQ) != 0;
-                    have_avx512vbmi2 = (c7 & bit_AVX512VBMI2) != 0;
-                }
-
-                /*
-                 * The Intel SDM has added:
-                 *   Processors that enumerate support for Intel® AVX
-                 *   (by setting the feature flag CPUID.01H:ECX.AVX[bit 28])
-                 *   guarantee that the 16-byte memory operations performed
-                 *   by the following instructions will always be carried
-                 *   out atomically:
-                 *   - MOVAPD, MOVAPS, and MOVDQA.
-                 *   - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with VEX.128.
-                 *   - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when encoded
-                 *     with EVEX.128 and k0 (masking disabled).
-                 * Note that these instructions require the linear addresses
-                 * of their memory operands to be 16-byte aligned.
-                 *
-                 * AMD has provided an even stronger guarantee that processors
-                 * with AVX provide 16-byte atomicity for all cachable,
-                 * naturally aligned single loads and stores, e.g. MOVDQU.
-                 *
-                 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
-                 */
-                if (have_avx1) {
-                    __cpuid(0, a, b, c, d);
-                    have_atomic16 = (c == signature_INTEL_ecx ||
-                                     c == signature_AMD_ecx);
-                }
-            }
-        }
-    }
-
-    max = __get_cpuid_max(0x8000000, 0);
-    if (max >= 1) {
-        __cpuid(0x80000001, a, b, c, d);
-        /* LZCNT was introduced with AMD Barcelona and Intel Haswell CPUs.  */
-        have_lzcnt = (c & bit_LZCNT) != 0;
-    }
-#endif /* CONFIG_CPUID_H */
-
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
     if (TCG_TARGET_REG_BITS == 64) {
         tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
-- 
2.34.1

