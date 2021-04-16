Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629286lfr;
        Fri, 16 Apr 2021 11:31:15 -0700 (PDT)
X-Received: by 2002:a17:90a:fa98:: with SMTP id cu24mr11247979pjb.202.1618597875413;
        Fri, 16 Apr 2021 11:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597875; cv=none;
        d=google.com; s=arc-20160816;
        b=xKyb69lMAEi0vi2vdHOJSAMGURghaM5vc79n/3Cf3lraBSpBIMY1qDAcSHj0K/Uqgy
         PBg+dhKV+CoJxD2BCgGDPmZg8jGQweU/y8FEYnP383AWsu8KgyjrBMm1ZEGjARdJLgGC
         H4SUypaQfIU/lN+W5rwwDTi4MoV5nDXx1j7KTF0A+G8f8FqfaRIfAKKaOlE6i6135mgI
         hzwZJ0Ua/At3b9anZD+GqeknzRizbBM2211Y/FS3+msBCaQ9DNu1pws/+/4vhJoEbRTn
         jfAIgLrjTC2IdI1Gsrqrkz7iRgpOUjQU+4jHlIwocf9m4nJ68rt3heqQ+QgFd+S6Kgqg
         2bMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PozZ71039TN9LB2JM2brlhvpMPxTWKRovHdHzz5gXtI=;
        b=YD3WJL38SrUUSN3FkrwNWDytvlp+MCmt5Ngq7otEHBf7Wl7HlLPmp6BeAdi96LAlJf
         5P89jravpapy5JhsAXHz7LfukowtMAwG4KjnziUP0tdeax4ap8+obvhuupZ//jyWNnBP
         k7VOjLB+Jny8ARJPqZBmwzqa/Gp7xgYleQVdpKvKJQwgk59ZwfQ/MHfZMohdaWWpoX8W
         ig9Y8bIeRSbtkiDN2juxXIBu0RSP4V3HrdwBcyRUrtwS9g8I9zaE1axSyjx7CxyaoMjd
         21WuwqEqWvhM77ssVZQHPvncmQO7SrRkZB6BFgmNGcWZyiYr+EKh78xvPdp/nsWEVhse
         9kfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IuTR88XR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11sor4361809plk.58.2021.04.16.11.31.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 11:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IuTR88XR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PozZ71039TN9LB2JM2brlhvpMPxTWKRovHdHzz5gXtI=;
        b=IuTR88XR3vpftP4dIptq38W33dAQacYbX+HAk/7/I54jNYdV6yVJQScUYMVLBoJhFE
         o69k/wfZ5WOiRIUALLZlfrF6M9dTWAolkclGwmpqOKSrWfL/0p2t3T0sLH0zapGebjKk
         BXlNRUsDgGGL8LMW5FlTp3hNLSXCjJEIfNw7kDETAou5vzSWV7N4ixaeJW/7FL1TT1tp
         /5aAGfMEk1yNAXrkEzKjcqbqfsL0LtVUKI+hHVt/bw5JGBYoLQDmmLz/ABJcrGnD4gxU
         70KfjeEOeuvzYL1Vu2FVL6isepwakW+KlsOYpleCCRLRe5SEyBxDWLifSMytO+/U7Kp6
         pSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PozZ71039TN9LB2JM2brlhvpMPxTWKRovHdHzz5gXtI=;
        b=kCBHFAGMn8PpS3OgZL9YgmDJPZ044Kx8bLQSdEoj7Mvttx5C3BEC5Lc1N15gzf3sDc
         pjg7eodwps/5Y0XamlGpSJVynG49TuPc/7fgpVSYYO+K4DtkP1F/0l0wz8JVsE8YPPC5
         vX5IKOrx/cO6Ho4Ai1MqDhrDDnw0c18OiOWwWJH73wFm6cNHrUFrdjRpK3A+HW3rB401
         wKqANx8RFCTtgr05KguIZBYlJ9kgso72CokYsjvlLvGUVVpq2nbtYARP7z1i+ju9uOXv
         /G6JAGCWJlJsV9Hnx/zHLppYZdo9UmxlS35NEKA7Bge9wJ+Tu+YD698jV2zzzCaDxTFf
         Klwg==
X-Gm-Message-State: AOAM532H7S/KP3czFJKvU4HBI34o197Co3O5PScVyoPaRxIg8SR9tExr
	D1Crb5lOelEiZho4/R3I6MonlZWs
X-Google-Smtp-Source: ABdhPJxq+ORWkt/GpYaUI06jg9inslirNqu2vPBtVa/5k/UdWqEol0G2Inbp6O+Ntua2t2MU9l9Otg==
X-Received: by 2002:a17:902:7249:b029:e9:44dc:61a9 with SMTP id c9-20020a1709027249b02900e944dc61a9mr10765075pll.32.1618597874992;
        Fri, 16 Apr 2021 11:31:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:31:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 7/9] target/arm: Rename mte_probe1 to mte_probe
Date: Fri, 16 Apr 2021 11:31:04 -0700
Message-Id: <20210416183106.1516563-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ecHdwaAEppUD

For consistency with the mte_check1 + mte_checkN merge
to mte_check, rename the probe function as well.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  | 2 +-
 target/arm/mte_helper.c | 6 +++---
 target/arm/sve_helper.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index af1db2cd9c..886db56b58 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1145,7 +1145,7 @@ FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
 
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
+bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 161425f208..011a1ffa46 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -121,7 +121,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * exception for inaccessible pages, and resolves the virtual address
      * into the softmmu tlb.
      *
-     * When RA == 0, this is for mte_probe1.  The page is expected to be
+     * When RA == 0, this is for mte_probe.  The page is expected to be
      * valid.  Indicate to probe_access_flags no-fault, then assert that
      * we received a valid page.
      */
@@ -808,12 +808,12 @@ uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 }
 
 /*
- * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
+ * No-fault version of mte_check, to be used by SVE for MemSingleNF.
  * Returns false if the access is Checked and the check failed.  This
  * is only intended to probe the tag -- the validity of the page must
  * be checked beforehand.
  */
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
+bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     uint64_t fault;
     int ret = mte_probe_int(env, desc, ptr, 0, &fault);
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b63ddfc7f9..982240d104 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4869,7 +4869,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                 /* Watchpoint hit, see below. */
                 goto do_fault;
             }
-            if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+            if (mtedesc && !mte_probe(env, mtedesc, addr + mem_off)) {
                 goto do_fault;
             }
             /*
@@ -4919,7 +4919,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                      & BP_MEM_READ)) {
                     goto do_fault;
                 }
-                if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+                if (mtedesc && !mte_probe(env, mtedesc, addr + mem_off)) {
                     goto do_fault;
                 }
                 host_fn(vd, reg_off, host + mem_off);
@@ -5588,7 +5588,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                 }
                 if (mtedesc &&
                     arm_tlb_mte_tagged(&info.attrs) &&
-                    !mte_probe1(env, mtedesc, addr)) {
+                    !mte_probe(env, mtedesc, addr)) {
                     goto fault;
                 }
 
-- 
2.25.1
