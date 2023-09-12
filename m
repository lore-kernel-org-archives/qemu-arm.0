Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2335485ejx;
        Tue, 12 Sep 2023 14:29:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7988:b0:153:8754:8a7e with SMTP id bh8-20020a056a21798800b0015387548a7emr558108pzc.3.1694554167086;
        Tue, 12 Sep 2023 14:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694554167; cv=none;
        d=google.com; s=arc-20160816;
        b=VT1Dt8VaRJZG4X1bHXgHWFGCECKpTl7+YFyOyXgsoMgScQfB7x8h4/U0bZp/LggKli
         nf4EhL5oEjk/EQJWX7jpJVI3woUDzYvownw9PNfIpPlZVljb27x1hfeZnfBDrYxgiZXf
         9L/HbvoaVrwFZHqvbs/mhv0RaVayLC0WK4OIlVuloE8X9iWI/9/r/VLbslelD6+9IOD2
         LAli/5WyIaLqRYIjXTFQV4GUi9HbOiYzlUl8Gm1I+0ZXnVNIVyFobOhE8gvZasRlMyRB
         GiB7/8HBKRyzDTfq5N28sEx9pBRNly0ICm+iZkEcmu5vN/eXYaxaeCrWttRtyfGJPPCL
         tmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0c/U127kRZlzHBmfgSsC57fttRjeM+Iuaw+v/+H9H8A=;
        fh=8ofdNWWEjf4kZAJKfS4vu1J+LvZ/Z/0IiNtZxBjYGBc=;
        b=YZ9lbs0rcbAHGZ3Lm1DvXbQcDb6J5jn1FAkauA3Nd/kOGb8XnFPRPhum1TnahqZHMw
         HdO44ghuLwtvbgpvL2Ky8GoUwCWywcDaodria1sjw2honHJQmL3hIi2Ck53624XwSb4q
         TiyrhHJ0gq12g2mAINuaWPp5g1QSEJmzbVn9Xnj+9DkA+lreAAnwm/1ZLnABQoW/8p59
         gOELmj62KvOe/Ep0QKMfaI3yX6VZ5FY5VMowIsqJcdZoUaVm7bkmXAm+/l9fBZ1nW/M4
         Vob10xJ5dsLOtERyi3nIzl1GydGJOudRtbncgitXdbbfs5qE91Hxjrt3YcBh1QFXwJF0
         Te/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=pcyWwPCb;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k70-20020a628449000000b00682f1588131sor8677615pfd.8.2023.09.12.14.29.26
        (Google Transport Security);
        Tue, 12 Sep 2023 14:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=pcyWwPCb;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694554166; x=1695158966; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c/U127kRZlzHBmfgSsC57fttRjeM+Iuaw+v/+H9H8A=;
        b=pcyWwPCbdQ3BwjRxfuVPvRoMg8VsQA8+vDpopDkHir2t7hLdp3h0Yp0Lab+6n2mMTb
         Cy3Tg/Yte2W6EODPi5dIn8ICDJXUXlPfoKjBSSV6e1gzFSy/62OrskhAZywU4d92FST2
         fZaLRb1eCCK1/sqiGm1593ZYsZXnMX9noWCjFwnXn+PAF5TqispWhqzxOwjSB2deTRYS
         rPyZ70iwTg3f/nfv+LqIeHmvhW/HSEWIOpLvR3pYhPdpsLukzfXpj/b301csalEfjq2C
         xL02m8lyeNzOh+C1DSe8xgpnPiiQN0k0A+iQ/FRE+Omwi0Hjju6+3EUOYOe7Sqnx784A
         Zgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694554166; x=1695158966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0c/U127kRZlzHBmfgSsC57fttRjeM+Iuaw+v/+H9H8A=;
        b=JeiJDb/83an88cb9wGAunz1dQjuyiUXbaRqHiPbVCHHk35tQtO7SRcN5SIn1Jtkr/o
         vDGBn08FSEHpj8yYQDjrjpL6sH2HLpfo1b25MARNsEm12FxJb2gt7rdOT0ClEtkSnYy3
         h2JVkAgvYsb6J8rqIEZvCBdayAS/5Tc8CqKwiGkl1imhty/hZK+y8qqibxuanewtc2NM
         bszpHxEiGKRlq9erQp99IwQeeEZifhrPCnwWGA1HzoVhoIjIVeb4F+l0s2dbevT8ZLy0
         iC57ECGsjXsanBwotGsx3WOVvVkBTiNAXHPrm/1bzkh6aMPSg1TPIH9Wr0U7C/G38XKw
         GosA==
X-Gm-Message-State: AOJu0YxH9yuMA9Hg3pKX5012ut3fQBXhdQGpngl72qv59E4O0ZyaGLQ2
	zSFVJw2E6I9ONUROTSfiOZY3zEKmbwes+GAV
X-Google-Smtp-Source: AGHT+IFDaZyoDJURSCapMwfTHRGZRvB1maqalNeG4nnq9hxM6QRvAvG/KIwVeBJ7sthGfs+XteHogg==
X-Received: by 2002:a05:6a21:3d85:b0:131:a21:9f96 with SMTP id bj5-20020a056a213d8500b001310a219f96mr587036pzc.6.1694554166229;
        Tue, 12 Sep 2023 14:29:26 -0700 (PDT)
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from q1iq-virtual-machine.. ([114.249.236.97])
        by smtp.gmail.com with ESMTPSA id u20-20020aa78394000000b0068be4ce33easm7930436pfm.96.2023.09.12.14.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 14:29:25 -0700 (PDT)
From: Yeqi Fu <fufuyqqqqqq@gmail.com>
To: alex.bennee@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-devel@nongnu.org,
	Yeqi Fu <fufuyqqqqqq@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC v6 7/9] target/arm: Add support for native library calls
Date: Wed, 13 Sep 2023 05:28:40 +0800
Message-Id: <20230912212842.658374-8-fufuyqqqqqq@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912212842.658374-1-fufuyqqqqqq@gmail.com>
References: <20230912212842.658374-1-fufuyqqqqqq@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: s9MSj02uazGg

This commit introduces support for native library calls on the
arm target. When encountering special instructions reserved
for native calls, this commit extracts the function name and
generates the corresponding native call.

Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
---
 configs/targets/aarch64-linux-user.mak |  1 +
 configs/targets/arm-linux-user.mak     |  1 +
 target/arm/tcg/translate-a64.c         | 32 ++++++++++++++++++++++++++
 target/arm/tcg/translate.c             | 29 +++++++++++++++++++++++
 target/arm/tcg/translate.h             |  5 ++++
 5 files changed, 68 insertions(+)

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
index 3baab6aa60..00b69e9c24 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -25,6 +25,7 @@
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
+#include "native/native.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
@@ -2400,6 +2401,10 @@ static bool trans_HLT(DisasContext *s, arg_i *a)
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
@@ -13392,6 +13397,26 @@ void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &op);
 }
 
+static void gen_native_call(CPUState *cpu, DisasContext *s, CPUARMState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    TCGv_i64 arg1 = tcg_temp_new_i64();
+    TCGv_i64 arg2 = tcg_temp_new_i64();
+    TCGv_i64 arg3 = tcg_temp_new_i64();
+    TCGv_i64 ret = tcg_temp_new_i64();
+    uint32_t func_tmp = translator_ldl_swap(env, &s->base, s->base.pc_next,
+                                            bswap_code(s->sctlr_b));
+    char *func_name = g2h(cpu, s->base.pc_next + func_tmp);
+    tcg_gen_mov_i64(arg1, cpu_reg(s, 0));
+    tcg_gen_mov_i64(arg2, cpu_reg(s, 1));
+    tcg_gen_mov_i64(arg3, cpu_reg(s, 2));
+    if (!gen_native_call_i64(func_name, ret, arg1, arg2, arg3)) {
+        unallocated_encoding(s);
+    }
+    tcg_gen_mov_i64(cpu_reg(s, 0), ret);
+#endif
+}
+
 /* Crypto three-reg SHA512
  *  31                   21 20  16 15  14  13 12  11  10  9    5 4    0
  * +-----------------------+------+---+---+-----+--------+------+------+
@@ -13950,6 +13975,13 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint64_t pc = s->base.pc_next;
     uint32_t insn;
 
+    if (native_bypass_enabled() && s->native_call_status) {
+        gen_native_call(cpu, s, env);
+        s->base.pc_next = pc + 4;
+        s->native_call_status = false;
+        return;
+    }
+
     /* Singlestep exceptions have the highest priority. */
     if (s->ss_active && !s->pstate_ss) {
         /* Singlestep state is Active-pending.
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 13c88ba1b9..7a5a0f9444 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -28,6 +28,7 @@
 #include "semihosting/semihost.h"
 #include "cpregs.h"
 #include "exec/helper-proto.h"
+#include "native/native.h"
 
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
@@ -1125,6 +1126,23 @@ void gen_lookup_tb(DisasContext *s)
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
+    char *func_name = g2h(cpu, dc->base.pc_next + func_tmp);
+    if (!gen_native_call_i32(func_name, ret, arg1, arg2, arg3)) {
+        unallocated_encoding(dc);
+    }
+    store_reg(dc, 0, ret);
+#endif
+}
+
 static inline void gen_hlt(DisasContext *s, int imm)
 {
     /* HLT. This has two purposes.
@@ -1139,6 +1157,10 @@ static inline void gen_hlt(DisasContext *s, int imm)
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
@@ -9329,6 +9351,13 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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
