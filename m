Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979434ejc;
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
X-Received: by 2002:a17:902:e293:b0:172:e053:dfc9 with SMTP id o19-20020a170902e29300b00172e053dfc9mr8082777plc.103.1661182068145;
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182068; cv=none;
        d=google.com; s=arc-20160816;
        b=camwm+b51fttuYvSRhdOJTDK93oTCpFyqaMhhLIIyf437WZ+JqZ0DNKQ9lkDnCRFAF
         UeyyZ2xts43bmVoQUBXVQHbBQfZX+Hl3nwkOuZfT1FLeThMe1QloaLxNylKX1hyrI6S9
         w/U+ZcLekjCJ/kxY7CXytzQQ732ir9G7nuDX/jDgvM7JXVIrPG1yFmn3knaT+TXpsRJz
         Gq4VYTMs0vhtRN5WIjpYgn/C/MSzDZyBH/miStStQNyMCfetOmMFsjb/fn40YLeB9vbe
         v4a9Fxhi9ZmGrpOQqEwA7AbqOljmt9/nLtRsfACzy8pQFk3rALEJ4kEVZ2A6mPcQynZO
         jwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1xsNVagwq/JRyQRrKMlVUwGiTiG4LqFpoVejKkD/DQM=;
        b=gLHAWwFEWCzQ9U8CcLWK3VXhTAryUjqZo8S6B+AgjZBeaHUkuGVGNmUzuDe5PRGM5K
         EUb48GntMa7fNLkHzxCoI69FQiHHM9NqFJOHv67cAqa7gDtt5ysLLYWgs/DDI1pz3z8g
         haocQJcRthjgqswKLMuw+5ERe9pBXc88u+ByovyRq6/I6yvszN3OMysqVXLra7LdIlY4
         87iDTYRY4ZEeZdoWS9a/x/CN0v8om4Q1yRmjNw845TJpq49/O/AmqxBWuWt83imstBta
         NEWZcH4pzLVNtFB0bMWTvhJJoUUUsqeb3I/mYMPfVahdtg+pa635VME675u2KsKMz2tu
         MvzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cBiL7RZ6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q62-20020a17090a1b4400b001efa33329b5sor6143471pjq.16.2022.08.22.08.27.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cBiL7RZ6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1xsNVagwq/JRyQRrKMlVUwGiTiG4LqFpoVejKkD/DQM=;
        b=cBiL7RZ6W0AdJ1+QrAC8419OEtCrIvLz7ByWoQEKnKOHIXpiyDpYy4+YwMaWLJK5AQ
         eWaLJEELs5C00B12Ul240GRvljXz2mPcGTCbYxlbMkRqKrFGpW1uUrLmzxPGy9tYDkPn
         LCuhuYU5Fc2qJc01OMOQfmE/lOQNBAy8hlgjA/xeNlY25iELeeuExi52VbC/aV1fRDta
         1J4auQ1jJoXeQD3zlwfCw0TexhQryVPUhAG/iVlJ+h+9hLFvq8Rcbt+VVMF/48l9fM2b
         YpAX6xqX+zCNhcoXZNdGTt4+8wAcBHNCfqkPfaLePXqzWRA7Wn93nfI0COIbw5MG0Gz3
         lo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1xsNVagwq/JRyQRrKMlVUwGiTiG4LqFpoVejKkD/DQM=;
        b=grMJZnwZPbmpboRsHOs9asNbBT8ltkbiOzz+y+cE25VY5non6FSLZTB9kpucBS6pBG
         5mo0qON0wApdChlFBmqgI9cw6NawhYmTZFWu2LfBvmosoME42g9WEFaSLfbW3aPItTtV
         TYpdoCRJwmcXZ31gdTKpepf12QBGlndmqftaqzrPpxqNLRvtQPEmEGxApgAF/N11PjZo
         Zoa7iE4DrySHk0KY7JcQL3KQy82CYEnVC02fEy/HJLWnjP193Zntz8n5ZPsWY/XU8FcE
         D+1iy4aA1fthBwiSRw7Ykmq4ExCj3mjU4pdpH9YeimnzGaLgct/zN6TUPwOeHIa+R/3H
         F+8Q==
X-Gm-Message-State: ACgBeo3ARZDAlJUkONDifdlnui1dbmpJHeL0vcrSfNIedo0CO/GCoi8P
	K/SSivxXBvpBAMYfvMeSHX70Hl6F
X-Google-Smtp-Source: AA6agR7tSn6a2uF8aXMjk2j94nABcLoB5oYFROm8cMKK2Gz/b3eVvU9qpyFuVRrlGVCEfB+SjgByBw==
X-Received: by 2002:a17:90b:4c4a:b0:1fb:3c1b:b7f8 with SMTP id np10-20020a17090b4c4a00b001fb3c1bb7f8mr3948182pjb.98.1661182067709;
        Mon, 22 Aug 2022 08:27:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 06/66] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav5
Date: Mon, 22 Aug 2022 08:26:41 -0700
Message-Id: <20220822152741.1617527-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zpAiLzO7vDmn

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b006e87a63..15d152432f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1351,7 +1351,7 @@ do_fault:
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     int n;
@@ -1361,12 +1361,12 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
 
     if (regime_translation_disabled(env, mmu_idx)) {
         /* MPU disabled.  */
-        *phys_ptr = address;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->phys = address;
+        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return false;
     }
 
-    *phys_ptr = address;
+    result->phys = address;
     for (n = 7; n >= 0; n--) {
         base = env->cp15.c6_region[n];
         if ((base & 1) == 0) {
@@ -1402,16 +1402,16 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             fi->level = 1;
             return true;
         }
-        *prot = PAGE_READ | PAGE_WRITE;
+        result->prot = PAGE_READ | PAGE_WRITE;
         break;
     case 2:
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         if (!is_user) {
-            *prot |= PAGE_WRITE;
+            result->prot |= PAGE_WRITE;
         }
         break;
     case 3:
-        *prot = PAGE_READ | PAGE_WRITE;
+        result->prot = PAGE_READ | PAGE_WRITE;
         break;
     case 5:
         if (is_user) {
@@ -1419,10 +1419,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             fi->level = 1;
             return true;
         }
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         break;
     case 6:
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         break;
     default:
         /* Bad permission.  */
@@ -1430,7 +1430,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         fi->level = 1;
         return true;
     }
-    *prot |= PAGE_EXEC;
+    result->prot |= PAGE_EXEC;
     return false;
 }
 
@@ -2425,7 +2425,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->prot, fi);
+                                       result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.34.1
