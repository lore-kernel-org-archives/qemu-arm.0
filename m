Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1193868wrs;
        Wed, 28 Aug 2019 12:48:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzQy5hvsVwke4uyUz9E36dhUzIG2mMTsL4j3Pu+GxnNUv6L9JoTIrQIU4sVo2m0j34gjqd
X-Received: by 2002:a17:906:48da:: with SMTP id d26mr4853394ejt.106.1567021708842;
        Wed, 28 Aug 2019 12:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021708; cv=none;
        d=google.com; s=arc-20160816;
        b=yauaf9xqcqHV7sd2+4nxNWV0hW6McllzwzjiaFREn7JIAuEKHnaOCgY6Fz6Itu2ubL
         Zdf4OzF1fTSBmc6+cWfh4Uee7bFnE3Cp/D9tWCukniu8q3o7QtU5uU8dikiU9xf/xxLy
         z8vftD5Ekg8lpwEl6fnZPOOj01ogHv1lHhN4JG1PWF3h97dw0NXmDYLDWm7+l1dGcGif
         RNE169LscRmk4oc0Ci0skGoDCbgWG6O6BtvZaQ/AaW9vX39rM5v+Tbm1EQtkU4u3OJve
         D2fo+G5bkXXpsm5AkabHgl1WjrGpj9+qfqa62jaiIm4hRmiSCmP1C89xoiu8YQ7ujx17
         uDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Fhqpr1ZM66JaZ1pn92il8bSyyclZ16JqoBnLn1JZUIU=;
        b=iFyBPpHaAokmZUhgyAg3uR1EpTEdaFDmh1w5LfSSkTpfYHEIqqGUI8JVMlHVkHTnKx
         pjMNdyCe9fcmgHbF9I8VUoudS/Vz+ZlRrf3zKmwROvsSLibpMLbb7IRZ52cAN9ViZutE
         IH42eewUScSqi3I7TSKU4yv1ZnlMfGvF8tAiuqW+GVhNNIqCYZgGa2564FEQI38eNxNZ
         frtevJEsDttu9Xy7zpeSeYJ294LzOduak2l/TtZuCItt40kYEcC00xBj9vJlSTU8xwVx
         7S/xXkFdfZNBEmCuqo6V8u4PNg0401EehNoxfzIW+opDm3vUAg5vXXRGqttCT5Wk7fYo
         6M2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3WlVDKI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si1962854edb.332.2019.08.28.12.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3WlVDKI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33vf-0002j0-LJ
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GV-0003oP-4k
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GS-0000Og-MT
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:54 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34067)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GS-0000KC-B1
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:52 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d3so411253plr.1
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Fhqpr1ZM66JaZ1pn92il8bSyyclZ16JqoBnLn1JZUIU=;
 b=M3WlVDKIPbZwvn6YFjebxm5TvA0Uk9i9lcquKa8GF1oTzf9U+FbExZKWY3ixDj5dKI
 2dPf+CDEqxhaO/hfOo7+6cMEgcfvA+ULqt3klTGY/5iWEZWM9JSvBFqVazFnPpviDZkC
 lYwAYeHVUTvtro4Vkr33fr6GA2wHJnr8kgskuQkI9rs9qiyThcq2L6s6Dso3salQsQtK
 CYoa3kCyf2RmB0UpVFCS7TY6uIionGp72syXgwoKlbAtqiOJZBkMqJQrxWBNuclbKdg5
 o6+To+3yxK8WkWvxPdbyFlAwYhCP2yJID6FIT781d8BE9/d3qSTx34SHmRjq39WoRj/i
 G2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Fhqpr1ZM66JaZ1pn92il8bSyyclZ16JqoBnLn1JZUIU=;
 b=e5Dja5DyYpK6EVpf2nNIHxbU9sqM0rt5+TYIOi5pzS4engQ+j8/9hpKWHH0RBTm6cw
 5R06QcdIWNK5z7Uy00+AajkJUyWfKrHTLyhJQc/URTXEjOovdmHBUKHKz9kvr39w4J3M
 UIDVfP2CgfvV5vnfJ/nWDF3XP4sJwHgB8g8wDXXU1Pj4wWS3NzDhevXVv+HRDA0bbouE
 D2xjNafYdHZVbe1LMJN+sndNHpStDFXqj6Dd2ZcVNVYjlkCjIPmP2lHsBrHwh3TxRd/m
 CvlVwI9LpM1vkGWOZ2rQN4WlhnGZcONM1hylAzUCdvH/jI9N738BZrlcQhs6b0M3pfJt
 mQPQ==
X-Gm-Message-State: APjAAAXEuXpDI4nb8ciOc6SiwLHDhuduiHytyXaOtC1b+GbsusCP+QN/
 ba8kZ5ycch/gEM37co0w7QFa5YyqsB4=
X-Received: by 2002:a17:902:788b:: with SMTP id
 q11mr5863834pll.308.1567019144866; 
 Wed, 28 Aug 2019 12:05:44 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:22 -0700
Message-Id: <20190828190456.30315-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62e
Subject: [Qemu-arm] [PATCH v3 35/69] target/arm: Convert Clear-Exclusive,
 Barriers
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
X-TUID: ncpEAT/tN6wD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Check m-profile for all; fix missing isa check for ISB;
fix thumb isa check for CLREX and DSB.
---
 target/arm/translate.c       | 127 ++++++++++++++++-------------------
 target/arm/a32-uncond.decode |  10 +++
 target/arm/t32.decode        |  10 +++
 3 files changed, 78 insertions(+), 69 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 46e3f946d5..003b8ac414 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10122,6 +10122,63 @@ static bool trans_SRS(DisasContext *s, arg_SRS *a)
     return true;
 }
 
+/*
+ * Clear-Exclusive, Barriers
+ */
+
+static bool trans_CLREX(DisasContext *s, arg_CLREX *a)
+{
+    if (s->thumb
+        ? !ENABLE_ARCH_7 && !arm_dc_feature(s, ARM_FEATURE_M)
+        : !ENABLE_ARCH_6K) {
+        return false;
+    }
+    gen_clrex(s);
+    return true;
+}
+
+static bool trans_DSB(DisasContext *s, arg_DSB *a)
+{
+    if (!ENABLE_ARCH_7 && !arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    return true;
+}
+
+static bool trans_DMB(DisasContext *s, arg_DMB *a)
+{
+    return trans_DSB(s, NULL);
+}
+
+static bool trans_ISB(DisasContext *s, arg_ISB *a)
+{
+    if (!ENABLE_ARCH_7 && !arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    /*
+     * We need to break the TB after this insn to execute
+     * self-modifying code correctly and also to take
+     * any pending interrupts immediately.
+     */
+    gen_goto_tb(s, 0, s->base.pc_next);
+    return true;
+}
+
+static bool trans_SB(DisasContext *s, arg_SB *a)
+{
+    if (!dc_isar_feature(aa32_sb, s)) {
+        return false;
+    }
+    /*
+     * TODO: There is no speculation barrier opcode
+     * for TCG; MB and end the TB instead.
+     */
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    gen_goto_tb(s, 0, s->base.pc_next);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10215,38 +10272,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 s->base.is_jmp = DISAS_UPDATE;
             }
             return;
-        } else if ((insn & 0x0fffff00) == 0x057ff000) {
-            switch ((insn >> 4) & 0xf) {
-            case 1: /* clrex */
-                ARCH(6K);
-                gen_clrex(s);
-                return;
-            case 4: /* dsb */
-            case 5: /* dmb */
-                ARCH(7);
-                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                return;
-            case 6: /* isb */
-                /* We need to break the TB after this insn to execute
-                 * self-modifying code correctly and also to take
-                 * any pending interrupts immediately.
-                 */
-                gen_goto_tb(s, 0, s->base.pc_next);
-                return;
-            case 7: /* sb */
-                if ((insn & 0xf) || !dc_isar_feature(aa32_sb, s)) {
-                    goto illegal_op;
-                }
-                /*
-                 * TODO: There is no speculation barrier opcode
-                 * for TCG; MB and end the TB instead.
-                 */
-                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                gen_goto_tb(s, 0, s->base.pc_next);
-                return;
-            default:
-                goto illegal_op;
-            }
         } else if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
@@ -10707,43 +10732,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                             gen_set_psr_im(s, offset, 0, imm);
                         }
                         break;
-                    case 3: /* Special control operations.  */
-                        if (!arm_dc_feature(s, ARM_FEATURE_V7) &&
-                            !arm_dc_feature(s, ARM_FEATURE_M)) {
-                            goto illegal_op;
-                        }
-                        op = (insn >> 4) & 0xf;
-                        switch (op) {
-                        case 2: /* clrex */
-                            gen_clrex(s);
-                            break;
-                        case 4: /* dsb */
-                        case 5: /* dmb */
-                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                            break;
-                        case 6: /* isb */
-                            /* We need to break the TB after this insn
-                             * to execute self-modifying code correctly
-                             * and also to take any pending interrupts
-                             * immediately.
-                             */
-                            gen_goto_tb(s, 0, s->base.pc_next);
-                            break;
-                        case 7: /* sb */
-                            if ((insn & 0xf) || !dc_isar_feature(aa32_sb, s)) {
-                                goto illegal_op;
-                            }
-                            /*
-                             * TODO: There is no speculation barrier opcode
-                             * for TCG; MB and end the TB instead.
-                             */
-                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                            gen_goto_tb(s, 0, s->base.pc_next);
-                            break;
-                        default:
-                            goto illegal_op;
-                        }
-                        break;
+                    case 3: /* Special control operations, in decodetree */
                     case 4: /* bxj, in decodetree */
                         goto illegal_op;
                     case 5: /* Exception return.  */
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index 64548a93e2..c7e9df8030 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -22,6 +22,7 @@
 # All of those that have a COND field in insn[31:28] are in a32.decode
 #
 
+&empty           !extern
 &i               !extern imm
 
 # Branch with Link and Exchange
@@ -37,3 +38,12 @@ BLX_i            1111 101 . ........................          &i imm=%imm24h
 
 RFE              1111 100 pu:2 0 w:1 1 rn:4 0000 1010 0000 0000   &rfe
 SRS              1111 100 pu:2 1 w:1 0 1101 0000 0101 000 mode:5  &srs
+
+# Clear-Exclusive, Barriers
+
+# QEMU does not require the option field for the barriers.
+CLREX            1111 0101 0111 1111 1111 0000 0001 1111
+DSB              1111 0101 0111 1111 1111 0000 0100 ----
+DMB              1111 0101 0111 1111 1111 0000 0101 ----
+ISB              1111 0101 0111 1111 1111 0000 0110 ----
+SB               1111 0101 0111 1111 1111 0000 0111 0000
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index c8a8aeceee..18c268e712 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -305,6 +305,16 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
       # of the space is "reserved hint, behaves as nop".
       NOP        1111 0011 1010 1111 1000 0000 ---- ----
     }
+
+    # Miscelaneous control
+    {
+      CLREX      1111 0011 1011 1111 1000 1111 0010 1111
+      DSB        1111 0011 1011 1111 1000 1111 0100 ----
+      DMB        1111 0011 1011 1111 1000 1111 0101 ----
+      ISB        1111 0011 1011 1111 1000 1111 0110 ----
+      SB         1111 0011 1011 1111 1000 1111 0111 0000
+    }
+
     # Note that the v7m insn overlaps both the normal and banked insn.
     {
       MRS_bank   1111 0011 111 r:1 .... 1000 rd:4   001. 0000  \
-- 
2.17.1

