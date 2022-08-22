Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979432ejc;
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
X-Received: by 2002:a17:902:d48f:b0:16f:a73:bf04 with SMTP id c15-20020a170902d48f00b0016f0a73bf04mr20911196plg.43.1661182068012;
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182068; cv=none;
        d=google.com; s=arc-20160816;
        b=nJYW8Avkte7vHtXswdeyMjLdKYBFZyu9DovzaSmzAQJfRXDt1Vn1AKZINqIIupJLQw
         RXGz3UQN+V1oNC/UU3y3OQZ5BqKF4cVGA9SO0+7lTKIHdqjgxs7SxT91sbQEUSyYfwqt
         5DV+kjIpYm3vILNRPWPZ6Ej1kPm9fKpg8n16gPgF04fbYTkubKXoILZLyvoTPLvk++Ae
         qBg1iFizWpYvgOyC9l20F7hn0NmLp2PLWmreCR7CN+w1RO/w8rTQHphMaEfQZ+wFwCzZ
         U9tdzOJBL+mOi76HnuFS/bPTb9VyrshHOmF43ogbZVV3TmP2mLYtotj9j2NFoo5W/p8T
         0HsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zEbgMdwXCpK6WyBM4XhPFitze2l2/MeuDPROktlGLLo=;
        b=tB3ZzOeayFMNkfhj5tL3BBiUqwYfZw3BJrSc/Z5R8uwnF8k2iWwOIJfdegKcAWidZW
         URIKrIhPoRbbdHLQXTQ6ggbUoTjUzX8Fl1naQrELwKiu3EhFHRzSQJcsojXGxXhXoK6s
         JC00+Yxx8Eog2oLGSdWScRq3Gpruxukgm2FILEYtqUJBXm92ENrK/JY+57dgMeCZh3Qk
         XV9c3r67EQui0z8ieeIvTJpsiBBcIgHAovRzoDkLCCOMmPYFMAXVZbA3L8l6cc7M0T1w
         SFkc9KWZLFtCE7TJR0Xpe0E8/I+iXJre0dPNl28dMiRPIn6Ei6k5/y0Tl08ksEJLSL1t
         8taA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MTv6aLes;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i10-20020a17090332ca00b00170d6467ef7sor552533plr.183.2022.08.22.08.27.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MTv6aLes;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zEbgMdwXCpK6WyBM4XhPFitze2l2/MeuDPROktlGLLo=;
        b=MTv6aLesRwR7KrEwGg6YcO+t1fWBp7qBV9VcXvTyaOXEXBLC7RU4wEHVtb0jJpRU04
         +Jz/yRvfhtRASakAozDVO7BWWSom1lWO+yGN8BLt3pjE3aqJxsFlHemv1FPDuc5Fe0ob
         uPd43LxVJs78s1BSfMWLN7SWhNFfNARk5OJjH6XEMbRQV5xyljFvNBip3YH4JW6moyrX
         ArRZyNMUyUjbD5eP0htw7n7xem3ZcKku8e6s+PoMD7zf/rUy3tkd5OorvRevKjxdERUO
         y4bPURzNa2km+gRv6PXnQvwm9Vng0Hm402hIOAMpJpjd9TWppY4ZXwOXD5DXwRFw1PIO
         3dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zEbgMdwXCpK6WyBM4XhPFitze2l2/MeuDPROktlGLLo=;
        b=SSV+UTDUGzP8sKj3vga8+duIHpneMUQsc1221SF5qU2SlYmRMxVwDxmBzb+EPFL2SU
         c/S4UTYEtfdMe2Fjq0cj2f2Pc9vKsnPYz8alT4Kze6VJEBj21KdXKEcoJHjxqvALY57S
         FvFHtjA1i2jOJFFT952+iWDXoCHdkg/A90hBTsDalBRHdY4Qrmc5A/dtcnOUskVEQD0/
         Al/ON7yL2ygp82TZvmvUNKjqBGUCPFY8g9UIOgO1zrs2PWe2q5WS3q0ZsiPFNvPEY12S
         47xfPa8VtjAVlK6FvD1pdcLrznUGuamd92ZqZ1bV9xNZIT5xPYEXlOC2YG6W0Q41G4Bg
         U+Wg==
X-Gm-Message-State: ACgBeo31NbRtYMQKTjUNjX3rARAAPNyjlB0eXwCxNnFx8+99OjdMhXDF
	1mBIp+pjsjwqegj60Z+W+M0CRqZ7
X-Google-Smtp-Source: AA6agR5AcwbTRda1HcedvI+ERt1B9o+XpW+6S++625IMucr2M/rD3LddsByj8DQkd8Oq5/fNhtZJ+Q==
X-Received: by 2002:a17:902:b697:b0:172:65f9:d681 with SMTP id c23-20020a170902b69700b0017265f9d681mr20458582pls.137.1661182066811;
        Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 05/66] target/arm: Use GetPhysAddrResult in get_phys_addr_v5
Date: Mon, 22 Aug 2022 08:26:40 -0700
Message-Id: <20220822152741.1617527-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ay4uJsX5sqSu

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4961bc2f9f..b006e87a63 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -414,9 +414,7 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, int *prot,
-                             target_ulong *page_size,
-                             ARMMMUFaultInfo *fi)
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -464,7 +462,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         /* 1Mb section.  */
         phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
         ap = (desc >> 10) & 3;
-        *page_size = 1024 * 1024;
+        result->page_size = 1024 * 1024;
     } else {
         /* Lookup l2 entry.  */
         if (type == 1) {
@@ -486,12 +484,12 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
-            *page_size = 0x10000;
+            result->page_size = 0x10000;
             break;
         case 2: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
-            *page_size = 0x1000;
+            result->page_size = 0x1000;
             break;
         case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
             if (type == 1) {
@@ -499,7 +497,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 if (arm_feature(env, ARM_FEATURE_XSCALE)
                     || arm_feature(env, ARM_FEATURE_V6)) {
                     phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-                    *page_size = 0x1000;
+                    result->page_size = 0x1000;
                 } else {
                     /*
                      * UNPREDICTABLE in ARMv5; we choose to take a
@@ -510,7 +508,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 }
             } else {
                 phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
-                *page_size = 0x400;
+                result->page_size = 0x400;
             }
             ap = (desc >> 4) & 3;
             break;
@@ -519,14 +517,14 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             g_assert_not_reached();
         }
     }
-    *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-    *prot |= *prot ? PAGE_EXEC : 0;
-    if (!(*prot & (1 << access_type))) {
+    result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+    result->prot |= result->prot ? PAGE_EXEC : 0;
+    if (!(result->prot & (1 << access_type))) {
         /* Access permission fault.  */
         fi->type = ARMFault_Permission;
         goto do_fault;
     }
-    *phys_ptr = phys_addr;
+    result->phys = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -2518,8 +2516,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                &result->phys, &result->prot,
-                                &result->page_size, fi);
+                                result, fi);
     }
 }
 
-- 
2.34.1
