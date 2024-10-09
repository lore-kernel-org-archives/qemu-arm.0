Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532113njl;
        Tue, 8 Oct 2024 17:05:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzuccXOJuhU0QDNCWkGAIkoT+LCfpifg7Y4ik5alcvFKy0E9r4xkltnne6j1JvjFC4zyi6oFYRbHwMqA==@linaro.org
X-Received: by 2002:a17:902:da81:b0:205:861c:5c4a with SMTP id d9443c01a7336-20c6379b2e6mr10735575ad.60.1728432314868;
        Tue, 08 Oct 2024 17:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432314; cv=none;
        d=google.com; s=arc-20240605;
        b=lPpVEAI2MMqoXekvXv63E+8vdC9FTKVm7hVNeAFDqf6dnesqUcSmduAFZzqm4HZ9l8
         q2N3nUS4gKXekVs8HQugdRYzHsNtXxyo3iHmLe4v3YzJg2+hBof1j2QWujn8Rmyob8R0
         5xryfQxHYGJRjHdhod2l0WqwSOBgn0GW+AshmX0UutFvML0mHFgEi8qKG9jJMqYJ/dgQ
         0/Z3+XZA8WUzrOZiV0Q2jEdzCzPUctBYtZyLfVY6Ow+6pgtspMAb+FSKB4o5WPR6xyR5
         LtSK56DgyITNb1SG6r7wV93NbCHCalnxI+9dR7gxDqSF+IXBPtBplncVPcfdNAOG6RY3
         0e4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=G2SEeBS4yBn5Ue1nQmA6MrWE5kNjL002NNNwwbKYNls=;
        fh=Gio4deX4FYfvmj+3esf9YSXbEHtcXCjSXAOXsgV8cVA=;
        b=i8YCEwCqltMsg2Hf43o845wo8bFs/Db/yXtYiM7ohf2H3q42SaXWgH3zgjV4APJ7Va
         r/+OQ4Kql3/ryhuMOG90ezaAAQkr4TgbJt2aj1BLMVmLKXBugSvHYA0i/54Feoj9owWq
         qARjGXRL4haJrlSR6JuovWl9N5g+xOnyViTkkLjgWmyevgTl2DQxTcj74/jPNaPC8r2Y
         Nh6hcZa2YMJAVyY90qi+ITu0OTfN6z3UJXq6j2inI/TXdAGyee1Y0DKzHXghVsq9Oy2j
         TnUw5T85XxrSv5C34V62nr3gR07hvWxZ1uhG8zQrhi0yyQwP0r1Bcgax/NiNd+PkL4eC
         0EPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ICn+f/rh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c5c873821sor10141925ad.2.2024.10.08.17.05.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ICn+f/rh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432314; x=1729037114; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2SEeBS4yBn5Ue1nQmA6MrWE5kNjL002NNNwwbKYNls=;
        b=ICn+f/rhmm9H38nVOKwpjLw3LIiQm1bhalRhVXdHsa94q4qlAOn/z2B9SD0+73FrBG
         yVMv7qqufs2lVr7mXvBDvmiq0N8LV3Ltl8oir0tGxyrtpxsNCqOmilGbTtKtbXDzFVUO
         CJHljG/i2mVWMErDcKi5fm7kKDTumokT33ZyQ9XhrMtXUfpM+eeGtF7PZPrx4TlyQndl
         McY1oGizZDI21Lx4v+UgONbE0vcaJuEKU6D/2A5z0oAH4w0h2m/X0wrIPUk4mJIKpVr1
         BkNBgRA+NV78I1jS3pbjHHxMCbXmgDeI9szF/blMWWoXEkEFxPrIidOkhNqr7qrz3Ouw
         ZQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432314; x=1729037114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2SEeBS4yBn5Ue1nQmA6MrWE5kNjL002NNNwwbKYNls=;
        b=Mg/39V6A6JW973Gn1bmBrdCmNyHIUxkM3JU9FgnLt8UlZ7CpS+8TReeG5iELAEUsm+
         eKSPNgfPUELyCcG4LT7mVUB0uoYxGBl2bNCLOS2O1nRu1G2bv3iaKo5W9/ehFNfiZCLN
         jyEMlOVD3iqYKQH6Nwj8ap+QuMDaWTIBDTi7RIn7+z+rp6mDhA+9dXZ3wTqAc7DtMGAZ
         i25uFiBWxeuLY/SdcfIm5aEQtCHbEulA97+Tkqo8uCaPHnj/2/HO2gHd+H0TfGLxgKNo
         Ru0wFAcJWkkohAYzm5sxLzbOmgHpoQ71u5CgXTUTZYae6ms+kRlFGwBwCtUGaD8f+0kA
         ac0w==
X-Forwarded-Encrypted: i=1; AJvYcCX/C64NmJIh2F+/+wiLrguo/12waYPQW5X7vsWFnmG3W2Jq/Q9wbGEl8hzbhm7tBkToBR9jRNw2IRVvgA==@linaro.org
X-Gm-Message-State: AOJu0YzUwLAuivvpLXkQCMmI2jyIuXit+Wum+1hh0Kikl35eNVfvuLM1
	KaKOgyS2zFJirUcJJfrHjEYC0ewwEvH9lBm6L/2UJ8YF34Pn2o3AwKf+KrlF8wcVfA==
X-Google-Smtp-Source: AGHT+IEIyXlGp9GlJJjjmIJWjUJQUjNDGcChOdkRVTwHuAzsY/hOJnshLN76/ClOQ0ILuClUnw979g==
X-Received: by 2002:a17:903:22ce:b0:20b:a5b5:b89 with SMTP id d9443c01a7336-20c63751f24mr14941525ad.35.1728432314287;
        Tue, 08 Oct 2024 17:05:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 20/20] target/arm: Fix alignment fault priority in get_phys_addr_lpae
Date: Tue,  8 Oct 2024 17:04:53 -0700
Message-ID: <20241009000453.315652-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A14oT+UGdMLP

Now that we have the MemOp for the access, we can order
the alignment fault caused by memory type before the
permission fault for the page.

For subsequent page hits, permission and stage 2 checks
are known to pass, and so the TLB_CHECK_ALIGNED fault
raised in generic code is not mis-ordered.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 51 ++++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0a1a820362..dd40268397 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2129,6 +2129,36 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
+     * softmmu tlb hit will also check the alignment; clear along the
+     * non-device path so that tlb_fill_flags is consistent in the
+     * event of restart_atomic_update.
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
@@ -2156,27 +2186,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
