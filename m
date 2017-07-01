Received: by 10.25.227.6 with SMTP id a6csp73109lfh;
        Sat, 1 Jul 2017 09:47:36 -0700 (PDT)
X-Received: by 10.55.109.199 with SMTP id i190mr34215948qkc.125.1498927656185;
        Sat, 01 Jul 2017 09:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498927656; cv=none;
        d=google.com; s=arc-20160816;
        b=pRNrY07BFnq/X8iyWkwTcWPlTqRKp1vxty0VcuBZFMFGFG7U+2kXLALRBFcJHJ9VQb
         Jcq4zS5hAMElBUNRENhHrUWFL15KC/wsFpXianIqdmxRq16X5QIcy7pWBOSQ1Et251y/
         WYH3P4P5hBRK8iYGcGrHRUGzIXT2eFiHctGGoioWms4MIMOJfU/mObYOdXFSzENgOO/I
         a+zna1OI2s5M3wdhwF0OgJhffTFhlOkCS/YHwhlQZmHDFI4TP9NVDellvkTHyltxmcRb
         PWfUycCehxAB9Wvc/XWvZ1O8p+9hcTR/3kF68b1iebfnOFpNJ3lVnlMy1N/9Fc1OrnA4
         A41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=Z1A3rOPvHtLF4xogUbJXFYSApsJw4lCaMZUwziGNTpo=;
        b=DSQkIwoGXF9lzRqdtT+oLm+T9TLWnlg1qDQs6GrFxHZp/sWG7iZfUjZSX20JST+va/
         tbWJau1p0myPI1+aq01jW6Lkk9UVBL+FhIPj3zC3aFQZ2pNUasqCP74PfMQIXkofcyrF
         IDmZkW30d1LEUiIgSuGLIijRX3OFB7BdFuuy0UGR8Y4+exdRKmT8+WDotvgYtJU5sKfb
         5aqmlbVdS25pajb7roHvJyoeE2N0VipOq9QJ2KVftywASPyL2UB5NdXNM8wxa06DEuOy
         4nrDlShpqUktDhGOY5d8LANAX1OWccMyWVQCOwFql6N43YDGXFfXlowQ5w6CUsXVoO7F
         aLHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s78si3087708qki.35.2017.07.01.09.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jul 2017 09:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRLYT-00084G-Km
	for alex.bennee@linaro.org; Sat, 01 Jul 2017 12:47:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dRLYL-00083y-9J
	for qemu-arm@nongnu.org; Sat, 01 Jul 2017 12:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dRLYI-0000PU-5Z
	for qemu-arm@nongnu.org; Sat, 01 Jul 2017 12:47:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35774)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dRLYH-0000ON-Vc; Sat, 01 Jul 2017 12:47:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13E1381227;
	Sat,  1 Jul 2017 16:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 13E1381227
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 13E1381227
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74A2560318;
	Sat,  1 Jul 2017 16:47:19 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sat,  1 Jul 2017 12:47:15 -0400
Message-Id: <1498927637-14496-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1498927637-14496-1-git-send-email-drjones@redhat.com>
References: <1498927637-14496-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 01 Jul 2017 16:47:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/3] hw/arm/virt: add pmu interrupt state
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
Cc: peter.maydell@linaro.org, agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bj2AbhDeDwec

Mimicking gicv3-maintenance-interrupt, add the PMU's interrupt to
CPU state.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c    | 3 +++
 target/arm/cpu.c | 2 ++
 target/arm/cpu.h | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 010f7244bf7c..9781e1cc5ed7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -610,6 +610,9 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
         qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
                                     qdev_get_gpio_in(gicdev, ppibase
                                                      + ARCH_GICV3_MAINT_IRQ));
+        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
+                                    qdev_get_gpio_in(gicdev, ppibase
+                                                     + VIRTUAL_PMU_IRQ));
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
         sysbus_connect_irq(gicbusdev, i + smp_cpus,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 28a914129857..70cc8f4474af 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -499,6 +499,8 @@ static void arm_cpu_initfn(Object *obj)
 
     qdev_init_gpio_out_named(DEVICE(cpu), &cpu->gicv3_maintenance_interrupt,
                              "gicv3-maintenance-interrupt", 1);
+    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->pmu_interrupt,
+                             "pmu-interrupt", 1);
 #endif
 
     /* DTB consumers generally don't in fact care what the 'compatible'
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 102c58afac52..8d91166eb97b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -584,6 +584,8 @@ struct ARMCPU {
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
     /* GPIO output for GICv3 maintenance interrupt signal */
     qemu_irq gicv3_maintenance_interrupt;
+    /* GPIO output for the PMU interrupt */
+    qemu_irq pmu_interrupt;
 
     /* MemoryRegion to use for secure physical accesses */
     MemoryRegion *secure_memory;
-- 
1.8.3.1

