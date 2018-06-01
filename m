Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp792111wre;
        Fri, 1 Jun 2018 09:06:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLQ75Zuz8+nriypRg8E+8WYnVhesKTppZroQTrGeCIaEbVXBxydmleIgIUARx/zsAOk5AAg
X-Received: by 2002:a0c:d0eb:: with SMTP id b40-v6mr3651754qvh.236.1527869169457;
        Fri, 01 Jun 2018 09:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527869169; cv=none;
        d=google.com; s=arc-20160816;
        b=pG1jl/TSfxnlRf12chpxcUsTG5ScBYuQmhjBbV1kQTP7qlO3NbZbfMnk9jMYJVewwk
         drBSCdmVpX6a7o1CZzAHI1Q5F/1xOCvBq7J+G2SfxJKXENfHR04X6OaSKnnUoP3WP0Pd
         ZPn+iquzpUqw1jnS0p+PVh7Lgumj43w7UwYCqhBy8vTLUYSgTNDb0CDO9Bdc4hMcrCXm
         1+ywAXb1MuIfmKucrVavEUDrR78MBytWgSgRTB1zJbZLRP3tGFk/duOd+ix8zjLNejnW
         UV3+j7hCS8lVmcC0buvDw37kNkiJ6cL3sdtFFHB2e49W8mrAOU2pm4uzDrZfGa6woqwS
         Hb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=ywHXxQ6ZiR7ZmT8vKEXfdz1Mg0UmTguDg6EqW61U0GY=;
        b=xaRn1560FgZw0Nh5ZRhqzpmln+2E7v5dLNhazNeKsm0nLs3VAKPF5YdV2cWmCLasVO
         s/k08B+ogxW5uXfQLXHvKMqm3l4hZhHsphw5sm+TikHpFDQFn75EV6FPIIYhm+o88CRH
         dFQVO3/1JB8k5iqB8m8oB/Xe4UQsrnbjA/cUjqcRsdZIwmwaZglYbI2/vsadzt/wcspF
         JDeQA38MEhbwI0comJ5oQMP1TluO//g2ErmdRSZzp+ghVO3Eh/zoh8FGDJlkF0HRNJYs
         mdNxOb3wqwiR9UoJjC2PJ/OwaAfiL+sSVi6znw6d9adtrOYNon8B/JxFB1XPaCvK8ZdO
         d5ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2-v6si2773607qvl.34.2018.06.01.09.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 09:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOmZ6-0007EH-TM
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 12:06:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fOmX2-0005h4-IP
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 12:04:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fOmX1-0002D3-G5
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 12:04:00 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42446)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fOmX1-0002Bn-8C; Fri, 01 Jun 2018 12:03:59 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fOmWy-0004DE-Lv; Fri, 01 Jun 2018 17:03:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  1 Jun 2018 17:03:55 +0100
Message-Id: <20180601160355.15393-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] arm: Don't crash if user tries to use a Cortex-M
 CPU without an NVIC
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
X-TUID: GcBqbSYoEmIy

The Cortex-M CPU and its NVIC are two intimately intertwined parts of
the same hardware; it is not possible to use one without the other.
Unfortunately a lot of our board models don't do any sanity checking
on the CPU type the user asks for, so a command line like
    qemu-system-arm -M versatilepb -cpu cortex-m3
will create an M3 without an NVIC, and coredump immediately.
In the other direction, trying a non-M-profile CPU in an M-profile
board won't blow up, but doesn't do anything useful either:
    qemu-system-arm -M lm3s6965evb -cpu arm926

Add some checking in the NVIC and CPU realize functions that the
user isn't trying to use an NVIC without an M-profile CPU or
an M-profile CPU without an NVIC, so we can produce a helpful
error message rather than a core dump.

Fixes: https://bugs.launchpad.net/qemu/+bug/1766896
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c       |  7 ++++++-
 hw/intc/armv7m_nvic.c |  6 +++++-
 target/arm/cpu.c      | 18 ++++++++++++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index a4ab7d2069..9e00d4037c 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -178,6 +178,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+
+    /* Tell the CPU where the NVIC is; it will fail realize if it doesn't
+     * have one.
+     */
+    s->cpu->env.nvic = &s->nvic;
+
     object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -202,7 +208,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     sbd = SYS_BUS_DEVICE(&s->nvic);
     sysbus_connect_irq(sbd, 0,
                        qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
-    s->cpu->env.nvic = &s->nvic;
 
     memory_region_add_subregion(&s->container, 0xe000e000,
                                 sysbus_mmio_get_region(sbd, 0));
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c51151fa8a..661be8878a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2183,7 +2183,11 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     int regionlen;
 
     s->cpu = ARM_CPU(qemu_get_cpu(0));
-    assert(s->cpu);
+
+    if (!s->cpu || !arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
+        error_setg(errp, "The NVIC can only be used with a Cortex-M CPU");
+        return;
+    }
 
     if (s->num_irq > NVIC_MAX_IRQ) {
         error_setg(errp, "num-irq %d exceeds NVIC maximum", s->num_irq);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d60893a07..eda1ce14fc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -767,6 +767,24 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+#ifndef CONFIG_USER_ONLY
+    /* The NVIC and M-profile CPU are two halves of a single piece of
+     * hardware; trying to use one without the other is a command line
+     * error and will result in segfaults if not caught here.
+     */
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        if (!env->nvic) {
+            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
+            return;
+        }
+    } else {
+        if (env->nvic) {
+            error_setg(errp, "This board can only be used with Cortex-M CPUs");
+            return;
+        }
+    }
+#endif
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.17.1

