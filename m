Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp422296wrt;
        Thu, 3 Jan 2019 01:13:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6lveL3DrJz5k6ivvMd4i4InoN71RiP+ltBTzkawbXi5Y2XykD4h1CXBOenmf3PH6S5XN7c
X-Received: by 2002:a0c:f9c3:: with SMTP id j3mr46397712qvo.107.1546506791864;
        Thu, 03 Jan 2019 01:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546506791; cv=none;
        d=google.com; s=arc-20160816;
        b=0x9p4PBZf9XYgvCseIDsum3tf/JiiDXHMDchgWMz+AHSX2D9AeYqhUQ7v6BrkGMNaR
         Nzg28fGFR9OvfMV4u9UBLerquQpIK4eL87NmjP9axu1kVH6dD7Ub9L6xqds2b/3y4uiA
         4tduR/04MliZN3hf5cW4pKHNn3GVFg7JJZLbgIdpI7TCYC2Co4Zy0TW4bjV7f9ARgg91
         3J8z4qPa4lBeWO30e27bbOMfHRSlZzty5KjDWjmzVNMjYqU+zfg81581iG1W4pdOpkmv
         HW6RkP9eXIxi03F3s+SEBeTvNKX0QBEt5UVLAMRkG7wgjLe8jAdOVN1+9UWRX40GXPJ8
         JLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=FAtab2tQIU1VX9cbQTM3/hIy9Ni4rWwy2s1xvis8tTo=;
        b=wZ7y+xQbRkrdUscB4wGb/lKIOTYCBW99tc1I+QPKUpKsDun09y7Yw7U2B5Jgl0eaLH
         fWP2TODwmMA+NT8gjywrvVJapVtSYcgENj8w5Sv2LYY1q0EfXGktqJcpdjj2xPS+tXCU
         klEPWRWR/z8OL1vc3r0Bd6LEXx8Gn7IqSvE8T/dLdBnrl1T8h0qMvyfHVQ36h2fEHvb8
         JGPyzzg4kUS017EMxVGEwG5BJiRuDnssqfNRWNDbisl+Z6jpwYU2V5GaKfY63FtWLj21
         nskTNQwvuE8vQAqENUpwlHrFjLtXbUHu6RHLmeTS6IPmzj04oOgHyst5ApVNuebOdmwt
         kXTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x1si2952654qkc.167.2019.01.03.01.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:13:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gez3v-0003TD-76
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:13:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3e-0003Qb-7g
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3d-0006am-9X
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37208)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3d-0006aV-4P; Thu, 03 Jan 2019 04:12:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F25E7970E;
	Thu,  3 Jan 2019 09:12:52 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E37E25D738;
	Thu,  3 Jan 2019 09:12:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:12 +0000
Message-Id: <20190103091119.9367-5-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 03 Jan 2019 09:12:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 04/11] arm: Instantiate NRF51 random number
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
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P+l5p16iztD3

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Use RNG in SOC.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/arm/nrf51_soc.h |  2 ++
 hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

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
--=20
2.19.2

