Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802291njk;
        Mon, 2 Dec 2024 05:14:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1LkwwCTUlovz+FHv++TVdLN0XZlf7O6De597NVcp6nEAdGH2KdBTBGNPS3OBLSoPoy+g1crt21vgTBg==@linaro.org
X-Received: by 2002:a05:6000:1a8a:b0:385:f979:7683 with SMTP id ffacd0b85a97d-385f97979b8mr951714f8f.37.1733145275604;
        Mon, 02 Dec 2024 05:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145275; cv=none;
        d=google.com; s=arc-20240605;
        b=K8AG02nrrDRByi6kExONunHn+m3d5zy6yBEJ+kU++yN01uNUanlCYdrbG0NqfQ9+tg
         Q4jFif2KIqqKk0EpeE2/DjuyL+peoBI6+TAO/4Skv5eosE0i2PYt1frQXiFZyxPJ0oXK
         d/TWyI1uYHGkeIu8Kiy18WoEiKBo1i7yXfQ44shJF3cbbv3/1wyOs2kCivUcmIWjUtW/
         86qAksPDGVslwHjKUBRTmbpuIdZ5CZPdBuCB+TtrfzoN4CU+LxMpqVV60zZSGT8thgWl
         cEb/YurdYKqvsMmUw7HXAMAshhCDmYj4bP4ejU7dAlxhIsjXWWUeBljfDtZ+BpN7bD3A
         gq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wdqAdxMo/Zjt+7gjYfOwzXdT/5QjRbRXYw8xftE2ZL0=;
        fh=RDypenWMBWFgjvRlTLJV+2zU4av1N4kioz9NCX7SAZ4=;
        b=KRGzpcnZH54CqtQfbN79LUZk10+vAVEsFffH4cJ/ILiLp3W/fO3BKZZzpZE1UCSJnI
         WDia3wlb83rN5AQoljhT1DJWFvC1TUW5GUyqBezwhBMm9AsNEImunK5iBY3UEvHowICJ
         Hy4kTW5x8GtyR4yfdBGQdmrEX0lmdgQjtieWDZSZPkzkUsCFYSHrPhvGcTSZp/U/DvWZ
         wOEfZ+L+ec9T5lhSmjTzNCX9pFyBk84Kq2EKAcxv7O4DUrckwJT8dBag+I4qUwrZgFXC
         fgrzPN8yMFi8N/LpbFWHiFkEhmeZkMSnLaQhp/65S+jC4br2HlTzKMojSLSjNPwpSN5m
         HgTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tWGKM3AM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd2d728sor2063738f8f.2.2024.12.02.05.14.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tWGKM3AM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145275; x=1733750075; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdqAdxMo/Zjt+7gjYfOwzXdT/5QjRbRXYw8xftE2ZL0=;
        b=tWGKM3AM0/dUEa9Z64mrmrR82KyvYp8nyd13BOINGIm88q+6wPpCRypSw1nEHUDhQp
         KLE4jFEarGmusfQgTfmXDqfpYHmrb792GN0qSH6dZfjgOnSKyVQ9gNTJAVNj6CMIARSp
         kS65LGSYICnvs4WQptVA02aK1Lbx89XaLmo2CGY17o7Et45imNr1sRJ1v+21t4UCrlpe
         ltjRAIsMjnl+PKcxnRaokSrrmLTuHiEGgzR7bOTZvFGL/GnpqTYsEKMZ+e9BaTCB8UG9
         vk8QGnwmD/tj5Mo7vLo/6ndGZPIX45wtstSAxJxVXfDq1H9OY8WVT23yRmk0dIwqVfGP
         e48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145275; x=1733750075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdqAdxMo/Zjt+7gjYfOwzXdT/5QjRbRXYw8xftE2ZL0=;
        b=UpaUrQgFfDH6tBrN4S8TW/dmVVh29tcBTuKcFO4gOpmqSyRzZkculQQdJM+gPLuw1F
         WKyDRhUPLWb4vIeCJvbc8CMfOu9o9tSpZ3RUVK0StlQqH0ixqvt01YGFuHnECxSZNlhh
         9A6SVjHpLq0eO7UvX6GpisKhY7qJ/M5Iqmol6rU/OP7ZqsckCuuQDqEz6Wqxj6xETgBd
         XfMjHhdQDZdcniJiS83ZYgyd6bWxcNpzR736hDQsjdDLljTJiwwQQ4EiGjtzp56K7vMA
         2IwT8E0W9wwHnjullKhwHzq9M6V5AkU+1Z6Ke5wRLdV48BHZLGsjBw8d68p2BAbX8fxs
         KlqA==
X-Forwarded-Encrypted: i=1; AJvYcCVDqbYmPUXm9TBJh5Zi3xZiN5SSB4L5oUZ9lgzP3LUx9SMyivjy9QvBpuIWiqEndfJGQVmnHUG0kMaZIA==@linaro.org
X-Gm-Message-State: AOJu0YyRFVeI4QabNrPJRzb6MNwe2grR2ZrpZlt8dpCYUkB4U4kbcp3w
	6TD239hh2u1GZ0fOyOW/pMGWipRg9IokMznn+L2MaHNfyH2EgO6k7/BUXOtXXsMzQQ==
X-Gm-Gg: ASbGnctNMJN0CKvUlp4XvTkB0UpUaY1TxNTh75g1DPlCe5KIZSzAFZfemlc/UPvPQOt
	ARu/VW+aNrS0juTYnGLdKfHutolI4pMvXOJguhDlCh3zJ7fsvwVrbJgVq5GfMDnmrr94kYN5uQ1
	OvWqXfbAGfk0JhWsNvBLMgS8XWJVKsqBh7Rbs22HSDzn/qoKRh47ItPZkKRrPArmRxMdOCoO29U
	ATlx1QOEI5/wX0KhhS01NYtLCSCGoNZehbeN+R7OSYEur5+RB9yDqc=
X-Google-Smtp-Source: AGHT+IHpLBkZrKDuWdn+SfRe1n4Bcn7GFrx0fDmm6XZ9hZ1GnazAJ/+blc2Smc6txIX9PHI2+r8AzQ==
X-Received: by 2002:a05:6000:2806:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-385ec8930bamr3048801f8f.32.1733145275036;
        Mon, 02 Dec 2024 05:14:35 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:34 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 28/54] softfloat: Create floatx80 default NaN from parts64_default_nan
Date: Mon,  2 Dec 2024 13:13:21 +0000
Message-Id: <20241202131347.498124-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: l1tHBCKhpMDi

We create our 128-bit default NaN by calling parts64_default_nan()
and then adjusting the result.  We can do the same trick for creating
the floatx80 default NaN, which lets us drop a target ifdef.

floatx80 is used only by:
 i386
 m68k
 arm nwfpe old floating-point emulation emulation support
    (which is essentially dead, especially the parts involving floatx80)
 PPC (only in the xsrqpxp instruction, which just rounds an input
    value by converting to floatx80 and back, so will never generate
    the default NaN)

The floatx80 default NaN as currently implemented is:
 m68k: sign = 0, exp = 1...1, int = 1, frac = 1....1
 i386: sign = 1, exp = 1...1, int = 1, frac = 10...0

These are the same as the parts64_default_nan for these architectures.

This is technically a possible behaviour change for arm linux-user
nwfpe emulation emulation, because the default NaN will now have the
sign bit clear.  But we were already generating a different floatx80
default NaN from the real kernel emulation we are supposedly
following, which appears to use an all-bits-1 value:
 https://elixir.bootlin.com/linux/v6.12/source/arch/arm/nwfpe/softfloat-specialize#L267

This won't affect the only "real" use of the nwfpe emulation, which
is ancient binaries that used it as part of the old floating point
calling convention; that only uses loads and stores of 32 and 64 bit
floats, not any of the floatx80 behaviour the original hardware had.
We also get the nwfpe float64 default NaN value wrong:
 https://elixir.bootlin.com/linux/v6.12/source/arch/arm/nwfpe/softfloat-specialize#L166
so if we ever cared about this obscure corner the right fix would be
to correct that so nwfpe used its own default-NaN setting rather
than the Arm VFP one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 5fbc953e71e..9f913ce20ab 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -227,17 +227,17 @@ static void parts128_silence_nan(FloatParts128 *p, float_status *status)
 floatx80 floatx80_default_nan(float_status *status)
 {
     floatx80 r;
+    /*
+     * Extrapolate from the choices made by parts64_default_nan to fill
+     * in the floatx80 format. We assume that floatx80's explicit
+     * integer bit is always set (this is true for i386 and m68k,
+     * which are the only real users of this format).
+     */
+    FloatParts64 p64;
+    parts64_default_nan(&p64, status);
 
-    /* None of the targets that have snan_bit_is_one use floatx80.  */
-    assert(!snan_bit_is_one(status));
-#if defined(TARGET_M68K)
-    r.low = UINT64_C(0xFFFFFFFFFFFFFFFF);
-    r.high = 0x7FFF;
-#else
-    /* X86 */
-    r.low = UINT64_C(0xC000000000000000);
-    r.high = 0xFFFF;
-#endif
+    r.high = 0x7FFF | (p64.sign << 15);
+    r.low = (1ULL << DECOMPOSED_BINARY_POINT) | p64.frac;
     return r;
 }
 
-- 
2.34.1
