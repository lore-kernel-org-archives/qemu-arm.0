Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1146461njb;
        Sat, 1 Feb 2025 08:50:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUN7GZ+Bst1jCJEnOTFCEvnjmxDMcRnXxbXXYKho7U12CL9f6n5TlY8+l7OexteW8ZbtT7/FWhcKQgFaA==@linaro.org
X-Google-Smtp-Source: AGHT+IFH5ZRKT2AfqgHTHwzEiaqWEyMiaCG4oTXEkXLHu3OOKDSlwWhxYW6ZpxpwGGwN0CSptF+B
X-Received: by 2002:a05:622a:4247:b0:467:7315:c63d with SMTP id d75a77b69052e-46fdd410f6dmr196521821cf.23.1738428647915;
        Sat, 01 Feb 2025 08:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428647; cv=none;
        d=google.com; s=arc-20240605;
        b=XDIzafjW9MgETnpgw3oE8rkmydFMCNdgYK8HrZiD9OCNzVdZ0Ku0OODyUoOD+g6c1Q
         IM6X2Hw9dRZ01NaIfC1idEqVnxcyHHTbBqrFXPEZJk+EJpUVdXc5ILiaa9ZZs0lsiNWP
         xPVrcFWwW9rhysVYJET9CVYpNTQ5kMVRaxNBWDfCNyuBm8nIwlCcMiucOC98yKu0Kcoh
         KJwDcnISdYQJhiefqQh4x+LQZDO8h+zCMJXcAU1Laup4/ROK3Z50HpU/Qri8YqUfI6Fg
         T3NvWl4qvI4r+qfazScfmFnykxv1Iaeeb16ZgGbHH4SjhznnOjr5h+4kjw5VMDcQH3CR
         bFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L1QYI0D4p66Pum4l+58PbL3+zO6baG6TxTbxDOLkOT8=;
        fh=6fXXUMggggaqs2wrbazUJGC1go0RQo0eRUuJ45jLLyo=;
        b=X61myY3Dra78kPomegzWKVnsad+6ynelj5hLEXJChn3UoGHlVDNdFMvOWsH6XKMs7U
         /H8BQ7Dlk1i0cSSgVrBwtun0MFmIn24YDWpVrRQUQnV2ktvrnz32XC0/+YW3Yy66JcTz
         DezjSSDNvmuqp6OJCBae6tqSRgJThumg6tFPbVhrz2VNPxZh0sWNWdc5V0Lzw10DxnGI
         yIeeA+JGOkjLvA7rOIbe7Extif8fBaLGzfWpvNpHGMFR9yi8vlqIT7QJNGrAVgY3RS+i
         UwJZL4/gscsFMDoER9KQxJfol3znyQHcmWuxSnBo+qsFlyVfzvQN+HBasPqHvbhSNCQd
         aydQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ViZ/ad3C";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1ba3besi65298941cf.228.2025.02.01.08.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ViZ/ad3C";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1teGYL-0006aP-Bh; Sat, 01 Feb 2025 11:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYJ-0006VN-20
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 11:41:03 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYH-0001D6-90
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 11:41:02 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so35179075e9.2
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2025 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428060; x=1739032860; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L1QYI0D4p66Pum4l+58PbL3+zO6baG6TxTbxDOLkOT8=;
 b=ViZ/ad3CBruGIkx4csxcmgeZxkiDeR00TKdMLFmg+zpvLxrAE88gdue19wISZt7qU0
 Fpl7KX+xJVPIXLMQhEdRzIWADoA5YHEQF791ndc+c6WKJ9LHwqr7ARqSMjUYE+HHWu4D
 1ueR0Qcxzb3zQzJAq1vmx3t86aC45gZUXalqAZKUJo02DKHjl8lI3s4r7JjE8tUWgong
 PmyRm0FSO03lUKs7AJpqkNzVnq4j5Y6U2b1yd4hLaHddaSGnsTxusAv0waRpJT+uez5p
 lDaQXnlTNx83S9ofZDjmYbGyPDoOOTuSA/wjcvG+xTrIwLD/gtaRsB/npZh+OBJVycKX
 pEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428060; x=1739032860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1QYI0D4p66Pum4l+58PbL3+zO6baG6TxTbxDOLkOT8=;
 b=LweCq+AZlaVz6BLZccrLl8TyLouePFYYIwV77+Wa19ACg/no/ffv72A6LYKpmzRt3U
 08u5TXo2NKS9rmrSxVGWa4EzNID2v/Diplhll3Dsple2Ucw94d6dlAjZywFZmqpO+AMl
 Nie/vjcAoGwpNKxY4uj+lt25WZZuSBdymqdQ+KtGBhEYjlJ/ZPwKsZc2I0irsd0gxP2X
 dIeFj5+lMOybS4lOdznWjBnitWGN63t2kzDlmV5VoVCVwADbfHCqiRyIz56UZwanoPTR
 YPwMOPqow5HVDFuP5jyi5vF3cMBrNrAP7Zt22qTEU3Zq9ic5MeLsflwmI0irXFS3zfJI
 yDaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUlkVFyz7bQN8wHo3pmsMD9uljLmxHsKRd3lE9rnn+U6qtt61i38X8Hq/JFyqa9thrNEJm/peMHUn/@nongnu.org
X-Gm-Message-State: AOJu0YzuzGkCxqJK7C+iQodY3Zzq0fCvyphHZ5DUSMLunq2cEGOKLXJ7
 nGNDSf95XFxSoV9MpwDgcFMddaFSbZQZT8adoaMxYOXD0w5huLovDdaOXG9rOfivnVjq3lgNubG
 p
X-Gm-Gg: ASbGnctXWXp0bwH54T+6KYT6P+1h0SbFfuyWpbShhGrcO70h3070Od+Yyga2Qn2WVgu
 JYQRqzPL12G5wVg2kh2ukuB9Jd6XW/prUoJGBA/cmhmDfM51cagHTXx5cfcPBD5w7fk+djG0thj
 I+5B2BBL4mfln5doDKMk1ihpMRECvhBfEetTj6kPLy6LnhlbjnO8XpbwbALMbngmTDPe0jHXZhQ
 QMi5SpGTvJDVKYJAFUnnUnUHd32v6slHQpkWTDChzQnn0WG0jShovOOsFqmGdhDRNH15BFKa1SG
 0n4+T8GBswXoULIJgLFV
X-Received: by 2002:a05:600c:458e:b0:434:f739:7cd9 with SMTP id
 5b1f17b1804b1-438dc3c270dmr146841845e9.9.1738428059813; 
 Sat, 01 Feb 2025 08:40:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 33/69] target/arm: Handle FPCR.AH in vector FABD
Date: Sat,  1 Feb 2025 16:39:36 +0000
Message-Id: <20250201164012.1660228-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lRsec10+xvKz

Split the handling of vector FABD so that it calls a different set
of helpers when FPCR.AH is 1, which implement the "no negation of
the sign of a NaN" semantics.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  4 ++++
 target/arm/tcg/translate-a64.c |  7 ++++++-
 target/arm/tcg/vec_helper.c    | 23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 15bad0773c0..43505d5fedc 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -722,6 +722,10 @@ DEF_HELPER_FLAGS_5(gvec_fabd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fabd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fabd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_ah_fabd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fabd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fabd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_5(gvec_fceq_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fceq_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fceq_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 862f7333982..0c1e97e6c40 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5899,7 +5899,12 @@ static gen_helper_gvec_3_ptr * const f_vector_fabd[3] = {
     gen_helper_gvec_fabd_s,
     gen_helper_gvec_fabd_d,
 };
-TRANS(FABD_v, do_fp3_vector, a, 0, f_vector_fabd)
+static gen_helper_gvec_3_ptr * const f_vector_ah_fabd[3] = {
+    gen_helper_gvec_ah_fabd_h,
+    gen_helper_gvec_ah_fabd_s,
+    gen_helper_gvec_ah_fabd_d,
+};
+TRANS(FABD_v, do_fp3_vector_2fn, a, 0, f_vector_fabd, f_vector_ah_fabd)
 
 static gen_helper_gvec_3_ptr * const f_vector_frecps[3] = {
     gen_helper_gvec_recps_h,
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 61e6e54570c..0b84a562c03 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1302,6 +1302,25 @@ static float64 float64_abd(float64 op1, float64 op2, float_status *stat)
     return float64_abs(float64_sub(op1, op2, stat));
 }
 
+/* ABD when FPCR.AH = 1: avoid flipping sign bit of a NaN result */
+static float16 float16_ah_abd(float16 op1, float16 op2, float_status *stat)
+{
+    float16 r = float16_sub(op1, op2, stat);
+    return float16_is_any_nan(r) ? r : float16_abs(r);
+}
+
+static float32 float32_ah_abd(float32 op1, float32 op2, float_status *stat)
+{
+    float32 r = float32_sub(op1, op2, stat);
+    return float32_is_any_nan(r) ? r : float32_abs(r);
+}
+
+static float64 float64_ah_abd(float64 op1, float64 op2, float_status *stat)
+{
+    float64 r = float64_sub(op1, op2, stat);
+    return float64_is_any_nan(r) ? r : float64_abs(r);
+}
+
 /*
  * Reciprocal step. These are the AArch32 version which uses a
  * non-fused multiply-and-subtract.
@@ -1389,6 +1408,10 @@ DO_3OP(gvec_fabd_h, float16_abd, float16)
 DO_3OP(gvec_fabd_s, float32_abd, float32)
 DO_3OP(gvec_fabd_d, float64_abd, float64)
 
+DO_3OP(gvec_ah_fabd_h, float16_ah_abd, float16)
+DO_3OP(gvec_ah_fabd_s, float32_ah_abd, float32)
+DO_3OP(gvec_ah_fabd_d, float64_ah_abd, float64)
+
 DO_3OP(gvec_fceq_h, float16_ceq, float16)
 DO_3OP(gvec_fceq_s, float32_ceq, float32)
 DO_3OP(gvec_fceq_d, float64_ceq, float64)
-- 
2.34.1

