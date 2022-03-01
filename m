Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209858lfo;
        Tue, 1 Mar 2022 14:00:19 -0800 (PST)
X-Received: by 2002:a17:902:aa84:b0:150:8d6:bdec with SMTP id d4-20020a170902aa8400b0015008d6bdecmr27156498plr.118.1646172019317;
        Tue, 01 Mar 2022 14:00:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172019; cv=none;
        d=google.com; s=arc-20160816;
        b=WTNrImYlsuxLWXdQofox18P8FV118QVzcqpf0MqeaUN7ynvaWippdjt3Jww6z90y70
         ltouThHSyrvtUxEi7rXLmyR2uJBgHmC8oe5OW4thWgGaVvCYzKst9QgcW/9mjKe36sMs
         tqFTETCIT4thnWAqeyroPjxr3IB0aUMa0Rzs2JCobhRbt4uuFT1dzlEylZaibV1GxraK
         bJFaQd8we4uDvKKnZ83Bf1lge+YvXrMuhKQCiZL0b6xY08TbkbnBHCGEiN7dgJ7iYww/
         fPpfFkwiilFjF98yAwHvNZA9iA9ZzhZk8eMiBrO/jXp2QuTrQ7tN8MVfRHVlB0b/WFJt
         GosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DRWkLoJkIekxooE0yM1xnliLnzzt/ozTUB9sEE/E5Ow=;
        b=LtaGzdQWshh3UAcHd2Cf5UFf/M6mtys0c6scI8ARF+O6iebQyDucGbrLI1niiHLVgq
         XEGAfiFpwFKES1EoRjFbMYazGuuNkWYeoqpcsatj/xrAIqlnVSISOr0+ZfOfpaQ1QEOw
         N28eGwAB8KjooJFwhNF8YDt2HpauNeQNcWfhb9AAkTy7jDWJsn4/i6wfy2wC3IdV68X3
         W68kmdhrIZkW24mskBfiWXMyqm/UzOaAC6OAM9dJlPE2nG5hx7nfPUBZpSrCfGS6/CBp
         L5j3GCu/hOviqyC2uWWX1ZZdBidupiebxnzHtRshgFsfEV0owJ/HgHKXg62uDGLbduGw
         QrMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IryxSYgz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fs8-20020a17090af28800b001bc87eb0724sor6856257pjb.35.2022.03.01.14.00.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IryxSYgz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DRWkLoJkIekxooE0yM1xnliLnzzt/ozTUB9sEE/E5Ow=;
        b=IryxSYgzvytR7FRsQVNzuNYlY/deavUtGw1IYXrAIs20xnEu3XANK+/DImGGSb8W3b
         5O8+e0c38RaC/Z7gkYERy5kO90B3bmgp6SE2NlFttHkF8sD9w2tabO6EJW4Fa6FZvkJg
         CDl/nPR4KmNCoCKIrEPlBodxlrJ6lf2e9l74gGFoilatyqYraLMbJxmO6XG/f0Ecv65a
         JSJYOWhGePz9g6JN4bRGdmqMGysSNCLUx/OxDhmFczyw8NMF1DKAAd0ho33sY2nsxbHa
         dWzTA42YCknlw3/Py1kVV5zbhffpl+ZrX/YMP0ikNFnU4BFuCS8+eNos0+qktwqf31AT
         RU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DRWkLoJkIekxooE0yM1xnliLnzzt/ozTUB9sEE/E5Ow=;
        b=IqD/TXCuBydnzh0RZyHhbVUFTkagMkUDRp90XQiCCbr70cHWCkdl/f23pn0MPFL30u
         qHLNHhU6F4gkXL9l/5jZlNbVGJYCcGMn12LltDwy9W3B9o20HACQNIlS+MRwRayiS6x4
         zS8JpqnvsxAiRSbAuzh8ee7mi7TcLCNMR0NukFHbO864h+uurFwqNpEDVK8maRKNkIxJ
         gUqkh7SMahr7vxmTNZmNqtmxA6xTiyGmSxwW71olFZ5IZ5nnKwLfSuvnHcB7ueMijI/E
         eeOQXgP10Ovo85H6AdzfCNT7thzsoyLmQKomku1A9PF2wltw8qH0z5KyVjb/mn+MdJ6E
         nvPw==
X-Gm-Message-State: AOAM530YPAcHBPKUD7tTyUUB2q2DfDQh+8hfCLjRXm5rLsJfMRyc/e/+
	snXt6otXfZbfbSqIekfz9see+4mI
X-Google-Smtp-Source: ABdhPJwUF0u8CwMIDf7E4gEL+acX5Ww/fu7EsQuetQQ1iTTTUordjRBKChjcrU6aQiSy0W/HtyOuPQ==
X-Received: by 2002:a17:90a:de96:b0:1be:e427:8745 with SMTP id n22-20020a17090ade9600b001bee4278745mr3782373pjv.175.1646172018732;
        Tue, 01 Mar 2022 14:00:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 10/18] target/arm: Implement FEAT_LPA
Date: Tue,  1 Mar 2022 11:59:50 -1000
Message-Id: <20220301215958.157011-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: v2WWnFRlXqat

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
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-param.h        |  2 +-
 target/arm/cpu64.c            |  2 +-
 target/arm/helper.c           | 19 ++++++++++++++++---
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f3eabddfb5..0053ddce20 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
+- FEAT_LPA (Large Physical Address space)
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
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
index 1de31ffb40..d88662cef6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -795,7 +795,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
-    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 28b4347213..950f56599e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11173,6 +11173,7 @@ static const uint8_t pamax_map[] = {
     [3] = 42,
     [4] = 44,
     [5] = 48,
+    [6] = 52,
 };
 
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
@@ -11564,11 +11565,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
@@ -11620,7 +11625,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
