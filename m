Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp928402njk;
        Fri, 24 Jan 2025 08:31:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQ0rGe768nLY9HyIJ3jGIF9TuYP1Jy7n1edW1jF/hEnLBuyfIppCqSS/PMQv6JzFuik/u5+YgdV2NfJg==@linaro.org
X-Google-Smtp-Source: AGHT+IFXxtP5Y21fOdSACOIdO2D+2393V4WXBoVoqY1wrvlDKAuMzl6h2qEzc1JoVwdtACudZRi5
X-Received: by 2002:a05:620a:d85:b0:7b6:ce4c:69d2 with SMTP id af79cd13be357-7be6324682amr6110795485a.36.1737736314457;
        Fri, 24 Jan 2025 08:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736314; cv=none;
        d=google.com; s=arc-20240605;
        b=hA80qrZTjs985Sk+JPXo9wrpV9S2qxN290MIBEBeJBQsqaSMitmeILY1EmhU27YMSl
         uTEwQy0Tzz5kllq8OJnE2vkZfQ7OTbcJCWC/dEbtZPqLJinaQ12XyECKFEJdD27Kem5h
         vI4+jhqdecyD3hYEBMSuEy6qugRBxy//jFY/SAYc8yCJUGFPhzOfBZwKFTx/RjuO1G+k
         wtXEx6U/FM7G2bMnffGQokUP5/p95wQB5i3+AQ5leSph3weO0kW8CjpN3O5BIOhV0dg7
         QyTrVBbemVolVdirsoIfINa6HPJWMdWNFZ2whwJIE7v9/wF7drFZZ7UBoAkFKO/pFCXM
         VaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mQ+MesFMM2ApsJ2GrGgUSXkLejzsErzMzyZWYfNz8WQ=;
        fh=WYlKCJdHe4t9AdRYfP+8+6nUXZme7Y3FkMr1IxHjVFA=;
        b=iuVyu9xIp7YocqvF63MXPyhjUmlWD18CzC2WRu+f/3Pe55HxIfJmB61awKKmKR8v8u
         2R/ywAnEcIYYyF2OHAalyY8w9+MzOc2XX39IZvEgrjWxbtYMID0XOCtqcKi++3BZIb67
         hCsZXqL+vGXSmOgpuWp4MkfFoqTYaT7wUBev+moik+dApB8EHHN/Fw1XbYKTEC6wYCww
         q4gWX3NLJ2EIhQCkY3du46PsRenhKD48pTYpabGFewsvqGPYvK5KJNKclEMhRRcJfKml
         WzzTu6p1cGDCbs4degu7eHCOkC4+zSIXA82MGMEpquctK7DFQJkOUxGAOyQYDEUQ0c9Y
         QP7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OltzrKIy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81a28si265179785a.106.2025.01.24.08.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:31:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OltzrKIy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMYl-0004mR-LE; Fri, 24 Jan 2025 11:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYU-0003yT-7q
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYS-0005XG-A8
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso15918845e9.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736149; x=1738340949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mQ+MesFMM2ApsJ2GrGgUSXkLejzsErzMzyZWYfNz8WQ=;
 b=OltzrKIyCxf99ZZdS+PRnOa40NZOEtscfmGn33eoW6CluYEGHE1N9EHZfaqUUfpWCR
 VW0J6haQFl+duXNLFfGiz94vxMbCFeqmYPhnFf9WQgVA8wKaPE//RDvHcRmLBCdfqv1O
 8oKHZbSCkpoemH3PQMOpZkeYri8aIJz9g6NGvcu16NVRhX6qpQOoNejAx9ZGjx6lWgyU
 7vg5W0YBTRBjYQuE0wzftR9jrK4L6nYXIqU0WgEhzVD0br/nA0nYQCFyL5UCJLn6v36R
 vRO+P3+hG1Omn6AONAc+P9SeihuIER7H0ZI0FUhjiP4znRW2U1bQ/HP2IFK0TktG3pZg
 mRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736149; x=1738340949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQ+MesFMM2ApsJ2GrGgUSXkLejzsErzMzyZWYfNz8WQ=;
 b=J04oKE9LxFtdQHeAKMQNnqo6KfFD/x9Q/rzpnVFkkiaDURwS0UgDUKvKayqbQRKG7t
 rbeqzt8ih2/d7ReUhDnTiqOX6wKqDW2sejBAWyGGlxhisoINkjl67eXWoubZngqOhUXz
 eoCtCqjWITr6pSVKLQpV5+X8whvqacCkkdvnupy3Oqa2Nbh3N8cUtfh+LPZtPvYubf+7
 aarx1aJ6DyfSAZyyuYPEUWVIIXhxYPIYA0NUTib9/i8Wj+4c9Wj/inG8Yi8aZXIyo7of
 jPHrf/OJ0jtFpFbDn49mgDUxgfIswid5Qn1HzzowpfjtsBa1BORwdDK+uyKjMo01yZ2N
 kgyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpe7CYUUd4IlFoRdDnBv0dHXTQMWG1T3B70YkPBctucA6RpGwW1wcbzwPLvYuhTvp8Qmas2XBPUtzO@nongnu.org
X-Gm-Message-State: AOJu0YyAgIUNTS+LAzl8PBf8AOJsvfPdp0G4AhJYP4ew7aw83bU3xQNb
 DL2n2JxIkyQ4Gns9M94IgKw0rA8y45sfqvY0Vrqg85ZvoE6KIheDIa+1cg33JophTE0NFm+bFeE
 M
X-Gm-Gg: ASbGnctpnKSQ0f2i6ofVR33gP/qQD8dyLMvxICuhhaPf892cAw/xfrMtkLvWVm5ACK+
 scNB5cHhg4OOKSomQXzM8+Aa82FnF9XmmSic/WwYpMUjHRd8RrdzDaiNLaLP7mSB00+POuszrJr
 VYBt96exK6pYcTcZaHBQILJ4AqsFPfIpaNpa+TQXlIqkEAVpIFOYi4ii3574n2Vqnxw/+gg9gnm
 oQRHnF/6ZTAdgmPRQWfgp4dP4EPRlsJkf7Si8JPtMd96IhoLnAHRNP8O3yCl9P2NYAO4+o+CVMs
 TnDx+V51Mos=
X-Received: by 2002:a05:600c:1e02:b0:438:ad4d:cf09 with SMTP id
 5b1f17b1804b1-438ad4dd134mr157996455e9.9.1737736149294; 
 Fri, 24 Jan 2025 08:29:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/76] target/arm: Remove redundant advsimd float16 helpers
Date: Fri, 24 Jan 2025 16:27:45 +0000
Message-Id: <20250124162836.2332150-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2uMF+pPZW/Hh

The advsimd_addh etc helpers defined in helper-a64.c are identical to
the vfp_addh etc helpers defined in helper-vfp.c: both take two
float16 inputs (in a uint32_t type) plus a float_status* and are
simple wrappers around the softfloat float16_* functions.

(The duplication seems to be a historical accident: we added the
advsimd helpers in 2018 as part of the A64 implementation, and at
that time there was no f16 emulation in A32.  Then later we added the
A32 f16 handling by extending the existing VFP helper macros to
generate f16 versions as well as f32 and f64, and didn't realise we
could clean things up.)

Remove the now-unnecessary advsimd helpers and make the places that
generated calls to them use the vfp helpers instead. Many of the
helper functions were already unused.

(The remaining advsimd_ helpers are those which don't have vfp
versions.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-a64.h    |  8 --------
 target/arm/tcg/helper-a64.c    |  9 ---------
 target/arm/tcg/translate-a64.c | 16 ++++++++--------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 0c120bf3883..bac12fbe55b 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -47,14 +47,6 @@ DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, fpst)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, fpst)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
-DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
-DEF_HELPER_FLAGS_3(advsimd_minh, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
-DEF_HELPER_FLAGS_3(advsimd_maxnumh, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
-DEF_HELPER_FLAGS_3(advsimd_minnumh, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
-DEF_HELPER_3(advsimd_addh, f16, f16, f16, fpst)
-DEF_HELPER_3(advsimd_subh, f16, f16, f16, fpst)
-DEF_HELPER_3(advsimd_mulh, f16, f16, f16, fpst)
-DEF_HELPER_3(advsimd_divh, f16, f16, f16, fpst)
 DEF_HELPER_3(advsimd_ceq_f16, i32, f16, f16, fpst)
 DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, fpst)
 DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, fpst)
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 3b226daee78..05036089dd7 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -439,15 +439,6 @@ uint32_t ADVSIMD_HELPER(name, h)(uint32_t a, uint32_t b, float_status *fpst) \
     return float16_ ## name(a, b, fpst);    \
 }
 
-ADVSIMD_HALFOP(add)
-ADVSIMD_HALFOP(sub)
-ADVSIMD_HALFOP(mul)
-ADVSIMD_HALFOP(div)
-ADVSIMD_HALFOP(min)
-ADVSIMD_HALFOP(max)
-ADVSIMD_HALFOP(minnum)
-ADVSIMD_HALFOP(maxnum)
-
 #define ADVSIMD_TWOHALFOP(name)                                         \
 uint32_t ADVSIMD_HELPER(name, 2h)(uint32_t two_a, uint32_t two_b,       \
                                   float_status *fpst)                   \
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b713a5f6025..74766a0bc47 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5101,28 +5101,28 @@ static const FPScalar f_scalar_fmul = {
 TRANS(FMUL_s, do_fp3_scalar, a, &f_scalar_fmul)
 
 static const FPScalar f_scalar_fmax = {
-    gen_helper_advsimd_maxh,
+    gen_helper_vfp_maxh,
     gen_helper_vfp_maxs,
     gen_helper_vfp_maxd,
 };
 TRANS(FMAX_s, do_fp3_scalar, a, &f_scalar_fmax)
 
 static const FPScalar f_scalar_fmin = {
-    gen_helper_advsimd_minh,
+    gen_helper_vfp_minh,
     gen_helper_vfp_mins,
     gen_helper_vfp_mind,
 };
 TRANS(FMIN_s, do_fp3_scalar, a, &f_scalar_fmin)
 
 static const FPScalar f_scalar_fmaxnm = {
-    gen_helper_advsimd_maxnumh,
+    gen_helper_vfp_maxnumh,
     gen_helper_vfp_maxnums,
     gen_helper_vfp_maxnumd,
 };
 TRANS(FMAXNM_s, do_fp3_scalar, a, &f_scalar_fmaxnm)
 
 static const FPScalar f_scalar_fminnm = {
-    gen_helper_advsimd_minnumh,
+    gen_helper_vfp_minnumh,
     gen_helper_vfp_minnums,
     gen_helper_vfp_minnumd,
 };
@@ -6902,10 +6902,10 @@ static bool do_fp_reduction(DisasContext *s, arg_qrr_e *a,
     return true;
 }
 
-TRANS_FEAT(FMAXNMV_h, aa64_fp16, do_fp_reduction, a, gen_helper_advsimd_maxnumh)
-TRANS_FEAT(FMINNMV_h, aa64_fp16, do_fp_reduction, a, gen_helper_advsimd_minnumh)
-TRANS_FEAT(FMAXV_h, aa64_fp16, do_fp_reduction, a, gen_helper_advsimd_maxh)
-TRANS_FEAT(FMINV_h, aa64_fp16, do_fp_reduction, a, gen_helper_advsimd_minh)
+TRANS_FEAT(FMAXNMV_h, aa64_fp16, do_fp_reduction, a, gen_helper_vfp_maxnumh)
+TRANS_FEAT(FMINNMV_h, aa64_fp16, do_fp_reduction, a, gen_helper_vfp_minnumh)
+TRANS_FEAT(FMAXV_h, aa64_fp16, do_fp_reduction, a, gen_helper_vfp_maxh)
+TRANS_FEAT(FMINV_h, aa64_fp16, do_fp_reduction, a, gen_helper_vfp_minh)
 
 TRANS(FMAXNMV_s, do_fp_reduction, a, gen_helper_vfp_maxnums)
 TRANS(FMINNMV_s, do_fp_reduction, a, gen_helper_vfp_minnums)
-- 
2.34.1

