Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3619119wrw;
        Mon, 12 Nov 2018 13:44:31 -0800 (PST)
X-Google-Smtp-Source: AJdET5dxvs7zoT6rM10Oi2NC699v8ulPTbRBYWFoiXTgqV7xo6nDyVtclJaoGBgUBgX2zXbR8CQz
X-Received: by 2002:ac8:5509:: with SMTP id j9mr2473383qtq.287.1542059071750;
        Mon, 12 Nov 2018 13:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542059071; cv=none;
        d=google.com; s=arc-20160816;
        b=IlbXcO0ulYbiJirXHuJDY22siB1l++Viw+BGOQCp0GiAUpb4XZSR4QIF78KKf787GX
         LCsNf+6RdUKB0fEZAgz/4eat67nSz6VMW8ABCGIvpeXUmfYnhmt/OX63RIr2as5OIAtq
         fw277UKh6YaWpW7kfokUfdhX1hmJKaJ7WIRHE3rtOHWDEyecXyw3UXiyNq3fGRyyzjIC
         4p71PUBC3J6Kdp/4LtlqChV68i8HiTSdn9SbIRZiin9J7oHafE8pbS4xHUZ6Ri55T6et
         Ni+/JZjtEZqZfANexdMjC+K9XeDqTVR6W3QgtycTSe4KlnghGiuYFSdiG/9+bdJX1y3k
         8cAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=SzK+9AWnc+q/ag3LhXh2vl4y0apiric0lbCG/EZZQR4=;
        b=yU7ePMYCB0UBOf+lBTeUkhYJC3rECX8XqshSw3tyZ0Ap2dmQdPAKddlhAMTL5QPeZs
         hG2LTnk46hDAvMtMe7Q43Qoe87MzP86oJowVUE38QDPT+O5Sq1PcIZOwI6Px0+jY3Hzf
         tg8/LzeZg99tf7sPq2Fm9cVJf4kktPaXNi0KcBCvwQH3Z2JNyxt19cQ8otPt9ET4auAx
         IMQiYrXhX5GI/Tm7HX9p88gXK5fkRqYdIsoxyD8nS84hy4q4dT/BcPPbaomgda1M98WL
         9oQ/YYMkf4UbOcsns3utvnhfCVmSWwFEg0ny19juz4BpWsVP8fbucrB3Q16eN7dZFxtv
         18dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o25-v6si1278896qtc.134.2018.11.12.13.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 13:44:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMK0V-0007my-2t
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 16:44:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJyj-0005iC-F6
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 16:42:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJyh-0002Z7-OV
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 16:42:41 -0500
Received: from steffen-goertz.de ([88.198.119.201]:35510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gMJyf-0002XI-KN; Mon, 12 Nov 2018 16:42:38 -0500
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 55A0750713;
	Mon, 12 Nov 2018 22:39:32 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Mon, 12 Nov 2018 16:42:14 -0500
Message-Id: <20181112214224.31560-5-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181112214224.31560-1-contrib@steffen-goertz.de>
References: <20181112214224.31560-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v5 04/14] arm: Instantiate NRF51 random number
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6mrXbVWob8iZ

Use RNG in SOC.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

