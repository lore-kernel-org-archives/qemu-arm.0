Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071252wrv;
        Wed, 31 Jul 2019 13:38:27 -0700 (PDT)
X-Received: by 2002:a17:90a:1ae1:: with SMTP id p88mr4568895pjp.26.1564605506888;
        Wed, 31 Jul 2019 13:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605506; cv=none;
        d=google.com; s=arc-20160816;
        b=Gkfmb0lo/JYuyw6RyWKYAxgTBhNktI+BAMNS/HEMdh32Hi/1pZaVd0JFssN8cZ4Elg
         oDXeiYbjIO7hASnEgyajKwZv/MXpR8EFdX17Z7mTO9RyqN6J52GWdkbj4pgA/PiKVk+X
         0MgvvdlKgArFCNUMDhjVSnwYJ9m/0dp9tAZ+M/5bvkVHiJVQeLB9kPEkc8vjipwBMWvt
         YDSOmRCkqZXa4A93VZEoA1z7YZ4Wbg3Air1MbPtNdoO9Tt6O6G+j7rAx5xQVVpjyHb+s
         1ZxmnINlw8guRTyy7iqDb0ZsdhsEXgeVIgvxrcH8LusYq7oSMSIfHLw/GLhsx41srSqE
         DRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eXztB5+CPZYWvtJqCXCkkbobp/U8zAPLQueishTnE64=;
        b=QHSo65hk91GucO2hsHizzvP37CO/ymL3Sgz5f78EKFYBW6GzulnS7CIPZx6JjU7BiH
         eHeUdeHEiV822regBDplXdirUt5GecR2YseBsqQzT2NTZCysCy9SatsJyrEX2MNg5wRC
         2JK2lgcYbETAWhHFwQMzAJDTJU/R9FgUATZ+y/+AJxSREiKO/XSkJBhnK/BPFYE9cNW5
         TW1HhC6b4GBfyJY6KWmj8pjfKEoJ1fchG6qh6yWRnWPhRmSIwEuLO+7tubiwae6n/T3s
         EEx40hZ8n41DiGlfKUplgEWJMjqGhl+xhxw85/7zMSuI4jGNDXf0kJ8KSZ9YIfJFkfum
         5nvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZBRaFRD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bx14sor3494987pjb.21.2019.07.31.13.38.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZBRaFRD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eXztB5+CPZYWvtJqCXCkkbobp/U8zAPLQueishTnE64=;
        b=YZBRaFRDeE/C9WJ9U7ACwGnFPRCpOoJFuqnM2lVJHxJ0dLtO/g5G9LOwwLdcIbIcVq
         V0rn35vxniVdiuN2orhSR+g/A51rIlfJQxrH2C+F0ec487jADOIrW8coX6bWTtSwK5A9
         JJzFNRq1UfvEegm/Dsv/AB5WGHpwQb/anWBWBftgcNJqUOYjg5kZgCwxiXNG5aHQEqfq
         Pnd1W3VvS8+EwAkWdnsou3RCh9ARY3I/9XC92W8nltPmIvsz40pIu9Vr6cWtbRVdQDiu
         NzPpstQyYFlYi/xNxdXVpKyvlHir50JZGov4d7SJDjjmCb3giNYSQ79sxQBinKPqQ+H2
         brqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eXztB5+CPZYWvtJqCXCkkbobp/U8zAPLQueishTnE64=;
        b=PSr3gFSrbXskj3A3Tfy1h0iiW5KVEoNMCFkt8IraJnmVnP5ngQEDDFO9o1M4XUXzMX
         usmtXwp7YBWQ+GgeE4QwP7UMBV8V1PjOzkgjXnsSBPhoYQTgF3udVT6MxbMef8qbipv8
         YxHlb4YWzPS8skT0A3jZGRaXNpBHADJsYxorLfhfmvpIfygB1rIeNmrMNymoAfjwT3J2
         c6EGdWijTQm6LxYHyBEihrC/4zLPG1VP8Uk67OhwpLF0cHpB+hx7t7LSA3b7QHNKPSh0
         V+UlfYXVQI3bksJ+DSN9X6UGBfz2aDSt/VgvYzFkKyGj6sW/W2+JfCqvAIRp+meC+loP
         vtpQ==
X-Gm-Message-State: APjAAAXDHnHgKANA/iFWNx0NnY/N2DYN3UCkiDx2O0rxHZLjXTk3WZfU
	aN+ysQPEPnGwC3teCNG/0w5d13ik
X-Google-Smtp-Source: APXvYqydtT5ieHPuIhGsR9m+t2LPyIs+SxOF/gV8J0m2blMmbEMchISfMm4lgQHzmpzAPb0gxwebcQ==
X-Received: by 2002:a17:90a:3086:: with SMTP id h6mr4877113pjb.14.1564605506348;
        Wed, 31 Jul 2019 13:38:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 09/32] target/arm: Add TTBR1_EL2
Date: Wed, 31 Jul 2019 13:37:50 -0700
Message-Id: <20190731203813.30765-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AjtB40B+sI/A

At the same time, add writefn to TTBR0_EL2 and TCR_EL2.
A later patch will update any ASID therein.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8baeb3f319..8d8b3cc40e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3449,6 +3449,12 @@ static void vmsa_ttbr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    raw_write(env, ri, value);
+}
+
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -4844,10 +4850,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0 },
     { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL2_RW,
-      /* no .writefn needed as this can't cause an ASID change;
-       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
-       */
+      .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
+      /* no .raw_writefn or .resetfn needed as we never use mask/base_mask */
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
@@ -4881,7 +4885,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[2]) },
     { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .resetvalue = 0,
+      .access = PL2_RW, .resetvalue = 0, .writefn = vmsa_tcr_ttbr_el2_write,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
     { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
       .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
@@ -6807,6 +6811,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
               .access = PL2_RW,
               .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
+            { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
+              .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
+              .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]) },
             REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, vhe_reginfo);
-- 
2.17.1
