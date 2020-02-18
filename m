Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6438239lfp;
        Tue, 18 Feb 2020 11:12:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXgnM1hcwrXXbesd4q/tAB0EtIaxFhqwXDolE7Jfadv+B5YEV4ypRSQhIcjMrLgOIyAFd/
X-Received: by 2002:a05:6214:524:: with SMTP id x4mr18334069qvw.4.1582053162791;
        Tue, 18 Feb 2020 11:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582053162; cv=none;
        d=google.com; s=arc-20160816;
        b=eRlXxgLtbIs3oRxYoerOfn6Sk18ZPqb0arOdZxw66kI7sD+s24cX9ZquCjmnR0CR6d
         94ETBuafPHcXZ1lo1aRQf0ddrEej6N0hHBXSYFJ/8UhU5svQ56RdQ5vXKupQwru/H0Hu
         dAd8DcvoW8oxqDZr0S+mrVs+kivzodCzzsOjRPbqE/08hzoI320n3S4NUswa4RM9/hn2
         nFqVbMD4wkg4dn80X2MGPHdS2d/3WVxxndlNHoxSdXQ6bmVyLMNAtdE9TCNnsEB8JeqO
         D700NUXT7/ldEcaMa9G5zi4O87txQ0b692dAnaSpk+6RkFK5XwhPnKL/731wXipO61MC
         BVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5k7tlvEB9/rsMbuI3aToULa8WUIjX1E0iDo+FSiobiY=;
        b=X/c6W0jvdagIGDP2Clfw+9Ia7ie/KTCzyFcynlMV+xQoZxgP/Jmhi9XXORcvBDSFKn
         8A4j79R4U7Z/MMazAJa52vfSmAPtaydK+tHAr82uYn9BgYQRlX6PzvPg8CZP2Zf++ESe
         LaKUDW8f9afD5EI+WywBJiknuwqX1s5Ln7UySBN2Oj9VIa3R9LrP0iBuJCCRqeclBvZ5
         RRX4iGAiSRjLkZVjoaztOQd3EjojKEE22Lq51p3AMsB06SwDq7qtN3ONwUOeq0Rxrrgw
         ziFug2Ohh+r2EHqYGoeXqzfNYBtGAkVmve6fgtTx/Uc5OvuarUzjoezouJgaRuUxmj3P
         GmWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXQTHFae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x50si2187537qtj.224.2020.02.18.11.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 11:12:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXQTHFae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j48IU-0000Py-6D
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 14:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j48G3-00053J-Dr
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j48G1-0001xy-1u
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:10 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j48G0-0001w4-Qf
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:08 -0500
Received: by mail-pf1-x444.google.com with SMTP id s1so11113616pfh.10
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 11:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5k7tlvEB9/rsMbuI3aToULa8WUIjX1E0iDo+FSiobiY=;
 b=GXQTHFae6PA4ZmF7WMXLg+OhuuEv40//FDA0oPWididXI2Twdh/xJ3wlzSIMF8yvI0
 X/A6rXSCnI7RFv8KXc9MIF+qnqU5CSTJw8IsHqvl+ahBd3yP77C3Kaq8Fag26oAAyZ8P
 9EqTaLH8ExANR8bEartWhJeVxWdwFqr9gv0cwncFCQ9elT+N/smaXJ9YiaEKWVFCyoob
 Uij33shXnhWd40f/vn5TBZKTzAXvbvxoqM7cU4eslexAv+6m5VncCNsEAu+qoocWq2US
 UT5bfoSJbBp+SAGmSRf0n8Cm+iYL8JNWox47kqCls+CW0rbcwOgn5XjWbch6hln15Zs7
 GLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5k7tlvEB9/rsMbuI3aToULa8WUIjX1E0iDo+FSiobiY=;
 b=WZjH4rkXY6sPYZ/6SfYOEKOvJ02fhY6GdxXDpkfqSfzRwHWS1gURwFhM2vsk/xO6M7
 WT8tNKjMFfzZJHJzeZvTa1zK/Raao6+Mgx+7SJfAsugdk+/EOE/QKw1yriL9hh+lZtIK
 xCPdG0lAZQxAK3vxYCJNoO1Wc1sbZy+Mpur6bAoH8gYS2MYImxfbvniT6DIBVVRYy3ng
 1ENxN0L7rOGuOGMh50pH93Mo5rGAjWEfPZprE8ZJugqcIsejuptvmCBpCBjLi0DoQ7N+
 eI6A+RAIQbLQGEg1eHdA0X8V+onjq8hF0JCkyu8VGT1n7PzPwKoXkbapHAYVp0CzTiu0
 bZ9g==
X-Gm-Message-State: APjAAAWVk8cHRa9C82H6Vj2sxzJdA2yC7E216edbF8erj7hnnmWidexZ
 az1fbNbvOzzj/Tm/IW1ALMzP2w==
X-Received: by 2002:a63:5345:: with SMTP id t5mr23936562pgl.254.1582053007849; 
 Tue, 18 Feb 2020 11:10:07 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id i68sm5139399pfe.173.2020.02.18.11.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:10:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] target/arm: Honor the HCR_EL2.TPCP bit
Date: Tue, 18 Feb 2020 11:09:56 -0800
Message-Id: <20200218190958.745-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218190958.745-1-richard.henderson@linaro.org>
References: <20200218190958.745-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-TUID: ej2lNWIyRiuI

This bit traps EL1 access to cache maintenance insns that operate
to the point of coherency or persistence.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 52b6e68659..ed34d4200f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4314,6 +4314,28 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
+                                              const ARMCPRegInfo *ri,
+                                              bool isread)
+{
+    /* Cache invalidate/clean to Point of Coherency or Persistence...  */
+    switch (arm_current_el(env)) {
+    case 0:
+        /* ... EL0 must UNDEF unless SCTLR_EL1.UCI is set.  */
+        if (!(arm_sctlr(env, 0) & SCTLR_UCI)) {
+            return CP_ACCESS_TRAP;
+        }
+        break;
+    case 1:
+        /* ... EL1 must trap to EL2 if HCR_EL2.TPCP is set.  */
+        if (arm_hcr_el2_eff(env) & HCR_TPCP) {
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
@@ -4721,14 +4743,15 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .accessfn = aa64_cacheop_access },
     { .name = "DC_IVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NOP },
+      .access = PL1_W, .accessfn = aa64_cacheop_poc_access,
+      .type = ARM_CP_NOP },
     { .name = "DC_ISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 2,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_access },
+      .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
@@ -4739,7 +4762,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CIVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_access },
+      .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
@@ -4921,17 +4944,17 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "BPIMVA", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 7,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "DCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCCSW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 11, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "DCCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     /* MMU Domain access control / MPU write buffer control */
@@ -6715,7 +6738,7 @@ static const ARMCPRegInfo dcpop_reg[] = {
     { .name = "DC_CVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
-      .accessfn = aa64_cacheop_access, .writefn = dccvap_writefn },
+      .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
     REGINFO_SENTINEL
 };
 
@@ -6723,7 +6746,7 @@ static const ARMCPRegInfo dcpodp_reg[] = {
     { .name = "DC_CVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
-      .accessfn = aa64_cacheop_access, .writefn = dccvap_writefn },
+      .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
     REGINFO_SENTINEL
 };
 #endif /*CONFIG_USER_ONLY*/
-- 
2.20.1

