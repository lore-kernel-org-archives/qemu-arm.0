Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2191090ejb;
        Tue, 30 May 2023 06:52:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Sqv78VLCKXikWtlTwjzhOTqny7YTigV6SeFpazS5ZTAzXwMh3Y8e7utgSFOXt+JegDh8e
X-Received: by 2002:aca:1c0e:0:b0:398:9ae:50cc with SMTP id c14-20020aca1c0e000000b0039809ae50ccmr1075147oic.41.1685454737834;
        Tue, 30 May 2023 06:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685454737; cv=none;
        d=google.com; s=arc-20160816;
        b=CzBKnBf6rCKPxwZWwVY3jNvQK5nL4Yzt2yGMbvqcRwQ9/zfvvVwu20yOqky5WyeS5Y
         7EzkoUOICK/12prRSx4RDF7lCiqCHZotZJGqjgbR5PLiape0toTiPTzdP7vVRfVyTlMz
         6EGK6n6YB+ip9MDsR4KosCQU1Ey+FIC6kitwTxYNT0YKvCs7E8BO9dU7hzoiE0b+d8yA
         4hrFCI1/rBC3u+uqSI2mRTfWCLiFb30h82RHm51hlPeWu5cYiWzlP4sx1vzLfy99+Amz
         PokHghGF28EZ+HEiLqUtkXmRoVDSmP3r0T7vkyimXVdk8/UUvkCvdmYrnGcS+X1Dqk9f
         JrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=eSsS+c4O61LoGylmuknmw4TIJpG7CvhXdLoSvJJxPjc=;
        b=kcFF+pRxUN19mHHQl3xZbeFM+69nyIOPJu9OxpYmqFqT2O1qfDpxxAgCSLbZSZxuOk
         qTBvCmL6MdpH+tEyZgJqZRrwM1YIJOdHoG0Bk6OsX5RchO1zLzBwGAe2hJerRjOUhl/x
         5/Wm5TwiGsuSdFXA/2gTxU6hHZVJSv6jUCzRgY3w0ThLY4g50jQcR3vTyYLSWmX70j40
         pOOWtbD6omxNj9GbwqZNwS4vpOC+tLg1o+D0fisqde0W0CKHUbHPL5x9P+AyLxYHgX7o
         yx4TdVAPgrbpUSVNkgO1COUdH6gUkydEXr21ts1yhOhGpLo4pW9fJ7EjvVSby//uIQ7W
         Ap8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dGa7mlCe;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id r63-20020acac142000000b003982b785a8bsi5643083oif.291.2023.05.30.06.52.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 May 2023 06:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dGa7mlCe;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78FFD6308E;
	Tue, 30 May 2023 13:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C30DC433EF;
	Tue, 30 May 2023 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685454736;
	bh=3ndAr36uTBwYjy6I77BBaX0Rj0ALeAnFxLE6q/v9q9w=;
	h=From:To:Cc:Subject:Date:From;
	b=dGa7mlCe1a3Ou8/ZRKcAhDhOSjbuSLTHvFa3ABPMVScDhWK+XkBst/2iNCzpC8JyD
	 +fR2K85IaKAiRxmCR8iL/NHvsfgW7NvnTGvTxdYcGpb5rObECbUKdvqTv6hjhedtU4
	 GkzJHYunzOa7YciPOancSSN/YBpoYG5iT5VfJjkXZsf94oan9oLXf3embDGYKccgRH
	 53NCbluPUOmq5lskUqp2Y7jr4Bz6KN5+0v6beGdayjDBInioSIiy1CIwIW1MLtVTuE
	 9O8//us5foMIe1KS69xENnbXHVXXMgwUWNSnhUwAf6BHUBPkiltDi2sPxS+8DPHie0
	 NdjponWBDUZjQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH] target/arm: use x86 intrinsics to implement AES instructions
Date: Tue, 30 May 2023 15:52:04 +0200
Message-Id: <20230530135204.2903761-1-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890; i=ardb@kernel.org; h=from:subject; bh=3ndAr36uTBwYjy6I77BBaX0Rj0ALeAnFxLE6q/v9q9w=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIaX0f2Mtm1lPQIfLz7Lzf5sPpfVltpTUzFjxJm3uv5NLN 6ZbRVd2lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlEdDD8j1R8V3zXXUZH/x+f XPOVjb/OCvfeX3br2PIppw7+3BF5YAojw/5V/zpN26Z4ymqqPX0542D94rd8rn4RP99WzeH6XjT NghMA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 83XEcP/xQtM9

ARM intrinsics for AES deviate from the x86 ones in the way they cover
the different stages of each round, and so mapping one to the other is
not entirely straight-forward. However, with a bit of care, we can still
use the x86 ones to emulate the ARM ones, which makes them constant time
(which is an important property in crypto) and substantially more
efficient.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Suggestions welcome on how to make this more generic across targets and
compilers etc.

 target/arm/tcg/crypto_helper.c | 43 ++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d28690321f..961112b6bd 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -18,10 +18,32 @@
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
+#ifdef __x86_64
+#pragma GCC target ("aes")
+#include <cpuid.h>
+#include <wmmintrin.h>
+
+static bool have_aes(void)
+{
+    static int cpuid_have_aes = -1;
+
+    if (cpuid_have_aes == -1) {
+        unsigned int eax, ebx, ecx, edx;
+        int ret = __get_cpuid(0x1, &eax, &ebx, &ecx, &edx);
+
+        cpuid_have_aes = ret && (ecx & bit_AES);
+    }
+    return cpuid_have_aes > 0;
+}
+#endif
+
 union CRYPTO_STATE {
     uint8_t    bytes[16];
     uint32_t   words[4];
     uint64_t   l[2];
+#ifdef __x86_64
+    __m128i    vec;
+#endif
 };
 
 #if HOST_BIG_ENDIAN
@@ -54,6 +76,16 @@ static void do_crypto_aese(uint64_t *rd, uint64_t *rn,
     union CRYPTO_STATE st = { .l = { rn[0], rn[1] } };
     int i;
 
+#ifdef __x86_64__
+    if (have_aes()) {
+        __m128i *d = (__m128i *)rd;
+
+        *d = decrypt ? _mm_aesdeclast_si128(rk.vec ^ st.vec, (__m128i){})
+                     : _mm_aesenclast_si128(rk.vec ^ st.vec, (__m128i){});
+        return;
+    }
+#endif
+
     /* xor state vector with round key */
     rk.l[0] ^= st.l[0];
     rk.l[1] ^= st.l[1];
@@ -217,6 +249,17 @@ static void do_crypto_aesmc(uint64_t *rd, uint64_t *rm, bool decrypt)
     union CRYPTO_STATE st = { .l = { rm[0], rm[1] } };
     int i;
 
+#ifdef __x86_64__
+    if (have_aes()) {
+        __m128i *d = (__m128i *)rd;
+
+        *d = decrypt ? _mm_aesdec_si128(_mm_aesenclast_si128(st.vec, (__m128i){}),
+                                        (__m128i){})
+                     : _mm_aesenc_si128(_mm_aesdeclast_si128(st.vec, (__m128i){}),
+                                        (__m128i){});
+        return;
+    }
+#endif
     for (i = 0; i < 16; i += 4) {
         CR_ST_WORD(st, i >> 2) =
             mc[decrypt][CR_ST_BYTE(st, i)] ^
-- 
2.39.2
