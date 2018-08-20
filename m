Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp734654wrd;
        Mon, 20 Aug 2018 07:12:33 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY0oWo3Ci/0xuTL3F90nRSQN40ehavdxwP7wI5SF+nmDogbmzCFfphV3pcAGQGiKp1l5QgI
X-Received: by 2002:a0c:9523:: with SMTP id l32-v6mr6381471qvl.219.1534774353002;
        Mon, 20 Aug 2018 07:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774352; cv=none;
        d=google.com; s=arc-20160816;
        b=u9Ra90vSU6+381fulMNs2VodAjONtiDozuEV647yyNBvEQe3PbKHCZ2D1Gh6VFhGIx
         yHDm+SoeU2VAbR/JL7OS1/Kft+D7xc9M4NB0VvXd9YoMH7XoQIuHvfKnG8dI1QnpCSct
         ppmtGpmic/ab7IdYceZ3/rn7XzEuAIezPcXOF2pyucexmHG8+39TWd42+7fHopDCZD9I
         C5iVVI7JkOEAgrB1hBX+ay1c/gKwuDgmUkLi1I2PiMoCIUoRcl0tEmTIU/bcujHGCxZ4
         bUziRjLOGinn829Zbn2505/ZSwjhuPc/pyXBVPi04NlMVpDnOojhCmjlgPEnX0GsCnEj
         TgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2cOjDd3UdRp80PmmK4gl9a6wEpE05RQfWgdvQEVK/pc=;
        b=EfbBHykZP+O6D/1GlGgO710GvO2M+zaKu/T9WDBp4X4Qjr2JpiGht73qAmekUGuLmp
         m7b92HRkq9quPhbySLlF17cqDMBg2v8azeruRp5BoT0v51Fwj526qgIzNWGI/dWdT4xZ
         WHII5FptjwGaztCgjKDuk3bDLCmRgpNDZJH7QEnZkI2EUmEtaZ3Uiu5bnlK6o8Tes3z+
         Fs+Wvh1xeUkrZ9evJfoaQ6JG3k7qu7FzF4AOqk6/o2gn6aKzAIIL9jiDK/YChfLAKwIH
         WL5ce4WHEZngLX1PL7/sOOrh4++errJFVD8TNhx91uXKmIQiAIYYiBtnZ3veV5dngmfx
         aziA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w3-v6si4532749qvw.271.2018.08.20.07.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:12:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frkv2-0004CF-DJ
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:12:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku7-0003XZ-Rm
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku6-0007IJ-U2
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frku6-0007Hi-M4; Mon, 20 Aug 2018 10:11:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frku5-0003RU-PL; Mon, 20 Aug 2018 15:11:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:07 +0100
Message-Id: <20180820141116.9118-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 13/22] hw/arm/iotkit: Wire up the lines for MSCs
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vdUyjKNPycPr

The IoTKit doesn't have any MSCs itself but it does need
some wiring to connect the external signals from MSCs
in the outer board model up to the registers and the
NVIC IRQ line.

We also need to expose a MemoryRegion corresponding to
the AHB bus, so that MSCs in the outer board model can
use that as their downstream port. (In the FPGA this is
the "AHB Slave Expansion" ports shown in the block
diagram in the AN505 documentation.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/iotkit.h |  8 ++++++++
 hw/arm/iotkit.c         | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index 426dc326a0d..3a8ee639085 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -28,6 +28,9 @@
  *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts
  *  + Named GPIO inputs "EXP_IRQ" 0..n are the expansion interrupts, which
  *    are wired to the NVIC lines 32 .. n+32
+ *  + sysbus MMIO region 0 is the "AHB Slave Expansion" which allows
+ *    bus master devices in the board model to make transactions into
+ *    all the devices and memory areas in the IoTKit
  * Controlling up to 4 AHB expansion PPBs which a system using the IoTKit
  * might provide:
  *  + named GPIO outputs apb_ppcexp{0,1,2,3}_nonsec[0..15]
@@ -45,6 +48,11 @@
  * Controlling each of the 16 expansion MPCs which a system using the IoTKit
  * might provide:
  *  + named GPIO inputs mpcexp_status[0..15]
+ * Controlling each of the 16 expansion MSCs which a system using the IoTKit
+ * might provide:
+ *  + named GPIO inputs mscexp_status[0..15]
+ *  + named GPIO outputs mscexp_clear[0..15]
+ *  + named GPIO outputs mscexp_ns[0..15]
  */
 
 #ifndef IOTKIT_H
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index f8276b5425c..8742200fb42 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -667,6 +667,21 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
 
     iotkit_forward_sec_resp_cfg(s);
 
+    /* Forward the MSC related signals */
+    qdev_pass_gpios(dev_secctl, dev, "mscexp_status");
+    qdev_pass_gpios(dev_secctl, dev, "mscexp_clear");
+    qdev_pass_gpios(dev_secctl, dev, "mscexp_ns");
+    qdev_connect_gpio_out_named(dev_secctl, "msc_irq", 0,
+                                qdev_get_gpio_in(DEVICE(&s->armv7m), 11));
+
+    /*
+     * Expose our container region to the board model; this corresponds
+     * to the AHB Slave Expansion ports which allow bus master devices
+     * (eg DMA controllers) in the board model to make transactions into
+     * devices in the IoTKit.
+     */
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
+
     system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
 }
 
-- 
2.18.0

