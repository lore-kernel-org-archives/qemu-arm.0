Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3654861wrd;
        Mon, 17 Sep 2018 01:41:42 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYlVHAgNgLeLMBBtRspgKi/iJ8M0hdi5X8XXuILNUN4pBa0qJ6+PbCksC98QG46PAvwznjC
X-Received: by 2002:a0c:9e2a:: with SMTP id p42-v6mr16947794qve.54.1537173702477;
        Mon, 17 Sep 2018 01:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173702; cv=none;
        d=google.com; s=arc-20160816;
        b=t58UjeeOaarfd+1ZjsStBijPYqcE9nfzjD/WOPPezlEv+KXyob2PUow5gnVmjhIqcA
         G2QsTDSd4dY8kcb2NNQ290M+gvU1nURPA+FQvdZzvK37ATKxULYyDGZxBHVDklFWeYUr
         zZx1CzUHmdL2i6aL49zqxGLm1CZkJTOtXQlWMcyXpnlf5Z2gU+Vke/mROE1QQlJn+FbF
         OCTfrYPp4TaliXtfjODui5RlbWm5usknzprncNIt5BItvmLD19fOjPhzvyJrqoP7ZqY3
         JTu8eeUL1ztO037TS3jVLjTpHsNCvsR3DULMiBS1K62v2mkSO86scR/ZgXKKeAZLrqIi
         vFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=SByYJ0RBhNkM8FFDhrX4PdQ1mzVpHY82FtFKm8ADThQ=;
        b=QCCXmjrZC83ZQ5yzky+c3Gcyqa+MtRzZ2KTUjHFWd53/j99Y/HDMaa2/k2htzezkmX
         DpYU4DrrznWHQn4lqUWN4CNZAqferltOdV3Toj7PZ715IgV+5DJH+aSY+Pq5kD+zClwh
         WZvWF1jM1Q3TJrTWD0jba+ycS5CIjE4eUuC8swCwA5dd+E4gcx1eQWg1AKtbfA8m64k+
         0yuCuQodIvbsA3J4qzwTU6nLz7xf6d9GcqZGd2cFlq0F5xtdtDtKpmg3fuvGAe+aCM6Y
         PBRUBtObj9bjRBBB0ByewRfJ0cylx3eovUu0kbzfveOXnktMbaALTN2xoQE8M8IxRN48
         FF8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="Uud/IXgI";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=mUg+1kvY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=mUg+1kvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r33-v6si4065867qtc.108.2018.09.17.01.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="Uud/IXgI";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=mUg+1kvY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=mUg+1kvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34416 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6D-0006Af-Uy
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:41:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069J-SU
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5q-0005WP-LV
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5q-0005VU-5n; Mon, 17 Sep 2018 04:41:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 8D66C443483;
	Mon, 17 Sep 2018 10:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173673;
	bh=7kikJd0QMdJjrMyU5WU3TTF88G9I8FGb90lyoljdLqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Uud/IXgIkljL9IVkxdfeciMiISfPRT+jInFgewiwmpZrFamkyKSXwDHgHGd1Nl234
	B7e/vgTz+8Rfk9ZS8sB/RUUfLH9vQQMUt+w/z3RDv5lZSpGdBFUrEmRtMGycHMx8Ca
	QL5mJ0CptgvZhMrfjnE5q47wUQN9obxpP1SxMoPU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=mUg+1kvY;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=mUg+1kvY
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgNuRVhh_OMi; Mon, 17 Sep 2018 10:41:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id AA75E400FD7; Mon, 17 Sep 2018 10:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173672;
	bh=7kikJd0QMdJjrMyU5WU3TTF88G9I8FGb90lyoljdLqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mUg+1kvYYtcBnyAjGV4lUmuEN5ULK53WUB//fPLhkAqPG7wapZWbB4zhg30hC2QYN
	GbYUx+ntyYiPHvw0WmSzM0SLCuhhOKFbjp9dc2M+7uMQPBIH3D4v8a36vmyFRrC1cE
	GkIAOpxdc6XANCvaCO9s4/AZ/Okx9MpN08RlAu/I=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2A8EB2386FB;
	Mon, 17 Sep 2018 10:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173672;
	bh=7kikJd0QMdJjrMyU5WU3TTF88G9I8FGb90lyoljdLqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mUg+1kvYYtcBnyAjGV4lUmuEN5ULK53WUB//fPLhkAqPG7wapZWbB4zhg30hC2QYN
	GbYUx+ntyYiPHvw0WmSzM0SLCuhhOKFbjp9dc2M+7uMQPBIH3D4v8a36vmyFRrC1cE
	GkIAOpxdc6XANCvaCO9s4/AZ/Okx9MpN08RlAu/I=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:16 +0200
Message-Id: <20180917084016.12750-11-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 10/10] hw/arm/xilinx_zynq: connect uart clocks
 to slcr
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
X-TUID: ERu1vPvWWgNZ

From: Damien Hedde <damien.hedde@greensocs.com>

Add the connection between the slcr's output clocks and the uarts inputs.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/arm/xilinx_zynq.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index f1496d2927..efad21a5a9 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -166,7 +166,7 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
-    DeviceState *dev;
+    DeviceState *dev, *slcr;
     SysBusDevice *busdev;
     qemu_irq pic[64];
     int n;
@@ -212,9 +212,10 @@ static void zynq_init(MachineState *machine)
                           1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
                               0);
 
-    dev = qdev_create(NULL, "xilinx,zynq_slcr");
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8000000);
+    /* Create slcr, keep a pointer to connect clocks */
+    slcr = qdev_create(NULL, "xilinx,zynq_slcr");
+    qdev_init_nofail(slcr);
+    sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
 
     dev = qdev_create(NULL, TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", 1);
@@ -235,8 +236,12 @@ static void zynq_init(MachineState *machine)
     sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET]);
     sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET]);
 
-    cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
-    cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
+    dev = cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
+    qdev_clock_connect(dev, "busclk", slcr, "uart0_amba_clk", &error_abort);
+    qdev_clock_connect(dev, "refclk", slcr, "uart0_ref_clk", &error_abort);
+    dev = cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
+    qdev_clock_connect(dev, "busclk", slcr, "uart1_amba_clk", &error_abort);
+    qdev_clock_connect(dev, "refclk", slcr, "uart1_ref_clk", &error_abort);
 
     sysbus_create_varargs("cadence_ttc", 0xF8001000,
             pic[42-IRQ_OFFSET], pic[43-IRQ_OFFSET], pic[44-IRQ_OFFSET], NULL);
-- 
2.18.0

