Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147694njb;
        Sat, 5 Oct 2024 13:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIWtRVv6G0SxG310+ll2kQzIhlknXe+QzakyLxOdXYkCtnPp0ndqz7ZOlR9nRoY4z5T/6E6arkMWAWdA==@linaro.org
X-Received: by 2002:a17:902:eccd:b0:20b:6462:84d2 with SMTP id d9443c01a7336-20bff513c8dmr106562735ad.19.1728158775328;
        Sat, 05 Oct 2024 13:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158775; cv=none;
        d=google.com; s=arc-20240605;
        b=aDjO7WjAhJ3OJ2KIOD6OMijGEFGjJd3uQzgRnq55KK4KF057TCBnQ+jllGPUMyypJj
         TTbyJHhVn+WT2hC3yePyqfD+TWXohxuXbXxYxtCsC0iHRhveQ4NophmrAWQlIyAG/rJn
         VpSLBtKagyrD2ZeJ64WO12D5dmRoHO9I3VS+KNEc3KKJyA+3G+kGOO9gE0+3KKKTXbBT
         AjlNRMfRr/1T6yiBmyIiViPsoUm1uhuXMVBFpsslpzpxzStFXXJs5mf5zo1pWSywNDnu
         AZZUS3AK69HyB7rdCD121HKYjBJ9gIHefPA85NE/ga9iRL9QhMB91XB7SCGpV9OiBgf0
         OY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        fh=6ptUK5bpyDisyfh30cOJCQJJ9lQv7ihYWsMaExXLWZI=;
        b=EaGiHdKZh89yA2Z+rXppA470VctI1jzR2X+i8VM6RxET+UMqAmNgCHDBk/YcfpjlGX
         I8DXnAIVbQ8UHqjr8yT1c7iTY0nOdV9apY8NitQWnWLxzu5O2oHGJmhlnM6m54BkZMIZ
         ys2aSIFOtrakFn1/9WHNAPao94hYslDQZXuPM+vi5P4tUQjmvxxPtDvM/kPCapGOWqCc
         GdbBDgeCTzY5ZOggkKWj9iOSnOS9ePvu7RgGcXTAS1OwEz6aAT0C1cMzt/lrSYYFT0/7
         rS9t9qlNoQB3w0nx+/8f+9JpAd9bZLHox/yG9xz2OIQZwoDggalBOuVliAN48xdjEpgo
         zsGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F7NGbmLc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c13725650sor11175935ad.9.2024.10.05.13.06.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F7NGbmLc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158775; x=1728763575; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        b=F7NGbmLcp92O/Rhz9tubp4iSOa0kJVZPUeG0q8Vt6rJXGy0FnDxHOaZ6AI0fIZ7MJO
         L2L60OUGys0tKprzQT9yCYww6MrgxAcia83jG0qLPStdFAXJQopIFrJIJ+OADWsUXdjl
         +D0tzyfW1aX8mhZw44o3nokIFXRZO51a8LsGCbUOrIbw4S5NxFKsprnX2leUzZ2zg0nN
         GOj47nFp7QEXtat1sA4l98kHHBJiPMWgtuQYGleYCQnSUZunfcehWR838RuKRuGI+YRI
         9T91YNO/FoCUl5TcCf2wZltyVr+wT+TDJPQnAzWyfylXO8jcFUnqpUyQqHmKJQD3iqpu
         blvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158775; x=1728763575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        b=ImEWj0ZU43arV/u3E0aUfctWnwdS6/JlwGejxdR+BRI/giygZsD2XCa24bIEdBdRs0
         LTV1JJak2DPn4TgVUUQF3XpI4uJYDC7ypS0bDvNqjuZjEgLPU9udKWqTppBmq4x4DTw3
         NDMWTvXQCymPQw6a89uU18plYMJGJKZtV2EiBFhxNmwIZ2tKBtVrOWiZWwr+I9HE0jPI
         uGggioBG6ZK4erUsmdwyK+7Q85SaFfZ5dSJEUKg54lRVctnFvPocPwwcZWO9O8ZCUhFE
         Z4B5Hs1HnMl1IW0yjXGG/EANWoTYCC/bFLIn6c9aWlSZNqFMgBtzzMXIzEvYhcR4H1Lz
         q4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXnjDFAAEBTXdJJEU1ABkRLK+ruiy5w2qniULTt1qCckQE/VCpRikIN6G+7wZvmZRIJ2BilhsbwZSAy6Q==@linaro.org
X-Gm-Message-State: AOJu0YyXUxLwHQ+xYjsVwflt7A9YIaFx7Ye9pb/AUk0Smj8njcLI67YD
	zQLmydhG0R1O1zzrxRirGPOA05FNTLatAKbQHLDix3QRlODExv5DAlGARq5kv+0Czw==
X-Google-Smtp-Source: AGHT+IGg8sgiEBRoSbtsp5hCkfkIAZ+oEWQnrBAFFM+N7oyUTJv3AhGKcIaJbMYi1S9IuPikpnwrog==
X-Received: by 2002:a17:902:d2ca:b0:206:9dfb:3e9e with SMTP id d9443c01a7336-20be189892dmr148488525ad.10.1728158774767;
        Sat, 05 Oct 2024 13:06:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 14/21] target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
Date: Sat,  5 Oct 2024 13:05:53 -0700
Message-ID: <20241005200600.493604-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rMicKGZG1V2U

Zero is the safe do-nothing value for callers to use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 3 ++-
 target/arm/helper.c    | 4 ++--
 target/arm/ptw.c       | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b16579fa5..a6088d551c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1461,6 +1461,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
+ * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @space: security space for the access
  * @result: set on translation success.
@@ -1470,7 +1471,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * a Granule Protection Check on the resulting address.
  */
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f77b40734..f2f329e00a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3602,8 +3602,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
      * I_MXTJT: Granule protection checks are not performed on the final address
      * of a successful translation.
      */
-    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
-                                         &res, &fi);
+    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
+                                         mmu_idx, ss, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 373095a339..9af86da597 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3559,7 +3559,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
 }
 
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
-- 
2.43.0
