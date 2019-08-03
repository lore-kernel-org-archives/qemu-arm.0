Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200942wrv;
        Sat, 3 Aug 2019 11:48:14 -0700 (PDT)
X-Received: by 2002:a17:90a:7f85:: with SMTP id m5mr10404590pjl.78.1564858094098;
        Sat, 03 Aug 2019 11:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858094; cv=none;
        d=google.com; s=arc-20160816;
        b=Loao9Ah4iwf1pm67uB/fwTdcojDw3Ds1fSVsnv4O265+Hfbz/N2ori/ap7XEKbsCVt
         YRLfQ/jb+TGwDG3QGonfaRLiW3Or4i+rfXjpKYV4m5oXHnEBVFweUzY46wzD6/sUbv2d
         mhLTDlrYxAMFvkSAeN8Uc8INts3039vlb8ESNcHS1tU92PRTW7vGQ4oDV2KriuJBFoFh
         LgSM/8K0xozteAuoZ/kU61duVrBlK0S1wQgFV1zfqTz6bqQP+ustZICMb+o7jGbAy5JR
         6FR2miquBPBqGeXkkEaVq+fpRl8rEEJJP8HKxY1BRgs+PzBMa6fxEIpAXsNsOMuTcYaN
         SEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eXztB5+CPZYWvtJqCXCkkbobp/U8zAPLQueishTnE64=;
        b=xO0pipweOFrwm/OPHCuQ0+BcZAt0cklCb2Sw5DKWodwsONYBIJHWszUhQPOtxSq1fV
         Oloxx2cGfF2AneOM3cfzFpuzRxdVlfuVgEULlLvEy7YR3MGk0kWdJ1wyj3Zje9Sf9+7S
         KxQWp4eyFuxC779E19uQOW/9D3qMF2wZYZtTTp5RDcjVGl+kUQirs+bUOOHk/P3FL0dz
         yPY51pmbkvTD2a1gG0vDJENAFyu2LAHrCZXIgsilz61GrbFdyJpbdjgqvNqx9M7KlU89
         JYCfBwsvioDt9hCW9qgW33ze6PcD8m7w3croyl7t/ZPpLNLlbzWFd86ikzaF0PkZccYH
         lZCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJ98DjJu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s138sor34909059pfc.44.2019.08.03.11.48.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJ98DjJu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eXztB5+CPZYWvtJqCXCkkbobp/U8zAPLQueishTnE64=;
        b=AJ98DjJuyQa8Lr5B1/KRUNoK+ILQGZEY9Jv3+Ww03P6WGufe/CvR8wyHMj88ptaIR4
         r0bz8uvJn0E8vEGQoHbmsxXpve9cfB66rxvlVOkP9ljpopFmHG1HcxbH8MWz7/H6q3M6
         u95D3jILdArc0uyivXitYvp/ISBhXCsXQvaDnNABaopop/5PgGllnE99riLxlLbRUUc8
         2uo3HYe/J1G0KDBaQFEyXM7aXMX/W/5LTHVOxlT+NvzzmkBDKDJxrQZBOVYCfq3ezmxW
         fV87C/o1zBtN9yOn+zD50rUqX+VBxjFC3dQUVAaej+TKRJgx1ZB5eCkudDlyeWXz1YUf
         Jtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eXztB5+CPZYWvtJqCXCkkbobp/U8zAPLQueishTnE64=;
        b=naUNDQcf4YlPRZ6TDQrviFY32DbrWabijZUUUFIwo5FLxy3pd8forxZKaJfKzl9VSF
         eWM4OjcYSC3qRKsCGNOOTfyYlNBvSVx43beZ3diaiFt2pjh82VBmjnRd2EA7YNJK2Q1c
         iFFmp1XemJ7zeBl9Ebp6JEc7t0fqVF4IIVJLmsa+fh/3ZmMHQjNEwQwWQHQ1TkNEpboa
         rn0J5DjzRG0z5vD6cXD5Uk9aVQdvS6XnT+SB8osX7Dpy0XsDi3o25BQOFxE9s687T6pl
         jOcjGXtiqUoqkRTtQ1k/OkNtwhGvE6lr+r/7q4bVc8BC6Gsml73gVRSVWH9y9MZ1TsZI
         sU8Q==
X-Gm-Message-State: APjAAAVDpCQdaDB5x1SYfrvt5SKHOyVa3a1pVEV2u3NMLWaLfzR0PjM3
	vpCbkDHziF2Bs4OVMjLcGHEXlIfI
X-Google-Smtp-Source: APXvYqxLtTrDQd2ygpe7u9I3MpwqN034hu3moDA93qP3hIuKQzIwJYfCmTIvAo5R/ZLJ4/IHyRsOnQ==
X-Received: by 2002:a62:750c:: with SMTP id q12mr67644200pfc.59.1564858093677;
        Sat, 03 Aug 2019 11:48:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 09/34] target/arm: Add TTBR1_EL2
Date: Sat,  3 Aug 2019 11:47:35 -0700
Message-Id: <20190803184800.8221-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8jkwzDGFP61P

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
