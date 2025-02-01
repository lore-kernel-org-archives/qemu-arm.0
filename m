Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142936njb;
        Sat, 1 Feb 2025 08:42:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSKfHUrUwuwXmgvFRIRRAG/pesgUZPVkXtfFJiyhUHS5v87Bio+KzqDeR+iqOszDldDaCj/CNfUQkT5g==@linaro.org
X-Google-Smtp-Source: AGHT+IEeyAlBKubgsEoBvUomNbG5QoOm83WXIpeL+LP3Honl+be7scFaMV6a+fGEkAIpxqzX1N3L
X-Received: by 2002:a05:6214:19c4:b0:6d8:8b9d:1502 with SMTP id 6a1803df08f44-6e243c648b9mr180913986d6.30.1738428172020;
        Sat, 01 Feb 2025 08:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428172; cv=none;
        d=google.com; s=arc-20240605;
        b=RU7b1dcHPHUnhHbah01aZM9V85Okg/BWDNbc28oQp2l4Hnaleu/DT/zjycgls7stw9
         UClpf41uLMYvflHzAfpUb7y6DWR3zuL8v01InMEPtRMEyxPURRVuLUuZPd4jO6SCT9jE
         +YXoH3crNkZ+YqiW1ExJ+YWovVUhHASxGeIqlCIrV24IGq44UTgqD2cGz3zAz0ODPZxJ
         Ow1nSQoVwqzazFEu0JGJcArNBkVFgUh6dHjPQokHgiaZTKbkOtGq9pAF+eXgPnMGHSGh
         VsxSa+xyojsUoLGtA6s/7LsEI+kTYChf3/Yurc5fPQ9SB2E3cLkAB1OXMRcw/iT+ZCXn
         6/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g0Z2ycNCf9W70DtwUEodSWkhpWcrCzYt5vzIvDPUjeo=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=T1yrFFH3aytJZlOEIUeCEJvdM6LvaMmheeYVfHfzYpzqziB5TvP6LGMM7/ETuTX0ik
         GBQYQ8+d9C6Irn+UEw1HeSsVk8sqVPnqBr0QxueAr4ew9AaK0bKtdyUcccl+RkS58yaF
         x82JpL9G+Gnw4EEYiVPYU83o1uSc9/DA2H2MGWvSBLDZ7VKS2J01I6TiV5FODHUNJKse
         IOgWOZcEmUoItPgvfHrDnH6LQMWTHTbjB4BgsVFXwZ399qiloJfnzuKgkLqXF6gczWqm
         So09ZW01d101mU1RE0Pjj7Da6zA7XoHpDQjcSqIYwNBIOe4txRjKyKBFS0q0fz2Y8qyp
         yv4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VoFoHhy8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2549c397bsi57204246d6.378.2025.02.01.08.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VoFoHhy8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYF-0006QX-CV; Sat, 01 Feb 2025 11:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYD-0006Kp-15
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYB-0001BS-9I
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso18602745e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428054; x=1739032854; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g0Z2ycNCf9W70DtwUEodSWkhpWcrCzYt5vzIvDPUjeo=;
 b=VoFoHhy8qZZXnM6B0j8IXgeejZrqnH+sEvqGB8Ms9nquAwZ9sTU9SYi10oQKck/Bnv
 6IxMEstg/62Sd0vkthW5EkJqGkkDVjG70+IxXM6HoXshnO+I/Iu4r/3TcPsMdBdG9UIM
 RYqhzT6cSFoMgSvBTBp91HFuuVjiOskh9E2/sar5eCZ6UNMq3Hdm1O0vUdtAq/tVPRu6
 Oju17dRks1QwwKt14J/lQXL9M8p/omRXTjUbq6k0mqA098e1R3PsNtVv0Q02dtXMOgsj
 OEzzlDwBM+dyxK6D1ePSF6I/stlaIRgkd2N51aF5TIAITKOS4nRJdZ2Gz8IakqPWpANd
 j7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428054; x=1739032854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0Z2ycNCf9W70DtwUEodSWkhpWcrCzYt5vzIvDPUjeo=;
 b=h9sIQxBT6iRS77luj7jbeg7JxZcNq+wU+XfTr8rymSztWZJZHCqkYy5KSosswXrpe5
 1wkOvPcUcLHsGEfrRib1PibC1XlNJTBezMNmmLQbWBp2UP5TRVIzaf0VlH10jn51b0jp
 8J+xY+NcnFB6I2iljBx/uGM8GIV0Qs+SRPGabkbSSL61WaiyJ+EOjY6kG5HgxS+V6djf
 Y2ZRJv/ZfszO8lGysXgakbwbzSfdHvzXBWDRqGA4eSXXbHkk0mHsKq4GTztnoWgLEY7t
 dmGyG2KPaWAYP7AfZjfc3WBuP1MnPcsCO4sjNeW5oemnI0Fwj6EigwxJfHRPbkQ9m6BU
 pKeg==
X-Gm-Message-State: AOJu0YynzKaH+3+aQR7xarcCyb3vFjFRtASy4NTrVoWUoMEnjSDe13Et
 X8iMzt9oTqbDqWTeVlIecxwXmHn7ppVqoQX2Oyg+3wBciPhJhPZ6pedWyT+hG98/ZvjSNIIoVqW
 w
X-Gm-Gg: ASbGncsf1hUebn+1jZf2bcEN0vhDsVwxH6eJ502X8g+fUH7dWMxbrPQC74b2hTiqcc5
 wDboo1lem78S5EExowhwXoaxnlRtbdDsH+sqZbAZYxtUz1luTaCUJ1pW4jt6F0DyTFm0uPLaczY
 W3n3tfbvlfJHv3uuEs6KF0FUeL27GRnOrfkbhPgl0/oLpTzYJWhSNiy1N5JE7lUFw2RGxdl1Oao
 OIY9w/PvQeNAQe68ay8ekVXqNKjFIAQcxsYnlVS+KpLYbo5o27TTx3N/MOWkzub9z1QXwYz5XCT
 J+/3UG85QP2OJGrtzs/e
X-Received: by 2002:a05:600c:1913:b0:42c:b8c9:16c8 with SMTP id
 5b1f17b1804b1-438e16ebb49mr94166305e9.10.1738428053804; 
 Sat, 01 Feb 2025 08:40:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 29/69] target/arm: Implement FPCR.AH semantics for SVE
 FMIN/FMAX immediate
Date: Sat,  1 Feb 2025 16:39:32 +0000
Message-Id: <20250201164012.1660228-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: qiWDwskvGMNu

Implement the FPCR.AH semantics for the SVE FMAX and FMIN operations
that take an immediate as the second operand.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c    |  8 ++++++++
 target/arm/tcg/translate-sve.c | 25 +++++++++++++++++++++++--
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 7ca95b8fa94..3c1d2624ed4 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1231,6 +1231,20 @@ DEF_HELPER_FLAGS_6(sve_fmins_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmins_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i64, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_ah_fmaxs_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmaxs_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmaxs_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sve_ah_fmins_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmins_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmins_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+
 DEF_HELPER_FLAGS_5(sve_fcvt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(sve_fcvt_dh, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 3631d85f23a..2f6fc82ee4f 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4459,6 +4459,14 @@ DO_ZPZS_FP(sve_fmins_h, float16, H1_2, float16_min)
 DO_ZPZS_FP(sve_fmins_s, float32, H1_4, float32_min)
 DO_ZPZS_FP(sve_fmins_d, float64, H1_8, float64_min)
 
+DO_ZPZS_FP(sve_ah_fmaxs_h, float16, H1_2, helper_vfp_ah_maxh)
+DO_ZPZS_FP(sve_ah_fmaxs_s, float32, H1_4, helper_vfp_ah_maxs)
+DO_ZPZS_FP(sve_ah_fmaxs_d, float64, H1_8, helper_vfp_ah_maxd)
+
+DO_ZPZS_FP(sve_ah_fmins_h, float16, H1_2, helper_vfp_ah_minh)
+DO_ZPZS_FP(sve_ah_fmins_s, float32, H1_4, helper_vfp_ah_mins)
+DO_ZPZS_FP(sve_ah_fmins_d, float64, H1_8, helper_vfp_ah_mind)
+
 /* Fully general two-operand expander, controlled by a predicate,
  * With the extra float_status parameter.
  */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 35f6d78a0e0..187bd647c29 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3821,14 +3821,35 @@ static bool do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
     TRANS_FEAT(NAME##_zpzi, aa64_sve, do_fp_imm, a,                     \
                name##_const[a->esz][a->imm], name##_fns[a->esz])
 
+#define DO_FP_AH_IMM(NAME, name, const0, const1)                        \
+    static gen_helper_sve_fp2scalar * const name##_fns[4] = {           \
+        NULL, gen_helper_sve_##name##_h,                                \
+        gen_helper_sve_##name##_s,                                      \
+        gen_helper_sve_##name##_d                                       \
+    };                                                                  \
+    static gen_helper_sve_fp2scalar * const name##_ah_fns[4] = {        \
+        NULL, gen_helper_sve_ah_##name##_h,                             \
+        gen_helper_sve_ah_##name##_s,                                   \
+        gen_helper_sve_ah_##name##_d                                    \
+    };                                                                  \
+    static uint64_t const name##_const[4][2] = {                        \
+        { -1, -1 },                                                     \
+        { float16_##const0, float16_##const1 },                         \
+        { float32_##const0, float32_##const1 },                         \
+        { float64_##const0, float64_##const1 },                         \
+    };                                                                  \
+    TRANS_FEAT(NAME##_zpzi, aa64_sve, do_fp_imm, a,                     \
+               name##_const[a->esz][a->imm],                            \
+               s->fpcr_ah ? name##_ah_fns[a->esz] : name##_fns[a->esz])
+
 DO_FP_IMM(FADD, fadds, half, one)
 DO_FP_IMM(FSUB, fsubs, half, one)
 DO_FP_IMM(FMUL, fmuls, half, two)
 DO_FP_IMM(FSUBR, fsubrs, half, one)
 DO_FP_IMM(FMAXNM, fmaxnms, zero, one)
 DO_FP_IMM(FMINNM, fminnms, zero, one)
-DO_FP_IMM(FMAX, fmaxs, zero, one)
-DO_FP_IMM(FMIN, fmins, zero, one)
+DO_FP_AH_IMM(FMAX, fmaxs, zero, one)
+DO_FP_AH_IMM(FMIN, fmins, zero, one)
 
 #undef DO_FP_IMM
 
-- 
2.34.1

