Received: by 10.25.27.66 with SMTP id b63csp363394lfb;
        Fri, 3 Jun 2016 10:16:48 -0700 (PDT)
X-Received: by 10.55.203.202 with SMTP id u71mr4373802qkl.12.1464974208883;
        Fri, 03 Jun 2016 10:16:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f127si4056840qhf.75.2016.06.03.10.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 10:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:56830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8siG-0000M1-9b
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 13:16:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1b8siC-0000Li-S5
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 13:16:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1b8si6-0000Ui-Q7
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 13:16:43 -0400
Received: from forward12m.cmail.yandex.net ([5.255.216.143]:50167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1b8si5-0000Ns-4a; Fri, 03 Jun 2016 13:16:38 -0400
Received: from smtp3m.mail.yandex.net (smtp3m.mail.yandex.net [77.88.61.130])
	by forward12m.cmail.yandex.net (Yandex) with ESMTP id E71EA20B98;
	Fri,  3 Jun 2016 20:16:16 +0300 (MSK)
Received: from smtp3m.mail.yandex.net (localhost [127.0.0.1])
	by smtp3m.mail.yandex.net (Yandex) with ESMTP id 4671E27A0787;
	Fri,  3 Jun 2016 20:16:16 +0300 (MSK)
Received: by smtp3m.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	oxEZwZnZqG-GFQu8pvE; Fri, 03 Jun 2016 20:16:15 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1464974175; bh=VLQh65JwQyiZn5XJX0hBHDDQM4ux+6lN22ZYUPHVmgc=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=aZtjEyejOoR0M5Yi/pZ4OPJGQ4jc33/zZiuhlcIE+8pB91gIFasN6V4B82Xeozr75
	vU4dJVMnglkmTCinotYyNdLe3EeVPXzD3+V/7cRElkFJ9lR1wrN2W8vlT+5s1WSqVC
	lPUzuaZRPP6uLRe4AGh8hRzeBd38YC03lcfLGe0s=
Authentication-Results: smtp3m.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Fri,  3 Jun 2016 20:15:51 +0300
Message-Id: <1464974151-1231644-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.143
Subject: [Qemu-arm] [PATCH] target-arm: Fix TTBR selecting logic on AArch32
 Stage 2 translation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R1s/tbjCKhrQ

Address size is 40-bit for the AArch32 stage 2 translation,
and t0sz can be negative (from -8 to 7),
so we need to adjust it to use the existing TTBR selecting logic.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 target-arm/helper.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index e3ea26f..a7287ce 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7275,7 +7275,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     target_ulong page_size;
     uint32_t attrs;
     int32_t stride = 9;
-    int32_t va_size;
+    int32_t addrsize;
     int inputsize;
     int32_t tbi = 0;
     TCR *tcr = regime_tcr(env, mmu_idx);
@@ -7283,6 +7283,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint32_t el = regime_el(env, mmu_idx);
     bool ttbr1_valid = true;
     uint64_t descaddrmask;
+    bool aarch64 = arm_el_is_aa64(env, el);
 
     /* TODO:
      * This code does not handle the different format TCR for VTCR_EL2.
@@ -7290,9 +7291,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
      * Attribute and permission bit handling should also be checked when adding
      * support for those page table walks.
      */
-    if (arm_el_is_aa64(env, el)) {
+    if (aarch64) {
         level = 0;
-        va_size = 64;
+        addrsize = 64;
         if (el > 1) {
             if (mmu_idx != ARMMMUIdx_S2NS) {
                 tbi = extract64(tcr->raw_tcr, 20, 1);
@@ -7314,7 +7315,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         }
     } else {
         level = 1;
-        va_size = 32;
+        addrsize = 32;
         /* There is no TTBR1 for EL2 */
         if (el == 2) {
             ttbr1_valid = false;
@@ -7326,7 +7327,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
      * This is a Non-secure PL0/1 stage 1 translation, so controlled by
      * TTBCR/TTBR0/TTBR1 in accordance with ARM ARM DDI0406C table B-32:
      */
-    if (va_size == 64) {
+    if (aarch64) {
         /* AArch64 translation.  */
         t0sz = extract32(tcr->raw_tcr, 0, 6);
         t0sz = MIN(t0sz, 39);
@@ -7338,7 +7339,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         /* AArch32 stage 2 translation.  */
         bool sext = extract32(tcr->raw_tcr, 4, 1);
         bool sign = extract32(tcr->raw_tcr, 3, 1);
-        t0sz = sextract32(tcr->raw_tcr, 0, 4);
+        /* Address size is 40-bit for a stage 2 translation,
+         * and t0sz can be negative (from -8 to 7),
+         * so we need to adjust it to use the TTBR selecting logic below.
+         */
+        addrsize = 40;
+        t0sz = sextract32(tcr->raw_tcr, 0, 4) + 8;
 
         /* If the sign-extend bit is not the same as t0sz[3], the result
          * is unpredictable. Flag this as a guest error.  */
@@ -7348,15 +7354,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         }
     }
     t1sz = extract32(tcr->raw_tcr, 16, 6);
-    if (va_size == 64) {
+    if (aarch64) {
         t1sz = MIN(t1sz, 39);
         t1sz = MAX(t1sz, 16);
     }
-    if (t0sz && !extract64(address, va_size - t0sz, t0sz - tbi)) {
+    if (t0sz && !extract64(address, addrsize - t0sz, t0sz - tbi)) {
         /* there is a ttbr0 region and we are in it (high bits all zero) */
         ttbr_select = 0;
     } else if (ttbr1_valid && t1sz &&
-               !extract64(~address, va_size - t1sz, t1sz - tbi)) {
+               !extract64(~address, addrsize - t1sz, t1sz - tbi)) {
         /* there is a ttbr1 region and we are in it (high bits all one) */
         ttbr_select = 1;
     } else if (!t0sz) {
@@ -7383,7 +7389,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         if (el < 2) {
             epd = extract32(tcr->raw_tcr, 7, 1);
         }
-        inputsize = va_size - t0sz;
+        inputsize = addrsize - t0sz;
 
         tg = extract32(tcr->raw_tcr, 14, 2);
         if (tg == 1) { /* 64KB pages */
@@ -7398,7 +7404,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
 
         ttbr = regime_ttbr(env, mmu_idx, 1);
         epd = extract32(tcr->raw_tcr, 23, 1);
-        inputsize = va_size - t1sz;
+        inputsize = addrsize - t1sz;
 
         tg = extract32(tcr->raw_tcr, 30, 2);
         if (tg == 3)  { /* 64KB pages */
@@ -7410,7 +7416,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     }
 
     /* Here we should have set up all the parameters for the translation:
-     * va_size, inputsize, ttbr, epd, stride, tbi
+     * inputsize, ttbr, epd, stride, tbi
      */
 
     if (epd) {
@@ -7441,7 +7447,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         uint32_t startlevel;
         bool ok;
 
-        if (va_size == 32 || stride == 9) {
+        if (!aarch64 || stride == 9) {
             /* AArch32 or 4KB pages */
             startlevel = 2 - sl0;
         } else {
@@ -7450,7 +7456,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         }
 
         /* Check that the starting level is valid. */
-        ok = check_s2_mmu_setup(cpu, va_size == 64, startlevel,
+        ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride);
         if (!ok) {
             fault_type = translation_fault;
@@ -7471,7 +7477,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
      * up to bit 39 for AArch32, because we don't need other bits in that case
      * to construct next descriptor address (anyway they should be all zeroes).
      */
-    descaddrmask = ((1ull << (va_size == 64 ? 48 : 40)) - 1) &
+    descaddrmask = ((1ull << (aarch64 ? 48 : 40)) - 1) &
                    ~indexmask_grainsize;
 
     /* Secure accesses start with the page table in secure memory and
@@ -7554,7 +7560,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     } else {
         ns = extract32(attrs, 3, 1);
         pxn = extract32(attrs, 11, 1);
-        *prot = get_S1prot(env, mmu_idx, va_size == 64, ap, ns, xn, pxn);
+        *prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
     fault_type = permission_fault;
-- 
1.9.3

