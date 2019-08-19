Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3170571wrs;
        Mon, 19 Aug 2019 14:38:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/ccNoDkzT4N2J92BYxuluQVsGrRAWwn3brXmuX0uMaPEwbgjFdskOgkc9vTQQE4F4uBgZ
X-Received: by 2002:a37:881:: with SMTP id 123mr22661614qki.145.1566250714608;
        Mon, 19 Aug 2019 14:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566250714; cv=none;
        d=google.com; s=arc-20160816;
        b=rVwEBWsi0v0qtkwUl32ETnfWigrkjbQO/Jz9gpyUm7/yJ2E+dj5rmq7/H9px5eeWZJ
         R0I9q4AOMYhcZIuqiofWL4qrRtKT1+cuZKqpVb12N5hPJi27C2q/FObFc5aGzts90C9p
         X3T1xvEsJ5k9GkFfr2i2W7niY6qv6Wo6D8cplRrdzTn9Ka3R1RWS/8vEJTcC+di61tUN
         GZyrrrrl6iXnn/Rx3Nn/fTYBdh92Q+LNvRyZnq1q6KVNiIAJwwmpVeGjtp2iH/LJdS5F
         nT7DNqT+4lXCo+Rip+YgMY2NlwQa84s0priskAuR5rUarh2SfJ/Pg0vT4+gAUc18lpU9
         85tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0ECKb2Crdeo8p9nq8g4E5oJHI4TpVfRPB3CO9BHkVSM=;
        b=00YJpbHdOJb5ye2Ro0SnmvwI9BdMD0M4Kg+xnxwWj0lqebmlKrXAhOJRjMV32NO9rK
         9w0l8hPfiQI3/w+Ai5uu3XFoQl3TLJDr3cYnjTBciVygcDnNDYiC8vGdYh0cUr0TQ9Gr
         xj0D/XAAyZcuxrZ55l9na+YR1068DLnUvO+qJwvOTlH0B4vS835lo8aUhG9j7ASmbH1+
         o5x1FKgiTiioPZFYu2tftcnYJNmBAkh5B6Ct6Mc6Cn4fEjyBFowgJHKk7hkYJGXrO1ma
         DzNhwdWOqURdS8ZsMjSJdwfnPU8X/+p6aML/0SqA2YC7rxKGnQGvfiEXYgB6noZUDOkK
         RWOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zVuk7dPj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o32si9347438qtj.299.2019.08.19.14.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zVuk7dPj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpMH-0001fv-SO
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLp-0001EA-Fz
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLn-0005za-T3
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:05 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43332)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLn-0005yz-L9
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:03 -0400
Received: by mail-pf1-x441.google.com with SMTP id v12so1936002pfn.10
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0ECKb2Crdeo8p9nq8g4E5oJHI4TpVfRPB3CO9BHkVSM=;
 b=zVuk7dPj2WW8IuyciUG9+eEp5kAUmMgOCY82j1wabyRmxC0LpBqJCwABdsy4clHbKv
 iyo+15XZnU/HJKofxz1g7sfpYPDMcZiJsW0STqenOxtwnqEvLai8Hh3kq3xzFXMRheqv
 Ty30fB442fE6XWvzPb//IbANCUc5yB+0gEia6Xf2lFhVBj727R8S11tsthPeo+koqjF4
 2ASZ7N13l/wsIKNG1I6zeWbv6CMt+AygQoNnwJel6oRi5aQX/JZ+EWXB32vzksRwjf3F
 CJPNx7qPuE0TqTnoRbi84uXtVRbocxuSYrbq09nMBJtIXdR5ivEhO3ZAw12C5DqH1KBy
 sIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0ECKb2Crdeo8p9nq8g4E5oJHI4TpVfRPB3CO9BHkVSM=;
 b=KXtYNy/nUqHYnjITHtjn3Izmfe6LqdFHfpWs1fTHDwgDSTt0Ipwx/gB587gH0kWggT
 u5FArujNOWpXpL4lzn0NbJNBWBoDd56ZHc2GRVi+bLZcK1M5mNkFLnWrQPcygs5IW4v6
 GuzqP6pWPtZ4aUiH88frjOA/hQJpBXWq5Q0uMfLvTdioDP94DXUTULUbGGVR0udNefDw
 0yQ4gW/xdaYhUQIkTy9mmA3CXlGalQnwPfispZwJoi+6k7cB6bsfvQ7JGTx3xBhTz76M
 mTQSFrv+4uxGpNyfn1P3v0yTkmMQxcc8hkj5GPMv1QJFItWqGA7DIorWgoJFeqv7CGne
 DvlQ==
X-Gm-Message-State: APjAAAVO/o9OlwdBiymGjYJr//1lkrntTBGyb90SaFJlAl07LDv2l+Vo
 4AGIO/NcKi+pY6htBslnlxtprg==
X-Received: by 2002:a17:90a:9386:: with SMTP id
 q6mr22671955pjo.81.1566250682671; 
 Mon, 19 Aug 2019 14:38:02 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:51 -0700
Message-Id: <20190819213755.26175-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v2 04/68] target/arm: Convert Data Processing
 (reg-shifted-reg)
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
X-TUID: fwTnPb2avbK6

Convert the register shifted by register form of the data
processing insns.  For A32, we cannot yet remove any code
because the legacy decoder intertwines the immediate form.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 74 ++++++++++++++++++++++++++++++------------
 target/arm/a32.decode  | 27 +++++++++++++++
 target/arm/t32.decode  |  6 ++++
 3 files changed, 87 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index be8e7685e3..a32fe4b222 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7773,17 +7773,66 @@ static bool op_s_rxr_shi(DisasContext *s, arg_s_rrr_shi *a,
     return store_reg_kind(s, a->rd, tmp, kind);
 }
 
+/*
+ * Data-processing (register-shifted register)
+ *
+ * Operate, with set flags, one register source,
+ * one register shifted register source, and a destination.
+ */
+static bool op_s_rrr_shr(DisasContext *s, arg_s_rrr_shr *a,
+                         void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32),
+                         int logic_cc, StoreRegKind kind)
+{
+    TCGv_i32 tmp1, tmp2;
+
+    tmp1 = load_reg(s, a->rs);
+    tmp2 = load_reg(s, a->rm);
+    gen_arm_shift_reg(tmp2, a->shty, tmp1, logic_cc);
+    tmp1 = load_reg(s, a->rn);
+
+    gen(tmp1, tmp1, tmp2);
+    tcg_temp_free_i32(tmp2);
+
+    if (logic_cc) {
+        gen_logic_CC(tmp1);
+    }
+    return store_reg_kind(s, a->rd, tmp1, kind);
+}
+
+static bool op_s_rxr_shr(DisasContext *s, arg_s_rrr_shr *a,
+                         void (*gen)(TCGv_i32, TCGv_i32),
+                         int logic_cc, StoreRegKind kind)
+{
+    TCGv_i32 tmp1, tmp2;
+
+    tmp1 = load_reg(s, a->rs);
+    tmp2 = load_reg(s, a->rm);
+    gen_arm_shift_reg(tmp2, a->shty, tmp1, logic_cc);
+
+    gen(tmp2, tmp2);
+    if (logic_cc) {
+        gen_logic_CC(tmp2);
+    }
+    return store_reg_kind(s, a->rd, tmp2, kind);
+}
+
 #define DO_ANY3(NAME, OP, L, K)                                         \
     static bool trans_##NAME##_rrri(DisasContext *s, arg_s_rrr_shi *a)  \
-    { StoreRegKind k = (K); return op_s_rrr_shi(s, a, OP, L, k); }
+    { StoreRegKind k = (K); return op_s_rrr_shi(s, a, OP, L, k); }      \
+    static bool trans_##NAME##_rrrr(DisasContext *s, arg_s_rrr_shr *a)  \
+    { StoreRegKind k = (K); return op_s_rrr_shr(s, a, OP, L, k); }
 
 #define DO_ANY2(NAME, OP, L, K)                                         \
     static bool trans_##NAME##_rxri(DisasContext *s, arg_s_rrr_shi *a)  \
-    { StoreRegKind k = (K); return op_s_rxr_shi(s, a, OP, L, k); }
+    { StoreRegKind k = (K); return op_s_rxr_shi(s, a, OP, L, k); }      \
+    static bool trans_##NAME##_rxrr(DisasContext *s, arg_s_rrr_shr *a)  \
+    { StoreRegKind k = (K); return op_s_rxr_shr(s, a, OP, L, k); }
 
 #define DO_CMP2(NAME, OP, L)                                            \
     static bool trans_##NAME##_xrri(DisasContext *s, arg_s_rrr_shi *a)  \
-    { return op_s_rrr_shi(s, a, OP, L, STREG_NONE); }
+    { return op_s_rrr_shi(s, a, OP, L, STREG_NONE); }                   \
+    static bool trans_##NAME##_xrrr(DisasContext *s, arg_s_rrr_shr *a)  \
+    { return op_s_rrr_shr(s, a, OP, L, STREG_NONE); }
 
 DO_ANY3(AND, tcg_gen_and_i32, a->s, STREG_NORMAL)
 DO_ANY3(EOR, tcg_gen_xor_i32, a->s, STREG_NORMAL)
@@ -9555,7 +9604,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     TCGv_i32 addr;
     TCGv_i64 tmp64;
     int op;
-    int logic_cc;
 
     /*
      * ARMv6-M supports a limited subset of Thumb2 instructions.
@@ -9993,22 +10041,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         if (op < 4 && (insn & 0xf000) != 0xf000)
             goto illegal_op;
         switch (op) {
-        case 0: /* Register controlled shift.  */
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            if ((insn & 0x70) != 0)
-                goto illegal_op;
-            /*
-             * 0b1111_1010_0xxx_xxxx_1111_xxxx_0000_xxxx:
-             *  - MOV, MOVS (register-shifted register), flagsetting
-             */
-            op = (insn >> 21) & 3;
-            logic_cc = (insn & (1 << 20)) != 0;
-            gen_arm_shift_reg(tmp, op, tmp2, logic_cc);
-            if (logic_cc)
-                gen_logic_CC(tmp);
-            store_reg(s, rd, tmp);
-            break;
+        case 0: /* Register controlled shift, in decodetree */
+            goto illegal_op;
         case 1: /* Sign/zero extend.  */
             op = (insn >> 20) & 7;
             switch (op) {
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index b23e83f17c..8e0fb06d05 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -23,6 +23,7 @@
 #
 
 &s_rrr_shi       s rd rn rm shim shty
+&s_rrr_shr       s rn rd rm rs shty
 
 # Data-processing (register)
 
@@ -49,3 +50,29 @@ ORR_rrri         .... 000 1100 . .... .... ..... .. 0 ....    @s_rrr_shi
 MOV_rxri         .... 000 1101 . 0000 .... ..... .. 0 ....    @s_rxr_shi
 BIC_rrri         .... 000 1110 . .... .... ..... .. 0 ....    @s_rrr_shi
 MVN_rxri         .... 000 1111 . 0000 .... ..... .. 0 ....    @s_rxr_shi
+
+# Data-processing (register-shifted register)
+
+@s_rrr_shr       ---- ... .... s:1 rn:4 rd:4 rs:4 . shty:2 . rm:4 \
+                 &s_rrr_shr
+@s_rxr_shr       ---- ... .... s:1 .... rd:4 rs:4 . shty:2 . rm:4 \
+                 &s_rrr_shr rn=0
+@S_xrr_shr       ---- ... .... .   rn:4 .... rs:4 . shty:2 . rm:4 \
+                 &s_rrr_shr rd=0 s=1
+
+AND_rrrr         .... 000 0000 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+EOR_rrrr         .... 000 0001 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+SUB_rrrr         .... 000 0010 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+RSB_rrrr         .... 000 0011 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+ADD_rrrr         .... 000 0100 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+ADC_rrrr         .... 000 0101 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+SBC_rrrr         .... 000 0110 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+RSC_rrrr         .... 000 0111 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+TST_xrrr         .... 000 1000 1 .... 0000 .... 0 .. 1 ....   @S_xrr_shr
+TEQ_xrrr         .... 000 1001 1 .... 0000 .... 0 .. 1 ....   @S_xrr_shr
+CMP_xrrr         .... 000 1010 1 .... 0000 .... 0 .. 1 ....   @S_xrr_shr
+CMN_xrrr         .... 000 1011 1 .... 0000 .... 0 .. 1 ....   @S_xrr_shr
+ORR_rrrr         .... 000 1100 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+MOV_rxrr         .... 000 1101 . 0000 .... .... 0 .. 1 ....   @s_rxr_shr
+BIC_rrrr         .... 000 1110 . .... .... .... 0 .. 1 ....   @s_rrr_shr
+MVN_rxrr         .... 000 1111 . 0000 .... .... 0 .. 1 ....   @s_rxr_shr
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 7068596b99..f0a73fa003 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -20,6 +20,7 @@
 #
 
 &s_rrr_shi       !extern s rd rn rm shim shty
+&s_rrr_shr       !extern s rn rd rm rs shty
 
 # Data-processing (register)
 
@@ -61,3 +62,8 @@ SBC_rrri         1110101 1011 . .... 0 ... .... .... ....     @s_rrr_shi
   SUB_rrri       1110101 1101 . .... 0 ... .... .... ....     @s_rrr_shi
 }
 RSB_rrri         1110101 1110 . .... 0 ... .... .... ....     @s_rrr_shi
+
+# Data-processing (register-shifted register)
+
+MOV_rxrr         1111 1010 0 shty:2 s:1 rm:4 1111 rd:4 0000 rs:4 \
+                 &s_rrr_shr rn=0
-- 
2.17.1

