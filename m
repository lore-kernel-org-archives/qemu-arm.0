Received: by 10.223.159.74 with SMTP id f10csp7097888wrg;
        Thu, 14 Dec 2017 19:27:23 -0800 (PST)
X-Google-Smtp-Source: ACJfBoufVGpDfyTBHkcw6wvI+xmGrHM4vMmp1Q5mu6VVnNiWFi8DEIAEfW8Ya4SA1JK7lMKdHZ29
X-Received: by 10.37.30.67 with SMTP id e64mr6187046ybe.103.1513308443761;
        Thu, 14 Dec 2017 19:27:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308443; cv=none;
        d=google.com; s=arc-20160816;
        b=Pnglk/rOCCdYnFcZTDMhNEcWoP6ythEgME2Lb6e/lTqZWjmY55bR5JrRIwo9q4i3wi
         XZ8RkJPJn2Rb5ZxL8WMIpJ47s1BkUrCRGeWEqaOdrtm/xqBjVpOLUMIIG0dsl8211xvr
         iXo8f80bT2IO18dZTeCXGd3/GQRE3V+SWEG/gLnz7tWTKr0Sc3JTuKxlpS4dpoffbD18
         cbxJLRWGIDn56VRYQa0SFmToEFzhnZWoDLRAdKw3E+53R357mv1yLzeSS0Xr53DFnaWd
         EEl2aziuJcJWEYUD7Q/kcivwTMbXw5SXTlU18RR+bb6Wgv328ebcIRdCdSUMGdiiZYEy
         KOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zes/jb4Dku/t/AmsOnoqfoFwjMmRtq2tqQZKTu6q+GA=;
        b=yxfbgyIWCZsZwSz+vvMx4uG8kFl46K7z4qcjepCEyEyqRYUqmK2VSu1gqWhH4UTdxX
         Fnv6rKgytU6sTMLfqEmDgpJS7dAYLeqSUsxNzv5Ty4u9OiwIhaBYvtG+2lmk0wntb6Vq
         wmJp7ZikBGvHpyo4me3IIQPbGQQVBoiD9fD2W29WwCE7pUKgspiSsD7vQEgFb+o6tGBK
         Ane0ZpCfi8TMsPJsZAwy3ZG4sQf0kw4LItQ4TIsfkUNnuVPonO2tZtdlNJc6GojNjZ0X
         xYjOCgoei8FhVp5VdfoebWVMqQRcgrZvl71D4YAjRl+au95N+BjSPUFbROo/n8/Y7LL+
         kwPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ikxryglH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 84si1093658ybo.143.2017.12.14.19.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:27:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ikxryglH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgeh-0006wz-4W
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:27:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUs-0006Ll-HU
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:17:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUr-0001hv-EM
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:17:14 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:42285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUp-0001fY-0L; Thu, 14 Dec 2017 22:17:11 -0500
Received: by mail-qt0-x242.google.com with SMTP id g9so10580121qth.9;
	Thu, 14 Dec 2017 19:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zes/jb4Dku/t/AmsOnoqfoFwjMmRtq2tqQZKTu6q+GA=;
	b=ikxryglHQ7im36Ys6/tZBGXcPXNhLQqo3meG4VEdEu6grZAgdi4zYacNnGBVLvVU4d
	E8JJnzrdIV0HL3NSpkir6Edt0kmTXlCRy/8uDQtKIneLZht5rQavhCdQclZRuVCLo9uA
	V45H4UKkFL4pDl5i51x8n5qMPlxBnbyyA1ethOQKIGNIeeVfzyLfmLHnWKYfmXLYc0El
	7ea+zXu+GV0fmqz/Suj6FjQM67RxBf0cKquT04IiljIZrhiBiUy4Xfr2nAVdmhRO79Lp
	kPZcIKC/itXwsm3KEVLc+HE7eo8QsFbXtCksoU0+J0ucB4l+OUB3ObZNomRXp2fb0c4+
	nYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zes/jb4Dku/t/AmsOnoqfoFwjMmRtq2tqQZKTu6q+GA=;
	b=f5KbmXY7ceJApiTvf8IWfaeETYLkHIBnameQnmXL09Tm1rqbrpSS7F/8x5GElRNNqZ
	RANq/ysf8sCyiy5hLAv4xmz3MDZbGerKcHufSntFW3Z4MLxfaktnA8qnSzj6rAD8jcJ8
	UFPfTH+CpDl7jkkCgwlKpkzwXX1EElXbKvI+fqznPGSvqVbP9PqDzNXo/YVi3UhKqcix
	jUFTERDY8y5w8vEjueB5tSk9bLFmzjohxQFc6pt29CngRGhEiLR+y6qkT3L8jGmK55pQ
	yjPsyklMa9+KsPX+ibXI9C4t2Ab1INzg8tBzZZE4UPvu7oCWSTgLc6e2Yg2RuiyhrSVu
	aJ/w==
X-Gm-Message-State: AKGB3mJ3IceX72Mfh2ZKLjJWIICkUGwb8q9kMu8BOQCRk9UlX9dVgxI7
	zyMvGUgFzmqOBMFCVnYsNco=
X-Received: by 10.200.23.221 with SMTP id r29mr20489262qtk.27.1513307830570;
	Thu, 14 Dec 2017 19:17:10 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.17.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:17:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:42 -0300
Message-Id: <20171215031547.31006-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v2 15/20] sdhci: some ARM boards do support
 SD_HOST_SPECv3_VERS
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T5T0AaCHsRL/

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
index 12e0dd11af..ea57b3ecac 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -269,6 +269,13 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
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
index 1836a4ed45..22e909afc9 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -248,6 +248,7 @@ static void zynq_init(MachineState *machine)
     gem_init(&nd_table[1], 0xE000C000, pic[77-IRQ_OFFSET]);
 
     dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
+    qdev_prop_set_uint8(dev, "sd-spec-version", SD_HOST_SPECv3_VERS);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
@@ -259,6 +260,7 @@ static void zynq_init(MachineState *machine)
     object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
 
     dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
+    qdev_prop_set_uint8(dev, "sd-spec-version", SD_HOST_SPECv3_VERS);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
-- 
2.15.1

