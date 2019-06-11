Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4215197wrg;
        Tue, 11 Jun 2019 04:11:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxejXlN9YA+b3e17ovqs/ouqY5/ROnGtR+0x4SsvXN4H2GsOMV5kYSf+AdJP7e4DxEUpuna
X-Received: by 2002:a0c:92ab:: with SMTP id b40mr41662628qvb.129.1560251486417;
        Tue, 11 Jun 2019 04:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560251486; cv=none;
        d=google.com; s=arc-20160816;
        b=snaZ4l0UxzHWJJUvvAwYQAhzPc/yy5kdapTHv7QwRf7Y2DIP+PaXv/CJOjnTu1ZsuS
         uN9HcAnwvXhM8YKTPkEf9cMTtz14K0kvAIkZ5W9FtEczwnfuowWia0Mpikb8NHv/mQRf
         SfDgKlAuB/ePyZ0iWmuJ/Fx7Y2NzVvOdkTsWuUyIJpUXPqVW47DcjiGvBnlpBNw6LVTk
         rAHlFkaLJ9vWwbORli6GoEOGH3YuCjtRAa60r7S0qh+ZKs3hFeE85ziqKGqjqOOEazA3
         ePqM1PV2q4qS1wSZp2qaMelxrJTpIy6qHSAG1XOtcnWE25wE4PS5n0FbjWvUBdcLhlSm
         VbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=n3MASxtEnCokj3COittArwSNYGq/3JuuvGmF9r8yZL4=;
        b=vMgFVU1HdtOoGqCAZC+ZKfZ2CjOrgTf66PEMBV+G4FVSBlSKsjiNs6ozN/qQKPNpYq
         +7ZUMMb+hsxvYn5nb3N81f67JcJhCK4lWKT/S6vU3Tjojk1abeIFBrmWjlPka2GK8QW5
         +AyzTdoH5EswRdI71hUNkIXPuzOK/BwRSLEZtoPQ+MXa1udhgKHqJEwW1xCa2Kl+6Ry2
         adhnq8D7Mbe0hu8q6cqhXDMVldtf0KvpciZ/4K2u6N0R+jxmWn+vTmpv8gF4lZE28uph
         B/iDrtXj9wfvzq8UbPRs/gaw16MWSXR+Ux8JVmKdLs1LNqVp1J7seecEdQdfkeckIMqC
         oVEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MCaF04hc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si2711573qkf.99.2019.06.11.04.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MCaF04hc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haegX-0006Vp-Uq
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39327)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQ3-0007Mn-Mt
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePy-0007Xf-0Z
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:23 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePx-0007Vy-LC
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:17 -0400
Received: by mail-wm1-x344.google.com with SMTP id c6so2404514wml.0
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n3MASxtEnCokj3COittArwSNYGq/3JuuvGmF9r8yZL4=;
 b=MCaF04hcvXMGxWhChHTbxUZ9Wo/z5+TCTzJFIiD2+xbdVG3SZNf5v6Xyqlgwxx4y6E
 hMF4sfVKW9vXb8LlNkNgz1evoj9o4SzS93+IhNVI2CqOA15G1HrqRghNl0QJQ+CJOcB6
 +IpyQupcx2r0uHzw4m9QK2wANVpR3WgeMNWYQONfqDhuAWgUhxgpP+weAP+tTqCtTF1L
 Nxy5ypQVbrRAa4q8meD5Tm/yR9iAVhkJnGAV+FTYPTevRRHFiUBcZQXQF61Oz3nAYvZN
 zbsJPi18ScPR3qhdyXmqKx+BWGdPgw4NoQSP4fuRWGExi3R2NXhqQdovkxpIugFrybA0
 Q/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n3MASxtEnCokj3COittArwSNYGq/3JuuvGmF9r8yZL4=;
 b=H8YspeCD0EpASLVk0DJPtYACEEOji6Jju/1ibZJM7XlF/T/kFcY6Uczj09or/V8dRc
 Ku/bnfu6SmlWa/Nva6fGbyGBV5Vys6glW6t7o/LuMUtrDWHmO1fZptAIczeB0J+XGqMG
 78OCBpVKpXPs5gWFlLzuLO7Ichpn+EqH3eqq2bqtova3lYhl2migTZjBIEEByMgkvf6h
 mBtK3UPyVTNtZz6mjdihnUEdBlxEo1ZPojazyVTO01m/XWYaPfKwzfHUvOsF+1QNEz77
 XCJncnI783ieNgkc5QEq3hlcUoNAsbGPNgpr2TJI0H0XYAVoxeIsrJEzBk0b4kPGhcn/
 DXIA==
X-Gm-Message-State: APjAAAXqa08Zg8vLri9ZAydItAZz8nRjmn+d1X7ECM7sf5X6HH0lJC7A
 pWrvaTw5ohifeHqHC/v+RjU8a3Nz7VMCeQ==
X-Received: by 2002:a05:600c:2383:: with SMTP id
 m3mr15719919wma.20.1560250455854; 
 Tue, 11 Jun 2019 03:54:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:29 +0100
Message-Id: <20190611105351.9871-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH v2 20/42] target/arm: Convert VFP VNMLS to
 decodetree
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
X-TUID: 55JudPZC1HwH

Convert the VFP VNMLS instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 42 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 24 +------------------
 target/arm/vfp.decode          |  5 ++++
 3 files changed, 48 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 00f64401dda..1d7100debe4 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1341,3 +1341,45 @@ static bool trans_VMLS_dp(DisasContext *s, arg_VMLS_sp *a)
 {
     return do_vfp_3op_dp(s, gen_VMLS_dp, a->vd, a->vn, a->vm, true);
 }
+
+static void gen_VNMLS_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /*
+     * VNMLS: -fd + (fn * fm)
+     * Note that it isn't valid to replace (-A + B) with (B - A) or similar
+     * plausible looking simplifications because this will give wrong results
+     * for NaNs.
+     */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_muls(tmp, vn, vm, fpst);
+    gen_helper_vfp_negs(vd, vd);
+    gen_helper_vfp_adds(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VNMLS_sp(DisasContext *s, arg_VNMLS_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VNMLS_sp, a->vd, a->vn, a->vm, true);
+}
+
+static void gen_VNMLS_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /*
+     * VNMLS: -fd + (fn * fm)
+     * Note that it isn't valid to replace (-A + B) with (B - A) or similar
+     * plausible looking simplifications because this will give wrong results
+     * for NaNs.
+     */
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    gen_helper_vfp_muld(tmp, vn, vm, fpst);
+    gen_helper_vfp_negd(vd, vd);
+    gen_helper_vfp_addd(vd, vd, tmp, fpst);
+    tcg_temp_free_i64(tmp);
+}
+
+static bool trans_VNMLS_dp(DisasContext *s, arg_VNMLS_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VNMLS_dp, a->vd, a->vn, a->vm, true);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bddc0d20447..b3d0648bb50 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1393,18 +1393,6 @@ VFP_OP2(div)
 
 #undef VFP_OP2
 
-static inline void gen_vfp_F1_mul(int dp)
-{
-    /* Like gen_vfp_mul() but put result in F1 */
-    TCGv_ptr fpst = get_fpstatus_ptr(0);
-    if (dp) {
-        gen_helper_vfp_muld(cpu_F1d, cpu_F0d, cpu_F1d, fpst);
-    } else {
-        gen_helper_vfp_muls(cpu_F1s, cpu_F0s, cpu_F1s, fpst);
-    }
-    tcg_temp_free_ptr(fpst);
-}
-
 static inline void gen_vfp_F1_neg(int dp)
 {
     /* Like gen_vfp_neg() but put result in F1 */
@@ -3134,7 +3122,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 1:
+            case 0 ... 2:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3320,16 +3308,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 2: /* VNMLS: -fd + (fn * fm) */
-                    /* Note that it isn't valid to replace (-A + B) with (B - A)
-                     * or similar plausible looking simplifications
-                     * because this will give wrong results for NaNs.
-                     */
-                    gen_vfp_F1_mul(dp);
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_neg(dp);
-                    gen_vfp_add(dp);
-                    break;
                 case 3: /* VNMLA: -fd + -(fn * fm) */
                     gen_vfp_mul(dp);
                     gen_vfp_F1_neg(dp);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 7bcf2260eec..08e4f427408 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -107,3 +107,8 @@ VMLS_sp      ---- 1110 0.00 .... .... 1010 .1.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VMLS_dp      ---- 1110 0.00 .... .... 1011 .1.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VNMLS_sp     ---- 1110 0.01 .... .... 1010 .0.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VNMLS_dp     ---- 1110 0.01 .... .... 1011 .0.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

