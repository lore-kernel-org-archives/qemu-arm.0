Received: by 10.25.159.131 with SMTP id i125csp113927lfe;
        Tue, 29 Nov 2016 21:37:19 -0800 (PST)
X-Received: by 10.55.17.206 with SMTP id 75mr25628886qkr.10.1480484239498;
        Tue, 29 Nov 2016 21:37:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188si36741160qkg.323.2016.11.29.21.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 21:37:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBxa2-0000Sa-RF
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 00:37:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZv-0000QH-F0
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZs-0005Kg-C8
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51612)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cBxZs-0005Jx-3q
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:08 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAU5Y600145296
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:07 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
	by mx0a-001b2d01.pphosted.com with ESMTP id 271n08h33u-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:06 -0500
Received: from localhost
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 30 Nov 2016 15:37:04 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 30 Nov 2016 15:37:03 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 6C4E83578061;
	Wed, 30 Nov 2016 16:37:02 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAU5b2B536241482; Wed, 30 Nov 2016 16:37:02 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAU5b1xB022576; Wed, 30 Nov 2016 16:37:02 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAU5b1bo022568; Wed, 30 Nov 2016 16:37:01 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 04648A0283;
	Wed, 30 Nov 2016 16:37:01 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Wed, 30 Nov 2016 16:36:25 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161130053629.23340-1-alastair@au1.ibm.com>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16113005-0008-0000-0000-000000EB8EF9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16113005-0009-0000-0000-0000089C4FD3
Message-Id: <20161130053629.23340-3-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611300092
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-arm] [PATCH v2 2/6] hw/i2c: Add a NULL check for i2c slave
 init callbacks
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
X-TUID: V1QMJcdVTLzX

From: Alastair D'Silva <alastair@d-silva.org>

Add a NULL check for i2c slave init callbacks, so that we no longer
need to implement empty init functions.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/arm/pxa2xx.c   | 9 +--------
 hw/arm/tosa.c     | 7 -------
 hw/arm/z2.c       | 7 -------
 hw/i2c/core.c     | 6 +++++-
 hw/timer/ds1338.c | 6 ------
 5 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 21ea1d6..bdcf6bc 100644
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
@@ -2070,7 +2063,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     }
     if (!revision)
         revision = "pxa270";
-    
+
     s->cpu = cpu_arm_init(revision);
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
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

