Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2316641lff;
        Sat, 14 Dec 2019 07:57:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxL4TuGJTdGSCwVScr1KJPtx1gqBy29Q+aerORhVCDdkxxSQdUccNOsDx/6cTHTvqO+Ol3h
X-Received: by 2002:a9d:730e:: with SMTP id e14mr20215841otk.62.1576339068033;
        Sat, 14 Dec 2019 07:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576339068; cv=none;
        d=google.com; s=arc-20160816;
        b=BHoFnyeRu0d7xj6m9EXqq3+B90eBeQk31GP6GlWosdj0Uyn/57R9wyO+MGtnrMrjkU
         MllXVSxjK8ufOgoGMQvFE3j8QsgQVCx3L7UbTmkiYpe6cHslMxg4BWmFWN2qczr3qIcF
         BD+ui/PwNfk0a6gFFodZc4KWUJ3wWpkZFGQLA+eOEnmKSXenLFZiz3wTJdh9Hqwu+Yb2
         mXxTZn+H16lO6+KyozsFP+ko/IdDm1vNMAxX0Lb6IqxGYeZx7n6mHJPZtB9uBAetfLUY
         v1eC/NerZYrYqQOH34uRVJ+3pQFF8AwTMAH0rdIW5K5MdRmvJNWOEOrYynEXyaiY+kJw
         lMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=LVY3k3PXmSJpFd+itDbLg545Lfy8MyLnQ8WHFK1FOqU=;
        b=VK/IUwp3qIOiiWFHqfa+EgEcUISEYxp61dIvNTrwyfXp6PhF9OkSxJihiLKGw3/hRI
         HFE3GGPtsh5iIR4scXVh4BpemzllyMKNDP9StDc78XlYCbxjCrUce8t/Rom9sbA5S8V8
         oWQ3BU+Cg1TK1Xv95DdXR+NauHkwYB7SzbogX0wjqld3+CKT0o3BpcGLNxdLAI1kJgYK
         7AxYbSuaseyZMghqz5e1W2BddvM/XzwB53Yeh6Ne05njxqA+Z555pvJtTlNsW2QxMjNK
         lpZ8y1n0ag0eR3OCSBqIN/IZ3xPv4Yxmr68e5NU7MI5K5WcEZ/VDGA3GeHbuzeKLkK/I
         7xYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=apecUbl3;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a205si7330504oii.95.2019.12.14.07.57.47;
        Sat, 14 Dec 2019 07:57:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=apecUbl3;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfLNP5r (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 14 Dec 2019 10:57:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20067 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725900AbfLNP5q (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 14 Dec 2019 10:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576339065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LVY3k3PXmSJpFd+itDbLg545Lfy8MyLnQ8WHFK1FOqU=;
        b=apecUbl3Uepu2QGt1KVr6Nsi0NBxUTXp/VtWw5QvlFlZvw0Iq69WRgs7j5Z/tavZT9FBE9
        C3C42n/TwcqQc4r1QheGm96FYrassvS/dbe2bdr2+yFtm70QD176KH0JGZ1i46+RGEZ0fY
        /N+ryzCJwUgNJ7D/TN8CVn4P2dFm7To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-izlcFJRFOTCG14SMImFy1g-1; Sat, 14 Dec 2019 10:57:43 -0500
X-MC-Unique: izlcFJRFOTCG14SMImFy1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBADE107ACC4;
        Sat, 14 Dec 2019 15:57:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D3D5D6A7;
        Sat, 14 Dec 2019 15:57:32 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 5/8] hw/mips/boston: Use memory_region_add_subregion() when priority is 0
Date:   Sat, 14 Dec 2019 16:56:11 +0100
Message-Id: <20191214155614.19004-6-philmd@redhat.com>
In-Reply-To: <20191214155614.19004-1-philmd@redhat.com>
References: <20191214155614.19004-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 2vbIk91zqgL/

It is pointless to overlap a memory subregion with priority 0.
Use the simpler memory_region_add_subregion() function.

This patch was produced with the following spatch script:

    @@
    expression region;
    expression offset;
    expression subregion;
    @@
    -memory_region_add_subregion_overlap(region, offset, subregion, 0)
    +memory_region_add_subregion(region, offset, subregion)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/mips/boston.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index ca7d813a52..a27258b4d1 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -412,10 +412,10 @@ xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bu=
s_nr,
     qdev_init_nofail(dev);
=20
     cfg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
-    memory_region_add_subregion_overlap(sys_mem, cfg_base, cfg, 0);
+    memory_region_add_subregion(sys_mem, cfg_base, cfg);
=20
     mmio =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
-    memory_region_add_subregion_overlap(sys_mem, 0, mmio, 0);
+    memory_region_add_subregion(sys_mem, 0, mmio);
=20
     qdev_connect_gpio_out_named(dev, "interrupt_out", 0, irq);
=20
@@ -471,17 +471,17 @@ static void boston_mach_init(MachineState *machine)
=20
     flash =3D  g_new(MemoryRegion, 1);
     memory_region_init_rom(flash, NULL, "boston.flash", 128 * MiB, &err)=
;
-    memory_region_add_subregion_overlap(sys_mem, 0x18000000, flash, 0);
+    memory_region_add_subregion(sys_mem, 0x18000000, flash);
=20
     ddr =3D g_new(MemoryRegion, 1);
     memory_region_allocate_system_memory(ddr, NULL, "boston.ddr",
                                          machine->ram_size);
-    memory_region_add_subregion_overlap(sys_mem, 0x80000000, ddr, 0);
+    memory_region_add_subregion(sys_mem, 0x80000000, ddr);
=20
     ddr_low_alias =3D g_new(MemoryRegion, 1);
     memory_region_init_alias(ddr_low_alias, NULL, "boston_low.ddr",
                              ddr, 0, MIN(machine->ram_size, (256 * MiB))=
);
-    memory_region_add_subregion_overlap(sys_mem, 0, ddr_low_alias, 0);
+    memory_region_add_subregion(sys_mem, 0, ddr_low_alias);
=20
     xilinx_pcie_init(sys_mem, 0,
                      0x10000000, 32 * MiB,
@@ -501,7 +501,7 @@ static void boston_mach_init(MachineState *machine)
     platreg =3D g_new(MemoryRegion, 1);
     memory_region_init_io(platreg, NULL, &boston_platreg_ops, s,
                           "boston-platregs", 0x1000);
-    memory_region_add_subregion_overlap(sys_mem, 0x17ffd000, platreg, 0)=
;
+    memory_region_add_subregion(sys_mem, 0x17ffd000, platreg);
=20
     s->uart =3D serial_mm_init(sys_mem, 0x17ffe000, 2,
                              get_cps_irq(&s->cps, 3), 10000000,
@@ -509,7 +509,7 @@ static void boston_mach_init(MachineState *machine)
=20
     lcd =3D g_new(MemoryRegion, 1);
     memory_region_init_io(lcd, NULL, &boston_lcd_ops, s, "boston-lcd", 0=
x8);
-    memory_region_add_subregion_overlap(sys_mem, 0x17fff000, lcd, 0);
+    memory_region_add_subregion(sys_mem, 0x17fff000, lcd);
=20
     chr =3D qemu_chr_new("lcd", "vc:320x240", NULL);
     qemu_chr_fe_init(&s->lcd_display, chr, NULL);
--=20
2.21.0
