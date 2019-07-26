Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207003wrv;
        Fri, 26 Jul 2019 10:50:56 -0700 (PDT)
X-Received: by 2002:a17:90a:de02:: with SMTP id m2mr98963406pjv.18.1564163456657;
        Fri, 26 Jul 2019 10:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163456; cv=none;
        d=google.com; s=arc-20160816;
        b=gqQxrbgEZnDD1HHveHevry0ScKfJdwTxng5iw1KOUCA+Q4d7PGtGeD8DVyXZrxhC/x
         zYwFpVYXcgmkB/SmeK/2h+2DRv32zf04/xx0Deofc7r0tvXVa1aSVuWBDb1Mr1kw6sYc
         qx3MouWIl+wrbffrL/7ZV5x9BO/6Si97kMtp57UT/+6BQyX39G0vtCGU0Dl7vZuVIGzG
         DqNWBliTtqtIq32zLRfuIT4MQRFrHAGbwexPBuhmM4gfew6kuNzI66QaYFbNR8b5giUi
         CXrXWFrj13NYX5+W1NVAp3nmTD4OxRQKQ4d01a6WlbmCLmQZR6Yv226KZJ+VfGZuVa4g
         XRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=yeeH2D/Nsh9oAvCAiY/tPwxLxmb7stM68Oiu9y5meMM=;
        b=FBfQFVPM372fN2GPjd76IQvTlvJh8JQChhXGJgTqreke9UASwIRxzxeSu9XKK6Vsok
         w5G1VG0weoUoyqpElFOD4GGr7WEkYn4B+8Ovj4U2rQLuz0Fvlz/8nwNG03OYn/eKvq4N
         AVtRCkuiBGGtTjFqWrfQiEUqBakwGcsHzucqdYPLu82SaJbC46iwBJMbr0/G3bkOZ868
         heBmdmG16WUQteb5D6ceRkc2BLZ+FGBhk/S2NP6kewoMQ02dKM20D0liKeVAW76CfOP1
         ZAWnl26FmBEZ+IAa/juOH7yTZLz85VPZ5axaNSJqQBpJQujDxHdEMNp9kBofm5SvNDie
         WKBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTYGwF+p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u184sor34966957pfc.69.2019.07.26.10.50.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTYGwF+p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yeeH2D/Nsh9oAvCAiY/tPwxLxmb7stM68Oiu9y5meMM=;
        b=YTYGwF+pR7Ljd40OJHMptB6C2AK62uTb9fNiZMUNXgx1OxfnPs/VS4x/x0bAYdgKjk
         +WSzyaxlT6CiM/29cFZxOqLkGhqYFIkIo72hpyRyvbyd/L4YAnm6+BbnDVoEiL2dYj1N
         eetePY7PWshCWWxv9i5ud4uH5TsSAczA6T0cnpYKosnDF3h4sah1h2azvYlagij0i8Uy
         vUXnXhac3xquLb4VAZDtl5GadryG+PwAmhwc6T/yPZMo1sFgGv5PuUpyEXKLoW4jJIHi
         pt3M/GEPi5FFs17dzCqsXYTSB7mytqRBTAon19m+YRXH60ghPxqGVgmKcbsmcdnSD6ds
         PIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yeeH2D/Nsh9oAvCAiY/tPwxLxmb7stM68Oiu9y5meMM=;
        b=sltzz3sDqyR5KiTRbPmJfOnXa30J32AjCji83G+owRkmcPU1E2jSU60cuLqvhiW4h3
         l1uUi3vDAJunqhayzN/hCCBwhzmXIHk5BraJyNkbWOiSa9uI6VJNyoWZAeA4t6vMOdXY
         GaqEqC7RIJeU+G+KrHcMjHKpm6yNiYAciK3s5sdJ/Up4cJcWenHO4aJ7z8mqfmEUunKV
         4J00czvBsYH5fnh2p2m5ggBAuZkdc04lSd0uT1bEPPFAq7oGGaEenVWLvgS2nbmfSw67
         /8SPY/RM3feUK0E4U6Y3h4cIcM8Oo5H1Dh/vSoKbMpnqmykXstW8IC+/YVlc77IzBVyq
         ZBnw==
X-Gm-Message-State: APjAAAU8b6Dt8kL7vK+3We7H4qoNG9FdO9OgFuhX5Y4S1gUkDzgq+u8w
	uyBBFQGVnPISsGd8GYV4V62nmG6d
X-Google-Smtp-Source: APXvYqyzINb9Ora3Xp430WlLRB9wdad1YG7GqowYVibNTcCii9bHB5HG7XoP0MkAMQpyjsdW3ghjSQ==
X-Received: by 2002:aa7:9481:: with SMTP id z1mr23635241pfk.92.1564163456219;
        Fri, 26 Jul 2019 10:50:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 19/67] target/arm: Convert Cyclic Redundancy Check
Date: Fri, 26 Jul 2019 10:49:44 -0700
Message-Id: <20190726175032.6769-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 6v3hYA5eDCnf

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 121 +++++++++++++++++++----------------------
 target/arm/a32.decode  |   9 +++
 target/arm/t32.decode  |   7 +++
 3 files changed, 72 insertions(+), 65 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fa0c048b38..ed7041d0e4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8362,6 +8362,57 @@ static bool trans_MSR_imm(DisasContext *s, arg_MSR_imm *a)
     return true;
 }
 
+/*
+ * Cyclic Redundancy Check
+ */
+
+static bool op_crc32(DisasContext *s, arg_rrr *a, bool c, TCGMemOp sz)
+{
+    TCGv_i32 t1, t2, t3;
+
+    if (!dc_isar_feature(aa32_crc32, s)) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    switch (sz) {
+    case MO_8:
+        gen_uxtb(t2);
+        break;
+    case MO_16:
+        gen_uxth(t2);
+        break;
+    case MO_32:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    t3 = tcg_const_i32(1 << sz);
+    if (c) {
+        gen_helper_crc32c(t1, t1, t2, t3);
+    } else {
+        gen_helper_crc32(t1, t1, t2, t3);
+    }
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+#define DO_CRC32(NAME, c, sz) \
+static bool trans_##NAME(DisasContext *s, arg_rrr *a)  \
+    { return op_crc32(s, a, c, sz); }
+
+DO_CRC32(CRC32B, false, MO_8)
+DO_CRC32(CRC32H, false, MO_16)
+DO_CRC32(CRC32W, false, MO_32)
+DO_CRC32(CRC32CB, true, MO_8)
+DO_CRC32(CRC32CH, true, MO_16)
+DO_CRC32(CRC32CW, true, MO_32)
+
+#undef DO_CRC32
+
 /*
  * Miscellaneous instructions
  */
@@ -8774,39 +8825,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             gen_bx(s, tmp);
             break;
         case 0x4:
-        {
-            /* crc32/crc32c */
-            uint32_t c = extract32(insn, 8, 4);
-
-            /* Check this CPU supports ARMv8 CRC instructions.
-             * op1 == 3 is UNPREDICTABLE but handle as UNDEFINED.
-             * Bits 8, 10 and 11 should be zero.
-             */
-            if (!dc_isar_feature(aa32_crc32, s) || op1 == 0x3 || (c & 0xd) != 0) {
-                goto illegal_op;
-            }
-
-            rn = extract32(insn, 16, 4);
-            rd = extract32(insn, 12, 4);
-
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            if (op1 == 0) {
-                tcg_gen_andi_i32(tmp2, tmp2, 0xff);
-            } else if (op1 == 1) {
-                tcg_gen_andi_i32(tmp2, tmp2, 0xffff);
-            }
-            tmp3 = tcg_const_i32(1 << op1);
-            if (c & 0x2) {
-                gen_helper_crc32c(tmp, tmp, tmp2, tmp3);
-            } else {
-                gen_helper_crc32(tmp, tmp, tmp2, tmp3);
-            }
-            tcg_temp_free_i32(tmp2);
-            tcg_temp_free_i32(tmp3);
-            store_reg(s, rd, tmp);
-            break;
-        }
+            /* crc32 */
+            /* All done in decodetree.  Illegal ops reach here.  */
+            goto illegal_op;
         case 0x5:
             /* Saturating addition and subtraction.  */
             /* All done in decodetree.  Reach here for illegal ops.  */
@@ -10256,16 +10277,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         goto illegal_op;
                     }
                     break;
-                case 0x20: /* crc32/crc32c */
+                case 0x20: /* crc32/crc32c, in decodetree */
                 case 0x21:
                 case 0x22:
                 case 0x28:
                 case 0x29:
                 case 0x2a:
-                    if (!dc_isar_feature(aa32_crc32, s)) {
-                        goto illegal_op;
-                    }
-                    break;
+                    goto illegal_op;
                 default:
                     goto illegal_op;
                 }
@@ -10294,33 +10312,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 case 0x18: /* clz */
                     tcg_gen_clzi_i32(tmp, tmp, 32);
                     break;
-                case 0x20:
-                case 0x21:
-                case 0x22:
-                case 0x28:
-                case 0x29:
-                case 0x2a:
-                {
-                    /* crc32/crc32c */
-                    uint32_t sz = op & 0x3;
-                    uint32_t c = op & 0x8;
-
-                    tmp2 = load_reg(s, rm);
-                    if (sz == 0) {
-                        tcg_gen_andi_i32(tmp2, tmp2, 0xff);
-                    } else if (sz == 1) {
-                        tcg_gen_andi_i32(tmp2, tmp2, 0xffff);
-                    }
-                    tmp3 = tcg_const_i32(1 << sz);
-                    if (c) {
-                        gen_helper_crc32c(tmp, tmp, tmp2, tmp3);
-                    } else {
-                        gen_helper_crc32(tmp, tmp, tmp2, tmp3);
-                    }
-                    tcg_temp_free_i32(tmp2);
-                    tcg_temp_free_i32(tmp3);
-                    break;
-                }
                 default:
                     g_assert_not_reached();
                 }
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 50449fa8ec..5751e615cd 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -182,6 +182,15 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
 }
 MSR_imm          .... 0011 0110 .... 1111 .... .... ....      @msr_i r=1
 
+# Cyclic Redundancy Check
+
+CRC32B           .... 0001 0000 .... .... 0000 0100 ....      @rndm
+CRC32H           .... 0001 0010 .... .... 0000 0100 ....      @rndm
+CRC32W           .... 0001 0100 .... .... 0000 0100 ....      @rndm
+CRC32CB          .... 0001 0000 .... .... 0010 0100 ....      @rndm
+CRC32CH          .... 0001 0010 .... .... 0010 0100 ....      @rndm
+CRC32CW          .... 0001 0100 .... .... 0010 0100 ....      @rndm
+
 # Miscellaneous instructions
 
 %sysm            8:1 16:4
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 40a2c520c1..30971787d4 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -172,6 +172,13 @@ QSUB             1111 1010 1000 .... 1111 .... 1010 ....      @rndm
 QDADD            1111 1010 1000 .... 1111 .... 1001 ....      @rndm
 QDSUB            1111 1010 1000 .... 1111 .... 1011 ....      @rndm
 
+CRC32B           1111 1010 1100 .... 1111 .... 1000 ....      @rndm
+CRC32H           1111 1010 1100 .... 1111 .... 1001 ....      @rndm
+CRC32W           1111 1010 1100 .... 1111 .... 1010 ....      @rndm
+CRC32CB          1111 1010 1101 .... 1111 .... 1000 ....      @rndm
+CRC32CH          1111 1010 1101 .... 1111 .... 1001 ....      @rndm
+CRC32CW          1111 1010 1101 .... 1111 .... 1010 ....      @rndm
+
 # Branches and miscellaneous control
 
 %msr_sysm        4:1 8:4
-- 
2.17.1
