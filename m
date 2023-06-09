Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104654ejb;
        Thu, 8 Jun 2023 19:29:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79ImF3UQvtwUtniscrUQToR6OAUDcInvY9WEMloIi90m7BMraQIGIVMIuYouROG6qIl/4e
X-Received: by 2002:a05:620a:6841:b0:75d:51f5:ddbf with SMTP id ru1-20020a05620a684100b0075d51f5ddbfmr7717614qkn.21.1686277758811;
        Thu, 08 Jun 2023 19:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277758; cv=none;
        d=google.com; s=arc-20160816;
        b=XdWUv1cR4Tc5Wqsl8VcNPSjhCpfZPM82yYTfC9u05bhXT7m2wE4g+C6V7dUnx8nBrF
         jW7E+htJdmDXvAJtII7W1yK+a7XT1U7ia6b7C0jz4AO01iJNTW9XGfm6VV9c9/A6Z+2X
         azDA2KmfgEU7U8hG1y6Jq5dtvER6iTwSwwpczG692TndaPVm65ap++T76QzkB/Tg9Dvn
         eQz4cP7qdMCdEU2F2RVbVXeXNurgOhIR4iZYMB7LCnjG2mxZd/NJ+UWvs0eLLX07FbYk
         dVpFG5e0/8bqh1cC4tvv0s/W0NELcu6ijicGE3Ilt4a3LvN9X2lFpaqWpexvrgXGTG79
         hv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qGYhm+c+tUnjVrf/DJrmcZwZlQ1qyCVFhkVCduCzuuY=;
        b=GsCIAVzr7vla7TKMRLB8WN0Z3wpNgw9JM4DEWgzfr8EO+YAdkT+i48IjDXnUIiK9AC
         CJiz/fmF/gBrvbYPPuKTmUdCXRuim2YyKAIQTJH2QMAT6U2a818Jq6mqAB0SSCgVoS/Y
         W5JkUuk0Kw08kdvu40O6wGCjmWXzCySNDoSNG/q1R8+W4Zw7bi/EPKbG/5X/Mhdix569
         YTLc4UMYAGd02CNWtaw4xuDAvg2NEjlYAnaD9AkzdrWLVnGHqoVaJrqDUZjXXPfKPJyF
         JnuinBQ1ffjTPZjm5NapaH99XZFsTk6+wTrb+MULTIosBYmTyvkKNjeusZozJ2GZeWV0
         TwFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xsE/SrQD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a05620a166700b0074e211374f8si1423628qko.711.2023.06.08.19.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xsE/SrQD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7RpJ-0006Ye-Nd; Thu, 08 Jun 2023 22:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rod-0003lZ-6s
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:27 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnp-0005os-ME
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:26 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-65131e85be4so1326564b3a.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277476; x=1688869476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qGYhm+c+tUnjVrf/DJrmcZwZlQ1qyCVFhkVCduCzuuY=;
 b=xsE/SrQDJQpszwI/XV9bgk0izK4Ys4imEwnowJBwwD5uz2IGxMOfLQRRo1RLjJ1dFi
 TFtx20ZgCmHqWItJsBWXub0ZElc8wCiAMcvGc7NvfX4aOWAOjf/ptg7tJGGKnanwOIaK
 aLBca4pbkpWcaTfBC04NNnLg5d4meBIVhMAoCFXjm7U4qWryvcH6L56lhPKbENL+IX6x
 HFsoqxGLCcCB7t/6OELCBvu5HrA8DHozW7MJmNffAzq6hUAORKBmux/kgtYByYffirwa
 3xeaUdoTO0vm8+fN91gj1juk8U6adm9c4xMH2X3lCtgYUu5+xDbgm+65/N2m45xmvsAY
 IGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277476; x=1688869476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qGYhm+c+tUnjVrf/DJrmcZwZlQ1qyCVFhkVCduCzuuY=;
 b=IyBAqkIzK3WKykBT/OzBTm+4epusGxJR4w3Ofd3HHp824KsXiCSkp19+4ZD7l+m4Ke
 nUFGmSxNOG3A8UH5eiEbVkddInupcqK3ITVQ/6Qx7A3eneCE+++mCrl2YJPY41cWKVYX
 8Uwpzsm8wsaRwejjNS6TbzKFjZTI8I1tACSiKtNugFXfxYm9Z7OT8/lQnHHLg6xtSRuq
 VXeiCW98JFcRqo8b2Fz4b7E8dsqLuw7TQzK2OmvKa5WRWwmr2CNe3EacgGUD0QopEp5B
 Ds1ZJNYQSdIr4o2LB4vYVBMvlLCZq37kUZS/VVMiYO+wmtt6nuukMeeVWTt2AOTVO0fs
 +hkQ==
X-Gm-Message-State: AC+VfDxCUVRAai+ski7ybeg7N0E8S3bpMrLi6mU71H1qHWd9ritqgGYo
 OnldtCzUHi1CznXP6Cn72FJonydR0X4pVvIbTFM=
X-Received: by 2002:a05:6a20:429f:b0:10a:9f55:292b with SMTP id
 o31-20020a056a20429f00b0010a9f55292bmr10310519pzj.57.1686277476064; 
 Thu, 08 Jun 2023 19:24:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 36/38] host/include/i386: Implement aes-round.h
Date: Thu,  8 Jun 2023 19:23:59 -0700
Message-Id: <20230609022401.684157-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: gpq7ptpA2ioI

Detect AES in cpuinfo; implement the accel hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/i386/host/aes-round.h   | 152 +++++++++++++++++++++++++++
 host/include/i386/host/cpuinfo.h     |   1 +
 host/include/x86_64/host/aes-round.h |   1 +
 util/cpuinfo-i386.c                  |   3 +
 4 files changed, 157 insertions(+)
 create mode 100644 host/include/i386/host/aes-round.h
 create mode 100644 host/include/x86_64/host/aes-round.h

diff --git a/host/include/i386/host/aes-round.h b/host/include/i386/host/aes-round.h
new file mode 100644
index 0000000000..f9abb7c352
--- /dev/null
+++ b/host/include/i386/host/aes-round.h
@@ -0,0 +1,152 @@
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
+aesenc_SB_SR_AK_accel(AESState *ret, const AESState *st,
+                      const AESState *rk, bool be)
+{
+    __m128i t = (__m128i)st->v;
+    __m128i k = (__m128i)rk->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        t = _mm_aesenclast_si128(t, k);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesenclast_si128(t, k);
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
+aesdec_ISB_ISR_AK_accel(AESState *ret, const AESState *st,
+                        const AESState *rk, bool be)
+{
+    __m128i t = (__m128i)st->v;
+    __m128i k = (__m128i)rk->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        t = _mm_aesdeclast_si128(t, k);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesdeclast_si128(t, k);
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
+        t = _mm_aesdeclast_si128(t, k);
+        t = _mm_aesimc_si128(t);
+        t = aes_accel_bswap(t);
+    } else {
+        t = _mm_aesdeclast_si128(t, k);
+        t = _mm_aesimc_si128(t);
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

