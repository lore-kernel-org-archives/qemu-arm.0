Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp586778wrv;
        Fri, 12 Jul 2019 00:53:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6Td8sXGU1tgrfKtXWew9XNvX1dGxliUU/7VwIMkPNVTm3u7cs5oPbW1LnzuP6usPxV6hK
X-Received: by 2002:a50:b343:: with SMTP id r3mr7701247edd.16.1562918033016;
        Fri, 12 Jul 2019 00:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562918033; cv=none;
        d=google.com; s=arc-20160816;
        b=nKpq6iYlzB0lhjnYEbnUgkxUXM5wQ8b1BMk1FL9xLJMEcREusZXROuBq2YNnBmacGG
         XI8aaMCx8qR3iMZsvOcdOCQ1mnf9y0wNAWacxpSHLhdW7IAavN7lCb3v2oH01Yqlnzkp
         VL5PImk8DOFikmTflF8qK55mNsj8siCrabuM+/eLoHysYFEtZoUKDKB6HjSMZ8ibLCf6
         QCvaPW4z46cRRNJ8lIWiUepki3akGcXkicWnr7aySpZmiPKIe1sFHyXmbZrvkLeFPnlB
         Koy8BcrcyVj+wdkhnQrfBHoGViBAmK4IHTdtgX3l3vX0VDoSF8ssRwRqtglNXoBTVQsL
         /18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=vtIAZ6vmuod1tk+7ROzY0KNSrAfvKQ1HBcJz1j1qLR4=;
        b=PLp2sWz9AAuVz+OSwXCS6/A0fY8IXwUyMaJMr5SNfxii825bUIR0jWjQ9zBycJZqnW
         O7yI69JIJWBtevx6Cqvm026N+Qa7ex9I++c1ZbDDi4apegZ0tWevSlIL+vET0jyhISQl
         ifCKKDl6P2ufeVRHmaRtCQFoIHaS9nWilJo44OyEFnJdQ2n+fC+NY2XXDR2qYlogaksH
         /SKbWk8gS7pY2ierp5i2aIureqfVDuJXpAhcGD2M0nya3vzbqH2YaGGQXjssuzZCtsMM
         BoEKoargAM7bWrpOihVkGE30yWEhdiK/9vq2vVXMETR3RKPrbCDE9r/h3EWP/3LWyaL1
         k5Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si4277342ejr.71.2019.07.12.00.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 00:53:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlqNM-0005b9-5G
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 03:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43821)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david.engraf@sysgo.com>) id 1hlqNJ-0005aq-Hj
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 03:53:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david.engraf@sysgo.com>) id 1hlqNI-0000VC-MB
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 03:53:49 -0400
Received: from mail.sysgo.com ([176.9.12.79]:46240)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <david.engraf@sysgo.com>)
 id 1hlqNI-0000Rv-GS; Fri, 12 Jul 2019 03:53:48 -0400
From: David Engraf <david.engraf@sysgo.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Fri, 12 Jul 2019 09:50:02 +0200
Message-Id: <20190712075002.14326-1-david.engraf@sysgo.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 176.9.12.79
Subject: [Qemu-arm] [PATCH] hw/arm/virt: Fix non-secure flash mode
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
Cc: qemu-devel@nongnu.org, David Engraf <david.engraf@sysgo.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1rEjGglx/KTU

Using the whole 128 MiB flash in non-secure mode is not working because
virt_flash_fdt() expects the same address for secure_sysmem and sysmem.
This is not correctly handled by caller because it forwards NULL for
secure_sysmem in non-secure flash mode.

Fixed by using sysmem when secure_sysmem is NULL.

Signed-off-by: David Engraf <david.engraf@sysgo.com>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0b5138cb22..d9496c9363 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1674,7 +1674,7 @@ static void machvirt_init(MachineState *machine)
                                     &machine->device_memory->mr);
     }
 
-    virt_flash_fdt(vms, sysmem, secure_sysmem);
+    virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
     create_gic(vms, pic);
 
-- 
2.17.1

