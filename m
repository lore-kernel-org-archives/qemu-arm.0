Received: by 2002:a17:906:b28b:b0:78d:9097:c95d with SMTP id q11csp750218ejz;
        Wed, 19 Oct 2022 20:23:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65HVSCcPEf/aGXCY1vNMYcZsa2tau61gJinGgZhnQ5b8C5pA3qKEzsy7XxVMdGxMuAHN5O
X-Received: by 2002:ac8:7d4e:0:b0:39c:d73a:dbc5 with SMTP id h14-20020ac87d4e000000b0039cd73adbc5mr9420299qtb.650.1666236205309;
        Wed, 19 Oct 2022 20:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666236205; cv=none;
        d=google.com; s=arc-20160816;
        b=J27z1e/NHB9sWqXGoE7E9R+q2H85Ua1WWg1HkSlHMwlOzYlxIXRGVCeGYUERxDCPAf
         F4KUGN+s3ZRhLi5HZJ9J32VdETboNkyWNS4gFvBc7egklcxRMd/NoM0USNgvy+myzRCg
         AkqRAHWY6p+OzAFSxDuVGK0VDOboaTTcOGSuH++5xtAPOKMsOhNgyc/TLHWVxcOUFPCz
         tPIZHsAQs+uFki6hXjWJCyn+TMwf/Ua5fPWlN5OzFEZSSqtBdSieVB4o7lyGqjo3z2A6
         0mxs5REPnAk7dEPNgOc0ngvrB675bbtVQJLjb3q0zPnV++e/dkQfsjRcskMWJx2I/4x+
         zLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KRC0PQi4FuPYcvWsXmno1zqo2C9efqzFcFomIVhlMdI=;
        b=MxnuKGDnZVOI0EodkB/DNC2Wu1mBAxPuq/dWMcwONyLgJ4ZAvncKmixaamV15s+Bu8
         EC1EMN8nMbIY/G1C6k13nuu4iqWM8mrIbyifaonzCYM3rqbOQvvI3zHxdipzx+2ZsGzh
         8CYmXmW6brSkl1Kz171loPLdYJSr/it13cpcr7vX/oIYBY6V5Fozi/d99+8/g3wrtTBU
         P2rYOo8LooNxrLCOxTIDqRFlH8v86bGZqLheqWSPWykOAX+41+XG08s2oJEuQKJkxr3x
         obyWiInzxMkIryQf/RpoqanCWVnssz293pRG+48R8cJa7aeT3JLnT6JHsCdffe9V72S7
         2nGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cj2JGdQ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020ac86b08000000b003995248aae2si9595861qts.187.2022.10.19.20.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 20:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cj2JGdQ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olM9U-0005Vg-Oz
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:23:24 -0400
Received: from [::1] (port=40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olLvJ-00039a-Ft
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLtu-0002yI-S9
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:20 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLtt-0001mw-1a
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:18 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q71so1154212pgq.8
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 20:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRC0PQi4FuPYcvWsXmno1zqo2C9efqzFcFomIVhlMdI=;
 b=cj2JGdQ5A+s4QaaCNja7nL1Pp7s3g83UlnTMAcklX9VpN+WjHizxysk5+bvvqRAyVw
 Egiuph80u5O49tRnvW1uYd8ai4ZFmn3lXaxVIoP0wPr/TkOwq6v0B3oiRurpuqLLkvZI
 LQQb1LLFjRd8RKVJB78/1SOZBrPj4e++qWixDg/UyMW4f1rSSrn6Kui+ZWH/JjKV02vc
 A2Dz3TJaubOK0UyJxIPg8tlsCK2xJOpugpBndU085CBiVdBlcvN2L9bz0Nza32vGXzh4
 cC6hCmHgXUjQeOIuLjVIo3uolvuBq+t2ueJ6b46CaHPn6whX64FWVXeh5+NRdbJCuCil
 SW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRC0PQi4FuPYcvWsXmno1zqo2C9efqzFcFomIVhlMdI=;
 b=LP3GWif5A86fgYwBRVNsMW64Y6VCM7CMnlFxzsFfkAgZsLgnu3vA/pXEMhtSZ61uQC
 nc6MaQOm6IdN3tnIug6xun7K/s8GSkJ/sccEVWOZxYbkq590bGkr8LxHTTYYCqSYlVAV
 hkVnvI7AD6WmDBHx0TaHF4T4FNA/T7GuxkIjWP2CBo+JiA5UCrBo+KerRVrDyvmSB93Y
 yLhgZv4uBIm6O7E12GVdyn5gDeNWUKTFq/FA18ubVmcPSVjLNarame+1GHkU6/bcg5Zv
 CO69HuKTEig8CoKKxBlO+BPuuhJJsrPsjoeH9qshxVA/+j2Pp4vWOR3V6QGa09TOIkCg
 Bl8w==
X-Gm-Message-State: ACrzQf2TTfTB7DD4HdqppMWGnWk2OKLNgKWWDpM/nOslrLtcIS3DDc1x
 bdl9Nhy0yj1WlBzovsSQa3V0TXTFIS554uGL
X-Received: by 2002:a63:1608:0:b0:45a:355a:9420 with SMTP id
 w8-20020a631608000000b0045a355a9420mr9932115pgl.354.1666235235722; 
 Wed, 19 Oct 2022 20:07:15 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 2/9] target/arm: Change gen_goto_tb to work on displacements
Date: Thu, 20 Oct 2022 13:06:34 +1000
Message-Id: <20221020030641.2066807-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 85B9q18PPZeS

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
 target/arm/translate.c     | 10 ++++++----
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5b67375f4e..6a372ed184 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -370,8 +370,10 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
     return translator_use_goto_tb(&s->base, dest);
 }
 
-static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
+static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
 {
+    uint64_t dest = s->pc_curr + diff;
+
     if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_a64_set_pc_im(dest);
@@ -1354,7 +1356,7 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  */
 static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 {
-    uint64_t addr = s->pc_curr + sextract32(insn, 0, 26) * 4;
+    int64_t diff = sextract32(insn, 0, 26) * 4;
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
@@ -1363,7 +1365,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     /* B Branch / BL Branch with link */
     reset_btype(s);
-    gen_goto_tb(s, 0, addr);
+    gen_goto_tb(s, 0, diff);
 }
 
 /* Compare and branch (immediate)
@@ -1375,14 +1377,14 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int sf, op, rt;
-    uint64_t addr;
+    int64_t diff;
     TCGLabel *label_match;
     TCGv_i64 tcg_cmp;
 
     sf = extract32(insn, 31, 1);
     op = extract32(insn, 24, 1); /* 0: CBZ; 1: CBNZ */
     rt = extract32(insn, 0, 5);
-    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
+    diff = sextract32(insn, 5, 19) * 4;
 
     tcg_cmp = read_cpu_reg(s, rt, sf);
     label_match = gen_new_label();
@@ -1391,9 +1393,9 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, label_match);
 
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_goto_tb(s, 0, 4);
     gen_set_label(label_match);
-    gen_goto_tb(s, 1, addr);
+    gen_goto_tb(s, 1, diff);
 }
 
 /* Test and branch (immediate)
@@ -1405,13 +1407,13 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int bit_pos, op, rt;
-    uint64_t addr;
+    int64_t diff;
     TCGLabel *label_match;
     TCGv_i64 tcg_cmp;
 
     bit_pos = (extract32(insn, 31, 1) << 5) | extract32(insn, 19, 5);
     op = extract32(insn, 24, 1); /* 0: TBZ; 1: TBNZ */
-    addr = s->pc_curr + sextract32(insn, 5, 14) * 4;
+    diff = sextract32(insn, 5, 14) * 4;
     rt = extract32(insn, 0, 5);
 
     tcg_cmp = tcg_temp_new_i64();
@@ -1422,9 +1424,9 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, label_match);
     tcg_temp_free_i64(tcg_cmp);
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_goto_tb(s, 0, 4);
     gen_set_label(label_match);
-    gen_goto_tb(s, 1, addr);
+    gen_goto_tb(s, 1, diff);
 }
 
 /* Conditional branch (immediate)
@@ -1436,13 +1438,13 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int cond;
-    uint64_t addr;
+    int64_t diff;
 
     if ((insn & (1 << 4)) || (insn & (1 << 24))) {
         unallocated_encoding(s);
         return;
     }
-    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
+    diff = sextract32(insn, 5, 19) * 4;
     cond = extract32(insn, 0, 4);
 
     reset_btype(s);
@@ -1450,12 +1452,12 @@ static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
         /* genuinely conditional branches */
         TCGLabel *label_match = gen_new_label();
         arm_gen_test_cc(cond, label_match);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         gen_set_label(label_match);
-        gen_goto_tb(s, 1, addr);
+        gen_goto_tb(s, 1, diff);
     } else {
         /* 0xe and 0xf are both "always" conditions */
-        gen_goto_tb(s, 0, addr);
+        gen_goto_tb(s, 0, diff);
     }
 }
 
@@ -1629,7 +1631,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * any pending interrupts immediately.
          */
         reset_btype(s);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     case 7: /* SB */
@@ -1641,7 +1643,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * MB and end the TB instead.
          */
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     default:
@@ -14947,7 +14949,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, 4);
             break;
         default:
         case DISAS_UPDATE_EXIT:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5752b7af5c..ae30c26ca4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2590,8 +2590,10 @@ static void gen_goto_ptr(void)
  * cpu_loop_exec. Any live exit_requests will be processed as we
  * enter the next TB.
  */
-static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
+static void gen_goto_tb(DisasContext *s, int n, int diff)
 {
+    target_ulong dest = s->pc_curr + diff;
+
     if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
@@ -2625,7 +2627,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          *    gen_jmp();
          * on the second call to gen_jmp().
          */
-        gen_goto_tb(s, tbno, dest);
+        gen_goto_tb(s, tbno, dest - s->pc_curr);
         break;
     case DISAS_UPDATE_NOCHAIN:
     case DISAS_UPDATE_EXIT:
@@ -9793,7 +9795,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
@@ -9845,7 +9847,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_set_pc_im(dc, dc->base.pc_next);
             gen_singlestep_exception(dc);
         } else {
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
         }
     }
 }
-- 
2.34.1

