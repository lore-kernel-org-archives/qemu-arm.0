Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp572414lff;
        Thu, 17 Jun 2021 07:03:31 -0700 (PDT)
X-Received: by 2002:a5d:4848:: with SMTP id n8mr6200787wrs.70.1623938610916;
        Thu, 17 Jun 2021 07:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623938610; cv=none;
        d=google.com; s=arc-20160816;
        b=KUuUWpeLmmHLk5hI9PcmyG94ClacZremb/xLXLXxMYqQtE0aWNRSLWBh99jzJNDF4Y
         C4y8UuPMjPKMxL38ck18RQ339QbfUDwnueLBTEA+9vp+1z4yigEiIxGyzmGiEmBYsbEl
         Yrubuzz0BMdFVAF6dH2vON2J9+NpvkWQoKdWh5QTVTUHyJDm3PO7WqnD3qZWV/x1yjQs
         +1fehmR+im8G0BbGFvR4LAikxqcn50erID2nVcmPI75OiyMIVE1HFlk/5eXYkgSyGIu1
         OYz0+9R/Jl5LFouIoqbnzT77YtyG22ipe9OFzE/2Yab4KABKnPhuf7C1YafGBJ/5uuCl
         Ta7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=bnFgp5VKXuhTLyDrB8c5/jvfoQ26KYnoZFUCCZmNJHg=;
        b=fyqgw78o6K0C1u5oFxK8ZkTGyEIKoHcQK/5iLxI7ZY2/nneax26BCky/HhimvkGBDU
         eobpW49WpwujgemMEY+S+zWcs7vM0aCG9eVuih06hHdODslVutyGT78Cf70FrYhrDi4D
         Bvfna9UlG7iBxVaTX0HJyRXlXNbV2gsT+ol9/CDi3jmrBP9c5Eehitdg/5eR5+6biuc1
         Vyarb9Jn274dtojFfHrfrbcMli1t0idVtdDoDGK3BCPiNfyDBZnrLOtJ2zbFp2Xw9xUF
         NC2ElTLdpk30Q9InWxINDShSVg5XHYdew68NKoC09xfhQc308TXWPilp/W9d//XMdt4G
         4jhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npygr6ey;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o6sor3100251wrs.48.2021.06.17.07.03.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Jun 2021 07:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npygr6ey;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bnFgp5VKXuhTLyDrB8c5/jvfoQ26KYnoZFUCCZmNJHg=;
        b=npygr6eyB43UQNHEMeI1eQtEo9fkc4n/FJ/5lLlOYuVbgGRyJMuEF00Ky+PkdQSsU8
         IwKDfYJFJJFLuFZzrCSU298KA+f7WG044RR/WJNodcQ6yZEILwyBDtXmM0JV+jHolWsq
         pZeh6qeRDGP5WY2P1kk8sMAqEigwuXRH7mDHo1XRmn2fs1dy6SLSHTm+q3GmRzXFCQTR
         vp9c9gNMmkpNvAkhUYF/e4ODApuW1KhRMDmwjMHJc80ajdnSf5ZRzkg+U7J8bsg8sO4B
         ayFI4B4+eMCrSrYkeMdCGLNvEf7zngEd4wl+pRLf8RLzIkJBg0E7BZUnVW7FCAEOnVGN
         4Ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bnFgp5VKXuhTLyDrB8c5/jvfoQ26KYnoZFUCCZmNJHg=;
        b=n2Mp87c4yIz7jItKmIbOAn7H13O4GeHFuzfE9q+D2NK8ujiKBVRN8O1/OnUhLFxwgd
         ppYtRDzo3UPzvj3bJLg2cyfuwPBPTL77jQPBXcvj4Ytfr6tIvWj++KJpNE53Zra1c/A2
         jg2Qcc0mBLVDHyOLiT3jcJRtPv2oUY6gUBz9Uirw37yI0pCBCUel1+Bl46nBTe2YX9+w
         2SjJpsijJq4ovstPwuJvXaPGrH7+40v4o20xDEz9aXW5bjb34CrZiUEW+jMgezg3/9YS
         3jf0OxxrAwEjF8dCQZL1slplMZZoFrcK2W0PneYgWZK0/MKZqdcJ2PM40pcRWfK2EUya
         JuWw==
X-Gm-Message-State: AOAM530pMJNs7X3Pz+YnElEjtGjlnjDtUBNfbLQOGyn38J+7amf8sKSy
	byEY8eg4IZ4dniTd13pi+VQjnMDhKJ2Ci9is
X-Google-Smtp-Source: ABdhPJw6SlQOVK4drE2gobRLmK/OO3NmLwazvr2y1T+HXPy9R7v0wy8sx5CB/Dxo149u7Hm7ToWkMA==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr5993222wrt.295.1623938610580;
        Thu, 17 Jun 2021 07:03:30 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id i15sm5254253wmq.23.2021.06.17.07.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:03:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] docs/system/arm: Document which architecture extensions we emulate
Date: Thu, 17 Jun 2021 15:03:28 +0100
Message-Id: <20210617140328.28622-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: msqMFb+ZlXr8

These days the Arm architecture has a wide range of fine-grained
optional extra architectural features. We implement quite a lot
of these but by no means all of them. Document what we do implement,
so that users can find out without having to dig through back-issues
of our Changelog on the wiki.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
v1->v2:
 * sorted A-profile list into alphabetical order
 * listed the component features of the cryptographic
   extension (FEAT_AES, FEAT_PMULL, FEAT_SHA1, FEAT_SHA256)
   separately rather than as one "Cryptographic Extension" item
 * added missing "SVE2" line
---
 docs/system/arm/emulation.rst | 102 ++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   6 ++
 2 files changed, 108 insertions(+)
 create mode 100644 docs/system/arm/emulation.rst

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
new file mode 100644
index 00000000000..836c1ca8453
--- /dev/null
+++ b/docs/system/arm/emulation.rst
@@ -0,0 +1,102 @@
+A-profile CPU architecture support
+==================================
+
+QEMU's TCG emulation includes support for the Armv5, Armv6, Armv7 and
+Armv8 versions of the A-profile architecture. It also has support for
+the following architecture extensions:
+
+- FEAT_AA32BF16 (AArch32 BFloat16 instructions)
+- FEAT_AA32HPD (AArch32 hierarchical permission disables)
+- FEAT_AA32I8MM (AArch32 Int8 matrix multiplication instructions)
+- FEAT_AES (AESD and AESE instructions)
+- FEAT_BF16 (AArch64 BFloat16 instructions)
+- FEAT_BTI (Branch Target Identification)
+- FEAT_DIT (Data Independent Timing instructions)
+- FEAT_DPB (DC CVAP instruction)
+- FEAT_DotProd (Advanced SIMD dot product instructions)
+- FEAT_FCMA (Floating-point complex number instructions)
+- FEAT_FHM (Floating-point half-precision multiplication instructions)
+- FEAT_FP16 (Half-precision floating-point data processing)
+- FEAT_FRINTTS (Floating-point to integer instructions)
+- FEAT_FlagM (Flag manipulation instructions v2)
+- FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_HPDS (Hierarchical permission disables)
+- FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_JSCVT (JavaScript conversion instructions)
+- FEAT_LOR (Limited ordering regions)
+- FEAT_LRCPC (Load-acquire RCpc instructions)
+- FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
+- FEAT_LSE (Large System Extensions)
+- FEAT_MTE (Memory Tagging Extension)
+- FEAT_MTE2 (Memory Tagging Extension)
+- FEAT_PAN (Privileged access never)
+- FEAT_PAN2 (AT S1E1R and AT S1E1W instruction variants affected by PSTATE.PAN)
+- FEAT_PAuth (Pointer authentication)
+- FEAT_PMULL (PMULL, PMULL2 instructions)
+- FEAT_PMUv3p1 (PMU Extensions v3.1)
+- FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
+- FEAT_RNG (Random number generator)
+- FEAT_SB (Speculation Barrier)
+- FEAT_SEL2 (Secure EL2)
+- FEAT_SHA1 (SHA1 instructions)
+- FEAT_SHA256 (SHA256 instructions)
+- FEAT_SHA3 (Advanced SIMD SHA3 instructions)
+- FEAT_SHA512 (Advanced SIMD SHA512 instructions)
+- FEAT_SM3 (Advanced SIMD SM3 instructions)
+- FEAT_SM4 (Advanced SIMD SM4 instructions)
+- FEAT_SPECRES (Speculation restriction instructions)
+- FEAT_SSBS (Speculative Store Bypass Safe)
+- FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
+- FEAT_TLBIRANGE (TLB invalidate range instructions)
+- FEAT_TTCNP (Translation table Common not private translations)
+- FEAT_TTST (Small translation tables)
+- FEAT_UAO (Unprivileged Access Override control)
+- FEAT_VHE (Virtualization Host Extensions)
+- FEAT_VMID16 (16-bit VMID)
+- FEAT_XNX (Translation table stage 2 Unprivileged Execute-never)
+- SVE (The Scalable Vector Extension)
+- SVE2 (The Scalable Vector Extension v2)
+
+For information on the specifics of these extensions, please refer
+to the `Armv8-A Arm Architecture Reference Manual
+<https://developer.arm.com/documentation/ddi0487/latest>`_.
+
+When a specific named CPU is being emulated, only those features which
+are present in hardware for that CPU are emulated. (If a feature is
+not in the list above then it is not supported, even if the real
+hardware should have it.) The ``max`` CPU enables all features.
+
+R-profile CPU architecture support
+==================================
+
+QEMU's TCG emulation support for R-profile CPUs is currently limited.
+We emulate only the Cortex-R5 and Cortex-R5F CPUs.
+
+M-profile CPU architecture support
+==================================
+
+QEMU's TCG emulation includes support for Armv6-M, Armv7-M, Armv8-M, and
+Armv8.1-M versions of the M-profile architucture.  It also has support
+for the following architecture extensions:
+
+- FP (Floating-point Extension)
+- FPCXT (FPCXT access instructions)
+- HP (Half-precision floating-point instructions)
+- LOB (Low Overhead loops and Branch future)
+- M (Main Extension)
+- MPU (Memory Protection Unit Extension)
+- PXN (Privileged Execute Never)
+- RAS (Reliability, Serviceability and Availability): "minimum RAS Extension" only
+- S (Security Extension)
+- ST (System Timer Extension)
+
+For information on the specifics of these extensions, please refer
+to the `Armv8-M Arm Architecture Reference Manual
+<https://developer.arm.com/documentation/ddi0553/latest>`_.
+
+When a specific named CPU is being emulated, only those features which
+are present in hardware for that CPU are emulated. (If a feature is
+not in the list above then it is not supported, even if the real
+hardware should have it.) There is no equivalent of the ``max`` CPU for
+M-profile.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index edd013c7bbd..8b8547f9a9e 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -99,6 +99,12 @@ undocumented; you can get a complete list by running
    arm/virt
    arm/xlnx-versal-virt
 
+Emulated CPU architecture support
+=================================
+
+.. toctree::
+   arm/emulation
+
 Arm CPU features
 ================
 
-- 
2.20.1
