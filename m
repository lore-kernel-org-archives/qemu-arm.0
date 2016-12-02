Received: by 10.25.159.131 with SMTP id i125csp95831lfe;
        Thu, 1 Dec 2016 21:52:58 -0800 (PST)
X-Received: by 10.200.35.105 with SMTP id b38mr36885032qtb.28.1480657978644;
        Thu, 01 Dec 2016 21:52:58 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si2159401qta.222.2016.12.01.21.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Dec 2016 21:52:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCgmH-0002Ip-Fa
	for alex.bennee@linaro.org; Fri, 02 Dec 2016 00:52:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCggm-0006ga-CY
	for qemu-devel@nongnu.org; Fri, 02 Dec 2016 00:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCggj-0001O0-4W
	for qemu-devel@nongnu.org; Fri, 02 Dec 2016 00:47:16 -0500
Received: from 001b2d01.pphosted.com ([148.163.156.1]:48799
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cCggi-0001Nd-R6
	for qemu-devel@nongnu.org; Fri, 02 Dec 2016 00:47:13 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uB25d96H137337
	for <qemu-devel@nongnu.org>; Fri, 2 Dec 2016 00:47:11 -0500
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2731h46dub-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Fri, 02 Dec 2016 00:47:11 -0500
Received: from localhost
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Fri, 2 Dec 2016 15:47:09 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2016 15:47:07 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id E08E12BB005B;
	Fri,  2 Dec 2016 16:47:06 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
	by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uB25l6mb7668132; Fri, 2 Dec 2016 16:47:06 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uB25l6D8031454; Fri, 2 Dec 2016 16:47:06 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uB25l578031449; Fri, 2 Dec 2016 16:47:05 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7A882A01FA;
	Fri,  2 Dec 2016 16:47:05 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Fri,  2 Dec 2016 16:46:13 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161202054617.6749-1-alastair@au1.ibm.com>
References: <20161202054617.6749-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120205-0004-0000-0000-000001C293D4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120205-0005-0000-0000-0000093B39F0
Message-Id: <20161202054617.6749-4-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-02_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612020099
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v3 3/7] hw/i2c: Add a NULL check for i2c slave
 init callbacks
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aEKWBlGBLNbO

From: Alastair D'Silva <alastair@d-silva.org>

Add a NULL check for i2c slave init callbacks, so that we no longer need to implement empty init functions.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/arm/pxa2xx.c   | 7 -------
 hw/arm/tosa.c     | 7 -------
 hw/arm/z2.c       | 7 -------
 hw/i2c/core.c     | 6 +++++-
 hw/timer/ds1338.c | 6 ------
 5 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 8aa0f8a..bdcf6bc 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1449,17 +1449,10 @@ static const VMStateDescription vmstate_pxa2xx_i2c = {
     }
 };
 
-static int pxa2xx_i2c_slave_init(I2CSlave *i2c)
-{
-    /* Nothing to do.  */
-    return 0;
-}
-
 static void pxa2xx_i2c_slave_class_init(ObjectClass *klass, void *data)
 {
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
 
-    k->init = pxa2xx_i2c_slave_init;
     k->event = pxa2xx_i2c_event;
     k->recv = pxa2xx_i2c_rx;
     k->send = pxa2xx_i2c_tx;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 1ee12f4..39d9dbb 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -202,12 +202,6 @@ static int tosa_dac_recv(I2CSlave *s)
     return -1;
 }
 
-static int tosa_dac_init(I2CSlave *i2c)
-{
-    /* Nothing to do.  */
-    return 0;
-}
-
 static void tosa_tg_init(PXA2xxState *cpu)
 {
     I2CBus *bus = pxa2xx_i2c_bus(cpu->i2c[0]);
@@ -275,7 +269,6 @@ static void tosa_dac_class_init(ObjectClass *klass, void *data)
 {
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
 
-    k->init = tosa_dac_init;
     k->event = tosa_dac_event;
     k->recv = tosa_dac_recv;
     k->send = tosa_dac_send;
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 68a92f3..b3a6bbd 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -263,12 +263,6 @@ static int aer915_recv(I2CSlave *slave)
     return retval;
 }
 
-static int aer915_init(I2CSlave *i2c)
-{
-    /* Nothing to do.  */
-    return 0;
-}
-
 static VMStateDescription vmstate_aer915_state = {
     .name = "aer915",
     .version_id = 1,
@@ -285,7 +279,6 @@ static void aer915_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
 
-    k->init = aer915_init;
     k->event = aer915_event;
     k->recv = aer915_recv;
     k->send = aer915_send;
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index abd4c4c..ae3ca94 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -260,7 +260,11 @@ static int i2c_slave_qdev_init(DeviceState *dev)
     I2CSlave *s = I2C_SLAVE(dev);
     I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(s);
 
-    return sc->init(s);
+    if (sc->init) {
+        return sc->init(s);
+    } else {
+        return 0;
+    }
 }
 
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
diff --git a/hw/timer/ds1338.c b/hw/timer/ds1338.c
index 0112949..f5d04dd 100644
--- a/hw/timer/ds1338.c
+++ b/hw/timer/ds1338.c
@@ -198,11 +198,6 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     return 0;
 }
 
-static int ds1338_init(I2CSlave *i2c)
-{
-    return 0;
-}
-
 static void ds1338_reset(DeviceState *dev)
 {
     DS1338State *s = DS1338(dev);
@@ -220,7 +215,6 @@ static void ds1338_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
 
-    k->init = ds1338_init;
     k->event = ds1338_event;
     k->recv = ds1338_recv;
     k->send = ds1338_send;
-- 
2.9.3

