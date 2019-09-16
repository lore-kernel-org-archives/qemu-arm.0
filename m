Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067727wrp;
        Mon, 16 Sep 2019 07:15:48 -0700 (PDT)
X-Received: by 2002:a5d:5692:: with SMTP id f18mr43551wrv.68.1568643348337;
        Mon, 16 Sep 2019 07:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643348; cv=none;
        d=google.com; s=arc-20160816;
        b=scQN8jjDxJsQSu3A9KY7N8P8Y11AC2K/ORkpzCD4ggEyOCE8vYWQ8AJoBpFyQj6Zp9
         gbMehJeRGDPkmp6kHmuBb7P8AD6Bs0SMMnedDXATDXH1eebdHHWkmSvdvx8m1pv36/Pk
         hI+JboUFhUIVt5qNxCiC60J9J+oC17ja4FdCTaddqfKsjnE9ahbXa1pZqK6ya7VW5ln2
         9tvl/j61L8UNkMNlm4HT9N5wfIonv5qVcezhxdlfOhMJlOSxkQHjqbW0PIYpff/Ijt3I
         U3a3eUr/Q/sNWA0NkX6C3A+SIzDHNfzMfqHUyHIxVT32sDiew9YlJMzQ6jWlTdTCoPsf
         ZSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+93zhnxV6y7awAg0ASSqV7pmnPcURr2F+yzvl9fZsA4=;
        b=VMQ+XedDSD5TTCc959mBaWUZE/bKrw2sLgIlRPfvhthg0vCtwOVnKDGtrzn9svT7Zn
         YU+NEd4BgLMlSkovon1v29xU8WRSO1MY6hR1fErO9BBCUdRVxd7lSX1MvwumQqfspOs2
         hOc6p67OkKCpFWCQ7oObSLtNB9FSWxVIE4kC7y7Qz948l+Dikax0IZ8z0joIZsp88WKg
         Pde0/hsV4YSqD+KZ+J0NFkWL5o7q93964tbF20OiE5Pvf2Oy8ppQmbUvjRsWrKLyHyxd
         wX2V0ZoSgkn2jHiox7u/WyXSWRK8l3HtYgshCRwVS5cng0sW2mFBd44IArKS6Fdpj0yc
         orxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i/3gfIPt";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p30sor6602751wmi.9.2019.09.16.07.15.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i/3gfIPt";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+93zhnxV6y7awAg0ASSqV7pmnPcURr2F+yzvl9fZsA4=;
        b=i/3gfIPtv+A1F40fA1vF7JhDCKPvqU19HuYbWuNBIq3rsJkVqGKmG4pBVer/iaH57j
         jHccakeMDBkHC23mM6t3xT2eEPloplRUXzLFCAPsoA1HEaydbmROJ1VCBQ3byxpEFkk9
         7t8I1asM58+Bmb3gKSH5bG0xY2NCmowbCIqCdetFDbStt+8a69mLik+lD6vAd65axGoV
         8WExTs3XNS3KnyZSUNUzxzts3O32SN/rXk7GkyAnW6VbT3vFWoYWI14/q+1VLIvNMV2/
         9DvFxU34JTRnYpcvR0OrsGE1E7z9tLIX0gjOztThsH06y8bzGA1OR1wOUiIkpnsT6wud
         +fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+93zhnxV6y7awAg0ASSqV7pmnPcURr2F+yzvl9fZsA4=;
        b=Sdd1syWDbOGGtaEs80HuZRP338Ko/cbZfrG7DWdwReKQ2HHpGJDKv0c8voH3SmZRRD
         qTI+YFzU6Fi1Kpteof7lCEb5635NJKK/EhhkpRwcJvZs32ndVfPHyHLV/aomU13dxrVj
         R/spbB1S+FPasF5SPRkaAal/l7jD/QUnwSKz2K/GHrZjzcdecklknCzoXOcr+EDkuNqM
         bVUJ3LsTSXppec0bEsb1c/gRGH0ALjspmz+jhyOd671RgImXYKblGw1yGmLrxlN2JAl4
         sftzXTo78NtoAuWLuThhCgI71Z5tFCHzkpzyJmMmD0DrIo+0r+Wt+gFjfJUKdhPjp+vu
         wl+Q==
X-Gm-Message-State: APjAAAX0NbJc56t2jSkolbeTq+0vNh37HyqLwFBmaGCZnp6skr/Me1YB
	OkTAt2SLK3MVyTWcUKulO3wjOIFWachyoaOI
X-Google-Smtp-Source: APXvYqz6WZG8Uy1Q5GZEl16gZ7AQ138w+KdgGuAFTrtt92KeTjrl70jDCH01ooeHtXppfk2KCQUmWA==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr15179087wmd.14.1568643348049;
        Mon, 16 Sep 2019 07:15:48 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 01/15] target/arm/arm-semi: Capture errno in softmmu version of set_swi_errno()
Date: Mon, 16 Sep 2019 15:15:30 +0100
Message-Id: <20190916141544.17540-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BswjAmpWBtpu

The set_swi_errno() function is called to capture the errno
from a host system call, so that we can return -1 from the
semihosting function and later allow the guest to get a more
specific error code with the SYS_ERRNO function. It comes in
two versions, one for user-only and one for softmmu. We forgot
to capture the errno in the softmmu version; fix the error.

(Semihosting calls directed to gdb are unaffected because
they go through a different code path that captures the
error return from the gdbstub call in arm_semi_cb() or
arm_semi_flen_cb().)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB that a later commit will put in some cleanup of TaskState
that will let us reduce the duplication between the two
implementations of this function.
---
 target/arm/arm-semi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 90423a35deb..03e60105c05 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -114,8 +114,13 @@ static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
     return code;
 }
 #else
+static target_ulong syscall_err;
+
 static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
 {
+    if (code == (uint32_t)-1) {
+        syscall_err = errno;
+    }
     return code;
 }
 
@@ -124,10 +129,6 @@ static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
 
 static target_ulong arm_semi_syscall_len;
 
-#if !defined(CONFIG_USER_ONLY)
-static target_ulong syscall_err;
-#endif
-
 static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.20.1
