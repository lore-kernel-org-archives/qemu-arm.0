Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1261514dyc;
        Fri, 4 Jul 2025 07:41:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8jNkGZUQe/jMR280mHirr0yWLSffk8ZKVDTGjLgVclUemge+gtSxKggVwtUBHRvUELad9wCgKlkv5EQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHcOAt4rhlQzxFz9Il1rHRDVaeJAOVoFLbCdy29Hg6zlH3oN7Ik2Q1A3C77zSiSmZ4PE9n5
X-Received: by 2002:a05:6102:5cc4:b0:4ec:c548:e57b with SMTP id ada2fe7eead31-4f2f19983c9mr1745576137.0.1751640108800;
        Fri, 04 Jul 2025 07:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640108; cv=none;
        d=google.com; s=arc-20240605;
        b=bOsOD5vaqKZlqQQYdkFoXfoSwbAfZ3TErDmTndNVVYlmedkchKz4axzFtd8fISYba9
         rlyEBGDuLnjLf2awjKnqEnlF/4wJ9fTjHZ/etV1NYLjtni7GHLyhS/+PvSaxFslCjOtk
         11aWhAnQigAAKmYXG4MeOKXUsGt54DUuASZcvmWcBcjJ19cH/6e13l8AsufLt4dELlU6
         jrEhSgYEIzun6PohMPkYkF3WAtJrGxyvZ7VbOUabQJrP6hvs2NFXNV15FLcNJNXVNGq4
         I4Y+gr/6TBLXcL6AhitgwN4pGXnVLJLH/zxVGYO6wiaAPiNaLWGSOrNOu90W3iOyNQKi
         LzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SL9oVXjt3dYrDelPVkHVVYLtmY0t9vX7UgCxdol7LyE=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=hp9CqLIIWICnVzwQUQjXFPvzOoOmDI6nIGFZenullLdFzROOjhV82w+ZGiGnMm+jCY
         C4oJR+05MRIQg5ZZhWqFRS075lIFBAbqJMykA7GkykR1DiyOHv1JOCojfeRVs4DzjTZa
         bUq5rua8I7mXMEPnx8IgrxIbnsX2X3Z37OaAH+JOxk8YHaUQYJ2afpV6O+v3xBOnSb99
         x0uxi4Q+wFTN/KSRuJs2f4akK6nzJfpzWF37kkDBfv+RvQnf8Rd64YRYdqs4z8hZF3u6
         4WIWv6BKrlHmjmn4vtyhLdI9kHDyJN7wX6cHZye9ySH7Psqs4va4qfuBsQkdL0UHglgI
         lFEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yupwp0f2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea6b77c1si674698137.243.2025.07.04.07.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yupwp0f2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhO4-0008Ss-A2; Fri, 04 Jul 2025 10:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLZ-0003U9-GY
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:01 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLW-0007ap-AA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:01 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-60d5c665fceso559751eaf.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639097; x=1752243897; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SL9oVXjt3dYrDelPVkHVVYLtmY0t9vX7UgCxdol7LyE=;
 b=yupwp0f2HVMq6xflLtiatx85oVoGaP4Mja1GuGSKeMHymV1yOkNe9XX8axrKW9vYyT
 vukkH74TaHTpHr+HOfu/LR50ZVlTt4b1IuyVV4S2mmGmbszO02hXavNLxp+Y1PjncGf6
 tB8HrQIM6Mo5VEkjb6H9YT/rQAnpjJFEqgRfADrXM7yPYatA6eGMZo7pA2MJHN8POa58
 lOLD2U3twFn69LYtARCh+THTnAMz4qLbfqI+envNZNzS6ZluicblZ3qVsFXFU2BSFO8h
 I1GgYL0NJxIuhYQU9TNkakJ7/AZq7MR2UR8kWk/6vU0XwWNQ0A3eaNNkiLR47lMPDaBb
 rzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639097; x=1752243897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SL9oVXjt3dYrDelPVkHVVYLtmY0t9vX7UgCxdol7LyE=;
 b=t3oUhZL4MvliBnVnavl954LC3GLIwjTx8SvWFnPUdPHLNcsHempGLPJkN5rfCBdmGi
 lDnBc/y+X1Do5LoaJZpvwIt+H1gDqUrc32nV782QvqhUDlk7/xTaDi/eln9vDi1++NBa
 a74Ptsh6ppd3alPgbWf7zjCBJTtaJN16/v7+MBnHBnnuKmS3gqMLocg3BmpVtZ2AYgZg
 hygJQ+LBnsb1lvtnouqmhOO6V6e3rmRlmKjD/pZ/5VtVjO8PAbf+DJ89kLcT5yX15eD1
 dpb7Krix0N33dQS35HEXGkZXBFXjNQzYpAxu5HuXKb20tlF2Fmo3UeK3teeJxHq8rc1i
 5dIA==
X-Gm-Message-State: AOJu0YwJuJ9D16xL+rfY2wsCm0XuOo1Ovl2JcKAx79qlXm3NICej40eP
 JwrURVOQNkCI5jt1VNQ5Ss0EVnacpaAEm8uJMQVPHE9L07W8LOtxP7y4a2TTUSjC5YM=
X-Gm-Gg: ASbGncsoMVWGP9D98+OODdtAfjFEUciZYXx4hLq0KkTwVLDkXSsPal+Osc9tTisNEn7
 rbWU57Zd8s19/u3H2R28LtINS5qcWpSzg4UdJ1etJ92Bz8EE39wPA5a5Aia+OK6wqi/vuL+6cKl
 TjbopIzQktKVHFMupr2nCpiKe3ROH806LSZenGhRZ8KjgfpyDmggE866EewUhseHmZciZsFd77Z
 od2h28CDeP5i2fXsJS+eozvtIQhn/Sp2cAA2d/z7F0vOhAEIXc81zqLV1qbgt5mfuGqYHQVbV0Z
 RxpqNgMOk4nDrw4ygWWBifoG2/MV2AxmVeHHIKhluMNMoCIaDrTO9+t/hrjUEDPTzdw5HS1AxsN
 eQmCwSv9HaDau5TEV162/KxZEaO0c5aU3DIIHotOZu58rHa8r
X-Received: by 2002:a05:6820:2d03:b0:611:db44:6589 with SMTP id
 006d021491bc7-61392b6f7d9mr1783222eaf.3.1751639096920; 
 Fri, 04 Jul 2025 07:24:56 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:24:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 040/108] target/arm: Rename helper_gvec_*dot_[bh] to *_4[bh]
Date: Fri,  4 Jul 2025 08:20:03 -0600
Message-ID: <20250704142112.1018902-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
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
X-TUID: hL3L2ZoWHByn

Emphasize that these are 4-way dot products.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h         | 22 +++++++++++-----------
 target/arm/tcg/translate-a64.c  | 14 +++++++-------
 target/arm/tcg/translate-neon.c | 14 +++++++-------
 target/arm/tcg/translate-sve.c  | 18 +++++++++---------
 target/arm/tcg/vec_helper.c     | 22 +++++++++++-----------
 5 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index d8d389af2b..a19955b872 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -616,23 +616,23 @@ DEF_HELPER_FLAGS_5(sve2_sqrdmlah_d, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_usdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_4h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_4h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_5(gvec_sdot_idx_b, TCG_CALL_NO_RWG,
+DEF_HELPER_FLAGS_5(gvec_sdot_idx_4b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_udot_idx_b, TCG_CALL_NO_RWG,
+DEF_HELPER_FLAGS_5(gvec_udot_idx_4b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_sdot_idx_h, TCG_CALL_NO_RWG,
+DEF_HELPER_FLAGS_5(gvec_sdot_idx_4h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_udot_idx_h, TCG_CALL_NO_RWG,
+DEF_HELPER_FLAGS_5(gvec_udot_idx_4h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_sudot_idx_b, TCG_CALL_NO_RWG,
+DEF_HELPER_FLAGS_5(gvec_sudot_idx_4b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(gvec_usdot_idx_b, TCG_CALL_NO_RWG,
+DEF_HELPER_FLAGS_5(gvec_usdot_idx_4b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d823036c96..dbf47595db 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6114,9 +6114,9 @@ static bool do_dot_vector_env(DisasContext *s, arg_qrrr_e *a,
     return true;
 }
 
-TRANS_FEAT(SDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_sdot_b)
-TRANS_FEAT(UDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_udot_b)
-TRANS_FEAT(USDOT_v, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usdot_b)
+TRANS_FEAT(SDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_sdot_4b)
+TRANS_FEAT(UDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_udot_4b)
+TRANS_FEAT(USDOT_v, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usdot_4b)
 TRANS_FEAT(BFDOT_v, aa64_bf16, do_dot_vector_env, a, gen_helper_gvec_bfdot)
 TRANS_FEAT(BFMMLA, aa64_bf16, do_dot_vector_env, a, gen_helper_gvec_bfmmla)
 TRANS_FEAT(SMMLA, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_smmla_b)
@@ -6876,12 +6876,12 @@ static bool do_dot_vector_idx_env(DisasContext *s, arg_qrrx_e *a,
     return true;
 }
 
-TRANS_FEAT(SDOT_vi, aa64_dp, do_dot_vector_idx, a, gen_helper_gvec_sdot_idx_b)
-TRANS_FEAT(UDOT_vi, aa64_dp, do_dot_vector_idx, a, gen_helper_gvec_udot_idx_b)
+TRANS_FEAT(SDOT_vi, aa64_dp, do_dot_vector_idx, a, gen_helper_gvec_sdot_idx_4b)
+TRANS_FEAT(UDOT_vi, aa64_dp, do_dot_vector_idx, a, gen_helper_gvec_udot_idx_4b)
 TRANS_FEAT(SUDOT_vi, aa64_i8mm, do_dot_vector_idx, a,
-           gen_helper_gvec_sudot_idx_b)
+           gen_helper_gvec_sudot_idx_4b)
 TRANS_FEAT(USDOT_vi, aa64_i8mm, do_dot_vector_idx, a,
-           gen_helper_gvec_usdot_idx_b)
+           gen_helper_gvec_usdot_idx_4b)
 TRANS_FEAT(BFDOT_vi, aa64_bf16, do_dot_vector_idx_env, a,
            gen_helper_gvec_bfdot_idx)
 
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index c4fecb8fd6..ea04336797 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -271,7 +271,7 @@ static bool trans_VSDOT(DisasContext *s, arg_VSDOT *a)
         return false;
     }
     return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
-                        gen_helper_gvec_sdot_b);
+                        gen_helper_gvec_sdot_4b);
 }
 
 static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
@@ -280,7 +280,7 @@ static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
         return false;
     }
     return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
-                        gen_helper_gvec_udot_b);
+                        gen_helper_gvec_udot_4b);
 }
 
 static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
@@ -289,7 +289,7 @@ static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
         return false;
     }
     return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
-                        gen_helper_gvec_usdot_b);
+                        gen_helper_gvec_usdot_4b);
 }
 
 static bool trans_VDOT_b16(DisasContext *s, arg_VDOT_b16 *a)
@@ -356,7 +356,7 @@ static bool trans_VSDOT_scalar(DisasContext *s, arg_VSDOT_scalar *a)
         return false;
     }
     return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
-                        gen_helper_gvec_sdot_idx_b);
+                        gen_helper_gvec_sdot_idx_4b);
 }
 
 static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
@@ -365,7 +365,7 @@ static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
         return false;
     }
     return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
-                        gen_helper_gvec_udot_idx_b);
+                        gen_helper_gvec_udot_idx_4b);
 }
 
 static bool trans_VUSDOT_scalar(DisasContext *s, arg_VUSDOT_scalar *a)
@@ -374,7 +374,7 @@ static bool trans_VUSDOT_scalar(DisasContext *s, arg_VUSDOT_scalar *a)
         return false;
     }
     return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
-                        gen_helper_gvec_usdot_idx_b);
+                        gen_helper_gvec_usdot_idx_4b);
 }
 
 static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
@@ -383,7 +383,7 @@ static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
         return false;
     }
     return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
-                        gen_helper_gvec_sudot_idx_b);
+                        gen_helper_gvec_sudot_idx_4b);
 }
 
 static bool trans_VDOT_b16_scal(DisasContext *s, arg_VDOT_b16_scal *a)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 4acd22f55e..1564ee2558 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3402,8 +3402,8 @@ DO_ZZI(UMIN, umin)
 #undef DO_ZZI
 
 static gen_helper_gvec_4 * const dot_fns[2][2] = {
-    { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
-    { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
+    { gen_helper_gvec_sdot_4b, gen_helper_gvec_sdot_4h },
+    { gen_helper_gvec_udot_4b, gen_helper_gvec_udot_4h }
 };
 TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
            dot_fns[a->u][a->sz], a->rd, a->rn, a->rm, a->ra, 0)
@@ -3413,18 +3413,18 @@ TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
  */
 
 TRANS_FEAT(SDOT_zzxw_s, aa64_sve, gen_gvec_ool_arg_zzxz,
-           gen_helper_gvec_sdot_idx_b, a)
+           gen_helper_gvec_sdot_idx_4b, a)
 TRANS_FEAT(SDOT_zzxw_d, aa64_sve, gen_gvec_ool_arg_zzxz,
-           gen_helper_gvec_sdot_idx_h, a)
+           gen_helper_gvec_sdot_idx_4h, a)
 TRANS_FEAT(UDOT_zzxw_s, aa64_sve, gen_gvec_ool_arg_zzxz,
-           gen_helper_gvec_udot_idx_b, a)
+           gen_helper_gvec_udot_idx_4b, a)
 TRANS_FEAT(UDOT_zzxw_d, aa64_sve, gen_gvec_ool_arg_zzxz,
-           gen_helper_gvec_udot_idx_h, a)
+           gen_helper_gvec_udot_idx_4h, a)
 
 TRANS_FEAT(SUDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
-           gen_helper_gvec_sudot_idx_b, a)
+           gen_helper_gvec_sudot_idx_4b, a)
 TRANS_FEAT(USDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
-           gen_helper_gvec_usdot_idx_b, a)
+           gen_helper_gvec_usdot_idx_4b, a)
 
 #define DO_SVE2_RRX(NAME, FUNC) \
     TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
@@ -7152,7 +7152,7 @@ TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
            sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
 TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           a->esz == 2 ? gen_helper_gvec_usdot_b : NULL, a, 0)
+           a->esz == 2 ? gen_helper_gvec_usdot_4b : NULL, a, 0)
 
 TRANS_FEAT_NONSTREAMING(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
                         gen_helper_crypto_aesmc, a->rd, a->rd, 0)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 616f4050e4..f18d1675b5 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -825,11 +825,11 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
     clear_tail(d, opr_sz, simd_maxsz(desc));                              \
 }
 
-DO_DOT(gvec_sdot_b, int32_t, int8_t, int8_t)
-DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
-DO_DOT(gvec_usdot_b, uint32_t, uint8_t, int8_t)
-DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
-DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
+DO_DOT(gvec_sdot_4b, int32_t, int8_t, int8_t)
+DO_DOT(gvec_udot_4b, uint32_t, uint8_t, uint8_t)
+DO_DOT(gvec_usdot_4b, uint32_t, uint8_t, int8_t)
+DO_DOT(gvec_sdot_4h, int64_t, int16_t, int16_t)
+DO_DOT(gvec_udot_4h, uint64_t, uint16_t, uint16_t)
 
 #define DO_DOT_IDX(NAME, TYPED, TYPEN, TYPEM, HD) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
@@ -865,12 +865,12 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
     clear_tail(d, opr_sz, simd_maxsz(desc));                              \
 }
 
-DO_DOT_IDX(gvec_sdot_idx_b, int32_t, int8_t, int8_t, H4)
-DO_DOT_IDX(gvec_udot_idx_b, uint32_t, uint8_t, uint8_t, H4)
-DO_DOT_IDX(gvec_sudot_idx_b, int32_t, int8_t, uint8_t, H4)
-DO_DOT_IDX(gvec_usdot_idx_b, int32_t, uint8_t, int8_t, H4)
-DO_DOT_IDX(gvec_sdot_idx_h, int64_t, int16_t, int16_t, H8)
-DO_DOT_IDX(gvec_udot_idx_h, uint64_t, uint16_t, uint16_t, H8)
+DO_DOT_IDX(gvec_sdot_idx_4b, int32_t, int8_t, int8_t, H4)
+DO_DOT_IDX(gvec_udot_idx_4b, uint32_t, uint8_t, uint8_t, H4)
+DO_DOT_IDX(gvec_sudot_idx_4b, int32_t, int8_t, uint8_t, H4)
+DO_DOT_IDX(gvec_usdot_idx_4b, int32_t, uint8_t, int8_t, H4)
+DO_DOT_IDX(gvec_sdot_idx_4h, int64_t, int16_t, int16_t, H8)
+DO_DOT_IDX(gvec_udot_idx_4h, uint64_t, uint16_t, uint16_t, H8)
 
 void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
                          float_status *fpst, uint32_t desc)
-- 
2.43.0

