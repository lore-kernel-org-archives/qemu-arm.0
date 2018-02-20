Received: by 10.28.71.27 with SMTP id u27csp1374672wma;
        Tue, 20 Feb 2018 10:06:04 -0800 (PST)
X-Google-Smtp-Source: AH8x224atOm6s728UTd92j6HNyye58NugsZC4u3psLU/CmmOY894FrkTD0+y9cNSWou+tBDQzhK8
X-Received: by 2002:a25:b382:: with SMTP id m2-v6mr445686ybj.334.1519149964170;
        Tue, 20 Feb 2018 10:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519149964; cv=none;
        d=google.com; s=arc-20160816;
        b=mhzJo1hl3qenTIIWaCUw4miWdXFyNqOq01xKw0Pt0g9Zq5Mf0dJivH0hleAh+KRO8o
         kTgD3Lu/wMCI1QzuLsTZ0pCTsRdjomarn1WsGpRhoY4jEUKW+jyEbJqZaIUIU/HwGX4B
         xw7hHcHpHC/8bzK1p7rZ8ZllhtOoVMDZqM/lXVwMsiwPqkZN5htJklPljUPEPkQe4dnc
         UUWLJtBmMHeTLKlyQELf1CYn2BVVqp9vBt405RXefu4kHMckhbgWmSk7lDtoaSL4SNix
         lQCnxdP8BH/ZnO+V585MJVFVCRvA7vrhkajtL+yKRgfvYW9vPmSZu4By2Prc1O40OqUl
         /DGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TnzyBGDtbET45aRxf/xxqklKj8XxTqNz38CClpehMTc=;
        b=WBbtNwh6f859Hfg02tewGTJD2NrjNOkOZN4OwTirsLkHDHfUbta9vXhO9puRueU4fn
         O9v8jzCLD/qMaFxRYxgx9LPaBvM4Z6gXwXcC71vssUxI+cp4vgEVruYZ6SpGuH7cxyOL
         F0QbzO3ip11CJmlHTbVf6o+BGVYSiaL/RaLfFnkoI2hXvl8PxeuUYifGnf6zzHEf2H8Z
         c7DUbzYWAHPgPPL764NkbQYWfiYXxWRpZrxldlxwpZdUo+qh16MWHWUMaco9BzyzacpS
         eChoH7p039Ph6SLSXboLoKzRAby4gXM6dW32UWehUJnYy38VEQDD3+82f5cnKwS7NODj
         BXew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o195si2026048ybg.575.2018.02.20.10.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCIl-0001aN-HB
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:06:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGX-0008At-Fg
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGV-0001gC-Bw
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:45 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGV-0001cw-0G; Tue, 20 Feb 2018 13:03:43 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGI-0008RR-OU; Tue, 20 Feb 2018 18:03:30 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:12 +0000
Message-Id: <20180220180325.29818-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/19] target/arm: Define init-svtor property for
 the reset secure VTOR value
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2foX4j8d5RF5

The Cortex-M33 allows the system to specify the reset value of the
secure Vector Table Offset Register (VTOR) by asserting config
signals. In particular, guest images for the MPS2 AN505 board rely
on the MPS2's initial VTOR being correct for that board.
Implement a QEMU property so board and SoC code can set the reset
value to the correct value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 * This patch doesn't try to change the handling of the load itself;
   strictly speaking for real hardware the load of initial PC and
   SP should honour the secure/nonsecure attributes and check
   SAU settings and bus fault responses, as with other vector
   table loads. That is a change for a different patch, if ever.
 * The M33 and MPS2 are actually more flexible than "constant value
   set when the board is created" -- the MPS2 has a register in
   the FPGA which can be used to define the VTOR to use on the
   next (soft) reset, since the M33 samples its config signals
   on every reset. That would be pretty fiddly to implement in
   QEMU (which doesn't even really have a well-defined concept
   of reset which is not a powercycle) so I'm not going to
   implement it unless we run into guest code that needs it.
---
 target/arm/cpu.h |  3 +++
 target/arm/cpu.c | 18 ++++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dc45b740c5..c286169630 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -722,6 +722,9 @@ struct ARMCPU {
      */
     uint32_t psci_conduit;
 
+    /* For v8M, initial value of the Secure VTOR */
+    uint32_t init_svtor;
+
     /* [QEMU_]KVM_ARM_TARGET_* constant for this CPU, or
      * QEMU_KVM_ARM_TARGET_NONE if the kernel doesn't support this CPU type.
      */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 99d00c3ac9..34b5a4a00b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -186,6 +186,7 @@ static void arm_cpu_reset(CPUState *s)
         uint32_t initial_msp; /* Loaded from 0x0 */
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
+        uint32_t vecbase;
 
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             env->v7m.secure = true;
@@ -213,8 +214,11 @@ static void arm_cpu_reset(CPUState *s)
         /* Unlike A/R profile, M profile defines the reset LR value */
         env->regs[14] = 0xffffffff;
 
-        /* Load the initial SP and PC from the vector table at address 0 */
-        rom = rom_ptr(0);
+        env->v7m.vecbase[M_REG_S] = cpu->init_svtor;
+
+        /* Load the initial SP and PC from offset 0 and 4 in the vector table */
+        vecbase = env->v7m.vecbase[env->v7m.secure];
+        rom = rom_ptr(vecbase);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
              * copied into physical memory.
@@ -227,8 +231,8 @@ static void arm_cpu_reset(CPUState *s)
              * it got copied into memory. In the latter case, rom_ptr
              * will return a NULL pointer and we should use ldl_phys instead.
              */
-            initial_msp = ldl_phys(s->as, 0);
-            initial_pc = ldl_phys(s->as, 4);
+            initial_msp = ldl_phys(s->as, vecbase);
+            initial_pc = ldl_phys(s->as, vecbase + 4);
         }
 
         env->regs[13] = initial_msp & 0xFFFFFFFC;
@@ -623,6 +627,10 @@ static Property arm_cpu_pmsav7_dregion_property =
                                            pmsav7_dregion,
                                            qdev_prop_uint32, uint32_t);
 
+/* M profile: initial value of the Secure VTOR */
+static Property arm_cpu_initsvtor_property =
+            DEFINE_PROP_UINT32("init-svtor", ARMCPU, init_svtor, 0);
+
 static void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -693,6 +701,8 @@ static void arm_cpu_post_init(Object *obj)
                                  qdev_prop_allow_set_link_before_realize,
                                  OBJ_PROP_LINK_UNREF_ON_RELEASE,
                                  &error_abort);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_initsvtor_property,
+                                 &error_abort);
     }
 
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property,
-- 
2.16.1

