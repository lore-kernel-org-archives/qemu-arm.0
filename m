Received: by 10.25.208.211 with SMTP id h202csp2477909lfg;
        Wed, 9 Mar 2016 04:49:33 -0800 (PST)
X-Received: by 10.140.150.66 with SMTP id 63mr44628111qhw.91.1457527773091;
        Wed, 09 Mar 2016 04:49:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o34si7786101qge.94.2016.03.09.04.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Mar 2016 04:49:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@yandex.ru;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:41120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1addYS-00075W-Eb
	for alex.bennee@linaro.org; Wed, 09 Mar 2016 07:49:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1addUx-0001MF-Ck
	for qemu-devel@nongnu.org; Wed, 09 Mar 2016 07:45:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1addUv-000742-Ro
	for qemu-devel@nongnu.org; Wed, 09 Mar 2016 07:45:55 -0500
Received: from forward6o.cmail.yandex.net ([37.9.109.52]:37394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1addUp-00072V-Ue; Wed, 09 Mar 2016 07:45:48 -0500
Received: from smtp3o.mail.yandex.net (smtp3o.mail.yandex.net
	[IPv6:2a02:6b8:0:1a2d::27])
	by forward6o.cmail.yandex.net (Yandex) with ESMTP id B0DA0211E1;
	Wed,  9 Mar 2016 15:45:43 +0300 (MSK)
Received: from smtp3o.mail.yandex.net (localhost [127.0.0.1])
	by smtp3o.mail.yandex.net (Yandex) with ESMTP id EA5091E025B;
	Wed,  9 Mar 2016 15:45:42 +0300 (MSK)
Received: by smtp3o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	s5LnZsYsWe-jgRWjVjm; Wed, 09 Mar 2016 15:45:42 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1457527542; bh=SoAVfvH7Wj1v+zqTV28Ya1T9DUHG5E+XDPYz7CokqDU=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=KP0VSogMbHnk4SaiZv17LOrMMc7/dMSgHzUoHSHcz6Dtixulq0Hn/zvVsILjEfN8J
	mgFI2cexX01tSpHimCyCIJB4HO3GupwDnXYjfKtc773Hp4u5zh6DjOm+ORYYCAXI38
	Y+njvXqk81BtSt86b4WGGmM+2zTe20WCsr5vyIwg=
Authentication-Results: smtp3o.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Wed,  9 Mar 2016 15:45:03 +0300
Message-Id: <1457527503-25958-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.9.109.52
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Subject: [Qemu-devel] [PATCH v2] target-arm: Fix translation level on early
	translation faults
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GE3AAnb8BaJO

Qemu reports translation fault on 1st level instead of 0th level in case of
AArch64 address translation if the translation table walk is disabled or
the address is in the gap between the two regions.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
In the second version of the patch the code was rearranged
to determine the level for the early faults in one place.
 target-arm/helper.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index eaded41..19d5d52 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7237,7 +7237,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     CPUState *cs = CPU(cpu);
     /* Read an LPAE long-descriptor translation table. */
     MMUFaultType fault_type = translation_fault;
-    uint32_t level = 1;
+    uint32_t level;
     uint32_t epd = 0;
     int32_t t0sz, t1sz;
     uint32_t tg;
@@ -7248,7 +7248,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     target_ulong page_size;
     uint32_t attrs;
     int32_t stride = 9;
-    int32_t va_size = 32;
+    int32_t va_size;
     int inputsize;
     int32_t tbi = 0;
     TCR *tcr = regime_tcr(env, mmu_idx);
@@ -7264,6 +7264,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
      * support for those page table walks.
      */
     if (arm_el_is_aa64(env, el)) {
+        level = 0;
         va_size = 64;
         if (el > 1) {
             if (mmu_idx != ARMMMUIdx_S2NS) {
@@ -7285,6 +7286,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
             ttbr1_valid = false;
         }
     } else {
+        level = 1;
+        va_size = 32;
         /* There is no TTBR1 for EL2 */
         if (el == 2) {
             ttbr1_valid = false;
@@ -7407,27 +7410,26 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         /* For stage 2 translations the starting level is specified by the
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
-        int startlevel = extract32(tcr->raw_tcr, 6, 2);
+        uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
+        uint32_t startlevel;
         bool ok;
 
         if (va_size == 32 || stride == 9) {
             /* AArch32 or 4KB pages */
-            level = 2 - startlevel;
+            startlevel = 2 - sl0;
         } else {
             /* 16KB or 64KB pages */
-            level = 3 - startlevel;
+            startlevel = 3 - sl0;
         }
 
         /* Check that the starting level is valid. */
-        ok = check_s2_mmu_setup(cpu, va_size == 64, level, inputsize, stride);
+        ok = check_s2_mmu_setup(cpu, va_size == 64, startlevel,
+                                inputsize, stride);
         if (!ok) {
-            /* AArch64 reports these as level 0 faults.
-             * AArch32 reports these as level 1 faults.
-             */
-            level = va_size == 64 ? 0 : 1;
             fault_type = translation_fault;
             goto do_fault;
         }
+        level = startlevel;
     }
 
     /* Clear the vaddr bits which aren't part of the within-region address,
-- 
1.9.3

