Received: by 10.182.158.201 with SMTP id ww9csp2588116obb;
        Tue, 1 Dec 2015 12:25:42 -0800 (PST)
X-Received: by 10.55.82.137 with SMTP id g131mr84201301qkb.66.1449001541527;
        Tue, 01 Dec 2015 12:25:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c187si51705429qhd.24.2015.12.01.12.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 12:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3rUb-0003LW-0Q
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 15:25:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a3rUX-0003Kp-Ny
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 15:25:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a3rUU-0005Zc-BG
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 15:25:37 -0500
Received: from zose-mta02.web4all.fr ([185.49.20.43]:56881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a3rUT-0005ZE-Nf; Tue, 01 Dec 2015 15:25:34 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id E5B60432A5;
	Tue,  1 Dec 2015 21:25:32 +0100 (CET)
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id U3LrB8rzTMU1; Tue,  1 Dec 2015 21:25:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id 6E72B432A6;
	Tue,  1 Dec 2015 21:25:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-02.w4a.fr
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id j4a7KbIqg8kV; Tue,  1 Dec 2015 21:25:32 +0100 (CET)
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta02.web4all.fr (Postfix) with ESMTPSA id 04867432A5;
	Tue,  1 Dec 2015 21:25:31 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org
Date: Tue,  1 Dec 2015 21:25:30 +0100
Message-Id: <edf36adfc0a1a1f4d2994473001549857d7ed192.1449000671.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449000671.git.jcd@tribudubois.net>
References: <cover.1449000671.git.jcd@tribudubois.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.43
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [Qemu-arm] [PATCH v5 1/4] i.MX: Fix i.MX31 default/reset
	configuration.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JLGmsphqM7bk

Linux on i.MX31/KZM is expecting the CCM to use the CKIH ref clock instead
of the CKIL plus the FPM multiplier.

We change the CCMR reg reset value to match linux expected config.

This allow the CCM to provide a 39MHz clk (as expected by linux) instead of
the actual 50MHz.

With this change the "sleep 60" command on linux is time accurate with
"real world time".

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---

Changes since v1:
 * Not present 
  
Changes since v2:
 * Not present 

Changes since v3:
 * Not present

Changes since v4:
 * Not present

 hw/misc/imx_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 4cc2bbc..500dda5 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -123,7 +123,7 @@ static void imx_ccm_reset(DeviceState *dev)
 {
     IMXCCMState *s = IMX_CCM(dev);
 
-    s->ccmr = 0x074b0b7b;
+    s->ccmr = 0x074b0b7d;
     s->pdr0 = 0xff870b48;
     s->pdr1 = 0x49fcfe7f;
     s->mpctl = PLL_PD(1) | PLL_MFD(0) | PLL_MFI(6) | PLL_MFN(0);
-- 
2.5.0

