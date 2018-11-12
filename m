Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3622669wrw;
        Mon, 12 Nov 2018 13:48:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5fa4JTD7jMaCs7yl2JJrnb0uX/lNMNe1vkbu1P30YiH+SCdX0QH/VSzjYO90kOB0VPwCCsN
X-Received: by 2002:ac8:c42:: with SMTP id l2mr2683229qti.68.1542059330299;
        Mon, 12 Nov 2018 13:48:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542059330; cv=none;
        d=google.com; s=arc-20160816;
        b=x//VwsmDpFgR6TyO2a1y3Ksl0lQC1apFs4UqoSCSrDtxo9n4oXRkCoryGfHaIFZc97
         cAX2FhreJa0x7vQcp3jYEh6yg6HCgPh5P+H8s3I/njXbqCK2ATxi1iKldtkyCx+0w4hE
         SleOHMByCeRwltnQOHdeJ6sKHBAf3N0+8yN8Jnu15Za6gtzqZ183xd3xYw5BA9x/dqac
         Mf0T4kQ4SoTVjAJPICDTKfesKmbFgSzLYwnFlagssDggUBR5rRHGCF2HV4CIuQtVuhbj
         yQ129VyI2CIKJl3ygnPFd0CzOODM3jmB+o0JAGCS4UIBOm3oq4mIP/AlUg6+SwF00QZq
         ivIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5Lf8ASvUOJAfircx70FoGion5X3uKWnGOappO7lTzMM=;
        b=eaclzBWjLSI+/Nzx/4jcd3FhYj2EjgW9qgPMXfXFMKYRIGbvMLCSwnGH0FCxwGNOdb
         hx9MyGbInwVVJYeWpsUoev8rTX3EJS86xFFD5hB6amBLge8Q8rIkyoVJsp19IvoLNQWW
         5KiVaOGwpYzJjSO76fP0y8eIpQ6oWYR9k/hc5Tg/kNI2OAo4Ds/5iJwi3Ms7iPAUfc2m
         LwMnVlgyU1UA/aFMuVqJwWm0DfGkdV9akY4PbDw2cM7kG6Dvjihl/77z8J0cRFBDK/oN
         3AZy6vqeDpI9+b0e9g5a07Mm6Ucuy7EEcPAVi//qkFqS5Gh/EwihGKC9wZpd4NP4uNt6
         wIkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b20si2576329qvd.185.2018.11.12.13.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 13:48:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMK4f-0005Hc-KF
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 16:48:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJyw-0006aj-JW
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 16:42:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJyu-0002gt-JV
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 16:42:54 -0500
Received: from steffen-goertz.de ([88.198.119.201]:35580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gMJyk-0002bo-Ij; Mon, 12 Nov 2018 16:42:42 -0500
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 3614D50721;
	Mon, 12 Nov 2018 22:39:39 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Mon, 12 Nov 2018 16:42:19 -0500
Message-Id: <20181112214224.31560-10-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181112214224.31560-1-contrib@steffen-goertz.de>
References: <20181112214224.31560-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-devel] [PATCH v5 09/14] arm: Instantiate NRF51 general
 purpose I/O
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kXJMgk1t08/v

Instantiates GPIO peripheral model

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
 include/hw/arm/nrf51_soc.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index e6956f9ef7..893627b7aa 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -116,6 +116,19 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 3);
     memory_region_add_subregion_overlap(&s->container, NRF51_FLASH_BASE,=
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
@@ -145,6 +158,9 @@ static void nrf51_soc_init(Object *obj)
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

