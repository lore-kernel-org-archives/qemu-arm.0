Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1304622ejc;
        Fri, 25 Aug 2023 03:47:47 -0700 (PDT)
X-Received: by 2002:a17:902:ed0b:b0:1bf:78d:5cd9 with SMTP id b11-20020a170902ed0b00b001bf078d5cd9mr13875712pld.67.1692960467582;
        Fri, 25 Aug 2023 03:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692960467; cv=none;
        d=google.com; s=arc-20160816;
        b=ccC0yqSP5tA4blv2SxPnCxKsCr2fbMZ3sKV9ADJ7pEK4Op7ahNCtgZM27bCoBE+6W4
         aQuLMdHudKQgqQDNL3cQz4XNH8YcJt2osSJMmIUo5uAt581XbeZRLGNG2kbVH2MrmFPm
         aTdL3VRG37c9QLyvf/THb5+rAiEuMNVfgoebBqc4tLL9/+wN2ZRfyyqL8GRx3TDslF4g
         jSFz0rSf3ibIHB8oTb/vJkEugy79LOTxbsW6AZdlKbt5NxeLU1FctgRq/u+RjS8WmxLp
         p1c5cCpwY9wfs7C1Io63QdRhSa2B+WiSKwtk7DQrvJ8FYvr/UrEFlC7R/39IROfzEf9S
         m/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9TxVNCt55j2RDXKCtEFmWtR8i3BWYROEgmzJcjpsl2I=;
        fh=8ofdNWWEjf4kZAJKfS4vu1J+LvZ/Z/0IiNtZxBjYGBc=;
        b=JqLFl6cGR8QgY9JO7+bfMaO15qxcqkU0rJ3vN2czRmqVmUsg3mLXl8Lk9bYYeXvF9C
         sFCgub3DahzwK5Xp9nyMgfY5MKpLfLp6yJ7Z2MmvP8iX51QJgLShkKF1RJ78ZPi2WOhf
         YbsXuxFfeB0/b4ZyLua6VXl7vTyq8YefxEdE651+hQcng8kVaUoANu01JOcRBUDLNxu0
         nNa5hrxokP2oQ2TAAwv/UTOLz2NMwUmwJsQJ1dmJ8KqLcfSRj+9DnBob81c0tbYDoKlp
         jydnRRtqigGuw/cC7X/Ns/PUWc8wzfR+eGJ0fowSdeKvmT8iqQgyPsqsTx45oM5+shDB
         Ir9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=f7J+4JAJ;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p6-20020a170902780600b001bde639b393sor614728pll.18.2023.08.25.03.47.47
        (Google Transport Security);
        Fri, 25 Aug 2023 03:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=f7J+4JAJ;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692960466; x=1693565266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TxVNCt55j2RDXKCtEFmWtR8i3BWYROEgmzJcjpsl2I=;
        b=f7J+4JAJzRwpnwsC71h3WVUJcMgRHtfGIcNmehYWs0HtDRYiHnmLlnUoUkuDQELYPm
         YqZAlR+gw38tzM0uYxzX8JyXGMRNGNPrH2WK8irVRFfySoBjeBQ+Nd/4lDJ5HqP0aAf/
         DNTL5d/2OcPpVho0byQ+ZLpShFnY8sA7ZiOEoburpgCFWjiWotA84T5bGZDIhUUy80BA
         ZZUIfW3bJ35yhr5fGLXh287bDxmt+jRANiubmrVEJC48yf+8plAM6/HDo0RIU14fv7Ld
         tVyxg6uADyK4zZv5MK9aAzagY04AFFByaWDPP9Qiin+EViGQf3PORdUgZ4gi06KiCTJN
         8SuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692960466; x=1693565266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TxVNCt55j2RDXKCtEFmWtR8i3BWYROEgmzJcjpsl2I=;
        b=eK8Z+w+KkHER/cyBZTT3pUfncmQPLqXoUAcC8UmyyK0++rqTN99l0afnSyLKCvInTq
         GZi7zBWaMVot/1xdz9i0iWAEWlJjQyw/+zaTEUuCYO3FNqf4C8ttMwUzElNp8OUvSAi+
         u1mEJTpEgRkM84w5H3dKUZ+1ynWM4NecaFWdpFwD4pduCsv+FJL32dTm855vLWKnrNgW
         v+Qy+onguE7loMKayRP6AGoVuGhkxIntc7S8EDKZyk9031YusXe/4zbTSH78MuIWjjF5
         FVkPOM67MSxM0/N2Byt14XuwQo9k6Aj6lT9kGhcsXGA0O9b3dnCVVDUYmW3LfeTUVEOC
         AyAg==
X-Gm-Message-State: AOJu0YyfA1FKwW1i2xncBj6FQ/FY3FUXzxlzZvt+1DV+4asAqQgdI550
	yueRZFN5WhDlarZ/5tLHTOihnvTxuCdRbQ==
X-Google-Smtp-Source: AGHT+IGwNQXBLkt/tZUfLHQDHKGVorrQMZwJmOPJDoJizzGzA2lRKzWccVtkUx9jmBzjATNGcohu4g==
X-Received: by 2002:a17:902:c18b:b0:1be:f2a1:22d8 with SMTP id d11-20020a170902c18b00b001bef2a122d8mr15134951pld.14.1692960466320;
        Fri, 25 Aug 2023 03:47:46 -0700 (PDT)
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from localhost.localdomain ([223.104.40.15])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b001b89891bfc4sm1346985plg.199.2023.08.25.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 03:47:45 -0700 (PDT)
From: Yeqi Fu <fufuyqqqqqq@gmail.com>
To: alex.bennee@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-devel@nongnu.org,
	Yeqi Fu <fufuyqqqqqq@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC v5 08/10] target/arm: Add support for native library calls
Date: Fri, 25 Aug 2023 18:45:24 +0800
Message-Id: <20230825104526.1754950-9-fufuyqqqqqq@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825104526.1754950-6-fufuyqqqqqq@gmail.com>
References: <20230825104526.1754950-6-fufuyqqqqqq@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 390275RgFH7l

This commit introduces support for native library calls on the
arm target. When encountering special instructions reserved
for native calls, this commit extracts the function name and
generates the corresponding native call.

Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
---
 configs/targets/aarch64-linux-user.mak |  1 +
 configs/targets/arm-linux-user.mak     |  1 +
 target/arm/tcg/translate-a64.c         | 31 ++++++++++++++++++++++++++
 target/arm/tcg/translate.c             | 28 +++++++++++++++++++++++
 target/arm/tcg/translate.h             |  5 +++++
 5 files changed, 66 insertions(+)

diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
index ba8bc5fe3f..5a8fd98cd9 100644
--- a/configs/targets/aarch64-linux-user.mak
+++ b/configs/targets/aarch64-linux-user.mak
@@ -4,3 +4,4 @@ TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/aarch
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+CONFIG_NATIVE_CALL=y
diff --git a/configs/targets/arm-linux-user.mak b/configs/targets/arm-linux-user.mak
index 7f5d65794c..f934fb82da 100644
--- a/configs/targets/arm-linux-user.mak
+++ b/configs/targets/arm-linux-user.mak
@@ -5,3 +5,4 @@ TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+CONFIG_NATIVE_CALL=y
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3baab6aa60..0cb9228a35 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -25,6 +25,8 @@
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
+#include "exec/cpu_ldst.h"
+#include "native/native.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
@@ -2400,6 +2402,10 @@ static bool trans_HLT(DisasContext *s, arg_i *a)
      * it is required for halting debug disabled: it will UNDEF.
      * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
      */
+    if (native_bypass_enabled() && (a->imm == 0xffff)) {
+        s->native_call_status = true;
+        return true;
+    }
     if (semihosting_enabled(s->current_el == 0) && a->imm == 0xf000) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
@@ -13392,6 +13398,24 @@ void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &op);
 }
 
+static void gen_native_call(CPUState *cpu, DisasContext *s, CPUARMState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    TCGv_i64 arg1 = tcg_temp_new_i64();
+    TCGv_i64 arg2 = tcg_temp_new_i64();
+    TCGv_i64 arg3 = tcg_temp_new_i64();
+    TCGv_i64 ret = tcg_temp_new_i64();
+    uint64_t func_tmp = translator_ldq_swap(env, &s->base, s->base.pc_next,
+                                            bswap_code(s->sctlr_b));
+    char *func_name = g2h(cpu, func_tmp);
+    tcg_gen_mov_i64(arg1, cpu_reg(s, 0));
+    tcg_gen_mov_i64(arg2, cpu_reg(s, 1));
+    tcg_gen_mov_i64(arg3, cpu_reg(s, 2));
+    gen_native_call_i64(func_name, ret, arg1, arg2, arg3);
+    tcg_gen_mov_i64(cpu_reg(s, 0), ret);
+#endif
+}
+
 /* Crypto three-reg SHA512
  *  31                   21 20  16 15  14  13 12  11  10  9    5 4    0
  * +-----------------------+------+---+---+-----+--------+------+------+
@@ -13950,6 +13974,13 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint64_t pc = s->base.pc_next;
     uint32_t insn;
 
+    if (native_bypass_enabled() && s->native_call_status) {
+        gen_native_call(cpu, s, env);
+        s->base.pc_next = pc + 8;
+        s->native_call_status = false;
+        return;
+    }
+
     /* Singlestep exceptions have the highest priority. */
     if (s->ss_active && !s->pstate_ss) {
         /* Singlestep state is Active-pending.
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 13c88ba1b9..d5eaed65f5 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -28,6 +28,8 @@
 #include "semihosting/semihost.h"
 #include "cpregs.h"
 #include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#include "native/native.h"
 
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
@@ -1125,6 +1127,21 @@ void gen_lookup_tb(DisasContext *s)
     s->base.is_jmp = DISAS_EXIT;
 }
 
+static void gen_native_call(CPUState *cpu, DisasContext *dc, CPUARMState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    TCGv_i32 arg1 = load_reg(dc, 0);
+    TCGv_i32 arg2 = load_reg(dc, 1);
+    TCGv_i32 arg3 = load_reg(dc, 2);
+    TCGv_i32 ret = tcg_temp_new_i32();
+    uint32_t func_tmp =
+        arm_ldl_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
+    char *func_name = g2h(cpu, func_tmp);
+    gen_native_call_i32(func_name, ret, arg1, arg2, arg3);
+    store_reg(dc, 0, ret);
+#endif
+}
+
 static inline void gen_hlt(DisasContext *s, int imm)
 {
     /* HLT. This has two purposes.
@@ -1139,6 +1156,10 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
+    if (native_bypass_enabled() && (imm == 0xffff)) {
+        s->native_call_status = true;
+        return;
+    }
     if (semihosting_enabled(s->current_el == 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
@@ -9329,6 +9350,13 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t pc = dc->base.pc_next;
     unsigned int insn;
 
+    if (native_bypass_enabled() && dc->native_call_status) {
+        gen_native_call(cpu, dc, env);
+        dc->base.pc_next = pc + 4;
+        dc->native_call_status = false;
+        return;
+    }
+
     /* Singlestep exceptions have the highest priority. */
     if (arm_check_ss_active(dc)) {
         dc->base.pc_next = pc + 4;
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d1cacff0b2..3854a801e6 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -157,6 +157,11 @@ typedef struct DisasContext {
     int c15_cpar;
     /* TCG op of the current insn_start.  */
     TCGOp *insn_start;
+    /*
+     * Indicate whether the next instruction is a native function call (true)
+     * or not (false).
+     */
+    bool native_call_status;
 } DisasContext;
 
 typedef struct DisasCompare {
-- 
2.34.1
