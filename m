Received: by 10.223.150.237 with SMTP id u100csp3118166wrb;
        Mon, 6 Nov 2017 14:16:17 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RNYmObLeVNASemn6mU0RzWaem/4XUI/xVrpgLcttU6oKqWPR8+iQnLhaSQh31E/Ifaq80o
X-Received: by 10.129.174.102 with SMTP id g38mr11381333ywk.488.1510006576986;
        Mon, 06 Nov 2017 14:16:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510006576; cv=none;
        d=google.com; s=arc-20160816;
        b=Xg6cf8aBL+sNzp2YACkfuUb0ihMaaUYbnN2KGEavL6rhcInWblGTYSI+Vpfbdr9pqM
         xg685L0HryiYwRM164Umz3a8da4jL4oCcZcYojIZk2gOYTteZ9jgXP/Wlykga0seutfp
         SU0cys8u0uNeJLDfykwdOXVnrKu/Dehc74hri7xF/dKWG3q3A4PUgYhNYDa/R3Tr1FoS
         0Vl218mc33Q3V3h50b1QDCov7Ybh0pUpaAEpMEzPx0srCzLB5QoDnV5uFuPZZ9WZlo3p
         HC7YVh8eAtZnKvmsL5J4GyMjQVRnVMwwSn5mNhr/aZSgI/3xH99Qi12kG5i0a2BelpNz
         2W1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=Q7Gv/n5pVB+Br8NGZb2MJWJldUj8TCgk6oyLPug4wr4=;
        b=Sj9gZuHrY1TwJLmHhK7enAXSa6h26OzCxXOrKga+LeoLwniyyILz2UO7CcMz1wF/4Y
         9TQuZyMQ0zN/alVj1GDO2Lyc+bodGSGk01qFh0L192zfJ92blGr8cFW1s2EscdXW8ViP
         MsbDiBd+l+uCBmReAZN1oyVmvVKHDKn0RmOnQy0n8mTQnPqMY7Z7KdT6seZd5jgkuqLU
         AJnVUFlU5SjbfF/bRsXGZV1mUaSnoeQYRdZscCsGG3MAWmPC4QBB9CoK+zvYYYmsoEOj
         H4UlcP4sl1jevpNaaHYM63Hm5arfwkl7GUBgcmgUu/BYVF0qeNP9jQto50SCVcsCzrnT
         t+IA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u205si2764667ybb.29.2017.11.06.14.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 14:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBpgm-0003vm-DN
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 17:16:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eBpge-0003vb-CS
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 17:16:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eBpgb-0001ML-4N
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 17:16:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:36110)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1eBpga-0001La-UU; Mon, 06 Nov 2017 17:16:05 -0500
Received: from [10.149.184.130] (162-198-228-33.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.33])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ADC8A21870;
	Mon,  6 Nov 2017 22:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADC8A21870
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Mon, 6 Nov 2017 14:16:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: peter.maydell@linaro.org
Message-ID: <alpine.DEB.2.10.1711061412330.30448@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v2] aarch64: advertise the GIC system register
 interface
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
Cc: julien.grall@arm.com, sstabellini@kernel.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, xen-devel@lists.xen.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jHbvgXbNDZI9

When QEMU emulates a GICv3, it needs to advertise the presence of the
system register interface, which is done via id_aa64pfr0.

To do that, and at the same time to avoid advertising the presence of
the system register interface when it is actually not available, set a
boolean property in machvirt_init. Check on the boolean property from
register_cp_regs_for_features and set id_aa64pfr0 accordingly.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e18b41..369d36b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1401,6 +1401,9 @@ static void machvirt_init(MachineState *machine)
             object_property_set_link(cpuobj, OBJECT(secure_sysmem),
                                      "secure-memory", &error_abort);
         }
+        if (vms->gic_version == 3) {
+            object_property_set_bool(cpuobj, true, "gicv3-sysregs", NULL);
+        }
 
         object_property_set_bool(cpuobj, true, "realized", NULL);
         object_unref(cpuobj);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 88578f3..259cad1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1690,6 +1690,7 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
+    DEFINE_PROP_BOOL("gicv3-sysregs", ARMCPU, gicv3_sysregs, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 89d49cd..0015b37 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -657,6 +657,9 @@ struct ARMCPU {
     /* Should CPU start in PSCI powered-off state? */
     bool start_powered_off;
 
+    /* GICv3 sysregs present */
+    bool gicv3_sysregs;
+
     /* Current power state, access guarded by BQL */
     ARMPSCIState power_state;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37af750..6f21900 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4687,7 +4687,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
-              .resetvalue = cpu->id_aa64pfr0 },
+              .resetvalue = cpu->gicv3_sysregs ? (cpu->id_aa64pfr0|0x01000000) :
+                  cpu->id_aa64pfr0 },
             { .name = "ID_AA64PFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
