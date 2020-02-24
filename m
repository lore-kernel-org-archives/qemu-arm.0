Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp804866lfg;
        Mon, 24 Feb 2020 13:35:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1KOtikAC8ys3sh+ip9w2QazLMrBtg+oo394jN7jeEKMq6mY5eiwE92YNdBnt+qpkKunck
X-Received: by 2002:a05:620a:886:: with SMTP id b6mr51612329qka.376.1582580150366;
        Mon, 24 Feb 2020 13:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580150; cv=none;
        d=google.com; s=arc-20160816;
        b=n3LcjGjxyxd93y26wE1OvBEKfliSPrE+FeSMdOxUugbuF4e1LHDKaMezssBmUjixVl
         5ZraMH6hUXzIhEPq/JY6/Fzdom9qljmIBMOnQGIyh8YVmk7hSJFhUoJyJR0NrruqHnog
         +Pe6EkShQb1DOptFcgfkS+9V6yWro+oTaxlUHe0jB1xpiKKIjGz/48Gs4AvKpNGxFqir
         1UpTpkdgajY+xhOQrKKHY2BDTpjBX8WydK+KLMEAK91wIAGpqpDTaz5bmnFjeiTuz67u
         26DFtsbLOUyfq97XKXRa3a5lPYy6LBlfBoYGNccgAAZO3fW439Mzt+4XS5MXBkQX3HZk
         98sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GBNzuBX+l+LuROYmtlMct7VCTnb/r/o0TNqAlSU1sE8=;
        b=O+3rKvBZbNvZ47kLsfBgC7tURz9EfrqnBqG8YU/aY4VGCQ+A5XpEl7J+C/w+MvTs2Z
         iMFf+XI8xgbicctwbynMv2zwDSUUeDY2c3rt5I2+ihrZ43kXkJDGcCfwHYQnWoHLXSxI
         ZGeLVdCw/07b6KLg8EtdO9BazK+JisgKrp+04RqGwYigm5tmcnO1wCnEckPR8599WX0H
         BE6Hr8RVOWstMlmLpaEY9eEQ75RYvCPx1uNqxPONa68Ut1e5YpMFrjNpNeZNlnfLxo1L
         X0Oie48BYHgFqh8mM+HJJ9Qc06pvKZtCTnMMD/LE6G6itKFsBVJlvxCcAKNj1TYb88GM
         NB6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NYWYdq63;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si6169641qvu.33.2020.02.24.13.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:35:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NYWYdq63;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LOH-0007MJ-Le
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kpx-00051u-Em
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:00:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kpw-0006an-0D
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:00:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20259
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kpv-0006aP-RD
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:00:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBNzuBX+l+LuROYmtlMct7VCTnb/r/o0TNqAlSU1sE8=;
 b=NYWYdq638vLw1UySYVSXgYs5hb2ilS5AYmowNfJfhxQAqGMwkrL8vKIJSX/kzje8C027Ui
 3SP3ZXd79/jiJE1L9WkAuE9y5cjKvcDzrCT+wxQwxFKHq7NbdhxfezrnNn4ZR7ZUiSQiKC
 3om/MKDQ17Zh7MLPNiQ7byxDxtvwTEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-5sQM0hkiO1O7hIVqfdrbZQ-1; Mon, 24 Feb 2020 16:00:15 -0500
X-MC-Unique: 5sQM0hkiO1O7hIVqfdrbZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 298FC8018A4;
 Mon, 24 Feb 2020 21:00:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D05B5C54A;
 Mon, 24 Feb 2020 20:59:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 18/32] hw/i386/pc_sysfw: Simplify using
 memory_region_init_alias()
Date: Mon, 24 Feb 2020 21:55:19 +0100
Message-Id: <20200224205533.23798-19-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bKMav8Tb33CI

The scripts/coccinelle/memory-region-housekeeping.cocci reported:
* TODO [[view:hw/i386/pc_sysfw.c::face=3Dovl-face1::linb=3D67::colb=3D4::co=
le=3D26][potential use of memory_region_init_rom*() in  hw/i386/pc_sysfw.c:=
:67]]

pc_isa_bios_init() does a manual copy of a part of the BIOS,
from a read-only region. We can simplify by directly aliasing
the same part.

Before:

  (qemu) info mtree
  memory-region: system
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000007ffffff (prio 0, ram): alias ram-below-4g @=
pc.ram 0000000000000000-0000000007ffffff
      0000000000000000-ffffffffffffffff (prio -1, i/o): pci
        00000000000a0000-00000000000bffff (prio 1, i/o): vga-lowmem
        00000000000c0000-00000000000dffff (prio 1, rom): pc.rom
        00000000000e0000-00000000000fffff (prio 1, rom): isa-bios
      ...
      00000000fff00000-00000000ffffffff (prio 0, romd): system.flash0

After:

  (qemu) info mtree
  memory-region: system
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000007ffffff (prio 0, ram): alias ram-below-4g @=
pc.ram 0000000000000000-0000000007ffffff
      0000000000000000-ffffffffffffffff (prio -1, i/o): pci
        00000000000a0000-00000000000bffff (prio 1, i/o): vga-lowmem
        00000000000c0000-00000000000dffff (prio 1, rom): pc.rom
        00000000000e0000-00000000000fffff (prio 1, romd): alias isa-bios @s=
ystem.flash0 00000000000e0000-00000000000fffff
      ...
      00000000fff00000-00000000ffffffff (prio 0, romd): system.flash0

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc_sysfw.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index f5f3f466b0..e864c09ea8 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -54,31 +54,19 @@ static void pc_isa_bios_init(MemoryRegion *rom_memory,
                              MemoryRegion *flash_mem,
                              int ram_size)
 {
-    int isa_bios_size;
-    MemoryRegion *isa_bios;
-    uint64_t flash_size;
-    void *flash_ptr, *isa_bios_ptr;
-
-    flash_size =3D memory_region_size(flash_mem);
+    uint64_t isa_bios_size;
+    MemoryRegion *isa_bios =3D g_new(MemoryRegion, 1);
+    uint64_t flash_size =3D memory_region_size(flash_mem);
=20
     /* map the last 128KB of the BIOS in ISA space */
     isa_bios_size =3D MIN(flash_size, 128 * KiB);
-    isa_bios =3D g_malloc(sizeof(*isa_bios));
-    memory_region_init_ram(isa_bios, NULL, "isa-bios", isa_bios_size,
-                           &error_fatal);
+    memory_region_init_alias(isa_bios, NULL, "isa-bios", flash_mem,
+                             flash_size - isa_bios_size,
+                             isa_bios_size);
     memory_region_add_subregion_overlap(rom_memory,
                                         0x100000 - isa_bios_size,
                                         isa_bios,
                                         1);
-
-    /* copy ISA rom image from top of flash memory */
-    flash_ptr =3D memory_region_get_ram_ptr(flash_mem);
-    isa_bios_ptr =3D memory_region_get_ram_ptr(isa_bios);
-    memcpy(isa_bios_ptr,
-           ((uint8_t*)flash_ptr) + (flash_size - isa_bios_size),
-           isa_bios_size);
-
-    memory_region_set_readonly(isa_bios, true);
 }
=20
 static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
--=20
2.21.1

