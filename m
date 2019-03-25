Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3724542wrx;
        Mon, 25 Mar 2019 04:14:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdUf34fM54wbcUec52aozySBixV6eOEl6KMkdXT07N9B97XJSi9FxCTEn4sCPTADMDVDL1
X-Received: by 2002:a25:8481:: with SMTP id v1mr14016113ybk.248.1553512486552;
        Mon, 25 Mar 2019 04:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553512486; cv=none;
        d=google.com; s=arc-20160816;
        b=BU4WPB/brso0lN4MMcOcVYG1UIx1xH+ikQUmaffzGapJXyTS9lYPXJ8OFbc4pgfwYw
         fKXa/oM9TUbdiJaf+7OTS57WzuQuhMwJpA1kbdlou7yPZH8krgHZui5rq1WSm1CbjzFt
         249p/xbPl88QyTdydqOKkW1X+mFTYbitfSU9m/uNXGtb6Z2Qt8ydys5qBFjG0EDF7WWz
         l5GN/MTrQ7QWRMFIzWfji7K5q93fqRWYHwTMpSRm8NbfU7vsh9e9PgXB5IwBvVJ3Wg8r
         h3QOwOcyQxe48eBBxN5O1s6lz8mXXGg4zVnaZdMT/UBDsD9I/5uDzJMjJ0CZkziFjKFs
         edhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=ivzPelEZNrVMwxJDkMZOA9axV0Wi0UndnsFqFY5L6TI=;
        b=Y+878DSfqgwoUW2jO1GOKhzbiEdwScP2CwelDga4Kg6UIo+pGGAMWvi49JkE/080BG
         joVDqUEjocNz7pmSglrTvyMj0jjl/k1RsfM+fZZ9lP0zMGsSZrNCSUkHnFQLGuU2Kb5q
         yG+fzBhsPUVTfIjSCoHcyOf67TGMZ+cdmyWzj8j/3QevGwDE9kU5FvlMbtpwq5+Fgi7L
         Q5554HJbRE3DhRsgzcTufpZHeJstzgoz1xu1ddB5jzi54RGkX1rPNidn98Y6d9xgkrC0
         aShajkhrFHlNo060zCsiEQh4cWaKzSVXohqFUxfrDVKNfB4GkBRMmOslD0FJs0kA1aUy
         gZ1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Y9ilEolW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BySBMNBb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BySBMNBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g81si8780405ywg.364.2019.03.25.04.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:14:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Y9ilEolW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BySBMNBb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BySBMNBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NYz-0006z0-TY
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:14:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNf-0005Ta-JT
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNe-00085y-9c
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:03:03 -0400
Received: from greensocs.com ([193.104.36.180]:38413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NNc-0007v1-8N; Mon, 25 Mar 2019 07:03:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DDAF77D78B4;
	Mon, 25 Mar 2019 12:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511756;
	bh=q6FilVEc49Ov6DKXMr4Va1XrZ/oFtHx1uhJ+EdQrj6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y9ilEolWHnb4JeC+HnARzGBl5DMctv1OT/vc9uSrJWdS83/JomqumlJCvho3B5qrT
	/o81bBDaap8SucCq/lw1V4/RlpTzlaEE7qcu4D9kSfldxxB+LJORpxUgWO5A5D28lg
	9D94xbwf17CVCAs2WQJOFvm55FTqgD6ppxftx36c=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=BySBMNBb;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=BySBMNBb
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5G6yfaty7vt5; Mon, 25 Mar 2019 12:02:36 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 9C77C7D78B3; Mon, 25 Mar 2019 12:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511754;
	bh=q6FilVEc49Ov6DKXMr4Va1XrZ/oFtHx1uhJ+EdQrj6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BySBMNBbVboWmp3CeulUev72Cb7Gwq78sSccMqIzu9K8sMO/GeQJkvUT5YpJ1rf9m
	3Y6gf6OSOqHM4eo2d4YoyeD3oYmwaczSnHOlBOXidqG99aSAs8poNq/JlgxlN84FMm
	PJrXCo0skFrE5MAsOSqs89jijg69FlCxxa8qdgZk=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id ED8537D788E;
	Mon, 25 Mar 2019 12:02:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511754;
	bh=q6FilVEc49Ov6DKXMr4Va1XrZ/oFtHx1uhJ+EdQrj6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BySBMNBbVboWmp3CeulUev72Cb7Gwq78sSccMqIzu9K8sMO/GeQJkvUT5YpJ1rf9m
	3Y6gf6OSOqHM4eo2d4YoyeD3oYmwaczSnHOlBOXidqG99aSAs8poNq/JlgxlN84FMm
	PJrXCo0skFrE5MAsOSqs89jijg69FlCxxa8qdgZk=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:02:00 +0100
Message-Id: <3530c02ee3b1c8c28930a6ff1aff6bf3308714d8.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 17/17] Connect the uart reset gpios in the
 zynq platform
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qCoT4XHXq/rl

Connect the two uart reset inputs to the slcr corresponding outputs.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/arm/xilinx_zynq.c           | 14 ++++++++------
 include/hw/char/cadence_uart.h | 10 +++++++++-
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index b3b8215759..528d1c42fd 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -166,7 +166,7 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *address_space_mem =3D get_system_memory();
     MemoryRegion *ext_ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram =3D g_new(MemoryRegion, 1);
-    DeviceState *dev;
+    DeviceState *dev, *slcr;
     SysBusDevice *busdev;
     qemu_irq pic[64];
     int n;
@@ -211,9 +211,9 @@ static void zynq_init(MachineState *machine)
                           1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2=
aa,
                           0);
=20
-    dev =3D qdev_create(NULL, "xilinx,zynq_slcr");
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8000000);
+    slcr =3D qdev_create(NULL, "xilinx,zynq_slcr");
+    qdev_init_nofail(slcr);
+    sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
=20
     dev =3D qdev_create(NULL, TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", 1);
@@ -234,8 +234,10 @@ static void zynq_init(MachineState *machine)
     sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET])=
;
     sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET])=
;
=20
-    cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
-    cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
+    cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0),
+                        slcr, "uart0-rst", 0);
+    cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1),
+                        slcr, "uart1-rst", 0);
=20
     sysbus_create_varargs("cadence_ttc", 0xF8001000,
             pic[42-IRQ_OFFSET], pic[43-IRQ_OFFSET], pic[44-IRQ_OFFSET], =
NULL);
diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uar=
t.h
index 118e3f10de..b7489a711f 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -51,7 +51,10 @@ typedef struct {
=20
 static inline DeviceState *cadence_uart_create(hwaddr addr,
                                         qemu_irq irq,
-                                        Chardev *chr)
+                                        Chardev *chr,
+                                        DeviceState *rst_dev,
+                                        const char *rst_name,
+                                        int rst_n)
 {
     DeviceState *dev;
     SysBusDevice *s;
@@ -63,6 +66,11 @@ static inline DeviceState *cadence_uart_create(hwaddr =
addr,
     sysbus_mmio_map(s, 0, addr);
     sysbus_connect_irq(s, 0, irq);
=20
+    if (rst_dev) {
+        qdev_connect_gpio_out_named(rst_dev, rst_name, rst_n,
+                qdev_get_gpio_in_named(dev, "rst", 0));
+    }
+
     return dev;
 }
=20
--=20
2.21.0

