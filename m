Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071171wrv;
        Wed, 31 Jul 2019 13:38:21 -0700 (PDT)
X-Received: by 2002:a63:124a:: with SMTP id 10mr114887778pgs.254.1564605500838;
        Wed, 31 Jul 2019 13:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605500; cv=none;
        d=google.com; s=arc-20160816;
        b=vEEWgWWarSNUt39Xe/kF6F1zrf9O3cjHK0PL3GjpzZJftDIo6dm3rmtuK1NXVDbZ5c
         NhUfKVypnaccX87HgL33p2df5EhrxpLK6zWMWcuD7KpT7NB8cZABDiHF3kR0XhvMVsAK
         zqZAVBV7l7DRYzWxK5BZ1fdDcTK3CCZr9WtFgoiecYINFlNkThUD8Q8mUFlQkhmMYEjb
         X9PmylvdgETDll2Q/egJcYp8ZBM2B5eNC7OQ3uvR/zYZp2ht2qENIl0DVS7non1mqPjK
         jsy4oOsKc6pwrxzxHqdSebO6ae6dZG0VhAkD/BuYlgU4UXEG2kZVYUk8F/F7FNWyJaWX
         QMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7Rs0ix/SYQKzQx2FXXQO106tmFBYyCQIrr3vAmMEheQ=;
        b=bfXs7nzyVWyE57435oXBvttioQ7g28zPTW1M6xwQtExvS/UgrcnHcedZLGKxJ5ZD7G
         K0oQby6epgOnp0IhdaIBOv/hb1ac/YjqLem0RqeHJly4RznRV08dDeoyePKryfRf1r4e
         lhessjnSAtf5mSvtsIL830ytJmqaqFTTypNE4Ue2IcLiAU+eDkts2vPrlCKpcXYPZEe7
         /Fvs0uR98vGHGDmaMLBEDP+1fuLyZdRzpGymyczBsfaL7nDFny+pNORv5WSnERoQz6w8
         JmNyBIh/EiPib5vkSPdm8coisoe5U+iFDPfKKABiCKWZ+DmNPre4lMTdpJulIwqYR5xW
         jDrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V5ayK2Hb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f194sor50530829pfa.8.2019.07.31.13.38.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V5ayK2Hb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Rs0ix/SYQKzQx2FXXQO106tmFBYyCQIrr3vAmMEheQ=;
        b=V5ayK2HbCrq8lkE6uzbtB+Gh4x+wbDqsfwQvU/DsGlCULld2xwWZQ6oEk4ZWoALJuA
         6uwN/OKw9WpLikQjbhJO76mCnWqYyH+VzGSaCkwioqSitwZd4H1qc4foFdlx+vHbbfff
         d/sE8XnpavzktAWghiBaSNvvM+6wKi1HghKumI9drfM/FleAcJzrT1epZ6/E/avkwR6/
         1Cf18+Eq2YCoRDZZhhv1G/bPeQqx+do3NMXjJfgpEyfvcCHfYkEL5PHiScvFEgYKKD2C
         NbF6UzncMkRIF1uZ2FQUk3h1NF730sZSZt22C3+kCZIq/DpOVj84p5cZxWi6fu7Qjka0
         BxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Rs0ix/SYQKzQx2FXXQO106tmFBYyCQIrr3vAmMEheQ=;
        b=GeR2GoUCrGf7qFiyxvdCrL3i7WiH9+IPyJaM20ALCNSuXydDcKpYBmEyMIbqvh6u1m
         rrgF6Evv6jgUJYd5/XUO47wKdJ0gOHIkRsRb7iEj8LQxJj6AwXSChR50nWO1FKTxReKV
         IMXFYu/T1Suiz4r8H1xkuwG4dqeyoSmeX6E7eEOqcI4hciJdwC6mLXwkfktKlQ+ygIgp
         DA2ruspD+AsbA6UcJe2kST7dp6I50IavgKOmRYCAYc5nRpypOK6Meexab5PaypUPpu1l
         EjrTjXKSoesRtx5JuRtZng94XMWB15KW4J2lS7yQJJaouDmj8pmTqdwpq3oAq6/KFk9p
         PwqQ==
X-Gm-Message-State: APjAAAW3rlrkFQx6UjU3vehLUXP+KEmeVvZF+18fVQmQhuml/dE5qsAF
	/tT1zA3gX3p6HK62twu2vJEl5dxri1wZfg==
X-Google-Smtp-Source: APXvYqzyMRv4i60Cc+tZSoFWbWciYfFyeBgjDAnRVHQlUyW0sDi1GnHafxRO8/5mQC3TXzR5lIEHHg==
X-Received: by 2002:a62:3103:: with SMTP id x3mr48307894pfx.107.1564605500394;
        Wed, 31 Jul 2019 13:38:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 04/32] target/arm: Install ASIDs for short-form from EL1
Date: Wed, 31 Jul 2019 13:37:45 -0700
Message-Id: <20190731203813.30765-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q1Ce3K0pUqcv

This is less complex than the LPAE case, but still we now avoid the
flush in case it is only the PROCID field that is changing.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2a65f4127e..c0dc76ed41 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -551,17 +551,31 @@ static void fcse_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-
-    if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_PMSA)
-        && !extended_addresses_enabled(env)) {
-        /* For VMSA (when not using the LPAE long descriptor page table
-         * format) this register includes the ASID, so do a TLB flush.
-         * For PMSA it is purely a process ID and no action is needed.
-         */
-        tlb_flush(CPU(cpu));
-    }
     raw_write(env, ri, value);
+
+    /*
+     * For VMSA (when not using the LPAE long descriptor page table format)
+     * this register includes the ASID.  For PMSA it is purely a process ID
+     * and no action is needed.
+     */
+    if (!arm_feature(env, ARM_FEATURE_PMSA) &&
+        !extended_addresses_enabled(env)) {
+        CPUState *cs = env_cpu(env);
+        int asid = extract32(value, 0, 8);
+        int idxmask;
+
+        switch (ri->secure) {
+        case ARM_CP_SECSTATE_S:
+            idxmask = ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
+            break;
+        case ARM_CP_SECSTATE_NS:
+            idxmask = ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        tlb_set_asid_for_mmuidx(cs, asid, idxmask, 0);
+    }
 }
 
 /* IS variants of TLB operations must affect all cores */
-- 
2.17.1
