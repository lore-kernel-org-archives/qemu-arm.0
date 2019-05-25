Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4312176wrg;
        Sat, 25 May 2019 08:16:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGruK05gRSQK74kp9PwW4Jh0CqvVvyY6e3zwRpwRxkZYjcZPCnfM1HVmRFwt2jKrWhwkhH
X-Received: by 2002:ab0:620e:: with SMTP id m14mr30818099uao.68.1558797377145;
        Sat, 25 May 2019 08:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558797377; cv=none;
        d=google.com; s=arc-20160816;
        b=g0asnIzuA7hKfyZwyhvTBRn4vRdOHL7O0gyT6ZSe/SJ6WIXzGlTXtcYF6BTIC/iSsZ
         x+N5Gu65gj7xEO5kx6GLtUdEb+iLAVbglSrv3JdbaUABbmL/3fw2P+F96EYTzM0xYoIS
         V+j4H2sdTbE/S3YNP3W5YiKdfO3gmdXRwFcDPutN+sjItJYLVnIy1AB6EeoSsAPSa7D+
         Evzp/edH4dxIchcvd16CTPpou4HwI++zmnhTSoxe27i5LpQ1jBiVswPxdrZ9ScDOdGig
         XidOJDJwH/n4laaUFup0zi71DnhqviXgGidMDqbYU3O2OvM1dGNryc80KgmoDmYHTjj2
         55yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YKNgv6S0CBddM7o1QkkqD7wu/8+pbIwUrZxjosFBOzU=;
        b=htksMuBwlV+ZjzMDW9aFwdnCQJ+HoleOEh1AcQ7AEoCVu4oFwt9575WMutfACDENxs
         1Zw8C09uArfQNSRqUn551cQpwYlp/7RGEX4fQ/iJtDiz/YBdqBONUf7uf320zVwfPPnk
         UTZrM3787xaIOFEjjBkRsqyfNdh4jZP4N1amTg8vMiPp7fv/Mj8tl25/TfKBgt4Gh+gP
         0/u5wWLfKwyIKWZmzXKaTvDf9zwpAvBclKgfVK55+xn2FlfFtOkNUWhxVf06oFvtcYty
         VpSTyBP4GzFoE/GxmA+L0GPcdxKurcmU3/Sv4jyWAdpFJqN5NytgjwPzfY0k6+jMvFU+
         pEwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si2057734vsp.390.2019.05.25.08.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYPA-0007rG-Hz
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:16:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMf-0005lP-NK
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMe-0001fy-HT
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:41 -0400
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:46245)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYMe-0001dv-CK
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:40 -0400
Received: from player698.ha.ovh.net (unknown [10.109.143.189])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id B936F2150F2
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:13:37 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 38DB3625A797;
	Sat, 25 May 2019 15:13:31 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:28 +0200
Message-Id: <20190525151241.5017-7-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6602558530083326737
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.172.249
Subject: [Qemu-arm] [PATCH 06/19] aspeed: introduce a configurable number of
 CPU per machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FgB1rBQtFmQb

The current models of the Aspeed SoCs only have one CPU but future
ones will support SMP. Introduce a way to configure the maximum number
of CPU per machine. SMP support will be activated when models for such
SoCs are implemented.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed.h     |  1 +
 include/hw/arm/aspeed_soc.h |  3 ++-
 hw/arm/aspeed.c             |  8 ++++++--
 hw/arm/aspeed_soc.c         | 17 +++++++++++------
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 02073a6b4d61..f2f238ea83cc 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -23,6 +23,7 @@ typedef struct AspeedBoardConfig {
     uint32_t num_cs;
     void (*i2c_init)(AspeedBoardState *bmc);
     uint32_t ram;
+    uint32_t num_cpus;
 } AspeedBoardConfig;
=20
 #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index fa0ba957a611..7247f6da2505 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -24,13 +24,14 @@
=20
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  3
+#define ASPEED_CPUS_NUM  2
=20
 typedef struct AspeedSoCState {
     /*< private >*/
     DeviceState parent;
=20
     /*< public >*/
-    ARMCPU cpu;
+    ARMCPU cpu[ASPEED_CPUS_NUM];
     MemoryRegion sram;
     AspeedVICState vic;
     AspeedRtcState rtc;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 10ba3f50481a..004b0c318951 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -29,7 +29,6 @@
=20
 static struct arm_boot_info aspeed_board_binfo =3D {
     .board_id =3D -1, /* device-tree-only board */
-    .nb_cpus =3D 1,
 };
=20
 struct AspeedBoardState {
@@ -231,6 +230,7 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.kernel_cmdline =3D machine->kernel_cmdline;
     aspeed_board_binfo.ram_size =3D ram_size;
     aspeed_board_binfo.loader_start =3D sc->info->memmap[ASPEED_SDRAM];
+    aspeed_board_binfo.nb_cpus =3D cfg->num_cpus;
=20
     if (cfg->i2c_init) {
         cfg->i2c_init(bmc);
@@ -327,7 +327,7 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
=20
     mc->desc =3D board->desc;
     mc->init =3D aspeed_machine_init;
-    mc->max_cpus =3D 1;
+    mc->max_cpus =3D ASPEED_CPUS_NUM;
     mc->no_sdcard =3D 1;
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
@@ -357,6 +357,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .num_cs    =3D 1,
         .i2c_init  =3D palmetto_bmc_i2c_init,
         .ram       =3D 256 * MiB,
+        .num_cpus  =3D 1,
     }, {
         .name      =3D MACHINE_TYPE_NAME("ast2500-evb"),
         .desc      =3D "Aspeed AST2500 EVB (ARM1176)",
@@ -367,6 +368,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .num_cs    =3D 1,
         .i2c_init  =3D ast2500_evb_i2c_init,
         .ram       =3D 512 * MiB,
+        .num_cpus  =3D 1,
     }, {
         .name      =3D MACHINE_TYPE_NAME("romulus-bmc"),
         .desc      =3D "OpenPOWER Romulus BMC (ARM1176)",
@@ -377,6 +379,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .num_cs    =3D 2,
         .i2c_init  =3D romulus_bmc_i2c_init,
         .ram       =3D 512 * MiB,
+        .num_cpus  =3D 1,
     }, {
         .name      =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
         .desc      =3D "OpenPOWER Witherspoon BMC (ARM1176)",
@@ -387,6 +390,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .num_cs    =3D 2,
         .i2c_init  =3D witherspoon_bmc_i2c_init,
         .ram       =3D 512 * MiB,
+        .num_cpus  =3D 1,
     },
 };
=20
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index d1dc8f03f35c..b983d5efc5d1 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -172,8 +172,11 @@ static void aspeed_soc_init(Object *obj)
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     int i;
=20
-    object_initialize_child(obj, "cpu", OBJECT(&s->cpu), sizeof(s->cpu),
-                            sc->info->cpu_type, &error_abort, NULL);
+    for (i =3D 0; i < MIN(smp_cpus, ASPEED_CPUS_NUM); i++) {
+        object_initialize_child(obj, "cpu[*]", OBJECT(&s->cpu[i]),
+                                sizeof(s->cpu[i]), sc->info->cpu_type,
+                                &error_abort, NULL);
+    }
=20
     sysbus_init_child_obj(obj, "scu", OBJECT(&s->scu), sizeof(s->scu),
                           TYPE_ASPEED_SCU);
@@ -242,10 +245,12 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
                                 ASPEED_SOC_IOMEM_SIZE);
=20
     /* CPU */
-    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    for (i =3D 0; i < smp_cpus; i++) {
+        object_property_set_bool(OBJECT(&s->cpu[i]), true, "realized", &=
err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
     }
=20
     /* SRAM */
--=20
2.20.1

