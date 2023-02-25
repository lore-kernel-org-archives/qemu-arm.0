Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2639123ejc;
        Sat, 25 Feb 2023 01:23:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9UfUGQUvWAIBmh7/6gAHGqtThbWdLpWtKPpgXWI+4rH/OZDDUtKhGu/v7xKp42MtCvijjY
X-Received: by 2002:a05:622a:1303:b0:3b8:6d3a:5ec7 with SMTP id v3-20020a05622a130300b003b86d3a5ec7mr31579751qtk.22.1677316999815;
        Sat, 25 Feb 2023 01:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316999; cv=none;
        d=google.com; s=arc-20160816;
        b=d8rpF+hlFT6KYPhNTiGw+juaLQvUxFiJcXgFB3bQ8LNQ4DZ8+CjGOkVEw2K2lqvZWT
         mp3vsNCVnlYRVXFju3YHpRhJFzvDuoENy+iSuIfco1pt2q19VEru5i/RW/LG0j2e+6cH
         GRXU3jXjtSAF2PtX98zluc77XepyzgDkMff1l/GGdDIk1LdNTkHkArosktfwtSab51EP
         E5/1M/O/lGHvo0ACt7a9GTtEldIVFkCxDwCMmdfq9TNemqzlxerDziG0dQmhfDeTwwYQ
         U3D9xiISTTy82T+dvCExWB9gYUuuSMVXZyWAIdZwu78PYHXz9ord+YZuETJ7D2uQ1A8w
         GK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gN2ZbLLJMcqwLwLE2rtqtIVte+chcJDZw5IRv13Gn6s=;
        b=p7vYPHWfeiiR2NzZcEnA6wYlZw32Yu/Xpca+xvejovuNicl1boe1jG9IY/ZEkbSlwf
         7CoZz/P6TsHO06XybJ4weGdc9L5IgkHYvrl3jDrHdUFSfRarzPk5ltGvx1uv5nFjIwBO
         4ImguRXuPE+uaHF6qx+/fx0FYTLf8kD2Q6pclJody1yQvSSqTZrmLWEPM8gLQpEoi+Cu
         gwj3Q6HUHGoy7pH1wGhh68LDwjuUMw65cGCclxyGmZ72E9obE8QloGCTgLsX74PLlcqA
         ucxx0XlzVjxG+6vk2bgxyyE3Xm+a0C5fuYQXKqugfI+CKuNGkzrwULYCkxjPOgCZ2ydh
         o2EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rkf9/K5C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a05622a11d100b003bb8a14baf6si1623485qtk.595.2023.02.25.01.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:23:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rkf9/K5C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqjm-0000NG-QY; Sat, 25 Feb 2023 04:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjG-0006N7-4w
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:31 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj9-0002xc-KK
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso5188763pjb.5
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gN2ZbLLJMcqwLwLE2rtqtIVte+chcJDZw5IRv13Gn6s=;
 b=rkf9/K5CFLD2CdcKg60/H+QYxKM2FJgX66huptQlSGYUifOUvASBu1MzsEZUqoFUBq
 ndxcEXmSk130GTkUgRDaM7XGLSM18OJ86j5DVbMkktmX+QB1X5UtKSoUiWuNX2bfNGyy
 Q1C5CkYjhdkQWuYfEsLEYWbN5sDxMXmwmmtrf5Dcxv+OpbKqW6+WH2KgzFLcbavTS4MC
 kD7EqCKI72iW5zEoG2+HGlO6DdhpVKEHNyoYN8uWizkunQbSfXkzzej2oIoRmRmUVkS5
 xQpv8dH0BPYV4A9DdRgHVXoGHrhIHAhaVCxlU2+PQV37OA3D7fv5VDH5gYx96dQt4meS
 1+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gN2ZbLLJMcqwLwLE2rtqtIVte+chcJDZw5IRv13Gn6s=;
 b=WhBI7AKF1DKNP2OG9ibgxqEz6VWEZjyTBfPEsgn7U9Pg0BO2WAvJj652+/4OTS0ZW+
 rTdz/bh04FekN3HgRqRjwVsyGDtDZSR3A7qd70xvJsNKmwfXsGMyE8Tt5pXv+xRwRzzG
 iBMHb4LsEn7f+UvkRMIlXV5irmDjoy2oh75tTyCj69pLLqkcq0GvNwg83NmKmbz+bWsP
 Cc9yHXin1A/hDJCaC9SVeTNfCWCRWDYH2E0tRbb5gH7mDjp55Px1QsoR+CYQnW2m9g7o
 KOFzFa9ocXsrepEFPmOmmB27TSyBC1Kfuclcha55TLwtUvzw8CzN+Bgs/j1xcvlrCcee
 wvYw==
X-Gm-Message-State: AO0yUKVJtQKI2IkEe+pSk/PqZ/0s/zRNIG5w8Zp0AZS8bzeLqYA4R5LI
 VJsTwcnKyhEuQhwNIbJy8NqTKg==
X-Received: by 2002:a05:6a20:3d96:b0:cc:92ee:b119 with SMTP id
 s22-20020a056a203d9600b000cc92eeb119mr4085187pzi.45.1677316822067; 
 Sat, 25 Feb 2023 01:20:22 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 65/76] target/sparc: Drop get_temp_tl
Date: Fri, 24 Feb 2023 23:14:16 -1000
Message-Id: <20230225091427.1817156-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: hEMPL6m5PE0e

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 53 ++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 3b0044aa66..2b4af692f6 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -85,9 +85,7 @@ typedef struct DisasContext {
     uint32_t cc_op;  /* current CC operation */
     sparc_def_t *def;
     TCGv_i32 t32[3];
-    TCGv ttl[5];
     int n_t32;
-    int n_ttl;
 #ifdef TARGET_SPARC64
     int fprs_dirty;
     int asi;
@@ -139,14 +137,6 @@ static inline TCGv_i32 get_temp_i32(DisasContext *dc)
     return t;
 }
 
-static inline TCGv get_temp_tl(DisasContext *dc)
-{
-    TCGv t;
-    assert(dc->n_ttl < ARRAY_SIZE(dc->ttl));
-    dc->ttl[dc->n_ttl++] = t = tcg_temp_new();
-    return t;
-}
-
 static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 {
 #if defined(TARGET_SPARC64)
@@ -301,7 +291,7 @@ static inline TCGv gen_load_gpr(DisasContext *dc, int reg)
         assert(reg < 32);
         return cpu_regs[reg];
     } else {
-        TCGv t = get_temp_tl(dc);
+        TCGv t = tcg_temp_new();
         tcg_gen_movi_tl(t, 0);
         return t;
     }
@@ -321,7 +311,7 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
         assert(reg < 32);
         return cpu_regs[reg];
     } else {
-        return get_temp_tl(dc);
+        return tcg_temp_new();
     }
 }
 
@@ -2897,7 +2887,7 @@ static TCGv get_src2(DisasContext *dc, unsigned int insn)
 {
     if (IS_IMM) { /* immediate */
         target_long simm = GET_FIELDs(insn, 19, 31);
-        TCGv t = get_temp_tl(dc);
+        TCGv t = tcg_temp_new();
         tcg_gen_movi_tl(t, simm);
         return t;
     } else {      /* register */
@@ -3253,7 +3243,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     case 2:                     /* FPU & Logical Operations */
         {
             unsigned int xop = GET_FIELD(insn, 7, 12);
-            TCGv cpu_dst = get_temp_tl(dc);
+            TCGv cpu_dst = tcg_temp_new();
             TCGv cpu_tmp0;
 
             if (xop == 0x3a) {  /* generate trap */
@@ -3513,7 +3503,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 if (!supervisor(dc)) {
                     goto priv_insn;
                 }
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
 #ifdef TARGET_SPARC64
                 rs1 = GET_FIELD(insn, 13, 17);
                 switch (rs1) {
@@ -4031,7 +4021,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                     } else {
@@ -4053,7 +4043,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                         tcg_gen_shr_i64(cpu_dst, cpu_src1, cpu_tmp0);
@@ -4077,7 +4067,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                         tcg_gen_sar_i64(cpu_dst, cpu_src1, cpu_tmp0);
@@ -4263,7 +4253,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_shli_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_shl_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4274,7 +4264,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_shri_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_shr_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4285,7 +4275,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_sari_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_sar_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4294,7 +4284,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #endif
                     case 0x30:
                         {
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             switch(rd) {
                             case 0: /* wry */
                                 tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
@@ -4479,7 +4469,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 goto illegal_insn;
                             }
 #else
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
                             gen_helper_wrpsr(cpu_env, cpu_tmp0);
                             tcg_gen_movi_i32(cpu_cc_op, CC_OP_FLAGS);
@@ -4495,7 +4485,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         {
                             if (!supervisor(dc))
                                 goto priv_insn;
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
 #ifdef TARGET_SPARC64
                             switch (rd) {
@@ -4653,7 +4643,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             CHECK_IU_FEATURE(dc, HYPV);
                             if (!hypervisor(dc))
                                 goto priv_insn;
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
                             switch (rd) {
                             case 0: // hpstate
@@ -5227,7 +5217,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
             } else if (xop == 0x39) { /* V9 return */
                 save_state(dc);
                 cpu_src1 = get_src1(dc, insn);
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
                 if (IS_IMM) {   /* immediate */
                     simm = GET_FIELDs(insn, 19, 31);
                     tcg_gen_addi_tl(cpu_tmp0, cpu_src1, simm);
@@ -5249,7 +5239,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #endif
             } else {
                 cpu_src1 = get_src1(dc, insn);
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
                 if (IS_IMM) {   /* immediate */
                     simm = GET_FIELDs(insn, 19, 31);
                     tcg_gen_addi_tl(cpu_tmp0, cpu_src1, simm);
@@ -5344,7 +5334,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
             unsigned int xop = GET_FIELD(insn, 7, 12);
             /* ??? gen_address_mask prevents us from using a source
                register directly.  Always generate a temporary.  */
-            TCGv cpu_addr = get_temp_tl(dc);
+            TCGv cpu_addr = tcg_temp_new();
 
             tcg_gen_mov_tl(cpu_addr, get_src1(dc, insn));
             if (xop == 0x3c || xop == 0x3e) {
@@ -5780,13 +5770,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
         }
         dc->n_t32 = 0;
     }
-    if (dc->n_ttl != 0) {
-        int i;
-        for (i = dc->n_ttl - 1; i >= 0; --i) {
-            tcg_temp_free(dc->ttl[i]);
-        }
-        dc->n_ttl = 0;
-    }
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1

