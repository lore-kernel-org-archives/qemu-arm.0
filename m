Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3191264wrs;
        Mon, 19 Aug 2019 15:05:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRlkezTpBwtXADIrKRuN7Ekvxpq0SslA1+9XmLcKWCH95EnP9xn9bW34aDMYYUkU42VD4o
X-Received: by 2002:a50:e40a:: with SMTP id d10mr28308934edm.194.1566252356657;
        Mon, 19 Aug 2019 15:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252356; cv=none;
        d=google.com; s=arc-20160816;
        b=zL5yxYzTR8mNiUs6mCDnMx+ujpyv2z1DzlPSwWScElkkrLdpf7fqc+7FAt5IJ9WFH/
         5niu/8OpiBltN/vCavoL1zBhDw+1WeI/hJ8H0svJP9Tv8OWX6gGhDsn8me4tUa7gUPzl
         PUVFOuImD5DXxXRvLHawO1SCphAOaxHAQeqRH7xrLobmm0e9XELvZUChH6CSx/5m3aiS
         +DYZgTKXQUlOsujC2dWRq0jW5NffO/wFk96Cuh0e+/+HqMVem3QYKONHuNPQYuERAUwD
         xbPVHOqeAp/eTq25ENniQcYFGC8tyrF+5LkzyG24zAfi9uejTds/tLEsO7fFzZh3xYxN
         7OlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NNqewFxAhp3TmNZYeBy2lNscR/CrnSrYWBFvc4ZcTG4=;
        b=QpnteG0X/ElBZCMlqYUSeyYD2453CVI67tHeE6GOmXpgxPtObsItucXv9Wv4e32HwZ
         Y/JvblwZF96kiDQr39Q23rL1Y2aVsB2NsVfOgCv4ALF29Nookh/2AoO9n+7dAAUGFStk
         MXjWVGtf9ynNtKykBDVhg7O/oYk/SI+dD2znDPeCP8xJwhBjQskOB7iIhFlPHlz6w769
         AHLPmADGAoQSd/lWr9DLdoG8MPJ9yU7nlgpkUzrd/P9KsYEuzAbrnMhOXbWj7a55+pfa
         yllNmVt6ZmmRogniC/O/MMaUkb5DLs2VCo4O/xXt2aYaeNEW4QJN5uQDDF5QI0I341LT
         WfhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r5EwM5I9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si7639390ejx.68.2019.08.19.15.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r5EwM5I9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpml-0004Gg-4g
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMf-0002SA-Bi
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMd-0006dP-BK
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:57 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35001)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMb-0006Zu-9L
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:55 -0400
Received: by mail-pf1-x443.google.com with SMTP id d85so1954857pfd.2
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NNqewFxAhp3TmNZYeBy2lNscR/CrnSrYWBFvc4ZcTG4=;
 b=r5EwM5I9gX9aNCrTZZpwXCMnyDdCNN39XSzG2ENvcklVcaQyXaXf7lRSVQHiOC1LmQ
 3I9B4rrVKiUIj/7GcjJIZp26p62c+vX/nX//UaYVPfwDjpGHIhB8ZhLNghzXx/ZovKS/
 TBvwPtCZLdCE1vutYzKIBLtqV+GN/M4IH2Us70Ii7p6yT/uwPZoNODqJhl8jNi/HSYAD
 /TcOQSE/vgrrPRPnOQP9wCV4mNZ+SO6RgCzCtZt149sVHk/T1KP+0S3AzncJBaZFsiIb
 KjVWV9j/33ALUV0dcRRSbygHfSrv/hr+/ob5xOovvkTmYulLmvqg9zRlGg1ufVzzPl7O
 UZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NNqewFxAhp3TmNZYeBy2lNscR/CrnSrYWBFvc4ZcTG4=;
 b=sjhwKevD+k0mHWDIY9+Or5sPhgLSAnd88dQj9z3tpFuHEP/xNUGIAQIhRf92yhQqIg
 VScfnS4bAbHkHMHc5/KU59xUdSCMuzeZl4Ql+0S/UAAcNo3C2DD2UmaBeDjPN71UQeBo
 Z3tmulcnqkWux1yOlGXmd5woR9JT9mbt9FjWdt34MvtIapd9uG87O9TOo9uQXQa6Srum
 dcIOKfZGFPuowAON/ZDeKXEK/8Y6wsXeSgplI97YIdNUZXAXyNpwZrj+43njEFf7lgwb
 2fvbMeWY6S+x2TAxDusgxT//An5FP1w4mXx+N/gYX/I/3KXMXbbIPw9xXYCShUjmhja6
 0o7g==
X-Gm-Message-State: APjAAAVuFa81+KnmBKxzchv5SqP1uJn/lSmjTf5+miGAAG/+TuzvDVzN
 GUDQ6ju47N/bjRVSXJY7Iuj8M1TKTyo=
X-Received: by 2002:a63:5f09:: with SMTP id t9mr22017442pgb.351.1566250732046; 
 Mon, 19 Aug 2019 14:38:52 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:32 -0700
Message-Id: <20190819213755.26175-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v2 45/68] target/arm: Convert T16 data-processing
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
X-TUID: rUSXLxr/rc3p

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 152 ++---------------------------------------
 target/arm/t16.decode  |  36 ++++++++++
 2 files changed, 43 insertions(+), 145 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 90d608a2d2..7c5769bd42 100644
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
@@ -7531,6 +7524,11 @@ static int t32_branch24(DisasContext *s, int x)
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
@@ -10742,145 +10740,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 
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

