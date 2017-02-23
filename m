Received: by 10.25.0.147 with SMTP id 141csp168092lfa;
        Thu, 23 Feb 2017 04:08:49 -0800 (PST)
X-Received: by 10.237.35.231 with SMTP id k36mr35557980qtc.192.1487851729408;
        Thu, 23 Feb 2017 04:08:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si3147025qtr.89.2017.02.23.04.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 04:08:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgsCU-0002ca-JK
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 07:08:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgs9k-00081z-Ap
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 07:06:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgrwC-0004bz-8Y
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 06:51:57 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cgrwA-0004bb-NF; Thu, 23 Feb 2017 06:51:54 -0500
Received: by mail-pg0-x242.google.com with SMTP id z128so4337509pgb.3;
	Thu, 23 Feb 2017 03:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7EoIYJd67rtBY8RRssgCqaVLVY/14w4WRBeOKPML0KY=;
	b=bkBKwMC9QQ54ySHkO3kkXBXzEuStLEUJQnPrEljHkOSO5Q7TOVOQXvK3XpShN3AX4S
	f1NIjyrHQrfO/6k3Mg7o2EqJIeZxmoxBVNCc7m3lFS/q+2b0x7Ea4TtI3vWYxyiSVmdQ
	C/NvriNLKDKwByyLbdp4a5fa/+sRrKKg7jAWrdXVLUMTJGl3F+Cl5vzmUv2ErmLrrJF5
	l4Qvv02005E3+JW03HFqwwA6XuKazQ5Ld5eYBRSTiu2ZPq/thXVdEYBzEJRVLGr4DBFZ
	RQjeUOEgYgtQijK7A1wknDR5HRC8SEo45D6h+i6YpYLhHkLzBNeZMX3cftUMTjaqznYw
	TDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7EoIYJd67rtBY8RRssgCqaVLVY/14w4WRBeOKPML0KY=;
	b=luSNi2D2JqqMBINLTfsy0JMItCbwRvJBORCvCK3D0UBlSE9aHE/A3MgYup7ZMfRTo3
	rj1yZjeni4YQqgECxu7GGliBmHkPOn92kdnwtVGznbf+bg3Wy0LIOvAIre/iuUPUdXM9
	pK8eEKl0B/Jcinx0PLCvqAJ24WfXD3pH5tHkRPiSAwlR6EFH1BmcPAHu55ko0qZnr8el
	VDaEAiF2rgQKhu7rlnjWFhv7vTMfMVdbR4+jZ3EPrp8k/qNrLCjuGjf4KzaivhJMZIM4
	S8dYToynAbNxxkCdc5qLZ5rBN2wgf615jIfEw8Wo1M+/Y1UXyXJQLAlKJdawxHj6MqBU
	sdSQ==
X-Gm-Message-State: AMke39mdMapRJgJkuP0jZspcht+S0Jm6OXWD9u4HGvySLEK9If5UGBKTLJ7NSsupCBQEMg==
X-Received: by 10.98.49.198 with SMTP id x189mr45974541pfx.20.1487850713784;
	Thu, 23 Feb 2017 03:51:53 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id b7sm9462026pfg.53.2017.02.23.03.51.50
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 03:51:53 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Thu, 23 Feb 2017 17:21:12 +0530
Message-Id: <1487850673-26455-5-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v9 4/5] target-arm: Add GICv3CPUState in
 CPUARMState struct
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x2lOLx/kttVU

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Add gicv3state void pointer to CPUARMState struct
to store GICv3CPUState.

In case of usecase like CPU reset, we need to reset
GICv3CPUState of the CPU. In such scenario, this pointer
becomes handy.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 2 ++
 hw/intc/arm_gicv3_cpuif.c  | 8 ++++++++
 hw/intc/gicv3_internal.h   | 2 ++
 target/arm/cpu.h           | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 5b0e456..c6493d6 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -252,6 +252,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 
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

