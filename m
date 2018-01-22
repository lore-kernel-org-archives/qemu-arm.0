Received: by 10.28.71.27 with SMTP id u27csp3199971wma;
        Mon, 22 Jan 2018 11:51:50 -0800 (PST)
X-Google-Smtp-Source: AH8x224PdjnPs4sva3mCz9qb0pTn+Ax+k13duuHF2y+kXYjYZ3JjAC+Rg0cGHhtd6GhRRcvVlR5z
X-Received: by 10.37.217.144 with SMTP id q138mr8976253ybg.519.1516650710296;
        Mon, 22 Jan 2018 11:51:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650710; cv=none;
        d=google.com; s=arc-20160816;
        b=nI2o/bnomdQAWNamdpud1tEkDsqUkxEPhvBJGPfco1Lu8D0bBIseBB2AukMtoVPlGZ
         D8hFl8sAm/8vPRU/0UA7iqqTHyvervzcrWBRzNSvQdTntopojlEr3xn64llAHKD90wYM
         Xhhaqdznojre5X7BIV3UMULb0lb2fc0Ik587T9MYafeNYOAroWrwNqkdsUrvwK/0nFVF
         FbrQ3IeiOF6QwouCNcRof+/2cz+XvVoepXc3nPxJhJLKlRzerPwgLfTvL5YaAqb2MAC+
         yVFT/dB4tpnUpztGTfN2fAsIBnCGKCN0alehqwh0MsZyS+gyfEnB5MyRrD5Z8W0Tybz6
         Xt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=OBT7+pH2U8mBUpWCPM3SKVbCh05ITnpvaHenoZ45z6U=;
        b=oxCMpIFMI+niqp96jT/JqeEsQUPvpxUzbhXT7VSEHneo7eyNaQKJNKnuaGnhYJI60L
         UiyMbQBL7nCJj067O39LdFZBfIDETc9sRaIZPS6Txe9LAdp8QuIT/ujqAcw3tugIgDUj
         Vl5Ta80eZf/5l15ODv0fx7N7HiiFdNi2xNxGOWvX3lFWkP1oHthfqEcqonBIJ8vJSk2Z
         Wpst7gmaQwV8Douwjzguqat9uSGVbUmYcPKfK+77PiiC/HYqM4frll7peNgW0D0/p7TN
         BvZXKuUCsL+cvH/jXTdGm1WpAZmFHb03aQdT8fa6k7kxVwVce88fKRaF+fXDnTyXh0ZU
         JNKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S49rRT43;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h127si2083669ybc.408.2018.01.22.11.51.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:51:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S49rRT43;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33725 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edi8D-0001D1-ME
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:51:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4S-0006ut-Ce
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:47:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4R-0005zD-DB
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:47:56 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:42244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4R-0005yl-8F; Mon, 22 Jan 2018 14:47:55 -0500
Received: by mail-pg0-x242.google.com with SMTP id q67so7877432pga.9;
	Mon, 22 Jan 2018 11:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OBT7+pH2U8mBUpWCPM3SKVbCh05ITnpvaHenoZ45z6U=;
	b=S49rRT43mU/ysPhmjUpnMOF+YFXgxLRs08PAQT563z0nyYVIRbcPlWKRm/Y9e2wsVW
	WGBOX3x4KJYKXRIzFQ3gXRH8hMK8NmkVRMhimUZkHXYcWiv9d4yxNPSRBEdQtAqJUeQJ
	GU0XYgQk4/JXV3ENjSoQmKqkKxmdGzX/fss+Ib/+SqaU5kO12TgeMZEnZ5vgB8nV5D41
	Vcayfd6LYix9XJsrC9PVxgRv53Z7WU7EGzw1MrkPs94ZJDAQMMaa0ooPMLU2Me8oKdJe
	3xwimcxJDkYqQXouLuOoson1r4wxLtTbLaEPtWAaTvegzqKwPu/1UqVkz7d5A7VAGJ9H
	9oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=OBT7+pH2U8mBUpWCPM3SKVbCh05ITnpvaHenoZ45z6U=;
	b=X0sJVVJn8LkR6VMOzS8nKFaQZX+qUrAbxQpHMWtLWvtDZReIMD+ePkK0b7uZfsnVzy
	+JaEcm2hYLucyQwyyAMQqIqI0UpfSdUYUUhE++8qYG2hSVDy7j0TxgI1OwnrONMmMMQA
	KzHfIrcUdsz+++A8aUeDVtDy6qk4jdTau4aDTyq9EnaD8wjYudWlE8t+Td++znF+bymQ
	/FVbBupIySRHPsYW6EzHaGZ+xGAaZel8tPIdGMtMgJXtIhIWzBGfCfLTLK7hBo+Synwr
	Ip9MV1+2oOb8fw/RgUe8W4+ZTKmOYJTT17jBZJd6pGeQXfPT2G9NBGVfBFgQBpPG+G+z
	tGUA==
X-Gm-Message-State: AKwxytfiIXRcYJQY9wyxPI1E/Uavx01Tt4h/m6nJMqkMDs011ueciurO
	vG0lE8a8WMaUb1dlUJcXiyQOQRSV
X-Received: by 10.101.72.11 with SMTP id h11mr7600937pgs.386.1516650473982;
	Mon, 22 Jan 2018 11:47:53 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	n80sm2531071pfj.79.2018.01.22.11.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:47:52 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:29 -0800
Message-Id: <c7577f92c251176a04ba82a56fc088cd3609800f.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516650109.git.alistair.francis@xilinx.com>
References: <cover.1516650109.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v7 4/9] aarch64-softmmu.mak: Use an ARM
 specific config
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KPyTU9WAwrkO

In preperation for having an ARM and MicroBlaze ZynqMP machine let's
split out the current ARM specific config options.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 default-configs/aarch64-softmmu.mak | 1 +
 hw/arm/Makefile.objs                | 2 +-
 hw/display/Makefile.objs            | 2 +-
 hw/dma/Makefile.objs                | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 24494832cf..9ddccf855e 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -7,3 +7,4 @@ CONFIG_AUX=y
 CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
+CONFIG_XLNX_ZYNQMP_ARM=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2794e086d6..1c896bafb4 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -13,7 +13,7 @@ obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-zcu102.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 551c050a6a..d3a4cb396e 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -40,4 +40,4 @@ virtio-gpu.o-libs += $(VIRGL_LIBS)
 virtio-gpu-3d.o-cflags := $(VIRGL_CFLAGS)
 virtio-gpu-3d.o-libs += $(VIRGL_LIBS)
 obj-$(CONFIG_DPCD) += dpcd.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dp.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dp.o
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 0b3a009b87..c2afecbf73 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -9,6 +9,7 @@ common-obj-$(CONFIG_ZYNQ_DEVCFG) += xlnx-zynq-devcfg.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_dma.o
 common-obj-$(CONFIG_STP2000) += sparc32_dma.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dpdma.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dpdma.o
 
 obj-$(CONFIG_OMAP) += omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_dma.o
-- 
2.14.1

