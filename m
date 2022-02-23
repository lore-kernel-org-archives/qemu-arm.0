X-Received: by 2002:a17:90a:5d0b:b0:1b9:4720:6f9e with SMTP id s11-20020a17090a5d0b00b001b947206f9emr1543986pji.72.1645655508236;
        Wed, 23 Feb 2022 14:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655508; cv=none;
        d=google.com; s=arc-20160816;
        b=uxujejaXu6oUdzVHuI81zwVDaiH8LMilvgTNdaWSimPUyHjJUDWvtzdXQUJUQO93jW
         W/SIOAlsIzM0M4yYsY4TWVShmy2pEcvwee9QLRLXS7PV5EWudV/V3phTfvpomRf9Ji0v
         wUVRAkWyUL/folExoVlLPkobvZMKZ1b19bmxZoWus2LkbaUoh2PT3C+i1GMqfYrPXjSR
         PfInMcP0XdfBV0CKMRg+KrQuQQ+cmAn5RJF9AD2STTlUoDeM+QPXj65kJ4GQGC6ttIEz
         G3tOmOf5Xf5ZtlZFrlrLy/XFQ9A+1SP2B/a2rcQcS5h7ueYZ9dqBIKzIG5PSNrg6W8F4
         9eIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
        b=UJEtMUDKhQq8JkvoBRban0uBNcfL7KVDR3Ef7ByGBVrPfz7tjsPR+xO76kSzpq6G/N
         ZWFiYyWlDeshmZjVLJsXZNFu3/kAset35EI6LhnT4ZCJ5FgoJtlDicS7k71G8+qvdvvv
         RwjkncHDjXhYydj8mMHTNHq0/q2Q1qpRs2lWQNndhPjVNrjUJyA/CNEnNhdzZYjsJNNQ
         HVSHiLLSj1KDs+fRATZuwA8NYctEqMPkZ1wzL0xADg+r6xqRFP9vE+ol1AEGyS6wE1Q4
         ud10CDXqSpof91X6Wve8O8YqSUBpbuix2Zhh4Ed4xZm+SX8bhaRayYksnjFRz/Ax5u3E
         lVqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOBGPyjn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g16sor583321pfj.37.2022.02.23.14.31.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOBGPyjn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
        b=gOBGPyjn86roSjbkFP/FeauGD6Wio1CL1j62VVkw5N+cd1nPvuU+a8gbscsbUsdlcp
         bpeaNJtqMh52Kvz0Vw2Swi/5geIG5SOfKnfn7xcvHkYUAyeZK3sc72N/0MYOj59FgN3C
         n0P3neo5bnMiobjkcQle4cgJ9d7WMCt0fwqnpLHAJi2yKrNg2aXfZCvdMq5KxUFBrku/
         6hIPZSOMA43MbhRSntvkJFN1i70RyftJoRZ8ALXnFBsgR4XeKJu1SJljuUgs5/Cb+C1k
         xD7eeGXz5Hst/U0vPQgo4jx8mD5ie3lZdmyh0DQzxtXzXdi8X2SAhNgbaez48KUX2Ufp
         2lGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
        b=qJDkaOmrlCz/BvzNZfE0gJGdEZk+EHM8fUN4kqQYnW7qJYXuX6lBC10jIGWM+otShV
         SNdBIc7jLBB7BraFOe8BUuDYsFrRB+zhP6VkpWEu2Vl0FpNGft5+mF5/OD37qbTSEdgM
         pWr/XstIGEQ1ngM0fXtX8imHCcPsUFQDQgSBnzLcoFiYQFaGBiNY6iBQryiH9zUhpHQ5
         tm1aLWC00W9gMlF3q+LPRYaClQDNsIFFugVgL4w3MH/16WJ9l5GUcgbBL2kndTwjT6Sh
         GBuZR7MB9F7Ls2GtyYp71TGBODKVLUJSnwFRNG1CZ5aAzPiifN3ZvSIUSUjeZ154savX
         vRQQ==
X-Gm-Message-State: AOAM530TfZr99ueDtXb3BEJzn51Xbs5l9qO5ibCqn27p+lbcU8PpckBM
	mKPzwpo0F/AuebJoH2a39QIX3h99
X-Google-Smtp-Source: ABdhPJwCIpRZ3UJPxNOtTx/4M2JERi08FovPiaBmDhPCwz1w+KDdwVp+6JVw+jmw5wwaAk3sUwejvQ==
X-Received: by 2002:a63:e747:0:b0:372:c757:c569 with SMTP id j7-20020a63e747000000b00372c757c569mr1401082pgk.516.1645655507689;
        Wed, 23 Feb 2022 14:31:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 04/17] target/arm: Move arm_pamax out of line
Date: Wed, 23 Feb 2022 12:31:24 -1000
Message-Id: <20220223223137.114264-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2LZ1mXSmOUEQ

We will shortly share parts of this function with other portions
of address translation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 19 +------------------
 target/arm/helper.c    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ef6c25d8cb..fefd1fb8d8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,24 +243,7 @@ static inline void update_spsel(CPUARMState *env, uint32_t imm)
  * Returns the implementation defined bit-width of physical addresses.
  * The ARMv8 reference manuals refer to this as PAMax().
  */
-static inline unsigned int arm_pamax(ARMCPU *cpu)
-{
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /* id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.  */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
+unsigned int arm_pamax(ARMCPU *cpu);
 
 /* Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dd4d95bda2..71e575f352 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11152,6 +11152,28 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    static const unsigned int pamax_map[] = {
+        [0] = 32,
+        [1] = 36,
+        [2] = 40,
+        [3] = 42,
+        [4] = 44,
+        [5] = 48,
+    };
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
-- 
2.25.1
