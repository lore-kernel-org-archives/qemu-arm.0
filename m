Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1399766njc;
        Wed, 21 May 2025 12:03:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTVrihpXzEMiZrPFkIgKcUGT1UEqU6bO1rfbg2YyZEHtkeg0h/KiCSGy/xo4AbbOjfuY3ldfhiCfTcKg==@linaro.org
X-Google-Smtp-Source: AGHT+IEbLMj2EfS5/K6dtkK4aUMKh0FAAPK2gnAFWSl6q0XwGcvQUF5mo+hk/PWOtJud/PZIEHqW
X-Received: by 2002:a05:620a:3945:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7cd47ef13b3mr3575102785a.4.1747854186697;
        Wed, 21 May 2025 12:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747854186; cv=none;
        d=google.com; s=arc-20240605;
        b=BSpAva4O6wWI2PMnGZ+QcdkpI1ASeDMUll+UAMKvgd6u+cLS/xe6xQrohruNY2UEtB
         Bpp1xulCyVE5a83ArYnF0o+S2crwtGYzR5zZ0t7h2nuo0afbiNGoSuvhrybE8bzBiYcQ
         ARcSFvgBUefhtsvTTY38082x+PqXJX9BpSqJ8aelP4uyOb/AD1USkildiR+hSMHhIplx
         7MA1EKtwwwRSnJIN+JHmG+M5UtR/E2rExERhvzDqp8OR1UmmN6xQyMSY+hjNGDqKEqup
         ehJWrHF1dgBdj2y14vcUWYoqt4F5DFQF7m++vDdM5bm98Yxr4TQqhg1bY9x2Tx3v3hEa
         fvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gbo7c8K7ZQW1KsUAQVl9YazIunWDHbR+34oXLOE67OM=;
        fh=gsGWhs0UQcmFw/j3kGwCkMwDeMP5lkhKmStvEnp7DCA=;
        b=eNOHVp0XotaM5/HS5RFnW1c+4bvlge9dGoEec26nyf7wGSEL1vkGoVBivo3rTvvrIQ
         zSMlYx59cLcJP7b4H9cgg7lYBkVQ+HPsk8wH3HjeMQyRlmu5aQalXworioIsjzxCyvo1
         Cmi9G/2HDjNI1Py1N8i3y5v3wAG7w6CHzqrE3CrJC0NmwsbY0LeR74g8Dd4dgFaRO5RK
         M0E1zAvtNFyyRQ3auLToErB+ogidQdNthPWKR6tFi6ta2K/ianCK7zoHb35x7AE3S6bt
         aREfBguY8XukfeBGhjwmHxr5fFG3c/TSIE2bVvd3rdfV9O8CZ2zqLjVTfkHo/LzDvnvL
         JF7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b="NeLXob/m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468f469esi1313896985a.653.2025.05.21.12.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 12:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b="NeLXob/m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHoiQ-0004jR-Ry; Wed, 21 May 2025 15:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oliver.upton@linux.dev>)
 id 1uHoiO-0004ik-Am; Wed, 21 May 2025 15:02:56 -0400
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oliver.upton@linux.dev>)
 id 1uHoiM-0004mB-3S; Wed, 21 May 2025 15:02:56 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1747854169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gbo7c8K7ZQW1KsUAQVl9YazIunWDHbR+34oXLOE67OM=;
 b=NeLXob/mo++FupiN9iUyB9N+4YcJh3pzi+G04gcKyCIWnK2zFXw7rOsCiNSY1BU0wZpugH
 boDpUT/PTmhtf3+aPLiKKshFY05rx8Px69549HWh7a5NzTr4/6rnB2OyLNT7EtjJFuwYr0
 +sxL0l6GwUq3EbFVmT3CUa6FvQ9Je3E=
From: Oliver Upton <oliver.upton@linux.dev>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH] target/arm: Ignore SCTLR_EL2.EnSCXT when !ELIsInHost()
Date: Wed, 21 May 2025 12:02:28 -0700
Message-Id: <20250521190228.3921172-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::b0;
 envelope-from=oliver.upton@linux.dev; helo=out-176.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3crw8CjHxCCA

Using an EL2 that enables SCXTNUM_ELx for guests while disabling the
feature for the host generates erroneous traps to EL2 when running under
TCG.

Fix the issue by only evaluating SCTLR_EL2.EnSCXT when ELIsInHost().

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 target/arm/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7631210287..83d4236417 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7389,16 +7389,16 @@ static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     uint64_t hcr = arm_hcr_el2_eff(env);
     int el = arm_current_el(env);
+    uint64_t sctlr;
 
-    if (el == 0 && !((hcr & HCR_E2H) && (hcr & HCR_TGE))) {
-        if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
-            if (hcr & HCR_TGE) {
-                return CP_ACCESS_TRAP_EL2;
-            }
-            return CP_ACCESS_TRAP_EL1;
+    sctlr = el_is_in_host(env, el) ? env->cp15.sctlr_el[2] :
+            env->cp15.sctlr_el[1];
+
+    if (el == 0 && (sctlr & SCTLR_TSCXT)) {
+        if (hcr & HCR_TGE) {
+            return CP_ACCESS_TRAP_EL2;
         }
-    } else if (el < 2 && (env->cp15.sctlr_el[2] & SCTLR_TSCXT)) {
-        return CP_ACCESS_TRAP_EL2;
+        return CP_ACCESS_TRAP_EL1;
     }
     if (el < 2 && arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
         return CP_ACCESS_TRAP_EL2;
-- 
2.39.5

