Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1944035wrd;
        Tue, 21 Aug 2018 06:55:59 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPypqVNMxbldt64B8aVgisGA/Auia0Et2Jb7GF+CXN5aO6zZ1mtJZS0LUu6g9x9N16yrIKNZ
X-Received: by 2002:aed:3244:: with SMTP id y62-v6mr7843315qtd.292.1534859759762;
        Tue, 21 Aug 2018 06:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534859759; cv=none;
        d=google.com; s=arc-20160816;
        b=JJwb9qmu/f6aGwkVK/ooqxIx5v888vSCLowWxL6SPWiCehxKpI53WWJSvSFS0d96os
         rRmYajhKN9/zVb8nZMpO2jihh0a+yT/NA0+zK+vzaX1FkwIW3bNSHzNnsMwQJW//DUk4
         vTk4w2+MXK+Ulk5LUma7EFXIJDVhqhlMttCdue2d27bHR1PuI3gYyI3vo7SS3pn9EGqS
         xKMdAYKJkMn6QTB7ibP8G9omtrBG6bisGyLAgxQlQx1SRY6tS/C8TD0uc8lV9gsCWuE5
         anlnx+kC84+uvAQAQzTLsdXUZHbEI3JS0fbgUTmcdUS+BRzy5RhpbDz50U00Uv4NexnR
         hwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JKj2Ujfnmv36SNZhH4hqGpvU8yIfV062RGwu+pGAnXQ=;
        b=I1aaTI8hE+FYsss8ZLb2Xs4zpeUhOW37MjDE89jepCIXTDN6z+u0M4So2t2U5BguQQ
         TXy2YZZzxHDDYFh6dJ4Pph+6Supsh+f9rOHjpk/TddwRuLDPIx7ffb04YkAqRvn5M2L7
         xhAILGcG+r9wAUjU8mzyojGyb7UP96J1mLK4d9hA5TJlhv7r1ywEcidZMppUFz5PHfBJ
         FVhWD8bWX+fV5Yq2t2gtg0xmk9xvpkaG84bhIFCAN65OUw398v2iduA9X9f9entbwdx1
         twkV4MtXU28P+MNCANycmMk/vA3C7tMhGVF75uThUbVSTnZ21BrXFvhq7OE446IRAxOP
         7Z4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1-v6si4951427qtb.119.2018.08.21.06.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 06:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs78Z-0005aQ-5G
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 09:55:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i2-0005yX-PP
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i2-0003oa-1y
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6i1-0003S5-OX; Tue, 21 Aug 2018 09:28:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hl-0004A8-Am; Tue, 21 Aug 2018 14:28:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:05 +0100
Message-Id: <20180821132811.17675-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/9] hw/arm/vexpress: Connect VIRQ and VFIQ
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
Cc: Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XTudGXXU55Uu

Connect the VIRQ and VFIQ lines from the GIC to the CPU;
these exist always for both CPU and GIC whether the
virtualization extensions are enabled or not, so we
can just unconditionally connect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/vexpress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 5bfe2e43487..dc47ed84c20 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -251,6 +251,10 @@ static void init_cpus(const char *cpu_type, const char *privdev,
         sysbus_connect_irq(busdev, n, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
         sysbus_connect_irq(busdev, n + smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+        sysbus_connect_irq(busdev, n + 2 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+        sysbus_connect_irq(busdev, n + 3 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
 }
 
-- 
2.18.0

