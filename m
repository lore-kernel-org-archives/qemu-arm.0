Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4977219wrq;
        Tue, 12 Jun 2018 00:22:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIuGGbcVR0IbMEBCeY4aJnNDkjLA0a3vxRPbkflKytT5LN2Pf81wetuTaJyLp+FCrjwKICx
X-Received: by 2002:a37:14ca:: with SMTP id 71-v6mr2249721qku.116.1528788124468;
        Tue, 12 Jun 2018 00:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528788124; cv=none;
        d=google.com; s=arc-20160816;
        b=Q5MLuNyiJtbMNyytKjONaqimx1Fmu0DnPizKQax8hOVI4nGln80Fm5GnL0WkPOpm6v
         znXfYsea3NZBL/05HUXu1RclqW5k9y7QStgDFA73lQ9nTiCOWEZjwQRAjOk/rVNayQWs
         r0pAMD46cpqWfJM6hRkLrb7Atd4H8ft3BEZoOlaKNVYn2eMJ2m/hKdJ0HMw1cy2WtBC2
         UL33S/zwvmvghC6ykZKapP4uv3y4H15VNSmXhxCQj5zF305i23SJKArbVqx29UhMWBIK
         yvtsAlFtn8k2NkoNeq3eyJ0KXf7rQgNc5AsT2iX+x4A3O2+L7BhG08xQSMmidBd4BkNg
         XNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=dfQm0ZOY/QyN3bUxFdHXI5cKnvvFcJPgmXqSyupt+S0=;
        b=d7tLd3kolB+hlJacjHFWwLJXUj08lS1CsAQ4T0i6eu3rwh8Gj9NU8Tx13ZrIrNc24W
         jJIcAZsWfeKF3NH605MAh7SYulr9qIhjfBrMSu+Fz90tmkMZemMviwYqsu1V9DveFGnz
         GNh67weNlIxI1L37qeaz2/QUwt+97VbZw3mLUGuKXbaP3OBs3X31GdPk8VpiygZ/UICq
         uGQMdpkngaWZdGgIGW2quYuDkRwZta/6B/FJjRNjPXdYNm5JBSsaBd0Lk/MhWoOCdejm
         uEbv0e4v+jr+McZF1+1Wjj2h2dxjEr2ooVz9YDOA96KEOiX6mPTtLO1MlZWyczxPZaEE
         OUPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4-v6si251083qkq.273.2018.06.12.00.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 00:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSdcy-0000GW-1B
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 03:22:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fSdFM-0004ZQ-P0
	for qemu-devel@nongnu.org; Tue, 12 Jun 2018 02:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fSdFJ-0001b0-Gk
	for qemu-devel@nongnu.org; Tue, 12 Jun 2018 02:57:40 -0400
Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172]:46940)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fSdFJ-0001aA-9Y
	for qemu-devel@nongnu.org; Tue, 12 Jun 2018 02:57:37 -0400
Received: from player797.ha.ovh.net (unknown [10.109.105.109])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id A29FEB635E
	for <qemu-devel@nongnu.org>; Tue, 12 Jun 2018 08:57:35 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id 40FBF2E0090;
	Tue, 12 Jun 2018 08:57:29 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 08:57:14 +0200
Message-Id: <20180612065716.10587-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180612065716.10587-1-clg@kaod.org>
References: <20180612065716.10587-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7989104267826793280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrkeeigdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.36.172
Subject: [Qemu-devel] [PATCH 1/3] aspeed/smc: fix dummy cycles count when in
 dual IO mode
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N1V/sfXsPeNb

When configured in dual I/O mode, address and data are sent in dual
mode, including the dummy byte cycles in between. Adapt the count to
the IO setting.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 5059396bc623..fce126e6ee92 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -66,6 +66,8 @@
=20
 /* CEx Control Register */
 #define R_CTRL0           (0x10 / 4)
+#define   CTRL_IO_DUAL_DATA        (1 << 29)
+#define   CTRL_IO_DUAL_ADDR_DATA   (1 << 28) /* Includes dummies */
 #define   CTRL_CMD_SHIFT           16
 #define   CTRL_CMD_MASK            0xff
 #define   CTRL_DUMMY_HIGH_SHIFT    14
@@ -492,8 +494,13 @@ static int aspeed_smc_flash_dummies(const AspeedSMCF=
lash *fl)
     uint32_t r_ctrl0 =3D s->regs[s->r_ctrl0 + fl->id];
     uint32_t dummy_high =3D (r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1;
     uint32_t dummy_low =3D (r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3;
+    uint32_t dummies =3D ((dummy_high << 2) | dummy_low) * 8;
=20
-    return ((dummy_high << 2) | dummy_low) * 8;
+    if (r_ctrl0 & CTRL_IO_DUAL_ADDR_DATA) {
+        dummies /=3D 2;
+    }
+
+    return dummies;
 }
=20
 static void aspeed_smc_flash_send_addr(AspeedSMCFlash *fl, uint32_t addr=
)
--=20
2.13.6

