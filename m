Received: by 10.25.44.15 with SMTP id s15csp764669lfs;
        Fri, 14 Jul 2017 03:56:35 -0700 (PDT)
X-Received: by 10.237.49.41 with SMTP id 38mr11121325qtg.244.1500029795295;
        Fri, 14 Jul 2017 03:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500029795; cv=none;
        d=google.com; s=arc-20160816;
        b=zzSZlVYSP678+Bjd+36lvb8niDywpQFGLVrSfln4xVPrhZ8nBKzPuzjPQVP66xXZnv
         IcI0tAcJodtGF+LeoIqRUnOaJfyxZb35uhqP/N1Y13AxjHHNenzAemE/pLCD2xNEkZoc
         /vWhPupspC4iiAoExAVmQAREyurL72JAgbyX635ySMySGbMwj0Mbp5MvAb3aXXZpkuGC
         sAaJ8Nv6CPjiD+Y3LRi0nnIbwSNtbCzOepP0Ml36JiceLl5iEYzxODNl4h0Uw7B8wkU+
         fp0XfWI7znSYp647yCrarT9F/lPfiBQEqbRNCcGA+jwKck0j7NA+WhqlFVxQpKq32ROr
         3pPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Ib5qjF6V1Xog+q12Z6XgE4Gj9if8VsqjpQOSwkwD7d8=;
        b=dMcpnlgBzP4EGg7wzoOn5k4IqZ6dsKh905KNphCKoL+J49Xc1d0sdrNVncwQ8iKjz/
         MkYZno9vTtP/4oIpzTxv1XAzEHSqdM4DatugRDnhDDpYN9xx5ISthC7ZIbX2wXRgrdkd
         hm539apj+G9hPjy0FUDBnW8SEwbF7MerWDPVjrqAmXawgiotlpk4yHOwlnUNyci+yypS
         NW3aruOLctuycbfOcUsZyHw1iikBpTBKaKvviAe7BnlxP5BAdqy2ZkmmlS96UbdUBtZ4
         uy8XlKNflB3Zvj337CE+v3t5q9WwkWKwAQhFQAnwM08gd3N/4CzOK8ZGmB4t7yDOJDb+
         9TlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w37si7579314qta.296.2017.07.14.03.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 03:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVyGu-0001Ko-H3
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 06:56:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCN-0004tZ-O2
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCJ-00079t-A1
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:51 -0400
Received: from [2001:8b0:1d0::2] (port=37583 helo=orth.archaic.org.uk)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dVyCJ-00072e-1G; Fri, 14 Jul 2017 06:51:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dVyC3-0007lk-Ne; Fri, 14 Jul 2017 11:51:31 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 11:51:26 +0100
Message-Id: <1500029487-14822-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 8/9] hw/arm/mps2: Add ethernet
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
X-TUID: Qp3yucI9ALE5

The MPS2 FPGA images support ethernet via a LAN9220. We use
QEMU's LAN9118 model, which is software compatible except
that it is missing the checksum-offload feature.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index bdc631a..6adfb22 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -35,6 +35,8 @@
 #include "hw/char/cmsdk-apb-uart.h"
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/misc/mps2-scc.h"
+#include "hw/devices.h"
+#include "net/net.h"
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
@@ -210,7 +212,6 @@ static void mps2_common_init(MachineState *machine)
     create_unimplemented_device("Extra peripheral region @0x40020000",
                                 0x40020000, 0x00010000);
     create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
-    create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
     create_unimplemented_device("VGA", 0x41000000, 0x0200000);
 
     switch (mmc->fpga_type) {
@@ -309,6 +310,13 @@ static void mps2_common_init(MachineState *machine)
                              &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
 
+    /* In hardware this is a LAN9220; the LAN9118 is software compatible
+     * except that it doesn't support the checksum-offload feature.
+     */
+    lan9118_init(&nd_table[0], 0x40200000,
+                 qdev_get_gpio_in(armv7m,
+                                  mmc->fpga_type == FPGA_AN385 ? 13 : 47));
+
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-- 
2.7.4

