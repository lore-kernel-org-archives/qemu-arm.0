Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142409njb;
        Sat, 1 Feb 2025 08:41:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZQWNIsuomUuyrRtNdTH84DZ/whEV74avitdH9OW9FlmmW2e+EgAKRdkCWZfUI3wzwpCezr4+3mNLxmA==@linaro.org
X-Google-Smtp-Source: AGHT+IFVbXS1ifU8JtdBPktbCX/N5CoT1o2F5RjAD0XbGBgIuqGCm8UHZs2QykqMn3l9usIsYGdC
X-Received: by 2002:a05:622a:1b1d:b0:467:5f8c:94b6 with SMTP id d75a77b69052e-46fd0b687afmr245172571cf.35.1738428109240;
        Sat, 01 Feb 2025 08:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428109; cv=none;
        d=google.com; s=arc-20240605;
        b=OQ+5q5Dg2LRVZs8EvSGzjWWmf1QzKo0L5Pm37ceC4mu4YUIhM4pysrCQJLyhzucXAj
         fiS5T3HehgCJKgsVqyxhvVUZZUDMbCsDXJOP+PbJTkN8W3rqK6qnnVvNts4Tr/Yj1uRT
         y5QP8aqmF0n5gXeLS34a4QhbOvf/Qvb6yF9VXKxk1J/XY+opGm1faLwrQKPvjFnassjj
         b83cmwvCRrSD2/l0AdfXKp/WR+9VPYLjtLAm9YsSlitf/A2BpHFJOVKZiAc3Hh3A89f1
         QPLxPe0c1z+qSpWsKRRXZOFDM/blodiJV3/Un7haRhAiFUmdd+/c+cEu1NdMHIt/LeBs
         epvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OQ8+UEDyF+vR9XVEdsyAorb54BbrDnxn4gmI2dF7CEQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=HQAGQ3od3mcA2f1OvOeeVn17wfEddgiPB4lhg7eVTl4UH3gx4HgnnxhFMgP2h9XEXz
         ROwFAWwkFSeNKRgUX6eVbN6J/mCMeIW2F2W4+EYOMEhMPuIdL4lWLSP2DH8pyJRh1mMj
         eAm69xGqDpV4oZZO8XIZEGk26WYin4hnE+9fLYzaWgd0zuOvAhw7zzRC7kTpEujxuaMN
         gieMDPbsQUn+pigce9ZrZc/oC5EI6Mdkyk70QyyGYNJf0hRakibGm9kSQk7jei4sumvO
         crUflOhOOrVE/J3vuZ6cJR10qMwrKnoD7OZXM7qFErjNasHKdQ5JryOPE5Fxdm9U6Ay9
         lzqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKtPtvQX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1e195asi62220731cf.480.2025.02.01.08.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:41:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKtPtvQX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYE-0006Or-GC; Sat, 01 Feb 2025 11:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYD-0006Ko-0X
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:57 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYA-0001BG-9T
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361c705434so22420825e9.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428053; x=1739032853; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OQ8+UEDyF+vR9XVEdsyAorb54BbrDnxn4gmI2dF7CEQ=;
 b=SKtPtvQXhZFFp3POiSBJDMHYTbKpenYEMSsT8pebQZshM5e2n3VOoHoGcoWVghsPyp
 TydXmWaTTCrqgTI8I68svkid5HQWNCizguaAB4kv/CwNWFbQpSpWLOQf78GrYo6i9HEU
 3gAgNaDj5qbdD+ZP89isHgPOrkdl1qUY/3mYodCpk6YdS2byenulBSzHSvqqiXMY+lcI
 eLK1yk1QM3flT9OHk2i4upaNAROG0lzMaXtg5xdclPdrw35m62z6Kz32bCzs/uUntNiz
 SpnLmZT7QWnQFE8RIxYwiFhWJ9AuCQ98z+83gwAza50GwIsFsSZ7JIzqFnCyjb5TKNlx
 czZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428053; x=1739032853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQ8+UEDyF+vR9XVEdsyAorb54BbrDnxn4gmI2dF7CEQ=;
 b=ugfnjH5X8XBYF9DR5zLExIj2j6o2sgCFxrc+TDyBfQY4PgEnDW7Gwe0aFk7boi17ig
 pyyuWLpG1ZxUBH1z3nwbp8GDsGR8eeGwwsR9lzahkrU/fuP3PqKp5o2aMEBrNFPn+ojV
 YkhS9tIu1En/WWTeuFEpgbEsrGFJuy0tvuj4Nw9/5PlnOGDkHqaZ7LkDzee1vKGt8Kfo
 AuY+zDS0pPhwIUsnuP1nNsJ5S+gAM2d+Ri+ilojdnOSrH6P7NFrOijiL21TyOYWGdjBx
 gdtutyH0B6amcGpkHoYphGq80XF0WHIOZtq/+FNFniMUElz4E32e8rDIzWzHwm4GPKb3
 /IBg==
X-Gm-Message-State: AOJu0YwN2ph6RrTjLD4fotU9kgKA7QQDdEyepOarDITUS3gx4Q2dMBO6
 jVt7b4/FiDCBy3jXnOqdedCt1JXmKYDtUGUa0zUBPayyVNJ/5aHdTEyq36KXDM8s1o2XC6zDMT+
 O
X-Gm-Gg: ASbGncvZG65riAAmJMOYi3U8BQ2ccsYc7wun5XvvmYjLJ4Cif+RYLGirJfBoYh8+efQ
 +g/nANXLXosZH6TOtddY7GdoxPxPl+U/rgsv+/v2Jh9AnbH+/4cUeUlJoFvvQ1JOABx22FDTP+g
 P/oWIbZZE/hXhmXPUDAmRWcdJrkPB2P+OtNo33ftQhgIbmzc/H+cqpSVYA+BxoUaK2PJx2N+axR
 Go5iV0yDrTrmTFuQgMC6LQoLK1Awu0VukE3hPRiAcEQUclWpzdgZEudG4u3ENvduz8BL/qCLoRj
 XCcZWOIWoNEOf2tH9MyN
X-Received: by 2002:a5d:4e86:0:b0:386:2a3b:8aa with SMTP id
 ffacd0b85a97d-38c5209000bmr10304700f8f.37.1738428052817; 
 Sat, 01 Feb 2025 08:40:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 28/69] target/arm: Implement FPCR.AH semantics for SVE
 FMAXV and FMINV
Date: Sat,  1 Feb 2025 16:39:31 +0000
Message-Id: <20250201164012.1660228-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: /5esaGGdp8J6

Implement the FPCR.AH semantics for the SVE FMAXV and FMINV
vector-reduction-to-scalar max/min operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 14 +++++++++++
 target/arm/tcg/sve_helper.c    | 43 +++++++++++++++++++++-------------
 target/arm/tcg/translate-sve.c | 16 +++++++++++--
 3 files changed, 55 insertions(+), 18 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 8349752e99b..7ca95b8fa94 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1035,6 +1035,20 @@ DEF_HELPER_FLAGS_4(sve_fminv_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_4(sve_fminv_d, TCG_CALL_NO_RWG,
                    i64, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_4(sve_ah_fmaxv_h, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sve_ah_fmaxv_s, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sve_ah_fmaxv_d, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_4(sve_ah_fminv_h, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sve_ah_fminv_s, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sve_ah_fminv_d, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_5(sve_fadda_h, TCG_CALL_NO_RWG,
                    i64, i64, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(sve_fadda_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 9837c5bc7ac..3631d85f23a 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4190,7 +4190,7 @@ static TYPE NAME##_reduce(TYPE *data, float_status *status, uintptr_t n) \
         uintptr_t half = n / 2;                                       \
         TYPE lo = NAME##_reduce(data, status, half);                  \
         TYPE hi = NAME##_reduce(data + half, status, half);           \
-        return TYPE##_##FUNC(lo, hi, status);                         \
+        return FUNC(lo, hi, status);                                  \
     }                                                                 \
 }                                                                     \
 uint64_t HELPER(NAME)(void *vn, void *vg, float_status *s, uint32_t desc) \
@@ -4211,26 +4211,37 @@ uint64_t HELPER(NAME)(void *vn, void *vg, float_status *s, uint32_t desc) \
     return NAME##_reduce(data, s, maxsz / sizeof(TYPE));              \
 }
 
-DO_REDUCE(sve_faddv_h, float16, H1_2, add, float16_zero)
-DO_REDUCE(sve_faddv_s, float32, H1_4, add, float32_zero)
-DO_REDUCE(sve_faddv_d, float64, H1_8, add, float64_zero)
+DO_REDUCE(sve_faddv_h, float16, H1_2, float16_add, float16_zero)
+DO_REDUCE(sve_faddv_s, float32, H1_4, float32_add, float32_zero)
+DO_REDUCE(sve_faddv_d, float64, H1_8, float64_add, float64_zero)
 
 /* Identity is floatN_default_nan, without the function call.  */
-DO_REDUCE(sve_fminnmv_h, float16, H1_2, minnum, 0x7E00)
-DO_REDUCE(sve_fminnmv_s, float32, H1_4, minnum, 0x7FC00000)
-DO_REDUCE(sve_fminnmv_d, float64, H1_8, minnum, 0x7FF8000000000000ULL)
+DO_REDUCE(sve_fminnmv_h, float16, H1_2, float16_minnum, 0x7E00)
+DO_REDUCE(sve_fminnmv_s, float32, H1_4, float32_minnum, 0x7FC00000)
+DO_REDUCE(sve_fminnmv_d, float64, H1_8, float64_minnum, 0x7FF8000000000000ULL)
 
-DO_REDUCE(sve_fmaxnmv_h, float16, H1_2, maxnum, 0x7E00)
-DO_REDUCE(sve_fmaxnmv_s, float32, H1_4, maxnum, 0x7FC00000)
-DO_REDUCE(sve_fmaxnmv_d, float64, H1_8, maxnum, 0x7FF8000000000000ULL)
+DO_REDUCE(sve_fmaxnmv_h, float16, H1_2, float16_maxnum, 0x7E00)
+DO_REDUCE(sve_fmaxnmv_s, float32, H1_4, float32_maxnum, 0x7FC00000)
+DO_REDUCE(sve_fmaxnmv_d, float64, H1_8, float64_maxnum, 0x7FF8000000000000ULL)
 
-DO_REDUCE(sve_fminv_h, float16, H1_2, min, float16_infinity)
-DO_REDUCE(sve_fminv_s, float32, H1_4, min, float32_infinity)
-DO_REDUCE(sve_fminv_d, float64, H1_8, min, float64_infinity)
+DO_REDUCE(sve_fminv_h, float16, H1_2, float16_min, float16_infinity)
+DO_REDUCE(sve_fminv_s, float32, H1_4, float32_min, float32_infinity)
+DO_REDUCE(sve_fminv_d, float64, H1_8, float64_min, float64_infinity)
 
-DO_REDUCE(sve_fmaxv_h, float16, H1_2, max, float16_chs(float16_infinity))
-DO_REDUCE(sve_fmaxv_s, float32, H1_4, max, float32_chs(float32_infinity))
-DO_REDUCE(sve_fmaxv_d, float64, H1_8, max, float64_chs(float64_infinity))
+DO_REDUCE(sve_fmaxv_h, float16, H1_2, float16_max, float16_chs(float16_infinity))
+DO_REDUCE(sve_fmaxv_s, float32, H1_4, float32_max, float32_chs(float32_infinity))
+DO_REDUCE(sve_fmaxv_d, float64, H1_8, float64_max, float64_chs(float64_infinity))
+
+DO_REDUCE(sve_ah_fminv_h, float16, H1_2, helper_vfp_ah_minh, float16_infinity)
+DO_REDUCE(sve_ah_fminv_s, float32, H1_4, helper_vfp_ah_mins, float32_infinity)
+DO_REDUCE(sve_ah_fminv_d, float64, H1_8, helper_vfp_ah_mind, float64_infinity)
+
+DO_REDUCE(sve_ah_fmaxv_h, float16, H1_2, helper_vfp_ah_maxh,
+          float16_chs(float16_infinity))
+DO_REDUCE(sve_ah_fmaxv_s, float32, H1_4, helper_vfp_ah_maxs,
+          float32_chs(float32_infinity))
+DO_REDUCE(sve_ah_fmaxv_d, float64, H1_8, helper_vfp_ah_maxd,
+          float64_chs(float64_infinity))
 
 #undef DO_REDUCE
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e38a49dd31c..35f6d78a0e0 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3588,11 +3588,23 @@ static bool do_reduce(DisasContext *s, arg_rpr_esz *a,
     };                                                                   \
     TRANS_FEAT(NAME, aa64_sve, do_reduce, a, name##_fns[a->esz])
 
+#define DO_VPZ_AH(NAME, name)                                            \
+    static gen_helper_fp_reduce * const name##_fns[4] = {                \
+        NULL,                      gen_helper_sve_##name##_h,            \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,            \
+    };                                                                   \
+    static gen_helper_fp_reduce * const name##_ah_fns[4] = {             \
+        NULL,                      gen_helper_sve_ah_##name##_h,         \
+        gen_helper_sve_ah_##name##_s, gen_helper_sve_ah_##name##_d,      \
+    };                                                                   \
+    TRANS_FEAT(NAME, aa64_sve, do_reduce, a,                             \
+               s->fpcr_ah ? name##_ah_fns[a->esz] : name##_fns[a->esz])
+
 DO_VPZ(FADDV, faddv)
 DO_VPZ(FMINNMV, fminnmv)
 DO_VPZ(FMAXNMV, fmaxnmv)
-DO_VPZ(FMINV, fminv)
-DO_VPZ(FMAXV, fmaxv)
+DO_VPZ_AH(FMINV, fminv)
+DO_VPZ_AH(FMAXV, fmaxv)
 
 #undef DO_VPZ
 
-- 
2.34.1

