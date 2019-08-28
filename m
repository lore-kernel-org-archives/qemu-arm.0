Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1230511wrs;
        Wed, 28 Aug 2019 13:25:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbRyNSZs7lyuXjiaQaVmDjC2s6bQnMbTBpjH8ZcsSwUMXtbuqDZ3Sc4d1+ouifbik5Or36
X-Received: by 2002:ac8:6ce:: with SMTP id j14mr6340326qth.373.1567023946595;
        Wed, 28 Aug 2019 13:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567023946; cv=none;
        d=google.com; s=arc-20160816;
        b=KquxfdIcsuIRwInoKj1IZ8y335qJ6cITpOCievQnZ/HIAqATj3jFN/GsJTlm72stNk
         Hyb9YqD42XnVfjHGSfERZmbCyBgNLDJ5G0O6PdWccMFPcPOLMeqJYMmU0XuCpwyqsbAp
         FgQsAxB4VHGmQ6/jzySKTWSCEvhy5bkahf5KkUk5d+3rWeCA61bxklHsHLPo3j6/xPWP
         lxBl4PbQeRZWBOz534XnSiXzjZ/t2uxoqMZe4gCGjsKOVzZa7WpEiHNG01So4iDRxFBm
         MTakL97FN1R1GrCgaStJxL+kuaQEw+T2QibIF+8e6r0SaKp37PB0f/AD2WqPBVxfmy7m
         Ppaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2MBl6t7fQ79zFUU8tID/KaTtAuG5wuFc4KjmST5JIXA=;
        b=RuYDRqKoS1LmCcfdkHer16aIZIpDqyOHeNAHC5SxogJZLLcPF60LDcTLCYNCeX++ss
         QeFrbKm/fpyQwNn0u+gWOHxzzXTYLcTo0GesgI+t2lP/wbtBMBO9dVl6geduaK/PkGfq
         p233h2SIsGBtipwWqFeZd3Fm/870anE6XZiBPBwClstE152cj9mjoUc22pxX6Fyerkjj
         YGSd4AfJoVuBtZDr66trA8XO7ZJaqYAvQBK1zAn82Nb0Rfk71/4W0QlJSH3luuR+5H5L
         NCWyIJtreztxoLOhHPuAnViwXrPudWouo4MnmUVHXpWPXQzMCdZpK3X1Bibnbvejvuew
         fiyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J1SVYWC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27si306817qvi.190.2019.08.28.13.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J1SVYWC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i34Vl-00025E-MU
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H1-00043A-6v
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gz-0000nV-9O
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:26 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45917)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gx-0000kK-68
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:24 -0400
Received: by mail-pg1-x536.google.com with SMTP id o13so203856pgp.12
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2MBl6t7fQ79zFUU8tID/KaTtAuG5wuFc4KjmST5JIXA=;
 b=J1SVYWC6O+5LMr/nog7k+yMdGYHf2GPrGz8HlPCj7AspXnRxU6r7aEmtPciJPNQZMj
 Uv6c5+fOnFCWBKMFugK9WUpgts9e4XUWJ4SAlPxrFzmOzObFbvqos2qBwee6x+bM4iQm
 pmcwUC++EbL4lMKb8vmWvbhiOdugnXfJPZ/3SY8p4MMDf4muk+u5jLHjf7JjL1ZA4gN+
 s7fzhTR2KE3Sf0o0WRr2Z0lR7dt9+XtW/Dcr/lLngWcBtsrOH7sQo6O7zuU3MJ1KLj3K
 KRa0v+/IRmWb7Yb6ZWvHAmevysEGnIdSK1NAE3XMgaPkzGXphVlOU0j3IQaYkmlNTq4t
 mx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2MBl6t7fQ79zFUU8tID/KaTtAuG5wuFc4KjmST5JIXA=;
 b=WKXwkL0rb42ZV+eOcdiKxqlNi1jtkC2usx+7jno6KcFeTL7XSY+f5/8NMuTa/x6bpI
 5zHhjR3FYyqdCAXzRItigvlmBN/6XI/gtc5/SfwcwvukuyIkrbKhZ10sxghMEMNETN/s
 fI+yM6L71Dl+ZAe4oL7pRGM3FWeqcQ6DZdnreC15dI1BFAvLIgggdp5hVv8lK3oWGAGm
 VGR1BPelRe961XOZz7Tuw5epYSkmjx4mkNYAkfjKxs8EeCekqARHSKEMbroVhJAMTvA5
 FtKMAoO6emN0hHrss1flYuoQ36GIimnCTbmlZGS65VirQ7XK3AgiNE1FT4c7oNQrqW9q
 K+8g==
X-Gm-Message-State: APjAAAWyTK2EuDJj2uWnTqhx7p23vQ0jR39dop61y5eJMT8ecgseKd4R
 D8FYeCGD/DCRh+/8nHqjlFwQLg==
X-Received: by 2002:a62:f204:: with SMTP id m4mr6714467pfh.7.1567019179701;
 Wed, 28 Aug 2019 12:06:19 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:50 -0700
Message-Id: <20190828190456.30315-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::536
Subject: [Qemu-arm] [PATCH v3 63/69] target/arm: Convert T16,
 Miscellaneous 16-bit instructions
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
X-TUID: +2lXEVTVbpXQ

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Split firstcond & mask within trans_IT.
---
 target/arm/translate.c | 111 +++++++++++++----------------------------
 target/arm/t16.decode  |  29 +++++++----
 2 files changed, 54 insertions(+), 86 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 854c9fe10d..5fb0e2066b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10163,6 +10163,18 @@ static bool trans_TBH(DisasContext *s, arg_tbranch *a)
     return op_tbranch(s, a, true);
 }
 
+static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
+{
+    TCGv_i32 tmp = load_reg(s, a->rn);
+
+    arm_gen_condlabel(s);
+    tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
+                        tmp, 0, s->condlabel);
+    tcg_temp_free_i32(tmp);
+    gen_jmp(s, read_pc(s) + a->imm);
+    return true;
+}
+
 /*
  * Supervisor call
  */
@@ -10394,6 +10406,27 @@ static bool trans_PLI(DisasContext *s, arg_PLD *a)
     return ENABLE_ARCH_7;
 }
 
+/*
+ * If-then
+ */
+
+static bool trans_IT(DisasContext *s, arg_IT *a)
+{
+    int cond_mask = a->cond_mask;
+
+    /*
+     * No actual code generated for this insn, just setup state.
+     *
+     * Combinations of firstcond and mask which set up an 0b1111
+     * condition are UNPREDICTABLE; we take the CONSTRAINED
+     * UNPREDICTABLE choice to treat 0b1111 the same as 0b1110,
+     * i.e. both meaning "execute always".
+     */
+    s->condexec_cond = (cond_mask >> 4) & 0xe;
+    s->condexec_mask = cond_mask & 0x1f;
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10760,83 +10793,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 8: /* load/store halfword immediate offset, in decodetree */
     case 9: /* load/store from stack, in decodetree */
     case 10: /* add PC/SP (immediate), in decodetree */
+    case 11: /* misc, in decodetree */
     case 12: /* load/store multiple, in decodetree */
-        goto illegal_op;
-
-    case 11:
-        /* misc */
-        op = (insn >> 8) & 0xf;
-        switch (op) {
-        case 0: /* add/sub (sp, immediate), in decodetree */
-        case 2: /* sign/zero extend, in decodetree */
-            goto illegal_op;
-
-        case 4: case 5: case 0xc: case 0xd:
-            /* push/pop, in decodetree */
-            goto illegal_op;
-
-        case 1: case 3: case 9: case 11: /* czb */
-            rm = insn & 7;
-            tmp = load_reg(s, rm);
-            arm_gen_condlabel(s);
-            if (insn & (1 << 11))
-                tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, s->condlabel);
-            else
-                tcg_gen_brcondi_i32(TCG_COND_NE, tmp, 0, s->condlabel);
-            tcg_temp_free_i32(tmp);
-            offset = ((insn & 0xf8) >> 2) | (insn & 0x200) >> 3;
-            gen_jmp(s, read_pc(s) + offset);
-            break;
-
-        case 15: /* IT, nop-hint.  */
-            if ((insn & 0xf) == 0) {
-                goto illegal_op; /* nop hint, in decodetree */
-            }
-            /*
-             * IT (If-Then)
-             *
-             * Combinations of firstcond and mask which set up an 0b1111
-             * condition are UNPREDICTABLE; we take the CONSTRAINED
-             * UNPREDICTABLE choice to treat 0b1111 the same as 0b1110,
-             * i.e. both meaning "execute always".
-             */
-            s->condexec_cond = (insn >> 4) & 0xe;
-            s->condexec_mask = insn & 0x1f;
-            /* No actual code generated for this insn, just setup state.  */
-            break;
-
-        case 0xe: /* bkpt */
-        {
-            int imm8 = extract32(insn, 0, 8);
-            ARCH(5);
-            gen_exception_bkpt_insn(s, syn_aa32_bkpt(imm8, true));
-            break;
-        }
-
-        case 0xa: /* rev, and hlt */
-        {
-            int op1 = extract32(insn, 6, 2);
-
-            if (op1 == 2) {
-                /* HLT */
-                int imm6 = extract32(insn, 0, 6);
-
-                gen_hlt(s, imm6);
-                break;
-            }
-
-            /* Otherwise this is rev, in decodetree */
-            goto illegal_op;
-        }
-
-        case 6: /* setend, cps; in decodetree */
-            goto illegal_op;
-
-        default:
-            goto undef;
-        }
-        break;
-
     case 13: /* conditional branch or swi, in decodetree */
         goto illegal_op;
 
@@ -10892,7 +10850,6 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     }
     return;
 illegal_op:
-undef:
     unallocated_encoding(s);
 }
 
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index cbc64f4e48..f128110dee 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -211,19 +211,30 @@ REVSH           1011 1010 11 ... ...            @rdm
 # Hints
 
 {
-  YIELD         1011 1111 0001 0000
-  WFE           1011 1111 0010 0000
-  WFI           1011 1111 0011 0000
+  {
+    YIELD       1011 1111 0001 0000
+    WFE         1011 1111 0010 0000
+    WFI         1011 1111 0011 0000
 
-  # TODO: Implement SEV, SEVL; may help SMP performance.
-  # SEV         1011 1111 0100 0000
-  # SEVL        1011 1111 0101 0000
+    # TODO: Implement SEV, SEVL; may help SMP performance.
+    # SEV       1011 1111 0100 0000
+    # SEVL      1011 1111 0101 0000
 
-  # The canonical nop has the second nibble as 0000, but the whole of the
-  # rest of the space is a reserved hint, behaves as nop.
-  NOP           1011 1111 ---- 0000
+    # The canonical nop has the second nibble as 0000, but the whole of the
+    # rest of the space is a reserved hint, behaves as nop.
+    NOP         1011 1111 ---- 0000
+  }
+  IT            1011 1111 cond_mask:8
 }
 
+# Miscellaneous 16-bit instructions
+
+%imm6_9_3       9:1 3:5 !function=times_2
+
+HLT             1011 1010 10 imm:6              &i
+BKPT            1011 1110 imm:8                 &i
+CBZ             1011 nz:1 0.1 ..... rn:3        imm=%imm6_9_3
+
 # Push and Pop
 
 %push_list      0:9 !function=t16_push_list
-- 
2.17.1

