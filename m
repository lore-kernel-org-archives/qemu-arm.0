Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207385wrv;
        Fri, 26 Jul 2019 10:51:21 -0700 (PDT)
X-Received: by 2002:a17:90a:1ae1:: with SMTP id p88mr95259534pjp.26.1564163481657;
        Fri, 26 Jul 2019 10:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163481; cv=none;
        d=google.com; s=arc-20160816;
        b=HGORXDFCywQCKqFRCNIMfm6H2tOGuVorHhpUp2gBcLCUWVQNwrWf5lGXffk3FlXMNN
         N96t1zPe4pntTpVqWfHlqxCyGIVtHeJIsaaDw2DEkPL5s0Eex8pIZtRYDd+JDVQ2NMt3
         1rMHQYWjsIkBTdadASMXFT6Hp24mkARTp0XrDzWv4wJC+EgAPlM9En+a/KhPYykgwKRx
         v7D3BNTBncK2HpRzUGmu+yHEoDMpAFFlutsSnCUxCzzPPcmL1cY5dv5+jTXoWTaQRHJI
         NStH7bBFTy8O2S0/CU5LTFuStjIIW/YnEV8omNalcF04JGlQzNkyy3FsjN+oEW+WiZud
         bQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=8jS7+sK+VOWigPY1q5W77YMTHCuDnHzgvWGfuf+9BAA=;
        b=oZ+7E9DsrIcpJHq3aIo31gV1y+BJm3kJT2oaSnHF3xoF+CgKL95yhcQsHYnUjj7sOm
         WM7+O3c8dTzZ+dzfexV/AsBiGYEgm9x+94g2WDZ5UN3lHkBOGb2qAYXQGKFNPRqKB8ZV
         mIC88R3k5Sc/ALGHpHExEA4YVsQibB2eK6ozFocULIMi1s3jBdMjqq/Rw2OM/HQGZSgR
         Ay9ct6epKM0eXkfAqieS3O/Z76L0dvCFvxRcWWsLJSusGEaIMH2imA31xSn8UJJEypWM
         GSlUEjlAmeHwotQtJu4jptxLnYHFTecGwzOkSHm+46PbjcKEyqHG+KWCLPcIizURQReu
         Yaqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=azOLCzTt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u18sor34972479pfm.33.2019.07.26.10.51.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=azOLCzTt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8jS7+sK+VOWigPY1q5W77YMTHCuDnHzgvWGfuf+9BAA=;
        b=azOLCzTt87mhEvZFoPs2GqxB8az68wv1L3gzdeqQyminX1GfMMN/y2NhMugWSWXLTh
         paPKGB/xNH6LmwFw5tPCnouRsT/gUWKbiJ2aA4wbDDAZ+e5f00WE6DOBjcPw86sAXB23
         z+l2WRBmT6CLb5DRxMdRoUfoIqWPfrXqS9UXeqfstMCH9b4pbEtRiyHuMRlKXbqEQXdk
         kGggh7bdixhrz8OLp+a1yYKX+a7zdHoPvE0ATHWcxOMTOv9kM0mkCpPM4ksBcMEaXIXQ
         uHgkKqTwI2rjqk9McXYXLwyNEKAiE8Py5tUsiG7eKaQpb+YReNN6cChZUt9yU02MZ5eG
         lmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8jS7+sK+VOWigPY1q5W77YMTHCuDnHzgvWGfuf+9BAA=;
        b=nDKjdld7xwci0ues1Vb5XikRrCEI25runeylu1br+t91NSohNNEYBjpjs1oHYLW0dI
         /q8zHUkwwNEV8D90wt5r2gbsqb8EaVxpcJ89KqmnnZffI9to48qkQkMqIn2he6nvCV5f
         xSyuC5/HdFr4Ix8hLjnPMXpe1x1A3sqebGTsZqmrJK770XoLo2gD17Lk1HUH0wFO910/
         VOZsKTzbzoqISWeB2uqGWlMeac9REHG9RdVV4PsHeYIOlNQ/xiuOVfjHENqnK1GcPTg5
         oQ1AM8yBYPp9H+XYgbNTNTNeX+xCBOzKPWjx+nHmJUcmssQLdA9v/o8ddK/4vmVz27UV
         F89w==
X-Gm-Message-State: APjAAAV/apouJcJamssohyGF2F9oXbU1N61TS5zJ2T15ozK6ItUusYXK
	uwbKEc4tV7gZgHsWAHJzbuSJTKM/0mga3A==
X-Google-Smtp-Source: APXvYqyNooYO1ks8Dbu4+/cbPxHLOh7oVAAPtnFuNiQhik3OflMKJIg8hxjgYGOFcZOFKnnEhIUF8w==
X-Received: by 2002:a62:2d3:: with SMTP id 202mr23840798pfc.131.1564163481243;
        Fri, 26 Jul 2019 10:51:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 40/67] target/arm: Convert TT
Date: Fri, 26 Jul 2019 10:50:05 -0700
Message-Id: <20190726175032.6769-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 3VQa1QPUvkGa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 88 ++++++++++++++----------------------------
 target/arm/t32.decode  |  5 ++-
 2 files changed, 32 insertions(+), 61 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index df515e9341..a750a2c092 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8525,6 +8525,31 @@ static bool trans_SG(DisasContext *s, arg_SG *a)
     return true;
 }
 
+static bool trans_TT(DisasContext *s, arg_TT *a)
+{
+    TCGv_i32 addr, tmp;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
+        !arm_dc_feature(s, ARM_FEATURE_V8)) {
+        return false;
+    }
+    if (a->rd == 13 || a->rd == 15 || a->rn == 15) {
+        /* We UNDEF for these UNPREDICTABLE cases */
+        return false;
+    }
+    if (a->A && !s->v8m_secure) {
+        gen_illegal_op(s);
+        return true;
+    }
+
+    addr = load_reg(s, a->rn);
+    tmp = tcg_const_i32((a->A << 1) | a->T);
+    gen_helper_v7m_tt(tmp, cpu_env, addr, tmp);
+    tcg_temp_free_i32(addr);
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
 /*
  * Load/store register index
  */
@@ -10417,7 +10442,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rs;
+    uint32_t rn;
     int op;
 
     /*
@@ -10461,70 +10486,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     /* fall back to legacy decoder */
 
     rn = (insn >> 16) & 0xf;
-    rs = (insn >> 12) & 0xf;
-    rd = (insn >> 8) & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
         abort();
     case 4:
-        if (insn & (1 << 22)) {
-            /* 0b1110_100x_x1xx_xxxx_xxxx_xxxx_xxxx_xxxx
-             * - load/store doubleword, load/store exclusive, ldacq/strel,
-             *   table branch, TT.
-             */
-            if (insn & 0x01200000) {
-                /* load/store dual, in decodetree */
-                goto illegal_op;
-            } else if ((insn & (1 << 23)) == 0) {
-                /* 0b1110_1000_010x_xxxx_xxxx_xxxx_xxxx_xxxx
-                 * - load/store exclusive word
-                 * - TT (v8M only)
-                 */
-                if (rs == 15) {
-                    if (!(insn & (1 << 20)) &&
-                        arm_dc_feature(s, ARM_FEATURE_M) &&
-                        arm_dc_feature(s, ARM_FEATURE_V8)) {
-                        /* 0b1110_1000_0100_xxxx_1111_xxxx_xxxx_xxxx
-                         *  - TT (v8M only)
-                         */
-                        bool alt = insn & (1 << 7);
-                        TCGv_i32 addr, op, ttresp;
-
-                        if ((insn & 0x3f) || rd == 13 || rd == 15 || rn == 15) {
-                            /* we UNDEF for these UNPREDICTABLE cases */
-                            goto illegal_op;
-                        }
-
-                        if (alt && !s->v8m_secure) {
-                            goto illegal_op;
-                        }
-
-                        addr = load_reg(s, rn);
-                        op = tcg_const_i32(extract32(insn, 6, 2));
-                        ttresp = tcg_temp_new_i32();
-                        gen_helper_v7m_tt(ttresp, cpu_env, addr, op);
-                        tcg_temp_free_i32(addr);
-                        tcg_temp_free_i32(op);
-                        store_reg(s, rd, ttresp);
-                        break;
-                    }
-                    goto illegal_op;
-                }
-                /* Load/store exclusive, in decodetree */
-                goto illegal_op;
-            } else if ((insn & (7 << 5)) == 0) {
-                /* Table Branch, in decodetree */
-                goto illegal_op;
-            } else {
-                /* Load/store exclusive, load-acq/store-rel, in decodetree */
-                goto illegal_op;
-            }
-        } else {
-            /* Load/store multiple, RFE, SRS, in decodetree */
-            goto illegal_op;
-        }
-        break;
+        /* All in decodetree */
+        goto illegal_op;
     case 5:
         /* All in decodetree */
         goto illegal_op;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index c0b962479b..90db05dab6 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -506,7 +506,10 @@ STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
 @ldrex_d         .... .... .... rn:4 rt:4 rt2:4 .... .... \
                  &ldrex imm=0
 
-STREX            1110 1000 0100 .... .... .... .... ....      @strex_i
+{
+  TT             1110 1000 0100 rn:4 1111 rd:4 A:1 T:1 000000
+  STREX          1110 1000 0100 .... .... .... .... ....      @strex_i
+}
 STREXB           1110 1000 1100 .... .... 1111 0100 ....      @strex_0
 STREXH           1110 1000 1100 .... .... 1111 0101 ....      @strex_0
 STREXD_t32       1110 1000 1100 .... .... .... 0111 ....      @strex_d
-- 
2.17.1
