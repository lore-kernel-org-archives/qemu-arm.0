Received: by 10.28.71.27 with SMTP id u27csp1372066wma;
        Tue, 20 Feb 2018 10:04:02 -0800 (PST)
X-Google-Smtp-Source: AH8x227c50bELPjdyghhH0U6hOooez/68JzEm1KA4GoQ5WNSrNJT1zPBb/PWviMUT98RmsNoL7OV
X-Received: by 2002:a25:4d82:: with SMTP id a124-v6mr409999ybb.329.1519149842641;
        Tue, 20 Feb 2018 10:04:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519149842; cv=none;
        d=google.com; s=arc-20160816;
        b=sbSX8Nmm5Z4zTy0jYVqx/WjdRogLjVCNUlfFsKPh4lixg3lCaHXsiRusg+TmPMFndk
         khA2hyG91arzDIbB/BU9bPVEqAz/IU0tUFE4P5rKaJVKMx42HTd0CxM9tS0C4IBzBEIR
         8Kyq5udodxomhzyOi6t1Iay8Ny9Hmhf3NNGt6yZCvdIqt8MeTUKgu5ROtzZ4CWf2zQ3x
         GllGRs30rWEapfLHqzYqeGGkEKMY8PkhRAfCxA31XRXiwh0rhNAG9L7EyS5/Ly+e9Tho
         pqulGxjr0LRyshhJCNULQo6dz5zfZC993i2wO3UHcRDKOGG8XhjVJz+MlQP99iv341Z/
         4DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=r/phLS6OwwUEfyUsfYa81/e3KeqoOghb4ueFpEE3xBw=;
        b=GIfr7dZc38+GA25J+g2AgvTyDEzARWnasMs9MP0XtJiQbwMRtQafsWyy9vu1R3JrRG
         Y53y+bIqCWHKp+qqeWd4sAEjY7VgFhNwmuDIWYVXFi3tmFhKCwNq4T0b9hDxiV/12c/V
         JX/XS50Lm8Hqs3ybLyZPTliwEu1npmHcBi81jli8yqLCtlcUvyJblahTwfZpsaRrYZY3
         WMNj15Ky8iwuJ8tAl1VkDdr2HvOTqpsMGtM8t2oXh+pGZi0+nIJzJqwTh7yX2w7jFbTm
         ttxsAz2u7Zu5uvfK2AYUy4lGdUCb0KjnE3kHHxFX+94HMfzgpUqXCh0f9DzrwFlCryds
         SFHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1si553641ybn.562.2018.02.20.10.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCGo-0008BW-3h
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:04:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGS-00088u-VR
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGS-0001cJ-42
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:41 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46524)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGR-0001WQ-Tu; Tue, 20 Feb 2018 13:03:40 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGM-0008Se-8H; Tue, 20 Feb 2018 18:03:34 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:17 +0000
Message-Id: <20180220180325.29818-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 11/19] qdev: Add new
 qdev_init_gpio_in_named_with_opaque()
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
X-TUID: tJTaz68Blez5

The function qdev_init_gpio_in_named() passes the DeviceState pointer
as the opaque data pointor for the irq handler function.  Usually
this is what you want, but in some cases it would be helpful to use
some other data pointer.

Add a new function qdev_init_gpio_in_named_with_opaque() which allows
the caller to specify the data pointer they want.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/qdev-core.h | 30 ++++++++++++++++++++++++++++--
 hw/core/qdev.c         |  8 +++++---
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index fc9d617a76..9453588160 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -311,10 +311,36 @@ BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
 /* GPIO inputs also double as IRQ sinks.  */
 void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
 void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
-void qdev_init_gpio_in_named(DeviceState *dev, qemu_irq_handler handler,
-                             const char *name, int n);
 void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
                               const char *name, int n);
+/**
+ * qdev_init_gpio_in_named_with_opaque: create an array of input GPIO lines
+ *   for the specified device
+ *
+ * @dev: Device to create input GPIOs for
+ * @handler: Function to call when GPIO line value is set
+ * @opaque: Opaque data pointer to pass to @handler
+ * @name: Name of the GPIO input (must be unique for this device)
+ * @n: Number of GPIO lines in this input set
+ */
+void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
+                                         qemu_irq_handler handler,
+                                         void *opaque,
+                                         const char *name, int n);
+
+/**
+ * qdev_init_gpio_in_named: create an array of input GPIO lines
+ *   for the specified device
+ *
+ * Like qdev_init_gpio_in_named_with_opaque(), but the opaque pointer
+ * passed to the handler is @dev (which is the most commonly desired behaviour).
+ */
+static inline void qdev_init_gpio_in_named(DeviceState *dev,
+                                           qemu_irq_handler handler,
+                                           const char *name, int n)
+{
+    qdev_init_gpio_in_named_with_opaque(dev, handler, dev, name, n);
+}
 
 void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
                      const char *name);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 7ed1f431f0..f3754ee606 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -385,15 +385,17 @@ static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
     return ngl;
 }
 
-void qdev_init_gpio_in_named(DeviceState *dev, qemu_irq_handler handler,
-                             const char *name, int n)
+void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
+                                         qemu_irq_handler handler,
+                                         void *opaque,
+                                         const char *name, int n)
 {
     int i;
     NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
 
     assert(gpio_list->num_out == 0 || !name);
     gpio_list->in = qemu_extend_irqs(gpio_list->in, gpio_list->num_in, handler,
-                                     dev, n);
+                                     opaque, n);
 
     if (!name) {
         name = "unnamed-gpio-in";
-- 
2.16.1

