Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287845lfk;
        Wed, 9 Feb 2022 20:05:01 -0800 (PST)
X-Received: by 2002:a63:ef06:: with SMTP id u6mr4621609pgh.44.1644465901217;
        Wed, 09 Feb 2022 20:05:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465901; cv=none;
        d=google.com; s=arc-20160816;
        b=Rf4RnnUcZH70Odh+jM+MioJQXSLaLO8Mn2GS68Ff4AwYfWb7g8+VX4eBKkzai70o8O
         HOeIystNceLUQdiqsTZFZuHhuxQ5wA5+7C/FmjnMM6ht1C3+JjPzKHXrXx6vFy9zeHqv
         99r8BKiFMkiOQTTDr36TNQOjWJKwL3lL9pLVWF7DkB0S+r+fUQ4S+Ggo+jSEasZpXdB2
         JKj5D415vaazaqcHVc8vZzUThmIOz1pL7N2rFjQoaKX9eKDt99FlOd4WifMkOuY2pbbz
         BgEBVcTEb2R/I2c7SXu19BkfHBnOaty/Z7P2qoS/h20RX42amYjOqrX0bItpP+TB7XKf
         CSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kHg4U9LRhzSdYYvCz2waEIRzlEfsFRMNDs65CPCnE5Y=;
        b=gpJFfwTjGTamv0BLnk8RU6cb7LJlEjN4mBbyx/02o8aPGQHI2wKiHImEIJxW6H/C7H
         m09q7iMU3iGMovJNYENABfTHjwUmaCQl9s0NbrQC1C9YmOk2q6vnUGguqN0gMceoncFu
         Z87RbmU42m6kvGYxqHgg/BVJ9oXHFRGTOYBr7OA7MkJlPo+rEuLP9FyfScONmY1res4X
         wf1t03DFJSF2DWSVdY8MJmhMvA6P2gX8DitveFPZ3/GsMjhnZXDITPmzWY9p2OD0jfXD
         Az/97n3fWXLOATnELbXdBL6nAYGp0aoW2maa5yMvSXpMQOL/hZBzTf5j/UlJ5Xv03JX0
         PnHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myMuzfW7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q10sor385244plr.23.2022.02.09.20.05.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:05:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myMuzfW7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kHg4U9LRhzSdYYvCz2waEIRzlEfsFRMNDs65CPCnE5Y=;
        b=myMuzfW7WSHlmizCJsJixj3xK4uhQduOaVVLpApRtj4cxI+AFGwvDJR/rdVyrW9Xte
         2sBaFQi8BAWhXFOIqqy7Kiv0MZOA7XGoUSM/J5AOfq6Os5Y1Jl72QS8dJCOlIm0LOXGD
         qN7dZt5HkEiLXXi68oC/c6ketEtW9pKpE2TDkNn3uVaa8TLtRaDKmGZEKWqnT7f2qdWD
         WZ48u/LMYXy7Gi+JpEoFWpX5q8GpJul2EaDXx662PWy4QEVXVeYKmwH8RUwy5RtXvIuz
         g9PylGgq3n40qjW6TDpqdCsVszhLlx/Q+4CPK4fYy/vOEKoE79YsNII/i/jIXx/UYvxn
         EuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kHg4U9LRhzSdYYvCz2waEIRzlEfsFRMNDs65CPCnE5Y=;
        b=MYO8dQ7i28OmUJHMtxeOv1eVKTy8uFil4fh4pKcH2RGj8MtX2eGUCxkXmECD1F5KwS
         wImNe7pz/uaUrzFcFPpqgoidTmzR7Gp3uJ8qa7hvDKjhJFWHLRkjt6gSGDpSpyCs9a5H
         1XIofd4sKgeO0FbXJiFzJUjvimCK1ThxG6qwoguW756E0D2MDsmnocOPSJPJ8FMku2zv
         QO6r40SsbhY4yPhB7K2eQkq0nGNI5vPeAay5m0szjyZ8WKLqPeYX+qKiDUXYqicRMbZp
         ifk1I/r7y1NoFHWTwejF0vLpThmH17LZyVjPBf7B5r3dcTxIUGKs7+y+uPUrEdzfaGpX
         6RmQ==
X-Gm-Message-State: AOAM53148bTnnIvTseZClQ3dnRgkeb99xcvGuvyrZLgtDhoCKqCQHHWg
	JIaBmbEuyELFH0SgGCU6u8L+0e/2cQP61VCQJsE=
X-Google-Smtp-Source: ABdhPJzcTo/TsjDbUlLvDWFORay22S2J2hwd9zT61Fz1FDO42Q6BWq1Tn11iC0n7IZndTuIdIVw4tA==
X-Received: by 2002:a17:902:da86:: with SMTP id j6mr5779356plx.95.1644465900677;
        Wed, 09 Feb 2022 20:05:00 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:05:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 10/15] target/arm: Implement FEAT_LPA
Date: Thu, 10 Feb 2022 15:04:18 +1100
Message-Id: <20220210040423.95120-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jBqh/dyFBnpL

This feature widens physical addresses (and intermediate physical
addresses for 2-stage translation) from 48 to 52 bits, when using
64k pages.  The only thing left at this point is to handle the
extra bits in the TTBR and in the table descriptors.

Note that PAR_EL1 and HPFAR_EL2 are nominally extended, but we don't
mask out the high bits when writing to those registers, so no changes
are required there.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu64.c     |  2 +-
 target/arm/helper.c    | 19 ++++++++++++++++---
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 5f9c288b1a..b59d505761 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -10,7 +10,7 @@
 
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
-# define TARGET_PHYS_ADDR_SPACE_BITS  48
+# define TARGET_PHYS_ADDR_SPACE_BITS  52
 # define TARGET_VIRT_ADDR_SPACE_BITS  52
 #else
 # define TARGET_LONG_BITS             32
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d80a7eafac..707ae7767f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -765,7 +765,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr0;
-        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
         cpu->isar.id_aa64mmfr0 = t;
 
         t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 62935b06d0..9b1b1b2611 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11171,6 +11171,7 @@ static const uint8_t pamax_map[] = {
     [3] = 42,
     [4] = 44,
     [5] = 48,
+    [6] = 52,
 };
 
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
@@ -11562,11 +11563,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr = extract64(ttbr, 0, 48);
 
     /*
-     * If the base address is out of range, raise AddressSizeFault.
+     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [5:2] of TTBR.
+     *
+     * Otherwise, if the base address is out of range, raise AddressSizeFault.
      * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
      * but we've just cleared the bits above 47, so simplify the test.
      */
-    if (descaddr >> outputsize) {
+    if (outputsize > 48) {
+        descaddr |= extract64(ttbr, 2, 4) << 48;
+    } else if (descaddr >> outputsize) {
         level = 0;
         fault_type = ARMFault_AddressSize;
         goto do_fault;
@@ -11618,7 +11623,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         }
 
         descaddr = descriptor & descaddrmask;
-        if (descaddr >> outputsize) {
+
+        /*
+         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
+         * of descriptor.  Otherwise, if descaddr is out of range, raise
+         * AddressSizeFault.
+         */
+        if (outputsize > 48) {
+            descaddr |= extract64(descriptor, 12, 4) << 48;
+        } else if (descaddr >> outputsize) {
             fault_type = ARMFault_AddressSize;
             goto do_fault;
         }
-- 
2.25.1
