Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802368njk;
        Mon, 2 Dec 2024 05:14:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMVwvH+SQ6+Nzy10L59y2IJtIdOQN56+ulhHhUUQXviUkGLTOzoW3c/y+0urbTWHpcaiakdG+Se9qGJw==@linaro.org
X-Received: by 2002:a05:6512:124a:b0:53d:e568:ac95 with SMTP id 2adb3069b0e04-53df00de101mr10416280e87.25.1733145281422;
        Mon, 02 Dec 2024 05:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145281; cv=none;
        d=google.com; s=arc-20240605;
        b=cKtPAcDGT5bDsx/o9NmLj2qSnfTIMcMzA2hbbq0k4RZbm2Y4RUQ25kA47E8dQrOj0x
         vpH0b4DAZDNgmQrlL3Ok8MrY9OARGB5S8GT5u1kZYoMiTANxzrSoQ4e44hiWpMLAOXJ1
         GMh3gSanzZ9Qt70uFVjeCyrokE0lYLZV99jevigO0mRIGiT4mo2dxxcgisG/Y9mErPku
         ctVyGRdZrmF1JNGqb7EXLVGrFqOuhhV2Okv2ofcdbWgHoX1xst34d0SGLMsiwltLvSCt
         KTKzgaqlElTWrxX5n4ngtgFBpjeNCjILmBYQqmxDeSDYKpZYJL02XQxHewwqzZY6oFzW
         cTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yKV708lbVufub1eS0i2nRrYGl0qdKJsRNu5HvpEXaMM=;
        fh=uo0WaSufTBwfA1RrU1imYwYiEkuqT4jrCSHNQ6Z8Pw8=;
        b=ZXFVOnYwJ8Ov/hSmK9XmmyH0XUcKhad81R5jh4oZD4P3GlEZr4EbQ6v+uVSx3BAJaU
         RSGn2ZKMFxzWoqYzV7kRHV6tJBq2xEIktakpcEkbdBTV71cjM4NXQbjXMru4xvZkWT7g
         /eE8T3eWwBO+G76X79UFHDnANCyUHaaxkClLXwnOPD3OkTQI7XSdvRCiKlD73oRDC5gW
         VQAI+nxHKhl0HGRssHvzv6xUStu2yZcQ1Eh60prc6K9fF14vS8IjutcAbPnsBXslmHbf
         OoMDCygsR6pS9BakV3bTDBonN09M49OM3hSXvfvllphuX3J+2UP3wKzDRo9kI+UB583f
         VuNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OOgubZPz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a2eb8sor32269385e9.10.2024.12.02.05.14.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OOgubZPz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145281; x=1733750081; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKV708lbVufub1eS0i2nRrYGl0qdKJsRNu5HvpEXaMM=;
        b=OOgubZPzwkJdExBWJtITz/mP32WaQyU5rmPBmBqK0Fj6zmdYNhjOQrH2hwkfKozd41
         Lez6pYi9bXWzD+l6w7aCQ8qf9AOMo5TpZaZRGtkP2qeY3yiZOjqJvhaY+vI9zMTVcNRa
         P/ABmzftobKBJhn97vjFZVqp9IvFU041JtclwJ12tDPa6JK6VSMICHQbeWUZDFlHL0yq
         T93sXJrLpP6dt5LoAbbBUuDmecBRfxkguyhYQOyC6Oi2cYJQmX2SXZ05hUg2KYXgTM/q
         BFSxZYWTCjMP1oFlan4SvM7q2l2UvBUlksauDvhkkDO0VD1zPcXRJccFwhBR63HRD4os
         Mcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145281; x=1733750081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKV708lbVufub1eS0i2nRrYGl0qdKJsRNu5HvpEXaMM=;
        b=YmZCkBlAxAVX+zLS0K0KaviZ1OjWoyOw0aIjkObUHX1uUHe4SbI6GXFoGNRjTPA67t
         3NXZxoGkyMzNaxANC9191Y7ESND01nOYvs3VCbeVaDyr+kwprrQB1XdoGK0UrfZEckxV
         UzMkfBZZXtLQ+cz3VDRArpx3+3csnBnjFlfWOxC0ebvX2bE1AzXMLWVn3rOfKRRnqmI7
         cU9HnFdsGWvAwvQ9ue4M4RK2PrF69Tle4jwWdrZXPhqC4rlgRCFdEiJFOZPidbFUMFwq
         Cor0qVPda6twTXunslXOgPvVjwarvuJo9GY6Xw4bQvbdA9/y6uYKSSWikgLG/eoh8Dn7
         fy8g==
X-Forwarded-Encrypted: i=1; AJvYcCX6h9B88ZkKRWAk4CtSBg4K9CrG0BW8tt2LmvF7fUpP4Hose34cQ1G22abbFpi79l9ISeAC8cEpnzvktw==@linaro.org
X-Gm-Message-State: AOJu0YyeYqS3wpUHQxLVVJFdvM+944oWSpQLAT/Hyd72hLjumwSYwLL1
	1cE3enfAXJQM/byGOsFEXenNGKSygTRZrjEOx91VGUeN4nPkYu7v57ElMAOWB6n72A==
X-Gm-Gg: ASbGncu2FdwoEvF5TwmoGkg+2IhBSBpMN/Eclxkib61ydvSotshea6JI34F5EDtGVxi
	Xuet2M2RokKbDe43JXsAnO5N3EIfFWcqgyIAuaFzZcQjXZ4ZzfLd0h4dVjMkzG8mZpDiuzUWA67
	zp5PXvHrptUHff3W9Di+W0PIYDIk4n4a8V1BPhsmKqa3bNBVqsQLo8rRW4arOOyZssewcOGiWCX
	z1TetTpfxvNeF8GfTUA9BzvXEaMpXcslh1WBc3kgnXEvRATkNOh0Xo=
X-Google-Smtp-Source: AGHT+IFELuFkVQJehEVSKgoZXY73udDUueU5hfLBaI5Ys4CGnWxhP2s0m/NuLhCYSvhKN/52NWLe5A==
X-Received: by 2002:a05:6000:42ca:b0:385:f0dc:c9fd with SMTP id ffacd0b85a97d-385f0dccb93mr2451898f8f.27.1733145280733;
        Mon, 02 Dec 2024 05:14:40 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 34/54] fpu: Allow runtime choice of default NaN value
Date: Mon,  2 Dec 2024 13:13:27 +0000
Message-Id: <20241202131347.498124-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: z2iT8eLbbSPs

Currently we hardcode the default NaN value in parts64_default_nan()
using a compile-time ifdef ladder. This is awkward for two cases:
 * for single-QEMU-binary we can't hard-code target-specifics like this
 * for Arm FEAT_AFP the default NaN value depends on FPCR.AH
   (specifically the sign bit is different)

Add a field to float_status to specify the default NaN value; fall
back to the old ifdef behaviour if these are not set.

The default NaN value is specified by setting a uint8_t to a
pattern corresponding to the sign and upper fraction parts of
the NaN; the lower bits of the fraction are set from bit 0 of
the pattern.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/fpu/softfloat-helpers.h | 11 +++++++
 include/fpu/softfloat-types.h   | 10 ++++++
 fpu/softfloat-specialize.c.inc  | 55 ++++++++++++++++++++-------------
 3 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 10a6763532c..dceee23c823 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -93,6 +93,12 @@ static inline void set_float_infzeronan_rule(FloatInfZeroNaNRule rule,
     status->float_infzeronan_rule = rule;
 }
 
+static inline void set_float_default_nan_pattern(uint8_t dnan_pattern,
+                                                 float_status *status)
+{
+    status->default_nan_pattern = dnan_pattern;
+}
+
 static inline void set_flush_to_zero(bool val, float_status *status)
 {
     status->flush_to_zero = val;
@@ -154,6 +160,11 @@ static inline FloatInfZeroNaNRule get_float_infzeronan_rule(float_status *status
     return status->float_infzeronan_rule;
 }
 
+static inline uint8_t get_float_default_nan_pattern(float_status *status)
+{
+    return status->default_nan_pattern;
+}
+
 static inline bool get_flush_to_zero(float_status *status)
 {
     return status->flush_to_zero;
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 84ba4ed20e6..79ca44dcc30 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -303,6 +303,16 @@ typedef struct float_status {
     /* should denormalised inputs go to zero and set the input_denormal flag? */
     bool flush_inputs_to_zero;
     bool default_nan_mode;
+    /*
+     * The pattern to use for the default NaN. Here the high bit specifies
+     * the default NaN's sign bit, and bits 6..0 specify the high bits of the
+     * fractional part. The low bits of the fractional part are copies of bit 0.
+     * The exponent of the default NaN is (as for any NaN) always all 1s.
+     * Note that a value of 0 here is not a valid NaN. The target must set
+     * this to the correct non-zero value, or we will assert when trying to
+     * create a default NaN.
+     */
+    uint8_t default_nan_pattern;
     /*
      * The flags below are not used on all specializations and may
      * constant fold away (see snan_bit_is_one()/no_signalling_nans() in
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 9f913ce20ab..b1ec534983c 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -133,35 +133,46 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
 {
     bool sign = 0;
     uint64_t frac;
+    uint8_t dnan_pattern = status->default_nan_pattern;
 
+    if (dnan_pattern == 0) {
 #if defined(TARGET_SPARC) || defined(TARGET_M68K)
-    /* !snan_bit_is_one, set all bits */
-    frac = (1ULL << DECOMPOSED_BINARY_POINT) - 1;
-#elif defined(TARGET_I386) || defined(TARGET_X86_64) \
+        /* Sign bit clear, all frac bits set */
+        dnan_pattern = 0b01111111;
+#elif defined(TARGET_I386) || defined(TARGET_X86_64)    \
     || defined(TARGET_MICROBLAZE)
-    /* !snan_bit_is_one, set sign and msb */
-    frac = 1ULL << (DECOMPOSED_BINARY_POINT - 1);
-    sign = 1;
+        /* Sign bit set, most significant frac bit set */
+        dnan_pattern = 0b11000000;
 #elif defined(TARGET_HPPA)
-    /* snan_bit_is_one, set msb-1.  */
-    frac = 1ULL << (DECOMPOSED_BINARY_POINT - 2);
+        /* Sign bit clear, msb-1 frac bit set */
+        dnan_pattern = 0b00100000;
 #elif defined(TARGET_HEXAGON)
-    sign = 1;
-    frac = ~0ULL;
+        /* Sign bit set, all frac bits set. */
+        dnan_pattern = 0b11111111;
 #else
-    /*
-     * This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
-     * S390, SH4, TriCore, and Xtensa.  Our other supported targets
-     * do not have floating-point.
-     */
-    if (snan_bit_is_one(status)) {
-        /* set all bits other than msb */
-        frac = (1ULL << (DECOMPOSED_BINARY_POINT - 1)) - 1;
-    } else {
-        /* set msb */
-        frac = 1ULL << (DECOMPOSED_BINARY_POINT - 1);
-    }
+        /*
+         * This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
+         * S390, SH4, TriCore, and Xtensa.  Our other supported targets
+         * do not have floating-point.
+         */
+        if (snan_bit_is_one(status)) {
+            /* sign bit clear, set all frac bits other than msb */
+            dnan_pattern = 0b00111111;
+        } else {
+            /* sign bit clear, set frac msb */
+            dnan_pattern = 0b01000000;
+        }
 #endif
+    }
+    assert(dnan_pattern != 0);
+
+    sign = dnan_pattern >> 7;
+    /*
+     * Place default_nan_pattern [6:0] into bits [62:56],
+     * and replecate bit [0] down into [55:0]
+     */
+    frac = deposit64(0, DECOMPOSED_BINARY_POINT - 7, 7, dnan_pattern);
+    frac = deposit64(frac, 0, DECOMPOSED_BINARY_POINT - 7, -(dnan_pattern & 1));
 
     *p = (FloatParts64) {
         .cls = float_class_qnan,
-- 
2.34.1
