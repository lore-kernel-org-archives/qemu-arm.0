Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2778447ejb;
        Wed, 31 May 2023 04:22:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pVgvrrUu503YfeUTaWLnU0/7emYQUnKfZcqfMVAMMh0NrIr9+C786MO3kSCoDIJ/0CEud
X-Received: by 2002:a05:6870:e2c5:b0:19f:81ec:9b2a with SMTP id w5-20020a056870e2c500b0019f81ec9b2amr2246993oad.49.1685532167530;
        Wed, 31 May 2023 04:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685532167; cv=none;
        d=google.com; s=arc-20160816;
        b=lfsUOJlfV/Y8cbkNQaQ98YvmANvgPniYDq4pVPkMwndXwUu34Du+OeIlGLLqpzl00Y
         PRacF+tntKWQWhYJPpixrr7pJ4nisexevdNuJ4cRyAi2aveJj74DvZyWQApX8vOuXSAZ
         TAIy7fC5paQSSnI8/Wk8Wp8aWPyVDRVgq1Sk5b4qnUHFNIE1hqKzJf0qMi/lv2riytXp
         oKcjJGL/tfoYX/ZjjvO44QppXqcBqf4WBmB7YcOu6A4JKq1qeneQ4Bwh+6jzgw+/SJl2
         Ac6FFDVzpZxjyl849ocDa4MOPOrCCbEEl/5IVqi4E5Q8BAR3enZCkWxNmSRh3uvZFrrr
         4nxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+Oezg0MWnxX2YFVriZJztDdmiBzvE407OzLfzM4ghWI=;
        b=LwSzbQHkY+Zx3RB3E++dqO+UNG+yav5G39DvGqe0Lu8YvESmcgmfC2n5Fi0pjTMrd9
         VWCTIrc08fXVU6XnNMbLR5zi7fYHkpBmt22u9QlcvrOXLBIjo5KkM1eH4W2PvaWHtkvI
         5gs2YHb2IeiTx0/7mc0HZYMKgL3LGjPsWj/tbk1InYHlxE6bmUmC8h+dc3wwveDC//i5
         Sd9/Eq5+aL0YfkHDqJeJlVgv1RmcgbPM6tegJf7eB56O4QkiyJsjewn4QcyfiGjIPsLb
         pdwtWIxZk+I1duQ7iwCX8K69iCeTN4ArpXfocXH5tWToblAF5HsoXB8zqMXCESaGiu/x
         8HkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SIUwjkDX;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id y1-20020a056870a34100b0019f632385c9si540297oak.335.2023.05.31.04.22.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 May 2023 04:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SIUwjkDX;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3751C62B8D;
	Wed, 31 May 2023 11:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B4CC4339E;
	Wed, 31 May 2023 11:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685532166;
	bh=CmgtESpaAov4b9gatdrn0WcbuhDN0cK8PVQan2txeW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SIUwjkDX9OGkU0v93WA+tIL71oUUWu0MLM+ab0uSmeLhAv+KHtHqNhxcPtWF0jVjL
	 F1C8f9Q20l4U8Q1hgrcYUV0DHPoHyndQDQiwJG6ca5kO82JGDKiQDHHbi/Rt3hFbvY
	 BNvMcql2Vz6qnnoYQfot7pgKdQgLRbCapFA+koW9OFj7H5AyCi9w+oy8ojyhGqhoL4
	 owGEfz7Pmy6w+AXc1UfRMLBUNBUQckxSYNdOuJy8A6nhEwmiTalxKLr4mHmumHloav
	 6ouP5k4ROFPJm46vEyMrQHU2tX3nrxK5uz6meMOhMaIFxofPt4dhkkHqFmkee6KjJY
	 FqDNyFN+/oHUQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/2] target/arm: use x86 intrinsics to implement AES instructions
Date: Wed, 31 May 2023 13:22:38 +0200
Message-Id: <20230531112239.3164777-2-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531112239.3164777-1-ardb@kernel.org>
References: <20230531112239.3164777-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305; i=ardb@kernel.org; h=from:subject; bh=CmgtESpaAov4b9gatdrn0WcbuhDN0cK8PVQan2txeW0=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIaVc99el322rmW4wnLFa8efPkmwxt/I9kXoCfyfl7o5Pl a2eY72so5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk9gGG/2UiixvzEltk2X+8 cDNoVdlz94GsZl/Ajv1HtZI77DQNhRkZrnHM4TPtOSw+pbnqxudj3Z+e8f6YcqNWtl6b4YLH/Zx wbgA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-TUID: QzX0+NK+c69n

ARM intrinsics for AES deviate from the x86 ones in the way they cover
the different stages of each round, and so mapping one to the other is
not entirely straight-forward. However, with a bit of care, we can still
use the x86 ones to emulate the ARM ones, which makes them constant time
(which is an important property in crypto) and substantially more
efficient.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 host/include/i386/host/cpuinfo.h |  1 +
 target/arm/tcg/crypto_helper.c   | 37 ++++++++++++++++++--
 util/cpuinfo-i386.c              |  1 +
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/host/include/i386/host/cpuinfo.h b/host/include/i386/host/cpuinfo.h
index a6537123cf80ec5b..073d0a426f31487d 100644
--- a/host/include/i386/host/cpuinfo.h
+++ b/host/include/i386/host/cpuinfo.h
@@ -26,6 +26,7 @@
 #define CPUINFO_AVX512VBMI2     (1u << 15)
 #define CPUINFO_ATOMIC_VMOVDQA  (1u << 16)
 #define CPUINFO_ATOMIC_VMOVDQU  (1u << 17)
+#define CPUINFO_AES             (1u << 18)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d28690321f0b86ea..747c061b5a1b0e5e 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -18,10 +18,21 @@
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
+#ifdef __x86_64__
+#include "host/cpuinfo.h"
+#include <wmmintrin.h>
+#define TARGET_AES  __attribute__((__target__("aes")))
+#else
+#define TARGET_AES
+#endif
+
 union CRYPTO_STATE {
     uint8_t    bytes[16];
     uint32_t   words[4];
     uint64_t   l[2];
+#ifdef __x86_64__
+    __m128i    vec;
+#endif
 };
 
 #if HOST_BIG_ENDIAN
@@ -45,8 +56,8 @@ static void clear_tail_16(void *vd, uint32_t desc)
     clear_tail(vd, opr_sz, max_sz);
 }
 
-static void do_crypto_aese(uint64_t *rd, uint64_t *rn,
-                           uint64_t *rm, bool decrypt)
+static void TARGET_AES do_crypto_aese(uint64_t *rd, uint64_t *rn,
+                                      uint64_t *rm, bool decrypt)
 {
     static uint8_t const * const sbox[2] = { AES_sbox, AES_isbox };
     static uint8_t const * const shift[2] = { AES_shifts, AES_ishifts };
@@ -54,6 +65,16 @@ static void do_crypto_aese(uint64_t *rd, uint64_t *rn,
     union CRYPTO_STATE st = { .l = { rn[0], rn[1] } };
     int i;
 
+#ifdef __x86_64__
+    if (cpuinfo & CPUINFO_AES) {
+        __m128i *d = (__m128i *)rd, z = {};
+
+        *d = decrypt ? _mm_aesdeclast_si128(rk.vec ^ st.vec, z)
+                     : _mm_aesenclast_si128(rk.vec ^ st.vec, z);
+        return;
+    }
+#endif
+
     /* xor state vector with round key */
     rk.l[0] ^= st.l[0];
     rk.l[1] ^= st.l[1];
@@ -78,7 +99,7 @@ void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
 
-static void do_crypto_aesmc(uint64_t *rd, uint64_t *rm, bool decrypt)
+static void TARGET_AES do_crypto_aesmc(uint64_t *rd, uint64_t *rm, bool decrypt)
 {
     static uint32_t const mc[][256] = { {
         /* MixColumns lookup table */
@@ -217,6 +238,16 @@ static void do_crypto_aesmc(uint64_t *rd, uint64_t *rm, bool decrypt)
     union CRYPTO_STATE st = { .l = { rm[0], rm[1] } };
     int i;
 
+#ifdef __x86_64__
+    if (cpuinfo & CPUINFO_AES) {
+        __m128i *d = (__m128i *)rd, z = {};
+
+        *d = decrypt ? _mm_aesimc_si128(st.vec)
+                     : _mm_aesenc_si128(_mm_aesdeclast_si128(st.vec, z), z);
+        return;
+    }
+#endif
+
     for (i = 0; i < 16; i += 4) {
         CR_ST_WORD(st, i >> 2) =
             mc[decrypt][CR_ST_BYTE(st, i)] ^
diff --git a/util/cpuinfo-i386.c b/util/cpuinfo-i386.c
index ab6143d9e77291f1..3043f066c0182dc8 100644
--- a/util/cpuinfo-i386.c
+++ b/util/cpuinfo-i386.c
@@ -39,6 +39,7 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
         info |= (c & bit_SSE4_1 ? CPUINFO_SSE4 : 0);
         info |= (c & bit_MOVBE ? CPUINFO_MOVBE : 0);
         info |= (c & bit_POPCNT ? CPUINFO_POPCNT : 0);
+        info |= (c & bit_AES ? CPUINFO_AES : 0);
 
         /* For AVX features, we must check available and usable. */
         if ((c & bit_AVX) && (c & bit_OSXSAVE)) {
-- 
2.39.2
