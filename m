Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1326207lfb;
        Tue, 12 May 2020 09:51:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypKCJK1fy+Fpjl+zrIC3apZQ9Oo8+lgS+rQWbmUiOePq8sN3JEc5k10eAO9jum0avmcXr4RW
X-Received: by 2002:ac8:74ce:: with SMTP id j14mr14123872qtr.90.1589302270262;
        Tue, 12 May 2020 09:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589302270; cv=none;
        d=google.com; s=arc-20160816;
        b=0c0QKDg1HnD2PyB1k9yE2vGgpLQoayZpPIqjS/yMG6aH90yvX6KqHITd1Apw66Psyn
         qMkfvsl/3fW2LHR4vPbIH6QsmQtrdObeN0MZzliZpO2D1SOgXm12ASf7n1CMZcPd0HKu
         3TatMRKHIso1FDE9bBenVpfu+9USKi0d3wm1wMR7bHlhjn0yZLf/GN7eo5kKfrpMn9C8
         tvxEY++o3SKGYC6A3Mq7ZH24+LS+z0c3ZVjCIvjfMg7OLgNNnnnF+HAU6iwKJmCcnKjq
         X0ND2JmzyYP4WwIAwgsXqWjLkhwGLibFlKlcnqK2ZfcaC7T0/VUmiDsNO2GC3Ua1mHCH
         PBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pvqJd3qWY/MPKRY/jCCulOuFIxuFeVoByyFCNf9EIS0=;
        b=OWGZnMrdooSzuObq4yYQlYQ+JHVPEKyIDyjiB2IMzZoWAGAYraEztuUbwUNvSLQ3EY
         LFZ2qaEmdz5B4F5xQ/2dbP1RxAYgZCTcnnOEgyOYEkcFCrIV4ZwNFZdZhQWst8He6xv7
         +BOwCwh8bvn9Rkvpjyu1WNoMx4LGk9cj+sxCuhPIj4MDDcnpKOQHCIhwvU1Cqauo3BHK
         W5WwfXeW0nYeAdnqP7AD8YKeX9HlO2vW1vpjgFUqeo07mJseNfsojZjeBVzasYUvd/Mf
         FyfO7aXFMMjHa7Kg9hw0Awqd23qoRMQH3GaqPEehjN0cl9IDT2Tc5ckq5e1iJVyp0UQu
         g4vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JBdbHZ9Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si7652115qkm.267.2020.05.12.09.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JBdbHZ9Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYY7Z-0004gB-DJ
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwH-0006pP-1z
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:29 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwG-0006Ir-2B
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id h4so22558309wmb.4
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pvqJd3qWY/MPKRY/jCCulOuFIxuFeVoByyFCNf9EIS0=;
 b=JBdbHZ9Q3w5xev6NvMd+xn8UT0jnee4oQGeS5PKrl/rD+uuyB29gVF+UXpZmy+zRdc
 uFiGbi9t4C1rcjnT/kFY9Gi5LJS+EBOJC5s3z9dNVsR3GqPed44dVznnrs8iGgUCJs3J
 eAyinRREmRpHMm0RF43kbIQveREuehUNn6KPNdjw79pXONzC1zfR6enumrwuUYWrk8VU
 ind8oQrVL3vkRozf0bT95eWP+Yq/gsn66Uv/51YLsMqv9HnBar6omGIAyjmt8ZyMFUFf
 CikAauboWeFrC/xDgnWucVOd0Vk/ZkxPgoJJn1dUdGp2RTEFnCx6YG0Td1dJ43ro1szk
 WeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pvqJd3qWY/MPKRY/jCCulOuFIxuFeVoByyFCNf9EIS0=;
 b=RRTRJIu2a3fMgNa9oD01jSe8LrD+PLCh3qgADlscApSHSLK69JPRzUHZ4Zcplog3Ad
 b8JZil9plZgVKPhLrRhXlpA5fSs4dCsqla7LVY86fTrP5vgeQXxrvKFPesaSCbXcOHpr
 3I+MHv+nhEYVDAhd9WSx8KWRhoJOpupNI2nBkjqIsIW+yRQCPbtNd1CWapJjcyTZITba
 7a17NmmItx9/Iwj8niYHQ37Dl+Ac0IQ4uKDn/3ULHxSEyRzcwIFXJgmXloVwzux1iecx
 fA4qu8CJsp9NXOOpU/UpoWOT0294AJrdiITTC4kNjMPa76E/U1gmk5D2N0TyiTPkoLSa
 Q9Lw==
X-Gm-Message-State: AGi0PuafeB47NonicU6L26JRz0Oh2djDvEIx9GMeOucHoZbNszwCdrDb
 fX02sbqGAuuYA3V4Ah4Eqi/cQ+/X86QBbw==
X-Received: by 2002:a1c:7f91:: with SMTP id
 a139mr36404611wmd.164.1589301566336; 
 Tue, 12 May 2020 09:39:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/17] target/arm: Convert Neon 3-reg-same compare insns to
 decodetree
Date: Tue, 12 May 2020 17:39:01 +0100
Message-Id: <20200512163904.10918-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: InML3b7JSlnM

Convert the Neon integer 3-reg-same compare insns VCGE, VCGT,
VCEQ, VACGE and VACGT to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-dp.decode       |  5 +++++
 target/arm/translate-neon.inc.c |  6 +++++
 target/arm/translate.c          | 39 ++-------------------------------
 3 files changed, 13 insertions(+), 37 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 0f74b31dcd1..bc5a3e0295c 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -184,5 +184,10 @@ VABD_fp_3s       1111 001 1 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
 VMLA_fp_3s       1111 001 0 0 . 0 . .... .... 1101 ... 1 .... @3same_fp
 VMLS_fp_3s       1111 001 0 0 . 1 . .... .... 1101 ... 1 .... @3same_fp
 VMUL_fp_3s       1111 001 1 0 . 0 . .... .... 1101 ... 1 .... @3same_fp
+VCEQ_fp_3s       1111 001 0 0 . 0 . .... .... 1110 ... 0 .... @3same_fp
+VCGE_fp_3s       1111 001 1 0 . 0 . .... .... 1110 ... 0 .... @3same_fp
+VACGE_fp_3s      1111 001 1 0 . 0 . .... .... 1110 ... 1 .... @3same_fp
+VCGT_fp_3s       1111 001 1 0 . 1 . .... .... 1110 ... 0 .... @3same_fp
+VACGT_fp_3s      1111 001 1 0 . 1 . .... .... 1110 ... 1 .... @3same_fp
 VPMAX_fp_3s      1111 001 1 0 . 0 . .... .... 1111 ... 0 .... @3same_fp_q0
 VPMIN_fp_3s      1111 001 1 0 . 1 . .... .... 1111 ... 0 .... @3same_fp_q0
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 18896598bb4..eeea71e3bec 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1114,6 +1114,12 @@ DO_3S_FP_GVEC(VMUL, gen_helper_gvec_fmul_s)
         return do_3same_fp(s, a, FUNC, READS_VD);                   \
     }
 
+DO_3S_FP(VCEQ, gen_helper_neon_ceq_f32, false)
+DO_3S_FP(VCGE, gen_helper_neon_cge_f32, false)
+DO_3S_FP(VCGT, gen_helper_neon_cgt_f32, false)
+DO_3S_FP(VACGE, gen_helper_neon_acge_f32, false)
+DO_3S_FP(VACGT, gen_helper_neon_acgt_f32, false)
+
 static void gen_VMLA_fp_3s(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm,
                             TCGv_ptr fpstatus)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 06b6925d31e..b9fcbbcbcb5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5434,6 +5434,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VQDMULH_VQRDMULH:
         case NEON_3R_FLOAT_ARITH:
         case NEON_3R_FLOAT_MULTIPLY:
+        case NEON_3R_FLOAT_CMP:
+        case NEON_3R_FLOAT_ACMP:
             /* Already handled by decodetree */
             return 1;
         }
@@ -5448,17 +5450,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 return 1; /* VPMIN/VPMAX handled by decodetree */
             }
             break;
-        case NEON_3R_FLOAT_CMP:
-            if (!u && size) {
-                /* no encoding for U=0 C=1x */
-                return 1;
-            }
-            break;
-        case NEON_3R_FLOAT_ACMP:
-            if (!u) {
-                return 1;
-            }
-            break;
         case NEON_3R_FLOAT_MISC:
             /* VMAXNM/VMINNM in ARMv8 */
             if (u && !arm_dc_feature(s, ARM_FEATURE_V8)) {
@@ -5480,32 +5471,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         tmp = neon_load_reg(rn, pass);
         tmp2 = neon_load_reg(rm, pass);
         switch (op) {
-        case NEON_3R_FLOAT_CMP:
-        {
-            TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-            if (!u) {
-                gen_helper_neon_ceq_f32(tmp, tmp, tmp2, fpstatus);
-            } else {
-                if (size == 0) {
-                    gen_helper_neon_cge_f32(tmp, tmp, tmp2, fpstatus);
-                } else {
-                    gen_helper_neon_cgt_f32(tmp, tmp, tmp2, fpstatus);
-                }
-            }
-            tcg_temp_free_ptr(fpstatus);
-            break;
-        }
-        case NEON_3R_FLOAT_ACMP:
-        {
-            TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-            if (size == 0) {
-                gen_helper_neon_acge_f32(tmp, tmp, tmp2, fpstatus);
-            } else {
-                gen_helper_neon_acgt_f32(tmp, tmp, tmp2, fpstatus);
-            }
-            tcg_temp_free_ptr(fpstatus);
-            break;
-        }
         case NEON_3R_FLOAT_MINMAX:
         {
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-- 
2.20.1

