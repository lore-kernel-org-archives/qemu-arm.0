Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142084njb;
        Sat, 1 Feb 2025 08:41:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkx8bkJFyubgG5veQXQxsQNk40DRpBxeBifx9foX+dmPjuHuUUdpMauG8hF2Fk1N67sw1QaCxRubFiDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG95by7kYHBab7o8Z6vTC9HnqPPd1eOdhQVy4emKPJIxKI+pFtaSb8UOd9zD5TByrVl5dvq
X-Received: by 2002:ac8:570a:0:b0:467:60da:e118 with SMTP id d75a77b69052e-46fd0b981b5mr222661521cf.44.1738428067453;
        Sat, 01 Feb 2025 08:41:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428067; cv=none;
        d=google.com; s=arc-20240605;
        b=gp6ud/43o/dY0f5ZF9YROZ0FuE6GfuKuT9pcw7ffI7jm9o+MEeET6ur5pwWPLklqDB
         n1/TKTFE9cBmm+Mzv4xau9mj8nOSMihe3MI+olyaO013tP/TLmdIqbQ/TFqIR5VtyVc/
         kUBV2iJuaTu7rBbvAuYzsrdiL3Cw/C2rDg1BOekH9eyTB63/2l0buWz260o7g68rYAXf
         w8ewtrxt98PIFZgKN3hyTkacyA6dN6Rt+cMdxNO9tMN170YYf2a2nP1hIF1zVMTpjqR5
         TjG87/ASr9uRlBzgOlHJ1cmIeuriGvSoo9S98BKMXv89zIGoZrb5d5/hR5i9tZB/RWOG
         X34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZABGaocUKPORi0DB8OtUcbfDfzDv6nNeQO0oGgc3SPA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=hKlThRYM60cOMR37MbEB/1xI+fHmxT16dAKX3Ij8yDdyKrdXi6aS3/jP1UBFiWxJUo
         tIhKWWk5WZ4hhL+XfLKeAS65nX0q0rgHBzqLxdJvk6pF3OYP73esHhMCURD6QKKFKpoG
         si6wCtCbos9/qjLRUOyejxJTmdHE8yQPbwZXbU+Me6nknGTlmsGd3b33LrhWy16kGBI4
         42/BdU3uX3bIZYDNrWfFK0MgtOLxERCcS6mGPDUrGguzZtxmGQuNJTeopAiZKqMmWLNt
         LtmFmNGMNrq7221gYDxrkTvrjU+DPyVLbEU7OVIV8ey6RFPX45q73q8G3zNuet7IEbB/
         YHYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUOekpCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ab97asi60777831cf.14.2025.02.01.08.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:41:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUOekpCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYB-0006Jj-RK; Sat, 01 Feb 2025 11:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY7-0006Fz-Nz
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY6-0001A4-2A
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso20892125e9.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428049; x=1739032849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZABGaocUKPORi0DB8OtUcbfDfzDv6nNeQO0oGgc3SPA=;
 b=iUOekpCdHbrJqeSuAVLX+sh5yMBrPvKazyTzlJr8I3mDqAvuga7JxsQg/pE2KhqJsK
 k1rJNFSDWpUQ2cUMt9+1GP/0DgHjSXjWseIRpEHrCmiWA01HBJQkw3wJk8Sli913qv5L
 Zy00rIPf/FEn4H/11cKdW0h3k2e853u7zUbNlPWxESHKltabYkf53kE+269XzCtISDnm
 YuDlZOXCBGpQ6FNkFi2ARYWxJKV+X9y5KNntOPlujFS0KxG35D39amaGWiptfTu9hC0b
 odHO+8ky5ajwfd/8KlFkl8PvbQ53t8J3V+iFVUeEHk7+OD7dH6h3JjAiZ4hlJBvt8O3H
 Ef2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428049; x=1739032849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZABGaocUKPORi0DB8OtUcbfDfzDv6nNeQO0oGgc3SPA=;
 b=nxo6Hu63YHeDmorAg4hZ9BzgY8Z3hhakrW+MG9NU5xSG6NFt4sTye9nAZ+OT5ZtgZt
 oKFiKwp5F3FGYyyFoQ1e4NLajY8klkxq9elYLR5Fu6Td5xEblEKydu1ke0Va27GgC7lh
 PC5dee2naqZYpPQ4Qw62BSFpC99eURnSf3k+vqotDqP6mb3rCyJGd/G+bCCze/oGudLj
 CmWVJoAhqorqtF2DcoibPBwnyQNlHXLxgkUO+R1q5AzbpksE14hhCX+AlEtOdczkg16u
 te9gNlWRnH+HOFbZ2hgo4008KCiWJVy2g3JCMoU7NTSElxhqnbP8q8HsaHYgU9j29JJb
 EGvA==
X-Gm-Message-State: AOJu0YxngPJ8OS5xr7/7WHMmvUTLZC1DsU3e23deXVKyDDuBPS3qjUJf
 8hAuCpuO42qExnpFGLXqeaGr5e9wOQJyhzakRsV8OzkSSSYf4y8gqLRhe69KMxPDSlUBd1uiqFR
 w
X-Gm-Gg: ASbGncurNCHN15tWTPE7qm2PitNKmPoLGosUgc889N+65Vki4r8fB/Jpkwh/O0Imwyc
 CatHn81QYwrBLm8fW7wne8MR9v+SOUtmln1VNte2yS/rTNMpsMgWOrac2wJvXDkXTfAgICPAkT9
 xjTXBAxM9cs6+vtbs0lmfGBMouyHBLKtedgUmFEG+l0U+b/S9A0rhEGQnPvlwG2L3J9+o9uIyem
 MIHo7piw1eBWFKDW2ZbKpwitz8FEf+VtjnH6Ld5rIpd2G4SDDaZSKROIr4KrvN+CzZZxOUsfrtv
 1zVwD9C5shOZkv40KltY
X-Received: by 2002:a05:600c:4fd6:b0:434:f1d5:1453 with SMTP id
 5b1f17b1804b1-438dc34cc47mr155915775e9.0.1738428048613; 
 Sat, 01 Feb 2025 08:40:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 25/69] target/arm: Implement FPCR.AH semantics for vector
 FMIN/FMAX
Date: Sat,  1 Feb 2025 16:39:28 +0000
Message-Id: <20250201164012.1660228-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: S+1gGZT56k1b

Implement the FPCR.AH == 1 semantics for vector FMIN/FMAX, by
creating new _ah_ versions of the gvec helpers which invoke the
scalar fmin_ah and fmax_ah helpers on each element.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index ae3f3d32f45..cad9883f7dc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5607,6 +5607,13 @@ static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a, int data,
                                        FPST_A64_F16 : FPST_A64);
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
index 7330b373c38..9f77aa6b919 100644
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

