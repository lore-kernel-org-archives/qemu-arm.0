Received: by 10.25.44.15 with SMTP id s15csp856292lfs;
        Wed, 19 Jul 2017 06:51:01 -0700 (PDT)
X-Received: by 10.55.43.34 with SMTP id r34mr171078qkh.93.1500472261381;
        Wed, 19 Jul 2017 06:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500472261; cv=none;
        d=google.com; s=arc-20160816;
        b=jZImXW7QMxDwt9GLGNcGQFihfgO+GGlovGiY9dBTpJ4hrQIsnIwXJ/4H9Vlwt8mFA/
         e7XHyF4pHBHaCi+mXtJNTvq+tz+ZKhr/BaaEMRSBNcd5Zv4RLBejq/YwWqU9VDFqmgk3
         Adys13ZQ5HeZPa8OfnQJICIu6MlHe2yYeWJIn75zEqnJI4bhVANfUIoCO1ec8CL0xBe8
         xlOf8yfvkUDWYdjfymw29ZLvbKc7xBc/AsOHQFCe5ZBubC8UkAbWBDYDaLaS0hKHZ50d
         R4thgz37F6wu8qAHtrZLFSJ8/G3bmYj2A9y8L2YmejecPQe8/zpBkY44H6AW0bBXtRgS
         YSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=Nt3nwqxu2iNejW1mdXEbLbHV0jZwkkKrrvjtmMs8qZM=;
        b=0CytQzvTTTNhD/o4ZPqn8ewW2nqsiuFH3vzpx8hgaMYbGGbJIqqpjYfCR3IgvV/C20
         Mi3dmgY7i8iu3RamWTyV3QA5NzvHoAyc4cSgDr5sN0PuNKhCcyi208ivGNk6lQx/8b+3
         Y293Gfo1J2JIMutWdMFpfe/dv43iuQWN/lyhH9NxloRlcdrX6QVnoSVKtFGL/sLCsPN6
         boJDydLClCb3lDNbZ7o5NX1IT3Z//7g4cJbvIieNsFm0urtVXR1BD5GXCgjT4KdrjAE2
         62DsVu1QYc/C0VN/lJLVrS6aqNA3AImw++EaAnFX6Nz1wM4nv1nZdtlIWsOzC/N57ev6
         Bv2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m36si83972qte.32.2017.07.19.06.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Jul 2017 06:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXpNS-0003su-Jd
	for alex.bennee@linaro.org; Wed, 19 Jul 2017 09:50:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpLO-0002Bn-4q
	for qemu-devel@nongnu.org; Wed, 19 Jul 2017 09:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpLN-0008Jx-Bk
	for qemu-devel@nongnu.org; Wed, 19 Jul 2017 09:48:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dXpLI-0008Hn-UF; Wed, 19 Jul 2017 09:48:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EDF47CB84;
	Wed, 19 Jul 2017 13:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9EDF47CB84
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9EDF47CB84
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBDA860606;
	Wed, 19 Jul 2017 13:39:58 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 19 Jul 2017 09:39:54 -0400
Message-Id: <1500471597-2517-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1500471597-2517-1-git-send-email-drjones@redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 19 Jul 2017 13:39:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/4] hw/arm/virt: add pmu interrupt state
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
Cc: peter.maydell@linaro.org, agraf@suse.de, cdall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5W/0YimzyGGv

Mimicking gicv3-maintenance-interrupt, add the PMU's interrupt to
CPU state.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c    | 3 +++
 target/arm/cpu.c | 2 ++
 target/arm/cpu.h | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 31739d75a3e0..ea26f0c473c2 100644
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
index 96d1f840301f..fd82c7944840 100644
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

