Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2170185ejy;
        Mon, 3 Jul 2023 03:05:25 -0700 (PDT)
X-Received: by 2002:adf:f18d:0:b0:313:f000:5de6 with SMTP id h13-20020adff18d000000b00313f0005de6mr13182442wro.16.1688378725138;
        Mon, 03 Jul 2023 03:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688378725; cv=none;
        d=google.com; s=arc-20160816;
        b=erFSCJPoxjdzS/QhiAMkZXu7u1ohlZRWNhFA85bVBfLyumLYSngZYMyO1CHmWmFlTN
         1QMpWGj5GSarHb/KB0ourJGSZM5+jYJf1rapyjrYbNmLLeg0czt9etq8LeXWLnSduLRC
         dkmy9mX6pFmCa+ERpPW1jlfJhDiOjLTjhCMSeF5Yf6wYXBxxNfd1WKhGdfn9it4rm9Dn
         Z50I9i3tj5pASp1gqa2aoX2pnAjm0Y75LI6pO4llRHwjGjdEL+SlToG/4CdLlNSJydah
         OeKiao26Hhqoax8xp8tun0j9labTnsy0JkLEY/ZXoPC1rDHG6ThCEav/s4AJzFHdMUen
         E5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mPmUCjpRZwFOi0fix68D6WvDW8xFOeagc+Ir4MNFYrg=;
        fh=x+ZTx6IrAmf0loUZo4foQZz15ERCxwyUvPuPIYLL7E0=;
        b=EpGK/M0LhVG3XplCzihGZ6v57eR1pqjaTNbcy0k6bS1bcpuJxOuIQyXMSA/8/RC5ww
         CQKazdy5feetdr1R9YOPRY20m95sUJYqSxugz8PIgIA7gHBevjwfLDSccbIVxVXo187C
         Dvz9zoIk05/J7gEhA0nfsUayqJOWGwv2uAZ7iZiOxg4d1mqhJqJ0vzKLcSHemyQP0xNZ
         zdIaxN+nkmLwUY4WVGfRtCiYDkApPXKSUz0CY3SM9YB/K0lj5lnt3Fsd+C3Ba0K0r+1b
         R2DaIW62kiAfiGUWdMg1EH6QNu7jqmB33PUfkNqQRbmPdZCOSERo6AOpzGIrnrg3Pr7t
         Hcqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BhSqWarO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k11-20020a05600c1c8b00b003fbabf377e5sor284797wms.3.2023.07.03.03.05.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Jul 2023 03:05:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BhSqWarO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688378725; x=1690970725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPmUCjpRZwFOi0fix68D6WvDW8xFOeagc+Ir4MNFYrg=;
        b=BhSqWarOcSNp5PqbEm3/Xek0TVUNfOSjL7eMV2LLLxBlUN/cGYTC34Rn6g0xzh3JQl
         rt1XtTsy7Vzfw6HD/m6hHVAmdybFNc5KSsBoHzMtkcQndiGnwUJ6OzVWgSuY4SFCvi8b
         ajBqK9hotpU8EFV4D1xGxI7i1PNLiYaxR7Ml2fFAKMbU3I4VJ43v8Xa5vw7qmUmxb7vE
         MFwRxi1Z/SJ1L13WeyXwaksnRHK3P9P/8BREW8bQoWTlQ44Q2aKhijMy33Dit6PBNvmq
         uNMdIH+Yij1EM6Ne5SsFffQwhz5OdYZ7XFeaaP/YRD9FIDgQj8lzVP4tj3oK4dmiPrkc
         PZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688378725; x=1690970725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPmUCjpRZwFOi0fix68D6WvDW8xFOeagc+Ir4MNFYrg=;
        b=S9wkZrYZmlw+/Kon323tawQ9BWH/pktTFXDNPEqP825vjqu9Zy16hyhpjyWNJmPfIr
         7XqoIekJRmjFwVZaRtH3jCUHpI6n5bug4XbqFt/6eBuPFeJ++xkcLp7XqkTT38cvjtR6
         oT1Yofo+18T5yBUuqw36cgX+kK41U7GrSVN/V46f5QV5IyiCRpq4q/QC75Zbvx4afWii
         auPYMe08jhRkREze3etAyxikRizAHly4CtHVt7iYlzBkXIW2QrY3y+cv+Ed2I+QUz6c4
         jZ6XlAzC10jzd/clZoehzk7gTNOKOsgkMwy4A0hCWBPA7Wjf6KZejLVsiIlYeYJWKX+K
         K58A==
X-Gm-Message-State: AC+VfDxDvwz5Y/W7E8ALzCeK7nfWVU5+CR1cj5YoUnwJGg8n+vMHZ5Qh
	rCSBPjIfk4qUZsTRh0aTzKPkdLmz724Jijjf8sqVMpfL
X-Google-Smtp-Source: ACHHUZ4OihRehnjJpZh8ECKZ5ZcKf4FPa0h9T0gpcz/jdgSbzUBqz4sJJwtOz0xHfIyccYvPoHxG+g==
X-Received: by 2002:a05:600c:1e0b:b0:3fa:955a:9291 with SMTP id ay11-20020a05600c1e0b00b003fa955a9291mr13191697wmb.9.1688378724650;
        Mon, 03 Jul 2023 03:05:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
        by smtp.gmail.com with ESMTPSA id t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 03:05:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	pbonzini@redhat.com,
	eduardo@habkost.net,
	alistair.francis@wdc.com,
	danielhb413@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 02/37] tests/multiarch: Add test-aes
Date: Mon,  3 Jul 2023 12:04:45 +0200
Message-Id: <20230703100520.68224-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GbbwoNCWRELd

Use a shared driver and backends for i386, aarch64, ppc64, riscv64.

Acked-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/test-aes.c            |  58 ++++++++
 tests/tcg/i386/test-aes.c               |  68 +++++++++
 tests/tcg/ppc64/test-aes.c              | 116 +++++++++++++++
 tests/tcg/riscv64/test-aes.c            |  76 ++++++++++
 tests/tcg/multiarch/test-aes-main.c.inc | 183 ++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target       |   4 +
 tests/tcg/i386/Makefile.target          |   4 +
 tests/tcg/ppc64/Makefile.target         |   1 +
 tests/tcg/riscv64/Makefile.target       |  13 ++
 9 files changed, 523 insertions(+)
 create mode 100644 tests/tcg/aarch64/test-aes.c
 create mode 100644 tests/tcg/i386/test-aes.c
 create mode 100644 tests/tcg/ppc64/test-aes.c
 create mode 100644 tests/tcg/riscv64/test-aes.c
 create mode 100644 tests/tcg/multiarch/test-aes-main.c.inc

diff --git a/tests/tcg/aarch64/test-aes.c b/tests/tcg/aarch64/test-aes.c
new file mode 100644
index 0000000000..2cd324f09b
--- /dev/null
+++ b/tests/tcg/aarch64/test-aes.c
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "../multiarch/test-aes-main.c.inc"
+
+bool test_SB_SR(uint8_t *o, const uint8_t *i)
+{
+    /* aese also adds round key, so supply zero. */
+    asm("ld1 { v0.16b }, [%1]\n\t"
+        "movi v1.16b, #0\n\t"
+        "aese v0.16b, v1.16b\n\t"
+        "st1 { v0.16b }, [%0]"
+        : : "r"(o), "r"(i) : "v0", "v1", "memory");
+    return true;
+}
+
+bool test_MC(uint8_t *o, const uint8_t *i)
+{
+    asm("ld1 { v0.16b }, [%1]\n\t"
+        "aesmc v0.16b, v0.16b\n\t"
+        "st1 { v0.16b }, [%0]"
+        : : "r"(o), "r"(i) : "v0", "memory");
+    return true;
+}
+
+bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    return false;
+}
+
+bool test_ISB_ISR(uint8_t *o, const uint8_t *i)
+{
+    /* aesd also adds round key, so supply zero. */
+    asm("ld1 { v0.16b }, [%1]\n\t"
+        "movi v1.16b, #0\n\t"
+        "aesd v0.16b, v1.16b\n\t"
+        "st1 { v0.16b }, [%0]"
+        : : "r"(o), "r"(i) : "v0", "v1", "memory");
+    return true;
+}
+
+bool test_IMC(uint8_t *o, const uint8_t *i)
+{
+    asm("ld1 { v0.16b }, [%1]\n\t"
+        "aesimc v0.16b, v0.16b\n\t"
+        "st1 { v0.16b }, [%0]"
+        : : "r"(o), "r"(i) : "v0", "memory");
+    return true;
+}
+
+bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    return false;
+}
+
+bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    return false;
+}
diff --git a/tests/tcg/i386/test-aes.c b/tests/tcg/i386/test-aes.c
new file mode 100644
index 0000000000..199395e6cc
--- /dev/null
+++ b/tests/tcg/i386/test-aes.c
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "../multiarch/test-aes-main.c.inc"
+#include <immintrin.h>
+
+static bool test_SB_SR(uint8_t *o, const uint8_t *i)
+{
+    __m128i vi = _mm_loadu_si128((const __m128i_u *)i);
+
+    /* aesenclast also adds round key, so supply zero. */
+    vi = _mm_aesenclast_si128(vi, _mm_setzero_si128());
+
+    _mm_storeu_si128((__m128i_u *)o, vi);
+    return true;
+}
+
+static bool test_MC(uint8_t *o, const uint8_t *i)
+{
+    return false;
+}
+
+static bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    __m128i vi = _mm_loadu_si128((const __m128i_u *)i);
+    __m128i vk = _mm_loadu_si128((const __m128i_u *)k);
+
+    vi = _mm_aesenc_si128(vi, vk);
+
+    _mm_storeu_si128((__m128i_u *)o, vi);
+    return true;
+}
+
+static bool test_ISB_ISR(uint8_t *o, const uint8_t *i)
+{
+    __m128i vi = _mm_loadu_si128((const __m128i_u *)i);
+
+    /* aesdeclast also adds round key, so supply zero. */
+    vi = _mm_aesdeclast_si128(vi, _mm_setzero_si128());
+
+    _mm_storeu_si128((__m128i_u *)o, vi);
+    return true;
+}
+
+static bool test_IMC(uint8_t *o, const uint8_t *i)
+{
+    __m128i vi = _mm_loadu_si128((const __m128i_u *)i);
+
+    vi = _mm_aesimc_si128(vi);
+
+    _mm_storeu_si128((__m128i_u *)o, vi);
+    return true;
+}
+
+static bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    return false;
+}
+
+static bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    __m128i vi = _mm_loadu_si128((const __m128i_u *)i);
+    __m128i vk = _mm_loadu_si128((const __m128i_u *)k);
+
+    vi = _mm_aesdec_si128(vi, vk);
+
+    _mm_storeu_si128((__m128i_u *)o, vi);
+    return true;
+}
diff --git a/tests/tcg/ppc64/test-aes.c b/tests/tcg/ppc64/test-aes.c
new file mode 100644
index 0000000000..1d2be488e9
--- /dev/null
+++ b/tests/tcg/ppc64/test-aes.c
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "../multiarch/test-aes-main.c.inc"
+
+#undef BIG_ENDIAN
+#define BIG_ENDIAN  (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
+
+static unsigned char bswap_le[16] __attribute__((aligned(16))) = {
+    8,9,10,11,12,13,14,15,
+    0,1,2,3,4,5,6,7
+};
+
+bool test_SB_SR(uint8_t *o, const uint8_t *i)
+{
+    /* vcipherlast also adds round key, so supply zero. */
+    if (BIG_ENDIAN) {
+        asm("lxvd2x 32,0,%1\n\t"
+            "vspltisb 1,0\n\t"
+            "vcipherlast 0,0,1\n\t"
+            "stxvd2x 32,0,%0"
+            : : "r"(o), "r"(i) : "memory", "v0", "v1");
+    } else {
+        asm("lxvd2x 32,0,%1\n\t"
+            "lxvd2x 34,0,%2\n\t"
+            "vspltisb 1,0\n\t"
+            "vperm 0,0,0,2\n\t"
+            "vcipherlast 0,0,1\n\t"
+            "vperm 0,0,0,2\n\t"
+            "stxvd2x 32,0,%0"
+            : : "r"(o), "r"(i), "r"(bswap_le) : "memory", "v0", "v1", "v2");
+    }
+    return true;
+}
+
+bool test_MC(uint8_t *o, const uint8_t *i)
+{
+    return false;
+}
+
+bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    if (BIG_ENDIAN) {
+        asm("lxvd2x 32,0,%1\n\t"
+            "lxvd2x 33,0,%2\n\t"
+            "vcipher 0,0,1\n\t"
+            "stxvd2x 32,0,%0"
+            : : "r"(o), "r"(i), "r"(k) : "memory", "v0", "v1");
+    } else {
+        asm("lxvd2x 32,0,%1\n\t"
+            "lxvd2x 33,0,%2\n\t"
+            "lxvd2x 34,0,%3\n\t"
+            "vperm 0,0,0,2\n\t"
+            "vperm 1,1,1,2\n\t"
+            "vcipher 0,0,1\n\t"
+            "vperm 0,0,0,2\n\t"
+            "stxvd2x 32,0,%0"
+            : : "r"(o), "r"(i), "r"(k), "r"(bswap_le)
+              : "memory", "v0", "v1", "v2");
+    }
+    return true;
+}
+
+bool test_ISB_ISR(uint8_t *o, const uint8_t *i)
+{
+    /* vcipherlast also adds round key, so supply zero. */
+    if (BIG_ENDIAN) {
+        asm("lxvd2x 32,0,%1\n\t"
+            "vspltisb 1,0\n\t"
+            "vncipherlast 0,0,1\n\t"
+            "stxvd2x 32,0,%0"
+            : : "r"(o), "r"(i) : "memory", "v0", "v1");
+    } else {
+        asm("lxvd2x 32,0,%1\n\t"
+            "lxvd2x 34,0,%2\n\t"
+            "vspltisb 1,0\n\t"
+            "vperm 0,0,0,2\n\t"
+            "vncipherlast 0,0,1\n\t"
+            "vperm 0,0,0,2\n\t"
+            "stxvd2x 32,0,%0"
+            : : "r"(o), "r"(i), "r"(bswap_le) : "memory", "v0", "v1", "v2");
+    }
+    return true;
+}
+
+bool test_IMC(uint8_t *o, const uint8_t *i)
+{
+    return false;
+}
+
+bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    if (BIG_ENDIAN) {
+        asm("lxvd2x 32,0,%1\n\t"
+            "lxvd2x 33,0,%2\n\t"
+            "vncipher 0,0,1\n\t"
+            "stxvd2x 32,0,%0"
+            : : "r"(o), "r"(i), "r"(k) : "memory", "v0", "v1");
+    } else {
+        asm("lxvd2x 32,0,%1\n\t"
+            "lxvd2x 33,0,%2\n\t"
+            "lxvd2x 34,0,%3\n\t"
+            "vperm 0,0,0,2\n\t"
+            "vperm 1,1,1,2\n\t"
+            "vncipher 0,0,1\n\t"
+            "vperm 0,0,0,2\n\t"
+            "stxvd2x 32,0,%0"
+            : : "r"(o), "r"(i), "r"(k), "r"(bswap_le)
+              : "memory", "v0", "v1", "v2");
+    }
+    return true;
+}
+
+bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    return false;
+}
diff --git a/tests/tcg/riscv64/test-aes.c b/tests/tcg/riscv64/test-aes.c
new file mode 100644
index 0000000000..3d7ef0e33a
--- /dev/null
+++ b/tests/tcg/riscv64/test-aes.c
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "../multiarch/test-aes-main.c.inc"
+
+bool test_SB_SR(uint8_t *o, const uint8_t *i)
+{
+    uint64_t *o8 = (uint64_t *)o;
+    const uint64_t *i8 = (const uint64_t *)i;
+
+    asm("aes64es %0,%2,%3\n\t"
+        "aes64es %1,%3,%2"
+        : "=&r"(o8[0]), "=&r"(o8[1]) : "r"(i8[0]), "r"(i8[1]));
+    return true;
+}
+
+bool test_MC(uint8_t *o, const uint8_t *i)
+{
+    return false;
+}
+
+bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    uint64_t *o8 = (uint64_t *)o;
+    const uint64_t *i8 = (const uint64_t *)i;
+    const uint64_t *k8 = (const uint64_t *)k;
+
+    asm("aes64esm %0,%2,%3\n\t"
+        "aes64esm %1,%3,%2\n\t"
+        "xor %0,%0,%4\n\t"
+        "xor %1,%1,%5"
+        : "=&r"(o8[0]), "=&r"(o8[1])
+        : "r"(i8[0]), "r"(i8[1]), "r"(k8[0]), "r"(k8[1]));
+    return true;
+}
+
+bool test_ISB_ISR(uint8_t *o, const uint8_t *i)
+{
+    uint64_t *o8 = (uint64_t *)o;
+    const uint64_t *i8 = (const uint64_t *)i;
+
+    asm("aes64ds %0,%2,%3\n\t"
+        "aes64ds %1,%3,%2"
+        : "=&r"(o8[0]), "=&r"(o8[1]) : "r"(i8[0]), "r"(i8[1]));
+    return true;
+}
+
+bool test_IMC(uint8_t *o, const uint8_t *i)
+{
+    uint64_t *o8 = (uint64_t *)o;
+    const uint64_t *i8 = (const uint64_t *)i;
+
+    asm("aes64im %0,%0\n\t"
+        "aes64im %1,%1"
+        : "=r"(o8[0]), "=r"(o8[1]) : "0"(i8[0]), "1"(i8[1]));
+    return true;
+}
+
+bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    return false;
+}
+
+bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
+{
+    uint64_t *o8 = (uint64_t *)o;
+    const uint64_t *i8 = (const uint64_t *)i;
+    const uint64_t *k8 = (const uint64_t *)k;
+
+    asm("aes64dsm %0,%2,%3\n\t"
+        "aes64dsm %1,%3,%2\n\t"
+        "xor %0,%0,%4\n\t"
+        "xor %1,%1,%5"
+        : "=&r"(o8[0]), "=&r"(o8[1])
+        : "r"(i8[0]), "r"(i8[1]), "r"(k8[0]), "r"(k8[1]));
+    return true;
+}
diff --git a/tests/tcg/multiarch/test-aes-main.c.inc b/tests/tcg/multiarch/test-aes-main.c.inc
new file mode 100644
index 0000000000..0039f8ba55
--- /dev/null
+++ b/tests/tcg/multiarch/test-aes-main.c.inc
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <stdint.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+
+static bool test_SB_SR(uint8_t *o, const uint8_t *i);
+static bool test_MC(uint8_t *o, const uint8_t *i);
+static bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k);
+
+static bool test_ISB_ISR(uint8_t *o, const uint8_t *i);
+static bool test_IMC(uint8_t *o, const uint8_t *i);
+static bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint8_t *k);
+static bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k);
+
+/*
+ * From https://doi.org/10.6028/NIST.FIPS.197-upd1,
+ * Appendix B -- Cipher Example
+ *
+ * Note that the formatting of the 4x4 matrices in the document is
+ * column-major, whereas C is row-major.  Therefore to get the bytes
+ * in the same order as the text, the matrices are transposed.
+ *
+ * Note that we are not going to test SubBytes or ShiftRows separately,
+ * so the "After SubBytes" column is omitted, using only the combined
+ * result "After ShiftRows" column.
+ */
+
+/* Ease the inline assembly by aligning everything. */
+typedef struct {
+    uint8_t b[16] __attribute__((aligned(16)));
+} State;
+
+typedef struct {
+    State start, after_sr, after_mc, round_key;
+} Round;
+
+static const Round rounds[] = {
+    /* Round 1 */
+    { { { 0x19, 0x3d, 0xe3, 0xbe,       /* start */
+          0xa0, 0xf4, 0xe2, 0x2b,
+          0x9a, 0xc6, 0x8d, 0x2a,
+          0xe9, 0xf8, 0x48, 0x08, } },
+
+      { { 0xd4, 0xbf, 0x5d, 0x30,       /* after shiftrows */
+          0xe0, 0xb4, 0x52, 0xae,
+          0xb8, 0x41, 0x11, 0xf1,
+          0x1e, 0x27, 0x98, 0xe5, } },
+
+      { { 0x04, 0x66, 0x81, 0xe5,       /* after mixcolumns */
+          0xe0, 0xcb, 0x19, 0x9a,
+          0x48, 0xf8, 0xd3, 0x7a,
+          0x28, 0x06, 0x26, 0x4c, } },
+
+      { { 0xa0, 0xfa, 0xfe, 0x17,       /* round key */
+          0x88, 0x54, 0x2c, 0xb1,
+          0x23, 0xa3, 0x39, 0x39,
+          0x2a, 0x6c, 0x76, 0x05, } } },
+
+    /* Round 2 */
+    { { { 0xa4, 0x9c, 0x7f, 0xf2,       /* start */
+          0x68, 0x9f, 0x35, 0x2b,
+          0x6b, 0x5b, 0xea, 0x43,
+          0x02, 0x6a, 0x50, 0x49, } },
+
+      { { 0x49, 0xdb, 0x87, 0x3b,       /* after shiftrows */
+          0x45, 0x39, 0x53, 0x89,
+          0x7f, 0x02, 0xd2, 0xf1,
+          0x77, 0xde, 0x96, 0x1a, } },
+
+      { { 0x58, 0x4d, 0xca, 0xf1,       /* after mixcolumns */
+          0x1b, 0x4b, 0x5a, 0xac,
+          0xdb, 0xe7, 0xca, 0xa8,
+          0x1b, 0x6b, 0xb0, 0xe5, } },
+
+      { { 0xf2, 0xc2, 0x95, 0xf2,       /* round key */
+          0x7a, 0x96, 0xb9, 0x43,
+          0x59, 0x35, 0x80, 0x7a,
+          0x73, 0x59, 0xf6, 0x7f, } } },
+
+    /* Round 3 */
+    { { { 0xaa, 0x8f, 0x5f, 0x03,       /* start */
+          0x61, 0xdd, 0xe3, 0xef,
+          0x82, 0xd2, 0x4a, 0xd2,
+          0x68, 0x32, 0x46, 0x9a, } },
+
+      { { 0xac, 0xc1, 0xd6, 0xb8,       /* after shiftrows */
+          0xef, 0xb5, 0x5a, 0x7b,
+          0x13, 0x23, 0xcf, 0xdf,
+          0x45, 0x73, 0x11, 0xb5, } },
+
+      { { 0x75, 0xec, 0x09, 0x93,       /* after mixcolumns */
+          0x20, 0x0b, 0x63, 0x33,
+          0x53, 0xc0, 0xcf, 0x7c,
+          0xbb, 0x25, 0xd0, 0xdc, } },
+
+      { { 0x3d, 0x80, 0x47, 0x7d,       /* round key */
+          0x47, 0x16, 0xfe, 0x3e,
+          0x1e, 0x23, 0x7e, 0x44,
+          0x6d, 0x7a, 0x88, 0x3b, } } },
+};
+
+static void verify_log(const char *prefix, const State *s)
+{
+    printf("%s:", prefix);
+    for (int i = 0; i < sizeof(State); ++i) {
+        printf(" %02x", s->b[i]);
+    }
+    printf("\n");
+}
+
+static void verify(const State *ref, const State *tst, const char *which)
+{
+    if (!memcmp(ref, tst, sizeof(State))) {
+        return;
+    }
+
+    printf("Mismatch on %s\n", which);
+    verify_log("ref", ref);
+    verify_log("tst", tst);
+    exit(EXIT_FAILURE);
+}
+
+int main()
+{
+    int i, n = sizeof(rounds) / sizeof(Round);
+    State t;
+
+    for (i = 0; i < n; ++i) {
+        if (test_SB_SR(t.b, rounds[i].start.b)) {
+            verify(&rounds[i].after_sr, &t, "SB+SR");
+        }
+    }
+
+    for (i = 0; i < n; ++i) {
+        if (test_MC(t.b, rounds[i].after_sr.b)) {
+            verify(&rounds[i].after_mc, &t, "MC");
+        }
+    }
+
+    /* The kernel of Cipher(). */
+    for (i = 0; i < n - 1; ++i) {
+        if (test_SB_SR_MC_AK(t.b, rounds[i].start.b, rounds[i].round_key.b)) {
+            verify(&rounds[i + 1].start, &t, "SB+SR+MC+AK");
+        }
+    }
+
+    for (i = 0; i < n; ++i) {
+        if (test_ISB_ISR(t.b, rounds[i].after_sr.b)) {
+            verify(&rounds[i].start, &t, "ISB+ISR");
+        }
+    }
+
+    for (i = 0; i < n; ++i) {
+        if (test_IMC(t.b, rounds[i].after_mc.b)) {
+            verify(&rounds[i].after_sr, &t, "IMC");
+        }
+    }
+
+    /* The kernel of InvCipher(). */
+    for (i = n - 1; i > 0; --i) {
+        if (test_ISB_ISR_AK_IMC(t.b, rounds[i].after_sr.b,
+                                rounds[i - 1].round_key.b)) {
+            verify(&rounds[i - 1].after_sr, &t, "ISB+ISR+AK+IMC");
+        }
+    }
+
+    /*
+     * The kernel of EqInvCipher().  
+     * We must compute a different round key: apply InvMixColumns to
+     * the standard round key, per KeyExpansion vs KeyExpansionEIC.
+     */
+    for (i = 1; i < n; ++i) {
+        if (test_IMC(t.b, rounds[i - 1].round_key.b) &&
+            test_ISB_ISR_IMC_AK(t.b, rounds[i].after_sr.b, t.b)) {
+            verify(&rounds[i - 1].after_sr, &t, "ISB+ISR+IMC+AK");
+        }
+    }
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 3430fd3cd8..d217474d0d 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -74,6 +74,10 @@ endif
 AARCH64_TESTS += sve-ioctls
 sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 
+AARCH64_TESTS += test-aes
+test-aes: CFLAGS += -O -march=armv8-a+aes
+test-aes: test-aes-main.c.inc
+
 # Vector SHA1
 sha1-vector: CFLAGS=-O3
 sha1-vector: sha1.c
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index f2ee7a4db7..fdf757c6ce 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -28,6 +28,10 @@ run-test-i386-bmi2: QEMU_OPTS += -cpu max
 test-i386-adcox: CFLAGS=-O2
 run-test-i386-adcox: QEMU_OPTS += -cpu max
 
+test-aes: CFLAGS += -O -msse2 -maes
+test-aes: test-aes-main.c.inc
+run-test-aes: QEMU_OPTS += -cpu max
+
 #
 # hello-i386 is a barebones app
 #
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index b084963b9a..5721c159f2 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -36,5 +36,6 @@ run-vector: QEMU_OPTS += -cpu POWER10
 
 PPC64_TESTS += signal_save_restore_xer
 PPC64_TESTS += xxspltw
+PPC64_TESTS += test-aes
 
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index 9973ba3b5f..4b14a67f48 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -1,6 +1,13 @@
 # -*- Mode: makefile -*-
 # RISC-V specific tweaks
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-mrv64g_zk, CROSS_CC_HAS_ZK) \
+	) 3> config-cc.mak
+
+-include config-cc.mak
+
 VPATH += $(SRC_PATH)/tests/tcg/riscv64
 TESTS += test-div
 TESTS += noexec
@@ -9,3 +16,9 @@ TESTS += noexec
 TESTS += test-noc
 test-noc: LDFLAGS = -nostdlib -static
 run-test-noc: QEMU_OPTS += -cpu rv64,c=false
+
+ifneq ($(CROSS_CC_HAS_ZK),)
+TESTS += test-aes
+test-aes: CFLAGS += -O -march=rv64gzk
+run-test-aes: QEMU_OPTS += -cpu rv64,zk=on
+endif
-- 
2.34.1
