Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207171wrv;
        Fri, 26 Jul 2019 10:51:08 -0700 (PDT)
X-Received: by 2002:a17:902:e287:: with SMTP id cf7mr96685737plb.32.1564163468042;
        Fri, 26 Jul 2019 10:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163468; cv=none;
        d=google.com; s=arc-20160816;
        b=xZE9yFnJYjxfaA1fwNBJlBZWMy54O/7TkOA37A7EEPRXOfuoWXPSFYt724MrHfaBy1
         n+13B2WJpsy1paRg69sFvk2nn5xdmeOHKaszZKVwvywXItIWd+eUOhwweG7I6TGsLMWK
         k78A+KEXiy/VNbdHANmgtqeA/fkxztqip9M+QQdGj2Kf0RXSUhfIIMMphb4dXwbbG3Fx
         Azj+WwlpmJ+uB7vrTmK7n2AfeHuIsX3CaXVTaliQhBQBwIZQiBcR8wJNEzHlFaUkhAYA
         dU/xDBljumQBTZyCLijfqvQbm2f4Gy5aDQQss6qnZ6gGtfrJEFOUPcgBFgBYsKUSZKxd
         rRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=S4Q7S2OdhUkyh4FYS2Teg9nr51SAo2OgSkvWrjYq2oc=;
        b=Ce78Qjz4DjzmbE54LBu6Etq6N9c0ZgsGE5wcBpowePA5T6Esl1nv3YBsnzwbrnLUdU
         Ej+l+0XuCBQ6YpvhvrzGNe2CW72YGuuJwZeBIOWBfxllr6zj0ZrTWSRlPgsG0svLRrww
         jLu8QAjS3ojpoQJhoE5U81iMz3XQ/M1bXE5ZrICMdrh5TWfwAiC0GNc6WOGSIQKTPI8n
         huavfzgBIqv9BTOQpo+sopvF2IsG71A8/BmFils3ZxZXnteMnTjXSql3c9KJYTfeAlfA
         JNXcxUWtaQz+YtrAdbKgAbQDfn9BchzRB6mBMgCTfNbWDhUDjkbQ9OCz6bUwQ4m3WeXq
         4EHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yAlfUCLG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w20sor65364631plp.27.2019.07.26.10.51.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yAlfUCLG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S4Q7S2OdhUkyh4FYS2Teg9nr51SAo2OgSkvWrjYq2oc=;
        b=yAlfUCLGaE+K/ycrFuqkUrax+2KjApxCrDsxWgJP8krVVSNuMV0OY129PFHRt7NUfb
         MZ+pO47e+xOb6q4dwfQb8dDryP+hGi9T7iK4rnsztrOBVEfpt1vinn7xTEpp+TqT6oYw
         VRpWunzO/rNOE7ItF3wc8O8+loGldHc9q4kFTXpP0VetRFtAIcrkZZkLt/wLGboalAO9
         UQPfxBKLEgmaUIA3qj2AflhCfcID6o2bFDn3uUMzBhQIK6oa6s8J+MgBleEqoAAC/QmQ
         T0amOkHxIaGi//H61V7UqQ1UpWTJPZs7Vo2R3OzSgg7crrASDUKzs9CMCH62y0nNr0Fw
         yeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S4Q7S2OdhUkyh4FYS2Teg9nr51SAo2OgSkvWrjYq2oc=;
        b=TJIiL9q8dJ3sdeX3MZEuU1FGFEZovzN3Mw5JrcrLpGnjl6a3YrCRNurovxlSwTNyop
         RmqkpBZpidNZkuog5M4SiYDNb8lwLUKYWgZLREDZNynv+/damsh/3smBN+fvCTbAcOLi
         B4qXrZFdqfcB+A8w23SaTx9t2pbobgRzcKXO1sLlFOcqKkEyZBHI1zLC8BLpPnUZMGm0
         416LSD8FgAOk9fXzirtP/21ztQdxo6bmGOMPKwvmDeX0FDUtfpbIB20DbJhi91uHTS4s
         aY8js+IZDnOfWPWbDyNlfzgyF59wgy/na2O1mjIFmM4511/1MFrdN5xG8hIqcX0rw3Nd
         ofnA==
X-Gm-Message-State: APjAAAVinFznApjwvW9IH/W4Z8dXTOJUZyf/dPF83Fp/aLTeip17aeoz
	h9Y3T/MlqSAGnBBd+mNc4HZTZJdu
X-Google-Smtp-Source: APXvYqxN1S4kYTBTQyY707CtXFtWGFXUQFy8wQiQR4SJItngivxxqgUdUuqBAi3jlpqtx0d80fb+dw==
X-Received: by 2002:a17:902:d70a:: with SMTP id w10mr92326794ply.251.1564163467636;
        Fri, 26 Jul 2019 10:51:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 28/67] target/arm: Convert MOVW, MOVT
Date: Fri, 26 Jul 2019 10:49:53 -0700
Message-Id: <20190726175032.6769-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: yvKp4kfCWRDw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 89 ++++++++++++++++--------------------------
 target/arm/a32.decode  |  6 +++
 target/arm/t32.decode  |  9 +++++
 3 files changed, 48 insertions(+), 56 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5bdec27265..ee97a0ccdd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7919,6 +7919,34 @@ static bool trans_ADR(DisasContext *s, arg_ri *a)
     return true;
 }
 
+static bool trans_MOVW(DisasContext *s, arg_MOVW *a)
+{
+    TCGv_i32 tmp;
+
+    if (!ENABLE_ARCH_6T2) {
+        return false;
+    }
+
+    tmp = tcg_const_i32(a->imm);
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
+static bool trans_MOVT(DisasContext *s, arg_MOVW *a)
+{
+    TCGv_i32 tmp;
+
+    if (!ENABLE_ARCH_6T2) {
+        return false;
+    }
+
+    tmp = load_reg(s, a->rd);
+    tcg_gen_ext16u_i32(tmp, tmp);
+    tcg_gen_ori_i32(tmp, tmp, a->imm << 16);
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
 /*
  * Multiply and multiply accumulate
  */
@@ -9720,7 +9748,7 @@ static bool trans_UDIV(DisasContext *s, arg_rrr *a)
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, val, op1, i, rn, rd;
+    unsigned int cond, val, op1, i, rn;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
@@ -9966,26 +9994,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     /* fall back to legacy decoder */
 
     if ((insn & 0x0f900000) == 0x03000000) {
-        if ((insn & (1 << 21)) == 0) {
-            ARCH(6T2);
-            rd = (insn >> 12) & 0xf;
-            val = ((insn >> 4) & 0xf000) | (insn & 0xfff);
-            if ((insn & (1 << 22)) == 0) {
-                /* MOVW */
-                tmp = tcg_temp_new_i32();
-                tcg_gen_movi_i32(tmp, val);
-            } else {
-                /* MOVT */
-                tmp = load_reg(s, rd);
-                tcg_gen_ext16u_i32(tmp, tmp);
-                tcg_gen_ori_i32(tmp, tmp, val << 16);
-            }
-            store_reg(s, rd, tmp);
-        } else {
-            /* MSR (immediate) and hints */
-            /* All done in decodetree.  Illegal ops already signalled.  */
-            g_assert_not_reached();
-        }
+        /* All done in decodetree.  Illegal ops reach here.  */
+        goto illegal_op;
     } else if ((insn & 0x0f900000) == 0x01000000
                && (insn & 0x00000090) != 0x00000090) {
         /* miscellaneous instructions */
@@ -10725,42 +10735,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             /*
              * 0b1111_0xxx_xxxx_0xxx_xxxx_xxxx
              *  - Data-processing (modified immediate, plain binary immediate)
+             * All in decodetree.
              */
-            if (insn & (1 << 25)) {
-                /*
-                 * 0b1111_0x1x_xxxx_0xxx_xxxx_xxxx
-                 *  - Data-processing (plain binary immediate)
-                 */
-                if (insn & (1 << 24)) {
-                    /* Bitfield/Saturate, in decodetree */
-                    goto illegal_op;
-                } else {
-                    imm = ((insn & 0x04000000) >> 15)
-                          | ((insn & 0x7000) >> 4) | (insn & 0xff);
-                    if (insn & (1 << 22)) {
-                        /* 16-bit immediate.  */
-                        imm |= (insn >> 4) & 0xf000;
-                        if (insn & (1 << 23)) {
-                            /* movt */
-                            tmp = load_reg(s, rd);
-                            tcg_gen_ext16u_i32(tmp, tmp);
-                            tcg_gen_ori_i32(tmp, tmp, imm << 16);
-                        } else {
-                            /* movw */
-                            tmp = tcg_temp_new_i32();
-                            tcg_gen_movi_i32(tmp, imm);
-                        }
-                        store_reg(s, rd, tmp);
-                    } else {
-                        /* Add/sub 12-bit immediate, in decodetree */
-                        goto illegal_op;
-                    }
-                }
-            } else {
-                /* Data-processing (modified immediate) */
-                /* All done in decodetree.  Reach here for illegal ops.  */
-                goto illegal_op;
-            }
+            goto illegal_op;
         }
         break;
     case 12:
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index c5af685585..02d7e5b202 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -73,6 +73,12 @@ MOV_rrri         .... 000 1101 . 0000 .... ..... .. 0 ....    @s_rxr_shi
 BIC_rrri         .... 000 1110 . .... .... ..... .. 0 ....    @s_rrr_shi
 MVN_rrri         .... 000 1111 . 0000 .... ..... .. 0 ....    @s_rxr_shi
 
+%imm16           16:4 0:12
+@mov16           ---- .... .... .... rd:4 ............        &ri imm=%imm16
+
+MOVW             .... 0011 0000 .... .... ............        @mov16
+MOVT             .... 0011 0100 .... .... ............        @mov16
+
 # Data-processing (register-shifted register)
 
 @s_rrr_shr       ---- ... .... s:1 rn:4 rd:4 rs:4 . shty:2 . rm:4 \
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 68203e3704..fdcfb60cc5 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -150,6 +150,15 @@ RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
   SUB_rri        1111 0.1 0101 0 .... 0 ... .... ........     @s0_rri_12
 }
 
+# Move Wide
+
+%imm16_26_16_12_0 16:4 26:1 12:3 0:8
+@mov16           .... .... .... .... .... rd:4 .... .... \
+                 &ri imm=%imm16_26_16_12_0
+
+MOVW             1111 0.10 0100 .... 0 ... .... ........      @mov16
+MOVT             1111 0.10 1100 .... 0 ... .... ........      @mov16
+
 # Saturate, bitfield
 
 @sat             .... .... .. sh:1 . rn:4 . ... rd:4 .. . satimm:5 \
-- 
2.17.1
