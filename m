Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2358544wro;
        Fri, 2 Nov 2018 10:11:55 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cj1ugrHIfCGXk3AWf6HwZ1NyZNDqgMek1dM5fb98QGb2cWK18UzzbJxOjnALkDAcOLnXe8
X-Received: by 2002:aed:3445:: with SMTP id w63-v6mr11606338qtd.346.1541178715106;
        Fri, 02 Nov 2018 10:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541178715; cv=none;
        d=google.com; s=arc-20160816;
        b=cYxPTmOBkTKskY+psprzpNzylNTq2GEc9VeG8oCVDtDUGdXo9UdwnRKT0O8f7sVbOR
         Bv820PvPJ4iTl/+MMPYlUu/EziWbR7EaRBPd0GH82bTOygqqnXN1L+C1EBCLeO52q86M
         koNem29gjuKY9fpOA6d+pcV/8WpdrSLTqLT6C53Y7mudoON1ISS6MnYRqtyFlLuAmkas
         dtuo0jIGKBwAPbEdxT4re6+Ynobhr9h3mxyOyt4NTiE3Tjz1HQ0jPIoOeD2V10umX+d4
         0ZXH0lBktGqkr58reusmXhrGMOmWnYcmpri9atUXekfxZ1G/G0bxnHxFnWae6kkd5itx
         tRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EUf3OG1Ce6A+C6iHJGY96p5TMCy6Rb/SLCVVy1v2Cv4=;
        b=gu/Co+X9BOrdti5+Snp5D3XeDhmEGuu5Xdp86ttmQRDXTho8IW2LDERsFLf1tdvPKz
         OgEGcsgDiiwHsiXsJRZWh2WUTVJVEfbnR6JTID8F1rlHJQlCc7ISuG4kNk2R2xDGTxOA
         zlVvyVB94tUG/6TBviR+3vtcvaMQM9XHWvQ6Lsmh0uaXuPmGjx2Vb8WXUzW1q3HjyKi5
         HabfphGzihEnkgqneeLz8ByqcqEmCiQrsICA3WOxhNRLMHBuRh2nLj4+41RehBOtGJsx
         HvSgpZ41HTm/+V7U3JQ0E7kf2xXFc/EOnJvOO8o3v9c23RJZG84BWi8CdDP1vu56lv4N
         uxYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s64-v6si6724631qkd.110.2018.11.02.10.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 10:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIczC-0001iA-HI
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 13:11:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvw-0007dU-Qw
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvl-0004e2-J3
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:23 -0400
Received: from steffen-goertz.de ([88.198.119.201]:33358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gIcvj-0004RS-6Z; Fri, 02 Nov 2018 13:08:19 -0400
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 28E9A4FF68;
	Fri,  2 Nov 2018 18:05:05 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:07:26 -0400
Message-Id: <20181102170730.12432-10-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102170730.12432-1-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v4 09/13] arm: Instantiate NRF51 general purpose
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
X-TUID: Fm0nVuKhtk/f

Instantiates GPIO peripheral model

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
 include/hw/arm/nrf51_soc.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index d11bb2b99f..2c4e80892b 100644
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

