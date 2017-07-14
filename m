Received: by 10.25.44.15 with SMTP id s15csp764792lfs;
        Fri, 14 Jul 2017 03:56:44 -0700 (PDT)
X-Received: by 10.237.37.52 with SMTP id v49mr10984292qtc.97.1500029804127;
        Fri, 14 Jul 2017 03:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500029804; cv=none;
        d=google.com; s=arc-20160816;
        b=j3Q6ZEgSdMbfCe1VdHYpcYuv4EtUE2TElv/SwZihbBoZWMsJOHPCmYH3kTkV08oNLQ
         QqStdoA1XUhoDkHlSLYq3YZsh7WHeoYNAnQPpwiMLlu2u8mux8CoKZJ54nhyvm8W9Kq8
         BlUGhE96xNI6vcTrZMNr8FPo5WOdUgaeDZA0Rx50zUj6cm1NzkaIAAzySWDED4hkbBrC
         3A452nMhBI3uRt017di7Krlga8ioXKP/0KgjFT/8MuXNG4K48fK2xsY6B/ObhCdKL8Nr
         W05CzZE7CJnL5vh+Q7wVHZb57JupOiP5uPH2v0+7wgI1v9ZmEsYtm1BrbRNO/9vg4XOL
         x4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=O1SAgLx5uNlMOSh/O6XsR79qugWF9NoI6M7p+ObqtgQ=;
        b=LLfYPwN44/6lVGg8SZvcaTKaKr5RE+YcnhRrACJDmxFg21hmcDdW3PhbXhb21JT4w0
         NBjrN0bn0RQUYJL/3HowVddh+tANO+h/r7jUmpp0tNFS3Gv8XiLtxCZkpXqk4aGeVDu5
         QkyLyFhEpfYE7sYyUielMob2NoaCoeRUSeYXYymQhxWZN8CXlrwCI7bhotsAU1PLL6le
         bfrSEXihMVyPhoxwsb11T0cvvcbJWnB2zYDutU4m4DDacfNLzTrp5ihhqfoss8cf+weV
         l1PSVe4ouwzSPsSekfZfrAV9r0d67UQhBTwtCc2YMNZ5Bs71EmKH2fMTJrFWQx8eDqP/
         8mAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t54si7348551qtb.387.2017.07.14.03.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 03:56:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVyH3-0001YO-LJ
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 06:56:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCN-0004tf-Pb
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCL-0007C7-VK
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:51 -0400
Received: from [2001:8b0:1d0::2] (port=37583 helo=orth.archaic.org.uk)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dVyCL-00072e-Nt; Fri, 14 Jul 2017 06:51:49 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dVyC2-0007ke-2q; Fri, 14 Jul 2017 11:51:30 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 11:51:23 +0100
Message-Id: <1500029487-14822-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 5/9] hw/arm/mps2: Add timers
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OhYuXMXusSLr

Add the CMSDK APB timers to the MPS2 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 180c5d2..0de0ffcb 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -33,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/misc/unimp.h"
 #include "hw/char/cmsdk-apb-uart.h"
+#include "hw/timer/cmsdk-apb-timer.h"
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
@@ -292,6 +293,9 @@ static void mps2_common_init(MachineState *machine)
         g_assert_not_reached();
     }
 
+    cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
+    cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
+
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-- 
2.7.4

