Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2355960wro;
        Fri, 2 Nov 2018 10:09:30 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cAVKK9lLxH5tDU4UcJJ4D1v73iFWja5ziqRg1p0bFH/438K+5ClnX1HjxmCoGz9uiilBBv
X-Received: by 2002:ac8:4454:: with SMTP id m20mr11327065qtn.381.1541178570396;
        Fri, 02 Nov 2018 10:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541178570; cv=none;
        d=google.com; s=arc-20160816;
        b=FyTs2hRsmurFTFZWnpgPzoRDzTRNKkf+lDR+LTidNOwOeBBtXS5YIeOkHL4fTob2BE
         lVsjyOPfMdTZrpDpXqODwRN8gTA+qQn5zK2Ck5AjfHk2uJsGnVDKPoLshTBP6I6tT5xh
         ayAqxUchRj/ho9lmE7v92yoXWdUA3YonxhoFpEgevhgbFA68aTJNZiZXUQ44AIxs1mO/
         i0PifmBXmcxUZnLoy6S3kc2C68yp9E3rKCABj818eIAy+OJxQ+k42ww56EhuxZzGQJfI
         npoUcm581is5TZSU5KWL3xjTnOcy19OKJeAJSHA0Oxpu9yxMsbt/9MME3ZtFezhWMDk1
         yMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HufpSap332FYHaOI4rqywXeODixlyedBUkHXfchb8Jg=;
        b=f2/RT19c9nSy/BY4dYWUmfk+1jAQp0pBYQ8Q/iTgRf6pAbsAFp5hzKGPoofLNW7sxw
         owLJyVwv6OnuPiLbyBt31BoGIMKRuLm3TYFcio58jFET3l8v8RD0RjaMheUDpik8vQid
         a/bdb9o9TNgxOEIph05d5GJickb063keYuNVmqKSaTeRQhkL6dC7jI7+g5BZCFYpZx02
         jpB85fJ0fXc3OXVJDvoTAaIRbS+C9Py/zvKNIdai4psT+JSBS9Wuct8G+fTPxvcsYv+O
         pRJbkELOtTVhhz+uxZViVd2MAgFDaAETtAQyxhT6maUiyU0Dt/gWlcM0ocxpFi2t3Hyo
         Fi/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j123-v6si3331818qkc.18.2018.11.02.10.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 10:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIcwr-0008Di-PC
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 13:09:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvj-0007DA-7o
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvf-0004ZO-Gw
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:19 -0400
Received: from steffen-goertz.de ([88.198.119.201]:33246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gIcvd-0004Dr-7K; Fri, 02 Nov 2018 13:08:15 -0400
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 65D184FF56;
	Fri,  2 Nov 2018 18:04:59 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:07:21 -0400
Message-Id: <20181102170730.12432-5-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102170730.12432-1-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v4 04/13] arm: Instantiate NRF51 random number
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
X-TUID: zDUdYxvghj79

Use RNG in SOC.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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

