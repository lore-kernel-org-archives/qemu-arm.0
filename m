Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp190451ocb;
        Wed, 5 Oct 2022 20:55:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Rpxk32w6KrIBgwgmt3A1i8Tc2Tp4PJqiUAQiwIo0GpRrnw9lB37bKoWjfV3Mre+xnz0nS
X-Received: by 2002:a05:622a:182a:b0:35b:b0aa:f418 with SMTP id t42-20020a05622a182a00b0035bb0aaf418mr2009637qtc.379.1665028550744;
        Wed, 05 Oct 2022 20:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665028550; cv=none;
        d=google.com; s=arc-20160816;
        b=uNRYqehHQO9ubawkqJE3tn6MmVypI1sZDtuC3NAFQBwO6Dtgzv2NspD7Ejj/Z5fyr/
         ph+Cs/79dHRI29N0e+Z+QbJggult3GzyyvgQlDfMmMPeSzrFzab6czFpwUdk/+uyS0iT
         wF9iVKmYZvrk1c/GICRWcmAwkRRQTpPVNBkldrWpIFGEZCmmJKKzWQP+/pJZEjzn1sCY
         F6stR2bKrhAnMOfDe0tgbhndvHzNnhrUhuBooDfN6pjg48KqSl4vbI1bMEMwDa2HuPVz
         M62pRbi9JkhintZpNuybL5wyNGtutGiY9rzjQFSOSCvsQV4Bue7rhI5Euz9+fpURxl5v
         SSow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hxkewtWvPGUBefmuaGVs8yKIdDHYoI2r+L5xurseZpc=;
        b=BDLmHNTFgtf3yfmLdUOBSmbU8Xxv6xLQOLWK5+SmjG3Ff1nhbkOko8yhvktI65eE+3
         WQ+LJcK/HIV/2ihtKweDWmqZTJlyIWeZ3DAip8aoUUS1ppUNNUSzmzrVmzG6qU3qSLRZ
         150js/ANC+KUWIurjxuhxGmD1MkrU17SrR6Aeb8b++qSQi1cQSynxZRWJ0+ilNkQFa4C
         Wm43SBB/MG+CZzHN1mlG51IsjU/fagbroms6QQXGWKNebQQp4dw63PyJrN5LRK3l9MPB
         3CbmJkz2qOoJJTpzIujVaaOCKRGLfT1fkqH5CaQf83bjODhW1es+AqYqVJfoJE6UGuS5
         uuzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GkuRXKXK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a05622a029200b0035cea4818desi7751068qtw.730.2022.10.05.20.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Oct 2022 20:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GkuRXKXK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogHzC-0007zH-Av
	for alex.bennee@linaro.org; Wed, 05 Oct 2022 23:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiw-00038b-9b
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 23:39:02 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:39911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiq-0002vM-ER
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 23:39:02 -0400
Received: by mail-pf1-x430.google.com with SMTP id d10so905974pfh.6
 for <qemu-arm@nongnu.org>; Wed, 05 Oct 2022 20:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hxkewtWvPGUBefmuaGVs8yKIdDHYoI2r+L5xurseZpc=;
 b=GkuRXKXKrpK87JmzqXZm24r1N1RxiHCTAfdfYC0JpXdKUuFLEdXNtrHnxy3cPj7VvA
 8lh/D11UtZZ566JE8/Tj+DqtSwDne3+WRgAWx8PdFEnyF+30owYLGY0cqabAq3sD5o0O
 Eud7fNmMtQ7AM+NU3PBeE+JuO2cm6dqkYdeGqI8CQ5j9ZGuY5xshLbf6mkdVpCS+p7kl
 NNrAgMalFCXwc7gVOuMvuFfgulxg/oMqjzK8a4ghvvousCf627McRqxJtKyL0DNdg1B3
 gpnsaUZDnYceKM1V5zOWH1ZeyTRTYdEXI9hOW6d1AvUo4NaktVHrXqUXpUPJtXuZwtAO
 faHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hxkewtWvPGUBefmuaGVs8yKIdDHYoI2r+L5xurseZpc=;
 b=LQPRV0YUKO39z4cv9vpAUmS9VRz7JnBcbBMtdMzBpSUh1/75ChTLfWQoVwMz2waa8R
 nqTp50dJO1liU+N0EMMY+XVfVEyxo7ypCSduN6szGHeUrVzmW/sdu3QMTchzK/d1BXQt
 1vUzCaWp2copUB99b9XCT6Jd8IhbRqS0NhOB+B8uGVb9cXDY5dJX9o9ZRHktPaCRQmMA
 zYSg8cyN4JkJi3djmNKkN6/v/6DNgT4EXNFAUN5+/7yOT0Mbn9CoFzu+rIIR+xirEsyH
 eSZjmxRVCqqMDJLbJwBW1grDpGIRG/SpU/Y7Usi+YFdwYljgNW/t5mtNACdpJsONuTcO
 YyZQ==
X-Gm-Message-State: ACrzQf3l/KR2vTYcWP/36tEVhCk0dTjzjrgD8LQvsNn/D0VsaW49A9fT
 Byzjlk6IzCOiDwEPV/lbwGK/KA==
X-Received: by 2002:a63:3104:0:b0:459:a367:95ad with SMTP id
 x4-20020a633104000000b00459a36795admr2766397pgx.112.1665027535231; 
 Wed, 05 Oct 2022 20:38:55 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Wed,  5 Oct 2022 20:38:45 -0700
Message-Id: <20221006033846.1178422-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006033846.1178422-1-richard.henderson@linaro.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: Pyw4wdC4MxxX

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 336f151c4a..7c1e277732 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -276,11 +276,16 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
     return diff + (s->thumb ? 4 : 8);
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
+{
+    tcg_gen_movi_i32(var, s->pc_curr + diff);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
     if (reg == 15) {
-        tcg_gen_movi_i32(var, read_pc(s));
+        gen_pc_plus_diff(s, var, jmp_diff(s, 0));
     } else {
         tcg_gen_mov_i32(var, cpu_R[reg]);
     }
@@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     if (reg == 15) {
-        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
+        /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
+        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
     } else {
         tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
     }
@@ -1159,7 +1165,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6483,7 +6489,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8351,7 +8357,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8370,7 +8376,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This jump is computed from an aligned PC: subtract off the low bits. */
     gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));
@@ -8380,7 +8386,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8390,7 +8396,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8406,7 +8412,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8729,10 +8735,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
     tcg_gen_add_i32(addr, addr, tmp);
 
     gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), half ? MO_UW : MO_UB);
-    tcg_temp_free_i32(addr);
 
     tcg_gen_add_i32(tmp, tmp, tmp);
-    tcg_gen_addi_i32(tmp, tmp, read_pc(s));
+    gen_pc_plus_diff(s, addr, jmp_diff(s, 0));
+    tcg_gen_add_i32(tmp, tmp, addr);
+    tcg_temp_free_i32(addr);
     store_reg(s, 15, tmp);
     return true;
 }
-- 
2.34.1

