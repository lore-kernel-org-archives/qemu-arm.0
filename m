Received: by 10.182.158.201 with SMTP id ww9csp2039302obb;
        Sat, 19 Dec 2015 21:44:27 -0800 (PST)
X-Received: by 10.55.53.208 with SMTP id c199mr16511754qka.109.1450590267165;
        Sat, 19 Dec 2015 21:44:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r79si1603515qkh.118.2015.12.19.21.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 21:44:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAWnC-0007cm-KS
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 00:44:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWn9-0007WZ-QL
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 00:44:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWn8-0000f7-Sx
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 00:44:23 -0500
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:33367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAWn4-0000ec-DA; Sun, 20 Dec 2015 00:44:18 -0500
Received: by mail-pf0-x235.google.com with SMTP id n128so53913727pfn.0;
	Sat, 19 Dec 2015 21:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0xv3QSDeWnac7z3yRLS3BBheE1APkRQlAAzyL5aJNTU=;
	b=JkU+ZCCCtmLsDvFl6/53XvZPdeZ75h9acRz3dfq7sDRn04xHCD8rlBMMg7XPOFTjBM
	gYVhgxBvldg9/aqPLIhT/Wn6qv11nlV4Rkvn8ZfeMgybcFW+VXK5DgsfoTF/l46SQMPh
	FEnH7Zf0MU/SO/Ba+zy47D5+WFtApvNKylUv/cLhFScETxq0VQ5AfKZwxsHjRS4kcUpk
	ICMHv2wSqhrfzOsG1HLYEXdhr7rEQ/JoAhpuxrt3GCAWG1+0YAtXuOZHkXGoPElMtCwc
	8ySGfcUZTz9u49vrVkeztOeGnhh520x6BQ6EErwfKvU0YxRiNHvqI3fZgomEtie3v7j/
	HuMw==
X-Received: by 10.98.89.20 with SMTP id n20mr17813256pfb.164.1450590257891;
	Sat, 19 Dec 2015 21:44:17 -0800 (PST)
Received: from localhost.localdomain
	(c211-31-14-155.rochd5.qld.optusnet.com.au. [211.31.14.155])
	by smtp.gmail.com with ESMTPSA id c27sm894550pfd.50.2015.12.19.21.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 21:44:17 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 19 Dec 2015 21:43:38 -0800
Message-Id: <aa67be9cbe0b7108123d2aeece904a170427cd46.1450570397.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::235
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
	alistair.francis@xilinx.com
Subject: [Qemu-arm] [PATCH v6 6/6] xlnx-ep108: Connect the SPI Flash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bYoCw9rxuYQp

From: Alistair Francis <alistair.francis@xilinx.com>

Connect the sst25wf080 SPI flash to the EP108 board.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 hw/arm/xlnx-ep108.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
index 85b978f..d1912aa 100644
--- a/hw/arm/xlnx-ep108.c
+++ b/hw/arm/xlnx-ep108.c
@@ -33,6 +33,7 @@ static struct arm_boot_info xlnx_ep108_binfo;
 static void xlnx_ep108_init(MachineState *machine)
 {
     XlnxEP108 *s = g_new0(XlnxEP108, 1);
+    int i;
     Error *err = NULL;
 
     object_initialize(&s->soc, sizeof(s->soc), TYPE_XLNX_ZYNQMP);
@@ -60,6 +61,21 @@ static void xlnx_ep108_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(get_system_memory(), 0, &s->ddr_ram);
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
+        SSIBus *spi_bus;
+        DeviceState *flash_dev;
+        qemu_irq cs_line;
+        char bus_name[6];
+
+        snprintf(bus_name, 6, "spi%d", i);
+        spi_bus = (SSIBus *)qdev_get_child_bus(DEVICE(&s->soc), bus_name);
+
+        flash_dev = ssi_create_slave(spi_bus, "sst25wf080");
+        cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi[i]), 1, cs_line);
+    }
+
     xlnx_ep108_binfo.ram_size = machine->ram_size;
     xlnx_ep108_binfo.kernel_filename = machine->kernel_filename;
     xlnx_ep108_binfo.kernel_cmdline = machine->kernel_cmdline;
-- 
1.9.1

