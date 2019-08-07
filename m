Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6072840wrv;
        Tue, 6 Aug 2019 21:55:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyz8zklIKHdT2M6cCSp7d6wZ9C+8uBU+/0Q9z6YVMllru4GEnPgohi1kuCxqv6htT9LjAOz
X-Received: by 2002:aa7:c2c8:: with SMTP id m8mr7617696edp.63.1565153712473;
        Tue, 06 Aug 2019 21:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153712; cv=none;
        d=google.com; s=arc-20160816;
        b=XyQFdOLB3hktwISdfEjrxyc5FPB7pWn7kWTj1k5aqmBekiYPIYY7gRVM5t7XONWBAB
         JFT454UB1WZ9lDws8lj7vcrjoTnGEY8dLM/r3aNlXYHaV1t0ktZZN37MJeI5JazCXVQK
         eY0EJ1Oyfg43hMMMrwXJjaXeutReYI5R5AR38lsfRs89gW4jkktAwwXqRvWgmqDAONgG
         GdilxXvus2311rF8KY+1Z5zrN0t4T86WWE3uUWv7c9ARm3dmzJf97D4DAL6Q8LE5XDSx
         2M+4uY0XLOc9ooslghZoplCXudW5gzUGehN1bThLiUu9a9a+frrvs8Qqz6angzkGpWJ5
         ZP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=rO+a4ZP5jWR/KlxPWwiR76ooj5F0S+A/mpDiKuebxZ8=;
        b=fmBF2SoKF/IbhlLy9ioHDc9cOqZyW9Zf8DTuvfstc8nWdn8RLO+xZosEsXulst6S7M
         WQD6P8/1RpZJr5kkEPoR6Zpn4ISX6HA0VjYPAv3vIGzjXwK6zUMhL21dCZQBcxa9s3Z4
         eXUX5cUNuleMd/VOv5RXUHX2ll8Y9L0bF6rR6nPSh280V4rAwY4rbQM9H3eq7IVFZ8tu
         84e4AphAuBfysty1qazF0CekIVRjFiOY5yHVfeV24XIKzOaoBlyTcB+UrdkpAG/CS/OB
         M9QEaugBliWUg986dxxmOHJCMyEFcOVdBYYc+QnUQlAH+zEK5i9ak2TCiNtDtg2cl/NU
         OSMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SsTJ1jy7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ny24si29815663ejb.78.2019.08.06.21.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SsTJ1jy7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvDyh-0004DU-Hu
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40582)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxN-00012m-45
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxL-0004jU-DX
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:49 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34569)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxL-0004im-4a
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:47 -0400
Received: by mail-pf1-x432.google.com with SMTP id b13so42762235pfo.1
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rO+a4ZP5jWR/KlxPWwiR76ooj5F0S+A/mpDiKuebxZ8=;
 b=SsTJ1jy7wLifKzmc1r0VUxXvAgcUvtjhe+s0eeNm9Oe3WWyRTl/4vj4poaffj27stp
 e5tUiMtsT3vQHEgBv2h8ww9Hre6Ei1mE8Ihz7GgmJVFNy7NL1ojtScG3H4A3nxPhMJ4f
 L8C99lu/ydx7TpJToxMvwRn9vXMHlYsBJaJn+o6oiT4l4P5lwwBanXBN4A2/d1GU6YMt
 AYJVeiV7wCsw6WsIYR9x2i1rDvRAt1+s5t3D/n9p8PuTK1dcSxup/5yBRvMsv7Y7TQLY
 Excs27fg6GyWxW7PDQYJZHPYN+mOMFHcmXy5jjk040ZxwoO9eQEppCoYgwWFkit+u2rk
 Kv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rO+a4ZP5jWR/KlxPWwiR76ooj5F0S+A/mpDiKuebxZ8=;
 b=RI7f8ASUE9DdKfl78aMKHGcvqaSX6oVjYJN6l8zd+NNhYoMimw+dG3FSnF4EJcWKYM
 lBS09ViyoRqH7RHBg95MFAUwzsACHhaTz7V6VQRafQe/Rr+JkPV/kOX3EckAxdwEZNXx
 /Bh+w+3nQh+udk56hQwvwEH3/TdJSmGhblBgOyH7juhajlcYr3pXbb8EE2RYz1KNA3UL
 c28ielYOvrbIlrLVTc+8+0ojS+sHEgEfyZ6LztTaZ7NrkvCFhfmHhpAsVZvERvI40kGp
 IG+McYuWX6pRDjap/pXkXgiRHgPy2YUplnT1CT6p0FaKoy6REEumf7tA1GjQjCvtxQoW
 ORJA==
X-Gm-Message-State: APjAAAVYDDip9Dm9NZ//ZycXwPGnJxaEWc869KO5j2SNET4TIBmX6IbR
 rw2X8m/WgBvWz7nUyv5Anztbbw==
X-Received: by 2002:a17:90a:338b:: with SMTP id
 n11mr6486729pjb.21.1565153626202; 
 Tue, 06 Aug 2019 21:53:46 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:26 -0700
Message-Id: <20190807045335.1361-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::432
Subject: [Qemu-arm] [PATCH 02/11] target/arm: Introduce pc_curr
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0cYDR9erxJKc

Add a new field to retain the address of the instruction currently
being translated.  The 32-bit uses are all within subroutines used
by a32 and t32.  This will become less obvious when t16 support is
merged with a32+t32, and having a clear definition will help.

Convert aarch64 as well for consistency.  Note that there is one
instance of a pre-assert fprintf that used the wrong value for the
address of the current instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  2 +-
 target/arm/translate.h     |  2 ++
 target/arm/translate-a64.c | 21 +++++++++++----------
 target/arm/translate.c     | 14 ++++++++------
 4 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 9ab40872d8..9cd2b3d238 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -25,7 +25,7 @@ void unallocated_encoding(DisasContext *s);
         qemu_log_mask(LOG_UNIMP,                                         \
                       "%s:%d: unsupported instruction encoding 0x%08x "  \
                       "at pc=%016" PRIx64 "\n",                          \
-                      __FILE__, __LINE__, insn, s->pc - 4);              \
+                      __FILE__, __LINE__, insn, s->pc_curr);             \
         unallocated_encoding(s);                                         \
     } while (0)
 
diff --git a/target/arm/translate.h b/target/arm/translate.h
index a20f6e2056..525603eb30 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -10,6 +10,8 @@ typedef struct DisasContext {
     const ARMISARegisters *isar;
 
     target_ulong pc;
+    /* The address of the current instruction being translated. */
+    target_ulong pc_curr;
     target_ulong page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3231477a2..da447eedcc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1248,7 +1248,7 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  */
 static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 {
-    uint64_t addr = s->pc + sextract32(insn, 0, 26) * 4 - 4;
+    uint64_t addr = s->pc_curr + sextract32(insn, 0, 26) * 4;
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
@@ -1276,7 +1276,7 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
     sf = extract32(insn, 31, 1);
     op = extract32(insn, 24, 1); /* 0: CBZ; 1: CBNZ */
     rt = extract32(insn, 0, 5);
-    addr = s->pc + sextract32(insn, 5, 19) * 4 - 4;
+    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
 
     tcg_cmp = read_cpu_reg(s, rt, sf);
     label_match = gen_new_label();
@@ -1305,7 +1305,7 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 
     bit_pos = (extract32(insn, 31, 1) << 5) | extract32(insn, 19, 5);
     op = extract32(insn, 24, 1); /* 0: TBZ; 1: TBNZ */
-    addr = s->pc + sextract32(insn, 5, 14) * 4 - 4;
+    addr = s->pc_curr + sextract32(insn, 5, 14) * 4;
     rt = extract32(insn, 0, 5);
 
     tcg_cmp = tcg_temp_new_i64();
@@ -1336,7 +1336,7 @@ static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
         unallocated_encoding(s);
         return;
     }
-    addr = s->pc + sextract32(insn, 5, 19) * 4 - 4;
+    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
     cond = extract32(insn, 0, 4);
 
     reset_btype(s);
@@ -1720,7 +1720,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         TCGv_i32 tcg_syn, tcg_isread;
         uint32_t syndrome;
 
-        gen_a64_set_pc_im(s->pc - 4);
+        gen_a64_set_pc_im(s->pc_curr);
         tmpptr = tcg_const_ptr(ri);
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
         tcg_syn = tcg_const_i32(syndrome);
@@ -1884,7 +1884,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             /* The pre HVC helper handles cases when HVC gets trapped
              * as an undefined insn by runtime configuration.
              */
-            gen_a64_set_pc_im(s->pc - 4);
+            gen_a64_set_pc_im(s->pc_curr);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
             gen_exception_insn(s, 0, EXCP_HVC, syn_aa64_hvc(imm16), 2);
@@ -1894,7 +1894,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 unallocated_encoding(s);
                 break;
             }
-            gen_a64_set_pc_im(s->pc - 4);
+            gen_a64_set_pc_im(s->pc_curr);
             tmp = tcg_const_i32(syn_aa64_smc(imm16));
             gen_helper_pre_smc(cpu_env, tmp);
             tcg_temp_free_i32(tmp);
@@ -2615,7 +2615,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_const_i64((s->pc - 4) + imm);
+    clean_addr = tcg_const_i64(s->pc_curr + imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -3594,7 +3594,7 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
     offset = sextract64(insn, 5, 19);
     offset = offset << 2 | extract32(insn, 29, 2);
     rd = extract32(insn, 0, 5);
-    base = s->pc - 4;
+    base = s->pc_curr;
 
     if (page) {
         /* ADRP (page based) */
@@ -11533,7 +11533,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
                 break;
             default:
                 fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
-                        __func__, insn, fpopcode, s->pc);
+                        __func__, insn, fpopcode, s->pc_curr);
                 g_assert_not_reached();
             }
 
@@ -14044,6 +14044,7 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
 {
     uint32_t insn;
 
+    s->pc_curr = s->pc;
     insn = arm_ldl_code(env, s->pc, s->sctlr_b);
     s->insn = insn;
     s->pc += 4;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1f15f14022..59e35aafbf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1212,7 +1212,7 @@ static inline void gen_hvc(DisasContext *s, int imm16)
      * as an undefined insn by runtime configuration (ie before
      * the insn really executes).
      */
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->pc_curr);
     gen_helper_pre_hvc(cpu_env);
     /* Otherwise we will treat this as a real exception which
      * happens after execution of the insn. (The distinction matters
@@ -1231,7 +1231,7 @@ static inline void gen_smc(DisasContext *s)
      */
     TCGv_i32 tmp;
 
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->pc_curr);
     tmp = tcg_const_i32(syn_aa32_smc());
     gen_helper_pre_smc(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
@@ -3190,7 +3190,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
 
     /* Sync state because msr_banked() can raise exceptions */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->pc_curr);
     tcg_reg = load_reg(s, rn);
     tcg_tgtmode = tcg_const_i32(tgtmode);
     tcg_regno = tcg_const_i32(regno);
@@ -3212,7 +3212,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 
     /* Sync state because mrs_banked() can raise exceptions */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->pc_curr);
     tcg_reg = tcg_temp_new_i32();
     tcg_tgtmode = tcg_const_i32(tgtmode);
     tcg_regno = tcg_const_i32(regno);
@@ -7219,7 +7219,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             }
 
             gen_set_condexec(s);
-            gen_set_pc_im(s, s->pc - 4);
+            gen_set_pc_im(s, s->pc_curr);
             tmpptr = tcg_const_ptr(ri);
             tcg_syn = tcg_const_i32(syndrome);
             tcg_isread = tcg_const_i32(isread);
@@ -7629,7 +7629,7 @@ static void gen_srs(DisasContext *s,
     tmp = tcg_const_i32(mode);
     /* get_r13_banked() will raise an exception if called from System mode */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->pc_curr);
     gen_helper_get_r13_banked(addr, cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     switch (amode) {
@@ -12053,6 +12053,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         return;
     }
 
+    dc->pc_curr = dc->pc;
     insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
     dc->insn = insn;
     dc->pc += 4;
@@ -12121,6 +12122,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         return;
     }
 
+    dc->pc_curr = dc->pc;
     insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, dc->pc, insn);
     dc->pc += 2;
-- 
2.17.1

