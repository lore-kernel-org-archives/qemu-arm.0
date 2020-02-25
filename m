Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1994538lfg;
        Tue, 25 Feb 2020 10:13:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRGwr3ihh5g3YGE8e0PaeEg91TMiPkgdhRXgpHL5DP0+1nv9caHSRnumP5mQjn5TJkTWLS
X-Received: by 2002:a05:620a:2093:: with SMTP id e19mr12244qka.355.1582654421807;
        Tue, 25 Feb 2020 10:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582654421; cv=none;
        d=google.com; s=arc-20160816;
        b=gIsY/a3jcUXf2lies1rspjRxADzsFjVWvxU7eWmZStoOy3jgNU2YdVcIYWBWG9yvCt
         9DrGsZvOmDOM995cyQGWtapvl8EVGSVZ4BGaHLWpzKphC3RoFIcusZvJcP99rFWyiu1+
         M/PcTP87C6odrw9uGHyDWDCVdoMThYeb0SVZvHsjtgjJl8c+wYnw31fNJTMgfECeXur9
         bvcVQRkw3wsBYz1KbNCaKpbF90WCqoUb3g17ck1LhRBPacfxwMWE/T70pJ3URj9OEK+J
         Ose/6LSdtQSwzOdhIgukjm72zYM46F2rEOQnHi5u/3+hM56KtafUmn7/zIzeO1zAN7wp
         U3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VKycPInt6AkbSPRRcFBDTfCzpdXuH+EqY1piUn22Z/U=;
        b=KdiqlbniOd5IPpPyQxsWo485fyhkLEEcYOcw6mzD/B1D4EWXdZzl5S/hHd5KTBI9u+
         cKdDpSWHiu4VWtjaGB/B+AFEWz9hTrTu9g4MOmQK9tyhhse2naUxj0Ww2SXmHSQlQ6PJ
         AfHI6xJ1wnzyni4Mf7GYaIFQUEkFUEremjKODC7hiRLHQLEORXzZbGhgYGRyvOTQDCum
         fgtWRgFY2fGdJED9WHtRcvU+nReB+npNkwF98BZQFJVbqZxbAnVPBXLRhIP5vSxuJNI9
         y3dtOF/IT7XucHhjGBGF8b1/uFhPL6SN9XAs4D67grFSJPx/M67RpErdSzSKanF8jzeO
         WUKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcoX65pX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si21936qtr.392.2020.02.25.10.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 10:13:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcoX65pX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6eiC-0008Pr-7J
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 13:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edU-0002UY-Kg
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edT-0004aa-4w
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:48 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6edS-0004Yy-Tk
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:47 -0500
Received: by mail-pl1-x641.google.com with SMTP id j7so123336plt.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 10:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VKycPInt6AkbSPRRcFBDTfCzpdXuH+EqY1piUn22Z/U=;
 b=gcoX65pX5P31puoa4CaN+lbwv6Li0z1XpohXEVfO5jperOWidBsQk+KiKSjxy2LQ39
 MPx8G/ILZd+t2kJvwI1/bjngDFyxolXEpeh9f3/wqbolGSwcvd/s/ErN0NxLrE+ZYGYA
 ddv6MnLkpOeCfzrd1BLhXTgYy6de0U57Diyvn7FyOOCSgatZv7bMgM/2jQhm3TVxD/lM
 6UaLjjGndXWb6SmDRaajGXSVKk3FB5gth62Rdj+PSwqkG7zVx8fjCvnWYf6FeoP8UZx2
 1+NMn+DxEGZat62Oiq8VtTsrxNcYjfifJQAwYV/oJUlaTf0Y5XQ1r+XxBcldxqjSCnA2
 pgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VKycPInt6AkbSPRRcFBDTfCzpdXuH+EqY1piUn22Z/U=;
 b=M9aA7sK9bftceJZ5YEa2vd/yDek8YqZRdi10cfiZJujM+3bb8vsC41EarM3e43GaIR
 /AAT6bUDdhlp8Ivrna8RpKiwfvNokSgGxRzwZ0fnKH9GRSXGzpEobdkQr/g5d8Aaqvk8
 nOWvtS3Eu4CZFkU2kR94HQ9fHHy10EV1rnbO3a8OzgUBBkCocEvWSgzDvgvMUw7TDLqP
 8PuGe+NRqpGHDWiYBpqRjdvpq7oYg5nIFRVJXgf+aeA0hgbrAcdY5L3gI+5CuHlHPIhO
 cELD3pZ1RONZjPQra9gBNnU3PQUYtRK+HpBuMCK0+WhGsAhT8A/gi9mwHJlj6Mvucf8A
 ipLw==
X-Gm-Message-State: APjAAAWmxeistLUQaSheYekSMol9IpD9ZcuB261L0cej2AadjXzThYyO
 38KBI9MOHW7lDpqqh3+z7NIuIIcvvjo=
X-Received: by 2002:a17:90a:c390:: with SMTP id
 h16mr181939pjt.131.1582654125937; 
 Tue, 25 Feb 2020 10:08:45 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id d69sm19069704pfd.72.2020.02.25.10.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:08:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] target/arm: Honor the HCR_EL2.TPU bit
Date: Tue, 25 Feb 2020 10:08:30 -0800
Message-Id: <20200225180831.26078-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225180831.26078-1-richard.henderson@linaro.org>
References: <20200225180831.26078-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FRIxUdoT6kEY

This bit traps EL1 access to cache maintenance insns that operate
to the point of unification.  There are no longer any references to
plain aa64_cacheop_access, so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Fix el0 fallthru (pmm).
---
 target/arm/helper.c | 53 +++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2d488554b7..ca67d6a770 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4301,19 +4301,6 @@ static const ARMCPRegInfo uao_reginfo = {
     .readfn = aa64_uao_read, .writefn = aa64_uao_write
 };
 
-static CPAccessResult aa64_cacheop_access(CPUARMState *env,
-                                          const ARMCPRegInfo *ri,
-                                          bool isread)
-{
-    /* Cache invalidate/clean: NOP, but EL0 must UNDEF unless
-     * SCTLR_EL1.UCI is set.
-     */
-    if (arm_current_el(env) == 0 && !(arm_sctlr(env, 0) & SCTLR_UCI)) {
-        return CP_ACCESS_TRAP;
-    }
-    return CP_ACCESS_OK;
-}
-
 static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
                                               const ARMCPRegInfo *ri,
                                               bool isread)
@@ -4336,6 +4323,28 @@ static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
+                                              const ARMCPRegInfo *ri,
+                                              bool isread)
+{
+    /* Cache invalidate/clean to Point of Unification... */
+    switch (arm_current_el(env)) {
+    case 0:
+        /* ... EL0 must UNDEF unless SCTLR_EL1.UCI is set.  */
+        if (!(arm_sctlr(env, 0) & SCTLR_UCI)) {
+            return CP_ACCESS_TRAP;
+        }
+        /* fall through */
+    case 1:
+        /* ... EL1 must trap to EL2 if HCR_EL2.TPU is set.  */
+        if (arm_hcr_el2_eff(env) & HCR_TPU) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        break;
+    }
+    return CP_ACCESS_OK;
+}
+
 /* See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
  * Page D4-1736 (DDI0487A.b)
  */
@@ -4733,14 +4742,16 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     /* Cache ops: all NOPs since we don't emulate caches */
     { .name = "IC_IALLUIS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP },
+      .access = PL1_W, .type = ARM_CP_NOP,
+      .accessfn = aa64_cacheop_pou_access },
     { .name = "IC_IALLU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP },
+      .access = PL1_W, .type = ARM_CP_NOP,
+      .accessfn = aa64_cacheop_pou_access },
     { .name = "IC_IVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 5, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_access },
+      .accessfn = aa64_cacheop_pou_access },
     { .name = "DC_IVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = aa64_cacheop_poc_access,
@@ -4758,7 +4769,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 11, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_access },
+      .accessfn = aa64_cacheop_pou_access },
     { .name = "DC_CIVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
@@ -4932,13 +4943,13 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbiipas2_is_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
     { .name = "BPIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 6,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "ICIALLU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 0,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
     { .name = "ICIMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
     { .name = "BPIALL", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 6,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "BPIMVA", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 7,
@@ -4952,7 +4963,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DCCSW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 11, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
     { .name = "DCCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
-- 
2.20.1

