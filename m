Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp332589lft;
        Fri, 8 Jul 2022 08:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnokSo4M2g3hgE5Vs8io2O66bCLoB1LIFpX7k4xUvL6oWbp49YH/e858pfl0SXCLCJO+hy
X-Received: by 2002:a05:6214:2588:b0:470:4592:1039 with SMTP id fq8-20020a056214258800b0047045921039mr3159097qvb.123.1657293589477;
        Fri, 08 Jul 2022 08:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293589; cv=none;
        d=google.com; s=arc-20160816;
        b=udl0K4mexaNLZX1tFtRf87bDI8zrzV6sOtgQt6GLytwPxLSkurQEj2SZ7cLyphjyCV
         /YYLq+A+IEbmhAOV+hzV2UwW0QfxjSaUSvxnrvf7UcAL/z3YCkjVpaEcMa45Bhve9TeR
         IFcZAIxk7HduOOJ3IIh61rElbHDSDrfsGQsLM2RxYyDr22SEvyBK7qA4eks9ffUJPHjv
         2Y2eN7ZnR14Hz801P4Za/OuhNoirZem4k3h7PuFDRC7kg6vjJuBUWk4all8PwkPJ8pwm
         KHE3DfHXKKX5uPzzXfRJQQGa0XTN4LgUanhIlLl3x/7gOGqfuJn7AhqWAuGPi9muaG0O
         MIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dcHardhOi3ouG3QD1ZaU/LIrZV5tMarYA0PaEYIlrzQ=;
        b=bu/cW64T4gtOglbFiOYddvE7pRqFik9PdqAUtjDDR5E1mcjZ2+haOT4ikL+exRwJ3S
         GHi+j+l7/30/Q3nGcPCnsoKVBHAItPQCBpmfQxpRJBjD0gzVKwsQ5gLQrvbK2nO4N76Y
         NTnZSN0m22tCJZ4wqA0fZnflSZE1knTqU/+ZKWQP823qKUOunK8DGOVp6urA8NyCSsNP
         QT5ZZyyea2ILe2KOxcNL6ATOvit2FcqiaXHQPSBBdX2+Hh5mu+3M0+/R3TswVEBwcAwU
         G852tx+0JAaIcb/0CALMuiwgaZ476C3psyY6e0djz85Q3o2uGU/lgiPnZ29sBOvTM0BM
         k+hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kwr26iqk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp36-20020a05622a1ba400b0030511b90b77si28129383qtb.506.2022.07.08.08.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kwr26iqk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pll-0000ph-0D
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piL-0002H4-6r
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:17 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piJ-00028g-EH
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:16 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso2077274pjo.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dcHardhOi3ouG3QD1ZaU/LIrZV5tMarYA0PaEYIlrzQ=;
 b=Kwr26iqkjCDtSmnm+ohn3gHMOyDhs7H0tYEA5l2ola5RLrJmRAj62eXplKATYlO+Mm
 vyld0L2tA622ErAF27HRjpnMZVV3Bmpt8exBkjP7uCbNX8aXQWXrKESJD3+UJC+l+kqj
 J1cGc8fmNoOqnIUf0fHG3o57/CEU/Nv8o9ElBaLPGnN2mvwH0hBP7FV0jDuWQvwmpD67
 79Tpyv72hU2xwOf3lbBneuucrpfU3DwqU9UajnwNP89RSBX9bv620n2gGwEWHo6XEK3n
 dzv80kzwM5HgAqy8wWhCrOSH00/R/zOMOOmXM1sknvrcG1+kISWUckbxvoYZS/zGqDt3
 nI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dcHardhOi3ouG3QD1ZaU/LIrZV5tMarYA0PaEYIlrzQ=;
 b=H1pwoTLC5c20oESyo7Y7TsQkSvzWakl+hC+hlYaExDL68rXU8LOftAbVuJNCyt78DJ
 5AoQxJXaoK6972lvSUD4uaKqmgflcv3weZey82s3KDlLCnVTlknY9RolCXyNEYdnsCXP
 qz8bY/v3BthSYqQpzDI+Aj3xa8uwlNSdvJJqjC4SHjCVA1+wIbVowXlK7WgZiVB5EW1o
 QdDt3MFx7ASIDCULlkTWH3ylzdvFmqOMh/nsyVWetRsXR70RoAsHAH4wymFAuUFJIkfQ
 vvyAs2t1LrDVqda1eDs8uruK3Haob+dD+fniDM9ipdMd7F84nrJaWy1kO0QoD2Z/CzYz
 KpPA==
X-Gm-Message-State: AJIora9ZNcAF0OCZdtcBrHLlifGV0OIHNgBu4rNrfublkWPOOAap0SpX
 +YCQvM7LCIUT50LNYG5gHr974w==
X-Received: by 2002:a17:902:d2c8:b0:16c:58d:7278 with SMTP id
 n8-20020a170902d2c800b0016c058d7278mr4189287plc.45.1657293370509; 
 Fri, 08 Jul 2022 08:16:10 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 08/45] target/arm: Mark FTSMUL, FTMAD,
 FADDA as non-streaming
Date: Fri,  8 Jul 2022 20:45:03 +0530
Message-Id: <20220708151540.18136-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TNEMPOH7EjU1

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  3 ---
 target/arm/translate-sve.c | 15 +++++++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4ff2df82e5..b5eaa2d0fa 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,9 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
-FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
-FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
 FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
 FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4ff2102fc8..d5aad53923 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3861,9 +3861,9 @@ static gen_helper_gvec_3_ptr * const ftmad_fns[4] = {
     NULL,                   gen_helper_sve_ftmad_h,
     gen_helper_sve_ftmad_s, gen_helper_sve_ftmad_d,
 };
-TRANS_FEAT(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
-           ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
-           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
+                        ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
+                        a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Accumulating Reduction Group
@@ -3886,6 +3886,7 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
     if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -3923,12 +3924,18 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
 DO_FP3(FADD_zzz, fadd)
 DO_FP3(FSUB_zzz, fsub)
 DO_FP3(FMUL_zzz, fmul)
-DO_FP3(FTSMUL, ftsmul)
 DO_FP3(FRECPS, recps)
 DO_FP3(FRSQRTS, rsqrts)
 
 #undef DO_FP3
 
+static gen_helper_gvec_3_ptr * const ftsmul_fns[4] = {
+    NULL,                     gen_helper_gvec_ftsmul_h,
+    gen_helper_gvec_ftsmul_s, gen_helper_gvec_ftsmul_d
+};
+TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
+                        ftsmul_fns[a->esz], a, 0)
+
 /*
  *** SVE Floating Point Arithmetic - Predicated Group
  */
-- 
2.34.1

