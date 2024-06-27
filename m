Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp248448njb;
        Thu, 27 Jun 2024 06:58:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXi1XLNfMyZEVeQVFB/aUCFn7FTzO2+jLvSI+1Y1cVzyuKv1dO7fNFowBatz2MYfptSs9fkcLJMk3/iM/O0z7Cy0GBxC++s
X-Received: by 2002:a17:903:18d:b0:1fa:1d37:700b with SMTP id d9443c01a7336-1fa23f155damr179790495ad.45.1719496704580;
        Thu, 27 Jun 2024 06:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719496704; cv=none;
        d=google.com; s=arc-20160816;
        b=bwacfVuoIvOhWl1gGNT/+8I8nwGjDNdpOp3e/QDZ5Vwp5Au4VJdLgjcDKSFMLArTg+
         OUuGsEJChhSgg3naVp6BeKQ9vFBAbQql2z/PlwUdQ6xwKt2pr+//1k8InU6PUi5vhT1x
         VeF9CCPz8Fr0VPibdxTz4GYLipkt26JM9NyGL1depglmn+P4D5iBcchw1LYpTB82p3pn
         WlTY42xxIXej4W+v5KxRgEfrBsOfaDWneBfp4rf5CcagC59bYodURa6/y79hmI/GlIa1
         SutwkOOHSoL04YSSWxXKHGKvEZr5/VRKVSdbjbakFMNO0EwyBU//gk5cxUeuTOFflyI2
         9MYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=051823EgtBzstuD764vOjuzK26tAgdAGeHklAVfjV2g=;
        fh=sNItI2GiFQIg5egUD3ufa0LdsTJR6o0A0Dp9sXtBZ+c=;
        b=pPJke9zUK1zPmLDYm3ILsSDq+ylP6LZO9qfzJeiLX1EBv1GyxlrxPE2nYR4HY8QW26
         NFstfUra3G8o2stJjrA6PN8VKqZRxAYCiB0IQiQjPOAV8fFkNLnkL13VTdnqokN9tlgE
         CY2vqmJrCgPDu7E7yVWyOj7oYpfrm/NQ+LknWkrrEZ4L3aF9tr701ryl2gxfQmmISXdE
         8qVpiGb0D3ZP5Xmi+4a3r5ijuq31Nfpa0iV7FFXf2BRhT14hRA/bKiY80W8QceC4FlWp
         0NcwFYK1gEwbI2cZdrJnjIkTQLiqQtgfkaEYqlrM3b6WD9yqBrOuiy0teLAJW13iItUT
         8wXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=JQ3NANpk;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1faac8d4f05sor7634315ad.1.2024.06.27.06.58.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 06:58:24 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=JQ3NANpk;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719496704; x=1720101504; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=051823EgtBzstuD764vOjuzK26tAgdAGeHklAVfjV2g=;
        b=JQ3NANpklQtNLJKyYTUVIBe9Au4wuu8cjR0V/o09QO4VPCnfW+/RBcq+qwywR9xKPY
         9tKHlLvNso/p5CcIlvV27B0SHAR6G8BGJdzMJVtVWEueGotsfBAedUKIsVPyJ0xRpvlQ
         vSvq+rzVUZG2MTDeXXQhB691bTBg/jENGWrKevJs477jQGCPzmnnWe/WsYlw/EK0Usre
         xG0SQghNgHLFYcQO8GYiN7F1gzDqzGUpsJ6NRLncbqrDKHrxHQ3/swEIy3/XyUHxQ2Zd
         v6SWzx9CPv9ymUzRPkMgv9Vw+2TWFqdI+6BHY+eq3yFdnkFGL0DoJ+R+Y97SaWYtiuFq
         tG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719496704; x=1720101504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=051823EgtBzstuD764vOjuzK26tAgdAGeHklAVfjV2g=;
        b=oJSNSC0bKRDksIY+Lm2dZWqb6CU18dPD9jqtQgGp8DMGbU3RKGFon8odgIhjzL/6BG
         A2VA0UJsp6SqFFDwm7CJhrwhSciyjWsIaYCHb5wHuTIrr88l4lqvOWbAFx/C/jV44dJN
         ukCvIRQGtwvrCZJnEzdSWg6lDvR0QU06Jvm8g5sU54YXLFcOUNGTGtZ4MallXPaUotvi
         WCKOYmSrt6MyFlqT+ygFtx/lQdnnYZOd+BxadEumfQFlmzwWbNNZmOFcVFOVPTS6/K3i
         dVGfUGcLQ8PQ012Sis9EjSOI9goLeS7WsYaiPuHfbFWgjf9+5/IV76xGFJ6kNiZ3mqDH
         kg+g==
X-Forwarded-Encrypted: i=1; AJvYcCW+NWfrHMV0/vYu0Rz3lxPuS0HosB2BMIu1ugb1/cMfTCW+Nxgn2TPllGtzUSD1QzC+RmQd48fH22VxKPHPwHrYDq8F1wDo
X-Gm-Message-State: AOJu0YxkALkViLXwnuc44A21cn9/Ub26h4lR9/A9N6bJJORWH2ptpST8
	wr685NCEXOU2xeK/iGuez60pU/ugRkVlYrQg6Lv8yDXFyRRkYSXuCUtn2c7FPg1kSUzJZc5zIIL
	qkxk=
X-Google-Smtp-Source: AGHT+IGKtG2fWmDbLIN8gcv2F0slGqWgLtvmlKC3nv1h0XIdevBGkCeHMFkiB0A3o7EiLJ9nDf8XYg==
X-Received: by 2002:a17:902:6847:b0:1f7:123e:2c6f with SMTP id d9443c01a7336-1fa23ee5b60mr114181745ad.37.1719496703973;
        Thu, 27 Jun 2024 06:58:23 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1faac99525bsm13437755ad.192.2024.06.27.06.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 06:58:23 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 27 Jun 2024 22:58:04 +0900
Subject: [PATCH v2 3/6] tests/tcg/aarch64: Explicitly specify register
 width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240627-tcg-v2-3-1690a813348e@daynix.com>
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
In-Reply-To: <20240627-tcg-v2-0-1690a813348e@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: CqNpQ2KHTNol

clang version 18.1.6 assumes a register is 64-bit by default and
complains if a 32-bit value is given. Explicitly specify register width
when passing a 32-bit value.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/tcg/aarch64/bti-1.c | 6 +++---
 tests/tcg/aarch64/bti-3.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
index 99a879af23d4..1fada8108d22 100644
--- a/tests/tcg/aarch64/bti-1.c
+++ b/tests/tcg/aarch64/bti-1.c
@@ -17,15 +17,15 @@ static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 #define BTI_JC    "hint #38"
 
 #define BTYPE_1(DEST) \
-    asm("mov %0,#1; adr x16, 1f; br x16; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; br x16; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x16")
 
 #define BTYPE_2(DEST) \
-    asm("mov %0,#1; adr x16, 1f; blr x16; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; blr x16; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_3(DEST) \
-    asm("mov %0,#1; adr x15, 1f; br x15; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x15, 1f; br x15; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x15")
 
 #define TEST(WHICH, DEST, EXPECT) \
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
index 8c534c09d784..6a3bd037bcd6 100644
--- a/tests/tcg/aarch64/bti-3.c
+++ b/tests/tcg/aarch64/bti-3.c
@@ -11,15 +11,15 @@ static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 }
 
 #define BTYPE_1() \
-    asm("mov %0,#1; adr x16, 1f; br x16; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; br x16; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_2() \
-    asm("mov %0,#1; adr x16, 1f; blr x16; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; blr x16; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_3() \
-    asm("mov %0,#1; adr x15, 1f; br x15; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x15, 1f; br x15; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x15", "x30")
 
 #define TEST(WHICH, EXPECT) \

-- 
2.45.2
