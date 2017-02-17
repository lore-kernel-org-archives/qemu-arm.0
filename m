Received: by 10.25.77.65 with SMTP id a62csp23616lfb;
        Thu, 16 Feb 2017 22:33:01 -0800 (PST)
X-Received: by 10.55.142.7 with SMTP id q7mr6473613qkd.104.1487313181575;
        Thu, 16 Feb 2017 22:33:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2si6858923qkf.171.2017.02.16.22.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 22:33:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cec6H-0001Yf-1G
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 01:33:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5q-0001Gi-Rg
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 01:32:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5p-0005iS-Vn
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 01:32:34 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:33110)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cec5p-0005hv-QP; Fri, 17 Feb 2017 01:32:33 -0500
Received: by mail-pf0-x242.google.com with SMTP id e4so3380295pfg.0;
	Thu, 16 Feb 2017 22:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NN3s+gkbhp4BSfUA9JjYR1WvmvjuAfON1mGcz6PNK9s=;
	b=BrCrYMCfiWytZ75CHtH4UFXxP39WPWHH+9DC/cqS4Rkk1QgMrR+xSlFugf2hed8jQq
	MXz1LX2GW3BgttWQwEDtNn6MJioqEWk7ve4qJoHqapHAZBEvsnIFleaVWSyGn1nXePYx
	Bu198q3c+oKglDpJ9qzyaBhUghqIVMmPtLQvVpOwoPkwCp4coIbsMAocqb05inm+0U18
	A2XTUlsbwG4KlHV6eoPLoDg8NOWA6Apz7KuaHPN4mK9ynm+MKdv1LLbpCH8T/Iyb2qWH
	5OruExcLaPHueNruEbr7ydAJDuqwX5qWJrx29jIt6CsgZ16FR7N0iIFV6yU5dOO6gA3x
	3E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NN3s+gkbhp4BSfUA9JjYR1WvmvjuAfON1mGcz6PNK9s=;
	b=IaQ/9CRFotJavRWwv7EBzwDlfGBsLV32a8A/JVUC1LON4i397ypwGLxog9V3C6FFB/
	942qdqwSnH755+rFPqLPiM+4LrdmqzXIhRdiIm5tmcb9nnBbTudP28XcR3FYJ5ketUSN
	4352U/LOeFA6Hnp1slBJzstRqGIOTJLlYxJORauHJM4eBhXZLenViHxhVORefQF857np
	xle/azHQNYbmJ+bF2INlWRvJYJ/xJDx4mU4d4zQnpfuskAIfrpgltp2Nz7OqAZqiNLOh
	FVufyaZTfnG/8AXMRMz43q4c+Cn9IjRLDcschjj3s1o0yKLVWCd4PF4/OjXQ6HkWMNQt
	uZDw==
X-Gm-Message-State: AMke39n4GzBUAxAXjLwVPDDFHUHUYCxp5LkDjq0dYKBxbal/Gwv6mhy1BuXDP6j+FYIUeQ==
X-Received: by 10.99.231.5 with SMTP id b5mr8143716pgi.80.1487313152877;
	Thu, 16 Feb 2017 22:32:32 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	89sm17074808pfo.40.2017.02.16.22.32.29
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 22:32:31 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Fri, 17 Feb 2017 12:01:54 +0530
Message-Id: <1487313115-9510-5-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v8 4/5] target-arm: Add GICv3CPUState in
 CPUARMState struct
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZQROda4eBW7G

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Add gicv3state void pointer to CPUARMState struct
to store GICv3CPUState.

In case of usecase like CPU reset, we need to reset
GICv3CPUState of the CPU. In such scenario, this pointer
becomes handy.

This patch take care of only GICv3.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_common.c | 2 ++
 hw/intc/arm_gicv3_cpuif.c  | 8 ++++++++
 hw/intc/gicv3_internal.h   | 2 ++
 target/arm/cpu.h           | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index e62480e..79a5bd9 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -248,6 +248,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 
         s->cpu[i].cpu = cpu;
         s->cpu[i].gic = s;
+        /* Store GICv3CPUState in CPUARMState gicv3state pointer */
+        gicv3_set_gicv3state(cpu, &s->cpu[i]);
 
         /* Pre-construct the GICR_TYPER:
          * For our implementation:
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index c25ee03..7849783 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -18,6 +18,14 @@
 #include "gicv3_internal.h"
 #include "cpu.h"
 
+void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+
+    env->gicv3state = (void *)s;
+};
+
 static GICv3CPUState *icc_cs_from_env(CPUARMState *env)
 {
     /* Given the CPU, find the right GICv3CPUState struct.
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 457118e..05303a5 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -408,4 +408,6 @@ static inline void gicv3_cache_all_target_cpustates(GICv3State *s)
     }
 }
 
+void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s);
+
 #endif /* QEMU_ARM_GICV3_INTERNAL_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0956a54..d2eb7bf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -517,6 +517,8 @@ typedef struct CPUARMState {
 
     void *nvic;
     const struct arm_boot_info *boot_info;
+    /* Store GICv3CPUState to access from this struct */
+    void *gicv3state;
 } CPUARMState;
 
 /**
-- 
1.9.1

