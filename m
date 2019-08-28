Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1158105wrs;
        Wed, 28 Aug 2019 12:14:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGFKcDrm/paC/GfMpSWl0mMDIckbLtHaoRg+79TRMwvxHxbyNVX75+0t4YWkZMDovjOOlx
X-Received: by 2002:a0c:edcb:: with SMTP id i11mr3969903qvr.206.1567019675984;
        Wed, 28 Aug 2019 12:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019675; cv=none;
        d=google.com; s=arc-20160816;
        b=C6DDU2EtwuQNoPF41qigZKP4mdxBXxbgfVw4mgRdPtSgRCittbAzWEhkcd9Ir2sIFJ
         nhFIcCYcl+WNuW3T3O4T+u2eV8KtfAA3QpcQW/ycNKY4zNPdY6B9yVvnwSuVf/vV0IlK
         6fUvanK5wDYrwFJGZ34NTA8TmTcbnViY163rQxxINLJnloC7bwp9SbYa6qdhLnT5LBEQ
         zLnHo/b+dMs4ej99BPG8wekJD96tEI8j3o6MRRI+hRSv/74IJQzW8BGuxkCqsQelpxVj
         vetRGmL0IKa+VL09kB53XikdwXxeyIAQj6hGWRFnPj/KuOLmg7+tVButkHWZCzMoF13g
         nWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kMYNrgdh+zVmbpqY6NRWPsaPYHb8zLq/GT6BXuVbbI8=;
        b=ZoX+zQDg5plcj+UqJnIUCA2o9E+ubwm9Gfe6IFI7T1XO03RGJeY45yWK1jPuHEu6kE
         8CTdd8R4Dc0SS62f7DoMunnbLTiLed1afoS7Z4ZzxefQMCZB8G5uVMi/cyDlshfE0/2y
         D/u5E0dukBUdniERbN0sGSpxzA7oUvo4Dao4SSLafXBRpVq2vcvagUGwTBR2jXvwktoY
         FhcWqNBYH7/esxMUWTJQXmb0xTDI4AsYJYiX+0xxR3mWJKjrZhtOxShue4IufobzZcOu
         Lwas6Tyi0oQxQ3Z0cjXBnN6dudvceTBg2qNzPELS7lfznwydu1q8dBGnZZf0XdHpMPRt
         u/vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oBxrWRj0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si143323qkg.262.2019.08.28.12.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oBxrWRj0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33Os-0003p4-Ql
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37663)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fw-0003F6-Tb
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fv-0008Od-0j
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:20 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45355)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fu-0008NC-Q8
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:18 -0400
Received: by mail-pl1-x641.google.com with SMTP id y8so378836plr.12
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kMYNrgdh+zVmbpqY6NRWPsaPYHb8zLq/GT6BXuVbbI8=;
 b=oBxrWRj01us5QbyPRWalje+lJg7geKNc++aF95qu35DuHUO5XHialqu+pfvQmv3Zow
 buMJ6MzFJOZJ8Vhhl4QPwVi0UrlOikzOvSR/K+oEw4oinkdW3R+Osyurr5zRM9U34BIW
 pRIpJfFMtUGdDzYNIkQPUAOm3vD7WxjRPr9K5Y3udF1+XIbPYzTmFw+XBiLctpbuxZtj
 8rKhrSjNCGpX/UQbmZO7dJwuboGLHO2lBRaoJDduubx4ZMmP2J2rCXn+F8k53VVAnGGJ
 hKzc3jR/kXeSVn3dSTHFQ3uw32QdzmxfDjiYmgy5KemW/lyWU9NOiAnh3maLxoR6Z9cC
 HYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kMYNrgdh+zVmbpqY6NRWPsaPYHb8zLq/GT6BXuVbbI8=;
 b=GIQmrM1LXg087GG18qrn5HUbUB6cucZlPBaaWUkxRRkTeDfF3GyTUcsdcRAmC03P4J
 qv67xqT5xpGKl45cskYr51doXM4IK6zFbja60M7CLikPyNTLDWyrrskzJR2Xq9VJg+bC
 5aQqIIpWB0/i+rKrIBKT5fzQpKKSlla7zQR1ovPVQVj22pstTg/Kwz06AUyIJ0TLAdMp
 AlLo/QveRUGJqgtcZKDH9utwj6B6bFr3ek9tFkIG0yIHsatOMKPG/0Imvd4z928xCDLv
 W2s/QMId3P/FVrnuhtIVIotmLKBi8K0H6HZe48XDK/RybCT4bbvZ7dbR1M+q/3rb6ZD7
 ivFA==
X-Gm-Message-State: APjAAAVf5S413tMx+5F0wspJ+7HAkQJd1XYLWBv7FoAh/3PEQr44prJV
 d7wG+ig5GNxEKPKC8PsxObTiBQ==
X-Received: by 2002:a17:902:8e8b:: with SMTP id
 bg11mr5737621plb.93.1567019117927; 
 Wed, 28 Aug 2019 12:05:17 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:01 -0700
Message-Id: <20190828190456.30315-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v3 14/69] target/arm: Convert Cyclic Redundancy
 Check
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qm8jAovyU35w

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 121 +++++++++++++++++++----------------------
 target/arm/a32.decode  |   9 +++
 target/arm/t32.decode  |   7 +++
 3 files changed, 72 insertions(+), 65 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 491c8bdc8b..c2420ff45e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8294,6 +8294,57 @@ static bool trans_MSR_imm(DisasContext *s, arg_MSR_imm *a)
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
@@ -8709,39 +8760,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10181,16 +10202,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
@@ -10219,33 +10237,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
index 6ee12c1140..a8ef435b15 100644
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
index 98b682e7ec..261db100ff 100644
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

