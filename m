Received: by 10.25.44.15 with SMTP id s15csp5022251lfs;
        Tue, 11 Jul 2017 08:55:50 -0700 (PDT)
X-Received: by 10.55.33.194 with SMTP id f63mr757938qki.112.1499788550621;
        Tue, 11 Jul 2017 08:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499788550; cv=none;
        d=google.com; s=arc-20160816;
        b=mQJ9+QJ/MgfnsJJMNh6fF+PYSVEuR4n2HLhN8o6Ey8Bb3Cv90KjRVxxMqmKznEG8t0
         ksK6fQklhfOOAK+vzhn/wILAq9uxGr0Pzgc0oePx31vgBCqfPe4SIVRQKn3v5ztAePcJ
         OLHjp9LD7UM1gyNkHQXDcbcH41RPE0QQy0AqX231nPU5/25krEjLxZPx1iJuyvXq5FMh
         QY73o0YgQWybF/QIhuURoBpA7DrPVo6AeCg8YX52SFnMmmdIxsZaY1E3rgi/XhE9PJOV
         HjUDZMvyEaIgVYBFofMF7P4z9bKun6RxKg51Hy1H71/KAgN9dXlHqVzy240qFNKgqA9U
         X7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=l4zEKK4aF5ho/rpxxB6whm73SRMwc5wKeMORB9oYtwI=;
        b=TG3wEDYDTlsr3RWbuFH36mdRAtgzrB7lKJRPBFXcVdNnheqLx3CbJg3r12zfXMYika
         QuzUbcxzExlls7DEASMq8BLNIQyZoVc2USaH7l3kHwhwjk4LbUyNMmfREqCN/XKvCFfC
         iuzyRRmwFwnoTR6SUFao5N0oQPd4SCEKWIGGcK8orqYL0uhP0M2DbRq5pSvJ4pAK0Mn3
         BXICdFOy1gPnOD++mTOaVz4bNXk7hh2oHQDenYosKZu3ekx4TAhM1VhYQBkAAPY84p3w
         Xg/DpVCdQEN/8/leNQMmyr00zWAZ1wvFQa0Kddj/dAXasFnsctivq9atTNKs1OTwFV5O
         csog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n7si283055qtb.189.2017.07.11.08.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 08:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUxVr-0003Ic-P6
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 11:55:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUxVn-0003Hz-Cu
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:55:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUxVl-0007AH-CK
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:55:43 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:48438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dUxVl-00077Y-0e; Tue, 11 Jul 2017 11:55:41 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dUxTe-0003KL-E6; Tue, 11 Jul 2017 16:53:30 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jul 2017 16:53:28 +0100
Message-Id: <1499788408-10096-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 81.2.115.148
Subject: [Qemu-arm] [PATCH 3/3] target/arm: Make Cortex-M3 and M4 default to
 8 PMSA regions
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2CcDJVarJg9/

The Cortex-M3 and M4 CPUs always have 8 PMSA MPU regions (this isn't
a configurable option for the hardware).  Make the default value of
the pmsav7-dregion property be set per-cpu, so we don't need to have
every user of these CPUs set it manually.  (The existing default of
16 is correct for the other PMSAv7 core, the Cortex-R5.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 28a9141..96d1f84 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -543,8 +543,15 @@ static Property arm_cpu_has_pmu_property =
 static Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
+/* This is like DEFINE_PROP_UINT32 but it doesn't set the default value,
+ * because the CPU initfn will have already set cpu->pmsav7_dregion to
+ * the right value for that particular CPU type, and we don't want
+ * to override that with an incorrect constant value.
+ */
 static Property arm_cpu_pmsav7_dregion_property =
-            DEFINE_PROP_UINT32("pmsav7-dregion", ARMCPU, pmsav7_dregion, 16);
+            DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
+                                           pmsav7_dregion,
+                                           qdev_prop_uint32, uint32_t);
 
 static void arm_cpu_post_init(Object *obj)
 {
@@ -1054,6 +1061,7 @@ static void cortex_m3_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V7);
     set_feature(&cpu->env, ARM_FEATURE_M);
     cpu->midr = 0x410fc231;
+    cpu->pmsav7_dregion = 8;
 }
 
 static void cortex_m4_initfn(Object *obj)
@@ -1064,6 +1072,7 @@ static void cortex_m4_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_M);
     set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
     cpu->midr = 0x410fc240; /* r0p0 */
+    cpu->pmsav7_dregion = 8;
 }
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
@@ -1112,6 +1121,7 @@ static void cortex_r5_initfn(Object *obj)
     cpu->id_isar4 = 0x0010142;
     cpu->id_isar5 = 0x0;
     cpu->mp_is_up = true;
+    cpu->pmsav7_dregion = 16;
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
-- 
2.7.4

