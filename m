Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802685njk;
        Mon, 2 Dec 2024 05:14:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvCje061m2Re7aMNiTXUZn3PNMjqt3v9H7GCtfHXU4qbpKmAStH1oA4XZ8j4GoXp7la90+Yx/o3iCLKg==@linaro.org
X-Received: by 2002:a05:6000:1544:b0:385:e0ea:d4ef with SMTP id ffacd0b85a97d-385e0ead6a4mr9044538f8f.58.1733145298037;
        Mon, 02 Dec 2024 05:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145298; cv=none;
        d=google.com; s=arc-20240605;
        b=M99Y/PxHq8WodiVh6bQ5P+ctNKfFphX7vbyQ6kKaKlsUx4lIVXBDHi1zofDYgDIWOo
         We7JI6FUSeyu+Wr7TNF/MTnMCZ8tKYWGBD3PDyJM1r/2eQOEKoesXT+Z9Gd9ni2QS/IJ
         z5NDnkYhKnkQFouG5SJosz3ZMT//69syJPhRMPNQDoouwlmXdEAouHsG2aV7XnY5ccS6
         JOK9FOofNGsjJTamKedkKlxd4n2f0cgcr5qcjEqVgyrKYg3J05PzxWzB4ATMRw0BlpcA
         Utv+J8xIRTnEqg8EJ4v3Z9VZd+ItrzNMN2z0hGU1Yir8YcY5t97lfyqF1lRUyE+x63xU
         tFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SF+s3/3GUKM6ErlG9DZAUNNlPEUN5YnIqVqgW7tQx0c=;
        fh=KaSgDw9197lD8TPVJrjtVvYQQ9+3oSKwqBgZfnUpbVU=;
        b=BKKXQiA+9FbxW2MzXpe9c7L+ZEo3RjC7UVtimGT58ddfilzgXGHA7ehiTR4v5doSu3
         2cxfNeBCd6hlgezKfcyDo3zxWabKE8eQ1ftqP5f1loUZ59GMKXe0ZIONwmhEwV5zEVgN
         BMJS3cuJETwgmhVagly9pvfXNp+wzJGT3UsriBMWRCIlKP39/3SLg7oHfF7cTMU9nbQI
         I+GszmDTz6l8yT3blWyUuFWRQXx2COVm4oOybjOAgKJaeVdMuR20S2DgEiMoqHiOoEwz
         2+S061YweoJPuzTK4Jq1xutEBR0dWDrlkSzu6PjcGK29fbl5ZXXlsmxlMH/E37v8IdXY
         LiqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ovinkYKj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e9f88eb1sor885343f8f.10.2024.12.02.05.14.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ovinkYKj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145297; x=1733750097; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SF+s3/3GUKM6ErlG9DZAUNNlPEUN5YnIqVqgW7tQx0c=;
        b=ovinkYKjy9WhH/DFoZaSPF7oHpXS0PEguPQiCCtXqz1WvcDBHFMux71G5yPOYhc7KB
         68qMOCGduxb0+0LpgLaS1ZFOpM0HIdMXXvRg+dJnc68yHhCq71kbpZy3bevXbnXxX3lE
         c6SBrRHQZMZFadJ2+9KvLX4FWr3V+kRiKw7GQezcgVilL3u6HjKyVoYt+buox9tTaFwj
         D2jFLYqSqazzruY6HQOi3Pu8iiP4XTkFETHbZGFEpZcGsY1K/OgJ+H3QdvjJsYWN+lTm
         p22AMAxfvXDO8ifte/B73RlzcYWLcBo+g4545ewxP/k/FFOMtBWWDvf+2J9LkSL+2O55
         nZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145297; x=1733750097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF+s3/3GUKM6ErlG9DZAUNNlPEUN5YnIqVqgW7tQx0c=;
        b=PwGSBknEnVAiUDfV2lQlOlM2uCp64cYw5rXExlYY2ddr9er5oCac0UWiDq4L0u1JVo
         Kf+cRn8p+6sEo/VSKvg4oXCbMjjwBFK/pdyYRMBeOfnfSrd+ITyabe+pU5m+V1HIDSd0
         N0KzSeNJ7BESu3b2Ci1s3NyDCygjExTwaw9QDblhRPCLyO3vLKa25NGqRJj0igPPNEVu
         1iEMIuzV8zBEcvEGEBigbP6hGWVqOWJD9is0m2BCLAMMwrN71jPFm9EZ8VK0JPbPGu3R
         g/+pnwJs6oIJKODJCbmhz1aNwZo2yr93wZDbzTIJjTitisr7qAhw9t0oiCCW6M8Lb30x
         aydQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkmcdsBs93W+gxe4R8JyKKdpdB+Iw6nvhL9J4kB7DBKIa3HkZsVJsnhzukHUH4ksRD8kTcIUC0OBJYrg==@linaro.org
X-Gm-Message-State: AOJu0Yy5MgbVBDPzDUnPJaW6gLrykwv58Wsqe9xyyxwZPgGtqAoeRY5z
	EmPBYt7+RXyDgxKS8SQra7rJeVdDzJGDFglZuJRjaWkRSynd+7reMoyKgh8wsnlp8xnAj9ALCdq
	u0K0=
X-Gm-Gg: ASbGncsHjIZaC6/BypwYnE0VWpJQgLywXfe7IGtpul1lFJ/xCKFnlPKO0R/xCibspGI
	xiPNVyKn/cjSCpQWc2FLwzu3wZrHf6elOGdS0Q0Jwkzwd4fSIsRVDdPdF730u5BQSGR5LYRpaqw
	/UrkXSD2vcImlIxbu8CMghpYths076chdy1qG3+pDiXV9LdJFpO5xbhugp5wbJLqBt9S35Z9LNa
	jt+rv6B3FxksujGchvekFYogztr5FIj9242UMgI1pcMQKWsQWtGHWc=
X-Google-Smtp-Source: AGHT+IHZbR8myEJqrFSbtsWW3Ke9b1O77ziqMLQJzRs9zmdRAxpEkQbXVz1J5DH5fUiXKa5Y7BrB/Q==
X-Received: by 2002:a05:6000:381:b0:382:5177:3a4f with SMTP id ffacd0b85a97d-385c6edc3ccmr16561180f8f.49.1733145297319;
        Mon, 02 Dec 2024 05:14:57 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:56 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 51/54] target/hexagon: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:44 +0000
Message-Id: <20241202131347.498124-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Gks2zI+ZLVH8

Set the default NaN pattern explicitly for hexagon.
Remove the ifdef from parts64_default_nan(); the only
remaining unconverted targets all use the default case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/hexagon/cpu.c           | 2 ++
 fpu/softfloat-specialize.c.inc | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 020038fc490..c9aa9408ec8 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -286,6 +286,8 @@ static void hexagon_cpu_reset_hold(Object *obj, ResetType type)
 
     set_default_nan_mode(1, &env->fp_status);
     set_float_detect_tininess(float_tininess_before_rounding, &env->fp_status);
+    /* Default NaN value: sign bit set, all frac bits set */
+    set_float_default_nan_pattern(0b11111111, &env->fp_status);
 }
 
 static void hexagon_cpu_disas_set_info(CPUState *s, disassemble_info *info)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 06185237d0f..5954a6213b9 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -136,10 +136,6 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
     uint8_t dnan_pattern = status->default_nan_pattern;
 
     if (dnan_pattern == 0) {
-#if defined(TARGET_HEXAGON)
-        /* Sign bit set, all frac bits set. */
-        dnan_pattern = 0b11111111;
-#else
         /*
          * This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
          * S390, SH4, TriCore, and Xtensa.  Our other supported targets
@@ -152,7 +148,6 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
             /* sign bit clear, set frac msb */
             dnan_pattern = 0b01000000;
         }
-#endif
     }
     assert(dnan_pattern != 0);
 
-- 
2.34.1
