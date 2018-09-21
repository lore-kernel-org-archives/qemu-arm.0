Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3330679wrd;
        Fri, 21 Sep 2018 09:24:14 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ0jLIXPgtNP0hQcKpAQPvOmT57Eqbh/9zmjglk5ndDgh0dqCjK6G4jzntD0HUy4fFxaY4M
X-Received: by 2002:a37:c8cd:: with SMTP id t74-v6mr30546572qkl.63.1537547054617;
        Fri, 21 Sep 2018 09:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537547054; cv=none;
        d=google.com; s=arc-20160816;
        b=S69Pv0NTONMCV94tDhxcWGcGTASoGUDdvoFa7j4GPsSaVOnOh3OC/tGdUDdlxMsOZn
         CAoNYPZDlCb1OzXwNZryVDQSfrszDNvNrhAogKhdskFoURh9Ln/fD0poMVx43POgYT6h
         X46p9AbQd9jGE/Qd135VSlJafDRXvcwfyPV/2PNR3M6gegOrgIT+AGh1Bp2p/g/bZb/7
         9R+myoH6rMUhbgNPaiUjsG2j5Ze65zxuj/Ix97st4W9n1+DOQgQ40Ja5hRS07JF/ajBH
         0J4rbVJLoKBh6SdydxxCwe2rk3MTq1EgG/a9+O1nKCouAbFb1/rr+kjb78Q8R+N4h4pi
         3vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=mqg+pTWUTDqTu0ILbS19q+vGuqAw6DukMEFaKRwMoIA=;
        b=qgGNHiWXSo/nYTX6iS9H+O10wUuCT2ro4uS9h4vquryypdI0nTKeFzRk6k9ChVn6sf
         2GdRrzygObwp6OxjRtXemFWuQZPcmAtgi63aPouxPim288erQjj9wZR3WTcXKIK1Ralb
         F4u/9yKVOOuScjZ7z0iw3H5LBXqDKaqjiJ7opccYSLGih7XbVza7NJnCvEAza3FD5Tz+
         I6TZ7fI65c0ibbvxCZeCyIzENfk4i5ljZhM3IbBW3/8hrQgBH5fyEfMYZZ2oWjOoyRpU
         PEmotjRlzLzXKXhFkX2hYajwW6TEydSMtLMWasdLLNB/GB51VI2wXnobpKXX79rGUbem
         tbpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5-v6si50254qkb.367.2018.09.21.09.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OE1-0006hU-8w
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:24:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAa-0004CF-AB
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAW-00043A-J0
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:20:40 -0400
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:34310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OAW-00042j-A0
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:20:36 -0400
Received: from player799.ha.ovh.net (unknown [10.109.143.201])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 05B0A10003D
	for <qemu-devel@nongnu.org>; Fri, 21 Sep 2018 18:20:34 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 956395200B3;
	Fri, 21 Sep 2018 18:20:25 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:32 +0200
Message-Id: <20180921161939.822-5-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1896578393404181312
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.149
Subject: [Qemu-devel] [PATCH v2 04/11] hw/arm/aspeed: add a
 'execute-in-place' property to boot directly from CE0
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IOn0ddcrBZwV

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
---
 include/hw/arm/aspeed.h |  2 ++
 hw/arm/aspeed.c         | 44 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 325c091d09e4..b67f633ddbd1 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -30,6 +30,8 @@ typedef struct AspeedBoardConfig {
=20
 typedef struct AspeedMachine {
     MachineState parent_obj;
+
+    bool mmio_exec;
 } AspeedMachine;
=20
 #define ASPEED_MACHINE_CLASS(klass) \
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6b33ecd5aa43..e7b87e355f12 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -216,11 +216,18 @@ static void aspeed_board_init(MachineState *machine=
,
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
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
@@ -313,6 +320,30 @@ static void aspeed_machine_init(MachineState *machin=
e)
     aspeed_board_init(machine, amc->board);
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
@@ -327,6 +358,8 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
     amc->board =3D board;
+
+    aspeed_machine_class_props_init(oc);
 }
=20
 static const TypeInfo aspeed_machine_type =3D {
@@ -334,6 +367,7 @@ static const TypeInfo aspeed_machine_type =3D {
     .parent =3D TYPE_MACHINE,
     .instance_size =3D sizeof(AspeedMachine),
     .class_size =3D sizeof(AspeedMachineClass),
+    .instance_init =3D aspeed_machine_instance_init,
     .abstract =3D true,
 };
=20
--=20
2.17.1

