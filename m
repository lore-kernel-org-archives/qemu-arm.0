Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1133629wrp;
        Wed, 4 Sep 2019 12:55:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmVEX59hxbriUAqh1lbuJeDCn2Fcvx88AO804ynjRhicd+OxFcoVI/FPSqe0uZG9hOM+H9
X-Received: by 2002:a50:f782:: with SMTP id h2mr35458501edn.225.1567626911794;
        Wed, 04 Sep 2019 12:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626911; cv=none;
        d=google.com; s=arc-20160816;
        b=gtTJG+XnJ5iCzxQbDbi0smyz+G7hji2PK5svVug3Hlx/D7sPJU4FSr6edtEqq9GBT4
         Q88inH8uLfNzmGdNHsv5tQk/Nsg0wVLM4L1N/r6pziZe+JSErK4DsicFYTm4c1vMaHyd
         P7Tz7b9A+O+OOXmvK+7lks7mSFi1PbrfodDbskiHm6R8MOJEhAXd6rhg/FufbMzoG3jp
         GgKG5UVGfnsxmP8pcDILcJ+2l2mp6QZS4XFmqKRR+dRVy8T0OCizrtp9tKLe/jnE3Ryn
         TSiPwiNmAKtQKGGp4SjivY5z6kxMLxru1iYFd2ec7zn7QhzX92+Hy3gwWahq0j8OkS96
         Ymxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=g/QDb2kvmqcOm71+AOuMbvaZW1g+/6rTDU0HkFA7so8=;
        b=X9xih6TzP/N/uOfwrqT/vDLAxalj2rVGXOHKMmE1wg6/25s4NFj5Y8jTADr4a1pCAp
         w4TCDLIAFDMJnJZvJsn311f+6RjoJmL51DIY8cez/+8bxvbOLdxUBp95rVLM1y7f88P2
         AubSrI6LKnNmcMysuFXM8vXTBAXzKhpbI39VqlHzhKWijKy3n7mFtJqQjwnrvAnfM7C+
         h6VdYEuwt+CEQCzwwZofQNTQTpo1poaU6W1sQgza7Zbv+1HDb7spsZuP/uM0fRq40hNW
         6soMxQ4zzc+tG6J7NJjBEHr/NBg1YQYdtuEZcr5Yn9i+3F9w5eYP1RTOZCI/TnY1ZBTQ
         ASnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EE+5fAWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si5529434edb.425.2019.09.04.12.55.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:55:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EE+5fAWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bN0-0004dJ-7P
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0G-0004oV-19
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0D-0002X9-Fb
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:39 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0D-0002WM-4e
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:37 -0400
Received: by mail-pl1-x642.google.com with SMTP id x3so4897224plr.12
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g/QDb2kvmqcOm71+AOuMbvaZW1g+/6rTDU0HkFA7so8=;
 b=EE+5fAWrJbdaUB+8b9wkCmqR6WzEPJ+vHmw1zHyCeAjQ5I4FxnmF+Ejod0TAAyN9ru
 q/b5vAoqMPI167hBWEKK3DEV/5ZCfEkkyPljC3KLhoecJUFSO5ZQ3g+p64kNnCtyw+aM
 DuhApSZ0mwVgjKz1TE85P+rU1yweAsf23RyUH21U8Q02rwNB3/m/0JkEUdA6RM2NWB7B
 M8TTdl7hs5rfw89zai4aOk7HRxEYjWFfvZWmcpzR8Rr9luaoretfzUxHgm0UXXjjcZb/
 voGsMS+quwR2OOQfTZHxY7oZxRcZv0Es5gT2Uuw2TwFeRzDDtTqgRnMlOR9dOpaG/96U
 wpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=g/QDb2kvmqcOm71+AOuMbvaZW1g+/6rTDU0HkFA7so8=;
 b=aIjo2AViVZUku74xm+/i8q0hd25Zj2hSHhtfZ5em+SU6A81APl01Nfx7xNY2tlV97l
 xizmB11pAYAWIpEjhSHSa6fVHndvddmnGE5V4aqHKlX2F1yI4bX1wEXXblXRHT9GSjMQ
 OJFOr3I8kbPr+vgxtSFwmRyyEyWL4kG3QHRedDVWtobcwcTtFIR4FfH5CFbz2DCatbqo
 OFt6vjr40PKNLIo0Wq2Rd2BnOiPZbFPrl7aIwPsPNTd4FtjxPR1vvaYHFSLz2uYU7bwh
 si0aguwKE1OUJKLEyd+Cy1hr8Q4Fd+v1w6+Vkp870L9CzwfPfwdFeykijBWG6FV9aRJL
 AixQ==
X-Gm-Message-State: APjAAAWm51eZvyLape95lqR53r0bYl7Zd/6ATP49yedLjMQVjyMNMCuZ
 T9/jvysKSIqXDZqaWPsYHz0Ecw==
X-Received: by 2002:a17:902:244:: with SMTP id
 62mr42104077plc.243.1567625496164; 
 Wed, 04 Sep 2019 12:31:36 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:17 -0700
Message-Id: <20190904193059.26202-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v4 27/69] target/arm: Convert MOVW, MOVT
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
X-TUID: mqLPXuECIUFB

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 89 ++++++++++++++++--------------------------
 target/arm/a32.decode  |  6 +++
 target/arm/t32.decode  |  9 +++++
 3 files changed, 48 insertions(+), 56 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5b9b303467..b7d26f7cc8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7870,6 +7870,34 @@ static bool trans_ADR(DisasContext *s, arg_ri *a)
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
@@ -9762,7 +9790,7 @@ static bool trans_UDIV(DisasContext *s, arg_rrr *a)
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, val, op1, i, rn, rd;
+    unsigned int cond, val, op1, i, rn;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
@@ -10011,26 +10039,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10765,42 +10775,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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

