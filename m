Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp942005njk;
        Fri, 24 Jan 2025 08:55:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+1HeSq45RmSP2VEcy52Se61UHfPCZttNdtvyg/8NWW+eX6RygSJ/eTBCxKfJ6pbzY1zXea0pozs+sWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHqtoTFNaTYD3PQV3OgYWg9jrIuwnNDYHMt49ShKuy7UH0lbzy07zeiIzv/5VZhFhw/DDHx
X-Received: by 2002:a05:6102:38c8:b0:4b2:ad82:133a with SMTP id ada2fe7eead31-4b690d105d7mr26137733137.25.1737737700646;
        Fri, 24 Jan 2025 08:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737700; cv=none;
        d=google.com; s=arc-20240605;
        b=gUZhcseZzZlnvy6CVdQoHlgLQ87JS+XVrstj3va98QcXl+zY/YOEnB4lOPqyRZ+0OF
         2uHBjcVbap3ad5tbKoQTYhVk6pMQjEx98BqjRcaG3MnUhbe57sket8AZWU5CDW7ft81r
         kIgO78sbrD8FxR/fI4fxRnPYNjHlG0QQXjUkE+fRoydYwA9ff0mnHtEQS8OBGNroz+Wl
         J8OijXrKryJOBDFZOSQWxMVJrnKzETHwzOCmbpEmkyCE1b5YT29T3ox/eBF6dEb7i58G
         8BCd6Uyr7/GyYfzqzRd36oQ7QoKryXtkNsljtB7qq007jm9gTmOeuuy++vS4WmQaAV5Z
         Obtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TAgJkg+zZafmqGOr1+zR48fm7oDoeLOlWLNiEgXtZlc=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=VuhL3Bs0kt5EJ1iX+AK48xCkvBoMErtBHsSYT2Mrtyf4wdaHYbjoEX/KhIJvDL4fjF
         nOHVg+s31VPjI3Yuu83TIQ3onkmW+SfOveeBL2yW7xl6id9PE7t4TcBBqskojyHIRGzH
         +WasAWfiGyAWaGQcE92PE8jJMqePTpfzs9fmkS9UNNcqgVXwQ0h5OEdkrLfUKFSRcf2F
         CPFnUf3IzO7TTWdVV1PaBS/sT/TaY+ZpAJk/BtxdECnHimgCE8tgOJQZbLZEe45lPsxx
         OwoIAn3XnL7B9PCgNCN7CIpmtCfdyN+TPxRoq4s8ZKCBMB0ojwTyPMoTOs2u+ve9R4ro
         zSpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CzYdFop9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-864a9cd81dfsi724744241.102.2025.01.24.08.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CzYdFop9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMb3-0001IE-P7; Fri, 24 Jan 2025 11:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYe-0004Hc-Vk
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYc-0005b7-Qq
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:24 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so15786545e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736161; x=1738340961; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TAgJkg+zZafmqGOr1+zR48fm7oDoeLOlWLNiEgXtZlc=;
 b=CzYdFop9o4W33OuexZDPqeNpYBlYBDcnK1SbFq1MHRtVeoQScxk0cLDIESYuXCkLR8
 CZbvPdnorTKCH7jVkeYWVL1t+Hf5lgsAOmK9udxgmx/YADKMG1Xlb1IvDOHqdlkNCXRv
 HYmAZJ3dsoc+mwi1GKxyWKzyzvuHHRgO2WbF3vXVRc3tedzECblb+YLy8FDSDFsUHsIJ
 a1nW4P2S7EdTtUGj0qfcmXxVUrIhtC2RgT0Ang2F6DrYh7cs5SqcK71z3UI+9F++xNtL
 Ub7BxWQOC2rG+jb9Q5AbHfpfshRg5DGiqmetPJhLF0U/DnfRF8rmwty5QF21431L/K2e
 W/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736161; x=1738340961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAgJkg+zZafmqGOr1+zR48fm7oDoeLOlWLNiEgXtZlc=;
 b=FpJkojk3U+CdflqiMd2E69SfflJxGDPNhaQUZ+fxBMEfc0wWbZBWpJnMZ6TFk1d96S
 8QC5mCekwk4Xxr19Y2vkYpSCPxpSS56fcqViwshX63uMZdhfn+iHnsf43QgsYA9R0vke
 O6sbONZXG+tgrsYAB0iPQEYv/rmydAaBIjbHqG6fZjfWz06F4tIfcpBaBcyPwxevE23/
 HnfBdGP0pgRuKbzv5kOjDGZnAv7E1Ya1jK5nr/YgoqSXz6yJnXel+i1GbvH0pMhNlnEU
 eaLTzAo3OumO9A8HTfhwiqiUkMgP/wieXi21DLfp1LkA76BJWe6Ng7W1oCvXUsfn15FW
 jrUg==
X-Gm-Message-State: AOJu0YyIPf4QTktJDWIQY2X+e5dpCGvRpomGMYredS2OotcmjSpvPyEQ
 UfVidHaB0hJ7WeDhQttiRe6NBciwcdEAx9xAfnJwKHUqrRaqksmJE+rrsR0nS9BURG/vj9Zj1qX
 u
X-Gm-Gg: ASbGnctntpB93y5dfippj/ObcDsCJ6FkkRGeX2VTw5DMzZRhGePf0gBAoVlbTUbN2TY
 BzrjiNF4EOjQMirR75aEpKkemePPttRZkhHYbMQcgZmRg7UH3mLWx/1qpnQhsoWl7uNJ3J6ONaV
 voD9N1Iv5HQZfb4g4wbhbhzy2xg/Fv2+gaeo7WJU3CEpyWhN+MaQR68bXn/LLdM+PkI6gboVhMO
 nTt2WjyAJg7oGzUgWj2uxfAhzTt65MbO451KsPYxChhQsPoaTuNb1qqb+BVJ1qwvDNYTCY0mLCY
 hcySykjaLkg=
X-Received: by 2002:a05:600c:348f:b0:430:563a:b20a with SMTP id
 5b1f17b1804b1-438913d693bmr339733895e9.11.1737736160692; 
 Fri, 24 Jan 2025 08:29:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 34/76] target/arm: Use FPST_FPCR_AH for BFCVT* insns
Date: Fri, 24 Jan 2025 16:27:54 +0000
Message-Id: <20250124162836.2332150-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: dDyA55WwjRvf

When FPCR.AH is 1, use FPST_FPCR_AH for:
 * AdvSIMD BFCVT, BFCVTN, BFCVTN2
 * SVE BFCVT, BFCVTNT

so that they get the required behaviour changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 27 +++++++++++++++++++++------
 target/arm/tcg/translate-sve.c |  6 ++++--
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2a0c5e23e74..d53864ad794 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8514,7 +8514,7 @@ TRANS(FRINTX_s, do_fp1_scalar, a, &f_scalar_frintx, -1)
 static const FPScalar1 f_scalar_bfcvt = {
     .gen_s = gen_helper_bfcvt,
 };
-TRANS_FEAT(BFCVT_s, aa64_bf16, do_fp1_scalar, a, &f_scalar_bfcvt, -1)
+TRANS_FEAT(BFCVT_s, aa64_bf16, do_fp1_scalar_ah, a, &f_scalar_bfcvt, -1)
 
 static const FPScalar1 f_scalar_frint32 = {
     NULL,
@@ -9290,12 +9290,27 @@ static void gen_bfcvtn_hs(TCGv_i64 d, TCGv_i64 n)
     tcg_gen_extu_i32_i64(d, tmp);
 }
 
-static ArithOneOp * const f_vector_bfcvtn[] = {
-    NULL,
-    gen_bfcvtn_hs,
-    NULL,
+static void gen_bfcvtn_ah_hs(TCGv_i64 d, TCGv_i64 n)
+{
+    TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR_AH);
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    gen_helper_bfcvt_pair(tmp, n, fpst);
+    tcg_gen_extu_i32_i64(d, tmp);
+}
+
+static ArithOneOp * const f_vector_bfcvtn[2][3] = {
+    {
+        NULL,
+        gen_bfcvtn_hs,
+        NULL,
+    }, {
+        NULL,
+        gen_bfcvtn_ah_hs,
+        NULL,
+    }
 };
-TRANS_FEAT(BFCVTN_v, aa64_bf16, do_2misc_narrow_vector, a, f_vector_bfcvtn)
+TRANS_FEAT(BFCVTN_v, aa64_bf16, do_2misc_narrow_vector, a,
+           f_vector_bfcvtn[s->fpcr_ah])
 
 static bool trans_SHLL_v(DisasContext *s, arg_qrr_e *a)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 8ed8677baa8..4d77b55d545 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3904,7 +3904,8 @@ TRANS_FEAT(FCVT_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_hs, a, 0, FPST_FPCR_F16_A64)
 
 TRANS_FEAT(BFCVT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
-           gen_helper_sve_bfcvt, a, 0, FPST_FPCR_A64)
+           gen_helper_sve_bfcvt, a, 0,
+           s->fpcr_ah ? FPST_FPCR_AH : FPST_FPCR_A64)
 
 TRANS_FEAT(FCVT_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_dh, a, 0, FPST_FPCR_A64)
@@ -7054,7 +7055,8 @@ TRANS_FEAT(FCVTNT_ds, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_ds, a, 0, FPST_FPCR_A64)
 
 TRANS_FEAT(BFCVTNT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
-           gen_helper_sve_bfcvtnt, a, 0, FPST_FPCR_A64)
+           gen_helper_sve_bfcvtnt, a, 0,
+           s->fpcr_ah ? FPST_FPCR_AH : FPST_FPCR_A64)
 
 TRANS_FEAT(FCVTLT_hs, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_hs, a, 0, FPST_FPCR_A64)
-- 
2.34.1

