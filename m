Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3189231wrs;
        Mon, 19 Aug 2019 15:03:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzw1DpKN0SNKou0zbG5PUt2CM25FOOu17MjldrhRmyU89xYbGtL2qlpPJtLQRtP0rM6IWTK
X-Received: by 2002:ac8:51c4:: with SMTP id d4mr20222751qtn.176.1566252228397;
        Mon, 19 Aug 2019 15:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252228; cv=none;
        d=google.com; s=arc-20160816;
        b=FbsMZSmPrDe1mq63MP4moDKAIyEUxSgU8gCJ2UbcbveUTymiqsc8joyklRW8STiDp/
         JnUnkUg0onr9lxzRXUGwn+6dShUwrc50uybIrP1GIhA+HEl1FGc8HOk1Bk/KgHk4+m9E
         KE9cRvYlaUPLEe6PkH6gzabQ9QIjrpBqmZaY2qEVaQRbTN4D3795J4omKpRVFRmqPejB
         OzSIK2T6uZXiqPLkuttJ+FaP6Yg3dSGbrb9LvrFfyjnozfZsy3gATzthy5QL3hvWoedq
         mjs6choVliFosNpveTk3Uo5zyBWJGu5dGrpAp4awcnjhE1YN4PpR6MMssVZdktp8lE+k
         KFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ac3UBjPihyDkOeX0vZxfIb3puwN3GecMDaJ1xyBUXaw=;
        b=fJz/PjdqwREVMUa9yDyL5ElhloQri4aAhhJM4vkzslYA0lL8XR0/I7P771FP4m4Pej
         EOz4iZaB/l7fLqTa3uH5i/TReEjJL9u4f7TRBYTMWp3th8rZFBqNXtlE7x7vrbwLUmow
         jSX64i/V+/dZemkfcT93DopKAUFrNUMeAm7a7zsNoHqGxI+5IzcKfL88MXDLet1v+2OR
         VP+2aQ9h5I50caY6sWIxB6O5yfyiXZSnwCajhrd4gIjvUp0mTZyA+19smyVBn4G5yu1r
         04ZEX25CIktahDuXEGaWS2hzTTlqlk9Mt0hD2FNq0XZxGdD+rnUeTEvHWxbrfIf3QKnx
         6Fkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VRiUNrzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j33si10940804qvc.153.2019.08.19.15.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:03:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VRiUNrzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpkh-0001V9-9S
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMb-0002Py-A6
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMX-0006Yp-Em
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:53 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44257)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMX-0006X2-7a
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:49 -0400
Received: by mail-pl1-x642.google.com with SMTP id t14so1574886plr.11
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ac3UBjPihyDkOeX0vZxfIb3puwN3GecMDaJ1xyBUXaw=;
 b=VRiUNrzCYdV2Fjxa9QpObGV22NV5RPDM6YKfqC4R20btrDTQT8tH2oFbUdq0MujkiR
 Ar7IApPhQp9siEY3cQ4oMIqajBbJSIJnTguFuyETeCWbJudkZv3d1a4NvTrqH+T1+7ti
 tmM/p9YsIVcaJD73f4veRXN80sWJI418zM7CPyToiKXXm5sNLwHwonFjukw3eDzsF8nA
 eoVp3KQ9ygS6g7ikDHI/qDWCT99hsBRCJPIhWREG5fB71UF2JA608xjS7BbznGPrpjr7
 +rOaq0j2JISMe0HktD7nS3ceRRmiA4Ac7Q556zguAO8PJABdXOJINGYKm53YOjTe1wY8
 O4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ac3UBjPihyDkOeX0vZxfIb3puwN3GecMDaJ1xyBUXaw=;
 b=P4jKogzdtoaf1JjtY6zvx6JUqKlGJ0MGi4xBR0LXh8hM5o4pEp4wQ+kcGbZfkOblmY
 xgyoY0CRywsBEz1t7t4qKI9gUJy5Tp2LLB2A6XO3kWujZGmnHRA09kzlmeHetxnB8JdU
 1vTji6CQehD2Y5CdfAWnJ75eK9F4uO8NwaY9eYGzdUVXqiMN5i6j4iEK8KADHqKBYJwo
 JRPYjtUeMBoxGVO/8h2nz1xBT8YCKfMlM0/uuJKUoDIzBNH+cwrw76AI5F29CecKPtqQ
 ukY2Y8WZqnlAVLg5kX8/lNymo3Qf+t9R8Yq6dyDExd40UGLovWWhqiMUWali4Ho0cAhw
 lF4g==
X-Gm-Message-State: APjAAAV8c7IwMPEyDAZmuI0YIKnkjxUgaVoQCijmYl02zvnv2a0YrpHf
 2i7xDpB7KPGHXESnVDUKT7vXM8PJsV8=
X-Received: by 2002:a17:902:2bc5:: with SMTP id
 l63mr22378145plb.239.1566250727323; 
 Mon, 19 Aug 2019 14:38:47 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:28 -0700
Message-Id: <20190819213755.26175-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v2 41/68] target/arm: Convert TT
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
X-TUID: GnmkSphk+IZC

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 87 +++++++++++++-----------------------------
 target/arm/t32.decode  |  5 ++-
 2 files changed, 31 insertions(+), 61 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9a8864e8ff..d1078ca1ec 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8454,6 +8454,30 @@ static bool trans_SG(DisasContext *s, arg_SG *a)
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
+        return false;
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
@@ -10409,7 +10433,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rs;
+    uint32_t rn;
     int op;
 
     /*
@@ -10453,70 +10477,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
index ce46650446..bb875f77b0 100644
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

