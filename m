Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3797781wrm;
        Sun, 20 Oct 2019 16:12:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHSD27JldIWwXqiWcqw+z4Kg6RuHPHvDLELqLBh9yMod28ea/40lNN6rGaUM0xLuD8vJA+
X-Received: by 2002:a50:875e:: with SMTP id 30mr3404469edv.45.1571613179596;
        Sun, 20 Oct 2019 16:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571613179; cv=none;
        d=google.com; s=arc-20160816;
        b=PjIoiwXsUimnLclRN/a7tXrUfOJ0FPctl8OF5cT1DBy1d0UpYdb+vUDaoB8Oqyxywu
         wLIivIhPOSWBaVQ7E+jE6+ONJmsg7XPo6ybnEtK1vnj5ZPlK+da4vzUIopKZRkSkxm+M
         SR2RVsHZbva9mQyp/oIbDREexY8h7qM/Q0L6ts7o94QrS1fzUeVdSA5ThO0yz/q8h9re
         xw+0tBLIRgV+FyW6H0QLsNCsgaPnxKz9aVycUwEl1/nYcEMtj61bFnh2i1kikCMwwehp
         zEHF0QVmqGfAcC0bq7nmGsPSs8fcLT5JtUScyU3hZC+4zcuttPMPHr4iO5siA7c2WS8k
         ZLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PnBCoSNSCKRtt+NC5OSwF3Y1UP3u5PcBNfHOXHNcJVc=;
        b=IyU2eH5yZ/zjKslKAMKMGlTLd56Fy6U4711cs8ZZRM1163LyIUbFXZyVnpFb5oY5qy
         TCoOEbaS2tu+Uxka0v8xuG/XQOhJXzx8CDy2HYSThBPiLuyX2noa1dyv5jvlkNpDpBwp
         Z8wZ/nf9ZqYy3thMN5l9DLrzG++a1HaJHgsBkG4KlCKoPm0qDIlU7gDkWUqPFa7NO/iz
         cE8nt9Dr5woQ/B2Q3xZMka3M9q8MW5jKjLRKaXSkRcLW+/uI12JgVVdd57SjFhtChRxE
         tSJYel0+aH39aXkaTDDBxqj4dHQGkpPBLHDFhW7CcM93v4AOlUP6+oOZSR0WKsPRvbqf
         R6+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SAds2F/c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c28si9571181ede.3.2019.10.20.16.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SAds2F/c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKNe-0005RN-8T
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 19:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35485)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKDv-0003Uo-1M
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKDt-0002Wo-VQ
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:02:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47805
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKDs-0002Vx-74
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PnBCoSNSCKRtt+NC5OSwF3Y1UP3u5PcBNfHOXHNcJVc=;
 b=SAds2F/cbKzUGjVcO4SlRj1x+pLeD2ATH+pvnH7n3Mn9jODBa6PRmDWlliFgiPTFCrXdkt
 Z2GcmBFRd1bnJqITx2mDVDcy6bkr7D5HJlOtfegiQxm/Wpi29B5O3bSMpPyJ+w4RlQhOeD
 3B8p9xRPebndWT8N0q8L4hdyUEeG4Wc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-B9DL2hqtPbyycJCqfC9sCA-1; Sun, 20 Oct 2019 19:02:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EA0C1005509;
 Sun, 20 Oct 2019 23:02:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 547F460C18;
 Sun, 20 Oct 2019 23:02:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 17/21] hw/m68k: Let the machine be the owner of the system
 memory
Date: Mon, 21 Oct 2019 00:56:46 +0200
Message-Id: <20191020225650.3671-18-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: B9DL2hqtPbyycJCqfC9sCA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iPZnOQz6VSbY

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/m68k/an5206.c    | 2 +-
 hw/m68k/mcf5208.c   | 2 +-
 hw/m68k/next-cube.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index 54ccbe1a82..fb045c2436 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -46,7 +46,7 @@ static void an5206_init(MachineState *machine)
     env->rambar0 =3D AN5206_RAMBAR_ADDR | 1;
=20
     /* DRAM at address zero */
-    memory_region_allocate_system_memory(ram, NULL, "an5206.ram", ram_size=
);
+    memory_region_allocate_system_memory(ram, machine, "an5206.ram", ram_s=
ize);
     memory_region_add_subregion(address_space_mem, 0, ram);
=20
     /* Internal SRAM.  */
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 34d34eba17..8e8c8ef349 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -248,7 +248,7 @@ static void mcf5208evb_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x00000000, rom);
=20
     /* DRAM at 0x40000000 */
-    memory_region_allocate_system_memory(ram, NULL, "mcf5208.ram", ram_siz=
e);
+    memory_region_allocate_system_memory(ram, machine, "mcf5208.ram", ram_=
size);
     memory_region_add_subregion(address_space_mem, 0x40000000, ram);
=20
     /* Internal SRAM.  */
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e5343348d0..6aed9376f3 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -893,7 +893,7 @@ static void next_cube_init(MachineState *machine)
     memcpy(ns->rtc.ram, rtc_ram2, 32);
=20
     /* 64MB RAM starting at 0x04000000  */
-    memory_region_allocate_system_memory(ram, NULL, "next.ram", ram_size);
+    memory_region_allocate_system_memory(ram, machine, "next.ram", ram_siz=
e);
     memory_region_add_subregion(sysmem, 0x04000000, ram);
=20
     /* Framebuffer */
--=20
2.21.0

