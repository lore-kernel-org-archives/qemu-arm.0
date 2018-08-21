Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1929798wrd;
        Tue, 21 Aug 2018 06:41:44 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPygnoONmQT8emmdOUASc2yBAjxT0JKGHgQkpDZSSucgNjOK/LMDeLSF42EPKT9YWyx/HB9G
X-Received: by 2002:a0c:fac4:: with SMTP id p4-v6mr45365538qvo.179.1534858904373;
        Tue, 21 Aug 2018 06:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534858904; cv=none;
        d=google.com; s=arc-20160816;
        b=tzDvxL/XbRXjNIEhRYagw2n/BHmKuBdsWAZ4NXEvVKM6CAgKAPZErlAztyTEaVPETo
         DZ/pwpnuAjvDP+fjhw0jMBopYUFOAplZtU/cfrDeq49sobNGnI+Nsh0QSS2yaWAxkidA
         jUC067cqMyxCLnqOJwzQcWHyzW/WhyxCdXHXQgb7Zr9Wx/Dt74+bIX6JY+UBXuySEzqG
         T9KQHcFLiXkdnxofkNy1fIORgmxkGiNMl5oQJRpnrMx00azhTy9fHatG2TBOn2O4vXzm
         aFjUMSNwL0r/mHcDKfHkIypmp4gbJtfjszoBuQVWa+Z48tZuQk7B69BA5J9FXQId4dKQ
         fxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=e+hk/2b593hQb8ssOsua1tlEMqVxCJtKIX3ShkvVvNg=;
        b=fVD7NFuVu380m3rk4lNHwhPdVmoa1y0UbX7T517Mv7nxqFfzb992Lpu2Ro9cnF/9PE
         tFCjDmvBlej9rP+4DOy093YRgpHj8tAUdX+X3tz5v+zLwO8x7508fGCjGvnDrveVh5Wa
         Gwz/vNbN0Ayk71S2cU29k9BeWeTjPNOY/u9hlKGZGz5RrhIAIVahUjVuuff//ga2rIVZ
         aojp3qnVC+rVBLnGeZrNLOJ1tKBkSe3znHjV62Kwoq9NoxbzsiKQV/j2ez2bStlM4OQY
         F0bDKHoLBNUvSl6T8aCEAX74rRhV246n/NVOrhwDlKKfzdhGiDRpChp7jokAw+sdrO7z
         Si4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n11-v6si1332628qvo.128.2018.08.21.06.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 06:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs6ul-0002FD-38
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 09:41:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hz-0005uo-J0
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hy-0003ij-0r
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6hu-0003S5-On; Tue, 21 Aug 2018 09:28:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hq-0004CW-1V; Tue, 21 Aug 2018 14:28:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:10 +0100
Message-Id: <20180821132811.17675-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 8/9] hw/arm/vexpress: Don't set
 info->secure_boot if CPU doesn't have EL3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BrGi887aQPYl

Don't request that the arm_load_kernel() code should boot in secure
state if the CPU doesn't have a secure state. Currently this
doesn't make a difference because the boot.c code only examines
the secure_boot flag in code guarded by an ARM_FEATURE_EL3 check,
but upcoming changes for supporting booting into Hyp mode will
change that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/vexpress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index dc47ed84c20..3631f4de3a4 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -705,8 +705,8 @@ static void vexpress_common_init(MachineState *machine)
     daughterboard->bootinfo.smp_bootreg_addr = map[VE_SYSREGS] + 0x30;
     daughterboard->bootinfo.gic_cpu_if_addr = daughterboard->gic_cpu_if_addr;
     daughterboard->bootinfo.modify_dtb = vexpress_modify_dtb;
-    /* Indicate that when booting Linux we should be in secure state */
-    daughterboard->bootinfo.secure_boot = true;
+    /* When booting Linux we should be in secure state if the CPU has one. */
+    daughterboard->bootinfo.secure_boot = vms->secure;
     arm_load_kernel(ARM_CPU(first_cpu), &daughterboard->bootinfo);
 }
 
-- 
2.18.0

