Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp943150njk;
        Fri, 24 Jan 2025 08:56:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULrr46nh51m4a4qElTp7kuYLAezBJOXPkJmU5BtTwpiXwUKl7g67+O5vHGbi8Px0uPOUrrsCKtsyKNjg==@linaro.org
X-Google-Smtp-Source: AGHT+IGlEueFFuH1VhaG2BBQYF7/gXfAikxl6qTgUJSUQAgX1vgt9XP8trzRB6S3kBeARChWj0IV
X-Received: by 2002:a05:6214:4685:b0:6d8:a730:110d with SMTP id 6a1803df08f44-6e1b1b2646bmr492263426d6.0.1737737819787;
        Fri, 24 Jan 2025 08:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737819; cv=none;
        d=google.com; s=arc-20240605;
        b=VaKo5skj9/9MetZ9FR6XvWdzZ7GkomqmxxjnlQ9CYlg28p1ZG/W2FvlbuaFKPY2v02
         tUK8Um6oA6Mk1Ez7h80ZA4JScJ2slowZUi0t+g9/QZWov7qaqGHs2yWcK4l+MZC+ot17
         V+KmqZml1A9x7cYQSbpYKhT26nVrwYzYTmRv2Ytw4y485UfGSJf24Sph5FYwzB6nDfQ8
         EOCrHb2aARvE9dst0Ni+E6sJpcG+3wZMbgyFtW2xjaz6IcRMEflDMW/THL4iSpwq73Xf
         S/3bxGoK3s8InSomEeUH42GjRNj+JWok1Zh8NFPCwX6F/MjMhyIJlYebIYwWvbEj+3lQ
         HZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2Mw+LALc3gCHAn7j1F7N81Llm3ddW1SJ4lLHkZVYPkc=;
        fh=8VgupFCfCmdhSEnK8+cUzyARssObDF/SB3pueemNpfg=;
        b=fR1EJXaDzxaieTB9PtUfzhbISHqCyCwTUbBbYN02t2jEt3GFjaIDJf2zTbutx7kKx2
         HFBUcUMyqiX1YP8xpIG7xUHFKOCJtEkZSmxUs6z1lo6GsCDzmHY31gY7Ocpw1lK62gmF
         JQX+fl32Pb7xnLOlo6Ssngv83FF0wQMAAV12ClqVpflJZbkjQffuYJ0t1ICPvApW+WBv
         Sp2AD3fIpmpUDVYqKDkQmDWDIQhvgikgeMmbDkzKz8aURpzXUaPAsVTyZE/+cZmKsgLU
         Z1k97RgaQY22L2aTm7wEoQYha6vQ+D7cfobfY+1kQp8+0GkaGn6+V6wjjRVBH+wAENxL
         N1fQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2LPCBEV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df6eb1si25510766d6.256.2025.01.24.08.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:56:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2LPCBEV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMcs-0006kA-Nr; Fri, 24 Jan 2025 11:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYs-0005G3-0O
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYq-0005gT-7k
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43626213fffso22182385e9.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736175; x=1738340975; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2Mw+LALc3gCHAn7j1F7N81Llm3ddW1SJ4lLHkZVYPkc=;
 b=b2LPCBEVCoKLGn31wyOK+lbAFR81KX4cEBsbIm/TfPG71IhVRxqgODrL6S8nVULDyn
 vERH9uEjAzq3N98O2mrr5PNpK0Y/JI6UiIXIn53c2G8ICCiIvteylQHHMRnjmh8iTos6
 8ARGv3+u5riHK+S2c55CqcYeQvo6B0rZ5JI5Jy1fTY1qrV7S7Ue5jjBpSGoXrBUG4rbR
 Z0ZYU64bIKOPjJuGzImUNwsU7ojvoqQzawApgqWhyPtquFSS6Zztv6TCFfIyej2jiWKJ
 lIvJHiZTH8CMzH8mEq51m6jT0hrKpDAUz5T5kWCdVKKdSu2d0S3Vuwd6hvF8ADUtidn5
 CQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736175; x=1738340975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Mw+LALc3gCHAn7j1F7N81Llm3ddW1SJ4lLHkZVYPkc=;
 b=dGrwfH+368Y6fEYHETUtj34X2nNKSW9E2uNYrlAG2T72YXkuqpq5daFA9mb6Gyh2qb
 T3VPrZLZMzDhjNAI7dbrSs84gijZjb8Ei/pLRTXOCmagNtMadghaqNnX4QGtlxaokVdl
 wgxwNvrWRlQYkQxlX3HhOP+OOXr733heYWaY1/qtSU60nPI5VDxs1WZVHupSFj0EJPHQ
 MH+W6eKYq+uKgy2goShia4DThr9flJvZv5FUB09mvrQFHj++gRjmwbZFeO8DNMUmpKK7
 U9BxEHIIXeC76TM5KcMtZ0VjlFry+QOeR0M74mvUHSw3sM/xM1JvnpwpEFUsctxKWE0u
 MPVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqTbFPDyCce5tY6ZEepAbHhNbciICYlyvyREEXHZesFcO4zLyv8mjUthTvMfBdqziALx0AoWpuRAGm@nongnu.org
X-Gm-Message-State: AOJu0Yz/UcUYwwNfyCHVHxYXgdFsdQ2idtRmQlPGrpfbrxXcgMjIky0/
 Zi+LS+d1itqHWcEtOa4ir4qQAiqbgFIReJWCw+Z9aEa+6OXJu0VPrmW9jM/4gDs=
X-Gm-Gg: ASbGncsW3rUfeUdgTgNQgjAyNNkunWJZfJha7Zx1brky2u7R7Yod2TziJ6CiC5qdK1t
 MWc1Me2JYrcow3tuAuQAdZ1t714zOuYphv6bm0Qgr1Do7t8FbmvJcNIkYBKC+FkDaPXk3BlJOEf
 BDfduFAQkFRsT14tpEz/H8HeBQ1d3mj9orOY5/jjOKhFX8b7e5EmSK47tMHmCikp4zP45CMwOpN
 5Uia4FZEyNp8Xjy6OvRZ+zRtt/99YBL+nZsXWhWZlrYcFDIowW/sEIzKPVfvdZOSeY8u3Yt5Am9
 DohI6XFeTOs=
X-Received: by 2002:a05:600c:1d0c:b0:434:f9ad:7222 with SMTP id
 5b1f17b1804b1-438b885652fmr75928375e9.7.1737736174786; 
 Fri, 24 Jan 2025 08:29:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 46/76] target/arm: Implement FPCR.AH semantics for vector
 FMIN/FMAX
Date: Fri, 24 Jan 2025 16:28:06 +0000
Message-Id: <20250124162836.2332150-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zTo78sKVfCfp

Implement the FPCR.AH == 1 semantics for vector FMIN/FMAX, by
creating new _ah_ versions of the gvec helpers which invoke the
scalar fmin_ah and fmax_ah helpers on each element.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 14 ++++++++++++++
 target/arm/tcg/translate-a64.c | 21 +++++++++++++++++++--
 target/arm/tcg/vec_helper.c    |  8 ++++++++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index fea43b319c3..f1b4606f763 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -972,6 +972,20 @@ DEF_HELPER_FLAGS_5(gvec_rsqrts_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_rsqrts_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_ah_fmax_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmax_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmax_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_5(gvec_ah_fmin_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmin_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmin_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_4(sve_faddv_h, TCG_CALL_NO_RWG,
                    i64, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sve_faddv_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a6f24ad9746..330336f0828 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5607,6 +5607,13 @@ static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a, int data,
                                        FPST_FPCR_F16_A64 :FPST_FPCR_A64);
 }
 
+static bool do_fp3_vector_2fn(DisasContext *s, arg_qrrr_e *a, int data,
+                              gen_helper_gvec_3_ptr * const fnormal[3],
+                              gen_helper_gvec_3_ptr * const fah[3])
+{
+    return do_fp3_vector(s, a, data, s->fpcr_ah ? fah : fnormal);
+}
+
 static bool do_fp3_vector_ah(DisasContext *s, arg_qrrr_e *a, int data,
                              gen_helper_gvec_3_ptr * const f[3])
 {
@@ -5647,14 +5654,24 @@ static gen_helper_gvec_3_ptr * const f_vector_fmax[3] = {
     gen_helper_gvec_fmax_s,
     gen_helper_gvec_fmax_d,
 };
-TRANS(FMAX_v, do_fp3_vector, a, 0, f_vector_fmax)
+static gen_helper_gvec_3_ptr * const f_vector_fmax_ah[3] = {
+    gen_helper_gvec_ah_fmax_h,
+    gen_helper_gvec_ah_fmax_s,
+    gen_helper_gvec_ah_fmax_d,
+};
+TRANS(FMAX_v, do_fp3_vector_2fn, a, 0, f_vector_fmax, f_vector_fmax_ah)
 
 static gen_helper_gvec_3_ptr * const f_vector_fmin[3] = {
     gen_helper_gvec_fmin_h,
     gen_helper_gvec_fmin_s,
     gen_helper_gvec_fmin_d,
 };
-TRANS(FMIN_v, do_fp3_vector, a, 0, f_vector_fmin)
+static gen_helper_gvec_3_ptr * const f_vector_fmin_ah[3] = {
+    gen_helper_gvec_ah_fmin_h,
+    gen_helper_gvec_ah_fmin_s,
+    gen_helper_gvec_ah_fmin_d,
+};
+TRANS(FMIN_v, do_fp3_vector_2fn, a, 0, f_vector_fmin, f_vector_fmin_ah)
 
 static gen_helper_gvec_3_ptr * const f_vector_fmaxnm[3] = {
     gen_helper_gvec_fmaxnum_h,
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 3fbca8bc8bf..c7af9a04a27 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1448,6 +1448,14 @@ DO_3OP(gvec_rsqrts_h, helper_rsqrtsf_f16, float16)
 DO_3OP(gvec_rsqrts_s, helper_rsqrtsf_f32, float32)
 DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
 
+DO_3OP(gvec_ah_fmax_h, helper_vfp_ah_maxh, float16)
+DO_3OP(gvec_ah_fmax_s, helper_vfp_ah_maxs, float32)
+DO_3OP(gvec_ah_fmax_d, helper_vfp_ah_maxd, float64)
+
+DO_3OP(gvec_ah_fmin_h, helper_vfp_ah_minh, float16)
+DO_3OP(gvec_ah_fmin_s, helper_vfp_ah_mins, float32)
+DO_3OP(gvec_ah_fmin_d, helper_vfp_ah_mind, float64)
+
 #endif
 #undef DO_3OP
 
-- 
2.34.1

