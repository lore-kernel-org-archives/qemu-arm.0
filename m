Received: by 10.25.44.15 with SMTP id s15csp4681053lfs;
        Tue, 11 Jul 2017 04:17:47 -0700 (PDT)
X-Received: by 10.237.63.119 with SMTP id q52mr10379213qtf.49.1499771867107;
        Tue, 11 Jul 2017 04:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499771867; cv=none;
        d=google.com; s=arc-20160816;
        b=LBRPZ+UJmVTii7rchA0BymsXgjUwz+JY4vDYPFLKrmlCzzBTSEPF3L2KZ0NItQjEdN
         iTh1xBoFdKG2e5qMPP4aLg7Wrun8hGv7USzk2NOMG0fRU3Sd2mYc4hkJkL7+seJQjyha
         SchrasQlHAEFJ/VK4CK0v6K75c7nF7j/Z9NWrYMb9k6BXAr63nGEJnwW82KuoEuoqbKw
         sxPc88p4Vl078NiSC1V2GExrmlGs1XzabdgIrb3DPA/byKc+qvDl8EF/w+leOkUa78H5
         pAAwdHwsPcO7TtoLUhgKOEcNMqEGy5gyCcp/d1OXts5sEUlPVydWhg3PjHwFjj3xn6kQ
         mBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bxrxKoICBeTAbk8gWQzXH4T6bArEh/y83yIwlQoMsjo=;
        b=J4mn6tbmQg1Xcvz0L1b60GbXQtfSC/vPwKOK1q532WqJDxGUEPxJleZY3YnycWr6Jy
         pnKQ2Grrbr6at9PiieKXYg46AtTDaCrnX21U27IVoriQgnudzw3/0dISqUPz4YFSp5yN
         EAdHoM0KneF3ECpc5fFrgpTaDKOBeNVyNA0vR8UMTj1nnCEoPOMsg634dI5h4dcMQ6VG
         Rq3QkiIFUCOES04erywvdQ6d7jsZ8Z/Ex4gIEKN4HhwuVc21ScaqU/d5WyqCAiGmvUEw
         gOUu61LEKgNuHZxl02ZcA6ocvNWGmj9Zb1jLJVPhTexyc0IjidhfeEtT85rpOhKgWWYz
         x+OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c24si13502269qtc.31.2017.07.11.04.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 04:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUtAm-0007NJ-I5
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 07:17:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUtAW-00079j-7R
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 07:17:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUtAV-00084M-E0
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 07:17:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dUtAV-00081N-7e; Tue, 11 Jul 2017 07:17:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dUtAQ-00033J-DR; Tue, 11 Jul 2017 12:17:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jul 2017 12:17:17 +0100
Message-Id: <1499771839-32518-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/7] hw/arm/mps2: Add timers
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
X-TUID: fTXM4C6W37T5

Add the CMSDK APB timers to the MPS2 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 1b60b12..b1a0df9 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -33,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/misc/unimp.h"
 #include "hw/char/cmsdk-apb-uart.h"
+#include "hw/timer/cmsdk-apb-timer.h"
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
@@ -294,6 +295,9 @@ static void mps2_common_init(MachineState *machine)
         g_assert_not_reached();
     }
 
+    cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
+    cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
+
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-- 
2.7.4

