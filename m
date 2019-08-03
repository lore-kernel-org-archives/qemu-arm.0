Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200875wrv;
        Sat, 3 Aug 2019 11:48:08 -0700 (PDT)
X-Received: by 2002:a65:6284:: with SMTP id f4mr73236015pgv.416.1564858087965;
        Sat, 03 Aug 2019 11:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858087; cv=none;
        d=google.com; s=arc-20160816;
        b=F/SAbdv5f0HbfZoEnGpAF0YYCjg+ghNAsUtFBqo4Eln6CcJUCLTZH5o+8DdJ/pPlr6
         2ss522LtfjqbrkcuKqTgg5qmrlU8VUFWUAeM844CpLEsvLVcSiV5A1TA+SYbMwRFWSR3
         6bKmo8GuUjFVulXc7altknsLp3OB1zjY7YwJOidjw/+WYuiMWgYtvYzzoPEaQTNE2Yr4
         uTDyeXN4nWVfnS2A9LsJkyDQgyhmuq4zazCXaCRJMaa76WWfbgh0PrpcV2LuF3OWPiyr
         Z5lR05rP6ZfFVOKI2P1z7wYfkh8nOmG/lNuXsU+oWiMpS0ZCK3ILG+yxUoZthAcmHeAe
         3fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7Rs0ix/SYQKzQx2FXXQO106tmFBYyCQIrr3vAmMEheQ=;
        b=mnDECUWpPg5m8pkiiQLv4EGGpGIG8ed7weh7304SS3wv+jwMeFoXAlVI/+wM9qAHXc
         YQxTKccFPYEenTFWO0JsyHl0qwUi7Ceo9jfCf8g5fXRXPW0GCe/8fNk5vi90wClsNjfh
         teGUWrWDQYSlnJWOZQcOIzSi6W3sDDSAnW1O1Z7r3zUJE76mBrogrBpo0xlmo3X6m4C9
         VVpfGlnxpi+hju2N1XWuTkyd2vOhEMW+cQcXbgceMOC85KMHhLG3p3w4ZrJuqJwWiDC1
         rhI7RcinRaWquv6kZ85fTsq8ulMtoqpjMnbLp00keYYDnqaHimHuIf++rEkdLzl0YFJS
         SPaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPvHAofj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h26sor60619448pfo.20.2019.08.03.11.48.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPvHAofj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Rs0ix/SYQKzQx2FXXQO106tmFBYyCQIrr3vAmMEheQ=;
        b=vPvHAofjDh13cvA96WTwyjFAdTULJbdQ9ybEFKJfgyYtqSaKhbOjXvki83K0xHqo11
         MtokYAYkf6sRn5wnU8jQawtxscZaTYUt+AZIExuMd1wZejf8tNQ1Sfi6yxddylozCGR/
         KI3d3Rybp77SktK7y2d1h68Tj9aKww6QaRRuuj7ZE2Xy+9SpsnqN9lAlrxLWQFKD7vEE
         I2URa8cgSieAlS83ATnACU2iiRE5N6FtxZip8dABXOGRbmKe4f+YImVa8ivdnw9kphBN
         CKon3LMB/w6/XtDeZ5S1GPpYRfDlXnJscrpe8roUK+OHwU7g6ePJvDppWqhMq/fls1hc
         zdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Rs0ix/SYQKzQx2FXXQO106tmFBYyCQIrr3vAmMEheQ=;
        b=lljGsdUNt8Dy4n8zhv1CuImMVcUywPKxdfo90Z5+7yy0qcR22MHCMOx1q6cIX2VCvi
         OcOcsBKwH+aVBlg7AFXZ1wRdZFe51UPcdbF7m2ks/63gvircwxX6zOGIXnYN4EHZ0ghw
         wu0chvMOoVFMj2sZdamDF7Jx3slUNYO74R5Cb9LYPOLqnzsIDi1rhSJUNKYyb9WSiE5U
         Tgx20xMbJctpJ/zPEz7klN5ahWguimAKXPMqS+y49jbvPhbijHRIeTuwUApCeAk1DCj0
         kDgVstB5sVGT5gg1z+LAAtMjgWch7TAMFBC/vqZHFQpC3pksa1H6qbqD36RGmd1gbx7X
         22/w==
X-Gm-Message-State: APjAAAXDRr5a6BXsvX+bGDow9a6521JOClawYNrO6wMYK5KvcVuLeChZ
	e4Pijmu3B8tFtlr6fMix7ZnoO6lW
X-Google-Smtp-Source: APXvYqwfqGKZuSNSsCvI/U31pcyp3UPCGhi9soCIZOjfGaoy0K/asXvr35NSg45u3lrQ2vhhDIUEkA==
X-Received: by 2002:aa7:97b7:: with SMTP id d23mr68186838pfq.203.1564858087487;
        Sat, 03 Aug 2019 11:48:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 04/34] target/arm: Install ASIDs for short-form from EL1
Date: Sat,  3 Aug 2019 11:47:30 -0700
Message-Id: <20190803184800.8221-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CgN6HieQWIva

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
