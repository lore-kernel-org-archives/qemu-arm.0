Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3798189wrm;
        Sun, 20 Oct 2019 16:13:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYW7u5xY1bO/pV49CCZauMMst2jNF3bqOCD9lO/1NpB6NW347z+b0Jq0+OFFHLdjEyh0a+
X-Received: by 2002:a05:6402:1359:: with SMTP id y25mr21874581edw.183.1571613216184;
        Sun, 20 Oct 2019 16:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571613216; cv=none;
        d=google.com; s=arc-20160816;
        b=Am7GJBUzXzAEX2juhsOJQ3eBDZtldJ4mlx2J7GMxKtL/sqXhNTv/GHQKGutOAoDzsy
         +wPS/57n5tyxA2I0W5+v/E7iyzsCf1WYN22d62couOb8VBvh1xco9bpW7tIAg3BBjmVF
         y+16z0A4cCzFLc9sb7S34BF1p4JEiIhj97lYeiOdezknt9DEHGZGkg2/x1oLxPeXgbzH
         O2Ly+9/gC8lag/EU7npT0lEfXpLRqyLZp5+q7OnsQ0kBb38z7yuPRb08Vu6WV5utgVm5
         9pxza2eWdbtBRQ8tqMCKQbL1wziUBIxV/5WYaCeFLPyueLIOL1sMOemUjurWU7Qjr5FQ
         PHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UV/XkDj03L9/ob11j7AhR7s+62zNXfZJySNjPD/IKPc=;
        b=fVTHTxDb73Bp7sohNExqPyYNa2rC3mjisxfW4HERVKktZjXsjW+judVuZlGwZUml+f
         pOVMcAAQPI86uXmxYvFlxPHWYTr0X760Fr9KqPL5MbKkIkWPwJIa7F3G5rBLGihdqo/h
         8mlZdveiBCjQcnWc4jsrJPQyoYfV9egHTDsSpehTJjLk2Hl2rYK3YqtZBkCj+qrwrLsr
         5wx/IcRPPNOIY+rN3DLKg+Pj+jPyzAuQ4I3CmFQL6CESFBjZHAFM9WoPqBTntgPwFAIs
         vqpQUHb6wSMmgImc9YrBBCNY8tXb/kII2foZg5ErqMwMWA5FFp7ruSwY8z6LF6mYclAo
         CZxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LAUjmpwv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si7686287ejk.105.2019.10.20.16.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LAUjmpwv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKOE-0005hX-Vh
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 19:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKE9-0003gG-IE
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:03:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKE8-0002eZ-9e
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:03:09 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37194)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKE8-0002eL-5n
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UV/XkDj03L9/ob11j7AhR7s+62zNXfZJySNjPD/IKPc=;
 b=LAUjmpwvSOM0be4ys368P+eGMR4/yogKBOZ0CTdJBinBcIjMD+XV3WmCJRpRHgZzgnRhQr
 5ySgqWOfDQCIoPoSM4m5sjm9m+AcHUDJB5HNOBJtI5t7Ql5R7fsv6XeOZEVp/y0axeu2me
 ssZt3ROYn1makrKqSdPaNSl9AZBlypQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-pIRY2_CLPJu_31UoJ2uEYw-1; Sun, 20 Oct 2019 19:03:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AF0B800D41;
 Sun, 20 Oct 2019 23:03:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F59F60C5D;
 Sun, 20 Oct 2019 23:02:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 18/21] hw/mips: Let the machine be the owner of the system
 memory
Date: Mon, 21 Oct 2019 00:56:47 +0200
Message-Id: <20191020225650.3671-19-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: pIRY2_CLPJu_31UoJ2uEYw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-TUID: do9NZBymWNls

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/mips/boston.c        | 2 +-
 hw/mips/mips_fulong2e.c | 3 ++-
 hw/mips/mips_jazz.c     | 2 +-
 hw/mips/mips_malta.c    | 2 +-
 hw/mips/mips_mipssim.c  | 2 +-
 hw/mips/mips_r4k.c      | 3 ++-
 6 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index ca7d813a52..8445fee0f1 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -474,7 +474,7 @@ static void boston_mach_init(MachineState *machine)
     memory_region_add_subregion_overlap(sys_mem, 0x18000000, flash, 0);
=20
     ddr =3D g_new(MemoryRegion, 1);
-    memory_region_allocate_system_memory(ddr, NULL, "boston.ddr",
+    memory_region_allocate_system_memory(ddr, machine, "boston.ddr",
                                          machine->ram_size);
     memory_region_add_subregion_overlap(sys_mem, 0x80000000, ddr, 0);
=20
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index cf537dd7e6..d5a5cef619 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -318,7 +318,8 @@ static void mips_fulong2e_init(MachineState *machine)
     ram_size =3D 256 * MiB;
=20
     /* allocate RAM */
-    memory_region_allocate_system_memory(ram, NULL, "fulong2e.ram", ram_si=
ze);
+    memory_region_allocate_system_memory(ram, machine,
+                                         "fulong2e.ram", ram_size);
     memory_region_init_ram(bios, NULL, "fulong2e.bios", BIOS_SIZE,
                            &error_fatal);
     memory_region_set_readonly(bios, true);
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 8d010a0b6e..88b125855f 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -188,7 +188,7 @@ static void mips_jazz_init(MachineState *machine,
     cc->do_transaction_failed =3D mips_jazz_do_transaction_failed;
=20
     /* allocate RAM */
-    memory_region_allocate_system_memory(ram, NULL, "mips_jazz.ram",
+    memory_region_allocate_system_memory(ram, machine, "mips_jazz.ram",
                                          machine->ram_size);
     memory_region_add_subregion(address_space, 0, ram);
=20
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 4d9c64b36a..af56a29ccb 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1267,7 +1267,7 @@ void mips_malta_init(MachineState *machine)
     }
=20
     /* register RAM at high address where it is undisturbed by IO */
-    memory_region_allocate_system_memory(ram_high, NULL, "mips_malta.ram",
+    memory_region_allocate_system_memory(ram_high, machine, "mips_malta.ra=
m",
                                          ram_size);
     memory_region_add_subregion(system_memory, 0x80000000, ram_high);
=20
diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 282bbecb24..c1933231e2 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -166,7 +166,7 @@ mips_mipssim_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, reset_info);
=20
     /* Allocate RAM. */
-    memory_region_allocate_system_memory(ram, NULL, "mips_mipssim.ram",
+    memory_region_allocate_system_memory(ram, machine, "mips_mipssim.ram",
                                          ram_size);
     memory_region_init_ram(bios, NULL, "mips_mipssim.bios", BIOS_SIZE,
                            &error_fatal);
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index bc0be26544..59f8cacfb6 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -203,7 +203,8 @@ void mips_r4k_init(MachineState *machine)
                      " maximum 256MB", ram_size / MiB);
         exit(1);
     }
-    memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram", ram_si=
ze);
+    memory_region_allocate_system_memory(ram, machine, "mips_r4k.ram",
+                                         ram_size);
=20
     memory_region_add_subregion(address_space_mem, 0, ram);
=20
--=20
2.21.0

