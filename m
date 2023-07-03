Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172180ejy;
        Mon, 3 Jul 2023 03:09:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG6II2gkO2XDoxdS7Slh0tBNLAPNWb6ap5R+iHrJW7T0UPi9lTL7v/u2WvAo7UkXLb5gh7D
X-Received: by 2002:a05:620a:29d2:b0:767:3999:5277 with SMTP id s18-20020a05620a29d200b0076739995277mr13185227qkp.70.1688378967984;
        Mon, 03 Jul 2023 03:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688378967; cv=none;
        d=google.com; s=arc-20160816;
        b=fKyW7FJ8LU4tW7HWBQMk7GzCGeIiNvWvYp1HzNt1EgPrVQcJ87nAzpzMOxHbZbhnTd
         09JeNCywGY3ZdWRWDYiPHZrCdx8HS14MLpq7z2KRuuSn7yvBsf50mvCPXp53iLpWDwKb
         RPEl6YIXkSU6B24FGQiigggqX8srnqLahpdb7GC+6pMKqNXn14ZM3JSbLJv+XmDtn+8J
         FxHVdYRA0mCTJ69NlSRIOSjaPbaZ0P4bfOD/pz/YuMqPsqLHPgtY2iF+vld5x19TRa7A
         oTqYic3tappHIJTbDrUe4gFX/VUebLhp02+YV04UxM5J1mw0foxqZATsoLEaP/XycyH+
         NXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jsF8E0JGJalzWmrX5g2tSojnQQtbBHl3guSmbqu5fKQ=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=ZD8O1KX5v8+ljMzU9Ag5yn/+AMMxYSeJlhNtYdYmoYEwvcm4oqGd1h7w5WLBx8b+BR
         dx2vASdJBstRHNgqQCQr6d1DacgKZFdHZTBTjjGnn9duVVh+71vB3utvLSIQxn7x4Los
         ot6B+v2wArwIgrb/Vf8y74cq8iYwow4OktWFjsdj4LrWuW7TLjDIDwvYi4qALWtosh1m
         NQhXpKQpyS3UBLbg7hJqcmSDAWR1XhrC/3jXRsOA4uxmt7tpfDAgPMm+TQ131KZRUSl+
         Utbn49sMJoMieVp5EVN3fJkWgwwGfgsAurfBfQvnnXdzN4HIOjNl6FXYubkGTXw7BQuw
         NBsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I6VYwR7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020ae9c107000000b0076770e82465si526240qki.254.2023.07.03.03.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I6VYwR7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRL-0002go-6z; Mon, 03 Jul 2023 06:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRF-0002b2-VL
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGR8-0005ni-Um
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:45 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc244d3a8so42898265e9.2
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378735; x=1690970735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jsF8E0JGJalzWmrX5g2tSojnQQtbBHl3guSmbqu5fKQ=;
 b=I6VYwR7yVUv0BG7BhJKjhxDgoIMJsO4Bnl6tSTBaKz7RxmoAVl/uwMxxXzB1odxUJY
 h7+fqJxyDeCNQttgtPZBolW4cLvOHZ3CnlBR1o/0vPvhusDLFoiB5e/cLl4WjHZwjQL6
 uGtHZzORlcE2K89l5rXdHwrUFKXuzhgOAEwgK8DJv3metXfmtXa/cHhSv9Tl0r4PcP3w
 eMAoQxNZnGM/OTaTAxL5pKoIODUowWHuIHh9rtcoCrwAFOqYq1Dn/8k9DGWPNUOC/sKI
 YctkGmRraQmcfjHmhWXYVN/7jtRTUJwmFxdeEI4k50gvy4Szes5XDVZKSDHtsbPxaX69
 eeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378735; x=1690970735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jsF8E0JGJalzWmrX5g2tSojnQQtbBHl3guSmbqu5fKQ=;
 b=ZI3QLLmRMWeBPKRqkpnqoO2jM4r+OLs5JUMk5Xtt0K6j38UHCnB/ef/e8venEoANHL
 xj1uZ5rSKE8vg0GtcfypkmoeTEEzANcuKyKkFXP7ZwHwGObSfhPT46kseTAWjh70Lwna
 XDv85S12VpkVleH6kNB25FXMnYOUlfaThZhotHczQrNyKN5I+QuD1ncskewbBO+6cc85
 GDVtX0QU0ImdoXMr+1v6FpGgjhLE2DVsKBkj1CS+viTtOis2SwLOy3x/uZ+acOoeLhAb
 KGM3AiqPgMk7Y1htl04PcDMLVbdKk/nczo5A8aiIzK+5eVozTZ++KIcoZIDxeWWdweu+
 iJLQ==
X-Gm-Message-State: ABy/qLaQVmzy4rKRJBF3D6SfiSu1AaQG6NEYwfgm+iCRCelPuhMGuO1E
 TrT6Pk25bgY27vKowNx2Za0UFQ==
X-Received: by 2002:adf:ed8f:0:b0:313:e953:65d0 with SMTP id
 c15-20020adfed8f000000b00313e95365d0mr7172505wro.28.1688378734939; 
 Mon, 03 Jul 2023 03:05:34 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 12/37] host/include/i386: Implement aes-round.h
Date: Mon,  3 Jul 2023 12:04:55 +0200
Message-Id: <20230703100520.68224-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: 6UZsaY53MevB

Detect AES in cpuinfo; implement the accel hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/i386/host/cpuinfo.h            |   1 +
 host/include/i386/host/crypto/aes-round.h   | 152 ++++++++++++++++++++
 host/include/x86_64/host/crypto/aes-round.h |   1 +
 util/cpuinfo-i386.c                         |   3 +
 4 files changed, 157 insertions(+)
 create mode 100644 host/include/i386/host/crypto/aes-round.h
 create mode 100644 host/include/x86_64/host/crypto/aes-round.h

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
diff --git a/host/include/i386/host/crypto/aes-round.h b/host/include/i386/host/crypto/aes-round.h
new file mode 100644
index 0000000000..59a64130f7
--- /dev/null
+++ b/host/include/i386/host/crypto/aes-round.h
@@ -0,0 +1,152 @@
+/*
+ * x86 specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef X86_HOST_CRYPTO_AES_ROUND_H
+#define X86_HOST_CRYPTO_AES_ROUND_H
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
+#endif /* X86_HOST_CRYPTO_AES_ROUND_H */
diff --git a/host/include/x86_64/host/crypto/aes-round.h b/host/include/x86_64/host/crypto/aes-round.h
new file mode 100644
index 0000000000..2773cc9f10
--- /dev/null
+++ b/host/include/x86_64/host/crypto/aes-round.h
@@ -0,0 +1 @@
+#include "host/include/i386/host/crypto/aes-round.h"
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

