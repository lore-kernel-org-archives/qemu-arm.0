Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp392234lfo;
        Wed, 3 Feb 2021 09:02:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHV04sskBKwR4HotbZ9HjGv8xOjpT1fcJtjFBtlT3+8HTZJWio63P0OeBAtIarAMy4NuAT
X-Received: by 2002:a25:e052:: with SMTP id x79mr5998685ybg.378.1612371746795;
        Wed, 03 Feb 2021 09:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612371746; cv=none;
        d=google.com; s=arc-20160816;
        b=kx7JOR7REX5HJ3xYQk/HFI/Iqzz5nmT8Yo1Szn6EffKX9hSHcEkk+7rj4ogbyOxf7v
         NRtnaVLf7PRAyQ0SdPFzRdcDVFU37nxl5uGVTx6a7ICdwOufowoGsfyg6SAsIkpqGpJz
         3Z525bTxuoOzGIw1OAwXdh8rTqHyILWE71dAy/SnB9glgqpux/4c6cRo/Xx6ZnoVODWj
         lZ42eZB34tqrspseS31b2olR5T1VO11v8mnENvnHZoPdO8/deL6pglHh1xFFhW4455vC
         OFN5tUSk1l7nTqzGvNOeBiH+GyWW2TVUW7hYMI67Rn+Y92A1g4YEZrX3uDYArW7TpMxu
         Rpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:references:in-reply-to:message-id:date:subject:to
         :dkim-signature:content-transfer-encoding;
        bh=AZlrT42e82kcT/iAmGBEbWchNqzK9+FvZAd3dN4LTLY=;
        b=BPg5U+fSuHxBBnnEEb2ZlSffjYBuopDgS+Ls156EvJdh1N1NrcBb54fTylghk8IPpr
         Odo3VjzRaLOfSYZX3xCkQUSFb4KrjotAhJcWXXd4qGCcmrKO6zhLXOOjRRBFkki8kxXN
         V2dosswMHPyTKLneEf4rWyZZYyVDbJeS/uRL3mew1cWa+ghwUy28dSktBK6PAOXJTeyP
         gGhHM2lpgm2zWrvTfhax3Q8/Rc4Vd1QcYruB1js86VWIBrTjD/PM3SzlX7TG1NbELwlt
         m4B6iofD/J/bWXL0ycy1TFgTHxhGlzWrPcKqm/x49eDdVIAUDmcznFEkkx5MHvsXdn78
         rZUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=OoqbucPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si2789223ybg.443.2021.02.03.09.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 09:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=OoqbucPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7LXu-0001Q8-3W
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 12:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7LS5-0004xD-An; Wed, 03 Feb 2021 11:56:26 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:29222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7LS2-00082b-Lq; Wed, 03 Feb 2021 11:56:24 -0500
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1612371380; h=from:subject:to:date:message-id;
 bh=X2wnTu4NMcpKV+EZTbug/3AW40/hzSkCyt8FKBp28i8=;
 b=OoqbucPfEVYaWadrKJtfu6uNqHghv0HI9WBwwiIfOiKiKt665QkcXETN0VKD4zXxQpYdosFLuXl
 4KSXGl4DWVVVsRMciogQtJqcLsFFbQtuhKRwdEOLAPe56BOaQyP7ALDh8IltgP7SxVX+HisRoY0vt
 ugmbUvbxieFQuKNYlzQizgSoz968MYHFWmjTWHL2CpC/Q8YgILurtoxMRnmUlNYrQVQVJ2JF5jKGB
 qvvydmZVDOZBrhiM7WWoVvzB0AzlFUyWZDV4mhSK2IAYRpXCAMCl29wOZ+yKRhwgW5AQm62FC7Uun
 vFAc9+lHMWXyZZxZAjUnyPKS2WmMGNeaGuHQ==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge06.gtri.dmz
 (10.41.104.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Wed, 3 Feb 2021
 11:56:20 -0500
Received: from localhost.localdomain (10.41.0.30) by tybee.core.gtri.org
 (10.41.1.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Wed, 3 Feb
 2021 11:56:19 -0500
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 1/1] target/arm: Fix SCR RES1 handling
Date: Wed, 3 Feb 2021 11:55:52 -0500
Message-ID: <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
References: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
MIME-Version: 1.0
X-ClientProxiedBy: hatteras.core.gtri.org (10.41.22.72) To tybee.core.gtri.org
 (10.41.1.49)
Received-SPF: pass client-ip=130.207.205.170;
 envelope-from=Michael.Nawrocki@gtri.gatech.edu;
 helo=unifiededge.gtri.gatech.edu
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
From: michael.nawrocki--- via <qemu-arm@nongnu.org>
X-TUID: 3hAqrzgYNfw9

The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force them
to 1 only when there is no support for AArch32 at EL1 or above.

The reset value will be 0x30 only if the CPU is AArch64-only; if there
is support for AArch32 at EL1 or above, it will be reset to 0.

Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch32
is supported at EL1 or above.

Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 16 ++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d080239863..39633f73f3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4033,6 +4033,11 @@ static inline bool isar_feature_aa64_aa32(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL0) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47e266d7e6..e529cdbfd0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2024,7 +2024,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
 
     if (ri->state == ARM_CP_STATE_AA64) {
-        value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
+        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
+                value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
+        }
         valid_mask &= ~SCR_NET;
 
         if (cpu_isar_feature(aa64_lor, cpu)) {
@@ -2063,6 +2066,15 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     raw_write(env, ri, value);
 }
 
+static void scr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /*
+     * scr_write will set the RES1 bits on an AArch64-only CPU.
+     * The reset value will be 0x30 on an AArch64-only CPU and 0 otherwise.
+     */
+    scr_write(env, ri, 0);
+}
+
 static CPAccessResult access_aa64_tid2(CPUARMState *env,
                                        const ARMCPRegInfo *ri,
                                        bool isread)
@@ -5785,7 +5797,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
-      .resetvalue = 0, .writefn = scr_write },
+      .resetfn = scr_reset, .writefn = scr_write },
     { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
-- 
2.20.1

