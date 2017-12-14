Received: by 10.223.159.74 with SMTP id f10csp5780197wrg;
        Wed, 13 Dec 2017 18:03:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBoutJ0vpsLG83RC3QR2FJ9F1RhbrXRryE5E32h3yhd1ayEm20Rz+4p4mAFFA8jvNXtYHK6RF
X-Received: by 10.13.232.17 with SMTP id r17mr3311694ywe.396.1513216985023;
        Wed, 13 Dec 2017 18:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513216985; cv=none;
        d=google.com; s=arc-20160816;
        b=IitM85+Ng6BFl0PzazQemHlTYpePLfL74pk2L/PT5Aa7KsO2uJDllJIPZBi9gLPLLe
         XsdMDwsXQaU1dCjCMogXVFWU+/s09QCjP7gVMWw6kkw3VyyU3wKX9iIV5r/+IKW5vM3I
         yEs0kKEHYnm6t8TMYRgEKp/iOON+c5vEZo+BYsIYhnkYlFBuOvAXiCO0zjIYgV0ICVeq
         rIECb/9jqBaPfXIuptwEjDc33vfx+WfswhYiRG6BhgYabxoCMNkf5RCb5wHjC/GQa59l
         vBoniRtFhuft69tFlhyD+B5Ww68yrCo2ZFxCPLsouk2U/Xb+D9MsSmWhTR3ZAMLQvehp
         Masw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=STuR0bh52QufBMsHBr1SwVtA6kUM3U3tjEvi5j6Pkto=;
        b=O1YXS/415FotQIAJLiEcd3wrjbezj8GrORBEE5lAZZCrBkouH865I055Df2D11Wybg
         BH2x1L2m8WYwdPrD6Ged9mpkCVDwuVjIAJHqA22z00O8AoeG1xA4ZDW/ITo+JvcIkE3F
         LTBy3Wg502RLYCznVbwNJvfIAE7XV5bqwVjbQb87IwuyIoL/ArisQ3aTuxV9x+nrXQzC
         qb+DgKJioBUgHWKyuR4EJGTqA8JrQ47q84V6TZ8I872haQ8oFaCsv8lv14Bbd4Uvvq12
         YMbpPgEjVnmyhzqe4k6vx4I4bU93wJnPqeaE9MH3bQDURdCBNJ2sQuBkWvGtLWz2dIZr
         tgHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S24vFKDl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t144si619706ywe.397.2017.12.13.18.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 18:03:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S24vFKDl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePIrY-0007AG-DA
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 21:03:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpO-0005ma-Ih
	for qemu-devel@nongnu.org; Wed, 13 Dec 2017 21:00:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpL-0003Tf-H6
	for qemu-devel@nongnu.org; Wed, 13 Dec 2017 21:00:50 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:41858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpL-0003TE-CA; Wed, 13 Dec 2017 21:00:47 -0500
Received: by mail-qt0-x243.google.com with SMTP id i40so6199096qti.8;
	Wed, 13 Dec 2017 18:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=STuR0bh52QufBMsHBr1SwVtA6kUM3U3tjEvi5j6Pkto=;
	b=S24vFKDlgv8rtga6FzlpP1OkHYCaH9XWXPvEiwqRSkAfEZIVWyKjJqCNgOdHD9Wx94
	gGEc6deHCXCojDkisIjTeoEQcfPkeG4c8zvqRZr2lOm6B0LNsUQVMGecxDvSQUbp3cnd
	WiAvwe8+Xz4RO0qzYokTZI+iGFPxr0e072VTtfWQvAo7IWDzVN0bHAGBNqCXWplojzmg
	YABRHTxDZdfdj6acWHRoRoiqe/EI1obL9VR3Ih/PQdVpTczW4Qj3lPVE5EgchoFxGfNT
	8N3NnW3PF6By9rrhjz0hyYwvNlc/vI/WP96uFJitfsOO0BQsJchWf2yAKGPy4C5YDCFu
	Xbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=STuR0bh52QufBMsHBr1SwVtA6kUM3U3tjEvi5j6Pkto=;
	b=DNiE11gh7cLKZUtFiPQkmNMJVxSC2uFHUtQ4fj4vMmKF3tHU2TftPZ9QlANwZmncuC
	bYgL2fovGI2V+jxKL3WVrygdo1hRNPAIJocyo8FjVDUncxAUOM7FIFZyvR6JMXwgMvjd
	h8Al5S5Gr34TuTW/qiYrF8h8lxp6ixfPGElD+HeNlkeRQ19mmF+/N93GypCqZ65zL4HX
	KVvGayXO4p/29SG+8pB75gQ52niCkTL3Yg3Gk6lYHzh8mZk2c6WIMG+2dxXuO40OUmLQ
	xibAz4BK2WCuLHIDNTH4vB+vmi7+P+sfgMoJ2ZaF3ViRL7t3+1U/fSU5Nb/tRvHAIn07
	1CUA==
X-Gm-Message-State: AKGB3mJI+RRsgYXeYiLTANbdtberCxA5lXdPPWl/hOU28N2WJBraGA99
	waSe+/YOab82i+voJ9UDINo=
X-Received: by 10.237.63.121 with SMTP id q54mr14367493qtf.337.1513216846739; 
	Wed, 13 Dec 2017 18:00:46 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	n39sm1938120qtn.95.2017.12.13.18.00.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 18:00:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 13 Dec 2017 23:00:19 -0300
Message-Id: <20171214020025.4004-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171214020025.4004-1-f4bug@amsat.org>
References: <20171214020025.4004-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH 2/8] sdhci: some ARM boards do support
 SD_HOST_SPECv3_VERS
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zeWpKmGC4f23

set the property with object_property_set_uint() or qdev_prop_set_uint8().

[Zynq part based on a patch from Alistair Francis <alistair.francis@xilinx.com>
 from qemu/xilinx tag xilinx-v2015.2]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 7 +++++++
 hw/arm/fsl-imx6.c            | 6 ++++++
 hw/arm/xilinx_zynq.c         | 2 ++
 3 files changed, 15 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 60a0eec4d1..e686725015 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -264,6 +264,13 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    object_property_set_uint(OBJECT(&s->sdhci), SD_HOST_SPECv3_VERS,
+                             "sd-spec-version", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 59ef33efa9..c474e707af 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -348,6 +348,12 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
 
+        object_property_set_uint(OBJECT(&s->esdhc[i]), SD_HOST_SPECv3_VERS,
+                                 "sd-spec-version", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 9275ae6daf..0292feea74 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -250,6 +250,7 @@ static void zynq_init(MachineState *machine)
 
     dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
     qdev_prop_set_string(dev, "sd-bus-name", "sd.0");
+    qdev_prop_set_uint8(dev, "sd-spec-version", SD_HOST_SPECv3_VERS);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
@@ -262,6 +263,7 @@ static void zynq_init(MachineState *machine)
     object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
 
     dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
+    qdev_prop_set_uint8(dev, "sd-spec-version", SD_HOST_SPECv3_VERS);
     qdev_prop_set_string(dev, "sd-bus-name", "sd.1");
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
-- 
2.15.1

