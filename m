Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp6266625wro;
        Tue, 30 Oct 2018 17:26:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fy12fxQGdub6hoGjfcJZOOOpIZyQAKBOpCgLDXtjASK/StQ1yWgvXQgIAKpGh5BI4xdaXB
X-Received: by 2002:a0c:ad47:: with SMTP id v7mr822402qvc.228.1540945580578;
        Tue, 30 Oct 2018 17:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540945580; cv=none;
        d=google.com; s=arc-20160816;
        b=Rmm/ErPnNfBkY7Fi7B3NRhrS/sm6mC4ncved61qNwfOQmGdl9BPGY/MfaI5By2V8Kt
         9p+hSANbmLe4At2JUgwf4iKJ2M1nl8MD54Ruz4Uz6/Lt/iKXCINqvwFmpL4g6TPT3w17
         AQhO/APBD9d/+61P9caJPdZHVem5hTpzh5vx879bX8EGARFvCMfY0+LIG/22l4OSpzsn
         uxlAadlk8KwNYXlhyyMkNNyp8MY0Rded9YsdGywMvcmp9Q2IzsLcbh+r80J2fPttc47M
         9n3quKvoO1JyNPej531jaF3espNSJkujWvPe8BFPpE28UjiZ4uATu/JKqaO8uRHRNrve
         xuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qvcyqYAfKIOVnaIJmiC+ZZMm10xUPzQ+9OesD72K60k=;
        b=WhGNEmw8xkyIJvIAoB8YMW83HNUhPuuMwWfMEYwY7xoErvwpNnT527Ijfii9cFjcJ4
         HUr+a8c2XJEyH4tY09AMD9EwEWAW7K13W5nIxlMVY192gUczgpxzgf1H7u80d+ZEM8K2
         55ooQnF50TSLSfrhcx8+nIdCbET6o0Id4Q8jMkj1ISPmDn1jKU131hQhxv14pAKNzDd+
         hoqmrhoBUvCxxZNRKbNnGcvSPnocvNV0G3ARnkAW4sZPdJqoaKXL7sf4iPv0wKwkINrX
         z8zVHCGGBJC3Wkt3xt5NBLEsystsJHpf3rA+YTD3QCG/dfEJZNu2qdvg4IAWZ+vUxR6z
         iFwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z37si4358556qve.158.2018.10.30.17.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 17:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHeKy-0004oS-0f
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 20:26:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeKe-0004nW-Kj
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 20:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeKd-0000Ai-O0
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 20:26:00 -0400
Received: from steffen-goertz.de ([88.198.119.201]:60408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gHeKd-0000AV-Hd; Tue, 30 Oct 2018 20:25:59 -0400
Received: from gouranga.fios-router.home
	(pool-71-183-97-129.nycmny.fios.verizon.net [71.183.97.129])
	by steffen-goertz.de (Postfix) with ESMTPSA id 8DAC14FB6E;
	Wed, 31 Oct 2018 01:23:24 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Tue, 30 Oct 2018 20:25:18 -0400
Message-Id: <20181031002526.14262-5-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031002526.14262-1-contrib@steffen-goertz.de>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v3 04/13] arm: Instantiate NRF51 random number
 generator
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
X-TUID: dnoXMJUDJZJu

Use RNG in SOC.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
 include/hw/arm/nrf51_soc.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 55f8eaafcb..d2a19b8ead 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -86,6 +86,19 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Er=
ror **errp)
                        qdev_get_gpio_in(DEVICE(&s->cpu),
                        BASE_TO_IRQ(NRF51_UART_BASE)));
=20
+    /* RNG */
+    object_property_set_bool(OBJECT(&s->rng), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0);
+    memory_region_add_subregion_overlap(&s->container, NRF51_RNG_BASE, m=
r, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rng), 0,
+                       qdev_get_gpio_in(DEVICE(&s->cpu),
+                       BASE_TO_IRQ(NRF51_RNG_BASE)));
+
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
     create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
@@ -110,6 +123,9 @@ static void nrf51_soc_init(Object *obj)
                            TYPE_NRF51_UART);
     object_property_add_alias(obj, "serial0", OBJECT(&s->uart), "chardev=
",
                               &error_abort);
+
+    sysbus_init_child_obj(obj, "rng", &s->rng, sizeof(s->rng),
+                           TYPE_NRF51_RNG);
 }
=20
 static Property nrf51_soc_properties[] =3D {
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 73fc92e9a8..9e3ba916bd 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -13,6 +13,7 @@
 #include "hw/sysbus.h"
 #include "hw/arm/armv7m.h"
 #include "hw/char/nrf51_uart.h"
+#include "hw/misc/nrf51_rng.h"
=20
 #define TYPE_NRF51_SOC "nrf51-soc"
 #define NRF51_SOC(obj) \
@@ -26,6 +27,7 @@ typedef struct NRF51State {
     ARMv7MState cpu;
=20
     NRF51UARTState uart;
+    NRF51RNGState rng;
=20
     MemoryRegion iomem;
     MemoryRegion sram;
--=20
2.19.1

