Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207853wrv;
        Fri, 26 Jul 2019 10:51:49 -0700 (PDT)
X-Received: by 2002:a17:902:100a:: with SMTP id b10mr56847669pla.338.1564163508803;
        Fri, 26 Jul 2019 10:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163508; cv=none;
        d=google.com; s=arc-20160816;
        b=cr6g3L8few8e6l/J7gRtpYWr5BkB04WNrDcsOeFHIkeulKkuofBOG76Q0Kub034R7V
         EyE1OnSdud9dj7UloLNujmsr4xZr+DDi46tIH9a37r7+QvbhRQaB/N+ARrxnoqRVdQ2k
         8fl73qAI6N9oU6a/fwP++xLAxHYus7pnpvkNm0arNxskvmDQd58IhHfVOihIfDafzw+g
         iTyCqFuyfbbmRR55ci/Ax5EFmFJoJf5Oph1UDLwP0sQYHVYSG2KfbjikykDkAM+BuQv9
         x6gWGoTib4FL9Mi+TmYrNhWb6c8SN5MhBJbhXNfIIpAtB12kBT6ADXQvFUaqd+5MFjz3
         WiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=p0rmZulySAyfFLpagWq7oUqjHQLoiP7mX2YCEOpaKkw=;
        b=XNHFMYPSeDTqzWBQBqMCAfLEt2CCT6hqzBCl1WjjD7mqcp5Df34WB5Sl9cb4Cwf9pT
         tbvh+k7Xt45zxY1DBbrUV5k4p7XJaNPTOQZA1h1Ueap/A77Elj1h3VjndVTjE81wXZOS
         o9oHm8ytyJDLnClMAHLuTMcH759x9gu3w7yg+5Pell1XrilOhoURuVeWhUerMEV6Lygo
         8p/jN2ColrI/XzZlzcA0Foryo0Ya1X/TxgqU5iv9f3xCrhLTYPhqiU2yzdQ7KEkQBnTV
         b34ERM85u6m6dZsFlz0OjfXlqO64r283IyyXufDBV/oPEDuZq7dY5w+s5/AJOotibICG
         LUfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cQRG/J8w";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 15sor33001039pgs.16.2019.07.26.10.51.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cQRG/J8w";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p0rmZulySAyfFLpagWq7oUqjHQLoiP7mX2YCEOpaKkw=;
        b=cQRG/J8wdaeIQa1d78ZU1v82b4g3H1w2EnWaY/CpFqWTbdNYoY4OjkLDuT/d1JKiqD
         BZO1NxsAwKo7LmfcyZA6zG4QTX75+laq6A0w8/6Ofx1xKfE1HVqh0D6XIN59O7vfEitv
         8PUIe5fSiibdNIL4cHZfRJ8LqTCcjdGzi5EmOK+VtPe/1dHgh0Nias4XzXVJ5jOxFCMS
         TNyYOMuyseQuRppiv8JCvnmus0kwTGNV53LXWryDDtBkkseOtqN+aLskoVfKfenpedoJ
         hTtFjF4J+UYTQ0LNF834xnFsv+vRsyPzQFp1/D+GJj7WcosPr8cGgY1qAzBrQq/jvdw4
         gV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p0rmZulySAyfFLpagWq7oUqjHQLoiP7mX2YCEOpaKkw=;
        b=FpJt+tq0tVsJ5llbG2uRy5az8H2m1gY6picIyJmIXiPYnga0nJIkN+Ahq4D6CJd02i
         0cSL3RdQ37VFH1hIiB84VC5oXEDinC5M4Iy5X9Zq4QqaS7+DKFGLz2HSixozhkaZUc85
         jXQB+w9b2YKPlnPbNXeFhf9WgCvG0EgQA6eX7Mm0LLVqY5IDFwqPeUDcQN32iuwcojbI
         VPitR6DCVBJDcdTtY7v5QMMdFQZ2srUr8LGRNFd6+1n+5violJx4JhAH9U7eFWRyTw7P
         JlIAYuGBLi9K8lUfxYS/pPW9ttnubUSvI2Xs0xu0g1xLWLQa6TpwnbNyCoL+OtftaljZ
         dy4Q==
X-Gm-Message-State: APjAAAWO1hK4cxBI/bckSdz/iQNq7CH3wmyjOSEZJVD8Y5Z24wRX3DX8
	GuQlwlTCUwWkx/KuharvBURBopp1
X-Google-Smtp-Source: APXvYqwyV4ssXD5XBnpkN0d44Pjw31q0galkVm2aDIJ9LQqyOSSHCSbjMJJc+bxnzppbWU02Oi0Hfw==
X-Received: by 2002:a63:c442:: with SMTP id m2mr93954716pgg.286.1564163508292;
        Fri, 26 Jul 2019 10:51:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 62/67] target/arm: Convert T16, load (literal)
Date: Fri, 26 Jul 2019 10:50:27 -0700
Message-Id: <20190726175032.6769-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: B1O0ToNFKLKw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 42 ++----------------------------------------
 target/arm/t16.decode  |  4 ++++
 2 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f9022fe65c..f1cab437e0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1011,14 +1011,6 @@ static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 a32, int index)            \
 {                                                                        \
     gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
-}                                                                        \
-static inline void gen_aa32_ld##SUFF##_iss(DisasContext *s,              \
-                                           TCGv_i32 val,                 \
-                                           TCGv_i32 a32, int index,      \
-                                           ISSInfo issinfo)              \
-{                                                                        \
-    gen_aa32_ld##SUFF(s, val, a32, index);                               \
-    disas_set_da_iss(s, OPC, issinfo);                                   \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
@@ -1026,14 +1018,6 @@ static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 a32, int index)            \
 {                                                                        \
     gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
-}                                                                        \
-static inline void gen_aa32_st##SUFF##_iss(DisasContext *s,              \
-                                           TCGv_i32 val,                 \
-                                           TCGv_i32 a32, int index,      \
-                                           ISSInfo issinfo)              \
-{                                                                        \
-    gen_aa32_st##SUFF(s, val, a32, index);                               \
-    disas_set_da_iss(s, OPC, issinfo | ISSIsWrite);                      \
 }
 
 static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
@@ -1082,9 +1066,7 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
     gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
 }
 
-DO_GEN_LD(8s, MO_SB)
 DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16s, MO_SW)
 DO_GEN_LD(16u, MO_UW)
 DO_GEN_LD(32u, MO_UL)
 DO_GEN_ST(8, MO_UB)
@@ -10657,11 +10639,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, rd;
+    uint32_t val;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
-    TCGv_i32 addr;
 
     if (disas_t16(s, insn)) {
         return;
@@ -10671,26 +10652,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     switch (insn >> 12) {
     case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodetree */
     case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
-        goto illegal_op;
-    case 4:
-        if (insn & (1 << 11)) {
-            rd = (insn >> 8) & 7;
-            /* load pc-relative.  Bit 1 of PC is ignored.  */
-            addr = add_reg_for_lit(s, 15, (insn & 0xff) * 4);
-            tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s),
-                               rd | ISSIs16Bit);
-            tcg_temp_free_i32(addr);
-            store_reg(s, rd, tmp);
-            break;
-        }
-
-        /*
-         * - Data-processing (two low registers), in decodetree
-         * - data processing extended, branch and exchange, in decodetree
-         */
-        goto illegal_op;
-
+    case 4: /* ldr lit, data proc (2reg), data proc ext, bx; in decodetree */
     case 5: /* load/store register offset, in decodetree */
     case 6: /* load/store word immediate offset, in decodetree */
     case 7: /* load/store byte immediate offset, in decodetree */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index ddffd073a2..c18d146a84 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -113,6 +113,10 @@ LDRH_ri         10001 ..... ... ...             @ldst_ri_2
 STR_ri          10010 ... ........              @ldst_spec_i rn=13
 LDR_ri          10011 ... ........              @ldst_spec_i rn=13
 
+# Load (PC-relative)
+
+LDR_ri          01001 ... ........              @ldst_spec_i rn=15
+
 # Add PC/SP (immediate)
 
 ADR             10100 rd:3 ........             imm=%imm8_0x4
-- 
2.17.1
