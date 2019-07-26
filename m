Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207359wrv;
        Fri, 26 Jul 2019 10:51:19 -0700 (PDT)
X-Received: by 2002:a63:ff65:: with SMTP id s37mr50795300pgk.102.1564163479409;
        Fri, 26 Jul 2019 10:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163479; cv=none;
        d=google.com; s=arc-20160816;
        b=kO2sSHJ51Tl1n/rom2+JvBJ4tXFQetfSkO7y/KbYwQYqaOXZoaBQOSzGFJBTO0ULeL
         XnCAIGd4tE/h6v4LvopX4ctaqQ9lY6Fwh0/Znj9C19+bzMUIK4fY3/NDU2Y+5+0c0J78
         h/pdpvr8lNhdOpCeYQSkusErjveOKjAhi20VfbxuyXKOQWjQRQCSd3iyokgz+6ywD4o5
         Xc2LO39k7HQM3X4PuoJb05rLDGx4AwbBeyicKiJOzS3LQSTQ/E0IY1oPgDZnNY4HHwUO
         oP334yIUZShFEHeT7EIl1Yt+zCVljgaoUYp5RHu4rnv9V0O5I2aNDkhgLoO366iFRIp5
         GL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Sh9+ZbJZjCNeBfWv5489FRe5+z+odNhGeCbGO+HiiUM=;
        b=HLrGtPRPtX51jMa47XqxQa5y9ynfLRKfkmgVjIMNmBN4FVK/GGkoOP/hi4xjObFeCV
         sOZEuCZDBkPXc38nnNjuMf+2r34vYR9tAGjkDHLKuA7h6pHf9eyVuA+gm+rVJcLLRVA1
         NQV4ez5cDhFJrXyd/PUVIuTgHkoSooHS9EaYOe10h7RUh3J+EsLyCvFUZzjcLv7cARxo
         M0W3DJ/YSZZMy5Bbz+i5hN6VhTKFnqG+jK1BO8ytezAWO53CjjrvmHgyYGOPFM7as28v
         1JTM7h71OqfXFAf0jl4KoufK5/CiV13ASxp1zRApeIFqn3gzQxRLw8VHCFrR/RdeQM0m
         P9ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHWanicV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11sor65263248plk.18.2019.07.26.10.51.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHWanicV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Sh9+ZbJZjCNeBfWv5489FRe5+z+odNhGeCbGO+HiiUM=;
        b=nHWanicVGZ+qNGihaHKG85M750QwrldYoN11uKvwbnjDBGSisIypWdoJ8JzDCR1u8b
         KoI3yYYEHzlQenCMcv8EathuGgc1N6OyaNpRpZaOZ3IQwcC07IZv1yZIO3ZuNO3KqlG9
         OVQpMgFzohzX/SDfTeEylpQoxoRVzecAnZL31DbEugHVwn8QZO+K0J9j1f5JfbaTk+4V
         npXHQhVC8tU7092et4/ZyCSr5+cwCli+L5yBk+f6FBBq3xPk9S2PzPKviS3oZBW2dx80
         MrVj6hlxh/0AafF9knjwQ1qenR1yijqamnUl2bOZtul8DTo0HVf3mfxv7StYGfihh9su
         MaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Sh9+ZbJZjCNeBfWv5489FRe5+z+odNhGeCbGO+HiiUM=;
        b=QSmEB2jos6QgQ+h2G2IJ2dx/jmdPTW44WfdcKSdXgw8Kf4IXtPEwtEUxq+O4PRtTm2
         RcXhFFrxFJjRyE5+N6n8wkP/c71dM5TalSKYMf3kgI8Vt+RiOaQgY0Ib5VjvKYYPJ+NW
         iyTlP43nPyh+uBzD16uxlEm3Cdt+73y9DLs7pekNScBO+4Gp9jOO35xgID6D0SERv09K
         dzsfdYSPDbq+6v4aUwYKotjQORfSg97voYgZJTm7oS+wYKbYuUM0cehiPHzLEmDnlnAs
         HDl13VpJ5doA9olMvjJdsMui4yjPMga8gnGeZKPFndberQLBNmAE7LMHj0sHW5nKTdDS
         a2rg==
X-Gm-Message-State: APjAAAXvBzHarHq8zKyTztVhWqHcS+qiXXEdB5BD2HyguvTwiKqEqCTK
	0nRQ6Me6uA+QGQwmxsXVKKUPOiSV
X-Google-Smtp-Source: APXvYqxfHbmUqGJxpwiPSzfAndD92HU5BHC5sSX17Nd4apBq1jRWjPtSsCLrt0P2GebS5WE4IAy6xw==
X-Received: by 2002:a17:902:704a:: with SMTP id h10mr95313561plt.337.1564163478965;
        Fri, 26 Jul 2019 10:51:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 38/67] target/arm: Convert Table Branch
Date: Fri, 26 Jul 2019 10:50:03 -0700
Message-Id: <20190726175032.6769-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: dauEIKL/Vwhe

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 62 +++++++++++++++++++++++-------------------
 target/arm/t32.decode  |  8 +++++-
 2 files changed, 41 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 87cbadc6cb..9c6623fb6b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9979,6 +9979,37 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
+{
+    TCGv_i32 addr, tmp;
+
+    tmp = load_reg(s, a->rm);
+    if (half) {
+        tcg_gen_add_i32(tmp, tmp, tmp);
+    }
+    addr = load_reg(s, a->rn);
+    tcg_gen_add_i32(addr, addr, tmp);
+
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                    half ? MO_UW | s->be_data : MO_UB);
+    tcg_temp_free_i32(addr);
+
+    tcg_gen_add_i32(tmp, tmp, tmp);
+    tcg_gen_addi_i32(tmp, tmp, s->pc_read);
+    store_reg(s, 15, tmp);
+    return true;
+}
+
+static bool trans_TBB(DisasContext *s, arg_tbranch *a)
+{
+    return op_tbranch(s, a, false);
+}
+
+static bool trans_TBH(DisasContext *s, arg_tbranch *a)
+{
+    return op_tbranch(s, a, true);
+}
+
 /*
  * Supervisor call
  */
@@ -10358,9 +10389,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rm, rs;
-    TCGv_i32 tmp;
-    TCGv_i32 addr;
+    uint32_t rd, rn, rs;
     int op;
 
     /*
@@ -10406,7 +10435,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     rn = (insn >> 16) & 0xf;
     rs = (insn >> 12) & 0xf;
     rd = (insn >> 8) & 0xf;
-    rm = insn & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
@@ -10479,30 +10507,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 /* Load/store exclusive, in decodetree */
                 goto illegal_op;
             } else if ((insn & (7 << 5)) == 0) {
-                /* Table Branch.  */
-                if (rn == 15) {
-                    addr = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(addr, s->pc_read);
-                } else {
-                    addr = load_reg(s, rn);
-                }
-                tmp = load_reg(s, rm);
-                tcg_gen_add_i32(addr, addr, tmp);
-                if (insn & (1 << 4)) {
-                    /* tbh */
-                    tcg_gen_add_i32(addr, addr, tmp);
-                    tcg_temp_free_i32(tmp);
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
-                } else { /* tbb */
-                    tcg_temp_free_i32(tmp);
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
-                }
-                tcg_temp_free_i32(addr);
-                tcg_gen_shli_i32(tmp, tmp, 1);
-                tcg_gen_addi_i32(tmp, tmp, s->pc_read);
-                store_reg(s, 15, tmp);
+                /* Table Branch, in decodetree */
+                goto illegal_op;
             } else {
                 /* Load/store exclusive, load-acq/store-rel, in decodetree */
                 goto illegal_op;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index f8d8660466..17e6dae688 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -487,7 +487,7 @@ LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
 LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
 
-# Load/Store Exclusive and Load-Acquire/Store-Release
+# Load/Store Exclusive, Load-Acquire/Store-Release, and Table Branch
 
 @strex_i         .... .... .... rn:4 rt:4 rd:4 .... .... \
                  &strex rt2=15 imm=%imm8x4
@@ -531,6 +531,12 @@ LDA              1110 1000 1101 .... .... 1111 1010 1111      @ldrex_0
 LDAB             1110 1000 1101 .... .... 1111 1000 1111      @ldrex_0
 LDAH             1110 1000 1101 .... .... 1111 1001 1111      @ldrex_0
 
+&tbranch         rn rm
+@tbranch         .... .... .... rn:4 .... .... .... rm:4      &tbranch
+
+TBB              1110 1000 1101 .... 1111 0000 0000 ....      @tbranch
+TBH              1110 1000 1101 .... 1111 0000 0001 ....      @tbranch
+
 # Parallel addition and subtraction
 
 SADD8            1111 1010 1000 .... 1111 .... 0000 ....      @rndm
-- 
2.17.1
