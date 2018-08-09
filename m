Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1874253wru;
        Thu, 9 Aug 2018 06:03:43 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxRfqjAeI0vHaybaTIBJntRX+LCSaj0Vf7LKHDAqw0y3w5n1fG+9fa4hrV1u5xjei5uE35y
X-Received: by 2002:a0c:fa4e:: with SMTP id k14-v6mr1671615qvo.35.1533819823816;
        Thu, 09 Aug 2018 06:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819823; cv=none;
        d=google.com; s=arc-20160816;
        b=gdb2uieM0kmMF/T2aZtc9YnunEe6yCf7jAZ4CzC+2CR8IyB2ON3ooNAxAnQl7gmq5a
         GSRVjwTZMMZm7gz2jV0JkL2dSBBVGI1+kcBwbX/Opd9ejaG0PE3hyjkZ/U5Csp9Ezu0n
         wliH7IcJSWBz+4UcArufVojH57H41P4iz6+Pa5nC12fmInhQXageMG3teK3Cai9p7yYt
         IwaVwkqsG2/ntBtYmXWFkHpPWsgUvrotpErxnPjtPtDLHvOojXRd630K8UpCP6+hRVp9
         K70NgfZfaJursB0Vw0C22Ko4+QEyXzIazMIb4zbTPci97sCiudon4n4TnKkeTsv0csUb
         yu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=a3Zao1ZvQ3fjlmo0uyayNuSe423Fh21AC+fuAiIKCQk=;
        b=m3GaVLKlmBYVLI6HIykTKKSvTVlwKe9/2S5teWvupsz6e60sqTr02XBxM2dMKVtDBy
         a+toau2OsiTzNmOJj9mwA0m6EDuJAdoezYg70VmDCK4T4CT5YyM0BeDhPPew8dtGcBa9
         8/KG/yOiy9k/0ID2y0tZvtTqEthTQvcez5dvc835HXUIJOdG3MbZ3Ue1VGfaFruz4WbA
         g4bMYIV5XGhUhh5j/XXc5MNqecl3oShVVq6Ap54/R5qQTFGmyEBM/t+6vYyBOUeDtrr3
         uhxzI5IXbEl0Wc049RbAwC/3P4DTVqqLMKSq91bOS1cUaQpZHw2sQvhVUcGtPFq/y7z4
         WKPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p69-v6si4252470qvp.269.2018.08.09.06.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkbP-0007UZ-8q
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:03:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZL-0005vN-Rs
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZH-0003Ir-Oa
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZH-0003Gd-G7; Thu, 09 Aug 2018 09:01:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZ6-0003FV-P9; Thu, 09 Aug 2018 14:01:20 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:01 +0100
Message-Id: <20180809130115.28951-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 02/16] nvic: Expose NMI line
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xJXM9vurGgtj

On real v7M hardware, the NMI line is an externally visible signal
that an SoC or board can toggle to assert an NMI. Expose it in
our QEMU NVIC and armv7m container objects so that a board model
can wire it up if it needs to.

In particular, the MPS2 watchdog is wired to NMI.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c       |  1 +
 hw/intc/armv7m_nvic.c | 19 +++++++++++++++++++
 hw/intc/trace-events  |  1 +
 3 files changed, 21 insertions(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 6b076660574..66217a6053a 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -202,6 +202,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
      */
     qdev_pass_gpios(DEVICE(&s->nvic), dev, NULL);
     qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
+    qdev_pass_gpios(DEVICE(&s->nvic), dev, "NMI");
 
     /* Wire the NVIC up to the CPU */
     sbd = SYS_BUS_DEVICE(&s->nvic);
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index cd1e7f17299..be7771e9d1f 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -772,6 +772,24 @@ static void set_irq_level(void *opaque, int n, int level)
     }
 }
 
+/* callback when external NMI line is changed */
+static void nvic_nmi_trigger(void *opaque, int n, int level)
+{
+    NVICState *s = opaque;
+
+    trace_nvic_set_nmi_level(level);
+
+    /*
+     * The architecture doesn't specify whether NMI should share
+     * the normal-interrupt behaviour of being resampled on
+     * exception handler return. We choose not to, so just
+     * set NMI pending here and don't track the current level.
+     */
+    if (level) {
+        armv7m_nvic_set_pending(s, ARMV7M_EXCP_NMI, false);
+    }
+}
+
 static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
 {
     ARMCPU *cpu = s->cpu;
@@ -2310,6 +2328,7 @@ static void armv7m_nvic_instance_init(Object *obj)
     qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
     qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger",
                             M_REG_NUM_BANKS);
+    qdev_init_gpio_in_named(dev, nvic_nmi_trigger, "NMI", 1);
 }
 
 static void armv7m_nvic_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 5fb18e65c97..33e932fb918 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -184,6 +184,7 @@ nvic_acknowledge_irq(int irq, int prio) "NVIC acknowledge IRQ: %d now active (pr
 nvic_get_pending_irq_info(int irq, bool secure) "NVIC next IRQ %d: targets_secure: %d"
 nvic_complete_irq(int irq, bool secure) "NVIC complete IRQ %d (secure %d)"
 nvic_set_irq_level(int irq, int level) "NVIC external irq %d level set to %d"
+nvic_set_nmi_level(int level) "NVIC external NMI level set to %d"
 nvic_sysreg_read(uint64_t addr, uint32_t value, unsigned size) "NVIC sysreg read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 nvic_sysreg_write(uint64_t addr, uint32_t value, unsigned size) "NVIC sysreg write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 
-- 
2.17.1

