Received: by 10.28.91.67 with SMTP id p64csp1274795wmb;
        Fri, 9 Mar 2018 13:51:30 -0800 (PST)
X-Google-Smtp-Source: AG47ELvqJi6yPi6kI6quYj6JkugOk/mokxLGIAsf7TijFkm2dtdhxNJ65nW9X5lJqGBerg+tibyl
X-Received: by 10.129.233.2 with SMTP id d2mr20059744ywm.213.1520632290553;
        Fri, 09 Mar 2018 13:51:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520632290; cv=none;
        d=google.com; s=arc-20160816;
        b=TGkXhUTX2Ioyn9aHhD6URyBwKeDB7FoNdkyLu5oAbyaYVcBNaixyuRQIw2mIF2R2NY
         XUMXodSPAmuea7E3c9SOzR6ipSYiIGFFUjEquI15x7wvDz5G5pMsMdu7Z9d0kWWogv8B
         PBxOg1MQk9X/YhoeKHaOBAV3NVmB7UXntgHpHl/dcwdHPEa+KxKjhhHbkFqOqqrhRvJn
         MAi2WYMioJZnRM4GfJmwCVU+rqZKLPSyfIJd7CzZyS1ZY9K4UX7jOxszX1wcYr1wxalN
         D39RxPdtEQRMBLFfPR4BLl7Nwsm2C9V2quooOXXmNVzuTd5GVIVersc4UkYek/gzkljB
         N0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=xhborW+vJ12oySCHu5Z2LSdKIUebBdfHzN933ENyTF4=;
        b=AGBB0/6KpixUzSqWsWx01tSSLYiCgCRlLDP+WxBIoPw6U5hJt/EtB+Ge4n7q8H2sDX
         yEnz1NzrKFBj77cISrE2u0kkZcR0vifrmqov1qpOnC7rbCqLhm+3/rR7QlUfFtef7DVa
         peP9wRFVqSV2OiEJLise5qLGTZ/cGEHXonvoGDiCsBgXCALcXgvw1RCiAjMrSBYL1O3F
         ENX14afPMqJomK4Migaa01JGIjpc4nKslURLpOhTfVJrTJPn+ZCi/EebDulVZeT5WPOX
         4rNlSg4+5bplV7tSqVjSACfQSn0tk5aH7aTlWdCP+9ESk7vHbeV3l6vS9euPc41JctBa
         fHNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EZI3Pgm/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y3-v6si323708yba.504.2018.03.09.13.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 13:51:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EZI3Pgm/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euPvG-0002FR-0m
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 16:51:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1euPrD-0007jT-49
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 16:47:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1euPr6-0000yc-NS
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 16:47:17 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:38515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1euPr6-0000yL-Ed; Fri, 09 Mar 2018 16:47:12 -0500
Received: by mail-pl0-x244.google.com with SMTP id m22-v6so5943401pls.5;
	Fri, 09 Mar 2018 13:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=xhborW+vJ12oySCHu5Z2LSdKIUebBdfHzN933ENyTF4=;
	b=EZI3Pgm/PbTr63LQRpQVuO/266hmgZwA4lRYlmM4sEz0xUhpOcYuuEGllBxTVPXGl0
	26P+8Zu224W0hi9wjTfWhuMSKDmE/sWnYm2t+bVig8dbJB6kILAE25dG9H6Ro7fiDiBa
	87fSykFgG/MK4slZMYROo4JBxEzX6hJkLfRh3/EGPlbO1oLl16SxgAZy0Npn6yUKLPPR
	FJnGuVINiIOoTAvsHuNd0JnSEinEe23QzXDf6aJArqcycNfLDeA0jLC5cqr4r8isuYrs
	uCsd9A+Ne9FgDYH5IitomQzrcfpisILBAndOMdcw3qmGsOgwmPeXIMfhMj0MwKsq34Jv
	6r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=xhborW+vJ12oySCHu5Z2LSdKIUebBdfHzN933ENyTF4=;
	b=d7dfZWOZmrMa+GNjhK9tOZCC3SZmkVE1yWvVHv/SXKGjF1MCti++t7QLCNjaHz8aQ+
	LVLpbNLZF2krBkUX96it2Lt9L9pj8vOklXjtNndvFJpNweuk9IOlqwZH5v+hmG3d2KyB
	tRfyXneBDn6ttWFYUdNxHVXeZeuX/i0yuTpwWyGrF0LXVKIvLSqSnDeSUJ/jH7Hicwsb
	1FlQVLNt3m7g+YwKFHQaYADsbC6iCvZTycAI0Q3omPUb4Th6xrxP4xikiya7ZDDJBXf4
	alM4FHwjNQST5KU3Kl8eZ/cY5b58g1S70gvrGrRAxkhi49Gl0tnWfs4LDY1WozCsg3gK
	44EQ==
X-Gm-Message-State: APf1xPADRynwkLnuxeMxWnSHql9GPGnZRKKyHfftu1KQXoVhcxewx4Gd
	ElCZSQYEE+1iM3Qgs97pBQU=
X-Received: by 2002:a17:902:7b92:: with SMTP id
	w18-v6mr28554900pll.159.1520632029882; 
	Fri, 09 Mar 2018 13:47:09 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
	[108.223.40.66]) by smtp.gmail.com with ESMTPSA id
	h67sm5801054pfk.184.2018.03.09.13.47.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 13:47:09 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Mar 2018 13:47:03 -0800
Message-Id: <1520632024-31535-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v2] fsl-imx6: Swap Ethernet interrupt defines
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
Cc: Bill Paul <wpaul@windriver.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Guenter Roeck <linux@roeck-us.net>, Chris Healy <cphealy@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JaF2f+cutjUT

The sabrelite machine model used by qemu-system-arm is based on the
Freescale/NXP i.MX6Q processor. This SoC has an on-board ethernet
controller which is supported in QEMU using the imx_fec.c module
(actually called imx.enet for this model.)

The include/hw/arm/fsm-imx6.h file defines the interrupt vectors for the
imx.enet device like this:

 #define FSL_IMX6_ENET_MAC_1588_IRQ 118
 #define FSL_IMX6_ENET_MAC_IRQ 119

According to https://www.nxp.com/docs/en/reference-manual/IMX6DQRM.pdf,
page 225, in Table 3-1. ARM Cortex A9 domain interrupt summary,
interrupts are as follows.

150 ENET MAC 0 IRQ
151 ENET MAC 0 1588 Timer interrupt

where

150 - 32 == 118
151 - 32 == 119

In other words, the vector definitions in the fsl-imx6.h file are reversed.

Fixing the interrupts alone causes problems with older Linux kernels:
The Ethernet interface will fail to probe with Linux v4.9 and earlier.
Linux v4.1 and earlier will crash due to a bug in Ethernet driver probe
error handling. This is a Linux kernel problem, not a qemu problem:
the Linux kernel only worked by accident since it requested both interrupts.

For backward compatibility, generate the Ethernet interrupt on both interrupt
lines. This was shown to work from all Linux kernel releases starting with
v3.16.

Link: https://bugs.launchpad.net/qemu/+bug/1753309
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Generate Ethernet interrupts on both interrupt lines

 hw/net/imx_fec.c          | 7 ++++++-
 include/hw/arm/fsl-imx6.h | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 9506f9b..d3ae7db 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -417,7 +417,12 @@ static void imx_enet_write_bd(IMXENETBufDesc *bd, dma_addr_t addr)
 
 static void imx_eth_update(IMXFECState *s)
 {
-    if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] & ENET_INT_TS_TIMER) {
+    /*
+     * Generate ENET_INT_MAC interrrupts on both interrupt lines for
+     * backward compatibility with Linux kernel versions 4.9 and older.
+     */
+    if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] &
+        (ENET_INT_MAC | ENET_INT_TS_TIMER)) {
         qemu_set_irq(s->irq[1], 1);
     } else {
         qemu_set_irq(s->irq[1], 0);
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index ec6c509..06f8aae 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -438,8 +438,8 @@ typedef struct FslIMX6State {
 #define FSL_IMX6_HDMI_MASTER_IRQ 115
 #define FSL_IMX6_HDMI_CEC_IRQ 116
 #define FSL_IMX6_MLB150_LOW_IRQ 117
-#define FSL_IMX6_ENET_MAC_1588_IRQ 118
-#define FSL_IMX6_ENET_MAC_IRQ 119
+#define FSL_IMX6_ENET_MAC_IRQ 118
+#define FSL_IMX6_ENET_MAC_1588_IRQ 119
 #define FSL_IMX6_PCIE1_IRQ 120
 #define FSL_IMX6_PCIE2_IRQ 121
 #define FSL_IMX6_PCIE3_IRQ 122
-- 
2.7.4

