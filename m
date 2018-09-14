Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp318402wrd;
        Thu, 13 Sep 2018 23:35:49 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaGBOkDOAwFX9FdNeIaPh/DVcbJy4cfF/1TNJQjvDTfezgBUvgPf8QliQRGQN2tyPmav55D
X-Received: by 2002:ac8:234f:: with SMTP id b15-v6mr7927024qtb.336.1536906949640;
        Thu, 13 Sep 2018 23:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536906949; cv=none;
        d=google.com; s=arc-20160816;
        b=ALkvsA6RpBnLXLyGI+a+AL+IcOn9cKkzUmWvqsZIm28nQZvW1y/qBIOYTJeZtt2fXO
         iWMVT3SAHK99mRQz3kJbtU+ZGQg8c45ALQ6d/7BVUw4WDPPt9Z/anX7Mgr95qgBwHJpv
         uOT0AK86e48rY6AWA+ufeN7EcqhcW+eVnNut1gzASRJwWWym/ZEvf0f+p1N1S4B4M9aR
         cEaeyVwtOmUY6rWUodNaXyivU04TydopxUOec5cdLt86axlRhWXu83VtuE8kRB+Qyscq
         8ucUTE1kQPXUnsVTv+8jLX7dB7k6qwPZXSQOAnnWMECyqS74F3COj/WymZnYiXlicDei
         ZCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qj4O5/DE7k3pDo83UwTOlPEmsP59FvNzh/aLQw1tzEY=;
        b=wxFUt/USQsth66YD9lNWjLAjeog0AJUt2aV7dFz//iwaTMkGjWPvsfdHUtBl7h4z9g
         glHSL21h7YAchVZshQ3E4AeMO54EFRMMGLLAh2JKilVntVSR5Z8QfAXs1mYvKl7aqCT2
         6iPbO7K3ip+SFw9lH7UGxPZNIb4zNyoMJemIgNo+9jcAy/CNqmD9573hEuof6BKRX2jV
         FhL2QV37cSOQcdC1FllvdMbjbkifA90kJVMeMBnTxhNpPqWC6VCKmBaBH1BflrdFlmZs
         +c3Z/FqF1YXvCkf2XCTR+mwONT7zi62/N4dU082DQX6nuD9bSBboLAeCfoQWi9asws00
         Apeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si25651qtb.89.2018.09.13.23.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 23:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0hhl-0003Oo-3G
	for alex.bennee@linaro.org; Fri, 14 Sep 2018 02:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g0hhW-0003ND-3u
	for qemu-arm@nongnu.org; Fri, 14 Sep 2018 02:35:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g0hhS-0003mo-Pf
	for qemu-arm@nongnu.org; Fri, 14 Sep 2018 02:35:34 -0400
Received: from 12.mo1.mail-out.ovh.net ([87.98.162.229]:39926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g0hhS-0003iT-Fl
	for qemu-arm@nongnu.org; Fri, 14 Sep 2018 02:35:30 -0400
Received: from player759.ha.ovh.net (unknown [10.109.159.159])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id C0F5A12C968
	for <qemu-arm@nongnu.org>; Fri, 14 Sep 2018 08:35:27 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 8044A64009A;
	Fri, 14 Sep 2018 08:35:20 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Sep 2018 08:35:04 +0200
Message-Id: <20180914063506.20815-2-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180914063506.20815-1-clg@kaod.org>
References: <20180914063506.20815-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6246211210178366272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrjeejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.162.229
Subject: [Qemu-arm] [PATCH 1/3] aspeed/i2c: interrupts should be cleared by
 software only
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
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zom42GpuyOnl

and the bus interrupt should be lowered when all interrupts have been
cleared. Also, the model does not implement correctly the RX_DONE bit
behavior which should be cleared to allow more data to be received.
Yet to be fixed.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index c762c7366ad9..de6b08378675 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -52,6 +52,13 @@
 #define I2CD_AC_TIMING_REG2     0x08       /* Clock and AC Timing Contro=
l #1 */
 #define I2CD_INTR_CTRL_REG      0x0c       /* I2CD Interrupt Control */
 #define I2CD_INTR_STS_REG       0x10       /* I2CD Interrupt Status */
+
+#define   I2CD_INTR_SLAVE_ADDR_MATCH       (0x1 << 31) /* 0: addr1 1: ad=
dr2 */
+#define   I2CD_INTR_SLAVE_ADDR_RX_PENDING  (0x1 << 30)
+/* bits[19-16] Reserved */
+
+/* All bits below are cleared by writing 1 */
+#define   I2CD_INTR_SLAVE_INACTIVE_TIMEOUT (0x1 << 15)
 #define   I2CD_INTR_SDA_DL_TIMEOUT         (0x1 << 14)
 #define   I2CD_INTR_BUS_RECOVER_DONE       (0x1 << 13)
 #define   I2CD_INTR_SMBUS_ALERT            (0x1 << 12) /* Bus [0-3] only=
 */
@@ -59,11 +66,16 @@
 #define   I2CD_INTR_SMBUS_DEV_ALERT_ADDR   (0x1 << 10) /* Removed */
 #define   I2CD_INTR_SMBUS_DEF_ADDR         (0x1 << 9)  /* Removed */
 #define   I2CD_INTR_GCALL_ADDR             (0x1 << 8)  /* Removed */
-#define   I2CD_INTR_SLAVE_MATCH            (0x1 << 7)  /* use RX_DONE */
+#define   I2CD_INTR_SLAVE_ADDR_RX_MATCH    (0x1 << 7)  /* use RX_DONE */
 #define   I2CD_INTR_SCL_TIMEOUT            (0x1 << 6)
 #define   I2CD_INTR_ABNORMAL               (0x1 << 5)
 #define   I2CD_INTR_NORMAL_STOP            (0x1 << 4)
 #define   I2CD_INTR_ARBIT_LOSS             (0x1 << 3)
+
+/*
+ * TODO: handle correctly I2CD_INTR_RX_DONE which needs to be cleared
+ * to allow next data to be received.
+ */
 #define   I2CD_INTR_RX_DONE                (0x1 << 2)
 #define   I2CD_INTR_TX_NAK                 (0x1 << 1)
 #define   I2CD_INTR_TX_ACK                 (0x1 << 0)
@@ -188,7 +200,6 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *b=
us, uint64_t value)
 {
     bus->cmd &=3D ~0xFFFF;
     bus->cmd |=3D value & 0xFFFF;
-    bus->intr_status =3D 0;
=20
     if (bus->cmd & I2CD_M_START_CMD) {
         uint8_t state =3D aspeed_i2c_get_state(bus) & I2CD_MACTIVE ?
@@ -284,8 +295,10 @@ static void aspeed_i2c_bus_write(void *opaque, hwadd=
r offset,
         break;
     case I2CD_INTR_STS_REG:
         bus->intr_status &=3D ~(value & 0x7FFF);
-        bus->controller->intr_status &=3D ~(1 << bus->id);
-        qemu_irq_lower(bus->controller->irq);
+        if (!bus->intr_status) {
+            bus->controller->intr_status &=3D ~(1 << bus->id);
+            qemu_irq_lower(bus->controller->irq);
+        }
         break;
     case I2CD_DEV_ADDR_REG:
         qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
--=20
2.17.1

