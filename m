Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930581lfg;
        Tue, 9 Mar 2021 07:53:10 -0800 (PST)
X-Received: by 2002:a05:6830:22dc:: with SMTP id q28mr17740259otc.336.1615305190546;
        Tue, 09 Mar 2021 07:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305190; cv=none;
        d=google.com; s=arc-20160816;
        b=tKEJRkPv6q507toh17Lf2l6H0sZSEWURJLFd7/qelrfIQVXENe0+surE9Svmm413Hz
         dUWdvPJ/1n3eW8ZJc2MyPS8P9GMiwiNu26pUUmjpbkHVNWGpZEBeJhyNIBMC2K6mjZNA
         d92FhsgiR0xDRQuVSP2BfB41pB5yKPrjixz9Yt/szYOBMe1JatOMlqHZO2V2lrzPGsYd
         OpOF+HnHiXFsV4mpUgXX+02d+1S6iQXRRSYMiBMAgJInhgRWIrtQKzp8tG+sqp9oC4An
         cp/WUK8B5s6vxK1ztmgo8H18uglPYf/wQyQ5ZmxNEWSg1+yrJVlE63bHQsaGoCcKIQK3
         QSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K8m+kPJrwSHSgZI1ZsSaQYwfuJiZGGIkk+6qenqcdxQ=;
        b=We05aebYdmHRiFuz+Ljt42MtTGHK6avpfdRiqEliS7t+ulPwvBB2EG0SeakA/D8Bcy
         WsxzUS8I1btTiQWfyD4eOoZUlrKRvrYzgkgpAV071j07BZbRidBEEb+buM9/fUPR6YH7
         CEp56mJhxN+zxAC1pbkBcRfGTIk/R8VYDcb6mIAVUb0CZXdWWerqOjzNGJq/5ptITUdY
         QQ9RZrdJ6N+uvKC308fdfXgxy/mrjjc24rsgHJtM7BEMo+rSZoBjaAyPr7hoT7diC2Us
         1EYRf9UKX6wCYvXywABOuyhpkYw/C0Q2TbODhaRvfhqjU3Lizf1iXxyYjgtV/afU+VIA
         LXCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVBatS4u;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n8sor759449oof.2.2021.03.09.07.53.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:10 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVBatS4u;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8m+kPJrwSHSgZI1ZsSaQYwfuJiZGGIkk+6qenqcdxQ=;
        b=DVBatS4uHOEePkc1+sb5+culBSF0ivazk2U8JOPBUicIKJvPooaMM6CxmqOzlwp75S
         oW+yETusDI0Y2DS8Qe8RgkwixqhwI3g5tgCbZYbsgcXip5W6O+qqX3BlII9Gc6dydHiS
         72G2QcVxhlBY5Z1LAr8P9AebGc4gJ7KonsZZckG1t4vFoA2GMZy+x/891PzA+bge9lKz
         Vn85W5xbmwxpD0ArFtRCpXUqve2+7L5mcadWHIgZS4dPVl1gLjSlg0+VcBsiHe9VMAWp
         kuo6QNn9BTO3P2IvvSWRFb9uFtW68i67oZJfYhH58dctwwrtIdw1DUZkX0lT9LZqiQgA
         jLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8m+kPJrwSHSgZI1ZsSaQYwfuJiZGGIkk+6qenqcdxQ=;
        b=nWk6etDgCB2Vx3vNqv/d7dunvIFMY723Eiz2nQX5o48IIkEzIdpj1LExKXFdxV6ZDt
         a8jZ1s5UWGupHXQECm2/bWYjVU+e+Vgw+EFu0PxtOkI0MKI5PBgdt8tK2BZdPPztbpxs
         sol2x3BQYUK90j7gEsoNqCzhF4fjsrRMwwOP9mUuP72sEE05EKLap/Y6wEEifPGV7srZ
         bVpSQKgu4ChkaxsEnxO1AtRsjuc8xKx69ol1MpkoW3+KeFNU8R95yjt4uRkEJqiA7d0I
         VY7Uz+vFEFX9Pl8aYq0a/CCgOo8qDQGRPSufjf3tCoSh/MrN9Va71dQ6QWvrmT+9CUe/
         dGdA==
X-Gm-Message-State: AOAM531xSvMUE9d2FqWpdr93g7mUsCH41pRCoqd824mj0hZ8M8fHItV9
	ssud1qtsaOo1Y3i+XWr62/jZgxbj
X-Google-Smtp-Source: ABdhPJxFi0ukYcer/RbdE5lGgMaqJFAOyVcJ0hPiTENlRr/XsD9rR2WZfYKMIx6v8uzfpNr51Wirxw==
X-Received: by 2002:a4a:d2cc:: with SMTP id j12mr22689288oos.56.1615305190198;
        Tue, 09 Mar 2021 07:53:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Laurent Desnogues <laurent.desnogues@gmail.com>
Subject: [PATCH v4 2/8] target/arm: Fix sve_zip_p vs odd vector lengths
Date: Tue,  9 Mar 2021 07:52:59 -0800
Message-Id: <20210309155305.11301-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Q1h1JxvVFWLg

Wrote too much with low-half zip (zip1) with vl % 512 != 0.

Adjust all of the x + (y << s) to x | (y << s) as a style fix.

We only ever have exact overlap between D, M, and N.  Therefore
we only need a single temporary, and we do not need to check for
partial overlap.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 11c9397dbb..2fb4b2c1ea 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1871,6 +1871,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     intptr_t high = FIELD_EX32(pred_desc, PREDDESC, DATA);
+    int esize = 1 << esz;
     uint64_t *d = vd;
     intptr_t i;
 
@@ -1883,33 +1884,35 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
         mm = extract64(mm, high * half, half);
         nn = expand_bits(nn, esz);
         mm = expand_bits(mm, esz);
-        d[0] = nn + (mm << (1 << esz));
+        d[0] = nn | (mm << esize);
     } else {
-        ARMPredicateReg tmp_n, tmp_m;
+        ARMPredicateReg tmp;
 
         /* We produce output faster than we consume input.
            Therefore we must be mindful of possible overlap.  */
-        if ((vn - vd) < (uintptr_t)oprsz) {
-            vn = memcpy(&tmp_n, vn, oprsz);
-        }
-        if ((vm - vd) < (uintptr_t)oprsz) {
-            vm = memcpy(&tmp_m, vm, oprsz);
+        if (vd == vn) {
+            vn = memcpy(&tmp, vn, oprsz);
+            if (vd == vm) {
+                vm = vn;
+            }
+        } else if (vd == vm) {
+            vm = memcpy(&tmp, vm, oprsz);
         }
         if (high) {
             high = oprsz >> 1;
         }
 
-        if ((high & 3) == 0) {
+        if ((oprsz & 7) == 0) {
             uint32_t *n = vn, *m = vm;
             high >>= 2;
 
-            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+            for (i = 0; i < oprsz / 8; i++) {
                 uint64_t nn = n[H4(high + i)];
                 uint64_t mm = m[H4(high + i)];
 
                 nn = expand_bits(nn, esz);
                 mm = expand_bits(mm, esz);
-                d[i] = nn + (mm << (1 << esz));
+                d[i] = nn | (mm << esize);
             }
         } else {
             uint8_t *n = vn, *m = vm;
@@ -1921,7 +1924,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
                 nn = expand_bits(nn, esz);
                 mm = expand_bits(mm, esz);
-                d16[H2(i)] = nn + (mm << (1 << esz));
+                d16[H2(i)] = nn | (mm << esize);
             }
         }
     }
-- 
2.25.1
