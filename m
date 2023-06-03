Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544892ejb;
        Fri, 2 Jun 2023 19:36:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KR/fVahSBd1Ch2dM+i/Xs0yU0vo1MEqr9tAFSPLXiviR82s8stleAIa9WOF6mm0RQA81V
X-Received: by 2002:ac8:5c8c:0:b0:3f6:e2:398a with SMTP id r12-20020ac85c8c000000b003f600e2398amr424534qta.31.1685759804598;
        Fri, 02 Jun 2023 19:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759804; cv=none;
        d=google.com; s=arc-20160816;
        b=Yq05yVh0DdedwomcyZre4Hu8KgDrr0wv8U71LSgyI8SpL8G4FsQCFaliPUXONKJVIr
         TtUzk4mtXEWUzm/v+a2ocCLNTmHB68GniHZoOYXanXja9IsNJOqZA67wHtkYDy8sSZP6
         A+JMda1ImLIOqDAmN1FM9qlJeZm6x/dGPGZ7lRdgKfXjkxWnuVYyCLbVbLyyV+0X0/bo
         JX0HwUjNYPollK8WZRRQDtJyZis+HOHyFvu9EwDRxuq9yKyV5hjANb7DMqyQiblUV1MZ
         4YS9E0XcxmOv81Y3ZYRKBYIf7+uNqAhWV6gqHa2fFNgzX37G+x2wzK3uUx+WWpBlG09d
         kC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kNP2zyW8a/3zpm8uEbmA/6lobMvEh7YHX80EYdU3SXU=;
        b=tfzB5n/mzhdzdYhJRhM/1lnEcUCcsEaLdI+BzAPZhUPnwiOdfVI58Lr5xfjtowNOp7
         v729WLag2tgySL/JlbaXOFxa0MwGK0m/nubjkq++ipDxKScqHleoIJxMFilhC89peGyh
         740TUVZeOCH1gaxN96EI0JrC8VTlGkixX7yJj6vEawGIujLjPRaiLvF7m+q1SICLIUYC
         ir5X9qxtVZOf1a31Y+qJz9zE3Z0tjsDeo2/YhsBs2pUq5u38fo8+En/mOmb7eYT/Wsog
         lEXxGgOoGspdvF8xq7j1VtTt2aGhhMAscX6TN2httniajYaepBSZQCNTdjuKYq/MVPzK
         iuKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BnAVKMkG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020a05620a142800b0075be5b1320bsi1642367qkj.112.2023.06.02.19.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BnAVKMkG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7i-000376-Ey; Fri, 02 Jun 2023 22:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6x-0000pQ-Du
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6X-0004nI-TX
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:22 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-256531ad335so2211701a91.0
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759695; x=1688351695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNP2zyW8a/3zpm8uEbmA/6lobMvEh7YHX80EYdU3SXU=;
 b=BnAVKMkGxLA6AjAae2AixlrVHz0iUBvtcBISy2LoYF46cPv5KypVDa4U8kYrMWawdF
 bZrR8qlahpU87znKyRO/y3S4+1KJogEC5cVoxTGRWxc9UVFyXgVYrBR6wdKd0YInMqmI
 H9WLcF4KKjPzBYi3diY9Yuv3dPBjlm+/8lqac2D2lI8EmDmvfEzvKS2NLZxgxo0njtC+
 zgCSoKDRMUof1Yl8rDkMLKUxvGj0y6Kf64MT7d0vYBwnHMCDOISQ8GV1zZI/LI2vQqnt
 serqBxSW1pHpCsrJO34ob39GFbduqrAe8qeZ6KdayO6zNuCQFyB4GBet64/yELxxrGXM
 DqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759695; x=1688351695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNP2zyW8a/3zpm8uEbmA/6lobMvEh7YHX80EYdU3SXU=;
 b=J9/2tU6KK1mBJ7qFqMZR6FUsQaj/BI8rRI26Oz9EDSaUO2j//p3ynVzRm3K7UmMYeP
 8VMTW+v2Edw77BQcWNJ1T6mI8NTbxA6JmnXP5SQw/ziYHP5wyDk/IzhinZ4gc2iDPngU
 R69tZLorfPYAu3oFgwZF8DNiVLe3ts9xW/toXqe4k276WA2UDNJWipFXEY7Y5Gw54Zqx
 8fvd2jwJPgFr0Uqutym2R1onNGNkg1OmStvHKo8rFDKuCqQaeggYC9xp9f+TqG+Kjfm5
 iL5X9Rih3AbH3JelEPhwDlW8e+I1ggU7s2z2jL/tWbgGtj9oR3i8Wwkp4LKZ5Rn72YP4
 a1xw==
X-Gm-Message-State: AC+VfDyd+JG6zi2vPdCNAjv86ttQpZNoc27xY5/rp3IH7MyQbnw7rpYi
 7uI+UL26PtGM7RAPAAvbl4FfsA==
X-Received: by 2002:a17:90a:4e8f:b0:256:937:48dc with SMTP id
 o15-20020a17090a4e8f00b00256093748dcmr1506291pjh.40.1685759695216; 
 Fri, 02 Jun 2023 19:34:55 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 30/35] host/include/i386: Implement aes-round.h
Date: Fri,  2 Jun 2023 19:34:21 -0700
Message-Id: <20230603023426.1064431-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: caThk3u7vamS

Detect AES in cpuinfo; implement the accel hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/i386/host/aes-round.h   | 148 +++++++++++++++++++++++++++
 host/include/i386/host/cpuinfo.h     |   1 +
 host/include/x86_64/host/aes-round.h |   1 +
 util/cpuinfo-i386.c                  |   3 +
 4 files changed, 153 insertions(+)
 create mode 100644 host/include/i386/host/aes-round.h
 create mode 100644 host/include/x86_64/host/aes-round.h

diff --git a/host/include/i386/host/aes-round.h b/host/include/i386/host/aes-round.h
new file mode 100644
index 0000000000..b67e20578d
--- /dev/null
+++ b/host/include/i386/host/aes-round.h
@@ -0,0 +1,148 @@
+/*
+ * x86 specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HOST_AES_ROUND_H
+#define HOST_AES_ROUND_H
+
+#include "host/cpuinfo.h"
+#include <immintrin.h>
+
+#if defined(__AES__) && defined(__SSSE3__)
+# define HAVE_AES_ACCEL  true
+# define ATTR_AES_ACCEL
+#else
+# define HAVE_AES_ACCEL  likely(cpuinfo & CPUINFO_AES)
+# define ATTR_AES_ACCEL  __attribute__((target("aes,ssse3")))
+#endif
+
+static inline __m128i ATTR_AES_ACCEL
+aes_accel_bswap(__m128i x)
+{
+    return _mm_shuffle_epi8(x, _mm_set_epi8(0, 1, 2, 3, 4, 5, 6, 7, 8,
+                                            9, 10, 11, 12, 13, 14, 15));
+}
+
+static inline void ATTR_AES_ACCEL
+aesenc_MC_accel(AESState *ret, const AESState *st, bool be)
+{
+    __m128i t = (__m128i)st->v;
+    __m128i z = _mm_setzero_si128();
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = _mm_aesdeclast_si128(t, z);
+        t = _mm_aesenc_si128(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesdeclast_si128(t, z);
+        t = _mm_aesenc_si128(t, z);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesenc_SB_SR_accel(AESState *ret, const AESState *st, bool be)
+{
+    __m128i t = (__m128i)st->v;
+    __m128i z = _mm_setzero_si128();
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = _mm_aesenclast_si128(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesenclast_si128(t, z);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesenc_SB_SR_MC_AK_accel(AESState *ret, const AESState *st,
+                         const AESState *rk, bool be)
+{
+    __m128i t = (__m128i)st->v;
+    __m128i k = (__m128i)rk->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        t = _mm_aesenc_si128(t, k);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesenc_si128(t, k);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_IMC_accel(AESState *ret, const AESState *st, bool be)
+{
+    __m128i t = (__m128i)st->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = _mm_aesimc_si128(t);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesimc_si128(t);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_accel(AESState *ret, const AESState *st, bool be)
+{
+    __m128i t = (__m128i)st->v;
+    __m128i z = _mm_setzero_si128();
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = _mm_aesdeclast_si128(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesdeclast_si128(t, z);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_AK_IMC_accel(AESState *ret, const AESState *st,
+                            const AESState *rk, bool be)
+{
+    __m128i t = (__m128i)st->v;
+    __m128i k = (__m128i)rk->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        k = _mm_aesimc_si128(k);
+        t = _mm_aesdec_si128(t, k);
+        t = aes_accel_bswap(t);
+    } else {
+        k = _mm_aesimc_si128(k);
+        t = _mm_aesdec_si128(t, k);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_IMC_AK_accel(AESState *ret, const AESState *st,
+                            const AESState *rk, bool be)
+{
+    __m128i t = (__m128i)st->v;
+    __m128i k = (__m128i)rk->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        t = _mm_aesdec_si128(t, k);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesdec_si128(t, k);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+#endif
diff --git a/host/include/i386/host/cpuinfo.h b/host/include/i386/host/cpuinfo.h
index a6537123cf..073d0a426f 100644
--- a/host/include/i386/host/cpuinfo.h
+++ b/host/include/i386/host/cpuinfo.h
@@ -26,6 +26,7 @@
 #define CPUINFO_AVX512VBMI2     (1u << 15)
 #define CPUINFO_ATOMIC_VMOVDQA  (1u << 16)
 #define CPUINFO_ATOMIC_VMOVDQU  (1u << 17)
+#define CPUINFO_AES             (1u << 18)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/host/include/x86_64/host/aes-round.h b/host/include/x86_64/host/aes-round.h
new file mode 100644
index 0000000000..7da13f5424
--- /dev/null
+++ b/host/include/x86_64/host/aes-round.h
@@ -0,0 +1 @@
+#include "host/include/i386/host/aes-round.h"
diff --git a/util/cpuinfo-i386.c b/util/cpuinfo-i386.c
index ab6143d9e7..3a7b7e0ad1 100644
--- a/util/cpuinfo-i386.c
+++ b/util/cpuinfo-i386.c
@@ -40,6 +40,9 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
         info |= (c & bit_MOVBE ? CPUINFO_MOVBE : 0);
         info |= (c & bit_POPCNT ? CPUINFO_POPCNT : 0);
 
+        /* Our AES support requires PSHUFB as well. */
+        info |= ((c & bit_AES) && (c & bit_SSSE3) ? CPUINFO_AES : 0);
+
         /* For AVX features, we must check available and usable. */
         if ((c & bit_AVX) && (c & bit_OSXSAVE)) {
             unsigned bv = xgetbv_low(0);
-- 
2.34.1

