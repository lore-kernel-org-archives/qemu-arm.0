Received: by 10.25.208.211 with SMTP id h202csp2009089lfg;
        Tue, 1 Mar 2016 22:59:36 -0800 (PST)
X-Received: by 10.55.77.206 with SMTP id a197mr31195225qkb.43.1456901976041;
        Tue, 01 Mar 2016 22:59:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si26133943qhc.9.2016.03.01.22.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:59:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0kx-0002Mc-K2
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:59:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iY-0006Pn-2S
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iX-0003V2-3j
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:05 -0500
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232]:33915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iW-0003Ut-St; Wed, 02 Mar 2016 01:57:05 -0500
Received: by mail-pa0-x232.google.com with SMTP id fy10so127188609pac.1;
	Tue, 01 Mar 2016 22:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HmPB8FY0EimgsUNNkQx0domsV8f/qIiyKEGw0jkN7ic=;
	b=GH/IT08ErvbG0l6cbtoXgu28YZ94XD5QTuJOTCUqaLX/JTJn2uhSNZiC8riVCgPo1N
	bM5r1Si3/QyqdIoxSV8zuR2VWrJU9Z92sKCJlhK/976RHGzQ701HhV0x2jKRpqq9aMHk
	VtTZCMgOhLMPgI2vSrKmPyDlkkVq4OsftOnY+FJcDKU9FjqgSD3fqEuo14YzlyJH1unE
	plciXbZGwTVoYlA5Dm6mA1phW5+TWppVDr2fK7zbCFeWSMTEl+j6t5sS2tWPpyqECbsZ
	bYAU2pu95O25FQppzuK6myc9R6wxdvxaj3i5DkqOANzAknMkJKg4RCrDZgT+vWHQQXse
	xdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HmPB8FY0EimgsUNNkQx0domsV8f/qIiyKEGw0jkN7ic=;
	b=JGnN93c47xy6k2+0PEILiDCyk7JbNLpvCB+k5kIgbSJ8vrbJ61bGwlyXxL0/95ewE4
	Z/t9hSFgHVF31CsclYfEisBuYrB26ZbZo90CFf4G03wzUwofuRZOnbXQd/dNx1ftL511
	Cj4EckhzptndODSp2nT+DDi1xoiCPtshvsAqHHqGDt5r69yTkqqeZC/zaV1pskjroSI2
	s+CiLCSv3uS1ffloyOXYpvj1SJl21sujzNxuaPXnA2HAqi9UXKzkl6p3fZP8tn3yBxC8
	D9kQban7XO9S0nk7BalHO7tUt/30xrhIN7UWy2zmtLNWKNAvGZ4/V0c9rUasYw1CvRPS
	MTmw==
X-Gm-Message-State: AD7BkJLHLdXrg+GW5ag1863UAvDSUSxhh35/+XiP8Jvvi4wmZoTngSZjO7+ZYGykHSgfxQ==
X-Received: by 10.66.155.232 with SMTP id vz8mr36366838pab.53.1456901824119;
	Tue, 01 Mar 2016 22:57:04 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:03 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:12 -0800
Message-Id: <be4ffde4e1ffebfb9e9ca3625159e11af9b084b2.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::232
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 08/18] target-arm: implement SCTLR.EE
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
X-TUID: sYvuIEL+QYF5

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Implement SCTLR.EE bit which controls data endianess for exceptions
and page table translations. SCTLR.EE is mirrored to the CPSR.E bit
on exception entry.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 target-arm/helper.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 32e66c8..c79c7b9 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6234,6 +6234,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
     env->condexec_bits = 0;
     /* Switch to the new mode, and to the correct instruction set.  */
     env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
+    /* Set new mode endianness */
+    env->uncached_cpsr &= ~CPSR_E;
+    if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
+        env->uncached_cpsr |= ~CPSR_E;
+    }
     env->daif |= mask;
     /* this is a lie, as the was no c1_sys on V4T/V5, but who cares
      * and we should just guard the thumb mode on V4 */
@@ -6520,6 +6525,12 @@ static inline bool regime_translation_disabled(CPUARMState *env,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
+static inline bool regime_translation_big_endian(CPUARMState *env,
+                                                 ARMMMUIdx mmu_idx)
+{
+    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
+}
+
 /* Return the TCR controlling this translation regime */
 static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
@@ -6842,7 +6853,11 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     if (fi->s1ptw) {
         return 0;
     }
-    return address_space_ldl(as, addr, attrs, NULL);
+    if (regime_translation_big_endian(env, mmu_idx)) {
+        return address_space_ldl_be(as, addr, attrs, NULL);
+    } else {
+        return address_space_ldl_le(as, addr, attrs, NULL);
+    }
 }
 
 static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
@@ -6860,7 +6875,11 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     if (fi->s1ptw) {
         return 0;
     }
-    return address_space_ldq(as, addr, attrs, NULL);
+    if (regime_translation_big_endian(env, mmu_idx)) {
+        return address_space_ldq_be(as, addr, attrs, NULL);
+    } else {
+        return address_space_ldq_le(as, addr, attrs, NULL);
+    }
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-- 
1.9.1

