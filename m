Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp318864wrd;
        Thu, 13 Sep 2018 23:36:20 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYfyuY5Mp5Uz/Bfkfn+mvVq5lnPtFVfdYsONn+9hEtSMJN3lt8SCdGbi8qavzH0mp+NtKOp
X-Received: by 2002:ac8:2a13:: with SMTP id k19-v6mr7710435qtk.245.1536906980345;
        Thu, 13 Sep 2018 23:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536906980; cv=none;
        d=google.com; s=arc-20160816;
        b=Td143J2KfJ5Ra++fcL4b//YvlWV7Qxl6F0oXCQApgp/iWAIk0GUKLENScYq46suOkF
         vIbVpkmBPsSECPaf162vI69uOyP3ae0M7n88PEVFhtguK3P+gxJcbUayEmbK/1KcnjRq
         n2DgMrWWpK7jDx27ptTT4+BEQk3V+QoHUNzOrRQS63JhP9JS1wHaUxvmtiOc3aRggjvV
         doFVP1E09HyUn8Jio4L6RHMj0SbbZHUGNqVS/+8JcLbsyM6UQgfEkBveqcgD+QHdiLTb
         iL4h/IiMbYLANiyGKGctnp8eeAS0v9wu4gENExoLgjg2CawVmJYdtPMqAsjQRkLFkr2+
         G22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=n21+U06iCkAm+LgPGLxexnhKljfpEx41t8KtholrIdM=;
        b=MHZfsqGlSTYNcARDkYFt6AGgUlgQKLAWmfbrLDVtIlxU0yC1GbuZEzHsI4EfUYngL0
         YHkBiCTDSmA+cmIvMetTGzzXKp8ooUXvD250DGdC99LRVV94cPLlERCWGjJKFVwemEPR
         VkQpvNpAf956ykPbv+79kfD0q+LGlN/BzzbEtF7yUeem3w2orlRayAvrke/wACLvgIh9
         VRLqPiqo40lHEPT7wKlApLTNGQYmky6PfQDMc7iFWM57L1hGerKTKbwZZqjP4bWQ8HKI
         hRNcwFhPtk8EvUTO7Vqj6vIlM2NIE5H49VOK4q4SrTQFxqVfGavfnovMmkAeu56r7AXL
         m+JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2-v6si4656859qkl.163.2018.09.13.23.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 23:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0hiF-0003Z9-Pz
	for alex.bennee@linaro.org; Fri, 14 Sep 2018 02:36:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g0hhc-0003PW-Hv
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g0hhZ-0003wi-6E
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:40 -0400
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:33305)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g0hhY-0003uv-SQ
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:37 -0400
Received: from player759.ha.ovh.net (unknown [10.109.143.18])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 2523724C6E
	for <qemu-devel@nongnu.org>; Fri, 14 Sep 2018 08:35:35 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id BF3146400B3;
	Fri, 14 Sep 2018 08:35:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Sep 2018 08:35:05 +0200
Message-Id: <20180914063506.20815-3-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180914063506.20815-1-clg@kaod.org>
References: <20180914063506.20815-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6248463008427379520
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrjeejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.80
Subject: [Qemu-devel] [PATCH 2/3] aspeed/i2c: Handle receive command in
 separate function
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
X-TUID: zLMpOF/zEVw1

From: Guenter Roeck <linux@roeck-us.net>

Receive command handling may have to be deferred if a previous receive
done interrupt was not yet acknowledged. Move receive command handling
into a separate function to prepare for the necessary changes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index de6b08378675..d81f86587af7 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -192,6 +192,26 @@ static uint8_t aspeed_i2c_get_state(AspeedI2CBus *bu=
s)
     return (bus->cmd >> I2CD_TX_STATE_SHIFT) & I2CD_TX_STATE_MASK;
 }
=20
+static void aspeed_i2c_handle_rx_cmd(AspeedI2CBus *bus)
+{
+    int ret;
+
+    aspeed_i2c_set_state(bus, I2CD_MRXD);
+    ret =3D i2c_recv(bus->bus);
+    if (ret < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read failed\n", __func__);
+        ret =3D 0xff;
+    } else {
+        bus->intr_status |=3D I2CD_INTR_RX_DONE;
+    }
+    bus->buf =3D (ret & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SHIFT=
;
+    if (bus->cmd & I2CD_M_S_RX_CMD_LAST) {
+        i2c_nack(bus->bus);
+    }
+    bus->cmd &=3D ~(I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST);
+    aspeed_i2c_set_state(bus, I2CD_MACTIVE);
+}
+
 /*
  * The state machine needs some refinement. It is only used to track
  * invalid STOP commands for the moment.
@@ -238,22 +258,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *=
bus, uint64_t value)
     }
=20
     if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
-        int ret;
-
-        aspeed_i2c_set_state(bus, I2CD_MRXD);
-        ret =3D i2c_recv(bus->bus);
-        if (ret < 0) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: read failed\n", __func__=
);
-            ret =3D 0xff;
-        } else {
-            bus->intr_status |=3D I2CD_INTR_RX_DONE;
-        }
-        bus->buf =3D (ret & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_S=
HIFT;
-        if (bus->cmd & I2CD_M_S_RX_CMD_LAST) {
-            i2c_nack(bus->bus);
-        }
-        bus->cmd &=3D ~(I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST);
-        aspeed_i2c_set_state(bus, I2CD_MACTIVE);
+        aspeed_i2c_handle_rx_cmd(bus);
     }
=20
     if (bus->cmd & I2CD_M_STOP_CMD) {
--=20
2.17.1

