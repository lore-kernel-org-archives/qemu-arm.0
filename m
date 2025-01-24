Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp934312njk;
        Fri, 24 Jan 2025 08:41:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXSLCeZpL3zluCzsGlexLwesSZQ17QZadLxMeIizPTqe92AQG5Wc9LrWeSEfPV5bUhUNqvI8BN3cKXIg==@linaro.org
X-Google-Smtp-Source: AGHT+IHng3CtGJhwNiV3ixwBLqdoYzVC2ZPcvzII9kottr34j8YsWSsMTcf7R3avDLj1l+dbPW3x
X-Received: by 2002:ad4:5bc1:0:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6e1b21da05fmr518930266d6.38.1737736911839;
        Fri, 24 Jan 2025 08:41:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736911; cv=none;
        d=google.com; s=arc-20240605;
        b=ifM/9XF8H2KYu3bseDBYym26+OKi0RLyaK7gkPYgs16rt2QOoJq5NDDZ35FDDZjN0A
         Rhd0zvY90Zrfey9+Q8swkLMNk4C6i4XDnRByTpCCCjo/sU5FPg0lBFOevoY/gb0JkIM0
         PYZCXlY6P6ibXfo5Xdhz4tfq9g4Jp8unuBke53xbWAYXCDjU1KKxxSPgY1WBoL+LxPFj
         CFaNtrNJn8+VVbqXIihwFv7Bx7sFigqzVeyUKpK0VrYtynugwXq/Xwe3uRQbjUVq44Bn
         uE7tIQgFthcomVk/ABaT5OVQmqZnqq1kTtcW4+Juj+xdyjj8XCs4airjVsmfWv3GEGPJ
         TeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZZv9bq0gc1TNRBfKcXqBREv5BnIPhNP5omygXi9vvRM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=I1ZZUDMstsbLIerH3TD7Id3+wpvWKgnF7EhzIAJ9Gj2xuL5UIAajfYhgVPgU2GyLQJ
         ayFYyojJiIx8IFO0fpU4K0DKteRomu0I+U4iQAfhbLeVdAZ+3cp/hk5yfIBhR5kimdBI
         YwFh+g9C7Qn4bEmtuozREpg1mIco8eIkAmvYDEBtJ8tFwpAe9hl7TIV0Cwcc43gWim/M
         h/TvmdH6lVQV7isvDuPG5DHRYMbBKVLxuXwotEzbTPftDSWG6HPFyShMTpQBrQQRNOwj
         CxPuqpgLx2rdGLer+Mk4l0TF7RUqNale+RYP3Te/v4AcKdhwURaI0c2I3fW06AsIZbPP
         3L9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ASqzPj/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525c271si27538976d6.25.2025.01.24.08.41.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:41:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ASqzPj/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMda-0007wm-0X; Fri, 24 Jan 2025 11:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYu-0005V9-AF
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:40 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYs-0005gr-5a
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:39 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso16646155e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736176; x=1738340976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZZv9bq0gc1TNRBfKcXqBREv5BnIPhNP5omygXi9vvRM=;
 b=ASqzPj/BA8OepH9orNPRg/HTSQo6M19PpYJ7SjVTMv8Ly4ZQEQh2Q8Ruou1N0GRb0J
 vItcbGSc4SYL7C8x6mtUlxaPv981Rx9HZ5Gi59FtjYUS023fgIePs0pA1aPJexGa7ML/
 pUp5UUMS5PleWIP6edXXsfdn4q2ws9191gz+OlRXuillTJ83FahByoBQWufEA2YAXooQ
 v+xn9MBdX3fEIZmVjH/YndtjtAascE4Exh+VDHCNBuABuE2g4jgKTdVnbN2GDZRsks4C
 42Si+c6WCx0AmgcJRvaDlo6A3OvBdYgwF08G21SWBHObIb1zAcbpfn6PV30nsHWR0sSu
 4eWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736176; x=1738340976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZv9bq0gc1TNRBfKcXqBREv5BnIPhNP5omygXi9vvRM=;
 b=lC8lrxyds8SgbljeOs1NsDP+hmLm2bmxI+/7sVhdzFpsHx/IQrrAVxFXes8vbU2b6S
 8I7YhfyeBm1fYvyioAomNAG2LBE+fr749YvKdIX1qmW4BN+Ad1sjr8f1DwUDjlfvlwym
 IU1ehfXZea7GRa9k8FaXgeXMVHNTIWQEj8xx0dbU7F8ok2o7zQg/UTQTb8C/yst43HRB
 M3LlXT/TIDst2nzJk2yRC7OXVz7YBYM0M3dADTe9cj37bBiDbSVjbpGFWN3R1ZT7x5pM
 OFGtlObketzxBWlBLo1106/2+esaoWdAtXrh4E7CK7vSbb3rdo3NOOU9BSglp7gVr86a
 rGpA==
X-Gm-Message-State: AOJu0YyiQNLQ/SPoxABGajvUcCeahzLAvAIsIiy1jG8Qt/bRIuRArqDB
 hgj3geXu0/oGNPiJhgTRe92Y1sLSK9RxOuOXLbJutMa5Uq/aOTNMHVc1g0EIaEK6a94Tm0Qg7NS
 7
X-Gm-Gg: ASbGncv4OFJK6NKtsdANK4hazuKd2D6RqSoEcE5Zf5lHpR00bwte1HVDIQsxlicZ4b0
 sfU6tOKzNjPnXnyoGQJkvKlBSZ4sT33tqncSOO0WnNaq2GPOgpz2LBJKXYHJ5h69CfSL5UTWrri
 i1tGm0P13LV7kGeZnfBf51AwGtFRePxfQXQPxC3E1DGdCHmucaL6xq9Mbj4LyGPXCr8B3VwZwiR
 XbTjLLOio71pSN+DHt8//FBxrzgvDmuKeM99VeU93awo/pLO9ur2F76vIma8T6FFMO+P9YiV4kM
 /q6u3Hi25qM=
X-Received: by 2002:a05:600c:1d1d:b0:434:faa9:5266 with SMTP id
 5b1f17b1804b1-438913e79e2mr281283135e9.13.1737736175953; 
 Fri, 24 Jan 2025 08:29:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 47/76] target/arm: Implement FPCR.AH semantics for FMAXV and
 FMINV
Date: Fri, 24 Jan 2025 16:28:07 +0000
Message-Id: <20250124162836.2332150-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xoRjx2mViEW3

Implement the FPCR.AH semantics for FMAXV and FMINV.  These are the
"recursively reduce all lanes of a vector to a scalar result" insns;
we just need to use the _ah_ helper for the reduction step when
FPCR.AH == 1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 330336f0828..c07e22bad31 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7029,27 +7029,35 @@ static TCGv_i32 do_reduction_op(DisasContext *s, int rn, MemOp esz,
 }
 
 static bool do_fp_reduction(DisasContext *s, arg_qrr_e *a,
-                              NeonGenTwoSingleOpFn *fn)
+                            NeonGenTwoSingleOpFn *fnormal,
+                            NeonGenTwoSingleOpFn *fah)
 {
     if (fp_access_check(s)) {
         MemOp esz = a->esz;
         int elts = (a->q ? 16 : 8) >> esz;
         TCGv_ptr fpst = fpstatus_ptr(esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64);
-        TCGv_i32 res = do_reduction_op(s, a->rn, esz, 0, elts, fpst, fn);
+        TCGv_i32 res = do_reduction_op(s, a->rn, esz, 0, elts, fpst,
+                                       s->fpcr_ah ? fah : fnormal);
         write_fp_sreg(s, a->rd, res);
     }
     return true;
 }
 
-TRANS_FEAT(FMAXNMV_h, aa64_fp16, do_fp_reduction, a, gen_helper_vfp_maxnumh)
-TRANS_FEAT(FMINNMV_h, aa64_fp16, do_fp_reduction, a, gen_helper_vfp_minnumh)
-TRANS_FEAT(FMAXV_h, aa64_fp16, do_fp_reduction, a, gen_helper_vfp_maxh)
-TRANS_FEAT(FMINV_h, aa64_fp16, do_fp_reduction, a, gen_helper_vfp_minh)
+TRANS_FEAT(FMAXNMV_h, aa64_fp16, do_fp_reduction, a,
+           gen_helper_vfp_maxnumh, gen_helper_vfp_maxnumh)
+TRANS_FEAT(FMINNMV_h, aa64_fp16, do_fp_reduction, a,
+           gen_helper_vfp_minnumh, gen_helper_vfp_minnumh)
+TRANS_FEAT(FMAXV_h, aa64_fp16, do_fp_reduction, a,
+           gen_helper_vfp_maxh, gen_helper_vfp_ah_maxh)
+TRANS_FEAT(FMINV_h, aa64_fp16, do_fp_reduction, a,
+           gen_helper_vfp_minh, gen_helper_vfp_ah_minh)
 
-TRANS(FMAXNMV_s, do_fp_reduction, a, gen_helper_vfp_maxnums)
-TRANS(FMINNMV_s, do_fp_reduction, a, gen_helper_vfp_minnums)
-TRANS(FMAXV_s, do_fp_reduction, a, gen_helper_vfp_maxs)
-TRANS(FMINV_s, do_fp_reduction, a, gen_helper_vfp_mins)
+TRANS(FMAXNMV_s, do_fp_reduction, a,
+      gen_helper_vfp_maxnums, gen_helper_vfp_maxnums)
+TRANS(FMINNMV_s, do_fp_reduction, a,
+      gen_helper_vfp_minnums, gen_helper_vfp_minnums)
+TRANS(FMAXV_s, do_fp_reduction, a, gen_helper_vfp_maxs, gen_helper_vfp_ah_maxs)
+TRANS(FMINV_s, do_fp_reduction, a, gen_helper_vfp_mins, gen_helper_vfp_ah_mins)
 
 /*
  * Floating-point Immediate
-- 
2.34.1

