Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp463973njm;
        Sat, 29 Jun 2024 01:56:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtbK+BSPtFvwkA+P8IpKP9Be1r4uut8wKJrwCJBsZORe4/MeENhTJzSvvnb/FhH6fnIxhap7a52mO06CPLlB7BdvctH5q2
X-Received: by 2002:a05:6808:f07:b0:3d6:36ec:5c3e with SMTP id 5614622812f47-3d6b5689ee3mr605005b6e.48.1719651410452;
        Sat, 29 Jun 2024 01:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651410; cv=none;
        d=google.com; s=arc-20160816;
        b=nb4RqvmSInZDkoQKk8jIJAe/w2jd6dAl8pO69gDjHrdb6jd5JGvd4Si34e4uq+P93h
         hs58IrErnMhh4cMerGz+ar3DrhDdHl41x0tNsl1w7qgCdmoHmWaE7YZwQYZJMFAOxftU
         pPdLUBk44SP5vtDQkcVASvZR4IspcaNQbdZKvumARkrOAoxSCrdX3nP1HMglSopuXtsq
         tSPnxCqCGD42stYKhp56YWGFmhz2aWqRNi1S6hI1Mf54vdCVtKTAxIuZbtJ8S2hGAv0Q
         3N/N6NSHKIdyvS7Rn9q5sGV3dW+Xab7BVT2YgVAcDY9UWtx5lr0FgRfeoDEXdotPO12j
         CooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=dvwHZtwHDPRaG3dVuQgy23JMNhHjLIMs4Cye8IEDdJM=;
        fh=pGdLs9AhOl4tCcQ6FHS3RjdUcJdYZMuitiaXNmj3xq4=;
        b=B4eJyck8Znb0Dg1oWC5vrGoQfGUnX441udT/ZP+Q82npBRkGxLW7bHuhZlshB/lA2o
         AHo74dat3izh30nc/qeCy1t53BjAbHb/cyzZU+hzz/wmViG43UyqlY9ycXS4VuuJwdZt
         i3k0p7aDu/dUyeJ48318YvTmfvy9UBFJ/tO/AxhbcxKhvdpdG36iw5vdj6PKvehV7rVd
         +dQjRl0GE3LH5hS4hC5ItFuW9sLVz3LRkP8+jMtPOKksS4ZbBAaS5lJtqpujVZeLy/Lj
         GrlO7VK7T/AOWbGyUjNLwRXO3mHAftkXYhx30gxYvxambyPrYwUhbEGHvirXQc8AN3we
         ytUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=o2pAEGvn;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7274aed8e47sor2065377a12.10.2024.06.29.01.56.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:56:50 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=o2pAEGvn;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651410; x=1720256210; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvwHZtwHDPRaG3dVuQgy23JMNhHjLIMs4Cye8IEDdJM=;
        b=o2pAEGvnht/yW/yGpGRoF6K1HQxWITvIffTs/+CNz3mN5XhPlKTBaNx+gPWLxyA8Lw
         o3hS+008XxhRlkuaCw0Q/KC3AvKydM+z/G1QI1KMZak6F8jUGo8Eou6JUDSEFUzcY1I8
         Bf+B9tcCJgqPwqrhf9Y5rQlZaHme2K3h7qLRzY1SBuxf1aocpvvNhTNOk6ApePl/Yjjj
         q3A1H6wIj3xOOhj6oG6oXVRGHlqTD/KEFCJDvfZ+0VCf6OyoEfp3Ai69f4Yx14gn0RsC
         s3cHAuafXFEW130Xg2+voYnpnuZl4dfUwdO0cVIB1MsqfnX+OA/ged095oBt9AThtGVl
         qezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651410; x=1720256210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvwHZtwHDPRaG3dVuQgy23JMNhHjLIMs4Cye8IEDdJM=;
        b=DolfmtqwKIwNa5KH5Qdy9TT3bbhlm0O7vEd4fO9OlUr5CHjV0l5GC1B7rkY2MWzTUw
         L5sW+66+vAQ3EJ59dQJ6lkAPpUgH6WqM7OQL9stNLJOBc/MLs3pYQGS/fpOKtPnqVOTH
         V/KEyRx+2LSV8Y9R8rku0JDiEXCXnqqxK5lmwr1M+/6r2GLr9L3oz2/HrypzOx4c2WHM
         twBWN/yVfbWt0236DaAaIOt1hwHSzaHjikI1N8ftcllOnVBOwoj8DTrXDPfz7Q/HWWCy
         szFA6jhb3ovA10I1QRYb4xigVzzzTP8geaX5pQ5jcUqRlv/ozjR4wSrfeNzQ7fEqFqDb
         Tabw==
X-Forwarded-Encrypted: i=1; AJvYcCXm3cJP2i/EWDogP11tBsf85Pl2kGk5AEMkj2wF7S8Wb/7xhICQjWofZwvZHQWeFS6jW+nJB0sVthmU1BBmOTMPnYc+LofN
X-Gm-Message-State: AOJu0YxgRNCWUjXms4cNHLo952iU3JShn3GPuqUve9+YR+QhCWootrEa
	9suvE2mGcQJ7IiYPM1SBzF26Fq5utOJ8gbFlElZch6cIFhqsZIz2Fak3zocXwEc=
X-Google-Smtp-Source: AGHT+IFv7q4gHPpZqqjzCZecpmUzinT3eBEBuzr2MDEq59CyiqWjuLAat3tH5lcEzNQaVdEAsPdAfQ==
X-Received: by 2002:a05:6a20:258a:b0:1be:c3c1:7be8 with SMTP id adf61e73a8af0-1bef61407bbmr560357637.26.1719651409881;
        Sat, 29 Jun 2024 01:56:49 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fac1549e59sm28757325ad.179.2024.06.29.01.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:56:49 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 29 Jun 2024 17:56:31 +0900
Subject: [PATCH v3 5/7] tests/tcg/aarch64: Fix irg operand type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240629-tcg-v3-5-fa57918bdf09@daynix.com>
References: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
In-Reply-To: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: 5HpNf+nWbFes

irg expects 64-bit integers. Passing a 32-bit integer results in
compilation failure with clang version 18.1.6.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/mte-1.c b/tests/tcg/aarch64/mte-1.c
index 88dcd617addc..146cad4a0499 100644
--- a/tests/tcg/aarch64/mte-1.c
+++ b/tests/tcg/aarch64/mte-1.c
@@ -15,7 +15,7 @@ int main(int ac, char **av)
     enable_mte(PR_MTE_TCF_NONE);
     p0 = alloc_mte_mem(sizeof(*p0));
 
-    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1));
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1l));
     assert(p1 != p0);
     asm("subp %0,%1,%2" : "=r"(c) : "r"(p0), "r"(p1));
     assert(c == 0);

-- 
2.45.2
