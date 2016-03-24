Received: by 10.25.208.211 with SMTP id h202csp759567lfg;
        Thu, 24 Mar 2016 09:39:37 -0700 (PDT)
X-Received: by 10.55.27.234 with SMTP id m103mr11938558qkh.109.1458837577367;
        Thu, 24 Mar 2016 09:39:37 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 76si7157338qhk.72.2016.03.24.09.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 09:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj8IK-0000ta-UP
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 12:39:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aj8Hz-0000aa-Ki
	for qemu-devel@nongnu.org; Thu, 24 Mar 2016 12:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aj8Hy-0001Sk-Kn
	for qemu-devel@nongnu.org; Thu, 24 Mar 2016 12:39:15 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:41576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aj8Hy-0001SB-EG; Thu, 24 Mar 2016 12:39:14 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id EE7B217F69A; Thu, 24 Mar 2016 17:39:09 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Date: Thu, 24 Mar 2016 17:39:08 +0100
Message-Id: <1458837548-10413-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a03:4000:2:362::1
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-devel] [PATCH] pxa2xx: Fix warnings from cgcc
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
X-TUID: dMd1B0wbzl+w

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch is rather old, but it still can be applied.
It avoids duplicate definitions for some array indices
(which are allowed by gcc, but cgcc complains).

 hw/arm/pxa2xx_pic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 8a39b1c..a8a68e8 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -204,7 +204,6 @@ static void pxa2xx_pic_mem_write(void *opaque, hwaddr offset,
 
 /* Interrupt Controller Coprocessor Space Register Mapping */
 static const int pxa2xx_cp_reg_map[0x10] = {
-    [0x0 ... 0xf] = -1,
     [0x0] = ICIP,
     [0x1] = ICMR,
     [0x2] = ICLR,
@@ -216,6 +215,7 @@ static const int pxa2xx_cp_reg_map[0x10] = {
     [0x8] = ICLR2,
     [0x9] = ICFP2,
     [0xa] = ICPR2,
+    [0xb ... 0xf] = -1,
 };
 
 static uint64_t pxa2xx_pic_cp_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.1.4

