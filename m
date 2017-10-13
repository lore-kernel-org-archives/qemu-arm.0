Received: by 10.223.197.9 with SMTP id q9csp807091wrf;
        Fri, 13 Oct 2017 07:31:57 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAiFuQ0xE0WRaUq3w9z2h0znx6n3Ke+iEfoPoAdMQLywpAusEK+rc289R9Qz9hs93wC/4FI
X-Received: by 10.176.91.75 with SMTP id v11mr1391767uae.26.1507905117709;
        Fri, 13 Oct 2017 07:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507905117; cv=none;
        d=google.com; s=arc-20160816;
        b=FPJDr2OjCw3FXNtcRYJ4bbmKvjdq7o/atW68h1SBzYuJUs73NxvpAvtJf7bhhXz7Fw
         caGn7Fqvm3gFTpp7rAw4KhkC3Ktl0+qO455nm7kHVKEEOxbApaSYSC72RzH76smb4rOh
         soUql93fB8c8+SYgNgbNZQLeUZYzW1uAraMAWF6C8Ex3LBVFRAtd/BFD8C+V2X5K5WgB
         4IDdMtATS4rzuDd5nEVzanYQsFM5oDCrt2pa/9wXdCdhBZhr9lKaw4WzHom5Rvi0MaRK
         VekAfkT9m15E5okEjirLxXkW4D1uxkTDrz7YEms5HbbNCQJJ3oF9RfKKXMdZ+AjsV3nE
         sefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=q+D+eCiWRBWOrga+e5tq5k2WMpq/l0CY2yJ1H/pa5Gw=;
        b=CDEWH+ttEkboZ+BRai7q/1gzBgXG77C8NJ72MgHwzgsq0VMOsRPi8G/o8cBqlO9qFA
         V4Y3DBLwtKql8yfnOqK55nWb3kVE15DGsaBs3frC9xhEQLq/vOhhjgpKUGwFA/b2csFd
         LPe4C16wNAwZr+54UQnDkwLEkgGrJGb6PXHLBFqjLRrTnDECc07dNc54BRs2GYQU8Csr
         Vctg+1K7g00xldwiUB+vV29JBWBiEyaavSweVmBF2wBBhHFG9aHDRWZse+0ba+++KiJs
         /dl3wNJ4NyyAAzSkK8LqmCpJO3EdmxqCN56usj2krZq6iZU1mCemS5V5qU8jbrfaB5Ha
         jPxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3si269616uae.354.2017.10.13.07.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Oct 2017 07:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e310E-0006a2-Qs
	for alex.bennee@linaro.org; Fri, 13 Oct 2017 10:31:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30yX-0005Z9-BR
	for qemu-devel@nongnu.org; Fri, 13 Oct 2017 10:30:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30yR-00012Z-Ol
	for qemu-devel@nongnu.org; Fri, 13 Oct 2017 10:30:09 -0400
Received: from 1.mo4.mail-out.ovh.net ([178.33.248.196]:55564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e30yR-00012E-Iw
	for qemu-devel@nongnu.org; Fri, 13 Oct 2017 10:30:03 -0400
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 915D4E7BA5
	for <qemu-devel@nongnu.org>; Fri, 13 Oct 2017 16:30:02 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id 5F9BF480099;
	Fri, 13 Oct 2017 16:29:54 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Oct 2017 16:28:52 +0200
Message-Id: <20171013142852.916-7-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171013142852.916-1-clg@kaod.org>
References: <20171013142852.916-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14837671923274451729
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtdeigdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.248.196
Subject: [Qemu-devel] [PATCH v3 6/6] aspeed: add the pc9552 chips to the
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
X-TUID: Gxh2CBxqdb3R

The pca9552 LED blinkers on the Witherspoon machine are used for leds
but also as GPIOs to control fans and GPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2a6ca58527f8..f3c279cfcd3f 100644
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
@@ -391,6 +393,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
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
2.13.6

