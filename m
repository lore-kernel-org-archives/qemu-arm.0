Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp900010wrt;
        Fri, 12 Oct 2018 07:46:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61pi8lINCU58gtFrGYyWi/VUykHMiL+zFPd9AU2b5vDAixvwpoKI8lW8qRwi3ftL0aOY3KR
X-Received: by 2002:a0c:d60a:: with SMTP id c10-v6mr6308422qvj.12.1539355592200;
        Fri, 12 Oct 2018 07:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355592; cv=none;
        d=google.com; s=arc-20160816;
        b=YPReHh6V770AoHj1cBAsalPLYuwR1vdvJCHUzF9Jz5XgKEwipM91K1dKS3KM74dr3h
         Vpxt+YuZ8Hd7bo89DCZd+V79sCajdUBJfn1wtLyKUnoOFcUGlgFfSsOh9mWc1G2OPAmf
         GZzsQIDDdkUwMj5UpczgVEMOjwD2uyxRDYXNPMZrWX+Ar29VE7+quHubXVqfOlfuHC8C
         ISVgAjkK3/6jn/MzsibPd/Hfi+87b/QyA5HG0ZFuCf8086woPSB03TyaHhrPmVmmHNrB
         8s3wdkn8YYGTIujItLQn57thJl2MIdWeauxu879z8kF/OfUfPOgw82gQOYlokPt2embw
         dW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Gfp+9hvT9xbFDfxH3lmrAmrqulo71kbP2rq88HKrnZg=;
        b=mU+tt3lpQN+UK9DYMZdKR0a99H925+vhl4RWV0qlSRY9bC52Z1sS8GuTW5NP8dEomg
         7Jrtz2EE+yYjKzRFzDH6KOYCpIdAeO+KM/o15yPIvUVfvT3AK15na04kWJwl72z137EV
         9so6kkLNBJtykHjvYA7byh11VTwUyOJHtCZ8HMFuVTjM1PUaXhV+Z78fsTJ5TkLaNhzw
         aB+LVgD8sK+Jar4l3x/LUXL8P6RjfQXyKGHXcZF1O5wEDZ7LdY3SnqaUa3fE8DjS+UVc
         iR+sejsBndgLhM8QmkTpq6YRNQTvCtR0BdLr1dYI9WyNztU1we4lSkJ7+3a3OqBDwWnQ
         yvmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y49-v6si1310021qtj.67.2018.10.12.07.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyhz-0002P5-4M
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:46:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeT-00085B-5t
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeS-00033x-8W
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:53 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeR-0002yA-Tp; Fri, 12 Oct 2018 10:42:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeM-0000PB-HJ; Fri, 12 Oct 2018 15:42:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:31 +0100
Message-Id: <20181012144235.19646-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/10] target/arm: Implement HCR.VI and VF
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
X-TUID: UmE3drG+Hir0

The HCR_EL2 VI and VF bits are supposed to track whether there is
a pending virtual IRQ or virtual FIQ. For QEMU we store the
pending VIRQ/VFIQ status in cs->interrupt_request, so this means:
 * if the register is read we must get these bit values from
   cs->interrupt_request
 * if the register is written then we must write the bit
   values back into cs->interrupt_request

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 47 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 65e431e03b3..78d05fe1e57 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3928,6 +3928,7 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
+    CPUState *cs = ENV_GET_CPU(env);
     uint64_t valid_mask = HCR_MASK;
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
@@ -3946,6 +3947,28 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
+    /*
+     * VI and VF are kept in cs->interrupt_request. Modifying that
+     * requires that we have the iothread lock, which is done by
+     * marking the reginfo structs as ARM_CP_IO.
+     * Note that if a write to HCR pends a VIRQ or VFIQ it is never
+     * possible for it to be taken immediately, because VIRQ and
+     * VFIQ are masked unless running at EL0 or EL1, and HCR
+     * can only be written at EL2.
+     */
+    g_assert(qemu_mutex_iothread_locked());
+    if (value & HCR_VI) {
+        cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
+    } else {
+        cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
+    }
+    if (value & HCR_VF) {
+        cs->interrupt_request |= CPU_INTERRUPT_VFIQ;
+    } else {
+        cs->interrupt_request &= ~CPU_INTERRUPT_VFIQ;
+    }
+    value &= ~(HCR_VI | HCR_VF);
+
     /* These bits change the MMU setup:
      * HCR_VM enables stage 2 translation
      * HCR_PTW forbids certain page-table setups
@@ -3973,16 +3996,32 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
     hcr_write(env, NULL, value);
 }
 
+static uint64_t hcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* The VI and VF bits live in cs->interrupt_request */
+    uint64_t ret = env->cp15.hcr_el2 & ~(HCR_VI | HCR_VF);
+    CPUState *cs = ENV_GET_CPU(env);
+
+    if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
+        ret |= HCR_VI;
+    }
+    if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
+        ret |= HCR_VF;
+    }
+    return ret;
+}
+
 static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
-      .writefn = hcr_write },
+      .writefn = hcr_write, .readfn = hcr_read },
     { .name = "HCR", .state = ARM_CP_STATE_AA32,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
-      .writefn = hcr_writelow },
+      .writefn = hcr_writelow, .readfn = hcr_read },
     { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
@@ -4219,7 +4258,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
 
 static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
     { .name = "HCR2", .state = ARM_CP_STATE_AA32,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL2_RW,
       .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
-- 
2.19.0

