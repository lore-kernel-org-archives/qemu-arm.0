Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206917wrv;
        Fri, 26 Jul 2019 10:50:50 -0700 (PDT)
X-Received: by 2002:a17:90a:9301:: with SMTP id p1mr98957769pjo.22.1564163450789;
        Fri, 26 Jul 2019 10:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163450; cv=none;
        d=google.com; s=arc-20160816;
        b=WT8tSbWcJq4C9hmxbNDLHPP6ljwnmddn0XtGVrkeFnd8ApC+2JAdFaGRJrDNloIUi0
         W7l0MPb1fiwhiEofyKdIlTauXtQ1pXx5l5f5Dlj4tumpTjtE259RjOO7FdTjg7hI+ahe
         C6RVjw152FzDOyhFT2kkaFx6wMRPYwp4XNacAYNV5Akk01+PMESLyVLA6puq/XT4xeV/
         SVahKvF19hXykaWyxSg/NpYEBlcaB+pJDiyx/ymvLxVc+xW+G2Mu1Ls99ONT7UjYFk6B
         r3j4vCN4Q4FcVlApK2tI+FtUX9KMAsQpaLk29CPwjvCRAk+U9sYhlLE6jYv9YzKNwOXP
         b51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=GoQmT1N8IU0T5z5+kFmORBhM2hYdVyMn2yGubYbJrVU=;
        b=MN31PI1APJ7lEu3/WdSnY8WRLi7YgmJFTfczDJFRMiSSX4JlUaeSOuKua0DdLXxvyH
         rM0Z6No9u1LPuJ9AT83Tvab/aHQB04sWmw7HTqYNMyPwIq17IsGbp4hXPPKA1rK+djSv
         qc0KnYE6+5Ubl1283hjju6jiqrqmwooY67RbGCWqTIWzD5GX1q3Wfd0kLQz8foc2xo2x
         AFRKqTK4bet50+sl+j8LsOYEgpdX4fWYCIReisy6VJoU1hd1w+tIauXO5fvh/W+X0wP3
         B/RsfOJQxNGzlKCF18RyOBus3nebLJHYf5kSeKI2M/agS0h+EKyNyuHgWsnlgi+UOCy8
         5t+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBfq2eFV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d33sor65651669pla.46.2019.07.26.10.50.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBfq2eFV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GoQmT1N8IU0T5z5+kFmORBhM2hYdVyMn2yGubYbJrVU=;
        b=GBfq2eFV1G5lsZB/WX3pGNcloK6upS0papCHl/UXrwsYp5VXqeYW+fLFC8i1eTjELU
         78mEuOAAPL62ASIEUm7glkaNSqiIwf3v+hfKZozFCTGrapHYABQoTawYkcyIc2ELBzOK
         SDon1V+FkCkxbhdQUBR62bfEnK4o47FvBHI/jb5SNAvH9sEwEbh7+tU80Hqx0zoaIqCp
         zAGCM0GktRXRroLWSimtWX8meuOOc44a1reUuCXyhavWA9FvSyXUXywRTpR9oT8mCQrI
         pMkFFbdwSZUvOlq9kGujkuPpQPT43/HIdDiqOdWwidXFN7pmCdDdtU6TVjdDnajrMchR
         lOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GoQmT1N8IU0T5z5+kFmORBhM2hYdVyMn2yGubYbJrVU=;
        b=T+SBZMcnkV8XKL9J5LFL7iJxou+eRleo1uPL5cuSmnYPjcH0c87Zp/8zN7t9N5qJaI
         JizuWoOmCHU+EPaLuHtgVtCsup80ZtbApQj/k96hKxgg41HeD0tBcNGRFbKyWXx3j2cZ
         BMTtqBiP+XNdyn8lVLvhunhy5nMDJk8Uyn4K3KXtDb/z/ScVvs3GiFs9LnsWpalEn/ll
         uvH+pUtMXg1C/HqnQsfe7G0H3u/pyHEnYfQJh1RNjYDbVN5eq4GfQam6CGadn+eDBMOB
         UApDMZkrfm+zAZYRNcvfOAGkSIUn5q15Qnt71yC+H2WtKrd+nI8REjo5xvwzAZUNmHB2
         ZJ6Q==
X-Gm-Message-State: APjAAAU9hjoHYux0paTbZGSV4zDc3fFqeE39tv7/7Un/lJLhz8AYJUi7
	A7usYFFAdGqror936TZTIWiU+UMW
X-Google-Smtp-Source: APXvYqzuPxjXezwokKyoSJe/jJW6Og90+IPbgFiK3kAMhbe/BJiSJiUmJxhPHOeGx+ulUTc3iUgC0A==
X-Received: by 2002:a17:902:8ec3:: with SMTP id x3mr95853641plo.313.1564163450345;
        Fri, 26 Jul 2019 10:50:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 14/67] target/arm: Convert multiply and multiply accumulate
Date: Fri, 26 Jul 2019 10:49:39 -0700
Message-Id: <20190726175032.6769-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 3n+f16uPjT+w

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 214 ++++++++++++++++++++++++-----------------
 target/arm/a32.decode  |  17 ++++
 target/arm/t32.decode  |  19 ++++
 3 files changed, 163 insertions(+), 87 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ee7d53dfa5..354a52d36c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7376,21 +7376,6 @@ static void gen_storeq_reg(DisasContext *s, int rlow, int rhigh, TCGv_i64 val)
     store_reg(s, rhigh, tmp);
 }
 
-/* load a 32-bit value from a register and perform a 64-bit accumulate.  */
-static void gen_addq_lo(DisasContext *s, TCGv_i64 val, int rlow)
-{
-    TCGv_i64 tmp;
-    TCGv_i32 tmp2;
-
-    /* Load value and extend to 64 bits.  */
-    tmp = tcg_temp_new_i64();
-    tmp2 = load_reg(s, rlow);
-    tcg_gen_extu_i32_i64(tmp, tmp2);
-    tcg_temp_free_i32(tmp2);
-    tcg_gen_add_i64(val, val, tmp);
-    tcg_temp_free_i64(tmp);
-}
-
 /* load and add a 64-bit value from a register pair.  */
 static void gen_addq(DisasContext *s, TCGv_i64 val, int rlow, int rhigh)
 {
@@ -8068,6 +8053,128 @@ static bool trans_ORN_rri(DisasContext *s, arg_s_rri_rot *a)
 #undef DO_ANY
 #undef DO_LOGIC
 
+/*
+ * Multiply and multiply accumulate
+ */
+
+static bool op_mla(DisasContext *s, arg_s_rrrr *a, bool add)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    tcg_gen_mul_i32(t1, t1, t2);
+    tcg_temp_free_i32(t2);
+    if (add) {
+        t2 = load_reg(s, a->ra);
+        tcg_gen_add_i32(t1, t1, t2);
+        tcg_temp_free_i32(t2);
+    }
+    if (a->s) {
+        gen_logic_CC(t1);
+    }
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_MUL(DisasContext *s, arg_MUL *a)
+{
+    return op_mla(s, a, false);
+}
+
+static bool trans_MLA(DisasContext *s, arg_MLA *a)
+{
+    return op_mla(s, a, true);
+}
+
+static bool trans_MLS(DisasContext *s, arg_MLS *a)
+{
+    TCGv_i32 t1, t2;
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    tcg_gen_mul_i32(t1, t1, t2);
+    tcg_temp_free_i32(t2);
+    t2 = load_reg(s, a->ra);
+    tcg_gen_sub_i32(t1, t2, t1);
+    tcg_temp_free_i32(t2);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool op_mlal(DisasContext *s, arg_s_rrrr *a, bool uns, bool add)
+{
+    TCGv_i32 t0, t1, t2, t3;
+
+    t0 = load_reg(s, a->rm);
+    t1 = load_reg(s, a->rn);
+    if (uns) {
+        tcg_gen_mulu2_i32(t0, t1, t0, t1);
+    } else {
+        tcg_gen_muls2_i32(t0, t1, t0, t1);
+    }
+    if (add) {
+        t2 = load_reg(s, a->ra);
+        t3 = load_reg(s, a->rd);
+        tcg_gen_add2_i32(t0, t1, t0, t1, t2, t3);
+        tcg_temp_free_i32(t2);
+        tcg_temp_free_i32(t3);
+    }
+    store_reg(s, a->ra, t0);
+    store_reg(s, a->rd, t1);
+    if (a->s) {
+        gen_logicq_cc(t0, t1);
+    }
+    return true;
+}
+
+static bool trans_UMULL(DisasContext *s, arg_UMULL *a)
+{
+    return op_mlal(s, a, true, false);
+}
+
+static bool trans_SMULL(DisasContext *s, arg_SMULL *a)
+{
+    return op_mlal(s, a, false, false);
+}
+
+static bool trans_UMLAL(DisasContext *s, arg_UMLAL *a)
+{
+    return op_mlal(s, a, true, true);
+}
+
+static bool trans_SMLAL(DisasContext *s, arg_SMLAL *a)
+{
+    return op_mlal(s, a, false, true);
+}
+
+static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
+{
+    TCGv_i32 t0, t1, t2, zero;
+
+    if (s->thumb
+        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
+        : !ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t0 = load_reg(s, a->rm);
+    t1 = load_reg(s, a->rn);
+    tcg_gen_mulu2_i32(t0, t1, t0, t1);
+    zero = tcg_const_i32(0);
+    t2 = load_reg(s, a->ra);
+    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
+    tcg_temp_free_i32(t2);
+    t2 = load_reg(s, a->rd);
+    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(zero);
+    store_reg(s, a->ra, t0);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+
 /*
  * Legacy decoder.
  */
@@ -8612,71 +8719,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             sh = (insn >> 5) & 3;
             if (sh == 0) {
                 if (op1 == 0x0) {
-                    rd = (insn >> 16) & 0xf;
-                    rn = (insn >> 12) & 0xf;
-                    rs = (insn >> 8) & 0xf;
-                    rm = (insn) & 0xf;
-                    op1 = (insn >> 20) & 0xf;
-                    switch (op1) {
-                    case 0: case 1: case 2: case 3: case 6:
-                        /* 32 bit mul */
-                        tmp = load_reg(s, rs);
-                        tmp2 = load_reg(s, rm);
-                        tcg_gen_mul_i32(tmp, tmp, tmp2);
-                        tcg_temp_free_i32(tmp2);
-                        if (insn & (1 << 22)) {
-                            /* Subtract (mls) */
-                            ARCH(6T2);
-                            tmp2 = load_reg(s, rn);
-                            tcg_gen_sub_i32(tmp, tmp2, tmp);
-                            tcg_temp_free_i32(tmp2);
-                        } else if (insn & (1 << 21)) {
-                            /* Add */
-                            tmp2 = load_reg(s, rn);
-                            tcg_gen_add_i32(tmp, tmp, tmp2);
-                            tcg_temp_free_i32(tmp2);
-                        }
-                        if (insn & (1 << 20))
-                            gen_logic_CC(tmp);
-                        store_reg(s, rd, tmp);
-                        break;
-                    case 4:
-                        /* 64 bit mul double accumulate (UMAAL) */
-                        ARCH(6);
-                        tmp = load_reg(s, rs);
-                        tmp2 = load_reg(s, rm);
-                        tmp64 = gen_mulu_i64_i32(tmp, tmp2);
-                        gen_addq_lo(s, tmp64, rn);
-                        gen_addq_lo(s, tmp64, rd);
-                        gen_storeq_reg(s, rn, rd, tmp64);
-                        tcg_temp_free_i64(tmp64);
-                        break;
-                    case 8: case 9: case 10: case 11:
-                    case 12: case 13: case 14: case 15:
-                        /* 64 bit mul: UMULL, UMLAL, SMULL, SMLAL. */
-                        tmp = load_reg(s, rs);
-                        tmp2 = load_reg(s, rm);
-                        if (insn & (1 << 22)) {
-                            tcg_gen_muls2_i32(tmp, tmp2, tmp, tmp2);
-                        } else {
-                            tcg_gen_mulu2_i32(tmp, tmp2, tmp, tmp2);
-                        }
-                        if (insn & (1 << 21)) { /* mult accumulate */
-                            TCGv_i32 al = load_reg(s, rn);
-                            TCGv_i32 ah = load_reg(s, rd);
-                            tcg_gen_add2_i32(tmp, tmp2, tmp, tmp2, al, ah);
-                            tcg_temp_free_i32(al);
-                            tcg_temp_free_i32(ah);
-                        }
-                        if (insn & (1 << 20)) {
-                            gen_logicq_cc(tmp, tmp2);
-                        }
-                        store_reg(s, rn, tmp);
-                        store_reg(s, rd, tmp2);
-                        break;
-                    default:
-                        goto illegal_op;
-                    }
+                    /* Multiply and multiply accumulate.  */
+                    /* All done in decodetree.  Reach here for illegal ops.  */
+                    goto illegal_op;
                 } else {
                     rn = (insn >> 16) & 0xf;
                     rd = (insn >> 12) & 0xf;
@@ -10292,13 +10337,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     }
                 }
                 if (op & 4) {
-                    /* umaal */
-                    if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                        tcg_temp_free_i64(tmp64);
-                        goto illegal_op;
-                    }
-                    gen_addq_lo(s, tmp64, rs);
-                    gen_addq_lo(s, tmp64, rd);
+                    /* umaal, in decodetree */
+                    goto illegal_op;
                 } else if (op & 0x40) {
                     /* 64-bit accumulate.  */
                     gen_addq(s, tmp64, rs, rd);
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 1db621576f..71846b79fd 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -25,6 +25,8 @@
 &s_rrr_shi       s rd rn rm shim shty
 &s_rrr_shr       s rn rd rm rs shty
 &s_rri_rot       s rn rd imm rot
+&s_rrrr          s rd rn rm ra
+&rrrr            rd rn rm ra
 
 # Data-processing (register)
 
@@ -105,3 +107,18 @@ ORR_rri          .... 001 1100 . .... .... ............       @s_rri_rot
 MOV_rri          .... 001 1101 . 0000 .... ............       @s_rxi_rot
 BIC_rri          .... 001 1110 . .... .... ............       @s_rri_rot
 MVN_rri          .... 001 1111 . 0000 .... ............       @s_rxi_rot
+
+# Multiply and multiply accumulate
+
+@s_rdamn         ---- .... ... s:1 rd:4 ra:4 rm:4 .... rn:4   &s_rrrr
+@s_rd0mn         ---- .... ... s:1 rd:4 .... rm:4 .... rn:4   &s_rrrr ra=0
+@rdamn           ---- .... ... .   rd:4 ra:4 rm:4 .... rn:4   &rrrr
+
+MUL              .... 0000 000 . .... 0000 .... 1001 ....     @s_rd0mn
+MLA              .... 0000 001 . .... .... .... 1001 ....     @s_rdamn
+UMAAL            .... 0000 010 0 .... .... .... 1001 ....     @rdamn
+MLS              .... 0000 011 0 .... .... .... 1001 ....     @rdamn
+UMULL            .... 0000 100 . .... .... .... 1001 ....     @s_rdamn
+UMLAL            .... 0000 101 . .... .... .... 1001 ....     @s_rdamn
+SMULL            .... 0000 110 . .... .... .... 1001 ....     @s_rdamn
+SMLAL            .... 0000 111 . .... .... .... 1001 ....     @s_rdamn
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 7bfd8ee854..8e301ed2a1 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -22,6 +22,8 @@
 &s_rrr_shi       !extern s rd rn rm shim shty
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
+&s_rrrr          !extern s rd rn rm ra
+&rrrr            !extern rd rn rm ra
 
 # Data-processing (register-shifted register)
 
@@ -109,3 +111,20 @@ SBC_rri          1111 0.0 1011 . .... 0 ... .... ........     @s_rri_rot
   SUB_rri        1111 0.0 1101 . .... 0 ... .... ........     @s_rri_rot
 }
 RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
+
+# Multiply and multiply accumulate
+
+@s0_rnadm        .... .... .... rn:4 ra:4 rd:4 .... rm:4      &s_rrrr s=0
+@s0_rn0dm        .... .... .... rn:4 .... rd:4 .... rm:4      &s_rrrr ra=0 s=0
+@rnadm           .... .... .... rn:4 ra:4 rd:4 .... rm:4      &rrrr
+
+{
+  MUL            1111 1011 0000 .... 1111 .... 0000 ....      @s0_rn0dm
+  MLA            1111 1011 0000 .... .... .... 0000 ....      @s0_rnadm
+}
+MLS              1111 1011 0000 .... .... .... 0001 ....      @rnadm
+SMULL            1111 1011 1000 .... .... .... 0000 ....      @s0_rnadm
+UMULL            1111 1011 1010 .... .... .... 0000 ....      @s0_rnadm
+SMLAL            1111 1011 1100 .... .... .... 0000 ....      @s0_rnadm
+UMLAL            1111 1011 1110 .... .... .... 0000 ....      @s0_rnadm
+UMAAL            1111 1011 1110 .... .... .... 0110 ....      @rnadm
-- 
2.17.1
