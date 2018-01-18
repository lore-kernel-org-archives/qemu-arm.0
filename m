Received: by 10.28.173.206 with SMTP id w197csp6871902wme;
        Thu, 18 Jan 2018 10:45:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBouQPtKLNEKm2vksGSg1ZnosqKAQ7gpREPFkRf/y/87kClyg94ALQecUyLNOdwut1ae+pdHa
X-Received: by 10.13.205.3 with SMTP id p3mr6572972ywd.377.1516301141281;
        Thu, 18 Jan 2018 10:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516301141; cv=none;
        d=google.com; s=arc-20160816;
        b=Oz2YBghAvSqP2qh7unQWAzq0t7TtgnXN8TeYSSiOHkp2w214ZJJhoiruegOn4VUPn8
         aMgVgdu+Moq/GH4LxVupBZygxcGZTs0xRi2xulvoxJUw/JwsgezQhkq3pRgAt13pAkaF
         XPYXYBY/JIJW1oRUQ8R+9fl9Cv3aJ6XQ6aWdUhi90OCRJZxq1HQidR07DyZGHDZfYeb7
         mylgkCnOz7YtqJrCo+QEnLDYuAWD5iddsPoCs9Pj+Zut5Yu7OhkxXJHc4hhHSIJAzV1V
         qrSX0Q/p/vW/urjqmZJkUI+PUA+oxIoV5y9/K2sUZ/vMLhcETPYH52+ZL7527bCqpl2e
         p/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=OBT7+pH2U8mBUpWCPM3SKVbCh05ITnpvaHenoZ45z6U=;
        b=beS+Agc15jClzK3r2RjllOsCPelAHIDboGvn4FEx2xY+ejU+SwXTOn0IYNZC9WkW7y
         thvkjQqBC+3vQAeB4y5JSxdtPtS6jcvb3EG+3E9H4QXO3BwKSmbeDLYAAPmeN0ccJ1hb
         emckfqTY+FLpTGXRk971XXqR2PLkgjH/A3Mljb/VOH6XYouDOsT1sb+hvw9kjYHeEqag
         6BGEFjNkATw1wc5OQDmD7g/43jl1HzdNgAWZlR5uqKHKryHpLQszwAXlQB4+EQXKu67s
         TynsOZTjaVFV5tE8tMqLw2PS8fzjfBstDJlxRfjn6/CzaGVBENZFE+YsQkKbLwBaFGoi
         1yUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HDqcapHh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si234456ybk.401.2018.01.18.10.45.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:45:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HDqcapHh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFC0-0001xU-Km
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:45:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8y-0007ee-HD
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 13:42:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8x-00035n-J6
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 13:42:32 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33717)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF8u-00031a-Pi; Thu, 18 Jan 2018 13:42:28 -0500
Received: by mail-pf0-x243.google.com with SMTP id t5so9194693pfi.0;
	Thu, 18 Jan 2018 10:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OBT7+pH2U8mBUpWCPM3SKVbCh05ITnpvaHenoZ45z6U=;
	b=HDqcapHhn2lKgAYPwI4NkEhx4w0xspdhv7AAQp+QuA17Ie6RWnng4lhPB1/VqHNjJz
	nQVnD53vZTR6yNXo52FNJkqPGiAWde4K7XW+Xp/+LgRrqRoIyM7mwwIMuIlM2zL2USUi
	xVpvSUg8KF62IBvDTnkvNXx118PC2X7E/mEKplk0UxXvHpdBPLM11f6U+DpticmzubZn
	8iiO5soCCpffuPaYwvdWPPERouUi+oZn4QYxG+4SZVUkt6U8x9UKVOzllxjsc1yTlEwC
	GbkSwwEsgb09J+8MFfloDmasMxYXpSQj+4VOzayd7LJVtrzYkZWJJFu7OuXIU3AHbCr8
	zBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=OBT7+pH2U8mBUpWCPM3SKVbCh05ITnpvaHenoZ45z6U=;
	b=EsML4tPkyUWssNpAQHYoGqS4AA8DMYfVkE8UWz+IiXZHn5q2K3lvrRslRe4xBAnCK2
	zJdXIVz27uOoaib8FYWnNF45JsZaSwfatGsocKyN7mJ5xAXRt+/kXkuAhNu4eZr6z6X7
	Qeq5WRvrvgzEv85f+AcrT5FY9lzpNLsPmbFZGY8PUw/9P5bmNcu9s4O8S8PRfXORZXOp
	Mo/+7mMZGvnQ0yZzkPKaE24VtcQIs//e8Sc1ZUulaYGaSXWfKn7RZxOqrD2BOxWR1D/T
	YKv8JDKjC49ywSsh4BLdgugDiAtMzFTJqlRHZ9hnpeInJkRxqnPA45FY4BmGWIORfQzJ
	Bk5g==
X-Gm-Message-State: AKwxytcQZtwO4jKcSLx7S1urd9OGe0kQFIMasDAXTJY2Ql1Dt2HW9H7z
	RudwU2pBZLy9T47d4lv91rBuK+CywFM=
X-Received: by 10.99.113.15 with SMTP id m15mr27587013pgc.236.1516300947542;
	Thu, 18 Jan 2018 10:42:27 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	q6sm12340215pgv.72.2018.01.18.10.42.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:26 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:38:01 -0800
Message-Id: <1506ab87ec5fce7d19a7b83fab9148552b54dcbb.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516300623.git.alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v6 4/9] aarch64-softmmu.mak: Use an ARM specific
 config
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+cQtXjBifwa

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

