Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp320846wrd;
        Thu, 13 Sep 2018 23:38:45 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYvYalB7VMgtk4JH59JpAImAzttdFPO0pcpgquwYF82aNxBBd0fKF8eVsIjWZLvmhtXLnqP
X-Received: by 2002:a0c:e490:: with SMTP id n16-v6mr7902053qvl.119.1536907125075;
        Thu, 13 Sep 2018 23:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536907125; cv=none;
        d=google.com; s=arc-20160816;
        b=F0I6cC2A0d0eIL+90PPZzO7XbbAzsNO9qI92k2XgWpBaEbwzz79xHffO4d6oEd60tZ
         l2IOo6hKbqyeQHm8w04Al+Dy+0f89U5xb+g2Somd2MDe/WxeMuJp9dcYX27uqT0ioqGs
         v6mQqrsPFt3jdus0VHHynTH54zI2X7A9VpxfPqc4E0geNdO3UuxGVyCEJQgIjC6u0uzT
         w6Qu/gK7a4f5/kYGC0YzOxLRgAZtLZhuPYziBqZclaqRN21WUWGf7v9Kl2uWgMSGd3Gf
         43OKqe+81tHMp4g8lE5m8EE7uOIWltaJvyPI1f1tFKhdfkCdViMZvEdpg8h8xc+yf5eh
         oUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=hZZIveGXlbpQEBEmO2nLrVDWb0kA50aamb0rqTcFWQw=;
        b=NqdpLDdW9Lk0Km66yiDwV2syTu3AunTxecsl0VieM8Mt3OJJx4hM/VBau5R+qd9nSM
         4AAypZ9nZooZZeCwv9s6tmAGi36C3yMCe+AaEYo/stpg92UuTR/0jHaD499s4e4HwJhg
         qnEsoeDYsCGotYlDivjC5OkohLGmTm/H7RrdXv1GwN+/8RZgplRwx16R4C+qPGvma92g
         1VtwJYD4jUdiiBd4jFxUe84UHCG7uxwHs4E0lIdHo/syBldSpffhyKYszs6ZIDZ8yVDp
         IVJLXj6VIGYK6HPVkOEMwQfiMTPmOr5CEe40bJagFxcVF135NzW1qWp5V10DVN2CxjAU
         G8Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i12-v6si1100226qvi.285.2018.09.13.23.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 23:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0hka-0005IH-LY
	for alex.bennee@linaro.org; Fri, 14 Sep 2018 02:38:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g0hhj-0003Uy-4f
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g0hhf-00045M-Uo
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:47 -0400
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:60099)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g0hhf-00043r-Jf
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:43 -0400
Received: from player759.ha.ovh.net (unknown [10.109.146.5])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 57607D834B
	for <qemu-devel@nongnu.org>; Fri, 14 Sep 2018 08:35:42 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 0C88E6400B3;
	Fri, 14 Sep 2018 08:35:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Sep 2018 08:35:06 +0200
Message-Id: <20180914063506.20815-4-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180914063506.20815-1-clg@kaod.org>
References: <20180914063506.20815-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6250433333486717760
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrjeejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.49.208
Subject: [Qemu-devel] [PATCH 3/3] aspeed/i2c: Fix receive done interrupt
 handling
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
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T14Eh+u4roT/

From: Guenter Roeck <linux@roeck-us.net>

The AST2500 datasheet says:

I2CD10 Interrupt Status Register
       bit 2 Receive Done Interrupt status
             S/W needs to clear this status bit to allow next data receiv=
ing

The Rx interrrupt done interrupt status bit needs to be cleared
explicitly before the next byte can be received, and must therefore
not be auto-cleared. Also, receiving the next byte must be delayed
until the bit has been cleared.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index d81f86587af7..7ae99bc8baec 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -257,7 +257,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *b=
us, uint64_t value)
         aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
=20
-    if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
+    if ((bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) &&
+        !(bus->intr_status & I2CD_INTR_RX_DONE)) {
         aspeed_i2c_handle_rx_cmd(bus);
     }
=20
@@ -279,6 +280,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr=
 offset,
                                  uint64_t value, unsigned size)
 {
     AspeedI2CBus *bus =3D opaque;
+    bool handle_rx;
=20
     switch (offset) {
     case I2CD_FUN_CTRL_REG:
@@ -299,11 +301,17 @@ static void aspeed_i2c_bus_write(void *opaque, hwad=
dr offset,
         bus->intr_ctrl =3D value & 0x7FFF;
         break;
     case I2CD_INTR_STS_REG:
+        handle_rx =3D (bus->intr_status & I2CD_INTR_RX_DONE) &&
+                (value & I2CD_INTR_RX_DONE);
         bus->intr_status &=3D ~(value & 0x7FFF);
         if (!bus->intr_status) {
             bus->controller->intr_status &=3D ~(1 << bus->id);
             qemu_irq_lower(bus->controller->irq);
         }
+        if (handle_rx && (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LA=
ST))) {
+            aspeed_i2c_handle_rx_cmd(bus);
+            aspeed_i2c_bus_raise_interrupt(bus);
+        }
         break;
     case I2CD_DEV_ADDR_REG:
         qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
--=20
2.17.1

