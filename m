Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp804301lfg;
        Mon, 24 Feb 2020 13:35:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyafEl9cg7sRZMcH5Xz7+cuG1haUNOTDOxflz8zhwa7nndX9DOVMQXU7QZySR5fY5NvLa1Y
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr48016524qvm.45.1582580104225;
        Mon, 24 Feb 2020 13:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580104; cv=none;
        d=google.com; s=arc-20160816;
        b=iPyaGlim75zg2Pv2AIvPdstZIFqF7UzZxHIX2uQOgCXU/qpoEiq7bKQhENcfN4EemO
         wVV7hmAEGxSWHxpm079Ax4LSupcU07Bs5n+jHgq3dMT+YfyA+GWePufEKUvzeLHiLzvf
         mTEn6HMcEspLHFDswytGfz3G7P5K3whm1QMyVkw2SO0PKOp7y75qwLeML+VUWIQNYsUJ
         Us7NqnvXeV9TkVVfLxTmvqzCMGVkQ0fV1KR772/xU/ZsfsHTi9TGOsHmAOo+xwpTm8Bw
         MTmnwODATjRzjd69YsDvyDf5h2IJBX13xoKarVZ/40WmcO+0xaUKII3+eRzy14XxK2xt
         BtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AksPoeIdaQJuU1Oxkwgd0bzdhJ7x56x3M7zV8fEB+j0=;
        b=FvLqj+f+WdKVx16L4H0MhKpmQgOx9Re2ybCqsuTbOaEelzUTZd2b4VnbytkIyxlPBF
         pw4hKeSz9V6iWfP2EbGHohcH/jsDGjXtd2/rJOxUqRSEvhagGHAVSxpu2022RZWxzn1Y
         LK6mRU2LYftXJzBrPXeZpKJu6XvMJZdaVY45XRYovoZR0CIz4SJZh6oUWAMnXlrmOcBc
         TIuwf9+icO6rWdeLWRVtcCpjhFIfKamMYEiiCx+wrqA7L7UElxeaBum76n6ObJhc+/J2
         FS9Yo7Gt4wqFkGKbE7Qg+oZGKLAHL1SDTZ9uZ0WDViEl8YKT1GFz5VDI+zn+io9HlpZH
         dghQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z2j9fXT6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si6269600qtu.162.2020.02.24.13.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z2j9fXT6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LNX-0005iZ-JR
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Knw-0001Rw-5A
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Knr-0004rV-6M
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:16 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29831
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Knr-0004qt-2R
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AksPoeIdaQJuU1Oxkwgd0bzdhJ7x56x3M7zV8fEB+j0=;
 b=Z2j9fXT6e+srkbP5Pa/EjG2G92NrUAjxovUImGpGuXMjNKSgg3uP7ntEbRe+jJV/mICJlH
 bwrB5LQ7KZCuBjZOCaKQIyVLNuQYrbFpWDkoX9IxwmRFpHEIwYPRUFtrJZK2GAU8B6LC3L
 sN/hXIJIiivHdTvoFCVIjYTFrVMcoTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-By03AjPXPKavwCoPGL_ANw-1; Mon, 24 Feb 2020 15:58:07 -0500
X-MC-Unique: By03AjPXPKavwCoPGL_ANw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7866107B7E0;
 Mon, 24 Feb 2020 20:58:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B66195C651;
 Mon, 24 Feb 2020 20:57:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 08/32] hw/m68k: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:55:09 +0100
Message-Id: <20200224205533.23798-9-philmd@redhat.com>
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
X-TUID: 9sJPkc4Ke2FO

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/m68k/q800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1e32363688..8083326d37 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -402,13 +402,12 @@ static void q800_init(MachineState *machine)
         uint8_t *ptr;
         /* allocate and load BIOS */
         rom =3D g_malloc(sizeof(*rom));
-        memory_region_init_ram(rom, NULL, "m68k_mac.rom", MACROM_SIZE,
+        memory_region_init_rom(rom, NULL, "m68k_mac.rom", MACROM_SIZE,
                                &error_abort);
         if (bios_name =3D=3D NULL) {
             bios_name =3D MACROM_FILENAME;
         }
         filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-        memory_region_set_readonly(rom, true);
         memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom)=
;
=20
         /* Load MacROM binary */
--=20
2.21.1

