Received: by 10.25.159.19 with SMTP id i19csp1754066lfe;
        Sun, 17 Jan 2016 23:13:56 -0800 (PST)
X-Received: by 10.140.101.130 with SMTP id u2mr30411345qge.71.1453101236118;
        Sun, 17 Jan 2016 23:13:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l10si29620111qgf.68.2016.01.17.23.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:13:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL40h-0004JH-H8
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:13:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zm-0002zG-Lv
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zl-00072T-D1
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:58 -0500
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:34558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zk-00072A-Sg; Mon, 18 Jan 2016 02:12:57 -0500
Received: by mail-pa0-x22d.google.com with SMTP id uo6so415134215pac.1;
	Sun, 17 Jan 2016 23:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vkwC6gQFYIj+NdNjzYT+CCNaGUDEVBLf29xvdGmsOvI=;
	b=S1LR/IWckBV+51egWL0bHRnzshQptFLeVVDAc7kV3B0nwfWhNPub17I95Bol/qU7OT
	zIwGObpWKFKCj1iwvvaxdOj4cEqozZIu+XodHnqF+Iay0Orvh6q2PKEOzIkyZN8zwpV3
	bMdk/bns4/n0Pa/eMMjSWY/UGViUXeZprIrKD95IOem/cmXBrf8IZDe3AMaZ+XDvXoit
	259o7YJqXNc6FaApddEPNLn3WFPvoQqRIWTaJipj77Vfhf5ZrxpJUBBJEs5114jHLYrS
	dTMSV7ZDv5K6kd/npuzqhxI6spkpbwEBLz1NT1bmtB8KInZfdW6o0p4VYZw+iZOEAP2l
	GRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vkwC6gQFYIj+NdNjzYT+CCNaGUDEVBLf29xvdGmsOvI=;
	b=M8+yrPd2VJHBlD+phK7mdq9VWDtqZ4yplPQDCqU1pa2E7ElxL2/sArO2nygToRbMpv
	QIESCfjYlZoSALFqGyLT97kXvA0MJd3H5hMzItx1PP6bHU8+QFGntwo1dFoGTDM97/jA
	Q6Oc6Q4TL7XROJm4FQeLI5ISkVJOiiXox3DbCLSS3TNfd2y64tXbBjhD7rPx6MSWM+zb
	nOx8yi+2m/+G1xV7Zt2XzBd0T4eUF5cwT3RtzanhAGyNupoGgTelRHxgDGQJvtSF0O/P
	79Ql8AbvrIABdR084xx1pQAFIWxCwX4aigJ9ux3EIdlNXuZtgAQt/MyhFQ24awjftvXm
	CVwQ==
X-Gm-Message-State: ALoCoQkv2m7zVNZhW0XqFvI1kpndosMa5c7We6TnOeZpKZsLufja3JoHD27K9gLHDH7kNRnzZ1DCeQ/D6G1lWTdrIwY5n58ZlA==
X-Received: by 10.66.232.202 with SMTP id tq10mr33136610pac.156.1453101176359; 
	Sun, 17 Jan 2016 23:12:56 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.12.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:12:55 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:31 -0800
Message-Id: <fb6f0c034f8a1d36961247f56337aca1f22b3653.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22d
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 04/17] target-arm: implement SCTLR.EE
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
X-TUID: o9wVGlWO69+s

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Implement SCTLR.EE bit which controls data endianess for exceptions
and page table translations. SCTLR.EE is mirrored to the CPSR.E bit
on exception entry.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 target-arm/helper.c | 42 ++++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 59d5a41..afac1b2 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5889,7 +5889,10 @@ void arm_cpu_do_interrupt(CPUState *cs)
     /* Clear IT bits.  */
     env->condexec_bits = 0;
     /* Switch to the new mode, and to the correct instruction set.  */
-    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
+    env->uncached_cpsr = (env->uncached_cpsr & ~(CPSR_M)) | new_mode;
+    /* Set new mode endianess */
+    env->uncached_cpsr = (env->uncached_cpsr & ~(CPSR_E)) |
+        (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE ? CPSR_E : 0);
     env->daif |= mask;
     /* this is a lie, as the was no c1_sys on V4T/V5, but who cares
      * and we should just guard the thumb mode on V4 */
@@ -5958,6 +5961,12 @@ static inline bool regime_translation_disabled(CPUARMState *env,
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
@@ -6263,7 +6272,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
  */
 static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, uint32_t *fsr,
-                            ARMMMUFaultInfo *fi)
+                            ARMMMUFaultInfo *fi, bool be)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -6274,12 +6283,16 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     if (fi->s1ptw) {
         return 0;
     }
-    return address_space_ldl(cs->as, addr, attrs, NULL);
+    if (be) {
+        return address_space_ldl_be(cs->as, addr, attrs, NULL);
+    } else {
+        return address_space_ldl_le(cs->as, addr, attrs, NULL);
+    }
 }
 
 static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, uint32_t *fsr,
-                            ARMMMUFaultInfo *fi)
+                            ARMMMUFaultInfo *fi, bool be)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -6290,7 +6303,11 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     if (fi->s1ptw) {
         return 0;
     }
-    return address_space_ldq(cs->as, addr, attrs, NULL);
+    if (be) {
+        return address_space_ldq_be(cs->as, addr, attrs, NULL);
+    } else {
+        return address_space_ldq_le(cs->as, addr, attrs, NULL);
+    }
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
@@ -6318,7 +6335,8 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         goto do_fault;
     }
     desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fsr, fi);
+                       mmu_idx, fsr, fi,
+                       regime_translation_big_endian(env, mmu_idx));
     type = (desc & 3);
     domain = (desc >> 5) & 0x0f;
     if (regime_el(env, mmu_idx) == 1) {
@@ -6355,7 +6373,8 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
         desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fsr, fi);
+                           mmu_idx, fsr, fi,
+                           regime_translation_big_endian(env, mmu_idx));
         switch (desc & 3) {
         case 0: /* Page translation fault.  */
             code = 7;
@@ -6437,7 +6456,8 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         goto do_fault;
     }
     desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fsr, fi);
+                       mmu_idx, fsr, fi,
+                       regime_translation_big_endian(env, mmu_idx));
     type = (desc & 3);
     if (type == 0 || (type == 3 && !arm_feature(env, ARM_FEATURE_PXN))) {
         /* Section translation fault, or attempt to use the encoding
@@ -6489,7 +6509,8 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
         desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fsr, fi);
+                           mmu_idx, fsr, fi,
+                           regime_translation_big_endian(env, mmu_idx));
         ap = ((desc >> 4) & 3) | ((desc >> 7) & 4);
         switch (desc & 3) {
         case 0: /* Page translation fault.  */
@@ -6862,7 +6883,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         descaddr |= (address >> (stride * (4 - level))) & descmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fsr, fi);
+        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fsr, fi,
+                                 regime_translation_big_endian(env, mmu_idx));
         if (fi->s1ptw) {
             goto do_fault;
         }
-- 
1.9.1

