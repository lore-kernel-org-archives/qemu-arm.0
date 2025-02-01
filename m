Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143978njb;
        Sat, 1 Feb 2025 08:45:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUIiI/DMFjnv0jyPqaMLvt1dBKV0ptIOEFa+kTQUhNqT/snpXNm2eQA+TK0m5a025CfmTZMAjdx686CDw==@linaro.org
X-Google-Smtp-Source: AGHT+IH48Spx7F8qoIarQ0NrCnGjyKKa4c0zT4mQomqESoMZsZ5xuCLvJFzEvMWAGewuEHAGKLqp
X-Received: by 2002:a05:620a:d8d:b0:7be:3d06:9a02 with SMTP id af79cd13be357-7bffcd12612mr1918809285a.28.1738428315102;
        Sat, 01 Feb 2025 08:45:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428315; cv=none;
        d=google.com; s=arc-20240605;
        b=LbcxQ16Lofz8p/+18kN8yWT6A2IkiuywS0tBqa60aUGdzW1qiSVKQ0y5XQznF1UHSm
         ILutHqE4tSA/C78xBqv6nsDzI4e+VYkYQE3Qa8Z15jkYSjxDHwWpMOLVg8IGtXr/NARz
         drtPscz+vDIHft7jPbqZb0b8w5Hs2e4QZEjg5WRy9d5W0WBdqbse7htflNSGu8/JTpLG
         UaXiQQUMcIp6Myp0PaXf925sGBYHHk2dJlvUziWEBntGYwVNfUQcthKpPLgXpI0BRX83
         fw6lcAEgOLqt7IFfoC1FYP6ohev1t3u2EMyRTftvQJMIHKs7NCrXGEnI7pk2BEqd4Q73
         bjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QOw8scFPjKUk+oXyJ2xWsNA86wdi8W/z0T/XnJFQXpg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=eQwHpvBtbQDCmYffu65nuQuM3oXQYKpOKRWEXPaI0UL8z/GTSg7jBezNolc4vL2ua3
         uo5X1e44ZQYOtwr2b5DAf5lmrnjPnNc5raMYNOv1u/6FxSOtlTjhtrFrY7eZhwByUvd0
         U1cEGDsXW9WqaMAWL2c+Dk3nIP1S6zythiIEDOm+RlXZArxU0EzmkrBUAitsSrtS8MLc
         c/yFyZAgz1ag7tnLz1/jIqOQPbJn0ayFB3mK3p4y4RIFXpYaxTYSCMg5Xpfx1xDEBMt7
         9vU2lgoOz9DRQwzemAaNOkU0IebK38iu7dOoWWe0fPX5yDQMRkJpCchRZZBEiTOMEprz
         YVYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whg65OAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a90d3ffsi624364885a.453.2025.02.01.08.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:45:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whg65OAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYJ-0006Y0-Or; Sat, 01 Feb 2025 11:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYH-0006Tq-Ew
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:01 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYF-0001Cf-HH
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:01 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso20562485e9.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428058; x=1739032858; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QOw8scFPjKUk+oXyJ2xWsNA86wdi8W/z0T/XnJFQXpg=;
 b=whg65OAteAuo7b9/0EJT2T0VVCtvjmNUhrv1KaMeDaOPSCMEyIFBhFp+F6eGsRHDgT
 nqE+nuuLJQ8mCTo64CzkGMDBWkuACeoEK4qYkQ2jclKlgrmgb3olqq0+NJy8oTr+huQU
 6uJrmjmoxam2PkKcYV9crYFSgVB71WsFUpUPxNDGqWttM5MXSQ2cv+Jn4RvaJ/+NlUdk
 oWQMNHBM66zGD/JcckkyUq3FUX1v2LMlzK2ygxdt0pdHAYUVWYKS0SjfWvAwZTJweaVi
 HZcQqTWo5b/Dsieh/sohivZwTG/L513A2PGKqfAv6WdzKMWw/VXW2ABum3IhXe+5lzFT
 hDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428058; x=1739032858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QOw8scFPjKUk+oXyJ2xWsNA86wdi8W/z0T/XnJFQXpg=;
 b=X80OwXjfkf5QfZJewbMpef5TSIpqWuzdMwSrIQP1gtEXCVlBu/C5M9wUAakcoc5Ihz
 1SbunbeJRoGD/6HrSq2/Z8n+JGzjpfIZIt6OnhUxYSaY6cL6MWBoKGAIPu3biSZZgdHI
 4q6cGinyAOk5hYI7UhL1zTPfn+Af5H4qkKYOmI52As1/L00nduF1tNBxsdO8a2TNPiVy
 l2+FTlnW/mOcxCiLeiuGdUcXWGEYBK5Vs+81v+nTOFOxoJQGi0zJzUEj/Mvod0kuxnyX
 54qZXa3ajbjH0IcQnmElMjPy61gZb4DC6xYCFfnL2G3OxlkLXQFr2bWmhdMW8Ze5q08D
 RTUA==
X-Gm-Message-State: AOJu0Yy3hBFjgtfyCOFsaQpkOvOzsEs3MEMCS9gY8KjbJoGfgffqshNP
 Wewr8B0JYeWgP2tIvfPh3NQh5xE28C0XXj/FFYMr1iyacKvAEviIKSCfvrrA814AgPRbBkGb6DV
 1
X-Gm-Gg: ASbGncufS5+4CX4WUTVbbZx0DfpAq5AXA8dBZwogAERWBtcAIhYi/3mc86V0/UBx17z
 klpq/a1bzNYlEQOJ980eDV+jjTjPa3Pmp+2Fw6es1sY2k9UVzy6ZZyhkGMLqiXb7MGsrCoflsWo
 80wF9CL0V50SLeb65nB/HHObWZXSH4l25g03XIjFLNV4btu+an5JNy6v4yacDAW9Xq8lixTcJRT
 edDVuz2OWswKuixtSlxxmunnl5jXc2fB4+Nku57O1xxCA7o2MSylSgBFEY/oUK+CHTtl9ui+91y
 B0k8haL8/V94F40hiVxx
X-Received: by 2002:adf:f5cd:0:b0:386:32cb:4aa with SMTP id
 ffacd0b85a97d-38c520bd981mr11323347f8f.45.1738428058072; 
 Sat, 01 Feb 2025 08:40:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 32/69] target/arm: Implement FPCR.AH handling for scalar
 FABS and FABD
Date: Sat,  1 Feb 2025 16:39:35 +0000
Message-Id: <20250201164012.1660228-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IYoy354zAstl

FPCR.AH == 1 mandates that taking the absolute value of a NaN should
not change its sign bit.  This means we can no longer use
gen_vfp_abs*() everywhere but must instead generate slightly more
complex code when FPCR.AH is set.

Implement these semantics for scalar FABS and FABD.  This change also
affects all other instructions whose psuedocode calls FPAbs(); we
will extend the change to those instructions in following commits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 69 +++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index aee2e1307e4..862f7333982 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -880,6 +880,43 @@ static void gen_vfp_ah_negd(TCGv_i64 d, TCGv_i64 s)
                         s, chs_s);
 }
 
+/*
+ * These functions implement
+ *  d = floatN_is_any_nan(s) ? s : floatN_abs(s)
+ * which for float32 is
+ *  d = (s & ~(1 << 31)) > 0x7f800000UL) ? s : (s & ~(1 << 31))
+ * and similarly for the other float sizes.
+ */
+static void gen_vfp_ah_absh(TCGv_i32 d, TCGv_i32 s)
+{
+    TCGv_i32 abs_s = tcg_temp_new_i32();
+
+    gen_vfp_absh(abs_s, s);
+    tcg_gen_movcond_i32(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i32(0x7c00),
+                        s, abs_s);
+}
+
+static void gen_vfp_ah_abss(TCGv_i32 d, TCGv_i32 s)
+{
+    TCGv_i32 abs_s = tcg_temp_new_i32();
+
+    gen_vfp_abss(abs_s, s);
+    tcg_gen_movcond_i32(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i32(0x7f800000UL),
+                        s, abs_s);
+}
+
+static void gen_vfp_ah_absd(TCGv_i64 d, TCGv_i64 s)
+{
+    TCGv_i64 abs_s = tcg_temp_new_i64();
+
+    gen_vfp_absd(abs_s, s);
+    tcg_gen_movcond_i64(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i64(0x7ff0000000000000ULL),
+                        s, abs_s);
+}
+
 static void gen_vfp_maybe_ah_negh(DisasContext *dc, TCGv_i32 d, TCGv_i32 s)
 {
     if (dc->fpcr_ah) {
@@ -5403,12 +5440,35 @@ static void gen_fabd_d(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_ptr s)
     gen_vfp_absd(d, d);
 }
 
+static void gen_fabd_ah_h(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
+{
+    gen_helper_vfp_subh(d, n, m, s);
+    gen_vfp_ah_absh(d, d);
+}
+
+static void gen_fabd_ah_s(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
+{
+    gen_helper_vfp_subs(d, n, m, s);
+    gen_vfp_ah_abss(d, d);
+}
+
+static void gen_fabd_ah_d(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_ptr s)
+{
+    gen_helper_vfp_subd(d, n, m, s);
+    gen_vfp_ah_absd(d, d);
+}
+
 static const FPScalar f_scalar_fabd = {
     gen_fabd_h,
     gen_fabd_s,
     gen_fabd_d,
 };
-TRANS(FABD_s, do_fp3_scalar, a, &f_scalar_fabd, a->rn)
+static const FPScalar f_scalar_ah_fabd = {
+    gen_fabd_ah_h,
+    gen_fabd_ah_s,
+    gen_fabd_ah_d,
+};
+TRANS(FABD_s, do_fp3_scalar_2fn, a, &f_scalar_fabd, &f_scalar_ah_fabd, a->rn)
 
 static const FPScalar f_scalar_frecps = {
     gen_helper_recpsf_f16,
@@ -8654,7 +8714,12 @@ static const FPScalar1Int f_scalar_fabs = {
     gen_vfp_abss,
     gen_vfp_absd,
 };
-TRANS(FABS_s, do_fp1_scalar_int, a, &f_scalar_fabs, true)
+static const FPScalar1Int f_scalar_ah_fabs = {
+    gen_vfp_ah_absh,
+    gen_vfp_ah_abss,
+    gen_vfp_ah_absd,
+};
+TRANS(FABS_s, do_fp1_scalar_int_2fn, a, &f_scalar_fabs, &f_scalar_ah_fabs)
 
 static const FPScalar1Int f_scalar_fneg = {
     gen_vfp_negh,
-- 
2.34.1

