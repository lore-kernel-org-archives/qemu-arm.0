Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp247559njb;
        Thu, 27 Feb 2025 06:13:47 -0800 (PST)
X-Received: by 2002:a05:600c:19cd:b0:439:8340:637 with SMTP id 5b1f17b1804b1-43ab0fa248bmr116813865e9.30.1740665627489;
        Thu, 27 Feb 2025 06:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740665627; cv=none;
        d=google.com; s=arc-20240605;
        b=cJsdYsaFrdkKFTsActfsjNv4EfYTyCIfUzk7A87G/XqTpkXEYpTIu0FOpQcF8a3onP
         DkOG/jdepa3FdEBl9Vhl0VaH2t3YUW1s3ibfzqse8lvBacdqEXa/SCvyt+mrRT8FR9vx
         MIHZiHUv4t6CN1bwnozo0kLWHEYz6mSSWiyJLOJsnUl8KfDYBVOj8uGkmDMt3l0IWe9i
         /8wPIbvBTkUovwdi2O+b56s9I6tjRDZBM5HgBrL8DSRDCrWohQAl5Ga9Dr+QAnogho34
         zbdoJs5pUWSQZ7hSgZ8+xZfy2qd2VQhlZLCcd8uK+UIF7nJQkBKMuPDpqMw51gXwqvFq
         uWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=qzJpewvz9X+JB4NWBVhEFyUkbwWtvrwjCE7+wIb8f1A=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=ShiysipdAUNhqkuCx/uIy8clqJzFV3WvJ/MHDwfByXINlmdjk7T5EiDJne+KA90w0J
         /NUrVNVBAiIRF9VnUYXTJ091ixHAZLQ/+t3bWOIKSLmZdybVRA1QgZMCNWw19Ic7Ufdf
         jNF5/rkQzpyZmcG8eDGfOH6bVIbw8qjp4IPgs869K35ApfDqiTjUPejcB5HTaPlgHJSV
         q7RMkoIuSWipsIO8jONKZNOUAH2JpHT16yPbE7eSi1nIr7+Va2bMfyXTH/EQvDqpxuGF
         m7Vjuxb6HTYPc4vZsWLdt9y+54Vrq3zBzsPOPu4xCU19k/N7wvT+WrEG5xN7+lD70d6X
         OraA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZpIryMv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43b737020fdsor3535815e9.2.2025.02.27.06.13.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Feb 2025 06:13:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZpIryMv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740665626; x=1741270426; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzJpewvz9X+JB4NWBVhEFyUkbwWtvrwjCE7+wIb8f1A=;
        b=NZpIryMv+yqsayKxb+SveshqUZdYmWXQyAB1Qbql5bJQC09E6+oMXvYCn59fosXrMB
         dQh4tNsq13ZPKTWTZZNQmKPD3dCTvChtoAFXiJYCMoT40n9XOriqV47KM/U0xzSBrVgq
         Sxc3rhjvicmltWUTyAc3YSWZJ2TCrY1sn3mn4S5tTvOxVsJnjzmiBmpl/a9cg16b3B/t
         K9yBnC3nxDuKXVyvoeXarASAnbjGIOcKgpfYej6SrjqYd17fSKMOONgNVmdlEODSGyCL
         LZ+3kdXLRcc42p02D77uRouiwcRWKgwmQJowGVL2C/32TD/pwQs3zu3v+zRr/+vF+UF7
         2J8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740665626; x=1741270426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzJpewvz9X+JB4NWBVhEFyUkbwWtvrwjCE7+wIb8f1A=;
        b=HnrDjsJ9EY1BcrFEOsz6F7L0PDcdI7n2tKORtZ+3uKtdooPJNalCVAXhkoq1KomJuV
         MuRh54YMbu8+cfV/SCCq++Ws4PmqEsIrU3k0U7yH6WWhoVhYbJ/aQTls8vxPTjoz0siB
         5vNsA2HyykYQkkHzpm/BnNPMHNyNPHwRq5l+xzZku7rBx7x0VRNGM3ZL8+krnqOYF5l6
         UXopR/ju0QKP5iFlvsETkkn7ew4IcljZ4w9ybGPxCV4KQqZInNwdNgWti51R0QiEWXE/
         6LnwadWeZEzOQyCb7sVXzdPa3xbc5nWui7guM/GanpxqkwL8T5PrTnuvHBTvNGpTboLS
         eotw==
X-Gm-Message-State: AOJu0YwAyxek5zuXcfDu4sQtzOURktX8puS4hXkaA/9A3M0g0MLwVHww
	E8W1WIjQrummaZIFelYiz7/gr/stjKhIzPNgP6BOt8MTa3DQeenaZxa/tNbaOYEuuSbKYvOqxx0
	wV9Q=
X-Gm-Gg: ASbGncvgypRZONIiOIuSitAi+njbxhieohuE8NnhiMv9NhWmI/c69LUxhQLVLV2Mk7W
	IcaKDlZn0a8Ky6vUN6aIhLOrQ1nsLIk/U/vNo/7c6auzggmSuUO9STvxTCbyp+Kj9Hwy8PLzIRP
	BsLOlpltar7bOp0pRb36iqgOFMsHt8oi7Ghf0W3g5CP0rv//IGwDg1ZF4anyJP27wX0okxeOXBx
	QuWioKjtT+dqFUgG6Hlf0gz8puAjXU1+X5Frm/CDOi1coeQbI62WKP+y+Es6A+N6X1kjWz1iNrT
	INIv0RWGgDnWD4aIRoJO82nSRTgBVxox
X-Google-Smtp-Source: AGHT+IEC3HLDlTAUEEd5q4LK4EsKjzPSas92qirYxdC5mCLGqvWQZlB7Y4+IazefhaaoW0UDCOaxSw==
X-Received: by 2002:a5d:4b51:0:b0:38f:2bd2:45d0 with SMTP id ffacd0b85a97d-390cc638d9emr7952897f8f.51.1740665625906;
        Thu, 27 Feb 2025 06:13:45 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6a9fsm2219764f8f.36.2025.02.27.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 06:13:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] tests/tcg: Suppress compiler false-positive warning on sha1.c
Date: Thu, 27 Feb 2025 14:13:43 +0000
Message-ID: <20250227141343.1675415-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8wPn9e7m/xZe

GCC versions at least 12 through 15 incorrectly report a warning
about code in sha1.c:

tests/tcg/multiarch/sha1.c:161:13: warning: ‘SHA1Transform’ reading 64 bytes from a region of size 0 [-Wstringop-overread]
  161 |             SHA1Transform(context->state, &data[i]);
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is a piece of stock library code for doing SHA1 which we've
simply copied, rather than writing ourselves. The bug has been
reported to upstream GCC (about a different library's use of this
code):
 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106709

For our test case, since this isn't our original code and there isn't
actually a bug in it, suppress the incorrect warning rather than
trying to modify the code to work around the compiler issue.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2328
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/tcg/aarch64/Makefile.target   | 3 ++-
 tests/tcg/arm/Makefile.target       | 3 ++-
 tests/tcg/multiarch/Makefile.target | 8 ++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9efe2f81adf..16ddcf4f883 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -83,7 +83,8 @@ test-aes: CFLAGS += -O -march=armv8-a+aes
 test-aes: test-aes-main.c.inc
 
 # Vector SHA1
-sha1-vector: CFLAGS=-O3
+# Work around compiler false-positive warning, as we do for the 'sha1' test
+sha1-vector: CFLAGS=-O3 -Wno-stringop-overread
 sha1-vector: sha1.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 run-sha1-vector: sha1-vector run-sha1
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 99a953b6671..6189d7a0e24 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -61,7 +61,8 @@ endif
 ARM_TESTS += commpage
 
 # Vector SHA1
-sha1-vector: CFLAGS=-O3
+# Work around compiler false-positive warning, as we do for the 'sha1' test
+sha1-vector: CFLAGS=-O3 -Wno-stringop-overread
 sha1-vector: sha1.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 run-sha1-vector: sha1-vector run-sha1
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 688a6be203c..c769a7d69d9 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -45,6 +45,14 @@ vma-pthread: LDFLAGS+=-pthread
 sigreturn-sigmask: CFLAGS+=-pthread
 sigreturn-sigmask: LDFLAGS+=-pthread
 
+# GCC versions 12/13/14/15 at least incorrectly complain about
+# "'SHA1Transform' reading 64 bytes from a region of size 0"; see the gcc bug
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106709
+# Since this is just a standard piece of library code we've borrowed for a
+# TCG test case, suppress the warning rather than trying to modify the
+# code to work around the compiler.
+sha1: CFLAGS+=-Wno-stringop-overread
+
 # The vma-pthread seems very sensitive on gitlab and we currently
 # don't know if its exposing a real bug or the test is flaky.
 ifneq ($(GITLAB_CI),)
-- 
2.43.0
