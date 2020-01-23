Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp554159lfp;
        Thu, 23 Jan 2020 03:49:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqzH6oWpRWLCMvWhCeAF4g9tZ9TEqRK0d9ytGKvvlftcK4Sr3a/hzm6la2ZC48ubzIe5L6op
X-Received: by 2002:aa7:ce14:: with SMTP id d20mr6619002edv.262.1579780191753;
        Thu, 23 Jan 2020 03:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780191; cv=none;
        d=google.com; s=arc-20160816;
        b=HFa90XsccUELe/Zjk0kPwd7oJ3/OeGZeF+DHmLiNZHxxDZectk/QLqyljvJ4vhkOg0
         xshLyeEJDKQyk8fUKpPD77pTON9Inou+gVPBxXGExUp/EfTCyszjX/643+ov6VxppdZN
         qprPUKEwjD47SSo6uYE9dtpdGMXXW96ovdZtFm46iEZ2JTpPYHz1ZhOaZQLO9MCWoQBv
         aHTJzeiWh7RtNeDFdXcmFt5TKegsx7OyHCHKVjCLeVOdsXBEZTDdrbL7oPBrRDF+Jrdl
         /R3m3BztnEBiGvPGItYGDQ5FGqLw0gj/0g75SoPnTy3Oprbqe3h5+EHEIgt4NtYJMbFa
         bACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+uuPi7DG2BoJ5B54Q/ECtV6/frsIQS4ln+CGfZvnT2o=;
        b=A/d3qrQtVoQfEQDgNhuF3SpCWrXRecJVuoWqoDVr8WYTS0BeB+ZA1zOr3ek7qmp4PZ
         bY0wcW70nC/mClkJWT4uL9bSpRTTKI00hv2EVWrMOLyAhKwPesYSFyS6fmBTxdw4VHKT
         NnPtu5WvWUo9JemFIzQgXxqErpkXOJkxF+LivurJKvYfZf1DIHt8n4nlayhOS589yTMd
         tC+1uCq/AtBl0eS4EIhXHjBG2T3IvcSdTO/BymAtCRcXAFTbNaTjq559vhxf8ux4TPXy
         mZTaBqqeDZDGts/ImuCG/Nmd4WGAtzRGKzPQS+Da2z+tVLazfeLr7Y6bAq3xDqwI+ldi
         spCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iHbnns9A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx7si976847edb.188.2020.01.23.03.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:49:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iHbnns9A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuaze-0005yT-2J
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarc-0005CG-Vm
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuarb-0003za-2d
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30906
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuara-0003zP-Vl
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+uuPi7DG2BoJ5B54Q/ECtV6/frsIQS4ln+CGfZvnT2o=;
 b=iHbnns9AlcLh7Cchdfpjl+b9g+Qp28kuaMhy+/RaBLrXyVm9rCr5SZ26Jh7WRnukW4yckQ
 RgS8hYsC8wHVPapA11fIej448qOB3ruhn8pbw0TFPX1TX30RS4FwaPbUn2i0xxNXGyEGpm
 fDxX8nkXHc/cukLCQovQd3b/B6N0d5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-oh-1MXdAP7mwr_yfL0zvYw-1; Thu, 23 Jan 2020 06:41:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C1C018C8C01;
 Thu, 23 Jan 2020 11:41:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3710310016E8;
 Thu, 23 Jan 2020 11:41:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 11/80] arm/digic_boards: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:36 +0100
Message-Id: <1579779525-20065-12-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: oh-1MXdAP7mwr_yfL0zvYw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 antonynpavlov@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Y837ePVIrxK

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
 remove no longer needed DigicBoardState

PS2:
 while at it add check for user supplied RAM size and error
 out if it mismatches board expected value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  * move 'DigicState *s' declaration to the top of digic4_board_init()
v2:
  * fix format string causing build failure on 32-bit host
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)

CC: drjones@redhat.com
CC: antonynpavlov@gmail.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/digic_boards.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index ef3fc2b..518a63e 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -35,39 +35,40 @@
 #include "hw/loader.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
+#include "qemu/units.h"
+#include "qemu/cutils.h"
=20
 #define DIGIC4_ROM0_BASE      0xf0000000
 #define DIGIC4_ROM1_BASE      0xf8000000
 #define DIGIC4_ROM_MAX_SIZE   0x08000000
=20
-typedef struct DigicBoardState {
-    DigicState *digic;
-    MemoryRegion ram;
-} DigicBoardState;
-
 typedef struct DigicBoard {
-    hwaddr ram_size;
-    void (*add_rom0)(DigicBoardState *, hwaddr, const char *);
+    void (*add_rom0)(DigicState *, hwaddr, const char *);
     const char *rom0_def_filename;
-    void (*add_rom1)(DigicBoardState *, hwaddr, const char *);
+    void (*add_rom1)(DigicState *, hwaddr, const char *);
     const char *rom1_def_filename;
 } DigicBoard;
=20
-static void digic4_board_init(DigicBoard *board)
+static void digic4_board_init(MachineState *machine, DigicBoard *board)
 {
     Error *err =3D NULL;
+    DigicState *s =3D DIGIC(object_new(TYPE_DIGIC));
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
+
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
=20
-    DigicBoardState *s =3D g_new(DigicBoardState, 1);
-
-    s->digic =3D DIGIC(object_new(TYPE_DIGIC));
-    object_property_set_bool(OBJECT(s->digic), true, "realized", &err);
+    object_property_set_bool(OBJECT(s), true, "realized", &err);
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't realize DIGIC SoC: ");
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "ram", board->ram_=
size);
-    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
+    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
=20
     if (board->add_rom0) {
         board->add_rom0(s, DIGIC4_ROM0_BASE, board->rom0_def_filename);
@@ -78,7 +79,7 @@ static void digic4_board_init(DigicBoard *board)
     }
 }
=20
-static void digic_load_rom(DigicBoardState *s, hwaddr addr,
+static void digic_load_rom(DigicState *s, hwaddr addr,
                            hwaddr max_size, const char *def_filename)
 {
     target_long rom_size;
@@ -118,7 +119,7 @@ static void digic_load_rom(DigicBoardState *s, hwaddr a=
ddr,
  * Samsung K8P3215UQB
  * 64M Bit (4Mx16) Page Mode / Multi-Bank NOR Flash Memory
  */
-static void digic4_add_k8p3215uqb_rom(DigicBoardState *s, hwaddr addr,
+static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
                                       const char *def_filename)
 {
 #define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
@@ -135,14 +136,13 @@ static void digic4_add_k8p3215uqb_rom(DigicBoardState=
 *s, hwaddr addr,
 }
=20
 static DigicBoard digic4_board_canon_a1100 =3D {
-    .ram_size =3D 64 * 1024 * 1024,
     .add_rom1 =3D digic4_add_k8p3215uqb_rom,
     .rom1_def_filename =3D "canon-a1100-rom1.bin",
 };
=20
 static void canon_a1100_init(MachineState *machine)
 {
-    digic4_board_init(&digic4_board_canon_a1100);
+    digic4_board_init(machine, &digic4_board_canon_a1100);
 }
=20
 static void canon_a1100_machine_init(MachineClass *mc)
@@ -150,6 +150,8 @@ static void canon_a1100_machine_init(MachineClass *mc)
     mc->desc =3D "Canon PowerShot A1100 IS";
     mc->init =3D &canon_a1100_init;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_size =3D 64 * MiB;
+    mc->default_ram_id =3D "ram";
 }
=20
 DEFINE_MACHINE("canon-a1100", canon_a1100_machine_init)
--=20
2.7.4

