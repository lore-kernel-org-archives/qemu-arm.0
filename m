Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3709345qtb;
        Wed, 2 Jul 2025 05:44:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHJS94RGVknGTj5xqKTJCk08wu+Dewiar4eQsIAZQKYYkh1RkoFVJBNwtIfouJvuPqabU3dLGIDn71Jw==@linaro.org
X-Google-Smtp-Source: AGHT+IEAccUSeUgTbcvLF1RiJgc2hkE6ti2LgyzzPFdRgQAx6e82kBTErW1n8pyFQLb4zMC7y1pf
X-Received: by 2002:a05:622a:58cd:b0:4a9:8299:4e00 with SMTP id d75a77b69052e-4a982995084mr12226861cf.0.1751460255157;
        Wed, 02 Jul 2025 05:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460255; cv=none;
        d=google.com; s=arc-20240605;
        b=BXr2OJga2jsNqYftLc41zj22r2AqLSJecEbhQDA31q1EBmSWT/D00l1Z++QBaWuLre
         bgnvNTahzXuGoLjewwv4e7EofNN1QFi6jh7aj2Lql2gHc7MZsBmK+eGCBhgbQVFa1prQ
         AYjAj5dZ5cvFD3w9ZUt66fgXvgV+2h2vygYefRpXCT6Y0/quw221muPE26j9bf2q4rZ2
         mYrYpBlDp2HrzzXpO6F1fnliZTcfOHJDh2zSrbHQhw0X3Ii29U0KK13Mu+C4oEkj2+hv
         mylczON3d0rE6U9sztqrLxJEBknGRy+L25xfePZ5ZAODabfUyzYzmkG0eEhtjP4hYdZE
         4SdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q/QW4rvvSlRYUOvJz/3VC/Udpmrllc2HxgtJfrDHdcw=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=kEgXLCY1BMm2nh6nTa3QzJ8AInPhrUCvMCIuQeEZXJDRPq8DuBie4wjGYvmmUbbA5d
         zS8vu4cV/t5wBigia8q9yiOGtqUZdtAvUDPFiSfGG+g9DZHjM7GVuu5rEvvmoFKHmsuC
         FjereHm0v8Riv38oX1La5M8bLj5ddOblvJAE+/cMCJePJ2DZxI2DPhuVdv2L4rnRpUUL
         R4mfAgJNTA4GLZae3799ixcVa62CmBkYGTI9VfkEfeolddlRGXuFoNGm9Ky2Z44GbyFy
         bHzFpeq2FvSlvfSwdugsC3kYLN/i9rsP90tMNy3+YWwJhTo768QPIyFa0BxiiDmnM0DM
         CAxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aCNjSoRW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc552fbcsi121996531cf.532.2025.07.02.05.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aCNjSoRW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwgl-0000Y4-DU; Wed, 02 Jul 2025 08:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgB-00083o-QN
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:12 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwft-00016a-0C
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:11 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2ea2fee5471so3668411fac.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459690; x=1752064490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/QW4rvvSlRYUOvJz/3VC/Udpmrllc2HxgtJfrDHdcw=;
 b=aCNjSoRWWmBP08DrvhzUetssudyhchGhGSO+MtDfDgB67AnzjO+GyLFrHdvBzffnCw
 ActuyEmkUKTPy9hEA9yqqLA5dU1Z+goxPAksy8+bMBipWBsWtfN9rGGzO+LUEtOdGCHU
 L/Tm3YovBWEeXS7HkkPI8pUeUj7CXoMjfSVF2P1pg3Ah2Y0wbRJCOZ/CzwXhxzY0iTTD
 VfpAZNvRwTEG3u5USKNC3jsl8kOHl5Mb3J0En5rUehyyfmxleZqFr3U8hULzjB7E55Uf
 bKLfds8Esbcv5jRL7C4IVtYocuy231vvdUu5REqkaFwpWQc51WTjqkel/JYe6FvtGkOl
 GEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459690; x=1752064490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/QW4rvvSlRYUOvJz/3VC/Udpmrllc2HxgtJfrDHdcw=;
 b=uaEtc/jT7Fx5KHmz3bvnqmSHPvrNXV7nbtw5kHUucRijSiCEUjuEMt/HCcWE977T4O
 NpeYC/3OpUaQRtcASbOYInJ/GXOOW4mnLMIYsMNfoXTvxSzbCNs7heClo5UfXQK373CF
 MZq/ZqJh8Onen257Jk/+kr3U7hL3k/HQmC0zpZwUA8S/XnvCuOfkhRSDuUlP6KySxe9j
 j8d/AwU+RrQ9fZmAWgOCbB16V1nXFb0AuQvOJ1TbwD/6rb1eqfuojOvLOYa9+eNNKDju
 rzOSf8sK3aoEYS0Xokvrvj08u2qXxYJ/UAqv+Q0Ew68aYBSVp14arc3up35XZRJO4zmT
 jsfQ==
X-Gm-Message-State: AOJu0YwTtzwbvlA9sCQTVVtLyF3nNSsWlPysm7ZDVhk+mZTBbheI5whq
 o2z0WE6PC9mUJKzPck9zixsT6kzH7vJF+vVIov4HWQ2pMDZzvoBcFh2W1R+Js3ePfI4=
X-Gm-Gg: ASbGncs1dFTbR9nO07saVwW12/Jj1GmRiGqAoMFe1izr12BMFaU5gtr056Jzqwgspnr
 QcpD+A+LCHi6sNqSRQ3lNM7J/xfkMxJXWXbUoyhN6VjZngTLIOtQxbTUpvUTdIfcL07Wz0AXZj7
 jSP1qhvKAIhCefGLlrHaqmo0XhE8H2eqa58B9HJ+sOKkFs0JlzeBNihTUxfY2l+524w+lcaoacW
 /QsNf6hOtCqz5PSQQ09cqlpW+68MB0e8zOY23pYTHFLpWtpwBwPsIEigb8HaENOca7Qqt34cJ3a
 YgqPsLr8Y27hU59l0gs7GqJRCh7hE7hp3DSHEGlb7GlALTqMjeqf0rVuOFRYepfjxgub2A==
X-Received: by 2002:a05:687c:2010:10b0:2b8:608d:5dd1 with SMTP id
 586e51a60fabf-2f6649e9bcdmr1195995fac.18.1751459690133; 
 Wed, 02 Jul 2025 05:34:50 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 30/97] target/arm: Rename helper_gvec_*dot_[bh] to *_4[bh]
Date: Wed,  2 Jul 2025 06:33:03 -0600
Message-ID: <20250702123410.761208-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
X-TUID: w4W1r0RiPgPD

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
index 11abddee52..bf2272e449 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6116,9 +6116,9 @@ static bool do_dot_vector_env(DisasContext *s, arg_qrrr_e *a,
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
@@ -6878,12 +6878,12 @@ static bool do_dot_vector_idx_env(DisasContext *s, arg_qrrx_e *a,
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
index 130f040f7b..4fedaa7293 100644
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

