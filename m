Received: by 10.25.0.6 with SMTP id 6csp1262834lfa;
        Sun, 14 May 2017 22:51:41 -0700 (PDT)
X-Received: by 10.200.4.29 with SMTP id v29mr4096300qtg.82.1494827501782;
        Sun, 14 May 2017 22:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494827501; cv=none;
        d=google.com; s=arc-20160816;
        b=OMM2q2oiyUSdQD3+imdDBIIj/sQPrSwa/dzsWZn5rCxIhctblg0vy/JWCqXKX2W5cg
         orlRUZ4GUAsjWfAjv90NisSPxkXdVq9B/Wg2BDE4lzkvrY398+Wl8wYlEfHbtcjdRSub
         k7T8tdqpdircvYBxItdAzzczttLF7ijg/asd545q6/ztPA0TzEh+nGM8dJ/ZMmGQlvFN
         DN2UpzIvQujKA99vk6zcH+OccdnIoD1UHf6AalGaS8JqxtAQMDp/Ij7No51hiPtGsDoI
         931L8VZWfOZ35x9UDUClh3iN5LpoA9D/gzDxqr2R/8Hko+1aK3NgdY9dBVEua+jfgC37
         +tsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ZTrwc3ELnXzCBtAfQqDfggq7/lXuOK+Nc50lZetGw9s=;
        b=Ngc0CsA6TrD7Dh2AguaVrS2yXhciT3JNaUCPG8s9ZdZGeOwLi09qG7unbLXvj/+zGP
         LgT/n5h5yyeMyBpvmszT/u9bS5YcYNb1Fy/iSUOFf2pMON7/RWYkvELSENIh/+rc0waI
         xfyOnMAJfttguClR0V6G4XhCnjtmP6cNRK6HRNZpmAi/EFlGCifQNAmnS64sYsUrc7ga
         PyYI8wdEHnpzhj8oefM2wh7E/FkmCt2p604nccWkltLNzZciyPrUprdl6AJGUSR7yWTx
         gQBLUngdqV7P2iRWCVfZUqRPk2+XE/thLurDLt7x9QCCdvQp9ccd5qPs5hOifwYD5Rl/
         Ww7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d27si9817190qte.219.2017.05.14.22.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 May 2017 22:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dA8uz-0007y9-8d
	for alex.bennee@linaro.org; Mon, 15 May 2017 01:51:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8uu-0007xb-Vw
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8uq-0001AQ-It
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:37 -0400
Received: from 10.mo4.mail-out.ovh.net ([188.165.33.109]:56518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dA8uq-00019w-Bz
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:32 -0400
Received: from player772.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id E3BD164093
	for <qemu-arm@nongnu.org>; Mon, 15 May 2017 07:51:30 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id C352C740074;
	Mon, 15 May 2017 07:51:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2017 07:51:12 +0200
Message-Id: <1494827476-1487-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494827476-1487-1-git-send-email-clg@kaod.org>
References: <1494827476-1487-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4747356958551935761
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedruddvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.33.109
Subject: [Qemu-arm] [PATCH 2/6] aspeed/i2c: handle LAST command under the RX
 command
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
X-TUID: jzKd3ldVkw9h

Today, the LAST command is handled with the STOP command but this is
incorrect. Also nack the I2C bus when a LAST is issued.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 56a4fdf5c542..67004c675359 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -203,7 +203,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *b=
us, uint64_t value)
         bus->cmd &=3D ~I2CD_M_TX_CMD;
     }
=20
-    if (bus->cmd & I2CD_M_RX_CMD) {
+    if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
         int ret =3D i2c_recv(bus->bus);
         if (ret < 0) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: read failed\n", __func__=
);
@@ -212,10 +212,13 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus =
*bus, uint64_t value)
             bus->intr_status |=3D I2CD_INTR_RX_DONE;
         }
         bus->buf =3D (ret & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_S=
HIFT;
-        bus->cmd &=3D ~I2CD_M_RX_CMD;
+        if (bus->cmd & I2CD_M_S_RX_CMD_LAST) {
+            i2c_nack(bus->bus);
+        }
+        bus->cmd &=3D ~(I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST);
     }
=20
-    if (bus->cmd & (I2CD_M_STOP_CMD | I2CD_M_S_RX_CMD_LAST)) {
+    if (bus->cmd & I2CD_M_STOP_CMD) {
         if (!i2c_bus_busy(bus->bus)) {
             bus->intr_status |=3D I2CD_INTR_ABNORMAL;
         } else {
--=20
2.7.4

