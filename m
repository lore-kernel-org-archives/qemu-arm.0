Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp378548lfp;
        Fri, 7 Feb 2020 01:55:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxx0KNeaAoE0FIBSmhADWaE+eYu/ImFjKSow3hRILTLMkyxdoyVJUUyUIQ2remsT7UOnFgY
X-Received: by 2002:aed:3e13:: with SMTP id l19mr6485554qtf.103.1581069345472;
        Fri, 07 Feb 2020 01:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581069345; cv=none;
        d=google.com; s=arc-20160816;
        b=sdyrtJfwjpuyjrLehdZXbv2igtxepMMfEnx1EmzcQdzfxYNiXeN+hZ1JM+GAeGKHpx
         Ag3lerML8iEY5UyspGK8tGjEUqL7QUlvpppQCDwfyl0X7J40EXQwMDLMdYd89TWCBuSQ
         BO1qqpFFnrxIjvtq1Lipzb0i9OHtPmUJP8xYQF0/KMysyj0dMjqmy5HjF4dARa1TaFv+
         uTdVMV/4bxCU5b0o55noeQ6z9eTBmjB2f03HVUmbqZTsDggesQucs44P1lixxIJZZI7G
         deIVSz5O7/B64KfaCpW8W5xjZXiF57/pl6Xwbd4EqpZqCZFIHjNGTQ34mN2COU63dVUX
         4Osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=rL3qpVWYVop4wGxjk9dqGFrF50tUI+aCh49H3Oas5Aw=;
        b=bvX7aAYaPFTaJP5CHbCMJoufDU8ut9MWdKsISyBFvTph9Wj8qw/Q2+wUJeQovJ8eYY
         k0mEuKgLfSJyQlSYLL/+CpL9gsEvnQPDZGZpRSRCiW7MwbSJQO8JLGDiKy2US17ravSL
         s5tB4QCezsEL8uqMUQzr9OE8HkaY8GQoNRvR6Tf+NE4U5taCXyAm3ECdBl3hUT2G4QNE
         NtT3oehwC+cZIrgxyoCeS+tCY3SZUOkEAI+FW1jptSw2KNV8wg4Z8L2+4sareUdFxzlR
         7ar2Vo4OXUS7bihrlowcgCqZ5ghoY3CYI4Rvq3JLghCRCfTCOPhMruIQ9YGUMxqtxcwc
         FbfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si1070720qkp.178.2020.02.07.01.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 01:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j00MS-0004yT-SV
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 04:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rka@sysgo.com>) id 1j00MI-0004s7-E6
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 04:55:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rka@sysgo.com>) id 1j00MG-00009f-MH
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 04:55:33 -0500
Received: from mail.sysgo.com ([176.9.12.79]:52482)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <rka@sysgo.com>)
 id 1j00MG-00008K-GF; Fri, 07 Feb 2020 04:55:32 -0500
From: Roman Kapl <rka@sysgo.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] i.MX: Fix inverted register bits in wdt code.
Date: Fri,  7 Feb 2020 10:54:09 +0100
Message-Id: <20200207095409.11227-1-rka@sysgo.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 176.9.12.79
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Roman Kapl <rka@sysgo.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DDU/71vJWSnf

Documentation says for WDA '0: Assert WDOG output.' and for SRS
'0: Assert system reset signal.'.

Signed-off-by: Roman Kapl <rka@sysgo.com>
---
 hw/misc/imx2_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
index e47e442592..c8944729c4 100644
--- a/hw/misc/imx2_wdt.c
+++ b/hw/misc/imx2_wdt.c
@@ -28,7 +28,7 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned int size)
 {
     if (addr =3D=3D IMX2_WDT_WCR &&
-        (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
+        (~value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
         watchdog_perform_action();
     }
 }
--=20
2.22.0

