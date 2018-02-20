Received: by 10.28.71.27 with SMTP id u27csp1374086wma;
        Tue, 20 Feb 2018 10:05:39 -0800 (PST)
X-Google-Smtp-Source: AH8x224J2/nSM8qbj3dXpY0nD4lidpPLIvsj5A+v6OfzNX4aPmQyci4tRJuReFFyRu6nSD0YYC/f
X-Received: by 10.129.43.86 with SMTP id r83mr413935ywr.309.1519149939403;
        Tue, 20 Feb 2018 10:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519149939; cv=none;
        d=google.com; s=arc-20160816;
        b=bP/Ae42f8U/DRgm1gnonWYyUXieOa6Isl2LLTr7fgo8EQALRJDjejyK+lEkDHUSKaj
         NfcgQRWKY8Iie/+IZasDSOIZy1E9ipt4L7AaBIPbUdae1BefaD5vezX9YmVQ1593Wsc9
         K+39hhLRBbU3nZoLUicwy50sATYZ7wWKCiHf8TMXYfTqJ39SwAN5JXHO9eNolPzZHWaR
         m/beBh+Pufxb7lFkorNT0GXE/pRpyxKDwm0Lwdl4DXTWDlfuk3M59CbngUf/IoLTr5O0
         f3yneVkKWfBSJEqO5mG0o8mtYmP/V7rjQzwib5frYVjDjRn6OHktJlou0C7cC2xVc0jS
         ttyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=RYZmX90QD7DWLPkAEIgqPUG9ieSyj89Hpfjg7x6iZs8=;
        b=dwlp4WJXiLZ5A2rJ99d6qT9JLZt3mGke61g8lDGcgadOv6ywL0hC/SKmZubE5mKScY
         xlSV7x1JUpI5Um+/q3lWHvLpFMrkoGiBiuL1ntVnR5hkXZyu7bB6WET6foxwxUAlItx4
         o7sRvWZ4vIlY7z2s/uVi3TVBvpjaIU9oJWdy9rCarMniSe/YxDWKyleoP7vn0Qh2c3Bt
         VKrT54es0KzCGrFMWu5kkiMAcaR5w1ANU3/Cp9c9NWMofg8ChuXV22D1kWKm8BB6GtFZ
         Wdn9J+A7o44p0S+IZ0I4e6j+T2rkyxpehNjM9GhME0+4THIKYtvriLfY5LNI0ZHqsZqk
         OXsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si4426319ywf.320.2018.02.20.10.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCIM-0001Hq-R6
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:05:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGW-0008AC-Tl
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGU-0001fM-KX
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:44 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46524)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGU-0001WQ-8o; Tue, 20 Feb 2018 13:03:42 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGK-0008Rv-4p; Tue, 20 Feb 2018 18:03:32 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:14 +0000
Message-Id: <20180220180325.29818-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/19] target/arm: Add Cortex-M33
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
X-TUID: O1PNBCDsYFcP

Add a Cortex-M33 definition. The M33 is an M profile CPU
which implements the ARM v8M architecture, including the
M profile Security Extension.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 34b5a4a00b..897003a186 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1205,6 +1205,35 @@ static void cortex_m4_initfn(Object *obj)
     cpu->id_isar5 = 0x00000000;
 }
 
+static void cortex_m33_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr = 0x410fd213; /* r0p3 */
+    cpu->pmsav7_dregion = 16;
+    cpu->sau_sregion = 8;
+    cpu->id_pfr0 = 0x00000030;
+    cpu->id_pfr1 = 0x00000210;
+    cpu->id_dfr0 = 0x00200000;
+    cpu->id_afr0 = 0x00000000;
+    cpu->id_mmfr0 = 0x00101F40;
+    cpu->id_mmfr1 = 0x00000000;
+    cpu->id_mmfr2 = 0x01000000;
+    cpu->id_mmfr3 = 0x00000000;
+    cpu->id_isar0 = 0x01101110;
+    cpu->id_isar1 = 0x02212000;
+    cpu->id_isar2 = 0x20232232;
+    cpu->id_isar3 = 0x01111131;
+    cpu->id_isar4 = 0x01310132;
+    cpu->id_isar5 = 0x00000000;
+    cpu->clidr = 0x00000000;
+    cpu->ctr = 0x8000c000;
+}
+
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
@@ -1696,6 +1725,8 @@ static const ARMCPUInfo arm_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
                              .class_init = arm_v7m_class_init },
+    { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
+                             .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
-- 
2.16.1

