Received: by 10.25.0.6 with SMTP id 6csp1262861lfa;
        Sun, 14 May 2017 22:51:46 -0700 (PDT)
X-Received: by 10.55.83.70 with SMTP id h67mr3520804qkb.287.1494827506672;
        Sun, 14 May 2017 22:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494827506; cv=none;
        d=google.com; s=arc-20160816;
        b=Ksmt2xvo1r52RMe4OFYzSUs3tyzwtT6qc/wfGYxVAvuyn2IHezaqMvjZI46qiVzWoj
         ek8U7S5LbUSb02CZe7qcBM4esa8W7+hpXeOu115VGrEMAsvobrlqrMjfXHKoSsPh2U8k
         1Alrrt8sPeNMNgNLWTOrLPkYqrGuB8B+GkUaKmMJEDSHYIzAslEOujVhAIIxOFOr7ihw
         ltbblJMbHcpR7TLD+wX1rhHMg2ArGL/xXIgzRf6QBmegVAD4Nfie60Az6o7PgfrwWeZx
         m313v65t0VHHrHDGVliqFZJ/zukhP5HgL0/gfwUuV9IwfNC3mz9GkuifEYiGfLRYMqP8
         Avqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=m8rC5e1EpziqF6bKaZ8xYk16KK8m/d5UdwN7qjG4DSc=;
        b=wte190me3KM8zdgfBgzOVc/4cKt5RPQzxxP7KwsjjkCnHU5r2+kujos9zwrseGPE06
         eLOcDTo+GGxkP/y0d6/u84dA9NFCGqOjIPa4HZAvBjEbIy1WfCfz5NfY+ipRvXgM5XDi
         BbiupRiWmgdKCp8K2rK3p2IeeLzQd8s8VSMgrkNUcHtAHuPSYPCNmcOXmhsNXHR8aj0k
         I1nyZwCHbCx11z7VF4xSbeu9pxMUaEacdTm3VgT8pNfN7zxnXjhLxcokUewBmnAAWpkc
         GOn6AVTKd0KAlNxNBkWgN+cJvCbLXTaNrLdHyk9UZw0s1zS2pGqJqexo+4+AHcsNx89v
         7n4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f189si9893073qkd.157.2017.05.14.22.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 May 2017 22:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dA8v4-00081n-34
	for alex.bennee@linaro.org; Mon, 15 May 2017 01:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8ux-0007yq-Hq
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8us-0001As-UR
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:39 -0400
Received: from 6.mo4.mail-out.ovh.net ([188.165.36.253]:49275)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dA8us-00019Q-NX
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:34 -0400
Received: from player772.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id C6943640A5
	for <qemu-arm@nongnu.org>; Mon, 15 May 2017 07:51:26 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id A441474006B;
	Mon, 15 May 2017 07:51:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2017 07:51:11 +0200
Message-Id: <1494827476-1487-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494827476-1487-1-git-send-email-clg@kaod.org>
References: <1494827476-1487-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4746231059408194321
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedruddvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.36.253
Subject: [Qemu-arm] [PATCH 1/6] aspeed/i2c: improve command handling
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F47HPqZ4Unmg

Multiple I2C commands can be fired simultaneously and the controller
execute the commands following these priorities:

  (1) Master Start Command
  (2) Master Transmit Command
  (3) Slave Transmit Command or Master Receive Command
  (4) Master Stop Command

The current code is incorrect with respect to the above sequence and
needs to be reworked to handle each individual command.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index ce5b1f0fa493..56a4fdf5c542 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -171,6 +171,7 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwa=
ddr offset,
=20
 static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 {
+    bus->cmd &=3D ~0xFFFF;
     bus->cmd |=3D value & 0xFFFF;
     bus->intr_status =3D 0;
=20
@@ -182,15 +183,27 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus =
*bus, uint64_t value)
             bus->intr_status |=3D I2CD_INTR_TX_ACK;
         }
=20
-    } else if (bus->cmd & I2CD_M_TX_CMD) {
+        /* START command is also a TX command, as the slave address is
+         * sent on the bus */
+        bus->cmd &=3D ~(I2CD_M_START_CMD | I2CD_M_TX_CMD);
+
+        /* No slave found */
+        if (!i2c_bus_busy(bus->bus)) {
+            return;
+        }
+    }
+
+    if (bus->cmd & I2CD_M_TX_CMD) {
         if (i2c_send(bus->bus, bus->buf)) {
             bus->intr_status |=3D (I2CD_INTR_TX_NAK | I2CD_INTR_ABNORMAL=
);
             i2c_end_transfer(bus->bus);
         } else {
             bus->intr_status |=3D I2CD_INTR_TX_ACK;
         }
+        bus->cmd &=3D ~I2CD_M_TX_CMD;
+    }
=20
-    } else if (bus->cmd & I2CD_M_RX_CMD) {
+    if (bus->cmd & I2CD_M_RX_CMD) {
         int ret =3D i2c_recv(bus->bus);
         if (ret < 0) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: read failed\n", __func__=
);
@@ -199,6 +212,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *b=
us, uint64_t value)
             bus->intr_status |=3D I2CD_INTR_RX_DONE;
         }
         bus->buf =3D (ret & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_S=
HIFT;
+        bus->cmd &=3D ~I2CD_M_RX_CMD;
     }
=20
     if (bus->cmd & (I2CD_M_STOP_CMD | I2CD_M_S_RX_CMD_LAST)) {
@@ -208,11 +222,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *=
bus, uint64_t value)
             i2c_end_transfer(bus->bus);
             bus->intr_status |=3D I2CD_INTR_NORMAL_STOP;
         }
+        bus->cmd &=3D ~I2CD_M_STOP_CMD;
     }
-
-    /* command is handled, reset it and check for interrupts  */
-    bus->cmd &=3D ~0xFFFF;
-    aspeed_i2c_bus_raise_interrupt(bus);
 }
=20
 static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
@@ -262,6 +273,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr=
 offset,
         }
=20
         aspeed_i2c_bus_handle_cmd(bus, value);
+        aspeed_i2c_bus_raise_interrupt(bus);
         break;
=20
     default:
--=20
2.7.4

