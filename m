Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1946322wrd;
        Tue, 21 Aug 2018 06:58:22 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwFXeyzKwTApp6qCstLflKgS9MNEPDcRF/EiqyGCtcnhRwnv97H1mlwcO/Nmk1XSIbMb+GX
X-Received: by 2002:a0c:bd0e:: with SMTP id m14-v6mr46048805qvg.92.1534859902650;
        Tue, 21 Aug 2018 06:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534859902; cv=none;
        d=google.com; s=arc-20160816;
        b=wN8ulwuiH33QfHWDJyYTAplZXQrIueYP0Eb259bhxvE5UZFjT97rbROi/11nXGPe8C
         J4e8hMLoOAMTctf1xJDBqToIsbo331MV7AyYo9nfUchM95SuDVu2dZ8ItRCY2zm44JXN
         4c2hG3TuJwFrpFeZqXY2Mal8tKZJBw5eUV69edtC5YhYKiRCOwKj9tlar96twWbZ22eu
         Tv5HtPjVDpLwkwJlVgO1WdMyT8TIvo2FfpsX6YaBcPt5ppc27H9OSCEVs5lGwMBSKxgq
         s0k0cIKJZXFDCANSlXMwlETtBFWR6NE1G2jxd/mPpBJqF9yFJuyVDuBdMVdhXopq1ZWd
         TU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/ydpuh4YSJcLFjnv+0VkIZAKFQ7mWJvyrWENEzL53Eo=;
        b=EMjnJFMXaoJ2FHf79mUrIoTsN9mxclCLWu2NAwXNfVntnfNbAFr3YNmnfrkcn6KPir
         CHWVEdjXUBTtj0b9l2Qua43R0819LK1Gc2IF9i24dKHgTHJV/59VyCmqfQx84aGdnbSv
         y5AEabtSCo6eRowwkRWis+5zRF0n5dH7G48sjL5xkMXJtJDjSlZANk3Bl6fmrbSuPV4+
         bbbu3rHe/C04DqGx3015enAcWqyq6VJgOETRxuKMCiTo4YfcI0jykdcrTDPGIlqqrJAF
         u4NXUlQ4T+XOci55oDeplQfRdoPvQFfIieAAx/DgJD6hpvurzi/067eq8dhshjGyXXgP
         tFow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7-v6si10014925qvi.101.2018.08.21.06.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 06:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs7As-00075E-5U
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 09:58:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i4-00060c-FL
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i2-0003qE-RV
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6i0-0003S5-KQ; Tue, 21 Aug 2018 09:28:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hm-0004Ad-AW; Tue, 21 Aug 2018 14:28:18 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:06 +0100
Message-Id: <20180821132811.17675-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 4/9] hw/arm/highbank: Connect VIRQ and VFIQ
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
X-TUID: yU2BUpiOdc2X

Connect the VIRQ and VFIQ lines from the GIC to the CPU;
these exist always for both CPU and GIC whether the
virtualization extensions are enabled or not, so we
can just unconditionally connect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/highbank.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 6d42fce2c37..fb9efa02c35 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -243,6 +243,8 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     int n;
     qemu_irq cpu_irq[4];
     qemu_irq cpu_fiq[4];
+    qemu_irq cpu_virq[4];
+    qemu_irq cpu_vfiq[4];
     MemoryRegion *sysram;
     MemoryRegion *dram;
     MemoryRegion *sysmem;
@@ -282,6 +284,8 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         object_property_set_bool(cpuobj, true, "realized", &error_fatal);
         cpu_irq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ);
         cpu_fiq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_FIQ);
+        cpu_virq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_VIRQ);
+        cpu_vfiq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_VFIQ);
     }
 
     sysmem = get_system_memory();
@@ -329,6 +333,8 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     for (n = 0; n < smp_cpus; n++) {
         sysbus_connect_irq(busdev, n, cpu_irq[n]);
         sysbus_connect_irq(busdev, n + smp_cpus, cpu_fiq[n]);
+        sysbus_connect_irq(busdev, n + 2 * smp_cpus, cpu_virq[n]);
+        sysbus_connect_irq(busdev, n + 3 * smp_cpus, cpu_vfiq[n]);
     }
 
     for (n = 0; n < 128; n++) {
-- 
2.18.0

