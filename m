Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3655413wrd;
        Mon, 17 Sep 2018 01:42:21 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZbLh3TBAr+v0dEhDG/L83Y39kn1caFYFnGhP6FOohx1Lbq1YX0EEBWBxEDIrLo87rkgQEF
X-Received: by 2002:a0c:89c5:: with SMTP id 5-v6mr17323908qvs.46.1537173741270;
        Mon, 17 Sep 2018 01:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173741; cv=none;
        d=google.com; s=arc-20160816;
        b=Aec2dGzMhRMky761f9yX8NsqTU4gE0FyVw2iRztvlq3sBJCqNWVoUzQmUHQztWdRZE
         fHcf0FdAOWty5rVq5aJ4FQ6OefTdd9obGeMnUpl0gYtIq37KEvUJi2JYEkGORXwHw6hE
         hjnLZSfmF8apJeiFEcq7m9CPX1RrKJ9cu10GX5foZkNq8g7NCVFh3k3icDCrvGkyzHZt
         u0pUBBOBFJhEFZV48Wrvzyx/N6VHYvTqzfNju08nYUVTWFUMSQnLffpx5gT3ZNB6QwDX
         aH+SYyaVms+AjjHsPXxx0nL+i3UmtvhsyzQd2v3H7mVMC0oOyFEceBvrfbi8oIaJdfDm
         XsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=W80HcPdx1xhg2AuUaE0gs1d0qKTdwfbrvkIKFYc4yLE=;
        b=YaTI6gQUD5MRUTI8a+5pxjwYVUvWe/tb8iTP2RI8oBEWOECWkMSEdNoCf+xx655NyQ
         q2YZgsf3Z7zG8j7V7ATdlN2wI2HoqWfdZRP/xC+unh4mekACiqZnqmBD+mKJ4g3W/bhx
         jPTu5tANysfGD2WeNh5WsmVVxZCAiNdAVBCCOF5BC57mSfZdDVhFQyYSIpD0ecf6O54X
         //7QLyJzM+XOLMLwM71heKZvjxS6/Ub3ToP9hM4TNA6/3Uhj8u2ptzr5PdSelMTOVLf4
         8mILsYaue+UWD9oP0j5t5MZnV1Mppicda3cK2i1RNRIHPeNncIOgKIFnfSiATx8ErT8M
         1JNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VaKfWRa2;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=1pcnsUxo;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="bs8c/mUJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p1-v6si2052279qta.346.2018.09.17.01.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VaKfWRa2;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=1pcnsUxo;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="bs8c/mUJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6p-0006eZ-U2
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:42:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5v-00069S-0Z
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5q-0005Wf-PM
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5q-0005VS-8Q; Mon, 17 Sep 2018 04:41:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 670ED2387FF;
	Mon, 17 Sep 2018 10:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173672;
	bh=rIVUW8GXd9WLg9ABrXSUKezFFb+G48xvjREVfn5NufM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VaKfWRa2D83HMbwCQX4l6xCaXugmBWeCl14yI+r839FXCTQyKskAC6jTO8wuTT4U4
	DSHy91Xnyu2HjVzQU0Qgxz5tgsdozvRfXM3hbcRcSBE0QCDwPN4Shts0TUSu1Obf5O
	RLoFzLCmyO2947LazAeAG7CjZyE1wb45njcr35SY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1pcnsUxo;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bs8c/mUJ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WxRA9GB_kbwh; Mon, 17 Sep 2018 10:41:11 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 43BD6400FD7; Mon, 17 Sep 2018 10:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173671;
	bh=rIVUW8GXd9WLg9ABrXSUKezFFb+G48xvjREVfn5NufM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1pcnsUxo/xxIJjM/lZ9+jXiT6T9OXtegj/dJFZ5xbKwU/9Txt8h7rM38sT1MdEQ6u
	pSf6l1cy8G4jC6QYYZk+jIVUiD97wSyNqzFSKFBYOC391hg1YDdOSE6Txxm2+16fMs
	lIb8JDZnd2OO9J+XwfrenAkouq1hHWl0Qr6PhybY=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9FAE3443480;
	Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173670;
	bh=rIVUW8GXd9WLg9ABrXSUKezFFb+G48xvjREVfn5NufM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bs8c/mUJto3OYBCpCmn6G8/Ifrjqn4QJ3jx9x8uKeAt9JJIvk+Pzt/jAbZ7K1jNn+
	lBLbyPNVTTa58kEAd8qQV78irEf/93vDQv+eMORDuDbtJIvkfuQZOI9B41xmI9tKhT
	UTBYvKxH5yIZb2nI/GG/F9cu0bn1LZXnchKcGqXY=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:13 +0200
Message-Id: <20180917084016.12750-8-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 07/10] hw/misc/zynq_slcr: use standard
 register definition
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
X-TUID: Vu85CCkCDfpg

From: Damien Hedde <damien.hedde@greensocs.com>

Replace the zynq_slcr registers enum and macros using the
hw/registerfields.h macros.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/misc/zynq_slcr.c | 468 ++++++++++++++++++++++----------------------
 1 file changed, 234 insertions(+), 234 deletions(-)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index d6bdd027ef..baa13d1316 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -20,6 +20,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
+#include "hw/registerfields.h"
 
 #ifndef ZYNQ_SLCR_ERR_DEBUG
 #define ZYNQ_SLCR_ERR_DEBUG 0
@@ -35,138 +36,135 @@
 #define XILINX_LOCK_KEY 0x767b
 #define XILINX_UNLOCK_KEY 0xdf0d
 
-#define R_PSS_RST_CTRL_SOFT_RST 0x1
+REG32(SCL, 0x000)
+REG32(LOCK, 0x004)
+REG32(UNLOCK, 0x008)
+REG32(LOCKSTA, 0x00c)
 
-enum {
-    SCL             = 0x000 / 4,
-    LOCK,
-    UNLOCK,
-    LOCKSTA,
+REG32(ARM_PLL_CTRL, 0x100)
+REG32(DDR_PLL_CTRL, 0x104)
+REG32(IO_PLL_CTRL, 0x108)
+REG32(PLL_STATUS, 0x10c)
+REG32(ARM_PLL_CFG, 0x110)
+REG32(DDR_PLL_CFG, 0x114)
+REG32(IO_PLL_CFG, 0x118)
 
-    ARM_PLL_CTRL    = 0x100 / 4,
-    DDR_PLL_CTRL,
-    IO_PLL_CTRL,
-    PLL_STATUS,
-    ARM_PLL_CFG,
-    DDR_PLL_CFG,
-    IO_PLL_CFG,
-
-    ARM_CLK_CTRL    = 0x120 / 4,
-    DDR_CLK_CTRL,
-    DCI_CLK_CTRL,
-    APER_CLK_CTRL,
-    USB0_CLK_CTRL,
-    USB1_CLK_CTRL,
-    GEM0_RCLK_CTRL,
-    GEM1_RCLK_CTRL,
-    GEM0_CLK_CTRL,
-    GEM1_CLK_CTRL,
-    SMC_CLK_CTRL,
-    LQSPI_CLK_CTRL,
-    SDIO_CLK_CTRL,
-    UART_CLK_CTRL,
-    SPI_CLK_CTRL,
-    CAN_CLK_CTRL,
-    CAN_MIOCLK_CTRL,
-    DBG_CLK_CTRL,
-    PCAP_CLK_CTRL,
-    TOPSW_CLK_CTRL,
+REG32(ARM_CLK_CTRL, 0x120)
+REG32(DDR_CLK_CTRL, 0x124)
+REG32(DCI_CLK_CTRL, 0x128)
+REG32(APER_CLK_CTRL, 0x12c)
+REG32(USB0_CLK_CTRL, 0x130)
+REG32(USB1_CLK_CTRL, 0x134)
+REG32(GEM0_RCLK_CTRL, 0x138)
+REG32(GEM1_RCLK_CTRL, 0x13c)
+REG32(GEM0_CLK_CTRL, 0x140)
+REG32(GEM1_CLK_CTRL, 0x144)
+REG32(SMC_CLK_CTRL, 0x148)
+REG32(LQSPI_CLK_CTRL, 0x14c)
+REG32(SDIO_CLK_CTRL, 0x150)
+REG32(UART_CLK_CTRL, 0x154)
+REG32(SPI_CLK_CTRL, 0x158)
+REG32(CAN_CLK_CTRL, 0x15c)
+REG32(CAN_MIOCLK_CTRL, 0x160)
+REG32(DBG_CLK_CTRL, 0x164)
+REG32(PCAP_CLK_CTRL, 0x168)
+REG32(TOPSW_CLK_CTRL, 0x16c)
 
 #define FPGA_CTRL_REGS(n, start) \
-    FPGA ## n ## _CLK_CTRL = (start) / 4, \
-    FPGA ## n ## _THR_CTRL, \
-    FPGA ## n ## _THR_CNT, \
-    FPGA ## n ## _THR_STA,
-    FPGA_CTRL_REGS(0, 0x170)
-    FPGA_CTRL_REGS(1, 0x180)
-    FPGA_CTRL_REGS(2, 0x190)
-    FPGA_CTRL_REGS(3, 0x1a0)
-
-    BANDGAP_TRIP    = 0x1b8 / 4,
-    PLL_PREDIVISOR  = 0x1c0 / 4,
-    CLK_621_TRUE,
-
-    PSS_RST_CTRL    = 0x200 / 4,
-    DDR_RST_CTRL,
-    TOPSW_RESET_CTRL,
-    DMAC_RST_CTRL,
-    USB_RST_CTRL,
-    GEM_RST_CTRL,
-    SDIO_RST_CTRL,
-    SPI_RST_CTRL,
-    CAN_RST_CTRL,
-    I2C_RST_CTRL,
-    UART_RST_CTRL,
-    GPIO_RST_CTRL,
-    LQSPI_RST_CTRL,
-    SMC_RST_CTRL,
-    OCM_RST_CTRL,
-    FPGA_RST_CTRL   = 0x240 / 4,
-    A9_CPU_RST_CTRL,
-
-    RS_AWDT_CTRL    = 0x24c / 4,
-    RST_REASON,
-
-    REBOOT_STATUS   = 0x258 / 4,
-    BOOT_MODE,
-
-    APU_CTRL        = 0x300 / 4,
-    WDT_CLK_SEL,
-
-    TZ_DMA_NS       = 0x440 / 4,
-    TZ_DMA_IRQ_NS,
-    TZ_DMA_PERIPH_NS,
-
-    PSS_IDCODE      = 0x530 / 4,
-
-    DDR_URGENT      = 0x600 / 4,
-    DDR_CAL_START   = 0x60c / 4,
-    DDR_REF_START   = 0x614 / 4,
-    DDR_CMD_STA,
-    DDR_URGENT_SEL,
-    DDR_DFI_STATUS,
-
-    MIO             = 0x700 / 4,
+    REG32(FPGA ## n ## _CLK_CTRL, (start)) \
+    REG32(FPGA ## n ## _THR_CTRL, (start) + 0x4)\
+    REG32(FPGA ## n ## _THR_CNT,  (start) + 0x8)\
+    REG32(FPGA ## n ## _THR_STA,  (start) + 0xc)
+FPGA_CTRL_REGS(0, 0x170)
+FPGA_CTRL_REGS(1, 0x180)
+FPGA_CTRL_REGS(2, 0x190)
+FPGA_CTRL_REGS(3, 0x1a0)
+
+REG32(BANDGAP_TRIP, 0x1b8)
+REG32(PLL_PREDIVISOR, 0x1c0)
+REG32(CLK_621_TRUE, 0x1c4)
+
+REG32(PSS_RST_CTRL, 0x200)
+    FIELD(PSS_RST_CTRL, SOFT_RST, 0, 1)
+REG32(DDR_RST_CTRL, 0x204)
+REG32(TOPSW_RESET_CTRL, 0x208)
+REG32(DMAC_RST_CTRL, 0x20c)
+REG32(USB_RST_CTRL, 0x210)
+REG32(GEM_RST_CTRL, 0x214)
+REG32(SDIO_RST_CTRL, 0x218)
+REG32(SPI_RST_CTRL, 0x21c)
+REG32(CAN_RST_CTRL, 0x220)
+REG32(I2C_RST_CTRL, 0x224)
+REG32(UART_RST_CTRL, 0x228)
+REG32(GPIO_RST_CTRL, 0x22c)
+REG32(LQSPI_RST_CTRL, 0x230)
+REG32(SMC_RST_CTRL, 0x234)
+REG32(OCM_RST_CTRL, 0x238)
+REG32(FPGA_RST_CTRL, 0x240)
+REG32(A9_CPU_RST_CTRL, 0x244)
+
+REG32(RS_AWDT_CTRL, 0x24c)
+REG32(RST_REASON, 0x250)
+
+REG32(REBOOT_STATUS, 0x258)
+REG32(BOOT_MODE, 0x25c)
+
+REG32(APU_CTRL, 0x300)
+REG32(WDT_CLK_SEL, 0x304)
+
+REG32(TZ_DMA_NS, 0x440)
+REG32(TZ_DMA_IRQ_NS, 0x444)
+REG32(TZ_DMA_PERIPH_NS, 0x448)
+
+REG32(PSS_IDCODE, 0x530)
+
+REG32(DDR_URGENT, 0x600)
+REG32(DDR_CAL_START, 0x60c)
+REG32(DDR_REF_START, 0x614)
+REG32(DDR_CMD_STA, 0x618)
+REG32(DDR_URGENT_SEL, 0x61c)
+REG32(DDR_DFI_STATUS, 0x620)
+
+REG32(MIO, 0x700)
 #define MIO_LENGTH 54
 
-    MIO_LOOPBACK    = 0x804 / 4,
-    MIO_MST_TRI0,
-    MIO_MST_TRI1,
+REG32(MIO_LOOPBACK, 0x804)
+REG32(MIO_MST_TRI0, 0x808)
+REG32(MIO_MST_TRI1, 0x80c)
 
-    SD0_WP_CD_SEL   = 0x830 / 4,
-    SD1_WP_CD_SEL,
+REG32(SD0_WP_CD_SEL, 0x830)
+REG32(SD1_WP_CD_SEL, 0x834)
 
-    LVL_SHFTR_EN    = 0x900 / 4,
-    OCM_CFG         = 0x910 / 4,
+REG32(LVL_SHFTR_EN, 0x900)
+REG32(OCM_CFG, 0x910)
 
-    CPU_RAM         = 0xa00 / 4,
+REG32(CPU_RAM, 0xa00)
 
-    IOU             = 0xa30 / 4,
+REG32(IOU, 0xa30)
 
-    DMAC_RAM        = 0xa50 / 4,
+REG32(DMAC_RAM, 0xa50)
 
-    AFI0            = 0xa60 / 4,
-    AFI1 = AFI0 + 3,
-    AFI2 = AFI1 + 3,
-    AFI3 = AFI2 + 3,
+REG32(AFI0, 0xa60)
+REG32(AFI1, 0xa6c)
+REG32(AFI2, 0xa78)
+REG32(AFI3, 0xa84)
 #define AFI_LENGTH 3
 
-    OCM             = 0xa90 / 4,
+REG32(OCM, 0xa90)
 
-    DEVCI_RAM       = 0xaa0 / 4,
+REG32(DEVCI_RAM, 0xaa0)
 
-    CSG_RAM         = 0xab0 / 4,
+REG32(CSG_RAM, 0xab0)
 
-    GPIOB_CTRL      = 0xb00 / 4,
-    GPIOB_CFG_CMOS18,
-    GPIOB_CFG_CMOS25,
-    GPIOB_CFG_CMOS33,
-    GPIOB_CFG_HSTL  = 0xb14 / 4,
-    GPIOB_DRVR_BIAS_CTRL,
+REG32(GPIOB_CTRL, 0xb00)
+REG32(GPIOB_CFG_CMOS18, 0xb04)
+REG32(GPIOB_CFG_CMOS25, 0xb08)
+REG32(GPIOB_CFG_CMOS33, 0xb0c)
+REG32(GPIOB_CFG_HSTL, 0xb14)
+REG32(GPIOB_DRVR_BIAS_CTRL, 0xb18)
 
-    DDRIOB          = 0xb40 / 4,
+REG32(DDRIOB, 0xb40)
 #define DDRIOB_LENGTH 14
-};
 
 #define ZYNQ_SLCR_MMIO_SIZE     0x1000
 #define ZYNQ_SLCR_NUM_REGS      (ZYNQ_SLCR_MMIO_SIZE / 4)
@@ -189,150 +187,152 @@ static void zynq_slcr_reset(DeviceState *d)
 
     DB_PRINT("RESET\n");
 
-    s->regs[LOCKSTA] = 1;
+    s->regs[R_LOCKSTA] = 1;
     /* 0x100 - 0x11C */
-    s->regs[ARM_PLL_CTRL]   = 0x0001A008;
-    s->regs[DDR_PLL_CTRL]   = 0x0001A008;
-    s->regs[IO_PLL_CTRL]    = 0x0001A008;
-    s->regs[PLL_STATUS]     = 0x0000003F;
-    s->regs[ARM_PLL_CFG]    = 0x00014000;
-    s->regs[DDR_PLL_CFG]    = 0x00014000;
-    s->regs[IO_PLL_CFG]     = 0x00014000;
+    s->regs[R_ARM_PLL_CTRL]   = 0x0001A008;
+    s->regs[R_DDR_PLL_CTRL]   = 0x0001A008;
+    s->regs[R_IO_PLL_CTRL]    = 0x0001A008;
+    s->regs[R_PLL_STATUS]     = 0x0000003F;
+    s->regs[R_ARM_PLL_CFG]    = 0x00014000;
+    s->regs[R_DDR_PLL_CFG]    = 0x00014000;
+    s->regs[R_IO_PLL_CFG]     = 0x00014000;
 
     /* 0x120 - 0x16C */
-    s->regs[ARM_CLK_CTRL]   = 0x1F000400;
-    s->regs[DDR_CLK_CTRL]   = 0x18400003;
-    s->regs[DCI_CLK_CTRL]   = 0x01E03201;
-    s->regs[APER_CLK_CTRL]  = 0x01FFCCCD;
-    s->regs[USB0_CLK_CTRL]  = s->regs[USB1_CLK_CTRL]    = 0x00101941;
-    s->regs[GEM0_RCLK_CTRL] = s->regs[GEM1_RCLK_CTRL]   = 0x00000001;
-    s->regs[GEM0_CLK_CTRL]  = s->regs[GEM1_CLK_CTRL]    = 0x00003C01;
-    s->regs[SMC_CLK_CTRL]   = 0x00003C01;
-    s->regs[LQSPI_CLK_CTRL] = 0x00002821;
-    s->regs[SDIO_CLK_CTRL]  = 0x00001E03;
-    s->regs[UART_CLK_CTRL]  = 0x00003F03;
-    s->regs[SPI_CLK_CTRL]   = 0x00003F03;
-    s->regs[CAN_CLK_CTRL]   = 0x00501903;
-    s->regs[DBG_CLK_CTRL]   = 0x00000F03;
-    s->regs[PCAP_CLK_CTRL]  = 0x00000F01;
+    s->regs[R_ARM_CLK_CTRL]   = 0x1F000400;
+    s->regs[R_DDR_CLK_CTRL]   = 0x18400003;
+    s->regs[R_DCI_CLK_CTRL]   = 0x01E03201;
+    s->regs[R_APER_CLK_CTRL]  = 0x01FFCCCD;
+    s->regs[R_USB0_CLK_CTRL]  = s->regs[R_USB1_CLK_CTRL]  = 0x00101941;
+    s->regs[R_GEM0_RCLK_CTRL] = s->regs[R_GEM1_RCLK_CTRL] = 0x00000001;
+    s->regs[R_GEM0_CLK_CTRL]  = s->regs[R_GEM1_CLK_CTRL]  = 0x00003C01;
+    s->regs[R_SMC_CLK_CTRL]   = 0x00003C01;
+    s->regs[R_LQSPI_CLK_CTRL] = 0x00002821;
+    s->regs[R_SDIO_CLK_CTRL]  = 0x00001E03;
+    s->regs[R_UART_CLK_CTRL]  = 0x00003F03;
+    s->regs[R_SPI_CLK_CTRL]   = 0x00003F03;
+    s->regs[R_CAN_CLK_CTRL]   = 0x00501903;
+    s->regs[R_DBG_CLK_CTRL]   = 0x00000F03;
+    s->regs[R_PCAP_CLK_CTRL]  = 0x00000F01;
 
     /* 0x170 - 0x1AC */
-    s->regs[FPGA0_CLK_CTRL] = s->regs[FPGA1_CLK_CTRL] = s->regs[FPGA2_CLK_CTRL]
-                            = s->regs[FPGA3_CLK_CTRL] = 0x00101800;
-    s->regs[FPGA0_THR_STA] = s->regs[FPGA1_THR_STA] = s->regs[FPGA2_THR_STA]
-                           = s->regs[FPGA3_THR_STA] = 0x00010000;
+    s->regs[R_FPGA0_CLK_CTRL] = s->regs[R_FPGA1_CLK_CTRL]
+                              = s->regs[R_FPGA2_CLK_CTRL]
+                              = s->regs[R_FPGA3_CLK_CTRL] = 0x00101800;
+    s->regs[R_FPGA0_THR_STA] = s->regs[R_FPGA1_THR_STA]
+                             = s->regs[R_FPGA2_THR_STA]
+                             = s->regs[R_FPGA3_THR_STA] = 0x00010000;
 
     /* 0x1B0 - 0x1D8 */
-    s->regs[BANDGAP_TRIP]   = 0x0000001F;
-    s->regs[PLL_PREDIVISOR] = 0x00000001;
-    s->regs[CLK_621_TRUE]   = 0x00000001;
+    s->regs[R_BANDGAP_TRIP]   = 0x0000001F;
+    s->regs[R_PLL_PREDIVISOR] = 0x00000001;
+    s->regs[R_CLK_621_TRUE]   = 0x00000001;
 
     /* 0x200 - 0x25C */
-    s->regs[FPGA_RST_CTRL]  = 0x01F33F0F;
-    s->regs[RST_REASON]     = 0x00000040;
+    s->regs[R_FPGA_RST_CTRL]  = 0x01F33F0F;
+    s->regs[R_RST_REASON]     = 0x00000040;
 
-    s->regs[BOOT_MODE]      = 0x00000001;
+    s->regs[R_BOOT_MODE]      = 0x00000001;
 
     /* 0x700 - 0x7D4 */
     for (i = 0; i < 54; i++) {
-        s->regs[MIO + i] = 0x00001601;
+        s->regs[R_MIO + i] = 0x00001601;
     }
     for (i = 2; i <= 8; i++) {
-        s->regs[MIO + i] = 0x00000601;
+        s->regs[R_MIO + i] = 0x00000601;
     }
 
-    s->regs[MIO_MST_TRI0] = s->regs[MIO_MST_TRI1] = 0xFFFFFFFF;
+    s->regs[R_MIO_MST_TRI0] = s->regs[R_MIO_MST_TRI1] = 0xFFFFFFFF;
 
-    s->regs[CPU_RAM + 0] = s->regs[CPU_RAM + 1] = s->regs[CPU_RAM + 3]
-                         = s->regs[CPU_RAM + 4] = s->regs[CPU_RAM + 7]
-                         = 0x00010101;
-    s->regs[CPU_RAM + 2] = s->regs[CPU_RAM + 5] = 0x01010101;
-    s->regs[CPU_RAM + 6] = 0x00000001;
+    s->regs[R_CPU_RAM + 0] = s->regs[R_CPU_RAM + 1] = s->regs[R_CPU_RAM + 3]
+                           = s->regs[R_CPU_RAM + 4] = s->regs[R_CPU_RAM + 7]
+                           = 0x00010101;
+    s->regs[R_CPU_RAM + 2] = s->regs[R_CPU_RAM + 5] = 0x01010101;
+    s->regs[R_CPU_RAM + 6] = 0x00000001;
 
-    s->regs[IOU + 0] = s->regs[IOU + 1] = s->regs[IOU + 2] = s->regs[IOU + 3]
-                     = 0x09090909;
-    s->regs[IOU + 4] = s->regs[IOU + 5] = 0x00090909;
-    s->regs[IOU + 6] = 0x00000909;
+    s->regs[R_IOU + 0] = s->regs[R_IOU + 1] = s->regs[R_IOU + 2]
+                       = s->regs[R_IOU + 3] = 0x09090909;
+    s->regs[R_IOU + 4] = s->regs[R_IOU + 5] = 0x00090909;
+    s->regs[R_IOU + 6] = 0x00000909;
 
-    s->regs[DMAC_RAM] = 0x00000009;
+    s->regs[R_DMAC_RAM] = 0x00000009;
 
-    s->regs[AFI0 + 0] = s->regs[AFI0 + 1] = 0x09090909;
-    s->regs[AFI1 + 0] = s->regs[AFI1 + 1] = 0x09090909;
-    s->regs[AFI2 + 0] = s->regs[AFI2 + 1] = 0x09090909;
-    s->regs[AFI3 + 0] = s->regs[AFI3 + 1] = 0x09090909;
-    s->regs[AFI0 + 2] = s->regs[AFI1 + 2] = s->regs[AFI2 + 2]
-                      = s->regs[AFI3 + 2] = 0x00000909;
+    s->regs[R_AFI0 + 0] = s->regs[R_AFI0 + 1] = 0x09090909;
+    s->regs[R_AFI1 + 0] = s->regs[R_AFI1 + 1] = 0x09090909;
+    s->regs[R_AFI2 + 0] = s->regs[R_AFI2 + 1] = 0x09090909;
+    s->regs[R_AFI3 + 0] = s->regs[R_AFI3 + 1] = 0x09090909;
+    s->regs[R_AFI0 + 2] = s->regs[R_AFI1 + 2] = s->regs[R_AFI2 + 2]
+                        = s->regs[R_AFI3 + 2] = 0x00000909;
 
-    s->regs[OCM + 0]    = 0x01010101;
-    s->regs[OCM + 1]    = s->regs[OCM + 2] = 0x09090909;
+    s->regs[R_OCM + 0] = 0x01010101;
+    s->regs[R_OCM + 1] = s->regs[R_OCM + 2] = 0x09090909;
 
-    s->regs[DEVCI_RAM]  = 0x00000909;
-    s->regs[CSG_RAM]    = 0x00000001;
+    s->regs[R_DEVCI_RAM] = 0x00000909;
+    s->regs[R_CSG_RAM]   = 0x00000001;
 
-    s->regs[DDRIOB + 0] = s->regs[DDRIOB + 1] = s->regs[DDRIOB + 2]
-                        = s->regs[DDRIOB + 3] = 0x00000e00;
-    s->regs[DDRIOB + 4] = s->regs[DDRIOB + 5] = s->regs[DDRIOB + 6]
-                        = 0x00000e00;
-    s->regs[DDRIOB + 12] = 0x00000021;
+    s->regs[R_DDRIOB + 0] = s->regs[R_DDRIOB + 1] = s->regs[R_DDRIOB + 2]
+                          = s->regs[R_DDRIOB + 3] = 0x00000e00;
+    s->regs[R_DDRIOB + 4] = s->regs[R_DDRIOB + 5] = s->regs[R_DDRIOB + 6]
+                          = 0x00000e00;
+    s->regs[R_DDRIOB + 12] = 0x00000021;
 }
 
 
 static bool zynq_slcr_check_offset(hwaddr offset, bool rnw)
 {
     switch (offset) {
-    case LOCK:
-    case UNLOCK:
-    case DDR_CAL_START:
-    case DDR_REF_START:
+    case R_LOCK:
+    case R_UNLOCK:
+    case R_DDR_CAL_START:
+    case R_DDR_REF_START:
         return !rnw; /* Write only */
-    case LOCKSTA:
-    case FPGA0_THR_STA:
-    case FPGA1_THR_STA:
-    case FPGA2_THR_STA:
-    case FPGA3_THR_STA:
-    case BOOT_MODE:
-    case PSS_IDCODE:
-    case DDR_CMD_STA:
-    case DDR_DFI_STATUS:
-    case PLL_STATUS:
+    case R_LOCKSTA:
+    case R_FPGA0_THR_STA:
+    case R_FPGA1_THR_STA:
+    case R_FPGA2_THR_STA:
+    case R_FPGA3_THR_STA:
+    case R_BOOT_MODE:
+    case R_PSS_IDCODE:
+    case R_DDR_CMD_STA:
+    case R_DDR_DFI_STATUS:
+    case R_PLL_STATUS:
         return rnw;/* read only */
-    case SCL:
-    case ARM_PLL_CTRL ... IO_PLL_CTRL:
-    case ARM_PLL_CFG ... IO_PLL_CFG:
-    case ARM_CLK_CTRL ... TOPSW_CLK_CTRL:
-    case FPGA0_CLK_CTRL ... FPGA0_THR_CNT:
-    case FPGA1_CLK_CTRL ... FPGA1_THR_CNT:
-    case FPGA2_CLK_CTRL ... FPGA2_THR_CNT:
-    case FPGA3_CLK_CTRL ... FPGA3_THR_CNT:
-    case BANDGAP_TRIP:
-    case PLL_PREDIVISOR:
-    case CLK_621_TRUE:
-    case PSS_RST_CTRL ... A9_CPU_RST_CTRL:
-    case RS_AWDT_CTRL:
-    case RST_REASON:
-    case REBOOT_STATUS:
-    case APU_CTRL:
-    case WDT_CLK_SEL:
-    case TZ_DMA_NS ... TZ_DMA_PERIPH_NS:
-    case DDR_URGENT:
-    case DDR_URGENT_SEL:
-    case MIO ... MIO + MIO_LENGTH - 1:
-    case MIO_LOOPBACK ... MIO_MST_TRI1:
-    case SD0_WP_CD_SEL:
-    case SD1_WP_CD_SEL:
-    case LVL_SHFTR_EN:
-    case OCM_CFG:
-    case CPU_RAM:
-    case IOU:
-    case DMAC_RAM:
-    case AFI0 ... AFI3 + AFI_LENGTH - 1:
-    case OCM:
-    case DEVCI_RAM:
-    case CSG_RAM:
-    case GPIOB_CTRL ... GPIOB_CFG_CMOS33:
-    case GPIOB_CFG_HSTL:
-    case GPIOB_DRVR_BIAS_CTRL:
-    case DDRIOB ... DDRIOB + DDRIOB_LENGTH - 1:
+    case R_SCL:
+    case R_ARM_PLL_CTRL ... R_IO_PLL_CTRL:
+    case R_ARM_PLL_CFG ... R_IO_PLL_CFG:
+    case R_ARM_CLK_CTRL ... R_TOPSW_CLK_CTRL:
+    case R_FPGA0_CLK_CTRL ... R_FPGA0_THR_CNT:
+    case R_FPGA1_CLK_CTRL ... R_FPGA1_THR_CNT:
+    case R_FPGA2_CLK_CTRL ... R_FPGA2_THR_CNT:
+    case R_FPGA3_CLK_CTRL ... R_FPGA3_THR_CNT:
+    case R_BANDGAP_TRIP:
+    case R_PLL_PREDIVISOR:
+    case R_CLK_621_TRUE:
+    case R_PSS_RST_CTRL ... R_A9_CPU_RST_CTRL:
+    case R_RS_AWDT_CTRL:
+    case R_RST_REASON:
+    case R_REBOOT_STATUS:
+    case R_APU_CTRL:
+    case R_WDT_CLK_SEL:
+    case R_TZ_DMA_NS ... R_TZ_DMA_PERIPH_NS:
+    case R_DDR_URGENT:
+    case R_DDR_URGENT_SEL:
+    case R_MIO ... R_MIO + MIO_LENGTH - 1:
+    case R_MIO_LOOPBACK ... R_MIO_MST_TRI1:
+    case R_SD0_WP_CD_SEL:
+    case R_SD1_WP_CD_SEL:
+    case R_LVL_SHFTR_EN:
+    case R_OCM_CFG:
+    case R_CPU_RAM:
+    case R_IOU:
+    case R_DMAC_RAM:
+    case R_AFI0 ... R_AFI3 + AFI_LENGTH - 1:
+    case R_OCM:
+    case R_DEVCI_RAM:
+    case R_CSG_RAM:
+    case R_GPIOB_CTRL ... R_GPIOB_CFG_CMOS33:
+    case R_GPIOB_CFG_HSTL:
+    case R_GPIOB_DRVR_BIAS_CTRL:
+    case R_DDRIOB ... R_DDRIOB + DDRIOB_LENGTH - 1:
         return true;
     default:
         return false;
@@ -370,24 +370,24 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
     }
 
     switch (offset) {
-    case SCL:
-        s->regs[SCL] = val & 0x1;
+    case R_SCL:
+        s->regs[R_SCL] = val & 0x1;
         return;
-    case LOCK:
+    case R_LOCK:
         if ((val & 0xFFFF) == XILINX_LOCK_KEY) {
             DB_PRINT("XILINX LOCK 0xF8000000 + 0x%x <= 0x%x\n", (int)offset,
                 (unsigned)val & 0xFFFF);
-            s->regs[LOCKSTA] = 1;
+            s->regs[R_LOCKSTA] = 1;
         } else {
             DB_PRINT("WRONG XILINX LOCK KEY 0xF8000000 + 0x%x <= 0x%x\n",
                 (int)offset, (unsigned)val & 0xFFFF);
         }
         return;
-    case UNLOCK:
+    case R_UNLOCK:
         if ((val & 0xFFFF) == XILINX_UNLOCK_KEY) {
             DB_PRINT("XILINX UNLOCK 0xF8000000 + 0x%x <= 0x%x\n", (int)offset,
                 (unsigned)val & 0xFFFF);
-            s->regs[LOCKSTA] = 0;
+            s->regs[R_LOCKSTA] = 0;
         } else {
             DB_PRINT("WRONG XILINX UNLOCK KEY 0xF8000000 + 0x%x <= 0x%x\n",
                 (int)offset, (unsigned)val & 0xFFFF);
@@ -395,7 +395,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
         return;
     }
 
-    if (s->regs[LOCKSTA]) {
+    if (s->regs[R_LOCKSTA]) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "SCLR registers are locked. Unlock them first\n");
         return;
@@ -403,8 +403,8 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
     s->regs[offset] = val;
 
     switch (offset) {
-    case PSS_RST_CTRL:
-        if (val & R_PSS_RST_CTRL_SOFT_RST) {
+    case R_PSS_RST_CTRL:
+        if (FIELD_EX32(val, PSS_RST_CTRL, SOFT_RST)) {
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
         break;
-- 
2.18.0

