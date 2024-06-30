Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004279njm;
        Sun, 30 Jun 2024 12:00:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVECiV0lQNxQScEybV9+06jVkhkmt4Lt5AycoQ4tCrFPvTZTZjHvhAMIwpMCaNakAB10nJDkR93B7miyc6qp9j+aD6MmoJG
X-Received: by 2002:a05:6870:5cce:b0:25d:789e:2418 with SMTP id 586e51a60fabf-25db366110dmr4280500fac.41.1719774057212;
        Sun, 30 Jun 2024 12:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774057; cv=none;
        d=google.com; s=arc-20160816;
        b=dRVUOPtqGlhCBkIpdFGC6Dc2Eb426xjdSfxsh50g2MBQJy+l8qcYRu87gu/SUCIPvj
         yZ0nPXwIQf9hnMxD7o7orqJ+3g2aUdufwdqf5n1jLZ6dKVRubczBoUBi9iwuQZSTzJ4O
         H1dJNvWxixJBSrfhV391o+2XvHMa/ybhxY/ywfaY2gXCjF6kPxFnk/50vC2L8s5yjPg4
         9FELUxpCYpheh1I2Jwegtl+2UZMjhZ8eMmoG3I++j4u/s+wivz99exrOmsPif0zrnx7h
         Z5E3qnP0lM7bU1SeiuxS0OenvHnU0oC30KYwiRfFDJs9gyienov2ROEm8yjHL2ZED5ux
         gOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KbhfrqUnaAYuOyL/QoAAk+86rkpOm/3bNkjsHwjy29Q=;
        fh=9oVFfrSGPIDr0G3BH9AD8hX+Qc96IJbulQKBsvf7fPU=;
        b=c3Psbiw/duF6tcNvyZ2UuUpEejzAYrrC9nAShPgQFFNo3rMzcXHt32S8MR8NMN6qqT
         PTZbuyZvRkJhNjTJY4cPZBJpd0YPpqssYBcof2LK+yXm1y5DO7fI8+AaXvOSNfiKveV5
         DyvFk33aT5xD5UILA+/UMzjOmE04BtelzaBkMasE1Knwaol7wwYYak2LK7LX+PZWB+Ra
         RKPbADDb/EoQhbxcyt7cTmUICShh8cb2F4895SlYy62zMX44unOew/vNTGaWEWhSADbo
         /gFxf5lDAWnK1AOCLYNtoFeAUqTpxQN7gigxULrmSBcydJfUyWyTJKGvV/9CcUC0ckOQ
         4zxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DHHiu799;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-25d771c6b4asor3818139fac.3.2024.06.30.12.00.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DHHiu799;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774057; x=1720378857; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbhfrqUnaAYuOyL/QoAAk+86rkpOm/3bNkjsHwjy29Q=;
        b=DHHiu799zRiUwJlJVPfVO/4FwjT+yj+keIl9IaBgjuZrSXsC1GHd/zw2HSgxWWHNIi
         iiAr3sN5c0TsNn9vKAlEWd09AiVzg2zLnwZwuXs8S7xONJ/c2f5xrKI4LN2Iy4E/GpL/
         rt+O80oVdpi3Fmn0nfFLcXBZk3uxUXWQz2bJzfZOhL2GwsqjtlY6EIUyvkDB8rtYvWv2
         NsFBlUIgxnPNsdHHAVgCnGxttblXxtKAoUmFGtHZ5UQTRFID8iS+FFlioaKjZbaBBruG
         IJR4yMO3GKBldwoUEnPhm4ujEXO34GZOGA590ocmnjN/4D9EN9tRV54CMMLDNasDxDxq
         sU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774057; x=1720378857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbhfrqUnaAYuOyL/QoAAk+86rkpOm/3bNkjsHwjy29Q=;
        b=M6nHo2mNemzy/Xo5hS0Mc1hFtezd6dislMWvcDUUbGSDjxN+tEir3CAge1x/QC5I7H
         t8305nXkxyPghfR9ktbiru1OYQDVQnBeX0YzarJchBmj2KMvVJTotreJLSdS1+XmEVeZ
         xXa3QV3Ljto9O5gFoDdUxT95Q3DqmnFdg2Ohy2YTG1A+b0lt/DKR1WYDGxL+fiNsHE3x
         pjWDLZiK1a1DmbfI+q8f5IHbmXguMgHKwsBK+SmR9Ukt03hdVSCUPZ6oJtO4VLyNBBkt
         eOgpbN4a9eLXBPasTtlqWbMyuIquoFyxtbolY+q2nzuSRxSfocAEbgtAUEa6g98Mvq23
         OYrw==
X-Forwarded-Encrypted: i=1; AJvYcCVpoXfU9ME+bQ+Rd2q/QEAa3LkmxJfGPwQY7maIE1FyyUregCQG4zRiCLHdfxPmOIWTwKPHBWP7GtnE6eV2XRitl4Skt1A/
X-Gm-Message-State: AOJu0YyHXKQ7DfiJRi6sv2zmZ59bMHf+sNn3ExZtAN1SlqZfmLDaKmus
	odPEJ2h8gAzdgCwxH6q+jzZsF56IjVVk+QRs7wKNGIudlzLMnuMGWyXgBAre/02yslaNwsbV9Q/
	jt6A=
X-Google-Smtp-Source: AGHT+IF/KfTch98iHq3m2GtDdHSQ7Z8qhj99T8tk/rTUl+c6WObdSSkfmSky4F7iKU+hB/2F1lDgGQ==
X-Received: by 2002:a05:6358:249b:b0:1a5:4b74:2214 with SMTP id e5c5f4694b2df-1a6acc6e5e7mr403361255d.3.1719774056399;
        Sun, 30 Jun 2024 12:00:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:00:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 04/14] tests/tcg/aarch64: Explicitly specify register width
Date: Sun, 30 Jun 2024 12:00:40 -0700
Message-Id: <20240630190050.160642-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oEu7jDwwxkJS

From: Akihiko Odaki <akihiko.odaki@daynix.com>

clang version 18.1.6 assumes a register is 64-bit by default and
complains if a 32-bit value is given. Explicitly specify register width
when passing a 32-bit value.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240627-tcg-v2-3-1690a813348e@daynix.com>
---
 tests/tcg/aarch64/bti-1.c | 6 +++---
 tests/tcg/aarch64/bti-3.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
index 99a879af23..1fada8108d 100644
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
index 8c534c09d7..6a3bd037bc 100644
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
2.34.1
