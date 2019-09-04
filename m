Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1146068wrp;
        Wed, 4 Sep 2019 13:08:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCY3pCSe1+HkPNpaWHOK86AagSJiunVCgEYu2vQLEdJNR5ydqsHs71+GMdHB3jKEQW38HT
X-Received: by 2002:a0c:df12:: with SMTP id g18mr193682qvl.34.1567627693393;
        Wed, 04 Sep 2019 13:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627693; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHG/HqEnGUlYgUfFZAixvIW8juWIS85WzCLg+jX/yKhDveFEuBb2XUIhjoRcl/cYed
         MTbUyuH2GaNcxCkhaUUTVj+JVH3VOjWBR7veew59t24Dw9ZqWWTyHnqYFvIXJ9kXoA07
         CIWBm31b2+3d5GCiOxR1EPfRLmEfMCpUd6k7EdSffTKfW9o7yy8Nbvcm0XGkCjTqDdZs
         l0eIsn6ykGFwdMhM3XHVjWbOCTf+dkeMngIUxCCL1C5vLeFgTZ5rxQr7Yxjh9E2pbPHi
         EE4lYpy9A3FmAB51M8vmJFJHOb4DUyRgkbROGecTtN0VM02QlaTQ2nFaAoUx5y9rUQjD
         4D+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=egisVGOg4CJ3QPg/JSR7AUyfTVGzQfFPHW96Z7DyXjs=;
        b=c+Po/D1m0BaB+87ugitOAn1KlAwz9p0KVII8dHIOvk/KRTTsbMz0Qocha0YD3ArLF5
         rJSyzWkCsejBQX2Zsl98dgLpxaMOhiW8tSS1c5ZJBE9XRqQVi8qWj14rW8zNlxpCl71Q
         Tuu7eFxFO0EmNXhQwbmwl8PbKWDoidzFqAGkiB23ehf+8cfPeIsmoM5W6ENsnxdl0KjN
         n2vfV1nht885h/Aya1x+c3tZfVkuakysWmyWRrSxepEDFKfFVHgvLkzN4qN6OYt8i/OA
         ebfeHjP5QunuE+gJxitCUZLIfkERwHPw4J7FQgNGgVwmjSnY+23K4o22LpuNC6DjXgLK
         cYQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z2bWqD+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m35si6902626qtd.389.2019.09.04.13.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z2bWqD+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bZc-0002Yg-FT
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0d-0005KC-T7
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0b-0002vC-0S
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:03 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34381)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0a-0002u9-O1
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:00 -0400
Received: by mail-pf1-x443.google.com with SMTP id r12so1752348pfh.1
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=egisVGOg4CJ3QPg/JSR7AUyfTVGzQfFPHW96Z7DyXjs=;
 b=z2bWqD+UMxUOJAerVJ0rmwvmlkV7mMH2UFpy59RZ9/q8VktkdZ53PohI725Ej0ayiA
 yfvmvhzHUc8baNwtkAPPvZBSsUU2q3COHqh6TSkXDtJ264feozH2Sse4ri9U88zGSKte
 BYzh+29wt2c7+7l5upRwtPbiJbFOjye+pRQe+k/Rul1gsC29RXc75uoafki1vjFBV8FS
 Vr89qJNXPnoPohQTHH1f4OheyUiLz90xoNIoKLnq15y93zmNY7S49eJndlsGg0S5/bJr
 VQeBOFlG54oqi4VCIVNMyHmuAT9NdP9bKLCQfkzpsVeZqJHrgUF6IOje7JLsKZgp5Avr
 4ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=egisVGOg4CJ3QPg/JSR7AUyfTVGzQfFPHW96Z7DyXjs=;
 b=hDF1eh8NdWTtTFK7ZdaJGUB4NiH1S+4G2CnywnpyZesEk1Yp8IZS6dSCtOIBMN65SI
 etwlkTRMr3k6RlUxpJZ8nquPRkaMOMKSLTB4XYqJz3CIRc9UTWM9Up+sSJ1D8h/PDYpO
 8ktJ8Na9k0eQGP2TiMQs6JTELoeK0K0AOdDnEnSqMvrTO0e84g1mJUBOQgUPhXkJIxvr
 NooVzu9VYdSS5W1V/oPmZ6clJcL7GG0kXRckJRgQXfkmi/eF3bmABwK+P1qmHTOTdMC5
 BXhqX9dhezRU13OqHkFk9eV85ALSshvCn/zlc4u6dtckrNO/ysYOiUa7rnJhn56UxiV/
 D3IA==
X-Gm-Message-State: APjAAAVweyKI++DGgbiSudw0l4GR14yD7XioU46V0ooAnUQUKCV3WsOC
 Unzk/CFuwntCQMp0WV1zwVTiPQ==
X-Received: by 2002:a17:90a:c20c:: with SMTP id
 e12mr6916184pjt.14.1567625519572; 
 Wed, 04 Sep 2019 12:31:59 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:36 -0700
Message-Id: <20190904193059.26202-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v4 46/69] target/arm: Convert T16 data-processing
 (two low regs)
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
X-TUID: HLdsVtqSwthH

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 152 ++---------------------------------------
 target/arm/t16.decode  |  36 ++++++++++
 2 files changed, 43 insertions(+), 145 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7e530f1fdc..b77922f808 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -445,13 +445,6 @@ static inline void gen_logic_CC(TCGv_i32 var)
     tcg_gen_mov_i32(cpu_ZF, var);
 }
 
-/* T0 += T1 + CF.  */
-static void gen_adc(TCGv_i32 t0, TCGv_i32 t1)
-{
-    tcg_gen_add_i32(t0, t0, t1);
-    tcg_gen_add_i32(t0, t0, cpu_CF);
-}
-
 /* dest = T0 + T1 + CF. */
 static void gen_add_carry(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
 {
@@ -7553,6 +7546,11 @@ static int t32_branch24(DisasContext *s, int x)
     return x << 1;
 }
 
+static int t16_setflags(DisasContext *s)
+{
+    return s->condexec_mask == 0;
+}
+
 /*
  * Include the generated decoders.
  */
@@ -10861,145 +10859,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 
         /*
          * 0b0100_00xx_xxxx_xxxx
-         *  - Data-processing (two low registers)
+         *  - Data-processing (two low registers), in decodetree
          */
-        rd = insn & 7;
-        rm = (insn >> 3) & 7;
-        op = (insn >> 6) & 0xf;
-        if (op == 2 || op == 3 || op == 4 || op == 7) {
-            /* the shift/rotate ops want the operands backwards */
-            val = rm;
-            rm = rd;
-            rd = val;
-            val = 1;
-        } else {
-            val = 0;
-        }
-
-        if (op == 9) { /* neg */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, 0);
-        } else if (op != 0xf) { /* mvn doesn't read its first operand */
-            tmp = load_reg(s, rd);
-        } else {
-            tmp = NULL;
-        }
-
-        tmp2 = load_reg(s, rm);
-        switch (op) {
-        case 0x0: /* and */
-            tcg_gen_and_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0x1: /* eor */
-            tcg_gen_xor_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0x2: /* lsl */
-            if (s->condexec_mask) {
-                gen_shl(tmp2, tmp2, tmp);
-            } else {
-                gen_helper_shl_cc(tmp2, cpu_env, tmp2, tmp);
-                gen_logic_CC(tmp2);
-            }
-            break;
-        case 0x3: /* lsr */
-            if (s->condexec_mask) {
-                gen_shr(tmp2, tmp2, tmp);
-            } else {
-                gen_helper_shr_cc(tmp2, cpu_env, tmp2, tmp);
-                gen_logic_CC(tmp2);
-            }
-            break;
-        case 0x4: /* asr */
-            if (s->condexec_mask) {
-                gen_sar(tmp2, tmp2, tmp);
-            } else {
-                gen_helper_sar_cc(tmp2, cpu_env, tmp2, tmp);
-                gen_logic_CC(tmp2);
-            }
-            break;
-        case 0x5: /* adc */
-            if (s->condexec_mask) {
-                gen_adc(tmp, tmp2);
-            } else {
-                gen_adc_CC(tmp, tmp, tmp2);
-            }
-            break;
-        case 0x6: /* sbc */
-            if (s->condexec_mask) {
-                gen_sub_carry(tmp, tmp, tmp2);
-            } else {
-                gen_sbc_CC(tmp, tmp, tmp2);
-            }
-            break;
-        case 0x7: /* ror */
-            if (s->condexec_mask) {
-                tcg_gen_andi_i32(tmp, tmp, 0x1f);
-                tcg_gen_rotr_i32(tmp2, tmp2, tmp);
-            } else {
-                gen_helper_ror_cc(tmp2, cpu_env, tmp2, tmp);
-                gen_logic_CC(tmp2);
-            }
-            break;
-        case 0x8: /* tst */
-            tcg_gen_and_i32(tmp, tmp, tmp2);
-            gen_logic_CC(tmp);
-            rd = 16;
-            break;
-        case 0x9: /* neg */
-            if (s->condexec_mask)
-                tcg_gen_neg_i32(tmp, tmp2);
-            else
-                gen_sub_CC(tmp, tmp, tmp2);
-            break;
-        case 0xa: /* cmp */
-            gen_sub_CC(tmp, tmp, tmp2);
-            rd = 16;
-            break;
-        case 0xb: /* cmn */
-            gen_add_CC(tmp, tmp, tmp2);
-            rd = 16;
-            break;
-        case 0xc: /* orr */
-            tcg_gen_or_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0xd: /* mul */
-            tcg_gen_mul_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0xe: /* bic */
-            tcg_gen_andc_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0xf: /* mvn */
-            tcg_gen_not_i32(tmp2, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp2);
-            val = 1;
-            rm = rd;
-            break;
-        }
-        if (rd != 16) {
-            if (val) {
-                store_reg(s, rm, tmp2);
-                if (op != 0xf)
-                    tcg_temp_free_i32(tmp);
-            } else {
-                store_reg(s, rd, tmp);
-                tcg_temp_free_i32(tmp2);
-            }
-        } else {
-            tcg_temp_free_i32(tmp);
-            tcg_temp_free_i32(tmp2);
-        }
-        break;
+        goto illegal_op;
 
     case 5:
         /* load/store register offset.  */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index e954f61fe4..44e7250c55 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -18,3 +18,39 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+&s_rrr_shi       !extern s rd rn rm shim shty
+&s_rrr_shr       !extern s rn rd rm rs shty
+&s_rri_rot       !extern s rn rd imm rot
+&s_rrrr          !extern s rd rn rm ra
+
+# Set S if the instruction is outside of an IT block.
+%s               !function=t16_setflags
+
+# Data-processing (two low registers)
+
+%reg_0           0:3
+
+@lll_noshr       ...... .... rm:3 rd:3 \
+                 &s_rrr_shi %s rn=%reg_0 shim=0 shty=0
+@xll_noshr       ...... .... rm:3 rn:3 \
+                 &s_rrr_shi s=1 rd=0 shim=0 shty=0
+@lxl_shr         ...... .... rs:3 rd:3 \
+                 &s_rrr_shr %s rm=%reg_0 rn=0
+
+AND_rrri         010000 0000 ... ...            @lll_noshr
+EOR_rrri         010000 0001 ... ...            @lll_noshr
+MOV_rxrr         010000 0010 ... ...            @lxl_shr shty=0  # LSL
+MOV_rxrr         010000 0011 ... ...            @lxl_shr shty=1  # LSR
+MOV_rxrr         010000 0100 ... ...            @lxl_shr shty=2  # ASR
+ADC_rrri         010000 0101 ... ...            @lll_noshr
+SBC_rrri         010000 0110 ... ...            @lll_noshr
+MOV_rxrr         010000 0111 ... ...            @lxl_shr shty=3  # ROR
+TST_xrri         010000 1000 ... ...            @xll_noshr
+RSB_rri          010000 1001 rn:3 rd:3          &s_rri_rot %s imm=0 rot=0
+CMP_xrri         010000 1010 ... ...            @xll_noshr
+CMN_xrri         010000 1011 ... ...            @xll_noshr
+ORR_rrri         010000 1100 ... ...            @lll_noshr
+MUL              010000 1101 rn:3 rd:3          &s_rrrr %s rm=%reg_0 ra=0
+BIC_rrri         010000 1110 ... ...            @lll_noshr
+MVN_rxri         010000 1111 ... ...            @lll_noshr
-- 
2.17.1

