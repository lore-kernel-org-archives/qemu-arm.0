Received: by 10.25.0.6 with SMTP id 6csp1263592lfa;
        Sun, 14 May 2017 22:54:19 -0700 (PDT)
X-Received: by 10.200.39.219 with SMTP id x27mr4014210qtx.80.1494827658988;
        Sun, 14 May 2017 22:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494827658; cv=none;
        d=google.com; s=arc-20160816;
        b=0d+ItiVTvbjh8hn/IfnVVSNB+zPq6vsqVB8VGxWVeAtbiP/mrABcZTJs6hm1va2u/V
         GnmC1vb2mzippcq7J54cANu5HivJIRRA7ISUdFHcpGt2fw9NOPFza90aTdeYIDbIt2eA
         HhtG/p3rHAg3vglVeGrnfUqQDnz3D0csV5dAQlNjsPz3/OSOp6sxNGg9HvnITATV0D9e
         T5xW9fAnIq2TXaw1I06HYkWkIAAo0Vu4G37ZzQafN4GX/oATdDCEmspRTMCXQ8BE0TNY
         h/OH2LzPx3CTK9BePPagAgBzOunQnO9qpd+l+VJAjxyTYX/AtMcxiza4slAhF3jmHWZ0
         iHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Acts9EcjtzFngm+r0NjWAjCDSitMCoLoRdRPrlcPxF0=;
        b=PeElL3n1oLW+5hjyJAeZOX0eXeo9prB3gQMP58vbzsMkS0h8Rr3AAkmB95RMXPbKSm
         ai+h5mH7ha6Id3f9K97Ercnb23BxpSN7zAxXcB6qwnwQaCCSKNTt4V/5zZ0yhXDB3dwl
         IG0HSdl8Y1Qv/5oYBEW9LklMRaerMvbZ/vF+f555EDWzgWW4Z1Fsvpxsl/lyTpME5rAO
         I4icF27uwaLMB2u1CRPnhxGY4mMZ9UOu1UJqMdTfCpmNCazI9kib2r1tM6eUNywv81cJ
         mqKQJQ97Xhj31hYzf/lzlye3HKTi6jfjqIzssTaCZUY112CmRgxmnTkUS13S2dT2lPnl
         sv9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h91si10448814qkh.208.2017.05.14.22.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 May 2017 22:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dA8xW-00025m-Ex
	for alex.bennee@linaro.org; Mon, 15 May 2017 01:54:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8uz-00080Q-6Q
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8uu-0001Cd-N1
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:41 -0400
Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]:42899)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dA8uu-0001BU-Gw
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:36 -0400
Received: from player772.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0C6FC63A76
	for <qemu-arm@nongnu.org>; Mon, 15 May 2017 07:51:35 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id E2D16740074;
	Mon, 15 May 2017 07:51:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2017 07:51:13 +0200
Message-Id: <1494827476-1487-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494827476-1487-1-git-send-email-clg@kaod.org>
References: <1494827476-1487-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4748764332654037777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedruddvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.40.29
Subject: [Qemu-arm] [PATCH 3/6] aspeed/i2c: introduce a state machine
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
X-TUID: ngcMTOsxSaRb

The Aspeed I2C controller maintains a state machine in the command
register, which is mostly used for debug.

Let's start adding a few states to handle abnormal STOP
commands. Today, the model uses the busy status of the bus as a
condition to do so but it is not precise enough.

Also remove the ABNORMAL bit for failing TX commands. This is
incorrect with respect to the specs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 67004c675359..c762c7366ad9 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -169,6 +169,21 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hw=
addr offset,
     }
 }
=20
+static void aspeed_i2c_set_state(AspeedI2CBus *bus, uint8_t state)
+{
+    bus->cmd &=3D ~(I2CD_TX_STATE_MASK << I2CD_TX_STATE_SHIFT);
+    bus->cmd |=3D (state & I2CD_TX_STATE_MASK) << I2CD_TX_STATE_SHIFT;
+}
+
+static uint8_t aspeed_i2c_get_state(AspeedI2CBus *bus)
+{
+    return (bus->cmd >> I2CD_TX_STATE_SHIFT) & I2CD_TX_STATE_MASK;
+}
+
+/*
+ * The state machine needs some refinement. It is only used to track
+ * invalid STOP commands for the moment.
+ */
 static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 {
     bus->cmd &=3D ~0xFFFF;
@@ -176,6 +191,11 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *=
bus, uint64_t value)
     bus->intr_status =3D 0;
=20
     if (bus->cmd & I2CD_M_START_CMD) {
+        uint8_t state =3D aspeed_i2c_get_state(bus) & I2CD_MACTIVE ?
+            I2CD_MSTARTR : I2CD_MSTART;
+
+        aspeed_i2c_set_state(bus, state);
+
         if (i2c_start_transfer(bus->bus, extract32(bus->buf, 1, 7),
                                extract32(bus->buf, 0, 1))) {
             bus->intr_status |=3D I2CD_INTR_TX_NAK;
@@ -191,20 +211,26 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus =
*bus, uint64_t value)
         if (!i2c_bus_busy(bus->bus)) {
             return;
         }
+        aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
=20
     if (bus->cmd & I2CD_M_TX_CMD) {
+        aspeed_i2c_set_state(bus, I2CD_MTXD);
         if (i2c_send(bus->bus, bus->buf)) {
-            bus->intr_status |=3D (I2CD_INTR_TX_NAK | I2CD_INTR_ABNORMAL=
);
+            bus->intr_status |=3D (I2CD_INTR_TX_NAK);
             i2c_end_transfer(bus->bus);
         } else {
             bus->intr_status |=3D I2CD_INTR_TX_ACK;
         }
         bus->cmd &=3D ~I2CD_M_TX_CMD;
+        aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
=20
     if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
-        int ret =3D i2c_recv(bus->bus);
+        int ret;
+
+        aspeed_i2c_set_state(bus, I2CD_MRXD);
+        ret =3D i2c_recv(bus->bus);
         if (ret < 0) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: read failed\n", __func__=
);
             ret =3D 0xff;
@@ -216,16 +242,20 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus =
*bus, uint64_t value)
             i2c_nack(bus->bus);
         }
         bus->cmd &=3D ~(I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST);
+        aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
=20
     if (bus->cmd & I2CD_M_STOP_CMD) {
-        if (!i2c_bus_busy(bus->bus)) {
+        if (!(aspeed_i2c_get_state(bus) & I2CD_MACTIVE)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: abnormal stop\n", __func=
__);
             bus->intr_status |=3D I2CD_INTR_ABNORMAL;
         } else {
+            aspeed_i2c_set_state(bus, I2CD_MSTOP);
             i2c_end_transfer(bus->bus);
             bus->intr_status |=3D I2CD_INTR_NORMAL_STOP;
         }
         bus->cmd &=3D ~I2CD_M_STOP_CMD;
+        aspeed_i2c_set_state(bus, I2CD_IDLE);
     }
 }
=20
--=20
2.7.4

