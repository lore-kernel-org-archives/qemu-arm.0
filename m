Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1274420lfk;
        Sun, 17 Apr 2022 11:10:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbSHLEIdEx1myjPTbt9cM+Eq3xuEqAj4FvZSzijJgSXmlcuTZT3gE5JNV4hx2y0AnXmvRL
X-Received: by 2002:a05:620a:2086:b0:69e:84bf:9592 with SMTP id e6-20020a05620a208600b0069e84bf9592mr3176697qka.344.1650219050459;
        Sun, 17 Apr 2022 11:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219050; cv=none;
        d=google.com; s=arc-20160816;
        b=U76hCUHw8XWyjGSXOcuDaTbBZ7Kb1ddhF4rxYAIHLufNuAXICsfsckr71Y7RtoK5IK
         n9Z1mLwxsclkKew772YRoBTHPpOD/ZNbd0FY6dYyHIrqlisjHSwJD6vvKzQzODfxf9+p
         +dE8M1Ec9LnH0yRjlXRp+MfO6h9YMiJqblQ8zVT/5bQQcm5bTS/VJjx5TKNH+npF6N41
         kyKqZDWG4q2vY3XqAWY5TtHXrV6IADUoSOyyTRaHXgQpFttOdK3hvHCUO70kfPv06HC4
         +ARUEGmNV7wzSv34ONQj6QqdjU3kGOjj7DPBEQvNZTZ1ljTiXGVw1VNaVJy+C/w2IZ01
         j9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=R9t04A2fMNf/j0rLfzwp96zli6WbNRwThiKfiyjip1Q=;
        b=BByuyaBmMIXFI8vjGcXgNpCruMhZQz2yozd+++m4hrFfr3RYgmQnnPL+OFU6wF+jOW
         jtYW62w12tuW+HJaUfhytmDV92KYjhd82LxZuCR1U3npPTaMZ55Dxy2VTaz9SQg+fDHS
         rDdIczh8mSEYbDdHi19WZhxBIXYNyYzXhUxsfbcPmrf9y/QTpy/t+ab1nb9m+KckJU3h
         x5Spvar0w4OCMkQdfJuIgLnpofW49+p60R8TSzc4PBFcsRCKZ7sHc0iAyBSCSsBM4EPY
         6nwkZlDZyDaggq8uE2/S16qheuGnLgmLsatUTTJA+4uPEM3vWoDRG4ONW9g5DnPUlI6c
         JCfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pjAgOhvO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw15-20020a0562140f0f00b00446178c7d2bsi2494842qvb.0.2022.04.17.11.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pjAgOhvO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9MH-0001lp-Vb
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x9-0000mH-BB
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:51 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x6-0003Ka-CI
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:51 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so732945pji.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9t04A2fMNf/j0rLfzwp96zli6WbNRwThiKfiyjip1Q=;
 b=pjAgOhvO4E7QNWcocOq2KdCapxIekgveVEVmm43mVJpFBMAHBGZN1h1sQvkYsyLnrl
 c02SULDFsXOIs8MhWk6ox0xfVJz/kd2o82q11AwSLnKzn4SLGuJEpsEL7XctQ7Ltthn0
 a9kSwsXW2SgMjn2n0rX5odm50rfDmbZNAvbliIliQEqm3g2MLbksvsrb+JtVmBWreR3g
 EWxzKnNXH77XfghkB+HSXz4QTibUgqdM1mNe1MnE1do5UvSK1LsaR5powSbqwrowFNrG
 Q6Wr8/1TgrBu+9oJTgovR5k6sjMAjrmzV2rBd9r507km9GGSRyofEUdyOlwuWT3gljRy
 bDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R9t04A2fMNf/j0rLfzwp96zli6WbNRwThiKfiyjip1Q=;
 b=TWPtYMwfrxy2K0MaIixPFL2A7oYJXEQY6L3UF/uWhZ/LEyWQDccr52KU9SLrwOmBwI
 Dn42zOmrQcetHp1MeBiUMFkYMFxuGD8HRnBr8oBUA3zbybBIRnxSuBpsZsHRhIfQ4t4N
 5e5FGztRzFommijenkGWtpjQNDEvFua/qGZHKG4vxJKw0A8Y2FQc1AxNiUxW/3gEotV1
 rNthUG6xGxv6D4EeKttkZKOeRPMyiNRs8ZxmJ9ODK6yEdry+NrRG3U5CndES70yOscRZ
 w49lKQqu29gOL9c1KbIEibdohPcZQa32veLxRhoKxvcynAzhHgtSZNXDpn5RoCw6Vl+j
 lXcw==
X-Gm-Message-State: AOAM5302yRRpqqINpZNtEilOzzQCjOZQ8TCZr+S7ysfPd7v2Lv04KVrW
 O+xQG7WKQTM/DXehC9xMbiDIYFLQGELzIg==
X-Received: by 2002:a17:90b:4f45:b0:1d2:21e5:905d with SMTP id
 pj5-20020a17090b4f4500b001d221e5905dmr8047847pjb.18.1650217486584; 
 Sun, 17 Apr 2022 10:44:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/60] target/arm: Use tcg_constant in translate-neon.c
Date: Sun, 17 Apr 2022 10:43:45 -0700
Message-Id: <20220417174426.711829-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kqiKsfZiqTyd

Use tcg_constant_{i32,i64} as appropriate throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 384604c009..2e4d1ec87d 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -447,7 +447,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
-    TCGv_i32 addr, tmp;
+    TCGv_i32 addr;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -513,7 +513,6 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 
     tmp64 = tcg_temp_new_i64();
     addr = tcg_temp_new_i32();
-    tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
 
     mop = endian | size | align;
@@ -530,7 +529,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                     neon_load_element64(tmp64, tt, n, size);
                     gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx, mop);
                 }
-                tcg_gen_add_i32(addr, addr, tmp);
+                tcg_gen_addi_i32(addr, addr, 1 << size);
 
                 /* Subsequent memory operations inherit alignment */
                 mop &= ~MO_AMASK;
@@ -538,7 +537,6 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
         }
     }
     tcg_temp_free_i32(addr);
-    tcg_temp_free_i32(tmp);
     tcg_temp_free_i64(tmp64);
 
     gen_neon_ldst_base_update(s, a->rm, a->rn, nregs * interleave * 8);
@@ -1348,7 +1346,7 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
      * To avoid excessive duplication of ops we implement shift
      * by immediate using the variable shift operations.
      */
-    constimm = tcg_const_i64(dup_const(a->size, a->shift));
+    constimm = tcg_constant_i64(dup_const(a->size, a->shift));
 
     for (pass = 0; pass < a->q + 1; pass++) {
         TCGv_i64 tmp = tcg_temp_new_i64();
@@ -1358,7 +1356,6 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
         write_neon_element64(tmp, a->vd, pass, MO_64);
         tcg_temp_free_i64(tmp);
     }
-    tcg_temp_free_i64(constimm);
     return true;
 }
 
@@ -1394,7 +1391,7 @@ static bool do_2shift_env_32(DisasContext *s, arg_2reg_shift *a,
      * To avoid excessive duplication of ops we implement shift
      * by immediate using the variable shift operations.
      */
-    constimm = tcg_const_i32(dup_const(a->size, a->shift));
+    constimm = tcg_constant_i32(dup_const(a->size, a->shift));
     tmp = tcg_temp_new_i32();
 
     for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
@@ -1403,7 +1400,6 @@ static bool do_2shift_env_32(DisasContext *s, arg_2reg_shift *a,
         write_neon_element32(tmp, a->vd, pass, MO_32);
     }
     tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(constimm);
     return true;
 }
 
@@ -1457,7 +1453,7 @@ static bool do_2shift_narrow_64(DisasContext *s, arg_2reg_shift *a,
      * This is always a right shift, and the shiftfn is always a
      * left-shift helper, which thus needs the negated shift count.
      */
-    constimm = tcg_const_i64(-a->shift);
+    constimm = tcg_constant_i64(-a->shift);
     rm1 = tcg_temp_new_i64();
     rm2 = tcg_temp_new_i64();
     rd = tcg_temp_new_i32();
@@ -1477,7 +1473,6 @@ static bool do_2shift_narrow_64(DisasContext *s, arg_2reg_shift *a,
     tcg_temp_free_i32(rd);
     tcg_temp_free_i64(rm1);
     tcg_temp_free_i64(rm2);
-    tcg_temp_free_i64(constimm);
 
     return true;
 }
@@ -1521,7 +1516,7 @@ static bool do_2shift_narrow_32(DisasContext *s, arg_2reg_shift *a,
         /* size == 2 */
         imm = -a->shift;
     }
-    constimm = tcg_const_i32(imm);
+    constimm = tcg_constant_i32(imm);
 
     /* Load all inputs first to avoid potential overwrite */
     rm1 = tcg_temp_new_i32();
@@ -1546,7 +1541,6 @@ static bool do_2shift_narrow_32(DisasContext *s, arg_2reg_shift *a,
 
     shiftfn(rm3, rm3, constimm);
     shiftfn(rm4, rm4, constimm);
-    tcg_temp_free_i32(constimm);
 
     tcg_gen_concat_i32_i64(rtmp, rm3, rm4);
     tcg_temp_free_i32(rm4);
@@ -2911,7 +2905,7 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
         return true;
     }
 
-    desc = tcg_const_i32((a->vn << 2) | a->len);
+    desc = tcg_constant_i32((a->vn << 2) | a->len);
     def = tcg_temp_new_i64();
     if (a->op) {
         read_neon_element64(def, a->vd, 0, MO_64);
@@ -2926,7 +2920,6 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
 
     tcg_temp_free_i64(def);
     tcg_temp_free_i64(val);
-    tcg_temp_free_i32(desc);
     return true;
 }
 
-- 
2.25.1

