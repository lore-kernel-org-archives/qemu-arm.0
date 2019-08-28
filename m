Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1205803wrs;
        Wed, 28 Aug 2019 13:01:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxEFzDXDIJI4Oyo54q5yESeg7++1BnpfskiFefTpR8Sm0R6fIoV5qytoM60BqitZFfEuav
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr5875319qka.3.1567022471043;
        Wed, 28 Aug 2019 13:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022471; cv=none;
        d=google.com; s=arc-20160816;
        b=h3YocVoyICpVdS70pLeVInCu7hQtniSsEFw6ztphOb9PyHJwelPi9dMALM0pdctE8n
         sH2GjV5JnZLQEbjz790NM91IhC7FGsIT5Syb+nc+UappuD2VI55HX5oIcOGLW4xfSm4u
         FY/3bFYHhH4etUdjckN5T5YLv7pDGMrMMb7X0aKaZdCsINPl57F9UBS3OUrfez2PZLLP
         m+pPoqwfsSgUUY/izQjNd9pyc/c3UMsnmkAAthUd6lJ8Qlr8WApmRQqEDd7DpiMKelCf
         81lQRdNCVNlDeGLu+iodWVqJIPUddm0vd9bc0iGo4jhdrZITzLxXZXyUQGX2LaOYfapt
         YRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ijHYxCUn6f0ZOEbuhhCiCPGi01F+vFhNmSbEgOS+/68=;
        b=0JwCZjSvDXwmiBkk2cvWHcxbjkL6oPtCHjJvmNCKVMqjAicO/uEFPzIpP/9Dkuvhm6
         er4u4IRo7G2+5uCjtGylfZhLP5dJM81cDkpDI4feelR4QGSaqBZhbnPECT6E10YGLjba
         N04hBiVAAP/KUGXSDl339BZp52jfspxf9tuoRJ/YwWkhH8akagYutaGZitTpeZTQul1M
         xrE6yffA8lE/gzGI6jwdJkxzB4tLYv5OeGSM+tn8L0HwCRVMuHtOVSxu1qLS3HQR5ENp
         uD27X7F/Vxhdn0Orq9xSgxNWXoQm7wkIm1qIue1GYo+UffNk5hX7+HWVZtSj6iPOddQP
         2luA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vqHQQrXG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14si129964qta.273.2019.08.28.13.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vqHQQrXG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i347y-0000Jd-0Z
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H3-00044i-0T
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gz-0000nz-NQ
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:28 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40507)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gy-0000m7-Dy
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:25 -0400
Received: by mail-pl1-x641.google.com with SMTP id h3so394195pls.7
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ijHYxCUn6f0ZOEbuhhCiCPGi01F+vFhNmSbEgOS+/68=;
 b=vqHQQrXGPGevYm38GhQ67ZOa0a/PVes8aUV0mGiHniBhkDzKBG8RTmPdSixRXGGj8B
 nmjmF9+KOViNCTK6GYNRBv6pxQuVDh71NHSoxxdZllQK9BN1lbKcGjBQ3Y3g9SEqlThN
 S+MYgHJ7JWqVx/3D43TXqOz7JbhTfeS9N+amhptFeqqFSxZXRuAJe7jv5A92qHMLrc5J
 ySfzS00gkazwf2cXMq5fUEtiYvn6/KMAVALs5b3wCsCekfSau/kW40kqhCneXBr9woOx
 DozSFl3zj4z9M6WjMbArPFXLOTyChYQ9kvP3MlEze6r6mWm7x6PPGJx2PmI1eXSVQQo1
 F4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ijHYxCUn6f0ZOEbuhhCiCPGi01F+vFhNmSbEgOS+/68=;
 b=ahKqU9F7BOclZuLmbbuLxGuJwSxPJxVFVJjZ+VprZNGpVBJv/6ENQ1LGbXXbYpLuos
 /w3G/2OjYRwImDycm8UPJYDxencGsQ2UC+QVHyz/Iq8bl54OfU3QV0LKcZqK+G5b9+4J
 r3pyH65u40ewVwWGvcdoiCdkq5fpVC202YmRn6HaxnBYOQxdYj6Pzg8nm+bKyzG1Glct
 mdX3DpJr8F8/+ZDIkpGUNeKfxOicUMAdfSZahod6rtv10xfBTrWmKeI+s2mQzXLemMKR
 mFmsyJ1bIo20aLxtyryfxZsKkDYemMnT1jJPYcD7+81WddLUW4ccpuJMhBoPdZouRVL0
 4rTg==
X-Gm-Message-State: APjAAAWZ5HAOYqu/C2bA+QZezIBNSVdWl+bSkAf3MABG1ShD7HExnazw
 LhM47MgFH95wGU4qjODAXpOhInFwOx0=
X-Received: by 2002:a17:902:74c7:: with SMTP id
 f7mr1749065plt.263.1567019181992; 
 Wed, 28 Aug 2019 12:06:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:52 -0700
Message-Id: <20190828190456.30315-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v3 65/69] target/arm: Convert T16,
 load (literal)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lmlDNNW3mW/r

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 42 ++----------------------------------------
 target/arm/t16.decode  |  4 ++++
 2 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dd292b3042..fe9f7e4f42 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -963,14 +963,6 @@ static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
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
@@ -978,14 +970,6 @@ static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
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
@@ -1034,9 +1018,7 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
     gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
 }
 
-DO_GEN_LD(8s, MO_SB)
 DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16s, MO_SW)
 DO_GEN_LD(16u, MO_UW)
 DO_GEN_LD(32u, MO_UL)
 DO_GEN_ST(8, MO_UB)
@@ -10731,11 +10713,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
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
@@ -10745,26 +10726,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
index 79a1d66d6c..0b4da411e0 100644
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

