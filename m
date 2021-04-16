Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629222lfr;
        Fri, 16 Apr 2021 11:31:11 -0700 (PDT)
X-Received: by 2002:a17:902:d4c6:b029:ec:881b:fdfb with SMTP id o6-20020a170902d4c6b02900ec881bfdfbmr1548722plg.83.1618597871070;
        Fri, 16 Apr 2021 11:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597871; cv=none;
        d=google.com; s=arc-20160816;
        b=qmTnR8zKMgXA3UwoSjzuVN+uokDYEZm2RixxZvxgnPXnpMHZbejOtcXmTEiSLFoy3Y
         CdC8CkdtcEwCOAGq6S3CBbOGDQgFFgm0e+wPrrpfUUuMzFPvUFR6jK9UGrr0Z0+rM7iJ
         k8PEqJeR688JMM/2MmxVMMmqmWdPl17BDrwmqvGLaxQsvYbjxQi8vhK8y1qbqmJhrqX4
         Bs6tYL2X8yjaV2vIHtK1SzpxDmOZ1uX+JniSC+gP5Dg5YDln312H0nk9KIPFhIM3Zy4n
         12Aoqqtb28cqGhpWEiX2LdLGXceFpgzzA0pGcW/4LhJ7n7sY6iy09/8Vl2kexDVo27nB
         UEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VKhNo07AIpkWTNuysrty7FMgZRNyaIpXlGW/Jh9dVoY=;
        b=P9weCvANVp6+0DmvqdszYH8q0F1LyYvgF9b1KiOuWf8Vum1f7wrrmkgGAlLa9AKCmg
         xfkMDTOVy3RQB4+KEYgo6aaPwV8mxjuSlxF+CKCq0ch3rAZi6kVTXIV+Aoy+4HGUn+69
         WtUloI8ObA9qBYA0j67zVGL6KTVIBgqG2pfP5ms9zgeSoQQyRCz8vS3W+MjIVZ0fcxIl
         fmy/I0Mwb1ZXQSjxCCUb+3yrWytlY92eTL3hbyhrJ2zMh6P7mcH9dfmiQxNUvHQOk6HY
         IcsZplMlKQZdHweF5VLmg7FBmankd3hPgteBval8sBs6eID8TP+bPThyOEOB7fp7n2fU
         bM/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nDN9Yq9L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p12sor4341478plk.15.2021.04.16.11.31.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 11:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nDN9Yq9L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VKhNo07AIpkWTNuysrty7FMgZRNyaIpXlGW/Jh9dVoY=;
        b=nDN9Yq9L13X2EHe2Mcp8lFsuv5x4tmxD0mXtGbE6b/5sot9KPekdCEzG3cqWPcG/IX
         dm2QMuOJFdTGi5qpibChvLRizLTE1wQUYFkdWHebdNEJEAHdjTYsPyMIzASLHp/ohVXr
         3nqSo77Neb6KiZLs/re5uK/mExocFExGFSW/3A4tzZIOBHq5MpMNvYURo44Cgt+zjsSZ
         lhTUit1P+s7aehQy+IIWjg2qiTg9+9KqKng5Ch/cYxZbQ139rpR8Y/pISptQNEYIDCCa
         mBK0UirjjbQNf53ZM8Jx+Wqedo3LGRfXeA2u/MSzrJ1K1teQmZVq6tBrQzuxsVRCetuP
         Jmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VKhNo07AIpkWTNuysrty7FMgZRNyaIpXlGW/Jh9dVoY=;
        b=MnIcL+3cNvVact+VQo7WDkCsiRwjwFkN7yQk5aRz+xAbNYGZxZNq2tipUOM4yCyUzg
         QFNKSoBtTOSwqEsn3Wn41tuXBb9n8F3LVB/ky3msn9qQpPiS2XCrSUBow25biF+hbSlQ
         NiPfH7PHQ6MpD7PER1TNB/w8HNx6vwfUglQs+nUjXfoKNp+6+sdeR8i9Zne+XTDPmfIV
         YeXfnnmjCinWOCYxf6jv2U4emEbqGo6OepRr3B0YUI1+8yy33zoPcWdASKmWaVhMWzOx
         yQ7oSed+s7TsLuLI18AueMKRd+mMFkcqd8Ik5oWNZ9Hv03kjkztGU00oK5eVuhPuP550
         fPNg==
X-Gm-Message-State: AOAM533EMfpogyHLYTRx214eh75YGrWMSgeBrnkOVFFqUIsNR1gMiZrF
	9ug/vcMgBH4I2ggVcpIoaUMIztFw3VpJVPUf
X-Google-Smtp-Source: ABdhPJxttUByusihVceiZFOV9/kHhoMnm65RrlYsk9utSVjoeBQgo8m1rYIfQ5D7aMz67D7fyD6+VA==
X-Received: by 2002:a17:902:e904:b029:eb:73f6:ac99 with SMTP id k4-20020a170902e904b02900eb73f6ac99mr10460893pld.12.1618597870552;
        Fri, 16 Apr 2021 11:31:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:31:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 2/9] target/arm: Split out mte_probe_int
Date: Fri, 16 Apr 2021 11:30:59 -0700
Message-Id: <20210416183106.1516563-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yN+OYiEyO12C

Split out a helper function from mte_checkN to perform
all of the checking and address manpulation.  So far,
just use this in mte_checkN itself.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c87717127c..c7138dfc16 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -753,33 +753,45 @@ static int checkN(uint8_t *mem, int odd, int cmp, int count)
     return n;
 }
 
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
+/**
+ * mte_probe_int() - helper for mte_probe and mte_check
+ * @env: CPU environment
+ * @desc: MTEDESC descriptor
+ * @ptr: virtual address of the base of the access
+ * @fault: return virtual address of the first check failure
+ *
+ * Internal routine for both mte_probe and mte_check.
+ * Return zero on failure, filling in *fault.
+ * Return negative on trivial success for tbi disabled.
+ * Return positive on success with tbi enabled.
+ */
+static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
+                         uintptr_t ra, uint32_t total, uint64_t *fault)
 {
     int mmu_idx, ptr_tag, bit55;
     uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_last;
     uint64_t tag_byte_first, tag_byte_last;
-    uint32_t total, tag_count, tag_size, n, c;
+    uint32_t tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
     bit55 = extract64(ptr, 55, 1);
+    *fault = ptr;
 
     /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
     if (unlikely(!tbi_check(desc, bit55))) {
-        return ptr;
+        return -1;
     }
 
     ptr_tag = allocation_tag_from_addr(ptr);
 
     if (tcma_check(desc, bit55, ptr_tag)) {
-        goto done;
+        return 1;
     }
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    total = FIELD_EX32(desc, MTEDESC, TSIZE);
 
     /* Find the addr of the end of the access, and of the last element. */
     ptr_last = ptr + total - 1;
@@ -803,7 +815,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
                                   MMU_DATA_LOAD, tag_size, ra);
         if (!mem1) {
-            goto done;
+            return 1;
         }
         /* Perform all of the comparisons. */
         n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
@@ -829,23 +841,39 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         }
         if (n == c) {
             if (!mem2) {
-                goto done;
+                return 1;
             }
             n += checkN(mem2, 0, ptr_tag, tag_count - c);
         }
     }
 
+    if (likely(n == tag_count)) {
+        return 1;
+    }
+
     /*
      * If we failed, we know which granule.  For the first granule, the
      * failure address is @ptr, the first byte accessed.  Otherwise the
      * failure address is the first byte of the nth granule.
      */
-    if (unlikely(n < tag_count)) {
-        uint64_t fault = (n == 0 ? ptr : tag_first + n * TAG_GRANULE);
-        mte_check_fail(env, desc, fault, ra);
+    if (n > 0) {
+        *fault = tag_first + n * TAG_GRANULE;
     }
+    return 0;
+}
 
- done:
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra)
+{
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, TSIZE);
+    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+
+    if (unlikely(ret == 0)) {
+        mte_check_fail(env, desc, fault, ra);
+    } else if (ret < 0) {
+        return ptr;
+    }
     return useronly_clean_ptr(ptr);
 }
 
-- 
2.25.1
