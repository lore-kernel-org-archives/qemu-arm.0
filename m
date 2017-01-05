Received: by 10.25.205.13 with SMTP id d13csp9581494lfg;
        Wed, 4 Jan 2017 20:39:36 -0800 (PST)
X-Received: by 10.55.48.9 with SMTP id w9mr65322065qkw.49.1483591176062;
        Wed, 04 Jan 2017 20:39:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t42si36764520qtb.124.2017.01.04.20.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jan 2017 20:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cOzpt-0004Vb-EF
	for alex.bennee@linaro.org; Wed, 04 Jan 2017 23:39:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cOzmH-0001gR-Cv
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cOzmE-0001Pf-6N
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cOzmD-0001OM-Qj
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:46 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	v054XnBB043732
	for <qemu-devel@nongnu.org>; Wed, 4 Jan 2017 23:35:44 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
	by mx0a-001b2d01.pphosted.com with ESMTP id 27s6qcjjth-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Wed, 04 Jan 2017 23:35:44 -0500
Received: from localhost
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 5 Jan 2017 14:35:41 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 5 Jan 2017 14:35:39 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id EAF5B3578067;
	Thu,  5 Jan 2017 15:35:38 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v054ZctJ47644862; Thu, 5 Jan 2017 15:35:38 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	v054ZbOV031499; Thu, 5 Jan 2017 15:35:38 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	v054Zba8031479; Thu, 5 Jan 2017 15:35:37 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5525DA0247;
	Thu,  5 Jan 2017 15:35:37 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Date: Thu,  5 Jan 2017 15:34:24 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170105043430.3176-1-alastair@au1.ibm.com>
References: <20170105043430.3176-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17010504-0044-0000-0000-000002194708
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17010504-0045-0000-0000-0000064C781D
Message-Id: <20170105043430.3176-2-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-05_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701050074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v5 1/7] arm: Uniquely name imx25 I2C buses.
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gSdX6qfs9iBu

From: Alastair D'Silva <alastair@d-silva.org>

The imx25 chip provides 3 i2c buses, but they have all been named
"i2c", which makes it difficult to predict which bus a device will
be connected to when specified on the command line.

This patch addresses the issue by naming the buses uniquely:
  i2c-bus.0 i2c-bus.1 i2c-bus.2

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/arm/imx25_pdk.c | 2 +-
 hw/i2c/imx_i2c.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 025b608..44e741f 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -139,7 +139,7 @@ static void imx25_pdk_init(MachineState *machine)
          * of simple qtest. See "make check" for details.
          */
         i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
-                                                      "i2c"),
+                                                      "i2c-bus.0"),
                          "ds1338", 0x68);
     }
 }
diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index 37e5a62..6c81b98 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -310,7 +310,7 @@ static void imx_i2c_realize(DeviceState *dev, Error **errp)
                           IMX_I2C_MEM_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
-    s->bus = i2c_init_bus(DEVICE(dev), "i2c");
+    s->bus = i2c_init_bus(DEVICE(dev), NULL);
 }
 
 static void imx_i2c_class_init(ObjectClass *klass, void *data)
-- 
2.9.3

