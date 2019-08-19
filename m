Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3181667wrs;
        Mon, 19 Aug 2019 14:54:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfI5Y+jusgBWmsH4rRoAsgCmrGEtpLzftDwXoRwyMyCDYjdCeu6rqw1tWsVWEX/c76udv6
X-Received: by 2002:a50:f318:: with SMTP id p24mr27921235edm.50.1566251654296;
        Mon, 19 Aug 2019 14:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251654; cv=none;
        d=google.com; s=arc-20160816;
        b=LO2o2+rnlbnvSJWMKXskhT0H0UDl/jUf5Qi8d+IhAy15OVJ3IKVc+GxduGfJiw93fR
         pzxIFpCj/efMHZjN63ghHSqHLIvBzOIecUHEKecm+Q+NrZVs9+2l/Z5w0wA+cdeY71IA
         qSZ0thbQg3D4HkjGDhoov6wLbFxaLeNojWt44svUk1cGayBiU6/0JgernbIBvrVCPegs
         kA0RW7Kk0wKEe5Iez3jj4i586rlSoxH0CRrPf5DGI0UXrSZ8F4Kf0ZOlWC6H37y+h8Pp
         yAIZAYcIk2rnR0oshqAbWPYcYgu8sJcpJigjNeZ8N/A9pJhYNqFSadhsHlb1Tbbj5YaK
         7Gwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VezSzLCtFs9kY3Fe5wLKu5xLpiNSXhDdz7VdFtZV8bc=;
        b=p7zXez05JPO8nMw1cXsB9z3Cztgmi0fwILDLrA5f5jZPTGFwUmdc1sLZtgvuVEboJA
         09UkTmGZ4ODejkg+f5ewW/Ax0P3j2F/08Qb3swtprMICEKYW8FQ18PUcXZZe49Gy1n8m
         YCt7R/VP1SBGeVkhqdal5P2sH+qrFbne00wBUKmmniG7mgs9upDbzdf3QpsFZtkTJKFu
         6cRSTfs0FKwtKiw6iyY4PMKq4GG9bqRjGmlAoUJCiTG9h/C2IdXlAI8mFu/mjCgbghgN
         HGkxCjvNo1NjhcsIkrovc5PExfYDyOeI+TX6dzX/vMtrKQazDW5YjK5KDQVfJegOERD9
         RqTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ulv9UWqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by3si7728635ejb.307.2019.08.19.14.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ulv9UWqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpbQ-000586-QF
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMH-00020v-Ba
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMF-0006K2-1V
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:33 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpME-0006JF-Ph
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:30 -0400
Received: by mail-pl1-x643.google.com with SMTP id z3so1586278pln.6
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VezSzLCtFs9kY3Fe5wLKu5xLpiNSXhDdz7VdFtZV8bc=;
 b=ulv9UWqoykjQuoORkZKHART9F1UQJ5YF4smszkfmZD96jkaFF6AzK63EezyXvAV5mT
 ZrJcDoz0PwXVM3sWokk/i825/SRehg/pVS8jd0rahdv7BdbVIIeZYlxmJZS90oyrgodd
 VZ2biauI+FxWaMdq+3SvaUvpfVWhu/3akhXY5ptKHzoa+Vo2GcrJf0W1uxIk4hNWOhfF
 5C8QrBMNHKXs/nBTab5ajRwqXlOMhtPv4hJupD/0MOYDYqH/DGLgZlsx08m7JoXXjYkx
 kMQTf8IPWwNNMSCJsKOWpWrX8TVzqUzie0oc+NT+kWyh71n43GtZrX1dW3BP9F74+2lr
 tioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VezSzLCtFs9kY3Fe5wLKu5xLpiNSXhDdz7VdFtZV8bc=;
 b=IUj5zZ52dy44wsszF3mfn2r07NY1LMrmxbrvfSYhkQ8XhIaEtpbRo3zENY8BYb/+wN
 /gIympRQzwHcHa++aIehXkyTceBbFt9w2nQ1uAIfKWjL7F2GS80iT57g8+2O/VwmwKFe
 wKWcYJrTKtpysXBVlK2s+Zn5huFeA4mUowS8LiFA893L7U6gYF6FHroucx7A2LJFLaBo
 okd1C0H6NFycP/66VhEn5XKZVjJsVi1OrA9+dCyjRb7zKXZ3aKgQ16O6UJeiHWilqdta
 hcHm1TeL9/frugvd+i8j9sPtW/2PPEzUJwXWyPcIkkjRp+wbrMixXkFGjGSK1a5/S30m
 CTxg==
X-Gm-Message-State: APjAAAU+X1XOD5Q+0AbWRi96YjzhIoAgIXVjpiQKvVIyKBoDjBK4tI1C
 74J9opsOjQ8PTDWftWMyoU0JwQ==
X-Received: by 2002:a17:902:223:: with SMTP id
 32mr25241732plc.220.1566250709791; 
 Mon, 19 Aug 2019 14:38:29 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:13 -0700
Message-Id: <20190819213755.26175-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v2 26/68] target/arm: Convert MOVW, MOVT
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
X-TUID: 7Nqox3zJ4utl

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 89 ++++++++++++++++--------------------------
 target/arm/a32.decode  |  6 +++
 target/arm/t32.decode  |  9 +++++
 3 files changed, 48 insertions(+), 56 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7962ac49e6..81eae286e8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7841,6 +7841,34 @@ static bool trans_ADR(DisasContext *s, arg_ri *a)
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
@@ -9649,7 +9677,7 @@ static bool trans_UDIV(DisasContext *s, arg_rrr *a)
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, val, op1, i, rn, rd;
+    unsigned int cond, val, op1, i, rn;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
@@ -9898,26 +9926,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10655,42 +10665,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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

