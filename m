Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1235499wrd;
        Thu, 23 Aug 2018 07:24:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzpR5du8CvHvLNJPfYLRlxh80fQilSXVkiaAYf0LQ6reUDdXQjqsCJ0I1S3V0CcLH0QRF9g
X-Received: by 2002:a37:5744:: with SMTP id l65-v6mr55591514qkb.216.1535034275453;
        Thu, 23 Aug 2018 07:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535034275; cv=none;
        d=google.com; s=arc-20160816;
        b=PWFx+yw5aV/QfYiXb+0NcUyDYcXEm1XcRgXr6LBXdKzQjgs9dv3So58hFQGuDdon3f
         1/P7kylMmA7VzJOH2n+i/3kUarSbGpznJ2tccGDwAVbFfPZdcH/p5SAf1JpRNQkRGP2G
         h65TaForIRdaanyB0txu0a9ZaVoAKkxsOaskagHd4XXUKyxdrkeOT8yu0x/27szbprqV
         t0EV+tcCqTtfplPsuwGdb1DAHEHZxQoBpimIfDxA42UJLSsuE1vY5y8WDryI9NzO/Vqr
         ocCpL6n3G+rTVAPiOMOjh4yNQ2nUJeop74t9g0tOAaf+RtaZLEc53dB8va7C56UhbRSy
         iBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=BKw9rH61nN1dVutmm+/KmUvBxL4MB5e+B/ypPenx9R0=;
        b=RK03hmYU05wlPKtbQPZat41anjHdxn/xvvDuhAau09j14fkc4L8TR2XDpNRpfKokMa
         6fGPMa01rN+eWeI0o4GQAvx1GyYnRH2xMY1ALVlBhO1rlaIcNnycjzh0DzTKDepoglje
         m2eIR6+DOWuFpt/44+HWxdNosAsTlNylhIzyelPiuwkIUqqbsHgaIn3u7VYpu8X0doHs
         0Zd7KJGcEu0xuHPwA+eqdOUg16Zl2Q8uEJVu9vb+cL8bKabEVzT5YXS8U2uGQyMRExE9
         fDCIDsL6Dh1Uktds9cJGxPQm1z0IGMuYftP638uvdV8GWwiCYYxxPyvnFlr6fwXxBTgP
         NbXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j18-v6si970746qtj.294.2018.08.23.07.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 07:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsqXL-0001VG-0U
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 10:24:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fsq0j-0003D2-5u
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 09:50:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fsq0i-0003UW-F0
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 09:50:53 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fsq0i-0003TW-6r; Thu, 23 Aug 2018 09:50:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fsq0f-0005r3-Ps; Thu, 23 Aug 2018 14:50:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 23 Aug 2018 14:50:47 +0100
Message-Id: <20180823135047.16525-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Start AArch32 CPUs with EL2 but not
 EL3 in Hyp mode
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
X-TUID: AA+7L/EZIF2Y

The ARMv8 architecture defines that an AArch32 CPU starts
in SVC mode, unless EL2 is the highest available EL, in
which case it starts in Hyp mode. (In ARMv7 a CPU with EL2
but not EL3 was not a valid configuration, but we don't
specifically reject this if the user asks for one.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 258ba6dcaad..b5e61cc1775 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -199,8 +199,18 @@ static void arm_cpu_reset(CPUState *s)
         env->cp15.c15_cpar = 1;
     }
 #else
-    /* SVC mode with interrupts disabled.  */
-    env->uncached_cpsr = ARM_CPU_MODE_SVC;
+
+    /*
+     * If the highest available EL is EL2, AArch32 will start in Hyp
+     * mode; otherwise it starts in SVC. Note that if we start in
+     * AArch64 then these values in the uncached_cpsr will be ignored.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL2) &&
+        !arm_feature(env, ARM_FEATURE_EL3)) {
+        env->uncached_cpsr = ARM_CPU_MODE_HYP;
+    } else {
+        env->uncached_cpsr = ARM_CPU_MODE_SVC;
+    }
     env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-- 
2.18.0

