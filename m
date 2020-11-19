Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp756154lfb;
        Thu, 19 Nov 2020 14:06:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwH5gksqo9jg2+H/8dGRNC+wWBa0kJjsS7wGPqw9KdX3P7ke5PyfhsjDujgQLMtf/FwF9hS
X-Received: by 2002:a25:6ec3:: with SMTP id j186mr16929158ybc.165.1605823560650;
        Thu, 19 Nov 2020 14:06:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823560; cv=none;
        d=google.com; s=arc-20160816;
        b=TrBGCqql+C9N9ezwdEHEjoHT55WPw+DSew6tkSOoAx73uxUFvmRf2IYriqLuApeilf
         H1ViO+FFauJz8Im3bu7VedCIenZeOVgRua+LVs/5SvteAFU5VpPLWhGwRKN6gyuzEKjB
         Zh+bnKzd13kseHwtekucgh4NuIHvGdIZ/0D9uRefw5wk9zvXxjNnxq1TpmkzgesYzSsn
         F3p0l1zDLQTOZ5xcb9oa79v6kbBFLQl41Q8xm2KjmNiEE8QFCePB28MWTQY7JLmnvJYd
         zXuCcbnDydcWeNb+who6kalRCo37hPrlaEMrxMBku7jFGKCl69rIbiHkWRTw1fNqVWNw
         0iDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Bs7VQGF+Epl5dZ+q3vps3mLgkN/vGMivqNsTt71dwm8=;
        b=JWUNeZDgFVkFEoOCZjiyTIMvvQwIXeL5xnPcFdNCx1E+TXkLfeu2SykatqHkugMCpK
         Dc+LRqDZ65CAxOHQfyyZ2MeIMiKxf9NOr/teA0nlRhZFs4ABLTBJPxoCgNBd31+dizzZ
         KdSbyo6LMegTPTrRWhEmXzBXHWsKmPBlAB07B5r79rRKO3WCG1rChCL96om5uOTli9yo
         f/0NwtKuTE/oeWhOYLyFbj3ME1kZfEDBkbE8NoOVuiMfhoQtdqmUlTdcEymeBmszgYzV
         rqnS0dX4DrF0JJsREZNo6bF3Tmm97v/beHoRKNgV5YvkmTM6KOraOk+nQjwiaArwkJKf
         F5sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oA7gVbTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t73si748731ybi.320.2020.11.19.14.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:06:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oA7gVbTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs40-0003Xy-05
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv5-0000ma-8D
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:47 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrut-0004BK-2U
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:46 -0500
Received: by mail-wm1-x335.google.com with SMTP id a186so5772201wme.1
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bs7VQGF+Epl5dZ+q3vps3mLgkN/vGMivqNsTt71dwm8=;
 b=oA7gVbTWZTt37QDLprXb/lVmoFA2pgIdX0su8AJgdOvc9u0nLh65Y8/k6BCiFKGEUR
 EEMOziIeBspfWQNpB5pG21kYk8HMMi3MRl0DnrR5NVdRnmPoxswcWXbqKf/duSWH3c0F
 1BQqypH4Er+xomJbb1N4Y4jqnYqqUePKQCOk6ha5wGNqW4Gt/4hKXQwHRUn4DRFADViV
 If5RW+QUIT25VAfIHta4qDsQh3fvQR6fltf/dl22pfBdC7T3OQTRqbaI12/b6P9lyCMj
 FDtibzMdpI0D4uvxohyRswB7OtqUOh5Ne0WpDE5MBJTolcQvBxDaw8Tn3lR5QWRNzeYC
 Lb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bs7VQGF+Epl5dZ+q3vps3mLgkN/vGMivqNsTt71dwm8=;
 b=DalbRl2QRcqq5+FTu9chuouFSLgetEEgvk1fOEiT01x8s7enZylTwmuuxuVA/V7FDR
 essMr/po0IuRWhi/JrE/NvTKfLY+2bdqbeSU4gGAT8/zdO6X4yrlHKcbbUGjN+tqnkZY
 R534TvKBxYUjylybYD5OZ5jicHwtNOFjny+USNi4TJcGEEk0Sshr80l6XUQOUnT58xuM
 gSBkhhLxU6Wkh62vIyGxSCxOZ5sWrKbAlv/Uo8UoQxh+yjonEPhom2nFputdJvggPBrU
 owWx3GwyN2Sn/liiG2gMJfn2/8fkQdrR1qfm17BMuMDTVnhKvmLZScJmQGfgAZRkGNoA
 dvEg==
X-Gm-Message-State: AOAM5338xmiYkEJu5TqA9gA+JA4A5rjZl9EckOfdl93nWxhfgFVXug79
 knt79jreeQ7YtTkvhiNnwAB/+JI2ShMq8g==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr6999755wmh.106.1605822991957; 
 Thu, 19 Nov 2020 13:56:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/28] target/arm: Implement M-profile FPSCR_nzcvqc
Date: Thu, 19 Nov 2020 21:55:59 +0000
Message-Id: <20201119215617.29887-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bm9rg3SSprQ6

v8.1M defines a new FP system register FPSCR_nzcvqc; this behaves
like the existing FPSCR, except that it reads and writes only bits
[31:27] of the FPSCR (the N, Z, C, V and QC flag bits).  (Unlike the
FPSCR, the special case for Rt=15 of writing the CPSR.NZCV is not
permitted.)

Implement the register.  Since we don't yet implement MVE, we handle
the QC bit as RES0, with todo comments for where we will need to add
support later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               | 13 +++++++++++++
 target/arm/translate-vfp.c.inc | 27 +++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ad8b80c667d..04f6220b2f7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1524,6 +1524,13 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 #define FPCR_FZ     (1 << 24)   /* Flush-to-zero enable bit */
 #define FPCR_DN     (1 << 25)   /* Default NaN enable bit */
 #define FPCR_QC     (1 << 27)   /* Cumulative saturation bit */
+#define FPCR_V      (1 << 28)   /* FP overflow flag */
+#define FPCR_C      (1 << 29)   /* FP carry flag */
+#define FPCR_Z      (1 << 30)   /* FP zero flag */
+#define FPCR_N      (1 << 31)   /* FP negative flag */
+
+#define FPCR_NZCV_MASK (FPCR_N | FPCR_Z | FPCR_C | FPCR_V)
+#define FPCR_NZCVQC_MASK (FPCR_NZCV_MASK | FPCR_QC)
 
 static inline uint32_t vfp_get_fpsr(CPUARMState *env)
 {
@@ -1568,6 +1575,12 @@ enum arm_cpu_mode {
 #define ARM_VFP_FPEXC   8
 #define ARM_VFP_FPINST  9
 #define ARM_VFP_FPINST2 10
+/* These ones are M-profile only */
+#define ARM_VFP_FPSCR_NZCVQC 2
+#define ARM_VFP_VPR 12
+#define ARM_VFP_P0 13
+#define ARM_VFP_FPCXT_NS 14
+#define ARM_VFP_FPCXT_S 15
 
 /* QEMU-internal value meaning "FPSCR, but we care only about NZCV" */
 #define QEMU_VFP_FPSCR_NZCV 0xffff
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index dc26759ab95..6c4b7db8213 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -648,6 +648,11 @@ static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
     case ARM_VFP_FPSCR:
     case QEMU_VFP_FPSCR_NZCV:
         break;
+    case ARM_VFP_FPSCR_NZCVQC:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return false;
+        }
+        break;
     default:
         return fp_sysreg_check_failed;
     }
@@ -682,6 +687,22 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_temp_free_i32(tmp);
         gen_lookup_tb(s);
         break;
+    case ARM_VFP_FPSCR_NZCVQC:
+    {
+        TCGv_i32 fpscr;
+        tmp = loadfn(s, opaque);
+        /*
+         * TODO: when we implement MVE, write the QC bit.
+         * For non-MVE, QC is RES0.
+         */
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
+        fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
+        tcg_gen_or_i32(fpscr, fpscr, tmp);
+        store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_temp_free_i32(tmp);
+        break;
+    }
     default:
         g_assert_not_reached();
     }
@@ -710,6 +731,12 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         gen_helper_vfp_get_fpscr(tmp, cpu_env);
         storefn(s, opaque, tmp);
         break;
+    case ARM_VFP_FPSCR_NZCVQC:
+        /*
+         * TODO: MVE has a QC bit, which we probably won't store
+         * in the xregs[] field. For non-MVE, where QC is RES0,
+         * we can just fall through to the FPSCR_NZCV case.
+         */
     case QEMU_VFP_FPSCR_NZCV:
         /*
          * Read just NZCV; this is a special case to avoid the
-- 
2.20.1

