Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6440112lfp;
        Tue, 18 Feb 2020 11:14:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwIpH8MMhcj723IdVlH8oVGKIOG8zJXvKZswNiYY45aq+Tgj6XsyXs25LQQgRtBrtUCOw3G
X-Received: by 2002:a37:4a48:: with SMTP id x69mr19693051qka.57.1582053296158;
        Tue, 18 Feb 2020 11:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582053296; cv=none;
        d=google.com; s=arc-20160816;
        b=LPJLzDe/LZBr2BwKu1YIoQ+WzLMlHJ83eQnbDcgAUPtwkUdAvD+BBEHOEhQ5SayYsp
         Dh1dumHYP9dwdCL6kSVS6NnajG4VvtBYjWdMU1PvEWWO20ALJi5+vqnbmkIlEj3+4XGQ
         V4E7ymKWylzGwnrLzsY86LtSPDcxa4tlZinbNwoB4jmNCFsrDP3meMONr6UG881D5Q+W
         fDdyNO2d9cvUPF3NCWhWV8NADdVviyRBDEkM5+N9zXJs3/Y3E60smKyiUnH6HEuYNKpv
         r+5eEIP+JaRPl/Tw9630enumWnqk7fe/p8A3ldIEeuIXve9uFNfagERc2mKXgLRB56VC
         gDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d8VQKU6rv4Pu6l3hpA5VgoL0EnHokMCgM3rMhYXv+l4=;
        b=aslvonCbiaQk0CblIwJ96DQdkAsPPEBuVGZ7jrThyDKejLFr6bYFrUwbE7toelfe7K
         a6kMnFKHM4dZGSUfOTC6QBozii2xSAcgnSRvcCuQ1HlDBJ7TRYLAe9defNkswW+kXBqy
         8l3QOXJbpgCPeihj03dSCSVF6wDAM8hF/aBbBnkQJ3BMhMu5ydd6UKEAG830/u31XQeb
         Pj37Ap6lPrvz2aekfi/17rVwHqWkeqYwOJ/cJDlCx9C7YmZzUdzkS8pKHLAwqRrdUu4e
         LjjA5TTglqElITHtyvuJT2y1chlobFEegwZZbzg1FD/KRL9YnlK2o9RXBtZg5gF5TgbR
         AS4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iSdVw9rz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si2148911qvs.93.2020.02.18.11.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 11:14:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iSdVw9rz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j48Kd-0003gG-JC
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 14:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j48G5-00057t-HT
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:10:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j48G3-00026i-SG
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:10:13 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37019)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j48G3-00020O-Gp
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:10:11 -0500
Received: by mail-pg1-x543.google.com with SMTP id z12so11424350pgl.4
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 11:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d8VQKU6rv4Pu6l3hpA5VgoL0EnHokMCgM3rMhYXv+l4=;
 b=iSdVw9rzE92iebe/A9OrratQX/Vu8tbEoCAedhD6vLfuzXejm1whRjBMyWODOhtgs2
 xD/UJpV4xLSNmGYHHdQxr3WpNxoT10JUjgLHLcDGk8u+REBMn9f3cMF9Sh3dDLOsfGEY
 38/5i24t8saybaahzI27wnpv3CmwguwslFjSdeXV4b5MLQ8CzlvPciLvb4UcSE0mZFaY
 IsbZwU2wXMOgeCjCGK2guLsUSYCnYIQLLkOTDILSvcaWKYNmhUGKWUM2wAbOeVEerya8
 NGaWW8nDC6FRm0P0JubQiYifvj/0Nhzc+JZweDRftopftU3fXYUei3PCZwcpo15axo6n
 hG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d8VQKU6rv4Pu6l3hpA5VgoL0EnHokMCgM3rMhYXv+l4=;
 b=XBrsBqEBeydIGZKpYDeYiQJGeE/2GrsYTsHR38nqcsHtioiKo9jpwFzU9O9HB9ygtO
 KYoOHtCzqUGQGAVMRplT4J0U8EkLoOhtc3O9rVeuzOwNcveRw+7rCh0oHlSYUWTNwgPy
 /5BVDLCD6/Bzrh018QI55PvvjmLSaylAIY5ShJqHACH1JflJBAbNscG91wNQlYF7Dxjo
 Ws8hzSXUksqQb6EtpmJfHw3ke2Za3t2YZIhbLDEUGAThOHsyyuf/HV6g3JN7zOPaK4RI
 lAlZyZjpt5WRukJF3ElEOhNALnwsAR+3N+jWk9enEeUoxCyvXVBJ/eRex1c0/bXBnRGd
 dAJg==
X-Gm-Message-State: APjAAAW5RwYXOceCbKUTH8OupCpuk6En3O6Dug3lqjFjR1ZT7ybYICfD
 TZrOVuSk4E4Rj+up7FwzONpZ1t5L0/M=
X-Received: by 2002:a62:7681:: with SMTP id
 r123mr22675100pfc.169.1582053009053; 
 Tue, 18 Feb 2020 11:10:09 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id i68sm5139399pfe.173.2020.02.18.11.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:10:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] target/arm: Honor the HCR_EL2.TPU bit
Date: Tue, 18 Feb 2020 11:09:57 -0800
Message-Id: <20200218190958.745-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218190958.745-1-richard.henderson@linaro.org>
References: <20200218190958.745-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Kgiyehb707K

This bit traps EL1 access to cache maintenance insns that operate
to the point of unification.  There are no longer any references to
plain aa64_cacheop_access, so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 53 +++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ed34d4200f..21ee9cf7de 100644
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
+        break;
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

