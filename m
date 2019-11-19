Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp592605lfc;
        Tue, 19 Nov 2019 06:19:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0Ko+9DCOBuGqxNXO67qQ+KesWBnpqddfxgXdNKLdjjqlXsGcAL5ROQNCE4uzWfBb+9JlZ
X-Received: by 2002:a17:906:6b01:: with SMTP id q1mr35391489ejr.162.1574173152153;
        Tue, 19 Nov 2019 06:19:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574173152; cv=none;
        d=google.com; s=arc-20160816;
        b=dKMkJRA7tKaF1SeDTk6mxHthidRTO83aQ+A0qB8wZ3N3THg7ZJFCv1+FKpc3JlQ4Pp
         rlmF0QHItURa1/WnFFmhaiE+u0I/fvywzuUBVjfYE6Q/DzngQuk5KDV1t1cq6v6ATqf3
         VU++wdMQL30fuhNS5aslPmfD8Kqg2spald+MH4Uj18Bax/zVQSZsLdE+a91W3J0C8AzN
         ol6L4Nttu2rld2ktup7IygqCmXKuU9l7PMmJRpB6Pq2IEHYHfyaKXGEqOWnnQyISo7dl
         1YnN3WCaoR28HwduOtmrhDM0/FbasyMGkGEX0wW8zMMhEfo3Q0P2hpmuRLT1usn/BqL8
         AxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8bMekvMvnuTpwyvfQK1LoBj64jFuKDFt8W4hE3Sil3A=;
        b=yJ6uanGDsn2CTVyugN7lieo1eBC+U36lRE/UyTveyaOQGZeNuWPVhkgWX9iBwu5Ko3
         8HHPRV8rde8GLJLaUm3JbBY8mup7s7zEaKi6vz6/hoNx1IrKwaNRgglyNjBYgU0jhkGV
         GSWQ5SHTUacVrs+uNZCK5WZ9W46+jagF4lIfX1YGN0KEJjFh1b0iYejszIiHB+r9Xe8G
         5SY38kGb5a8LtL/tTshMjs3KjAhTuwnOjFi66cZjGybN24poo/zBXK3jUXAOdClMuLfy
         vn3POm4XnO+ULQS2TZP9NsFSELg1Vdci9ImbzOXhyfb36bJdEtsbJDqVjoEr1DR8vPyS
         0aMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si13669368ejx.169.2019.11.19.06.19.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 06:19:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX4LW-000453-If
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 09:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4Go-0007dY-AQ
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4Gm-0005oT-UG
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:18 -0500
Received: from 4.mo173.mail-out.ovh.net ([46.105.34.219]:52052)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4Gm-0005nu-OS
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:16 -0500
Received: from player795.ha.ovh.net (unknown [10.109.143.238])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 27ED3121FE7
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 15:14:15 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 51526C18AF9A;
 Tue, 19 Nov 2019 14:14:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 14/17] aspeed: Add support for the tacoma-bmc board
Date: Tue, 19 Nov 2019 15:12:08 +0100
Message-Id: <20191119141211.25716-15-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17921793246394288913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeeg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.34.219
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ln7SeyOREKkD

The Tacoma BMC board is replacement board for the BMC of the OpenPOWER
Witherspoon system. It uses a AST2600 SoC instead of a AST2500 and the
I2C layout is the same as it controls the same main board. Used for HW
bringup.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e34e6787430b..cc06af4fbb3e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -92,6 +92,10 @@ struct AspeedBoardState {
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
=20
+/* Tacoma hardware value */
+#define TACOMA_BMC_HW_STRAP1  0x00000000
+#define TACOMA_BMC_HW_STRAP2  0x00000000
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -363,6 +367,9 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
     AspeedSoCState *soc =3D &bmc->soc;
     uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
=20
+    /* Bus 3: TODO bmp280@77 */
+    /* Bus 3: TODO max31785@52 */
+    /* Bus 3: TODO dps310@76 */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), TYPE_PCA9=
552,
                      0x60);
=20
@@ -381,6 +388,7 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
                           eeprom_buf);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), TYPE_PCA=
9552,
                      0x60);
+    /* Bus 11: TODO ucd90160@64 */
 }
=20
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
@@ -485,6 +493,22 @@ static void aspeed_machine_ast2600_evb_class_init(Ob=
jectClass *oc, void *data)
     mc->default_ram_size =3D 1 * GiB;
 };
=20
+static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data=
)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Aspeed AST2600 EVB (Cortex A7)";
+    amc->soc_name  =3D "ast2600-a0";
+    amc->hw_strap1 =3D TACOMA_BMC_HW_STRAP1;
+    amc->hw_strap2 =3D TACOMA_BMC_HW_STRAP2;
+    amc->fmc_model =3D "mx66l1g45g";
+    amc->spi_model =3D "mx66l1g45g";
+    amc->num_cs    =3D 2;
+    amc->i2c_init  =3D witherspoon_bmc_i2c_init; /* Same board layout */
+    mc->default_ram_size =3D 1 * GiB;
+};
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -510,6 +534,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("ast2600-evb"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_ast2600_evb_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("tacoma-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_tacoma_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
--=20
2.21.0

