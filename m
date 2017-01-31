Received: by 10.25.77.65 with SMTP id a62csp23498lfb;
        Tue, 31 Jan 2017 08:19:59 -0800 (PST)
X-Received: by 10.200.36.219 with SMTP id t27mr27999913qtt.255.1485879599176;
        Tue, 31 Jan 2017 08:19:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s62si12260375qka.288.2017.01.31.08.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 08:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYb9y-0005ag-Hx
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 11:19:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYawr-0002eJ-Bt
	for qemu-devel@nongnu.org; Tue, 31 Jan 2017 11:06:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYawq-0005Vs-El
	for qemu-devel@nongnu.org; Tue, 31 Jan 2017 11:06:25 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYawi-0005Sz-0P; Tue, 31 Jan 2017 11:06:16 -0500
Received: by mail-pf0-x242.google.com with SMTP id f144so28528938pfa.2;
	Tue, 31 Jan 2017 08:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o1KL6CwGzxVGVLJycM8WJRRwSr4lYhp47/OMKzzCd3w=;
	b=ZH+5xrQUhqktGEC2HH7ir79UetXiXUSFv5ZrtawSZYFKYTGIWIsumMAbHS2OoBA0k/
	EAAkvEgzc7OqJoAcjzxFClUOVde6bdXIGb/ukYhk+HhSCBJkRkDbxbXx9cYBcr7JO0cU
	VIhXbsdqshQLSOqPf2G3NcO/DfosGgvU1VxudIimfw4BOwIfaCeM9KrBPmIC5uO/A8+v
	T4CxApd63CFFkvX0HV4n+FgVPUf7FH35l3FtB9gnNq9RNJSex+i7wDhffOTsKlYixWZu
	9RLiekSzH25ZilQDFEoPTT6v8n3Df/X7VDiVmilH1nzSIz4+ddSuJ6YeoVl5NkPz5Bof
	NWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o1KL6CwGzxVGVLJycM8WJRRwSr4lYhp47/OMKzzCd3w=;
	b=aff1ESRUQvoTczJvy8Z873ofSh9p7ll6gP3TcvB0/Bl7u77CgXWizfFSbL2G/DYCf2
	9noTRe6j6qm3dQvYOv1Z1fsk1AHt7uCubxahnhcoMbl7lZBsreOe5uTEsDxeWHX2q7ab
	WU7ETXxDhLOqjdN1M+WQaEl8hlrnpJsjPwlvbVSQ3rPzlS7IKtL+R3J6OtkT7wmGjhey
	FhwdP+pKqYoaXq6MnGVrVLFy/k2UwWGg3oNjlzCEXscK1fr1u+e3m/gCUcDtbxTW5xNF
	B1SWf0psCJ4NrXucIPAUMzWU3CE2ItUwZD9xG4Tten6JLoltxL0ESWrdxarEYTG1J2Qm
	Nejw==
X-Gm-Message-State: AIkVDXL2pJgp9zoOcTmqUgiOWQNgaO9CW8yGlq5jpLmV4P2tpviwf5OHZZWGhc3UGQG9Ew==
X-Received: by 10.99.238.5 with SMTP id e5mr31290181pgi.49.1485878775255;
	Tue, 31 Jan 2017 08:06:15 -0800 (PST)
Received: from localhost.localdomain ([106.51.232.200])
	by smtp.gmail.com with ESMTPSA id
	b10sm42699837pga.21.2017.01.31.08.06.12
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:06:14 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:35:48 +0530
Message-Id: <1485878749-5641-4-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
References: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v7 3/4] target-arm: Add GICv3CPUState in
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
X-TUID: d+3IxRwR5EYq

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Add gicv3state void pointer to CPUARMState struct
to store GICv3CPUState.

In case of usecase like CPU reset, we need to reset
GICv3CPUState of the CPU. In such scenario, this pointer
becomes handy.

This patch take care of only GICv3.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_kvm.c | 8 ++++++++
 target-arm/cpu.h        | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 77af32d..f91e0ac 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -644,6 +644,14 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
     gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
+    for (i = 0; i < s->num_cpu; i++) {
+        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
+        CPUARMState *env = &cpu->env;
+
+        /* Store GICv3CPUState in CPUARMState gicv3state pointer */
+        env->gicv3state = (void *)&s->cpu[i];
+    }
+
     /* Try to create the device via the device control API */
     s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_V3, false);
     if (s->dev_fd < 0) {
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ca5c849..b1ca064 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -507,6 +507,8 @@ typedef struct CPUARMState {
 
     void *nvic;
     const struct arm_boot_info *boot_info;
+    /* Store GICv3CPUState to access from this struct */
+    void *gicv3state;
 } CPUARMState;
 
 /**
-- 
1.9.1

