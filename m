Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3195855wrs;
        Mon, 19 Aug 2019 15:11:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwflr/N5AkuLcKuHx+WXbNvZffhsLDb3U8bqvdsODbqOuS7LIHVOih5IrLNtgiJfqxbCufx
X-Received: by 2002:a17:906:8392:: with SMTP id p18mr23224088ejx.17.1566252681096;
        Mon, 19 Aug 2019 15:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252681; cv=none;
        d=google.com; s=arc-20160816;
        b=tiM/v2gQ+xCELSuK5D6WZqzlUSL9BBPmGQRJiTusEJK1x/Z/bytryrQYA1XxXxeOUU
         CGVU+zk8R2QNokf5LTEJVa7e5gaUKkVstaNsTQojaAaA+tGUYPQecrspOlu+WaDBCKcf
         P+j+eGYP6z6cQX7Q/Nt92y2aXk7J/aTRt0RA3zGj3FgyTA5srkJh1r2ifOzefEOgqcNJ
         OaPQ1htPAeBPKuoQUHbOuFstkSMLtk/11vReaWsT3HmKeHTNMOhgOKwuV/QazOuTARk/
         8XWWjOvCh280kw3e5NYm0B0L2yBBnVyIZKR06/uvWut+dxkzBGP8TWzXY9JBcsFyv24y
         tVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=MYM8dYqYPl4eqxjsUKYjeBmOOKaa2+t2xb+fej5q23g=;
        b=tZoTIo6HppNU1+nfMA1b43qepdw+ac9BY7QSuRCxTW31cxjVF/Ajm4lXgh9yVjnSf9
         sJ4EOMvWt0nizcJRg41/OfNnp3BMnqHIvY2G1z2IGRisy7+X6k9qZu6lxnAZHWNsuXln
         fBCdCP/YrACHmMRvk9ki/Z6hVpidA/OBaXVE4TOLieo6/bTgYkMbYsyV6U2yeZf/4XV5
         mFbBe1IfYQdCihPp+gy07RKCFJiZOHu9Oj8XjRCyFxjGtr3IP+xPbO7babReCdeWgeZs
         tjA9Hb3xT+T6avQn2pbjTl4ECtw8jYjRqE0exRQxnnMIM/WaJRV5aiO8yMua70tb0Dxs
         X3NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uubnh2nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si8909695edd.412.2019.08.19.15.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uubnh2nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzprz-0004BG-OB
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMP-0002FO-Rp
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMO-0006RI-Ba
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:41 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42601)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMO-0006Qy-4w
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:40 -0400
Received: by mail-pg1-x543.google.com with SMTP id p3so1924765pgb.9
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MYM8dYqYPl4eqxjsUKYjeBmOOKaa2+t2xb+fej5q23g=;
 b=uubnh2nnslDD4Dn/VjckXQhvv20xcu4vVoTR0Rl15Vf1QQPPLibQOk5/FCa4PFZ5lI
 AXoHtsVsKRtjaQ3816MGgTBIgPc9sispVcSN4LL2k+dY8hJ8iE2IYzLuJN+Cvxl9cXW7
 hbQxWW63KjDfbZTvZhCxCVoaHoZa82nFClbtbIVFwzk+zALie1YIdKOMvGdwTUSdpD7y
 +L8Pk9VV/9r9bwNeA95XzK5K8zHVf1TXmN221+j0xEoB8+H7tH/vtrfkbI3VrsU3SIYS
 OquS4eY7tMCSVbIOhWeb/XbHBo65DovhA2D3iYIagJnET0Kf/Xg42h5ycZFS4XCTOxmr
 qz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MYM8dYqYPl4eqxjsUKYjeBmOOKaa2+t2xb+fej5q23g=;
 b=AtMm9MawcDnHWBE/0IixRH5/MptxVEPNn0mnSuG2QvdkIyybm66vTRfJv/50eZR/f/
 cD0H9NW11TqqiMzmYseC78AiCID+7jp20b5ob19SR3GBlNild+Ly50GpezH/6+5BAcSa
 w/zdxDfSV1BNx2h8yihIfPxMYuLs7IYFp2Z0gW4kvJLEyQBeLlmJiDcfctW7YmHmV9CH
 xU5yKP5wvZWed7JitzSAMEBXA1yYZ0n3+e7QMe780GAoVfibcyfHmyxhHet8A2WH7HQE
 ZServyxzSt+IrBdTm9zHqeKwrAlrAjeZM66BJcVRvEWSVRqSANYhlksP0aMovtusQTR7
 lRPQ==
X-Gm-Message-State: APjAAAW9ONO+MWY5jMDkZDf+X9ocR8KDJe+YPYzrtFHCJQszr1cRSBrZ
 T0XJbn/H71LkEGf2/uoJ7SmY+GqBzhs=
X-Received: by 2002:a62:4ed1:: with SMTP id
 c200mr26227581pfb.218.1566250719254; 
 Mon, 19 Aug 2019 14:38:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:21 -0700
Message-Id: <20190819213755.26175-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v2 34/68] target/arm: Convert Clear-Exclusive,
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
X-TUID: LnCPrb6J6VxG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 122 +++++++++++++++--------------------
 target/arm/a32-uncond.decode |  10 +++
 target/arm/t32.decode        |  10 +++
 3 files changed, 73 insertions(+), 69 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e268c5168d..6489bbc09c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10038,6 +10038,58 @@ static bool trans_SRS(DisasContext *s, arg_SRS *a)
     return true;
 }
 
+/*
+ * Clear-Exclusive, Barriers
+ */
+
+static bool trans_CLREX(DisasContext *s, arg_CLREX *a)
+{
+    if (!ENABLE_ARCH_6K) {
+        return false;
+    }
+    gen_clrex(s);
+    return true;
+}
+
+static bool trans_DSB(DisasContext *s, arg_DSB *a)
+{
+    if (!s->thumb && !ENABLE_ARCH_7) {
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
@@ -10131,38 +10183,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10623,43 +10643,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
index 3b961233e5..b077958cec 100644
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
 SRS              1111 110 pu:2 1 w:1 0 1101 0000 0101 000 mode:5  &srs
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

