Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2065553ejx;
        Tue, 12 Sep 2023 07:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP3Zyv01HzQxgCe5WlM6rB2QWlB9oYSCH88K93Ymw/SjuxjrVzeONNFGd00QvsRc2g91Qh
X-Received: by 2002:a05:620a:2adf:b0:76d:9bf2:f1e9 with SMTP id bn31-20020a05620a2adf00b0076d9bf2f1e9mr13271973qkb.13.1694527686593;
        Tue, 12 Sep 2023 07:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694527686; cv=none;
        d=google.com; s=arc-20160816;
        b=oiAYI/n/yGX9uEa+cTXKIddj7A1NCVl5wX7R+RUqer8mQsYn4BKm7ImsPAxJhI+9MW
         xYXWG4FT85ilcAqwS7wE1dB8bGagxtqXNlVduPkrDrsUwNalZX/CwE0h/t7pCmSmG1PN
         QDumiItn1W9E4boeh6b12+NJbR5EgOeuXEdqlr8T1aryTKe2SA7bwSqubWnp2fCsKNX/
         G8p0ZeHBZWD4cd5xE/LGfdm9UYIhxA1JJL1qI7Y13UFBq6n1aPKW+aJLvmwwC1QntZaN
         1bRKbqAqo9ra87W0+Jyr43pfh/FgX80a07Qzqpk8zhRO1N2eLv2ta0qUY5V/ZmvrC746
         1opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LKEgjrZx4gf0ML/IevGyBJ31OzflOFa4C2rhH8LLKYk=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=ylFHvkks+zEZk0XSYvRVhl8Y9xeDrSn2GgTYB8Y8UgkwRucE3WiNofT8NXWi9LSrgi
         8T6la387WNQ096sVNxvAlD1/GPG4HYMQmTSnzKpg1jBrQyLNsAdEbVH5yFtZwq+OkAA/
         GEOfi6i0sRbF08r/tWlW6EBwyyTuL+Vtr2JqvfnCkfprUEP48mwlZYg3KuVY0IL4PR2x
         3ETx+ZtCHH9Id/ShKmYtQO8YeWH0xiKb5BG3YWMyDRqi9dSYLDNAdcaiglymqXsyq8zS
         nMV9m/FqNnOyuuVFMDagSSgM7pk2w5xCFGt+L8Yy0c7laBJC8fAk/5F8sxrGwn0Ho7fa
         op5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwdvjT+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05620a284900b0076cc0364ee7si6239666qkp.626.2023.09.12.07.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 07:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwdvjT+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qg412-0008Rs-P0; Tue, 12 Sep 2023 10:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40q-0008GS-Rz
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 10:05:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40k-0003qv-MR
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 10:05:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31fa666000dso2247601f8f.2
 for <qemu-arm@nongnu.org>; Tue, 12 Sep 2023 07:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694527484; x=1695132284; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LKEgjrZx4gf0ML/IevGyBJ31OzflOFa4C2rhH8LLKYk=;
 b=OwdvjT+aSGmZheKGLc5vGlzWvDfafm0unehF/pITTbJiYWZ3zaVJKiw7PoUM3NQf8I
 g/jrG/EQiseZGE45PmVhId0ai5keF/QFsF001h2fb95KflpLvxh4a+TDjhT91TvZjgs0
 5rrqHf0raxsalGVuLo6ab76386yYGpAXV+XWqWgmz6dlXqcOvs/3pPgerzWfGW8MwL+5
 UxoPvtgehdSY66OsjBGmTvd0TPvwC6h8qLPCnLNjYZ93yI5DbzJ+u2liLYsPVgf2lpNI
 A2rAFplKV9dmCqu0bsW2/oR85uPEuWjQGaLu0ONwl4Q8tmrzaJwsajBh/yOMF3B+0qy3
 ysSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694527484; x=1695132284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKEgjrZx4gf0ML/IevGyBJ31OzflOFa4C2rhH8LLKYk=;
 b=IiBNz+1JfzoJWXh7gMA2fYAshHeA/Q8tGYsuZH16jBoV7i2UlfAFxkfvidDTmXlwpB
 GoF4/YQmQ7YfT9JGM6Vqqd/8ouGHZ5PhFN1RGaBF6bxQoIzvZgh4NerEYZs/x/y+dMlh
 33bUgFsD8VOGvrmh4eGGlpzsS659hq4w9rHmMYxHzKsuV3eBDtEPDF6foF3a3xLBjTch
 FatvXT7I2GOMvNOzsLnx28yRTimM6dblKhNu5bW4X/PeHyNlmDK6m07nHHnWMnxPEfi/
 9uwxiyRa9bZxK/CccXU//6NdtkGohufu8YELxIYc2m1v01coMxkb+CJA/Wg4mBwlNCWy
 Nc6w==
X-Gm-Message-State: AOJu0Yx4zIl+jq8rPBZec0EK7ilOM1bFyqOXQ2PShMKvGoazjqTV+jhz
 edN9/O6iWwyUNBKf4gduhO0zyzP784Waexfm8i4=
X-Received: by 2002:adf:ec4c:0:b0:317:7068:4997 with SMTP id
 w12-20020adfec4c000000b0031770684997mr10109739wrn.60.1694527483474; 
 Tue, 12 Sep 2023 07:04:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm12892672wrq.49.2023.09.12.07.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 07:04:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] target/arm: Define new TB flag for ATA0
Date: Tue, 12 Sep 2023 15:04:30 +0100
Message-Id: <20230912140434.1333369-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912140434.1333369-1-peter.maydell@linaro.org>
References: <20230912140434.1333369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aXRoK4pb/O5e

Currently the only tag-setting instructions always do so in the
context of the current EL, and so we only need one ATA bit in the TB
flags.  The FEAT_MOPS SETG instructions include ones which set tags
for a non-privileged access, so we now also need the equivalent "are
tags enabled?" information for EL0.

Add the new TB flag, and convert the existing 'bool ata' field in
DisasContext to a 'bool ata[2]' that can be indexed by the is_unpriv
bit in an instruction, similarly to mte[2].

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  1 +
 target/arm/tcg/translate.h     |  4 ++--
 target/arm/tcg/hflags.c        | 12 ++++++++++++
 target/arm/tcg/translate-a64.c | 23 ++++++++++++-----------
 4 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 266c1a9ea1b..bd55c5dabfd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3171,6 +3171,7 @@ FIELD(TBFLAG_A64, SVL, 24, 4)
 FIELD(TBFLAG_A64, SME_TRAP_NONSTREAMING, 28, 1)
 FIELD(TBFLAG_A64, FGT_ERET, 29, 1)
 FIELD(TBFLAG_A64, NAA, 30, 1)
+FIELD(TBFLAG_A64, ATA0, 31, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index f748ba6f394..63922f8bad1 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -114,8 +114,8 @@ typedef struct DisasContext {
     bool unpriv;
     /* True if v8.3-PAuth is active.  */
     bool pauth_active;
-    /* True if v8.5-MTE access to tags is enabled.  */
-    bool ata;
+    /* True if v8.5-MTE access to tags is enabled; index with is_unpriv.  */
+    bool ata[2];
     /* True if v8.5-MTE tag checks affect the PE; index with is_unpriv.  */
     bool mte_active[2];
     /* True with v8.5-BTI and SCTLR_ELx.BT* set.  */
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index ea642384f5a..cea1adb7b62 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -325,6 +325,18 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             && allocation_tag_access_enabled(env, 0, sctlr)) {
             DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
         }
+        /*
+         * For unpriv tag-setting accesses we alse need ATA0. Again, in
+         * contexts where unpriv and normal insns are the same we
+         * duplicate the ATA bit to save effort for translate-a64.c.
+         */
+        if (EX_TBFLAG_A64(flags, UNPRIV)) {
+            if (allocation_tag_access_enabled(env, 0, sctlr)) {
+                DP_TBFLAG_A64(flags, ATA0, 1);
+            }
+        } else {
+            DP_TBFLAG_A64(flags, ATA0, EX_TBFLAG_A64(flags, ATA));
+        }
         /* Cache TCMA as well as TBI. */
         DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
     }
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bb7b15cb6cb..da4aabbaf4e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2272,7 +2272,7 @@ static void handle_sys(DisasContext *s, bool isread,
             clean_addr = clean_data_tbi(s, tcg_rt);
             gen_probe_access(s, clean_addr, MMU_DATA_STORE, MO_8);
 
-            if (s->ata) {
+            if (s->ata[0]) {
                 /* Extract the tag from the register to match STZGM.  */
                 tag = tcg_temp_new_i64();
                 tcg_gen_shri_i64(tag, tcg_rt, 56);
@@ -2289,7 +2289,7 @@ static void handle_sys(DisasContext *s, bool isread,
             clean_addr = clean_data_tbi(s, tcg_rt);
             gen_helper_dc_zva(cpu_env, clean_addr);
 
-            if (s->ata) {
+            if (s->ata[0]) {
                 /* Extract the tag from the register to match STZGM.  */
                 tag = tcg_temp_new_i64();
                 tcg_gen_shri_i64(tag, tcg_rt, 56);
@@ -3070,7 +3070,7 @@ static bool trans_STGP(DisasContext *s, arg_ldstpair *a)
     tcg_gen_qemu_st_i128(tmp, clean_addr, get_mem_index(s), mop);
 
     /* Perform the tag store, if tag access enabled. */
-    if (s->ata) {
+    if (s->ata[0]) {
         if (tb_cflags(s->base.tb) & CF_PARALLEL) {
             gen_helper_stg_parallel(cpu_env, dirty_addr, dirty_addr);
         } else {
@@ -3768,7 +3768,7 @@ static bool trans_STZGM(DisasContext *s, arg_ldst_tag *a)
     tcg_gen_addi_i64(addr, addr, a->imm);
     tcg_rt = cpu_reg(s, a->rt);
 
-    if (s->ata) {
+    if (s->ata[0]) {
         gen_helper_stzgm_tags(cpu_env, addr, tcg_rt);
     }
     /*
@@ -3800,7 +3800,7 @@ static bool trans_STGM(DisasContext *s, arg_ldst_tag *a)
     tcg_gen_addi_i64(addr, addr, a->imm);
     tcg_rt = cpu_reg(s, a->rt);
 
-    if (s->ata) {
+    if (s->ata[0]) {
         gen_helper_stgm(cpu_env, addr, tcg_rt);
     } else {
         MMUAccessType acc = MMU_DATA_STORE;
@@ -3832,7 +3832,7 @@ static bool trans_LDGM(DisasContext *s, arg_ldst_tag *a)
     tcg_gen_addi_i64(addr, addr, a->imm);
     tcg_rt = cpu_reg(s, a->rt);
 
-    if (s->ata) {
+    if (s->ata[0]) {
         gen_helper_ldgm(tcg_rt, cpu_env, addr);
     } else {
         MMUAccessType acc = MMU_DATA_LOAD;
@@ -3867,7 +3867,7 @@ static bool trans_LDG(DisasContext *s, arg_ldst_tag *a)
 
     tcg_gen_andi_i64(addr, addr, -TAG_GRANULE);
     tcg_rt = cpu_reg(s, a->rt);
-    if (s->ata) {
+    if (s->ata[0]) {
         gen_helper_ldg(tcg_rt, cpu_env, addr, tcg_rt);
     } else {
         /*
@@ -3904,7 +3904,7 @@ static bool do_STG(DisasContext *s, arg_ldst_tag *a, bool is_zero, bool is_pair)
         tcg_gen_addi_i64(addr, addr, a->imm);
     }
     tcg_rt = cpu_reg_sp(s, a->rt);
-    if (!s->ata) {
+    if (!s->ata[0]) {
         /*
          * For STG and ST2G, we need to check alignment and probe memory.
          * TODO: For STZG and STZ2G, we could rely on the stores below,
@@ -4073,7 +4073,7 @@ static bool gen_add_sub_imm_with_tags(DisasContext *s, arg_rri_tag *a,
     tcg_rn = cpu_reg_sp(s, a->rn);
     tcg_rd = cpu_reg_sp(s, a->rd);
 
-    if (s->ata) {
+    if (s->ata[0]) {
         gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn,
                            tcg_constant_i32(imm),
                            tcg_constant_i32(a->uimm4));
@@ -5460,7 +5460,7 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
             goto do_unallocated;
         }
-        if (s->ata) {
+        if (s->ata[0]) {
             gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
                            cpu_reg_sp(s, rn), cpu_reg(s, rm));
         } else {
@@ -13951,7 +13951,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
     dc->unpriv = EX_TBFLAG_A64(tb_flags, UNPRIV);
-    dc->ata = EX_TBFLAG_A64(tb_flags, ATA);
+    dc->ata[0] = EX_TBFLAG_A64(tb_flags, ATA);
+    dc->ata[1] = EX_TBFLAG_A64(tb_flags, ATA0);
     dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
     dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
-- 
2.34.1

