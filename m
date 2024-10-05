Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047909njb;
        Sat, 5 Oct 2024 08:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtsPT6VMGlSt6xYt8BhCkjJQfX1h4iy7UPcU4er6Mf2qFRFQHGjiWqt4qmkwXs3pgakrKdyh/KY943DQ==@linaro.org
X-Received: by 2002:a17:902:d2cc:b0:20b:99bb:c403 with SMTP id d9443c01a7336-20bfe497052mr87912545ad.39.1728141972733;
        Sat, 05 Oct 2024 08:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141972; cv=none;
        d=google.com; s=arc-20240605;
        b=Hejgkmw8hv/5lreGud+/ZFi8kcgWF1xyr2qkgqi06/FiqdVkYSlCUc6MPXVsYdq87c
         W4Zq5goX3gqlxCXrAb/4cv5Q+OVDr34QzdvzJ0ob7HE6n5oewzAuXOSYmLQI7uyBrGVS
         qyLp3gXWZlFFpP7P+ogDSIO7Wl0ZAPdeeCMOB2LYKbjd9jM6qJwyUPiHJa4K63XQe7XD
         hdu1dcoh+CXXfgjqaCna5eM0zh65rBs5oCCy7uaUKEjD7VRd7/K5vIz9NE0GeYUDGhXQ
         lIJKYq4ukfM5bfODxqOEDtMaVi07A0ZUr7udbkppJJRUjiA2ilF73dZk3Xo1L17EVmeT
         BdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qIlBHpyIHO+kiCFyGgZVBXgacr4yw5gCrMn63zUSz3U=;
        fh=+JGEziEvgFNYwLyLmVKwJ21e+LGO2ELkkwg+JZNg2KQ=;
        b=CQlFlxDHUkee98e0XSeHeqkwFzEPfBnIj92SRbW903SHtUWGB49oNuaqeSK4Cj7tqa
         DNxuMsWd09j42XQ3NbozhQZrE5ExkT9+EyA0zxbrrXe+HMJMuf8pvriqMqDbLDRoWZLg
         bv380TVluF0idNdVoxyCTQ6Ac0ShymdFd7fD5F0+Xzs3NSlk5D0RuzLTavGjDM+PoqwP
         7K+5aTfaK0m1kmBD1gOvAy0iNNxf1SBCR6lucJlc0UoFxnnebyeJDJVnGu+23Oi5Bd2l
         GZiMShq2/WFI/Eca/I9etkrwlthpwYAwI8S/8Q+h/SnUz4APsP4JZLh4mlrObRaHaX+Q
         EVyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYpkfBI4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c13768b1dsor10603475ad.0.2024.10.05.08.26.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYpkfBI4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141972; x=1728746772; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIlBHpyIHO+kiCFyGgZVBXgacr4yw5gCrMn63zUSz3U=;
        b=LYpkfBI46FRKfVl1PvvejjaneAGF5IDhq6lGU1+22Bnk2eYgZOECWuepLHMipda5fb
         Zjwubl2OOvA4ZQvV9h/bxFY+e4jKsLlBDW/MzqjD9yY2EyeKlaPfEQc4ZwdrpPTIbs0c
         UCcjc2vsxxYpVL8rOjOY+m6BWXBe8anEULY0tXzf2sNrw6SDx8JG+4ZKCOkCtFlVxYG0
         9AfmQxmxAUtt4jjKakDttCK+yuPztkIrX+615H219YKrhSUi0k95rYkoqnSl5+4S70Bp
         D9606XgFJKJEGJJ6HOuKiaRMdXKfm6gSEjz5+kmw2tbs3kZGUy7xlpO+jgxntyXfO9UP
         /s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141972; x=1728746772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIlBHpyIHO+kiCFyGgZVBXgacr4yw5gCrMn63zUSz3U=;
        b=qh6D5zZ7O1mtIR56xC7Fq/2v3Theu+GgOqeH2ZK22Yr+sUj2QuqcuNbI3bGQD14XQD
         9IJo67eslUgJ7OcGNb+x0VQg6CsKSkK1k5MEMhmniwjDqIGO4+LzNkNdIiwsHVbwM/D6
         sQTJxr8g83dPMo3Sy7rQRSLAAWYOPZMolbZHnYLJ9AhCD1nQ7D3xR++X31xjlps7jjWh
         OytTqkg8OANcPbbsLFZTqyMTu3QEB0NmvFWH9gMcsFAxpM/IE/bS+VzxEjxcB0gisaH5
         bQKS1CWxjBJBNmGaW4TrY5acAP9fGnqkcKM7vN+XLwcyvmmuJzq0iEtaqgVaCIueOwQ7
         2pQw==
X-Forwarded-Encrypted: i=1; AJvYcCXjOoJFS41+ZUwsqZ0NhJQB5D+AR8/2wpeFyhEG2uS24c07umN7pg7JivKPeimWNIuBueAoMstnNLupPw==@linaro.org
X-Gm-Message-State: AOJu0YykkOGQ+d73sNdxAWM0j2TtmVDLul3fKLGjEyKS+7uzZ/HmasHq
	ZqYgR97c30U6MCwo8xe79y/A0TMu+gSVLftjzrYrh5Xzp9MY0yAQYCWoeVBxUxYZNg==
X-Google-Smtp-Source: AGHT+IGWHKPtHA2twxKvGB6E/ujF3z3IoFDGiLN3geSfu/MXfka4dtEv6hp0P2DmLjyD/i9iV2pkew==
X-Received: by 2002:a17:902:d2d1:b0:20b:9547:9b2d with SMTP id d9443c01a7336-20bfde55510mr91868295ad.2.1728141972285;
        Sat, 05 Oct 2024 08:26:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 20/20] target/arm: Fix alignment fault priority in get_phys_addr_lpae
Date: Sat,  5 Oct 2024 08:25:51 -0700
Message-ID: <20241005152551.307923-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vfvJU18GdT+M

Now that we have the MemOp for the access, we can order
the alignment fault caused by memory type before the
permission fault for the page.

For subsequent page hits, permission and stage 2 checks
are known to pass, and so the TLB_CHECK_ALIGNED fault
raised in generic code is not mis-ordered.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 49 +++++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0a1a820362..50aa5e338c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2129,6 +2129,34 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         device = S1_attrs_are_device(result->cacheattrs.attrs);
     }
 
+    /*
+     * Enable alignment checks on Device memory.
+     *
+     * Per R_XCHFJ, the correct ordering for alignment, permission,
+     * and stage 2 faults is:
+     *    - Alignment fault caused by the memory type
+     *    - Permission fault
+     *    - A stage 2 fault on the memory access
+     * Perform the alignment check now, so that we recognize it in
+     * the correct order.  Set TLB_CHECK_ALIGNED so that any subsequent
+     * softmmu tlb hit will also check the alignment.
+     *
+     * In v7, for a CPU without the Virtualization Extensions this
+     * access is UNPREDICTABLE; we choose to make it take the alignment
+     * fault as is required for a v7VE CPU. (QEMU doesn't emulate any
+     * CPUs with ARM_FEATURE_LPAE but not ARM_FEATURE_V7VE anyway.)
+     */
+    if (device) {
+        unsigned a_bits = memop_atomicity_bits(memop);
+        if (address & ((1 << a_bits) - 1)) {
+            fi->type = ARMFault_Alignment;
+            goto do_fault;
+        }
+        result->f.tlb_fill_flags = TLB_CHECK_ALIGNED;
+    } else {
+        result->f.tlb_fill_flags = 0;
+    }
+
     if (!(result->f.prot & (1 << access_type))) {
         fi->type = ARMFault_Permission;
         goto do_fault;
@@ -2156,27 +2184,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     result->f.attrs.space = out_space;
     result->f.attrs.secure = arm_space_is_secure(out_space);
 
-    /*
-     * Enable alignment checks on Device memory.
-     *
-     * Per R_XCHFJ, this check is mis-ordered. The correct ordering
-     * for alignment, permission, and stage 2 faults should be:
-     *    - Alignment fault caused by the memory type
-     *    - Permission fault
-     *    - A stage 2 fault on the memory access
-     * but due to the way the TCG softmmu TLB operates, we will have
-     * implicitly done the permission check and the stage2 lookup in
-     * finding the TLB entry, so the alignment check cannot be done sooner.
-     *
-     * In v7, for a CPU without the Virtualization Extensions this
-     * access is UNPREDICTABLE; we choose to make it take the alignment
-     * fault as is required for a v7VE CPU. (QEMU doesn't emulate any
-     * CPUs with ARM_FEATURE_LPAE but not ARM_FEATURE_V7VE anyway.)
-     */
-    if (device) {
-        result->f.tlb_fill_flags |= TLB_CHECK_ALIGNED;
-    }
-
     /*
      * For FEAT_LPA2 and effective DS, the SH field in the attributes
      * was re-purposed for output address bits.  The SH attribute in
-- 
2.43.0
