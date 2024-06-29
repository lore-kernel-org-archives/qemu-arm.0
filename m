Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp463971njm;
        Sat, 29 Jun 2024 01:56:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXszAnowlPXVsmrEwbLzf+U1CuNWInLhzxDVyoLu+1MXhKq35yr4zNF4W/GShkajMSGox4BLJPdEgRdx8u6nfi9rX7ksN3W
X-Received: by 2002:a17:90b:30d0:b0:2c7:a6a7:de5f with SMTP id 98e67ed59e1d1-2c93d1868e8mr994458a91.5.1719651407120;
        Sat, 29 Jun 2024 01:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651407; cv=none;
        d=google.com; s=arc-20160816;
        b=zmM7P+DEo9kBIfuPmHAxCpZzEYTvl+IB/tcz4ifR+/Q7b59w8EJlMHByxPZds6QapP
         /PVyMLA3s5fIVp1yaFf8L6uPGTFcC8Q/0lN30sPCNlK/Urj+aiQAzRl0n7Swd+ghpoKe
         kA5u1/85hJfrXxh3eaqHb2NkDI7D774GUWTl/f8AcnbELka5NpnsdKBPLSqrj8tCaRLy
         BcMAUhv3B6p2yI/oYUaYbBa8JhGNzlal9DsCXp10y1j1DKD9N2z1cAQDq6uNLuZyf+Xj
         HhF5DfW7OC/HEO6P3WxbK//Ouzln2ALjDTOtFFln9GA6+7ypB38hjPD/iSoIaW6G85E0
         odqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=ylf5y47KsuOATDz6a8k2IJFvXF/O3+4cLjtAT1UEAXQ=;
        fh=PWnqAAd1j4q7NQ/uSTI69V+5b3lqtEJ9wwRl15EAIjs=;
        b=Ok5pH5t3a7m7/lqCpr1FQsV8cTUNwaFxWq3shgNWIVTWwehkj4fHhKQHAjm7tImTBD
         yjTnNxApajpauIipH/w4+FFV0V56Famkot4XkCb55ake4by5p2pF4EEhuEIxEyRqz3Nk
         o8A/EThVYacCrSDMj5jdOqwY2glY/H4FAHSEpsQ7zIt0o92+5zAQgTRcu4W/ZMZfbDvy
         ShYa6Scfw+BBjcWEuo1Ny/DRolPTGazaSOQrcUMjKQiig2OR4KGGCJ0N7pGGEs9KauJ8
         NyEAxnJjwPX3shdiM03qd/6j9mKxH/vJkLnDoJCDXAfB0NLpO6a88ZNQ5Fbf397hjGu/
         bk5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=pdADn6eN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2c8fdc914c4sor2477608a91.0.2024.06.29.01.56.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:56:47 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=pdADn6eN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651407; x=1720256207; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylf5y47KsuOATDz6a8k2IJFvXF/O3+4cLjtAT1UEAXQ=;
        b=pdADn6eNS9Pq1ndm9PeEkOecj37Cca0HDzj8rty0K6DSrsxnMyRQmwArAOKI2Ft6XT
         1G68eI4FU+o1uRFoEHgo63eyci3I6I8E27QvXZCLSCe7gom///rBVPHsQylSb30F3ce4
         0e81fj3Dn9XVCZpNA76Pu3WiaanA7sVn8431b2Qzw8JtX2SxAsJjSxz79d3L/sfwxj9w
         HxF73UPbQeA8yus5cd3lRrr1oSEdbQAQU63CHEmwkq1hbZXYopm0416j5lqrciapuwXB
         JVyvm/GEPrz5lnjC5QuEFdhVRE9IgvBraTAg3MRN70zdqeH4xDml06E2FzZVhBaL6NYp
         TXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651407; x=1720256207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylf5y47KsuOATDz6a8k2IJFvXF/O3+4cLjtAT1UEAXQ=;
        b=TXWQjoNcGaokIa4gZ63rm6s7G5rG4XaD/0nmVcHVkrPVLZKr2gJCVq++YVELM2Z3ZI
         Utb/D6SI7mPtJOhUXXqN6T6Z70gp+C02BUkpauZ7QJdO0iYzSr6oLRKszzhVJJ/D+Izr
         611P2DBDl/iQ+3e29eyPGVbEmA7MAkJ4hTs89k1Ki4TvtcFC2W1KeHBWg3FmdjyTnJa1
         ej3MtDZhR+EZhCLoybrNcMpvXJyd48rCLfrIkktqTt2W48GJGxTq7486weNveTEqivXc
         h+ZN2xXwWYcVrdC99MiO7QIi+4mm1e3/GRXE47Zxoca6dHMjmcLusgnydGKuir5jZKIK
         T1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX1lOCTZEbmBKW55D7AlNR89iUOpfM8Ce6KDRdUHKPNLnCCrpzVmPWJ4Qn/hj/abMZdO8YUqNOvJYQzwrC5XNAVwj6mQil+
X-Gm-Message-State: AOJu0YwfaLV7hV4gc2PeFgvrVjH1jYKBpbJEbl/2Lz9RfXk1v4jCbQK9
	8i3/yBEFaC/YaiEKN3BnzV2/3ZqculiqqzYN7LGdgi0KGYzGVXoJgb1sg7+Uzo0=
X-Google-Smtp-Source: AGHT+IHaDvQZvDwEp18vUZqMAo9pjfwGvenE411bhsEg58GgnjtKRbp0+obyCAfYvYiyCvaIMkabHA==
X-Received: by 2002:a17:90a:c85:b0:2c8:3e89:bbab with SMTP id 98e67ed59e1d1-2c9281561b7mr5828065a91.22.1719651406553;
        Sat, 29 Jun 2024 01:56:46 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2c91d3ba044sm2880406a91.42.2024.06.29.01.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:56:46 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 29 Jun 2024 17:56:30 +0900
Subject: [PATCH v3 4/7] tests/tcg/aarch64: Explicitly specify register
 width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240629-tcg-v3-4-fa57918bdf09@daynix.com>
References: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
In-Reply-To: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: 40zdHhR3FWTZ

clang version 18.1.6 assumes a register is 64-bit by default and
complains if a 32-bit value is given. Explicitly specify register width
when passing a 32-bit value.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
