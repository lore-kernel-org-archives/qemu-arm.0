Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3655156wrd;
        Mon, 17 Sep 2018 01:42:03 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZkWYpYEs0lGb4XZkBQZVx9SUuaSTYnAqfPKAG1eUqiraSaze773MyCNEjs8x3ywSm95b2p
X-Received: by 2002:ac8:3492:: with SMTP id w18-v6mr16719767qtb.239.1537173723861;
        Mon, 17 Sep 2018 01:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173723; cv=none;
        d=google.com; s=arc-20160816;
        b=J5YX8jF26g50kFrFmA1s787RSeacZEQ4RX1zxJxYCyMP0n/+OlfK/9hfFUnQlgunHI
         qJJD26HX/wPsaeRxEq4EBM1FGAjiioFD0GNHRv4sSFjIC80FCObFtPd7q+2xA4mUnbA8
         kklVQ57F7iaHWyb1ti0IRDFG2ZpKJZaaxKxcdvKHsh4OLsZi7gs/Fq2jJT3GiwlyiBFu
         jpZ5N3oYf9zKKluwZBn5bT40yuJxbYxAzdToN8ev17MlsO4TJWdQ+1CRQo5o66uUcwFG
         e17O40TO0G82WL5I64/JxEXWs/D5b1A48nVC9r02WAFpVZhoFpYQnPZHlGbrxAW41WSX
         T8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=o8YZ4mZNckohB+j5koCNSOvpRw6SNuUdv8ND+tYLOts=;
        b=SAzzyF4CYyYwdLS//qIjtPwJbNDzzt+C4K5416+JcDtocmWihEudL91vkR+dAtvoDB
         Iip6sW15k0azokBgPbtFmmd0IGZn+yBkn4cAULlXVJlgJO60tqPeOnRpJ6zyxVoGZiR0
         q+sNUad5F9TAQdbhafhLd1XYOtF8UyqbhtIGvTK9r5yWecuEiuYeNkaZnAu4/Q9x/QnQ
         pqNMqemcEa/es8ePCuwH/kJdzKxIcF+w0vj0VfBLP6hME/DyZ8cCj4MGi/UY4dAKA4WN
         ng7vNh9m8fTsc9S4A9ctvKRKPJORrdf1fr5tEPavaqtUz/AYl6Btn2mdKrw/Aexaucvq
         j3oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2Mhim9PT;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=OYvuZG2m;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=OYvuZG2m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q86-v6si1349648qkl.182.2018.09.17.01.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:42:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2Mhim9PT;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=OYvuZG2m;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=OYvuZG2m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6Z-0006Qk-AJ
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:42:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069N-T0
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5q-0005WK-KA
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5q-0005VO-4u; Mon, 17 Sep 2018 04:41:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A4503443493;
	Mon, 17 Sep 2018 10:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173671;
	bh=33jTLJUAXeCS/V1HY/PDWUYfbAkkSfTM6JFFP2a3zxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2Mhim9PThv2C9ns/F7tLC6fsxyqHH0XH3jm3TccQUZEJRipLk/H4XRSVlUy+08zgp
	7Lz45cghsjOkwNWEUL3YPCr5MzWzJnGM8Np2Pnu4elCZ6MlfM8+nDW6TzaBYOK8fa5
	vX+WUwFUzxC5e1cUro6m1KZTCYxZfHfE/Y5ezpsk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=OYvuZG2m;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=OYvuZG2m
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZoln28FHWLZ; Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A6006443483; Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173670;
	bh=33jTLJUAXeCS/V1HY/PDWUYfbAkkSfTM6JFFP2a3zxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OYvuZG2mLKUZdcpiI37yR85PwHMXB0UuUEj7FoJ6Uh2j9ErGeSbmiSr4B/v/rafOC
	Zy9TnsQjbVx4lJMGpc+YXvF485qZjdQjR4hM7/qZfjmJ/SQ6O42kJVChoM0wvEoD3A
	espkiMCtYaKiiYPyFMMj/qZ7Z92iItsermcYBM+Y=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2927023878C;
	Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173670;
	bh=33jTLJUAXeCS/V1HY/PDWUYfbAkkSfTM6JFFP2a3zxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OYvuZG2mLKUZdcpiI37yR85PwHMXB0UuUEj7FoJ6Uh2j9ErGeSbmiSr4B/v/rafOC
	Zy9TnsQjbVx4lJMGpc+YXvF485qZjdQjR4hM7/qZfjmJ/SQ6O42kJVChoM0wvEoD3A
	espkiMCtYaKiiYPyFMMj/qZ7Z92iItsermcYBM+Y=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:12 +0200
Message-Id: <20180917084016.12750-7-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 06/10] sysbus: add bus_interface_clock feature
 to sysbus devices
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sh+JeVSrgeeX

From: Damien Hedde <damien.hedde@greensocs.com>

Add an optional bus interface clock to sysbus devices.

This clock can be added by the subclasses if required using the
sysbus_init_bus_interface_clock function given the target name of the
clock.
The default behavior of the clock is to enable or disable the mmios in
function of the clock status (mmios are enabled iff the clock is running
and the reset not asserted).
This behavior may be changed by overriding the clock callback using
sysbus_get_bus_interface_clock and clock_set_callback functions.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/sysbus.h | 22 ++++++++++++++++++++++
 hw/core/sysbus.c    | 25 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 0b59a3b8d6..abbeece601 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -73,6 +73,7 @@ struct SysBusDevice {
     } mmio[QDEV_MAX_MMIO];
     int num_pio;
     uint32_t pio[QDEV_MAX_PIO];
+    ClockIn *bus_itf_clk;
 };
 
 typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev, void *opaque);
@@ -135,4 +136,25 @@ static inline DeviceState *sysbus_try_create_simple(const char *name,
     return sysbus_try_create_varargs(name, addr, irq, NULL);
 }
 
+/**
+ * sysbus_init_bus_interface_clock:
+ * @dev: the sysbus device
+ * @name: the name of the clock
+ *
+ * Add the bus interface clock to the device. Mmios will be enabled/disabled
+ * according to the clock status. Must not be called more than once on the same
+ * device.
+ *
+ * Note: if this clock remains unconnected, the sysbus device will work as if
+ * the clock was absent (no side-effect).
+ */
+void sysbus_init_bus_interface_clock(SysBusDevice *dev, const char *name);
+
+/**
+ * sysbus_init_get_interface_clock:
+ * @dev: the sysbus device
+ * @retuns: the clock previously added by sysbus_init_bus_interface_clock.
+ */
+ClockIn *sysbus_get_bus_interface_clock(SysBusDevice *dev);
+
 #endif /* HW_SYSBUS_H */
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 7ac36ad3e7..8d225263fa 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -324,6 +324,31 @@ MemoryRegion *sysbus_address_space(SysBusDevice *dev)
     return get_system_memory();
 }
 
+static void sysbus_device_clock_callback(void *opaque, ClockState *clk)
+{
+    SysBusDevice *dev = opaque;
+    bool enable = clock_state_is_domain_running(clk);
+    int i;
+
+    /* set/clear mmio visible flag on clock change */
+    for (i = 0; i < dev->num_mmio && i < QDEV_MAX_MMIO; i++) {
+        MemoryRegion *mr = sysbus_mmio_get_region(dev, i);
+        memory_region_set_enabled(mr, enable);
+    }
+}
+
+void sysbus_init_bus_interface_clock(SysBusDevice *dev, const char *name)
+{
+    assert(dev->bus_itf_clk == NULL);
+    dev->bus_itf_clk = qdev_init_clock_in(DEVICE(dev), name,
+            sysbus_device_clock_callback, dev);
+}
+
+ClockIn *sysbus_get_bus_interface_clock(SysBusDevice *dev)
+{
+    return dev->bus_itf_clk;
+}
+
 static void sysbus_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
-- 
2.18.0

