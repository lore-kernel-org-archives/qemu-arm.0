Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2864578ejh;
        Tue, 6 Sep 2022 03:33:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR64xqUMKHcF1jG0B8dGhYRFIdekH90aPxQXXKil5p8aNkcrHKxfkecNOGpGEEQOSz1DOi8G
X-Received: by 2002:a05:620a:2809:b0:6bc:5e42:fef9 with SMTP id f9-20020a05620a280900b006bc5e42fef9mr35610845qkp.278.1662460411964;
        Tue, 06 Sep 2022 03:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662460411; cv=none;
        d=google.com; s=arc-20160816;
        b=03NH4nDOTg/YJx8DUNlGD1eWhc9A5z3SGmWabeQmwZLcILPwScnhBCemDFZlu8dtBm
         BN6EgQ3PjmSEqsgikYot7+caN7/NjViPbIeOngUmIjl6f2oXaqzhFAXhZf4haHOlTj0t
         VTBWKW4cD/zz6F49kIIh+xRP4UW52FDowyaljCbv+XXKZ2NicwesSqi659vvpOeqDbtZ
         2wuGMUEkjFlUsVdcoOXC8sGY01cwemt64OSGWhJKq56BL7cMRnEgIqydKCKaMKGoiwXc
         2flwLWtQUra4YYG8ZweVymiFRXYzKR+d2glUa3Yg1jeI9KpxxGrG4Rh7MpiQC7pVW5Ts
         kJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
        b=OozKpfdj/1A7iRUDOBgCM6szgplBUOUueEAgQIiwWYNW+5UFA+tajVoOAX/GlFcikn
         /A/f9GGbgd4nmydxyOhzwrunTNJ0p+40aem2oy0z3OM3xj3MvKYvGHphqglWauHkiutD
         5Av73Trlt4oMvX7Gd8XyHj3jJMwapIe9iv43G5T6hTvdvbDi61zJmLqfJEZcC+ALuPJ0
         4weg8Wz0s0zkExArvp+OdoPuSP3OfqCk7GftJEcFHeodrCAax7LNtSdxQHiKcg6V9Y67
         geTq/f+pdzSacJbHrVEkMjt2t5YBEVWeDdaBJY544P56z1jLi5TN6emeTTiECSazOSjv
         g/XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GuvZ6TqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke28-20020a056214301c00b0049906897485si826257qvb.8.2022.09.06.03.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 03:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GuvZ6TqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVVtb-00023H-Es
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 06:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSo-00048w-Hc
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-00034q-9U
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id k9so14678358wri.0
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 03:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
 b=GuvZ6TqAZTd6GUfRAWz+Qgo8/s3x9tVGcYGBbloqFi4EvLDV9O/xuvzv/LEtnQfVzA
 JETo9jLm55Q4Z4xGJqfgKnTIcNuyDkN/dc103+slqjcYwP2FHZRDs79Nsypa1Omy6LjR
 3jNmLhvTAg0Vz35TZZ2T304m+P+QB8kDH0jKzCzwKkswY4zVI7mJuen08z+PJz7R5FVk
 9yQLxy6nmG2spQ86AY9oEZTyC3b8Vd+KoaOIdrYCSqvnb6eaTWU+ywdQMxxDSnOWjXIP
 0UkOWWSRN6qKu7wO9hU120c8wlYP2qTQw8bkIiNH8KIfBbHb16qL0OoYh2mk2TLKznnq
 ATOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
 b=NYZQQhv9RZdvhPD4xfkfKBZfEsdrphIREjPN06PhjlbZunBsmAxtODLBbYGztk1rVA
 IG60NZagdal3hHVL58YRmK7Hph+l+j13RnCvYu72dNyGmkkpXYKgAMjFPuqurb231Uzr
 hndD0IgOvF8p8uV2ajJU6KxZxVmU+U22D3dOJA2XnvyAPkM4jP+HRfGXf+p8r5bGZtQm
 JQEEHzxrt1fRVmQ1hx1dccxFLH2q6Yl1j5CwpbokDZ9EaKLmCI0YDwLYxyRsJFIXhgiy
 ZNvE5RbzlDoko5MjE3s5GuVczsqDPHKun/Fd0eONtfzl/Dwb5JwC6RHECJK5JhhJjwxB
 KsOg==
X-Gm-Message-State: ACgBeo2gEgbaswq8SUEUaCw4Nur/Lso5rXRtCT6QqkQWJkcAGcejEt7z
 9lG1axeNMUDdTHWhXG0tx7O2NthYHSDvRfdg
X-Received: by 2002:adf:e190:0:b0:226:cf09:9c20 with SMTP id
 az16-20020adfe190000000b00226cf099c20mr27451159wrb.62.1662458739933; 
 Tue, 06 Sep 2022 03:05:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Tue,  6 Sep 2022 11:05:27 +0100
Message-Id: <20220906100528.343244-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100528.343244-1-richard.henderson@linaro.org>
References: <20220906100528.343244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ukhtKxCIGMZU

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4d13e365e2..f01c8df60a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -276,11 +276,16 @@ static int jmp_diff(DisasContext *s, int diff)
     return diff + (s->thumb ? 4 : 8);
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, int diff)
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
@@ -1158,7 +1164,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6485,7 +6491,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8356,7 +8362,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8375,7 +8381,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
     gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
@@ -8385,7 +8391,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8395,7 +8401,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8411,7 +8417,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8734,10 +8740,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
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

