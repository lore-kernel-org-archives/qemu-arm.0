Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532095njl;
        Tue, 8 Oct 2024 17:05:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbBr4WrrqIs/HrNSa3VG9XaYM070uDaOTqD0ctpdKXZmTtgIC3GKjg8tcJEGP9Q3/KcDeEHx9+gTIoCA==@linaro.org
X-Received: by 2002:a17:902:e543:b0:20b:5be:a403 with SMTP id d9443c01a7336-20c636f5d9fmr11784385ad.11.1728432312205;
        Tue, 08 Oct 2024 17:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432312; cv=none;
        d=google.com; s=arc-20240605;
        b=WFpYH/0r0LbFIro0FISQ56+YVEx5o9DaxCSoitQbIrMplGXS9Ad+VQYsViFJpZTCnT
         gFwAypmLyKmhHzzrhlsL7hmbNcnXZxl+AXjMMl/cHYGbOl5dx0+T/KRQatiQBlKwlRBa
         hvIyKyLOI5HUkv6i7+h876ZhiTgc9DxBXylJcBsc9jn4r2FlPaq09qTzbLwcFXAfDvHQ
         19IPhtKJlVpkoYc1hPfebo9u38eNGu7/wMSYfnuefV1odMe4EdZqs0gDLUy5FPfKV5wk
         1pPovITk7XkZQynYwg2kRjAwiAjUtQi2jUb9OSzMR/bZzULYQxsMz9Za92ZoBQLDCnF4
         iSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zDNpltdoK5BIHBCpA0bLYhC/fVRvo8Z+4KE41wqkR3g=;
        fh=haEFJd8HXEhWjuPNVeuvSJNmxLyg+jBK++fqPNefQb4=;
        b=SSw9du78znSTHcQRNPbDkMnf3xqDtI677eH1dLrdKNSRnZqdlzv+pQvM0jD57e09x2
         V41FihgPX9SIsnZxWc84lMzx61JZLyqlvXMjN7Y5yZOVORFucsKwyYOfiC/CYnA+Lkl4
         PoUWCIp9+mP5+VqCno4iqnIdLb0tWGlqp8FKxX/oeeYjJu0UkBUlDgOHewuu1JT8YUdD
         myOHZLtGhPEhwSxBQrfngxAO161Spg9sguQf+Ya4YwS4RPMdsz6sNTe2clGzBX8F6H/e
         9b4fGrqOCuSkbBpjl8mI4NKk++UBUDFFN7VjTA2E+7XhPKBbHje0B4l3xOC320nrxOcH
         Sxwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qAPPSqUB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138ed906sor52642715ad.10.2024.10.08.17.05.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qAPPSqUB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432312; x=1729037112; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDNpltdoK5BIHBCpA0bLYhC/fVRvo8Z+4KE41wqkR3g=;
        b=qAPPSqUB+xpvz7yKlhhud403XA6u7vHDzl4kVW1tXtkxqkHS/tuMqFER418jIgvvfK
         lJ7C/XI25btqm9zBE4W2YkKinqueNJUyQwVurbIEXzb8fIOzcDb3GWWp4YSYlUrcv13O
         nhYtOJ7PxW0FlLPsswXz2Fe8Lr75+3RoMJA1W95B3MwplzhYcsBNkWvaMBUz7yvUq3dh
         j/JPpV+1aTCQrcys0aIiyK6uy0IPVNVF+ATX2v5h3ZLkFNNBe1YaCodu75tX/cq0zru0
         88oHYsH+mtyMWIDyhL4uoFEG6QHPBkxd46s5XREkxG6CG4NxCZqLqGbzU8JesEazYwxz
         hQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432312; x=1729037112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDNpltdoK5BIHBCpA0bLYhC/fVRvo8Z+4KE41wqkR3g=;
        b=mSUy6m+g1SVes8vNDqfd4kM6WoqRX2rmQrKMBX+3EERiMXj9Ac18w96YDhNJq9w8ca
         fcdcYUqU+DzLsPN5PSOJzxBojiaqQBFHX4W/488qhOxPf06NH+nrmAMX6rab7yzs+OX9
         DxrAa3v9lvaiONOH+i6dbRrCeMdVaXKHcatGsqeP+SWuASh1rheclNIdpKIHx4/h4auT
         U7PDpCHRx1jbhiq7KHgXvNo/11pXGeqCFiSndr2/Wn+IbZCT3H+WZDXe4hDkWIkZWxhR
         YXSR3js4XHGxMPNHj65wuOyF7IL74/3mqZFQta+QVryfJ3wKEuW6R44yThJLbNic+P/P
         Iq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXM9xoeYRpf/wDzbmCm8Xza/Tc2tet9eDRbAt/+8lLWV/0JuiAN2QZ+Yg6PXHEjD216+gDD+bNTWA45g==@linaro.org
X-Gm-Message-State: AOJu0Yyo3l+q44jOMqGBu9PVmVZXL0X57GqUduYJbIDPNo8il/0hWTs2
	C/m4z+cTOb4B1yk+GjDlN13oeodCK0vzCVQN9OSXQ9E6BKetxRwDCSWj4F+lcrrFvA==
X-Google-Smtp-Source: AGHT+IF4BglkotazCAHqUPofHInFIYYYoctu9w4tOUz92qreZT9FiKqKTEYHHdQjaQVFF8PF0y1lkg==
X-Received: by 2002:a17:902:da8d:b0:20b:c258:2a74 with SMTP id d9443c01a7336-20c6373ce07mr11388505ad.29.1728432311644;
        Tue, 08 Oct 2024 17:05:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 17/20] target/arm: Pass MemOp to get_phys_addr_lpae
Date: Tue,  8 Oct 2024 17:04:50 -0700
Message-ID: <20241009000453.315652-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hF3elO68uQJk

Pass the value through from get_phys_addr_nogpc.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f1fca086a4..238b2c92a9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1684,12 +1684,13 @@ static bool nv_nv1_enabled(CPUARMState *env, S1Translate *ptw)
  * @ptw: Current and next stage parameters for the walk.
  * @address: virtual address to get physical address for
  * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
+ * @memop: memory operation feeding this access, or 0 for none
  * @result: set on translation success,
  * @fi: set to fault info if the translation fails
  */
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
-                               MMUAccessType access_type,
+                               MMUAccessType access_type, MemOp memop,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -3534,7 +3535,8 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, ptw, address, access_type, result, fi);
+        return get_phys_addr_lpae(env, ptw, address, access_type,
+                                  memop, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
-- 
2.43.0
