Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2602716lfk;
        Tue, 6 Jul 2021 16:49:44 -0700 (PDT)
X-Received: by 2002:a17:902:bcca:b029:127:a4f2:845c with SMTP id o10-20020a170902bccab0290127a4f2845cmr18977446pls.29.1625615383916;
        Tue, 06 Jul 2021 16:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625615383; cv=none;
        d=google.com; s=arc-20160816;
        b=OALFmRhDCGc8zVRHOrbBvi7civIxDRlniek2HGA8nwCWisy4pJCDuu3JqBmZLsbYpR
         oL3FGQ1FCxfI4dY0GYHZAfe/Q5WIyg/Gscyib/Va3hP2JQ4ZCu+NU5uzHDqI5DNNTgZY
         KJ0sgFG/6Gvj5+eVFDZnea6ENbrCmWEg+jokufC9Yfq0w4YRHdRhH12b/ufXOngzptzz
         27q3X2Ve99CKWe3bOIqD6k8Pm0hD34vu/7DeYktUEnmsFmtZEWjs+FUYZMA2bKKG9I1/
         2UFtAIX1W0Db+k57bEytXstO7JzHvB3NMB1YsPJ4Gtz6lBx1V4OQ6Rpvu7CBxfADRlNI
         AhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uYCxAUoRWyRn/9euH4vCsN2ms/pTKei5OwvPABaSm8o=;
        b=OBTDiWMtfWbHWifBoYZiJDGi4WnFqs724EDzuGbpa1TxwrLlb69gXP0XTRbwA2fTYI
         uGRF1nqeLLS6BX8NFlsY4uUkcmUh7IhkTjj5XZ6h+53CZkH0b02s8Zy5Dh+vIIIiwujh
         HnSPSz4M6/F7myLJgug0Zdv/Tq1jEqR9Ah/oHZC9q68E83EEqMbvZCumMFq2qKlJftEb
         mgriM86lJc12/qW0sOqBXGNW0+ZQFv6a52dSnbyKa/mIqaHDysYqPFCxovfR43WqRkTA
         JwSsE09z6bA+/KE/ZVGT6pSAZFqnVZ3aDqnO1/pBbYBKWj6BqA0NbKZiCKjyCfjUwZ2D
         gkIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8w551VA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a2sor549257plp.73.2021.07.06.16.49.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jul 2021 16:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8w551VA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uYCxAUoRWyRn/9euH4vCsN2ms/pTKei5OwvPABaSm8o=;
        b=Q8w551VA/ZasYQxd8/aaaxJx19ojVZdG2AMt5TU2qrs0u2VyYWY2q3hLbs1454pO5C
         Ut1NW76rbF2EKQ8FYJM2pCf4725Uz20UoUM3wOXS9cVoTjcBzDjV72rXYvR3mvkeafGH
         e0EOAU57YP0oDYvbu6SxZPpkDb+7lxXOfMGUOnmiO0/qllZYm6JIayWnoA+Ac8VBK8LG
         pXPIeGIV0QANw2OuIHAnMPsysewTzqDQxeRwLp6faMM64PYgNW6MJ6zmZD6RvcMpAxOt
         qV7aRcCt86+So0LqCl+MEYeEruv+QBDwVVSruu2FaTltEAjusxcO5H5FlZrtNsX7/8WB
         LomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uYCxAUoRWyRn/9euH4vCsN2ms/pTKei5OwvPABaSm8o=;
        b=Uqp0jdkzyN2bXXckQUFlH5MCK2cd50d79+wwCVNgsdyiAQTtJzGTCJhuJcUJqTiHCZ
         /b7db9DcgyoMTkk1PPazdZm2vAFG4Z3dBzgSzj+79JWTQy6oG0Nwerh6OaF2j2UItUmT
         yOYskbYdZWSjnqUjCsjndmwaUeF0m9hsgcL+CuL5NT/mZ2iq1IFeJ17OPMCuPXw60lQ2
         Aw41e2uTP0NoJ9sXoqR7Hsr8JZN08zM9W1XwJRLRxp7A+EByHETVCmulRxt7EdUWHI/F
         u2RP2pg5rUInOxzT7oijXv1+bMXSzsAGewJq9DIl2dFzsxYCc5h6wwhJfdpVRT7AM90H
         90+w==
X-Gm-Message-State: AOAM53067BhDXV3PIYiN2ZNEqnscsTgKOmdDQtyDXxodfScLdSf9uZLF
	Ugu6D6SlQw82uRYhs2hwgKSwXCdmnwmOZBmT
X-Google-Smtp-Source: ABdhPJzh/oExuiyy2KRjQgE8MmO928qEzS04C6zF9R9ygC3Rr413PnrwzzqRy5Or8lXPkkUfZPwdhg==
X-Received: by 2002:a17:902:e0d4:b029:129:acad:4552 with SMTP id e20-20020a170902e0d4b0290129acad4552mr4661349pla.55.1625615383487;
        Tue, 06 Jul 2021 16:49:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 16:49:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 15/36] target/arm: Add isar_feature_aa32_a32
Date: Tue,  6 Jul 2021 16:49:11 -0700
Message-Id: <20210706234932.356913-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5zUlMfPrDiKu

Add a probe for whether A32 mode is supported.
Fill in the field for the pre-v5 cpus.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 5 +++++
 target/arm/cpu_tcg.c | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index be9a4dceae..33f7ce9bc5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3802,6 +3802,11 @@ static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
 }
 
+static inline bool isar_feature_aa32_a32(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr0, ID_PFR0, STATE0) != 0;
+}
+
 static inline bool isar_feature_aa32_ras(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr0, ID_PFR0, RAS) != 0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d2d97115ea..980f62f35d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -73,6 +73,8 @@ static void arm926_initfn(Object *obj)
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+    /* Similarly, we need to set STATE0 for A32 support.  */
+    cpu->isar.id_pfr0 = FIELD_DP32(cpu->isar.id_pfr0, ID_PFR0, STATE0, 1);
 }
 
 static void arm946_initfn(Object *obj)
@@ -86,6 +88,9 @@ static void arm946_initfn(Object *obj)
     cpu->midr = 0x41059461;
     cpu->ctr = 0x0f004006;
     cpu->reset_sctlr = 0x00000078;
+
+    /* We need to set STATE0 for A32 support. */
+    cpu->isar.id_pfr0 = FIELD_DP32(cpu->isar.id_pfr0, ID_PFR0, STATE0, 1);
 }
 
 static void arm1026_initfn(Object *obj)
@@ -115,6 +120,8 @@ static void arm1026_initfn(Object *obj)
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+    /* Similarly, we need to set STATE0 for A32 support.  */
+    cpu->isar.id_pfr0 = FIELD_DP32(cpu->isar.id_pfr0, ID_PFR0, STATE0, 1);
 
     {
         /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0,2 */
-- 
2.25.1
