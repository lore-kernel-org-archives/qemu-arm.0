Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp932894njk;
        Fri, 24 Jan 2025 08:39:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWiaClIIhLUwVlqbqqzYugKAqGb35iJzS31yn9BKumxOd6GWX7zTRSjvVUwLyuTcdA6jZEFSdfqlSugUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHa1kSUPNyfjdU2/4ZMVWMVOAp9MkjEhljo9o7++OmZmQ8z2IYNXxjB3J6FJbDxMDwW75pH
X-Received: by 2002:a05:622a:58f:b0:461:3653:54f with SMTP id d75a77b69052e-46e12a0cf30mr519121291cf.11.1737736756730;
        Fri, 24 Jan 2025 08:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736756; cv=none;
        d=google.com; s=arc-20240605;
        b=V4tVdzsZcv0OcFmpe8YqR0uuSHNsAmpFcj8HnL/WiDTFa9ttPYHVzcD/cVznNgOIKJ
         cmzkgG7Q/nc2oqoOZCV03hCvxUc98zCNQG4NbAHaFXqFJlh6tBQcNtAvc4WGhjSka4Mc
         ZRctg96nc0/ebGV+FE5ez+pxXG0ZC3KNH2hCnWNEOtjPsFjZPXTZA+SgjOwj07Z7A1vm
         7Zv/zucZvNMzfd6eXc4xR0yU9tJTTXpwujssZEVQZwxfD/5qGKY1yvmVnUAmXfEhWyn3
         9o1v8IkdATxhm9b15LZ1JQSERzhWwR7gLf5tdYNgCxv06NnXB6q1vE8FyEAfpK1GdnlE
         kbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LSzywg4TTdbVfL3fvcONmuOXn5s4KCgB/V3iwxmTcrs=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=jH7fe1J7ViLVLDceKEcdf7ytY0eBA8eVAUtCCwbFL6QQwl5yjCBbV9IGN8THNljU2y
         S1rA4MquJaI91zyQrP4sUUFCWi5h9wO8iykG394zc0Hu9pd1cqWaDVZs0y1rqXaL7IC9
         s/kLSHSR2G9GzYJYwPj+0B1u/J7FdyLGuluoe7UDK2g3f8EZyOP8Run/ZxUUM4HXK+8E
         4oBJyAfNliAxHvOabd5ML3SfRkuXEV8BCy2Qzehl1Nm2GKPCdvF1/xljJJW6vczIIrYr
         dIrLvY7qaYmfjU1yRmbkOcIZccF//MN2kCgcSx5wpNkNYiuFT7S3jsFvmF2auoh0K1rK
         MTkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kiv3o2B2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686d261si29886881cf.50.2025.01.24.08.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:39:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kiv3o2B2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMdw-0000zQ-Bd; Fri, 24 Jan 2025 11:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ9-0005ow-CS
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:00 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ6-0005lH-SM
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361f796586so24595075e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736191; x=1738340991; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LSzywg4TTdbVfL3fvcONmuOXn5s4KCgB/V3iwxmTcrs=;
 b=kiv3o2B2PmNEpnqFUIoao6i3ODySIYdCuGAnhiT3TtkBb1SKm8EWR83/71xFFhQB3/
 H05mtG3qsIHg7rdxxCKrw2EoYK65EoxyDuBtQVhWi2uAOH+udKXkIrVY9AfB2BC6xvc1
 vijb+0DfBfQfmUbYpsDu4+FXnL9Q23ZAPWObFUwUja1anqj0Kj1o2hpmHN0ZwJb/5339
 k9ofUkH5I9ZjhRaP1JURiXCLE8gHLQXvXrDrrV9ROg75h5LjdBOCzSJlRKqBFcKWe6CE
 fZy7+dPyTKyTcDNgViXCsJ7Z3a3Gdw93m63JH/W0tVVANvjJ7pJDEY7IKEQoRg8O9NH2
 bwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736191; x=1738340991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LSzywg4TTdbVfL3fvcONmuOXn5s4KCgB/V3iwxmTcrs=;
 b=bXfmNLsBmNsQHhR63EhzR/h/l0zEM9w7uNywm+Sqzcmi+FjklVWERJ9SizsIaqQnEI
 NRo19r4ZWqfn8sZV6FZusXIoKlyohghaK3ESABkphVfxHorlOndUVuuJ0TVjgidnGLuD
 Mxj25TqO+8PdsmILlLLQFNNTOtL8wNdkGBlXYJ3SWftrLzxq0ZEgvEkoZS9gEtWHNmHZ
 mRt4h9OXcENGZI6AsGkIgtHKksWXm8aZy6TjH+ZjWbY4fV7AjMc6rFil6Rqmmf+RZc0d
 QRp82Vl3EI3syeFg4f29gccJyit2DHgIWSviM00gXo1zfH5ykQenXNsQwsGEcIhLfeNm
 Vh3A==
X-Gm-Message-State: AOJu0Ywk79EbkEo2xg48sW0hMajmtfHK2XLDNSG6XNFgY0oelQQfyD7s
 7NslLxVfnJSq9MVscz0bHTw1uP1BB651uueEj0GpvivYsz+LebkpAeaKB+33IOuIdD3ZSaX9pq9
 5
X-Gm-Gg: ASbGnct0orDX0KELWKalpzqcEmGmxtTdAf5HqyB1tXLcHL2IrjTkj/Tcxr0U7UuePka
 tNnTSDPwQqt92VDK31IlK+YD5QC+lYNa5TrCFRrQF+d4AHXE73+oNAYvLnIAkKhiIEdb4auyH/S
 AyURuYxs2Ci4x5reJIRd+U0ZsaGM1G3hJg2UNBlc+BGSni5YOnmQ+jSuowQFjKmbYOyRp+MB3fY
 CVoGX2ECEb7Oo+h2ZarhYGtok3s0hwDKJAVhQ3mYhqFbPKBR2BRhkaQEX+geeRwM6kWtcqYxsTr
 NpXWR88onag=
X-Received: by 2002:a05:600c:8712:b0:434:a802:e9a6 with SMTP id
 5b1f17b1804b1-438913ce0b7mr315490555e9.7.1737736191105; 
 Fri, 24 Jan 2025 08:29:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 58/76] target/arm: Handle FPCR.AH in negation steps in FCADD
Date: Fri, 24 Jan 2025 16:28:18 +0000
Message-Id: <20250124162836.2332150-59-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: 35Zh0Dl3H6Tm

The negation steps in FCADD must honour FPCR.AH's "don't change the
sign of a NaN" semantics.  Implement this by encoding FPCR.AH into
the SIMD data field passed to the helper and using that to decide
whether to negate the values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 10 +++++++--
 target/arm/tcg/vec_helper.c    | 39 ++++++++++++++++++++++++++++------
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ce9ab75bc2f..0827dff16b2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6117,8 +6117,14 @@ static gen_helper_gvec_3_ptr * const f_vector_fcadd[3] = {
     gen_helper_gvec_fcadds,
     gen_helper_gvec_fcaddd,
 };
-TRANS_FEAT(FCADD_90, aa64_fcma, do_fp3_vector, a, 0, f_vector_fcadd)
-TRANS_FEAT(FCADD_270, aa64_fcma, do_fp3_vector, a, 1, f_vector_fcadd)
+/*
+ * Encode FPCR.AH into the data so the helper knows whether the
+ * negations it does should avoid flipping the sign bit on a NaN
+ */
+TRANS_FEAT(FCADD_90, aa64_fcma, do_fp3_vector, a, 0 | (s->fpcr_ah << 1),
+           f_vector_fcadd)
+TRANS_FEAT(FCADD_270, aa64_fcma, do_fp3_vector, a, 1 | (s->fpcr_ah << 1),
+           f_vector_fcadd)
 
 static bool trans_FCMLA_v(DisasContext *s, arg_FCMLA_v *a)
 {
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 3b87e5b8d6d..382b5da4a9c 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -881,6 +881,7 @@ void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
     float16 *m = vm;
     uint32_t neg_real = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t neg_imag = neg_real ^ 1;
+    bool fpcr_ah = extract64(desc, SIMD_DATA_SHIFT + 1, 1);
     uintptr_t i;
 
     /* Shift boolean to the sign bit so we can xor to negate.  */
@@ -889,9 +890,17 @@ void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
 
     for (i = 0; i < opr_sz / 2; i += 2) {
         float16 e0 = n[H2(i)];
-        float16 e1 = m[H2(i + 1)] ^ neg_imag;
+        float16 e1 = m[H2(i + 1)];
         float16 e2 = n[H2(i + 1)];
-        float16 e3 = m[H2(i)] ^ neg_real;
+        float16 e3 = m[H2(i)];
+
+        /* FPNeg() mustn't flip sign of a NaN if FPCR.AH == 1 */
+        if (!(fpcr_ah && float16_is_any_nan(e1))) {
+            e1 ^= neg_imag;
+        }
+        if (!(fpcr_ah && float16_is_any_nan(e3))) {
+            e3 ^= neg_real;
+        }
 
         d[H2(i)] = float16_add(e0, e1, fpst);
         d[H2(i + 1)] = float16_add(e2, e3, fpst);
@@ -908,6 +917,7 @@ void HELPER(gvec_fcadds)(void *vd, void *vn, void *vm,
     float32 *m = vm;
     uint32_t neg_real = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t neg_imag = neg_real ^ 1;
+    bool fpcr_ah = extract64(desc, SIMD_DATA_SHIFT + 1, 1);
     uintptr_t i;
 
     /* Shift boolean to the sign bit so we can xor to negate.  */
@@ -916,9 +926,17 @@ void HELPER(gvec_fcadds)(void *vd, void *vn, void *vm,
 
     for (i = 0; i < opr_sz / 4; i += 2) {
         float32 e0 = n[H4(i)];
-        float32 e1 = m[H4(i + 1)] ^ neg_imag;
+        float32 e1 = m[H4(i + 1)];
         float32 e2 = n[H4(i + 1)];
-        float32 e3 = m[H4(i)] ^ neg_real;
+        float32 e3 = m[H4(i)];
+
+        /* FPNeg() mustn't flip sign of a NaN if FPCR.AH == 1 */
+        if (!(fpcr_ah && float32_is_any_nan(e1))) {
+            e1 ^= neg_imag;
+        }
+        if (!(fpcr_ah && float32_is_any_nan(e3))) {
+            e3 ^= neg_real;
+        }
 
         d[H4(i)] = float32_add(e0, e1, fpst);
         d[H4(i + 1)] = float32_add(e2, e3, fpst);
@@ -935,6 +953,7 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
     float64 *m = vm;
     uint64_t neg_real = extract64(desc, SIMD_DATA_SHIFT, 1);
     uint64_t neg_imag = neg_real ^ 1;
+    bool fpcr_ah = extract64(desc, SIMD_DATA_SHIFT + 1, 1);
     uintptr_t i;
 
     /* Shift boolean to the sign bit so we can xor to negate.  */
@@ -943,9 +962,17 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
 
     for (i = 0; i < opr_sz / 8; i += 2) {
         float64 e0 = n[i];
-        float64 e1 = m[i + 1] ^ neg_imag;
+        float64 e1 = m[i + 1];
         float64 e2 = n[i + 1];
-        float64 e3 = m[i] ^ neg_real;
+        float64 e3 = m[i];
+
+        /* FPNeg() mustn't flip sign of a NaN if FPCR.AH == 1 */
+        if (!(fpcr_ah && float64_is_any_nan(e1))) {
+            e1 ^= neg_imag;
+        }
+        if (!(fpcr_ah && float64_is_any_nan(e3))) {
+            e3 ^= neg_real;
+        }
 
         d[i] = float64_add(e0, e1, fpst);
         d[i + 1] = float64_add(e2, e3, fpst);
-- 
2.34.1

