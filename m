Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009288ejf;
        Tue, 16 Aug 2022 13:35:09 -0700 (PDT)
X-Received: by 2002:a05:6808:1487:b0:344:8cb8:da49 with SMTP id e7-20020a056808148700b003448cb8da49mr157988oiw.90.1660682109454;
        Tue, 16 Aug 2022 13:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682109; cv=none;
        d=google.com; s=arc-20160816;
        b=is+U2x+4QPBpjuhPLGo5Fz3F+1SxCBZ/Iemq8i8TaFDEapWjwXIZDT/9UtfA7i8UWO
         DaYYEiLY23kvspiGa2vr35RcnCWQdRB8eSr95c+vDaxM073DBH+DO4q49wG7TV2ID/HW
         PRDlt1Rv+5h/WUcucmdI27nybFRgOOHbA7CPEpRyHBhlqpQYltnWvbFLP92mzPuGtbrz
         ZWyDarvCQ3dOEfDAjpvd9609t9gLPxhHpRg/aDUr9xqPQYXa2qpR15ysyXQyK8DwMQPy
         Au8GxPDpeGv5MoujWICkvaAmaFLA745zit5bCrMx4nxKkD5SqOiaxsdg7tvBj6ju7u+a
         MfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
        b=Th0o/a3Lxc6uy6HNgsDXG2tiHWCZ1zjcP9YXCse0glJNU+6WYmuNah0vSPABkcB28a
         VGYyWv+qmQkIM8MT+I8xNiU0XZvWHbTZZLxrhkPha7DuciDOOz0fcgfNbIKoGSpSZ5by
         h4AMsDuOZDJCqt0Ydk36Toa6MwxHWMgm7qad6iy/tVGyLaMv1rzU/Dlk22Q4ccKeAL+9
         ZlBFvMOGz3ioU4fjhDE1ssl2Mew2eg8iuP+Pxv68o1u3yJT1rkz5ZFxoV+jFYdLMxIGp
         SMXOomp8cS6TDYcytTDfIBTIqfwSsXiX5M/7Drzd7eI2ttDW6QFfvpHBHBfkjYS2dTPl
         8QGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JwuVNg/R";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bk7-20020a056830368700b00636e41c47ffsor1635358otb.0.2022.08.16.13.35.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JwuVNg/R";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
        b=JwuVNg/RJE+pSlfrNHRTjFpEwbACpsYfduMHVnoUdZKxBMBwHvyo0MP28gK34n6uYD
         tjdcfQEz15T0yc4s4cMBfytj/46eSRVOK40ANHelH0z/hblLi+kVSS34jaPTxUAMDI1G
         EEo7MZ9y8ZFq1UX26FEfAbARYWVGA/Xa/o6Ci+HHS1qZEzJAo34K2opARzFfN5XpyPVT
         2rTMLeaXi1QlUK/F4SWDpm9AqjUMBXKYV6Z4rlQ5lNtGUJjnQD7rzocZiderH2PV42r4
         +ZOXyZuhyL1hOvCucrM+4TiXAJAJqbvkvmkJbg2OOYCazFWvrXgU/0yqVZRzfe5hvkH4
         iJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
        b=f2dq+Jod2zdpdC9yOhPMiqoEOQJJiEoe6JsoLoBPNNQ7IRhZti9XfR7EALpCmkSWAd
         uSpzxxTUQAg5LYtlISV89b7ZQPoQle+pWU9EwZLeMMhoaEGUqy+X7OX8jek2+b3yl+lr
         kU75lw6Tv1PIUgUpTypSIZNfCWuQRZ8/1zuYsbcmT1aYz9JdjM0mT2pxHPMXD/ZUlXec
         yDLchXXKFSccm2NSbVW0Dz+Ogl7UEnrcXQpzi85bGGfOh/ITdiVDICsACXhL45Pf94cH
         xMgLFneopgjICaJlVhGnG79nmYPRqlgMkdxKwwhCDYCFaJOZRcNKFslF3KUcUnggAm3p
         QORg==
X-Gm-Message-State: ACgBeo27zOqeKAEhIzHDN0kL54u1HhkW0WAQWfNQotjdExwXceLFaVJH
	A16JGZkHqo3xxvy6ta8K7k5eMHS1
X-Google-Smtp-Source: AA6agR4B0XCIfhsg5kYnfPw6PsEw86GlbiIzzT/A87XIITR56a6OTvenNGb41+enTFcMZ4UuqrcEwA==
X-Received: by 2002:a05:6830:3194:b0:636:e7ef:aa1b with SMTP id p20-20020a056830319400b00636e7efaa1bmr8541227ots.24.1660682109036;
        Tue, 16 Aug 2022 13:35:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:35:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 32/33] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Tue, 16 Aug 2022 15:33:59 -0500
Message-Id: <20220816203400.161187-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aoaVHEINd2co

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
