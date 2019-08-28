Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1167515wrs;
        Wed, 28 Aug 2019 12:22:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxm6zH+rFez6zBFv3YubGK6xbz5stYJWvd9mFEVp/RUWVI0F34TJ5KaXXbGAWoo69ZyPm4Z
X-Received: by 2002:a05:6214:1447:: with SMTP id b7mr4066618qvy.89.1567020167177;
        Wed, 28 Aug 2019 12:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567020167; cv=none;
        d=google.com; s=arc-20160816;
        b=0FGr3h15N/XDUD4wAROBBqh2yRHiABVPk459a0E+72sgA1ZDFadU4ekYP0Esx5H0Lv
         U5TugkbIaPa4HHCOEbGvdNSl18e4KvGsdS8IxlJtIYUY8wfz6ymyezBrXTjSCXlXzR5N
         Dckn61eMhtvE2cZhJI3vebkM9fltYwH6bVQKIW52VIZ56EaFqlLiLm0kJRi51/vPdUBt
         ozMXOAnEO8QI05JIciqTE0Kt/M1t3nYfiX7pvvoNWktuXOlpdvdCuamcz7HzGqe74zJT
         0pN8jhbLoaAVYIZY8IzkDTPTsIEQqCagXTlIFMqDOyR3F1GdC3C4mwhTcDOHy+h/eZ0r
         Q9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LP98tMkuEY1Am6pgEun6YWYPwcU15PtWb8SPF+FrpSw=;
        b=doITUXUGZR1qbikrA2XKd21zfUBoLTwTBJLQtWQrnDb4w011E2d9Ac+moPt6ZXF+/F
         r0TbP8hloO+3yF4+MIsgN/+5f37lXJIJ3OhA3OJ4lf+jg4PNM3cF1iiEdhE5Pz/gsw/J
         yCRiopFOMJw2X226q+GSHoCLu03j0rOVh9IJkUE0J86QuWpya7NDnt6rYcTuAKjQ9ZM8
         Q01oC/O11G7oDdhle1VvjYcCGDG29w9X2hYFVcm5IERhQ7cJjGaVrQfMLlk6aymVKRm1
         guw3z2QFWcMFxoOBJQbFZcu1wt8Blv86CejeU0e/xYFeH5KEKghcpULyUfjiBVFsto8f
         XI6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YVuwxS6X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b37si43157qtb.269.2019.08.28.12.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YVuwxS6X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33Wo-0002OB-3v
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GF-0003fK-RK
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GD-0000Em-5B
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:39 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36093)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GC-0000E3-CF
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:36 -0400
Received: by mail-pf1-x443.google.com with SMTP id w2so399214pfi.3
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LP98tMkuEY1Am6pgEun6YWYPwcU15PtWb8SPF+FrpSw=;
 b=YVuwxS6X4hRvLJ7uZxos4XDF5x3AYjKrLl+zni7Bcc5SaiwVv0Wh0C2l+YOHf3F3o1
 dI+kPad05p7rPWoEnCQoyywZblETJZnGjSCwu6K9NmaG/LXy5CXvsbz/kQ2jt6AoLLk0
 dlbLYW6+/Im6hnA0xPa1UFqDaOyHyV8Vvj2w8tEB1Ljs00gjU3vyb62IC+rlTdHhM66G
 MKcDYSh+c9tlAflv/wcyvdoR1vo7TgSiUQlo5GpJfFx9alJTDtzpcbXRK0KFZqWsqrHN
 zlZfT7tUT1tjJ/p5K0Y7tLCmwnLNUmhPdlmPN/zP81zwXUl4Z7qmNIgkp9u3zFOuyHMg
 8xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LP98tMkuEY1Am6pgEun6YWYPwcU15PtWb8SPF+FrpSw=;
 b=iK8Xy7IX0A94y1kOI7Y5z58x1lGvBkscjQXqOIOTl8yEmXOV1IN/iU3okUpaTGpIbb
 JiT0PtYwnQxz0eIosKWm7avYzOV0QP7VBWqKvC8vswl9bpVErC4eowac3bSuBYtEtMCj
 kIX3rOaO5cAZQqnmrPB12M14razjrER/RWVPdL4vCqtGX25rWkc1ey1aY9HsZ9Pg0Yyl
 U2hKbzH8PYmhWH3h98UQS0ZQNBQNWv7iMmYeBETPVQsd8aZLxSdizuBWZuNxjkN9ltpz
 xQuYwAKued/h377bSNDyOr1zFYKZXOC85UMb+OhCOEI3Ep7JdP+tKQ7fiRiX/WkxXgbD
 +HDQ==
X-Gm-Message-State: APjAAAV6UN7IsUgwtqOee6lzMg2WrLxUCQe71hEk6Cw1s9/PJafYSFwV
 ywmJgpGEKHfi//h1nHG79B6Sy1fqlv0=
X-Received: by 2002:a17:90a:7783:: with SMTP id
 v3mr5583940pjk.109.1567019134967; 
 Wed, 28 Aug 2019 12:05:34 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:14 -0700
Message-Id: <20190828190456.30315-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH v3 27/69] target/arm: Convert MOVW, MOVT
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
X-TUID: 41Wkhn+Mpeh5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 89 ++++++++++++++++--------------------------
 target/arm/a32.decode  |  6 +++
 target/arm/t32.decode  |  9 +++++
 3 files changed, 48 insertions(+), 56 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9e47c2e0c4..6cbf34b424 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7844,6 +7844,34 @@ static bool trans_ADR(DisasContext *s, arg_ri *a)
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
@@ -9729,7 +9757,7 @@ static bool trans_UDIV(DisasContext *s, arg_rrr *a)
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, val, op1, i, rn, rd;
+    unsigned int cond, val, op1, i, rn;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
@@ -9978,26 +10006,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10732,42 +10742,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
index d7a333b90b..341882e637 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -73,6 +73,12 @@ MOV_rxri         .... 000 1101 . 0000 .... ..... .. 0 ....    @s_rxr_shi
 BIC_rrri         .... 000 1110 . .... .... ..... .. 0 ....    @s_rrr_shi
 MVN_rxri         .... 000 1111 . 0000 .... ..... .. 0 ....    @s_rxr_shi
 
+%imm16           16:4 0:12
+@mov16           ---- .... .... .... rd:4 ............        &ri imm=%imm16
+
+MOVW             .... 0011 0000 .... .... ............        @mov16
+MOVT             .... 0011 0100 .... .... ............        @mov16
+
 # Data-processing (register-shifted register)
 
 @s_rrr_shr       ---- ... .... s:1 rn:4 rd:4 rs:4 . shty:2 . rm:4 \
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 677acb698d..f315fde0f4 100644
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

