Received: by 10.25.159.131 with SMTP id i125csp113972lfe;
        Tue, 29 Nov 2016 21:37:26 -0800 (PST)
X-Received: by 10.55.209.90 with SMTP id s87mr25609591qki.99.1480484246710;
        Tue, 29 Nov 2016 21:37:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v54si29375855qtc.177.2016.11.29.21.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 21:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBxaA-0000aW-3j
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 00:37:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZw-0000QT-A5
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZs-0005LI-VI
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54709
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cBxZs-0005Kk-Oo
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:08 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAU5Y9k5081215
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:08 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
	by mx0b-001b2d01.pphosted.com with ESMTP id 271kr4dqf0-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:07 -0500
Received: from localhost
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 30 Nov 2016 15:37:05 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 30 Nov 2016 15:37:02 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 5A99C2BB0060;
	Wed, 30 Nov 2016 16:37:02 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAU5b2KV36241478; Wed, 30 Nov 2016 16:37:02 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAU5b1M7003382; Wed, 30 Nov 2016 16:37:02 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAU5b1cc003379; Wed, 30 Nov 2016 16:37:01 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 01932A0226;
	Wed, 30 Nov 2016 16:37:01 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Wed, 30 Nov 2016 16:36:24 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161130053629.23340-1-alastair@au1.ibm.com>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16113005-0044-0000-0000-0000020A8EB6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16113005-0045-0000-0000-00000615559E
Message-Id: <20161130053629.23340-2-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611300092
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-arm] [PATCH v2 1/6] arm: Uniquely name imx25 I2C buses.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGTwikMFJIIm

From: Alastair D'Silva <alastair@d-silva.org>

The imx25 chip provides 3 i2c buses, but they have all been named
"i2c", which makes it difficult to predict which bus a device will
be connected to when specified on the command line.

This patch addresses the issue by naming the buses uniquely:
  i2c.0 i2c.1 i2c.2

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/arm/imx25_pdk.c | 4 +---
 hw/i2c/imx_i2c.c   | 6 +++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 025b608..c6f04d3 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -138,9 +138,7 @@ static void imx25_pdk_init(MachineState *machine)
          * We add it here (only on qtest usage) to be able to do a bit
          * of simple qtest. See "make check" for details.
          */
-        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
-                                                      "i2c"),
-                         "ds1338", 0x68);
+        i2c_create_slave(s->soc.i2c[0].bus, "ds1338", 0x68);
     }
 }
 
diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index 37e5a62..7be10fb 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -305,12 +305,16 @@ static const VMStateDescription imx_i2c_vmstate = {
 static void imx_i2c_realize(DeviceState *dev, Error **errp)
 {
     IMXI2CState *s = IMX_I2C(dev);
+    static int bus_count;
+    char name[16];
+
+    snprintf(name, sizeof(name), "i2c.%d", bus_count++);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &imx_i2c_ops, s, TYPE_IMX_I2C,
                           IMX_I2C_MEM_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
-    s->bus = i2c_init_bus(DEVICE(dev), "i2c");
+    s->bus = i2c_init_bus(DEVICE(dev), name);
 }
 
 static void imx_i2c_class_init(ObjectClass *klass, void *data)
-- 
2.9.3

