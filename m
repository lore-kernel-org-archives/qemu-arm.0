Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2127161wro;
        Fri, 2 Nov 2018 06:42:21 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fGxzI6zU3qgr6Q2dbnhqnrsmy/Mu2MxtcIEYCBSVneD8mq/azWg7jMCNyvz0cmovFmIx91
X-Received: by 2002:ac8:89b:: with SMTP id v27-v6mr10631511qth.297.1541166141337;
        Fri, 02 Nov 2018 06:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541166141; cv=none;
        d=google.com; s=arc-20160816;
        b=qcUZ2HxuA3igUVu6X0HDcBo7G6TnND+psSY4+Wz7nl2pIWJOpSRbOsTEhK0mAxhiBq
         eWs4egPyfyZytP9NHXS8wDywgVVzQzdR0u9nQfWc409SE8iQFZ3H0ox9T/vu3P7HpLoE
         bLGxmN796iukzdQt9gH40uOVH8dyQJR+NFRDkkLWlfbQUnVn3TeughYQs5uX72uUUMNF
         AzvfHqjJ5B9mlue4lj85JyDcky9PEdoTJdHmXwJbKxHqb+5ikxLw5E5tk0BOCNyXMVSE
         gDKpduIAuLDOMp1wO3wQA5obPUoy6ZerfCciZ35nafEs4wRAudjnUKMbe1X4cX4JHzvg
         5fMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1B2JyR0YGxP1NV0gAS3M6j7e9uwlDrw4cyLBftZ2h8s=;
        b=N5aJBUMxgUf3O5dTYtAurdb3ChCu9BmaYorI1R6Kaic4DK1x+eJF5fKTWBBdzz3FeI
         G8ltne01sjsTV+WxOWW/eiWNimJ+lDCeBCoRVRVgSBnXtIagKxRf253c1tJTPV87XlqX
         24APj6ZL8dCgCTlbBUiYehOc4v1FrVQRrLW/wgNKBuslsoGRCs17rnVKrEEGAJeMUd8U
         ep+Mw93ExvxQHa7WJqPKr58uzsQciD3qfEqjfcBLaFQ7M4kNgenefO/wyk58RdZNpC/l
         id2tlW3pYk2kKPR+zQc++hC4Oh1yi2QgEZ9JDn/xw2NCROOMdsU96xvH788+/J6lBfeC
         jWeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BsXSzu/T";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si13819427qvp.175.2018.11.02.06.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BsXSzu/T";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZiO-0007Ef-Rc
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:42:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhp-0007C5-AD
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhn-0007PG-9H
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:45 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54611)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIZhl-0007Bp-Nh
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:43 -0400
Received: by mail-wm1-x343.google.com with SMTP id r63-v6so2031566wma.4
	for <qemu-devel@nongnu.org>; Fri, 02 Nov 2018 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1B2JyR0YGxP1NV0gAS3M6j7e9uwlDrw4cyLBftZ2h8s=;
	b=BsXSzu/TCqyUrFOudF+KfPO8wDcm2OS+VLaS4ozVfEIBhWsQHrIsGF209upekhHqgn
	iuf3Ej+3M3pMT7T5ntSgzVRtl1vC2GSzF4hqYqzaB+pTeI++XNrqUh6o8uBZ69sid7jW
	WzuroYQ71SLo9JJ5kqaOyk+R9mwpakm1KZkp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1B2JyR0YGxP1NV0gAS3M6j7e9uwlDrw4cyLBftZ2h8s=;
	b=VynqwZZ8qI2pV4/5ijP/061tRseUZsszPIZmgO182xgO/ev0gfHShjevU/HJjoz4hG
	j2mMw0VmNZvURQflj221BiXuLVTYm3Wl4lez5Fo8Ie8cTll8q+0SwSlwHXEgGZ/MhP+E
	lTTT1gQf8L+WHAOqzv4yf5IEUzhkQn9tPTILrDL7+SA0qR9zHLibR7Np9NpRF061W4iR
	239SQKPSrjca9dwv3rJae079tZaz2XxQAHTEdQBpdT0vB6QtX2pfJwc5V7fDXFGhRgag
	oaImb1Zlf53pYuRq+jOlJAdzPVlUWoxStKBnb0nUhKnlBYm5M/716j8ckdGdKpZ96Xmm
	dFGQ==
X-Gm-Message-State: AGRZ1gLdFKLGyDmBHOVHztw+ccqz80TOUVuBHRxQrt+beZDaglTgRo3Z
	Wht6rgwHXPVN/ArAXbcOApzufBxM52w=
X-Received: by 2002:a1c:c016:: with SMTP id
	q22-v6mr739940wmf.151.1541166080841; 
	Fri, 02 Nov 2018 06:41:20 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm1629686wrp.56.2018.11.02.06.41.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 06:41:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:41:11 +0000
Message-Id: <20181102134112.26370-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102134112.26370-1-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH for-4.0 3/4] target/arm: Implement the
 ARMv8.1-HPD extension
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hLUGntI/EV5x

Since the TCR_*.HPD bits were RES0 in ARMv8.0, we can simply
interpret the bits as if ARMv8.1-HPD is present without checking.
We will need a slightly different check for hpd for aarch32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c  |  1 +
 target/arm/helper.c | 29 +++++++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index aac6283018..1d57be0c91 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -325,6 +325,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64mmfr1;
+        t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
         t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
         cpu->isar.id_aa64mmfr1 = t;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 758ddac5e9..312d3e6f02 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9682,6 +9682,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     bool ttbr1_valid = true;
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
+    bool hpd = false;
 
     /* TODO:
      * This code does not handle the different format TCR for VTCR_EL2.
@@ -9796,6 +9797,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         if (tg == 2) { /* 16KB pages */
             stride = 11;
         }
+        if (aarch64) {
+            if (el > 1) {
+                hpd = extract64(tcr->raw_tcr, 24, 1);
+            } else {
+                hpd = extract64(tcr->raw_tcr, 41, 1);
+            }
+        }
     } else {
         /* We should only be here if TTBR1 is valid */
         assert(ttbr1_valid);
@@ -9811,6 +9819,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         if (tg == 1) { /* 16KB pages */
             stride = 11;
         }
+        if (aarch64) {
+            hpd = extract64(tcr->raw_tcr, 42, 1);
+        }
     }
 
     /* Here we should have set up all the parameters for the translation:
@@ -9904,7 +9915,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         descaddr = descriptor & descaddrmask;
 
         if ((descriptor & 2) && (level < 3)) {
-            /* Table entry. The top five bits are attributes which  may
+            /* Table entry. The top five bits are attributes which may
              * propagate down through lower levels of the table (and
              * which are all arranged so that 0 means "no effect", so
              * we can gather them up by ORing in the bits at each level).
@@ -9928,14 +9939,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
             /* Stage 2 table descriptors do not include any attribute fields */
             break;
         }
-        /* Merge in attributes from table descriptors */
-        attrs |= extract32(tableattrs, 0, 2) << 11; /* XN, PXN */
-        attrs |= extract32(tableattrs, 3, 1) << 5; /* APTable[1] => AP[2] */
-        /* The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-         * means "force PL1 access only", which means forcing AP[1] to 0.
+        /*
+         * Merge in attributes from table descriptors, if the
+         * Hierarchical Permission Disable bit is not set.
          */
-        if (extract32(tableattrs, 2, 1)) {
-            attrs &= ~(1 << 4);
+        if (!hpd) {
+            attrs |= extract32(tableattrs, 0, 2) << 11; /* XN, PXN */
+            /* !APTable[0] => AP[1].  */
+            attrs &= ~(extract32(tableattrs, 2, 1) << 4);
+            /* APTable[1] => AP[2] */
+            attrs |= extract32(tableattrs, 3, 1) << 5;
         }
         attrs |= nstable << 3; /* NS */
         break;
-- 
2.17.2

