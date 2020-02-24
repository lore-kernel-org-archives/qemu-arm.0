Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp804249lfg;
        Mon, 24 Feb 2020 13:34:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpaKXovZZcMDYZujLoDHS0brqVKjP1SNDdyE6WDPCx5YUuMLGRptOTWGL+rGoNd1EmZ2YS
X-Received: by 2002:a05:6214:1267:: with SMTP id r7mr47125444qvv.160.1582580099495;
        Mon, 24 Feb 2020 13:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580099; cv=none;
        d=google.com; s=arc-20160816;
        b=fqKOqXPp/fSVp0OCduTL1KKj3Sz7hDE3U6biQoI2r49S4zpsuh2BdoVTN7glI7pj09
         sO8G/RJwJVEuhkE4zrVf2EvrtO33XWAfJwxVtX20Y2Ic6Q0l6kwjp6qQzejPcJUZ/ZrK
         L7QzGzwMRvPTfp2Vd0W1FxyeNxQVcm/Fa2ULN7OJK52w7+GpV1+R5HT60+x29MWDjzen
         vhFg+bB61ha5xP4c64Y9Y3sipOlWAsl/bSnzJAgM2WCF7jI0az6rHcqOACyFtyUtdS9n
         VMK7oNoZw00cJPWFMREGjWriDN8p9P2j84X2A0rGpJ+U+3DEB9SvJrIcCqi1Df9HxRhr
         d1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eENF83ZsU8Q/JST+/cnBMiYrotiX2pVY6D2cp7zhmT8=;
        b=vMQiUtA1zh5EXVDCaJ/VDUY806Bq54VwAcazz+jQJliOWZOQXmofUi1RMYy7ZrZVgO
         XCTRPQq2ZMiAdPpHhGW3d0bXUkm/sN2j4GhmLgkxC4yTnW2CaNlTruEdnyPxDQyDjjDW
         HaB4lEGiur5+f/KY6IGO1YMf8+jyFaF5ruUYTfXRMgwnuLdCuWXw+lONolm/kDg2v/R1
         CjDVWerk8Ce/m1i/8RhagDHDgPE10pqEKLJJ4X7jM4/YzIR+m0+6rumc3XJVDlKbAaoV
         ZhKH2UwW/e3XS3QLMfMAEwucXjjtBs0Pe02/FNUysQlLz5SsVJZKKszrYWkas6qM+9tj
         B/hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZJAycAb0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si6583194qki.209.2020.02.24.13.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:34:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZJAycAb0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LNS-0005VO-SZ
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kos-0003Fl-Qj
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:59:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kor-0005fU-R4
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:59:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47451
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kor-0005ex-Nc
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eENF83ZsU8Q/JST+/cnBMiYrotiX2pVY6D2cp7zhmT8=;
 b=ZJAycAb0LUDPq5CoG703B+88A3uDWrRD2eY8xf0VSEfZ8bcrd/nlLFF1bK3L16wzljUes/
 LztPnn+fjQ0nVjqWBmiMn2FHzIuxuPL4wgAtw10NyV87aAPciHsuxBfUjZ5SZMRseDg7jk
 +7EwIlubx3KENDVF1i6xijGMB1jMaSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-2zt37Q_CPcWfs3VWnHI3yQ-1; Mon, 24 Feb 2020 15:59:11 -0500
X-MC-Unique: 2zt37Q_CPcWfs3VWnHI3yQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 925A313F8;
 Mon, 24 Feb 2020 20:59:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46F675C54A;
 Mon, 24 Feb 2020 20:58:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 13/32] hw/sh4: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:55:14 +0100
Message-Id: <20200224205533.23798-14-philmd@redhat.com>
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
X-TUID: EdsCXotDi5j8

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/sh4/shix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index 2fc2915428..56c7d29bf5 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -53,8 +53,7 @@ static void shix_init(MachineState *machine)
     cpu =3D SUPERH_CPU(cpu_create(machine->cpu_type));
=20
     /* Allocate memory space */
-    memory_region_init_ram(rom, NULL, "shix.rom", 0x4000, &error_fatal);
-    memory_region_set_readonly(rom, true);
+    memory_region_init_rom(rom, NULL, "shix.rom", 0x4000, &error_fatal);
     memory_region_add_subregion(sysmem, 0x00000000, rom);
     memory_region_init_ram(&sdram[0], NULL, "shix.sdram1", 0x01000000,
                            &error_fatal);
--=20
2.21.1

