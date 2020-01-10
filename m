Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp499057lff;
        Fri, 10 Jan 2020 02:27:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzO9zFrNkDRoQvJPuOGDMhQ9bOrXczIDsjSZnded5AnL0Qa8FtmPsX5TU7Zlw1nokdgjXz0
X-Received: by 2002:a05:6402:3047:: with SMTP id bu7mr2670924edb.44.1578652029734;
        Fri, 10 Jan 2020 02:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578652029; cv=none;
        d=google.com; s=arc-20160816;
        b=J4ncYD5BEBi8aZ+/RZEFblyiSA/Uj4FYaDRa5udi7O3Is41024xrWHpsVNG5KZ0SVn
         mWo1siR8aEROCJka7jxyYootoe3Kwm03c/uMXsV37iGRFYDAJQz4SMlsvmAfNzTb1vvo
         hp6D58lXUpE9Alej3zoaomnFS6gDrQhkuni2GjdQEf3hDqBmeJxXUqiNla+dXO5ALDx6
         2jYVftOnFHkxgiEKRt+eXbrkCmTZPC8p8bRKDwHkO8t0UJhZkddNvFEmX4uph2F+I+zN
         gPgVkVe5USPNV9ZoVYr3J1PeO15jx8uZl6+uOzh2cbPBRllmDJyVOX39XriHfNK57O2Y
         5CUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=EiEnimM/0Yibk/74Ns7bYhBlrwMc/pBR6DW1tTvnJs8=;
        b=VoS8DfVVxpelwTRfku1+3ARWEP8qE1PWGkCJpEYzi6vYSsGzdJQCHRX7Rn22oE5xXo
         lZC2r2RyMNfQcl5u7LCGIIH0+j5m/9Hi/FYudeR1cmNZ5zXl8s9GDhm1FZxVNEpx+J+K
         tXwVxhOUQW4ozYbA3PlrPmlKo3ZJNhp9fZgs7TvDbRjlFvOVF9DFhb0gsWzDEVODcIuF
         Ps6rswvhzgC5m1dkz1j4DiOkl1RKLdb7Vcv8wzxs/+3a1BHYQzr9XDSaqIlmw0OLyrE4
         GYnVttS7xcbWBZF7S2IfcLfRvzfMzsIFqfCqnjYIwrImxuVW7jtJtuZYS2ddT6Y+bNb3
         XXxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si1073104ejk.365.2020.01.10.02.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 02:27:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iprVU-00054Y-1p
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 05:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iprUR-0003OP-G2
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:26:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iprUP-0006w4-QP
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:26:03 -0500
Received: from 18.mo3.mail-out.ovh.net ([87.98.172.162]:53919)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iprUP-0006s3-BA
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:26:01 -0500
Received: from player786.ha.ovh.net (unknown [10.108.35.110])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3F01F23CC93
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2020 11:25:59 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id B715FE3A0763;
 Fri, 10 Jan 2020 10:25:51 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/5] hw/arm/aspeed: add a 'execute-in-place' property to
 boot directly from CE0
Date: Fri, 10 Jan 2020 11:25:17 +0100
Message-Id: <20200110102518.4233-5-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200110102518.4233-1-clg@kaod.org>
References: <20200110102518.4233-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5852146241494289169
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepfe
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.172.162
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HVjE07lR8/BM

The overhead for the OpenBMC firmware images using the a custom U-Boot
is around 2 seconds, which is fine, but with a U-Boot from mainline,
it takes an extra 50 seconds or so to reach Linux. A quick survey on
the number of reads performed on the flash memory region gives the
following figures :

  OpenBMC U-Boot      922478 (~ 3.5 MBytes)
  Mainline U-Boot   20569977 (~ 80  MBytes)

QEMU must be trashing the TCG TBs and reloading text very often. Some
addresses are read more than 250.000 times. Until we find a solution
to improve boot time, execution from MMIO is not activated by default.

Setting this option also breaks migration compatibility.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/arm/aspeed.h |  2 ++
 hw/arm/aspeed.c         | 44 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 4423cd0cda71..18521484b90e 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -19,6 +19,8 @@ typedef struct AspeedBoardState AspeedBoardState;
=20
 typedef struct AspeedMachine {
     MachineState parent_obj;
+
+    bool mmio_exec;
 } AspeedMachine;
=20
 #define ASPEED_MACHINE_CLASS(klass) \
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 8702256af1b2..a17843f0d3bf 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -261,11 +261,18 @@ static void aspeed_machine_init(MachineState *machi=
ne)
          * SoC and 128MB for the AST2500 SoC, which is twice as big as
          * needed by the flash modules of the Aspeed machines.
          */
-        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
-                               fl->size, &error_abort);
-        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
-                                    boot_rom);
-        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+        if (ASPEED_MACHINE(machine)->mmio_exec) {
+            memory_region_init_alias(boot_rom, OBJECT(bmc), "aspeed.boot=
_rom",
+                                     &fl->mmio, 0, fl->size);
+            memory_region_add_subregion(get_system_memory(), FIRMWARE_AD=
DR,
+                                        boot_rom);
+        } else {
+            memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_r=
om",
+                                   fl->size, &error_abort);
+            memory_region_add_subregion(get_system_memory(), FIRMWARE_AD=
DR,
+                                        boot_rom);
+            write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort=
);
+        }
     }
=20
     aspeed_board_binfo.ram_size =3D ram_size;
@@ -399,6 +406,30 @@ static void witherspoon_bmc_i2c_init(AspeedBoardStat=
e *bmc)
     /* Bus 11: TODO ucd90160@64 */
 }
=20
+static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
+{
+    return ASPEED_MACHINE(obj)->mmio_exec;
+}
+
+static void aspeed_set_mmio_exec(Object *obj, bool value, Error **errp)
+{
+    ASPEED_MACHINE(obj)->mmio_exec =3D value;
+}
+
+static void aspeed_machine_instance_init(Object *obj)
+{
+    ASPEED_MACHINE(obj)->mmio_exec =3D false;
+}
+
+static void aspeed_machine_class_props_init(ObjectClass *oc)
+{
+    object_class_property_add_bool(oc, "execute-in-place",
+                                   aspeed_get_mmio_exec,
+                                   aspeed_set_mmio_exec, &error_abort);
+    object_class_property_set_description(oc, "execute-in-place",
+                           "boot directly from CE0 flash device", &error=
_abort);
+}
+
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -408,6 +439,8 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
+
+    aspeed_machine_class_props_init(oc);
 }
=20
 static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *da=
ta)
@@ -550,6 +583,7 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
         .instance_size =3D sizeof(AspeedMachine),
+        .instance_init =3D aspeed_machine_instance_init,
         .class_size    =3D sizeof(AspeedMachineClass),
         .class_init    =3D aspeed_machine_class_init,
         .abstract      =3D true,
--=20
2.21.1

