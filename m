Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp791856lfg;
        Mon, 24 Feb 2020 13:19:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZCshWbW1BL+RWZyLfYhrVEpCXMVjWdrgIVDsi/ZBve6s/YX7IGh70JDD4Dd50s9lshOB8
X-Received: by 2002:ae9:ec09:: with SMTP id h9mr36788335qkg.65.1582579160876;
        Mon, 24 Feb 2020 13:19:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579160; cv=none;
        d=google.com; s=arc-20160816;
        b=ER/173OJW+o+SrUEuIDxh82swPH9dMjZWrpimiBdpOJkxqqr3pLOqQ7NGCFNqVsQWU
         2EOBCFq46GSK+7jtlebsYTBNSMDO671qnnuIqkXL8L2mbkyJmToB7FJUk4QH8D75EqUf
         +lmd/dqEmLb5W1sKdRxTvnkgMR3zFPPRzWKUVwv8y5Jdewh9XrlQfVwbYJtbexmjgnYs
         oSBTd/lHsa3Mg6a5NmmmgQaGWLPyl7zziON3vdBb4itx+BjNC6DRpd1Y9tcf82L02KPp
         TmOeyLQuRiNM50+zaYARGHVZH0b3Y53UkNkc1lsiLQUKt3nDMigdb0HDW18n722PQpah
         /I0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DAKyL7Tqa+fBdxrFOnKvFsx39GH2EjqIV6ZKoapzE/Q=;
        b=rpeh0JK7ZFBLt3zyJ1fQSDzyqsxHTQwbkkex1rod5Z6YTnfajCGiMKI05BawIZLt5P
         lLQgcFV4cn6jlsnHhWNJZEcA7LtWLBqrhJ4sqySdxy1Hx7itwqFZPK80CYIr5IbSSJ63
         yzwy1AkQ1KdRbt0peussG70dNAwBIM5bMviDY1x5ofJTCcb1OcF1FLMWuuyIXZ+GWyQQ
         cA7oysDGXdv/6kJ02ZP7/i9hQif+TbWMCPxD/xUuzcJ+d3Z3LKJvXyLIcijV1IgdsRJU
         btTeVpVZ3iudpnpyKZ0bh2p7FxgBCFDBlWKmtFCKsCJvmNnB3iVa8dR9gf6X5rPUuggW
         j5ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JRs2QhDP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si5756965qvy.97.2020.02.24.13.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:19:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JRs2QhDP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6L8K-0003Ms-7v
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KnS-0000or-N4
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:57:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KnR-0004Xc-NL
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:57:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54700
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KnR-0004X5-J0
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAKyL7Tqa+fBdxrFOnKvFsx39GH2EjqIV6ZKoapzE/Q=;
 b=JRs2QhDPrB+Zgz0xB54Bkj7P+WmgAyBM0/cg9Ffq48VaVkhigOp0fHqfp4oJ1Kb6fFAxv1
 Uj8RgmYynhKpdgAVB7P+EISYLg/eNT7n5wqUrVyipSIoj5DaEz1IHAdXfK1Gse2+IgMvdv
 XLjAenVhPBa3UPqCue+rZ7bczOMFWA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-WEuuKmVzO9K1-WgNWVdffA-1; Mon, 24 Feb 2020 15:57:43 -0500
X-MC-Unique: WEuuKmVzO9K1-WgNWVdffA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17FC6800D53;
 Mon, 24 Feb 2020 20:57:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2364C5C651;
 Mon, 24 Feb 2020 20:57:28 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 06/32] hw/display: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:55:07 +0100
Message-Id: <20200224205533.23798-7-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vnb+LbBtRBy6

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/cg3.c | 5 ++---
 hw/display/tcx.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 4fb67c6b1c..a1ede10394 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -287,9 +287,8 @@ static void cg3_initfn(Object *obj)
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
     CG3State *s =3D CG3(obj);
=20
-    memory_region_init_ram_nomigrate(&s->rom, obj, "cg3.prom", FCODE_MAX_R=
OM_SIZE,
-                           &error_fatal);
-    memory_region_set_readonly(&s->rom, true);
+    memory_region_init_rom_nomigrate(&s->rom, obj, "cg3.prom",
+                                     FCODE_MAX_ROM_SIZE, &error_fatal);
     sysbus_init_mmio(sbd, &s->rom);
=20
     memory_region_init_io(&s->reg, obj, &cg3_reg_ops, s, "cg3.reg",
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index ca458f94fe..76de16e8ea 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -755,9 +755,8 @@ static void tcx_initfn(Object *obj)
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
     TCXState *s =3D TCX(obj);
=20
-    memory_region_init_ram_nomigrate(&s->rom, obj, "tcx.prom", FCODE_MAX_R=
OM_SIZE,
-                           &error_fatal);
-    memory_region_set_readonly(&s->rom, true);
+    memory_region_init_rom_nomigrate(&s->rom, obj, "tcx.prom",
+                                     FCODE_MAX_ROM_SIZE, &error_fatal);
     sysbus_init_mmio(sbd, &s->rom);
=20
     /* 2/STIP : Stippler */
--=20
2.21.1

