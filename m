Received: by 10.223.172.38 with SMTP id v35csp393667wrc;
        Wed, 20 Sep 2017 00:07:47 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBq0YZiTzQ03Z6hkbI+xR2yU2pXg+X2hwrrnRY1bdPJcCSGsR4qBQJtf/bVkrjzHfHU0Hr/
X-Received: by 10.237.53.23 with SMTP id a23mr6457018qte.125.1505891267618;
        Wed, 20 Sep 2017 00:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505891267; cv=none;
        d=google.com; s=arc-20160816;
        b=sXaa/IEIq8PnksFPn0ZWXoZSOASoLlKS9fbwjUHSxOCAdE24UUxt52oYhuu55Y9Q2O
         wGzuxdhGFkNfPat4502aeZfu3U0uTVi/CSvKvhuJu7QF0zOkLW4B6EONQYc35byjkD01
         Us3i9G9MEVU4Bp0IexQGbfHJTLCQGl2AwQw2tjh2Tp+7IUAg3G9kSGnx4Idd3nxigCyg
         nG9zP4AKaejoCTh6CgdUbPEmJCTkmoYD5ZSnfI85nt5VtQVs0wXV0qHlxg3SLBQcgC3y
         P7rNCFsALu7YN6sMfAULK7ugQBa1UE1GzNDtTj3VdTGYtZs8wCYoFWCKkO3ZdBKBj6bS
         SfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=mtFNhmHuNJyI13Nx5gt1HkUjT5VjdDzVadiunaX0ufA=;
        b=oXWnampZTpha0lZ4qxS1m7codIyBQTgIKu8jrnNMWZ4n0AgzF50D7k602ZFSXouRcT
         g8gVi6vTHiG16oVMT+cK6gAPKJc3npaJg7e+wFp+W87GW9jjjba5MhYFxHoD7W48ydPg
         M1ejAe+HD6Ii8epJ7ZntOBNl/I03RM8WAezjs38hcKHdKm+SiulhPrWteONhYSAKKq9b
         m9lsvgAZUpjRWgdLFLfu/KTUgu1ksEVkAyxmSfzVqKn5NnQWuXIkHJTC7L3aU3S5CiUd
         T18EmMDisfJNfhG64/Tbq5MpP1xTsY0RLSWZPTvM9N7IY4XNIPLRYNbMDfJfJOMqMDNu
         y7NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p3si1076969qta.214.2017.09.20.00.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 00:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duZ6n-0000ks-7E
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 03:07:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duZ1v-0005Eo-Gj
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 03:02:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duZ1u-0000aL-Fh
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 03:02:43 -0400
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]:57008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duZ1t-0000X8-Uv
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 03:02:42 -0400
Received: from player157.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id D985BAC916
	for <qemu-devel@nongnu.org>; Wed, 20 Sep 2017 09:02:40 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id 9E4ED50008E;
	Wed, 20 Sep 2017 09:02:33 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Sep 2017 09:01:35 +0200
Message-Id: <20170920070135.31379-7-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170920070135.31379-1-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1337569093588323089
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.52.147
Subject: [Qemu-devel] [PATCH v2 6/6] aspeed: add the pc9552 chips to the
 witherspoon machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S2E41hdQv1aA

The pca9552 LED blinkers on the Witherspoon machine are used for leds
but also as GPIOs to control fans and GPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 462f8008cff5..2ae46d71bff7 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -379,6 +379,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
     AspeedSoCState *soc =3D &bmc->soc;
     uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
=20
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
+
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
=20
@@ -390,6 +392,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
=20
     smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
                           eeprom_buf);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552=
",
+                     0x60);
 }
=20
 static void witherspoon_bmc_init(MachineState *machine)
--=20
2.13.5

