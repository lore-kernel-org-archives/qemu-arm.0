Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp6266688wro;
        Tue, 30 Oct 2018 17:26:27 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f6gJbszUU7RWf6cliUOSLl/gQlgLHdq1GJsWaxkSU0DTUbLT6UhhckOUAeOIjFYHOWVYWK
X-Received: by 2002:a37:a053:: with SMTP id j80mr773588qke.356.1540945587274;
        Tue, 30 Oct 2018 17:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540945587; cv=none;
        d=google.com; s=arc-20160816;
        b=s+9fheFQePDVzrbKne2B8PfuQwSX8V8ghET6q7Qcs/7iiPDZjT0dgz1Aj1bpRQYC1o
         dxFwOXmE+QalLJoba7Wxt+MLjp1jsEw4JM6cFB5lqVmJ1c2dP/iX7R7p64ADR+6JqfQC
         aifLo6Mkyzg9hqPU2lyL6XCIIkcZKr3qpy6budXZ+1jmHvo4nZ0bI/8l85EIIDpnypWS
         EVL0bZCoB3o1dg/XKTHKgw6z2K0cpPWqkWkA7SvbCWptyK9tcHEcLffKpue4yiv39zHJ
         +VCt19INi4vj9RXDAmVyxLWVyuNcuxNnE2kCedW1l/k8G4HCBDSSZhn+tiZyBLnnsPkA
         ni/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+XcvvFOp4SgdHXQjzSG0IwPFoMXLuQnD0ZgQy4w/LQI=;
        b=w/xK1HN3mO9K5KQK0OND7YE36lYa2RPLHt9xDDxE4Hgs6FgIPClC3bMNJu96SVJGrQ
         7eFwLyx/v3F9IG6AsLF4GEEG0QjG0yba1SPcIhQ2qpxXv1k7XKzr/h/WuIZmrl2cikA8
         UGha2/hw9B4o6trPo3ny6qHlz3y4kxpVuw0KSk6fVSmXeHaTCrVheAU29wumt+mtQ0dA
         aLDpSzL/n1/0TmjSheBqkRv0uUkSOHAuvYQ8K+1Gc2/jGv9z0JQ7B/E6tdWdEg2aN89u
         VULo2vqtoZHiC76EURVQdbzxEufSRgKlKGnZwBUAr2UPebh9I0+Hn4wkmCygQkPp529K
         HzQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s124-v6si11701827qkb.246.2018.10.30.17.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 17:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHeL4-0004ub-M4
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 20:26:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeKm-0004sr-89
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 20:26:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeKl-0000Fb-BO
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 20:26:08 -0400
Received: from steffen-goertz.de ([88.198.119.201]:60470)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gHeKl-0000FF-1m; Tue, 30 Oct 2018 20:26:07 -0400
Received: from gouranga.fios-router.home
	(pool-71-183-97-129.nycmny.fios.verizon.net [71.183.97.129])
	by steffen-goertz.de (Postfix) with ESMTPSA id 2EC244FB71;
	Wed, 31 Oct 2018 01:23:32 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Tue, 30 Oct 2018 20:25:23 -0400
Message-Id: <20181031002526.14262-10-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031002526.14262-1-contrib@steffen-goertz.de>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v3 09/13] arm: Instantiate NRF51 general purpose
 I/O
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cP0xhpHgrwnd

Instantiates GPIO peripheral model

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
 include/hw/arm/nrf51_soc.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index fd0efd0ee8..695b335dc5 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -128,6 +128,19 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 2);
     memory_region_add_subregion_overlap(&s->container, NRF51_UICR_BASE, =
mr, 0);
=20
+    /* GPIO */
+    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0);
+    memory_region_add_subregion_overlap(&s->container, NRF51_GPIO_BASE, =
mr, 0);
+
+    /* Pass all GPIOs to the SOC layer so they are available to the boar=
d */
+    qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, NULL);
+
=20
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
@@ -157,6 +170,9 @@ static void nrf51_soc_init(Object *obj)
=20
     sysbus_init_child_obj(obj, "nvm", &s->nvm, sizeof(s->nvm), TYPE_NRF5=
1_NVM);
=20
+    sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio),
+                          TYPE_NRF51_GPIO);
+
 }
=20
 static Property nrf51_soc_properties[] =3D {
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index c3f4d5bcdc..d4a48ccf91 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -15,6 +15,7 @@
 #include "hw/char/nrf51_uart.h"
 #include "hw/misc/nrf51_rng.h"
 #include "hw/nvram/nrf51_nvm.h"
+#include "hw/gpio/nrf51_gpio.h"
=20
 #define TYPE_NRF51_SOC "nrf51-soc"
 #define NRF51_SOC(obj) \
@@ -30,6 +31,7 @@ typedef struct NRF51State {
     NRF51UARTState uart;
     NRF51RNGState rng;
     NRF51NVMState nvm;
+    NRF51GPIOState gpio;
=20
     MemoryRegion iomem;
     MemoryRegion sram;
--=20
2.19.1

