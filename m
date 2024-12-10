Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3443645njb;
        Tue, 10 Dec 2024 08:26:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcKjnqZGHy58nsYeizyi3ZHvHiwWuK/rrB3+ImcdnfmHpWa9QThVhw6Gsc82bk8ilX2B1Y64+drXz/8g==@linaro.org
X-Google-Smtp-Source: AGHT+IGeWedgpc4BqCUJvJ8HcuoEA9OxwYjvW1f6ZNkfQYEE1Gf2yz07Q0nKt1e9jk/uLyVyyAf+
X-Received: by 2002:a05:6102:cca:b0:4af:4902:153e with SMTP id ada2fe7eead31-4b11610558dmr6197992137.9.1733848003539;
        Tue, 10 Dec 2024 08:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733848003; cv=none;
        d=google.com; s=arc-20240605;
        b=j7cgYqcHgXKPRJpxeSesEzELfZrkiapEWXp7G1HfkxKpooWqRbTolNnJelsDrYUUyn
         HQc9YqLcJQmJR6aNKYupcHd9tk5osFeO5gJcBh9XlhdbrwON2tkhiokwPOHH3S+WMBc+
         x3e0fmtHC7W2GH2EkuUuRy7x/nSKsIoeHtTPSJgbXexYwjYyExyxSYzJDdMto+N0+KZH
         G8LZtKQBwqr4syiGAuRjF0YNfRLjrzJ/rOTwCU14Mm+S8zipqD0q88B5cOIk58Ndea0i
         neaZk19ohe1D0jkVVPudWd2ydvWEbZbSldTBrvMfFn1HtEb3EALbk+Fc1Z3qqU47IwAg
         9hJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SjNCXqWLXBfOyQBfYtoOK+ENmcPrhXIDdj2qnDqUAHQ=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=jKJ+xEpsjHAnt/6a9x1oRmdOCf9esC+q7ilq9gFU5n8dIklR3F75IhMIUYkdk9qIKA
         s4iOYubT+25KEoZapImJNN7Y5C0mYWTSVs7Z3evnX1RZnb4nE8BN7DP662NuAAYfuOyz
         9A0LF2OkF1IXCbs/ocGQv8wDEDFYTyke/Fz7kkarn6ZfQXqxP7OLBOPJnsgVOSy9203R
         xyrnfJamwiSq4kLB3eF487lNtV/ObDdaK4s+qE/uWpp2aw817MiZNw/C5WY2thNX4YfP
         eLgk6+at2D0ZTSc8Y3YeCs4s6lK849VdBMIJHdOLHxR2EKgARxiWMzwgs2s6/LYfEZMD
         K7Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rfwv6EP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4affb87b837si1319119137.418.2024.12.10.08.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rfwv6EP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL32m-0000bs-Fl; Tue, 10 Dec 2024 11:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32T-0007uu-E1
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:48 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32Q-0007ZP-Bx
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:45 -0500
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-540215984f0so2050888e87.1
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847880; x=1734452680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjNCXqWLXBfOyQBfYtoOK+ENmcPrhXIDdj2qnDqUAHQ=;
 b=rfwv6EP7u02Undpu5ZIIsq8Nflri1YUslmRBk/fYeXp3G6vBV+R5xIhgZUwXT0OFhE
 XaYNSOUZYNGk3JpoPYHWXitGEB1285WqpFtPkp3keORnJViU5AcQx7PhxpOK27Rc4wy6
 T5XUV43kzVW8NGra8hM4ZQc28mf+swhqXTdAzormYn2LRnWswizaP7NsyHu0qaelDZby
 HPYGGpt8VB8wuNLIkiVN4q7LPStPwLXO67W56PgCuSAwgE0wiRtW5zj4QH8pnKzy6UTW
 DEAJPMPdFvvyOyLBNU03FhL/g2rOynNIoXOyJHZLLaoBnNneQMJ8xuuAGd3wpT2hIoTU
 ihTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847880; x=1734452680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjNCXqWLXBfOyQBfYtoOK+ENmcPrhXIDdj2qnDqUAHQ=;
 b=qHFTLA10fHjvRgNp1DfJpMjPQx8VRsBs3mnO6M3CCAUOLjrblJsf4BInXQmBwZF19U
 GO+stYHoNaCx7s/koJDXBzIACSP/RBmWN/KL4kwc+jnZ0gILJ8K1vaXAb3Vto7cRHH7H
 2S8SrCN1kOVuYOzbRs1XA6mMWwrh5XtqN9GtodBZEPfiqdxpsN07OkNbsfTohCIgKqKX
 6o9QSQKax4gxKoveZ/8JbJMdv3xxzzDkQbcgRedimm6rVy3z26kG7sPNkTkymqKnwgdX
 riMThGRtHOn2TqKn/N/vLnfVamD30ibNlbP2q6Vi31WQFMpZxd88dyzaQdkL5vRQdrUP
 Ex1Q==
X-Gm-Message-State: AOJu0YxNfipJU6XrThWSGgeiR67b+zEmfSw25si6ArkAKi0gjHZGWq0F
 20wPSEhF40eN9wbwOVMABsZCgclypNDAXv0g+VvTMNb8ARxvcjok54BbAUTGuXw=
X-Gm-Gg: ASbGncuT1xxU46qJUdq26X4wPxgk0KSqP+L1Vr3DuoFzXGlLqqE2xN1MBUNF3qyQ2JR
 XCleECn4q5zn+s3E3gyBe5vI8yw6T64EiUylepcV0aJhSOCs8t7Tk/s68TZlqZB4+5I63+1kCqN
 bD1ISaLAI/VO6N1/IPIg4x6/BJ6ju9TxyBeBaTDB2uiD7eUjFj9NCr7BdeUqqOQIKMGb1c5molD
 gNEPW8RndUBIhwhtLE1SI9b0cwFSfYMOAuGTZt3z71ln1OV+C4+GxfqqZ8=
X-Received: by 2002:a05:6512:3d11:b0:53e:3a01:cf4d with SMTP id
 2adb3069b0e04-540240d1138mr1928041e87.31.1733847880500; 
 Tue, 10 Dec 2024 08:24:40 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:24:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 59/69] target/arm: Convert [US]CVTF (vector,
 integer) scalar to decodetree
Date: Tue, 10 Dec 2024 10:17:23 -0600
Message-ID: <20241210161733.1830573-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
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
X-TUID: nF/5eYe4qN8N

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 35 ++++++++++++++++++++++++----------
 target/arm/tcg/a64.decode      |  6 ++++++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 894befef4d..6e9d040ebf 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8599,6 +8599,29 @@ static bool do_cvtf_g(DisasContext *s, arg_fcvt *a, bool is_signed)
 TRANS(SCVTF_g, do_cvtf_g, a, true)
 TRANS(UCVTF_g, do_cvtf_g, a, false)
 
+/*
+ * [US]CVTF (vector), scalar version.
+ * Which sounds weird, but really just means input from fp register
+ * instead of input from general register.  Input and output element
+ * size are always equal.
+ */
+static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, bool is_signed)
+{
+    TCGv_i64 tcg_int;
+    int check = fp_access_check_scalar_hsd(s, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    tcg_int = tcg_temp_new_i64();
+    read_vec_element(s, tcg_int, a->rn, 0, a->esz | (is_signed ? MO_SIGN : 0));
+    return do_cvtf_scalar(s, a->esz, a->rd, a->shift, tcg_int, is_signed);
+}
+
+TRANS(SCVTF_f, do_cvtf_f, a, true)
+TRANS(UCVTF_f, do_cvtf_f, a, false)
+
 static void do_fcvt_scalar(DisasContext *s, MemOp out, MemOp esz,
                            TCGv_i64 tcg_out, int shift, int rn,
                            ARMFPRounding rmode)
@@ -9838,16 +9861,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x6d: /* FCMLE (zero) */
             handle_2misc_fcmp_zero(s, opcode, true, u, true, size, rn, rd);
             return;
-        case 0x1d: /* SCVTF */
-        case 0x5d: /* UCVTF */
-        {
-            bool is_signed = (opcode == 0x1d);
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_simd_intfp_conv(s, rd, rn, 1, is_signed, 0, size);
-            return;
-        }
         case 0x3d: /* FRECPE */
         case 0x3f: /* FRECPX */
         case 0x7d: /* FRSQRTE */
@@ -9867,6 +9880,8 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x1c: /* FCVTAS */
         case 0x5c: /* FCVTAU */
         case 0x56: /* FCVTXN, FCVTXN2 */
+        case 0x1d: /* SCVTF */
+        case 0x5d: /* UCVTF */
         default:
             unallocated_encoding(s);
             return;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f66f62da4f..146500d9c4 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1657,6 +1657,12 @@ FCVTXN_s        0111 1110 011 00001 01101 0 ..... .....     @rr_s
 @icvt_sd        . ....... .. ...... ...... rn:5 rd:5 \
                 &fcvt sf=0 esz=%esz_sd shift=0
 
+SCVTF_f         0101 1110 011 11001 11011 0 ..... .....     @icvt_h
+SCVTF_f         0101 1110 0.1 00001 11011 0 ..... .....     @icvt_sd
+
+UCVTF_f         0111 1110 011 11001 11011 0 ..... .....     @icvt_h
+UCVTF_f         0111 1110 0.1 00001 11011 0 ..... .....     @icvt_sd
+
 FCVTNS_f        0101 1110 011 11001 10101 0 ..... .....     @icvt_h
 FCVTNS_f        0101 1110 0.1 00001 10101 0 ..... .....     @icvt_sd
 FCVTNU_f        0111 1110 011 11001 10101 0 ..... .....     @icvt_h
-- 
2.43.0

