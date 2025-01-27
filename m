Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2775444njk;
        Mon, 27 Jan 2025 15:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWY7eG7slZTrxhb+tR3EjpSnjHcfeES6hNN/6B1LuvtEU6xRPMCL3xUWypzfDksrvHLF0p2Pf6is9GR3g==@linaro.org
X-Google-Smtp-Source: AGHT+IEOjZMK8QKSlkADLPw/A7TTcz8WZOBbi9G0QLOP/rl0pEbls4sP1Oc+7164lRE02hw7+yTY
X-Received: by 2002:ad4:5d6a:0:b0:6d4:215d:91c3 with SMTP id 6a1803df08f44-6e1b220e572mr638492876d6.28.1738020541780;
        Mon, 27 Jan 2025 15:29:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020541; cv=none;
        d=google.com; s=arc-20240605;
        b=c8m1A2ByXx7ArIdxzxcrXr0s79oLqydLXumKZJFfe7jeiN+Njy8MRnCgfRJvTEKuA9
         xau2UCVZSZ2n1Q/OEUTia9msCUoaaXlPctpWUtcqZAJQWSGowTjEtUZwbnDhegwtSSs/
         pW00ojDDu2cJUYu6Z47ItnWUpdCf0N9sPDTlGlUv8QovAGPINYFnFp0dbvzJ2jUOPIuV
         7eDjcPuGZAnK6REnF3uTRznioaAJaRCja4i+AByMjKCp7P+0XxE6+PUJkImljj8T9L0U
         GquyXsgny78aTbyNHUJsvJhtpttic8680miwmbWPY6DK7pd/E1lqU+1U5slOWPA81MdJ
         6+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GA8OMBaKoWm1dr2kAwaJfnYaqSkCIQYp9JiJNnvOmTg=;
        fh=KIs1Lsq2VQq5ycS/g9DvsBQtPy98FyvoJ0YDqZ3JuSo=;
        b=izuG8XsPi+73dt79vz7r21uCW7ZFe68fsck90wMS8QHP44Q0vdojUavL1mmiPc7yeU
         zRTcRZ727452zHJ4Gt64T2p7YOZf9FzRxQ1j34BwIA6s4KbH9vj21TYMePatZ36nBnug
         7TY6Xvjf0mYdh5WHkSDnLUqO3uFvqpjsf3mJjwwKwrWNIxwF9hDs1UiOK9C05P0QjzFB
         8D/NjjuSgd99yOiWsywZ4Gvms7Vm8NJlWAL+HIBY8iWUrH/aw5R9djS3SL+bBT+DVyg+
         l6iYDAxP79YlJ61VVRJF0MMvQuloK9eY0NpmFnH2g+EheUuoTvgtgmVXKjYOYUTLhUVL
         +smg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLg6F0KI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df6112si122008936d6.240.2025.01.27.15.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:29:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLg6F0KI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYV3-0006b7-Bg; Mon, 27 Jan 2025 18:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUp-0006Po-6R
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUm-0005cy-RZ
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2ef8c012913so6662137a91.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020379; x=1738625179; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GA8OMBaKoWm1dr2kAwaJfnYaqSkCIQYp9JiJNnvOmTg=;
 b=aLg6F0KIigLpi7r1VWb8KqsJOUeN46EAZufzL4pEwo8dBOwDA7ak0YZregDcNZw4EW
 2g1x0eWFZkY7TU+pwmHn8rx4X59WdZlFKjZcU0olgCyb2u+6eSxtuNy/n0p35ZzcIddH
 AXAyxv6sOqA2gY1Nx5a4K7a5S405PpqqstFlBGQS7x6SX6f+zO893ZF6Wd6P+bL6/PNe
 ZGo8GNLp2XwARm4BWM1DGWLKSPfD2IPycL3TqF6dY1wSFY9hKwuM1Cr6ehZQUk9YR2yR
 1qoQ0LCet3Sj7l+WhfV4wy5uWTZwNCN8PZ2hrNsbGT7zzbk8B3E2Obh38n1CvQ8Z6K/w
 p4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020379; x=1738625179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GA8OMBaKoWm1dr2kAwaJfnYaqSkCIQYp9JiJNnvOmTg=;
 b=IlYIXBnIAjEj0D9a+oB1UeeDZ7ai6gA/4f5QVXZM9X4vBAfDMPbxdBGKmSd1ucbhps
 Az/Bf1KqtRd6+SZ5peYm8tbeX7b7IXZU35bkqqbj/TKqGpv9p3pXVQ/OtA4Mk9K2Togk
 6YJw1SkO8Uc8zUFVQZ/4zIJNbpYOJ9uIATfFlpfFzIpoZZ1DZBfoGVALlA8i7QWRB5zh
 MmCTKzWKD0DbJ8lxx/O44P9Isd92qbZK/UpL5HkoWJWUDCvSOdldEdmP66NYiVAg12OT
 sarKlx/iJNt81Cas6ppMZjpKzgufFSojGsr7AYEtMIdZUBJB7H0teo8IEpIBRw5Vc4Pi
 7XrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlQYJK6EKnSO9X+hkrIkUbPgZ3pt2Z/5annOe8afNmT16LuFYzQq1HrtkeYqtykh+W2C0Jbzn+tw==@nongnu.org
X-Gm-Message-State: AOJu0YxWcJSv2crcfnW/m75kBmtTJ9zKnl76EuJoG7AgsE4dlD4u0C7v
 r/2zOJwjp3A8vSZh+5ukaNGE6ZqV/WzQQGjJAa5gxVFPkoevt7Z93oT3P3gCl8I=
X-Gm-Gg: ASbGncsPxkxOeHyJ3V38iNc4s7C54nP0KwUSHLSeECioKXlumyplelQ6KdB4lQ3F37E
 xT4VNW6c8Bp02FDQjvoVU3OgOYvIVIOJ/mFPeBidD0m52T6IRXswWtsuZoK+xg26CD1HV9DykyX
 +cwS2/oVQzCoEXKcoJK+hpEWNVXVAIsNTqGfoIY5SJDmLyEfSALRwo+bTd34fY8MnfSV9f1eKhE
 8mM7SQNAx4RLpvMKCWZCPC85COPZGx6RoMH8wESH8xRMd9i/OlR0mBjO9935hCO67yI4TQMfhdl
 P6DOB+qtMGlkkZZIH1VXxuhhgTKJM1bgUvnLwLs=
X-Received: by 2002:a17:90a:7187:b0:2f7:e201:a8cc with SMTP id
 98e67ed59e1d1-2f7e201ab8fmr41113910a91.18.1738020379539; 
 Mon, 27 Jan 2025 15:26:19 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 17/22] target/arm: Move float*_ah_chs to vec_internal.h
Date: Mon, 27 Jan 2025 15:25:59 -0800
Message-ID: <20250127232604.20386-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: 1cyhx1DVRqCG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_internal.h | 20 ++++++++++++++++++++
 target/arm/tcg/helper-a64.c   | 15 +--------------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 094f5c169c..a673935f48 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -20,6 +20,8 @@
 #ifndef TARGET_ARM_VEC_INTERNAL_H
 #define TARGET_ARM_VEC_INTERNAL_H
 
+#include "fpu/softfloat.h"
+
 /*
  * Note that vector data is stored in host-endian 64-bit chunks,
  * so addressing units smaller than that needs a host-endian fixup.
@@ -265,4 +267,22 @@ float32 bfdotadd_ebf(float32 sum, uint32_t e1, uint32_t e2,
  */
 bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp);
 
+/*
+ * Negate as for FPCR.AH=1 -- do not negate NaNs.
+ */
+static inline float16 float16_ah_chs(float16 a)
+{
+    return float16_is_any_nan(a) ? a : float16_chs(a);
+}
+
+static inline float32 float32_ah_chs(float32 a)
+{
+    return float32_is_any_nan(a) ? a : float32_chs(a);
+}
+
+static inline float64 float64_ah_chs(float64 a)
+{
+    return float64_is_any_nan(a) ? a : float64_chs(a);
+}
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index ba21efd0bb..dc96c92a21 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -38,6 +38,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "user/page-protection.h"
 #endif
+#include "vec_internal.h"
 
 /* C2.4.7 Multiply and divide */
 /* special cases for 0 and LLONG_MIN are mandated by the standard */
@@ -208,20 +209,6 @@ uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, float_status *fpst)
     return -float64_lt(b, a, fpst);
 }
 
-static float16 float16_ah_chs(float16 a)
-{
-    return float16_is_any_nan(a) ? a : float16_chs(a);
-}
-
-static float32 float32_ah_chs(float32 a)
-{
-    return float32_is_any_nan(a) ? a : float32_chs(a);
-}
-
-static float64 float64_ah_chs(float64 a)
-{
-    return float64_is_any_nan(a) ? a : float64_chs(a);
-}
 /*
  * Reciprocal step and sqrt step. Note that unlike the A32/T32
  * versions, these do a fully fused multiply-add or
-- 
2.43.0

