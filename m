Received: by 10.28.91.67 with SMTP id p64csp2317739wmb;
        Sat, 10 Mar 2018 15:05:24 -0800 (PST)
X-Google-Smtp-Source: AG47ELvp4oqILyz2jup5lElnbuS8jeN2SsVhQTIS7fKlcLfa1642OBxnLvJQvD+PE8OOkyv/cbwC
X-Received: by 10.129.161.16 with SMTP id y16mr1836120ywg.168.1520723124846;
        Sat, 10 Mar 2018 15:05:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520723124; cv=none;
        d=google.com; s=arc-20160816;
        b=mOuI141UVugUwUXKx1KQZj3MKp5dgKC64fYtoQtZAxC8TsEOMR8o0fmE5nwJBShixp
         xCZ0GuW8OJKbWfb1e43k/A1Fnir9dGvg+PHX9zU+i1JCT+w66kJC7frB90nvkW4ikixt
         c18u4VlGGtANCS2ur0d1mVeE+g1IIVC8rFxD+pAELCXwg+AyWlppOvaS+cYrlFfD35Ts
         UYKNnA6LekDEI6tilk/OTO7g5/8KIu79KoWXjr7QhypR8p9EMuSRywx1ehfj0J636vm4
         JIZG9D+EhUpe/mS8UEpdl0y2FSql8DcNJFetnbyWGIcsPznN4ZKoXCNGOxIws+ov+uqY
         iMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=/mcDUVO8nrsCMbde6+gwDE9hnkVSkdmm6aodBGXjL3w=;
        b=HqG6o8X14a2BHYBDjf6wjEWt7OH4tlVoTmnsEDPcsPNw3RPrSzUvuWrKBpzXpLcAI9
         qoibuul8VkKeps/d3xePMS4Y2ruj3T48ik12KA266gdVtNwII4NoNqY+BJT030IzipPg
         oelw6PEx5ltKrNWF3atacqVvP9tQeXYFHzhRRHEq1ijMrgzocj3FMq+TkoAj9PlXjX7r
         ata8iRLV2W4LgtjMBS+qNUbBCo5Mo82F1ZtGjkFMBMjMB355NO9yhRCHfceaNQeKOflR
         ZMVjtQFvd2uS8YIOco5WFCYqNQ4a//ZzTlwe3IMsV2vfkqvwPbtjgSko4FdS/xLeXmfl
         pswQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dr02s216;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si751846ywd.627.2018.03.10.15.05.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Mar 2018 15:05:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dr02s216;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eunYK-0005y1-8u
	for alex.bennee@linaro.org; Sat, 10 Mar 2018 18:05:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1eunXz-0005wC-NS
	for qemu-arm@nongnu.org; Sat, 10 Mar 2018 18:05:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1eunXy-0003bl-DQ
	for qemu-arm@nongnu.org; Sat, 10 Mar 2018 18:05:03 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:41353)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1eunXs-0003aX-6f; Sat, 10 Mar 2018 18:04:56 -0500
Received: by mail-pf0-x243.google.com with SMTP id f80so2773370pfa.8;
	Sat, 10 Mar 2018 15:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/mcDUVO8nrsCMbde6+gwDE9hnkVSkdmm6aodBGXjL3w=;
	b=dr02s216bRg/CYT0Vvo0oEmFo1LK3gn9U16BkDrFtDT84DsI4G4tQHW7o1r4Xzsy9e
	+8qaQrrmEidOf4pJ6hMyrxtKizbbqDy5D7v6AeTFxAtCG2R3wG8/5p8CzP12oQEY5Hh/
	PUlapnjHpaG+01KrGOoZfra6lJvu5vk4MCwyZWloYyuzDOISAtvnAiRBRu4ms6/Juf9f
	qsXM5qrW/2KqLj8lCxtpYU0uQD1Z+oZyszhrDUoq0lBN68CYRXyvoPBvlWPfJ2GgfoRb
	ryO+p8IAVjmGLRXbXNxTXXRfewwRtS5x/53Ml9UjNNPDH/PzdcLnTNuHyHtwqGnLXua6
	xuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=/mcDUVO8nrsCMbde6+gwDE9hnkVSkdmm6aodBGXjL3w=;
	b=WJ29zDvro3Brut5XWltut9zWvYShq9R8j8QijgdAmLjY83PBFb8WnMRfcNoBnQQxPQ
	GPTVF/LwUPA5E36ss4T/EAnC1guZsH5YoDC4Ec9UCmXtj+ztt+8XtBi/r3nNeQg9wFsl
	F/iP9P843VASL5+MEZEtET9Ih0aywo3/4W5kXQx7XCPFrSUY1zKAtrJz0/2rBaeSRDhF
	IDQii8ZC6o1juhsHEM7//UeDEScKICdAKT5MiTEfv9jufZuMhonNc1KpfMX9+z5p2OWl
	7QxvhmU86yCpJpuLoO3p4GycxcdaFTRy7v+dP5ONvT32ABWXwMIKaBJioaoVkdmJIoba
	IFpQ==
X-Gm-Message-State: AElRT7FioydBcbmha70zqMebUzW6EYfI4zCpPH2iUK5vCx8L49lvhzVa
	5WrKxKRw3ISvXz5cJwFn+4s=
X-Received: by 10.101.98.17 with SMTP id d17mr2669002pgv.221.1520723093615;
	Sat, 10 Mar 2018 15:04:53 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
	[108.223.40.66])
	by smtp.gmail.com with ESMTPSA id p1sm8432755pgr.67.2018.03.10.15.04.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Mar 2018 15:04:52 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Mar 2018 15:04:50 -0800
Message-Id: <1520723090-22130-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3] fsl-imx6: Swap Ethernet interrupt defines
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
Cc: wpaul@windriver.com, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Chris Healy <cphealy@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pfwrnCFpXjUf

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
v3: More prosa
v2: Generate Ethernet interrupts on both interrupt lines

 hw/net/imx_fec.c          | 28 +++++++++++++++++++++++++++-
 include/hw/arm/fsl-imx6.h |  4 ++--
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 9506f9b..6e297c5 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -417,7 +417,33 @@ static void imx_enet_write_bd(IMXENETBufDesc *bd, dma_addr_t addr)
 
 static void imx_eth_update(IMXFECState *s)
 {
-    if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] & ENET_INT_TS_TIMER) {
+    /*
+     * Previous versions of qemu had the ENET_INT_MAC and ENET_INT_TS_TIMER
+     * interrupts swapped. This worked with older versions of Linux (4.14
+     * and older) since Linux associated both interrupt lines with Ethernet
+     * MAC interrupts. Specifically,
+     * - Linux 4.15 and later have separate interrupt handlers for the MAC and
+     *   timer interrupts. Those versions of Linux fail with versions of QEMU
+     *   with swapped interrupt assignments.
+     * - In linux 4.14, both interrupt lines were registered with the Ethernet
+     *   MAC interrupt handler. As a result, all versions of qemu happen to
+     *   work, though that is accidental.
+     * - In Linux 4.9 and older, the timer interrupt was registered directly
+     *   with the Ethernet MAC interrupt handler. The MAC interrupt was
+     *   redirected to a GPIO interrupt to work around erratum ERR006687.
+     *   This was implemented using the SOC's IOMUX block. In qemu, this GPIO
+     *   interrupt never fired since IOMUX is currently not supported in qemu.
+     *   Linux instead received MAC interrupts on the timer interrupt.
+     *   As a result, qemu versions with the swapped interrupt assignment work,
+     *   albeit accidentally, but qemu versions with the correct interrupt
+     *   assignment fail.
+     *
+     * To ensure that all versions of Linux work, generate ENET_INT_MAC
+     * interrrupts on both interrupt lines. This should be changed if and when
+     * qemu supports IOMUX.
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

