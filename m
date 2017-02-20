Received: by 10.25.0.147 with SMTP id 141csp59056lfa;
        Mon, 20 Feb 2017 07:36:11 -0800 (PST)
X-Received: by 10.28.228.213 with SMTP id b204mr20492597wmh.59.1487604971187;
        Mon, 20 Feb 2017 07:36:11 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 204si12739795wmk.136.2017.02.20.07.36.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 07:36:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfq0Y-0005iB-MI; Mon, 20 Feb 2017 15:36:10 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 08/11] armv7m: Don't put core v7M devices under CONFIG_STELLARIS
Date: Mon, 20 Feb 2017 15:36:02 +0000
Message-Id: <1487604965-23220-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
X-TUID: N1ZfsY6Ewfza

The NVIC is a core v7M device that exists for all v7M CPUs;
put it under a CONFIG_ARM_V7M rather than hiding it under
CONFIG_STELLARIS.

(We'll use CONFIG_ARM_V7M for the SysTick device too
when we split it out of the NVIC.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/Makefile.objs           | 2 +-
 default-configs/arm-softmmu.mak | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 8948106..adedd0d 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -24,7 +24,7 @@ obj-$(CONFIG_APIC) += apic.o apic_common.o
 obj-$(CONFIG_ARM_GIC_KVM) += arm_gic_kvm.o
 obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_kvm.o
 obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_its_kvm.o
-obj-$(CONFIG_STELLARIS) += armv7m_nvic.o
+obj-$(CONFIG_ARM_V7M) += armv7m_nvic.o
 obj-$(CONFIG_EXYNOS4) += exynos4210_gic.o exynos4210_combiner.o
 obj-$(CONFIG_GRLIB) += grlib_irqmp.o
 obj-$(CONFIG_IOAPIC) += ioapic.o
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index fdf4089..1e3bd2b 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -42,6 +42,8 @@ CONFIG_ARM11MPCORE=y
 CONFIG_A9MPCORE=y
 CONFIG_A15MPCORE=y
 
+CONFIG_ARM_V7M=y
+
 CONFIG_ARM_GIC=y
 CONFIG_ARM_GIC_KVM=$(CONFIG_KVM)
 CONFIG_ARM_TIMER=y
-- 
2.7.4
