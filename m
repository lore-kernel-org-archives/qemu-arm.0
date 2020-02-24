Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp817259lfg;
        Mon, 24 Feb 2020 13:52:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyFBaCBzUE3+C7h6XSv3WytwDNAnbAfciw4dNma+vcoaSQFLBtigbEyHjsU4cYcoQLscpZS
X-Received: by 2002:a37:aac4:: with SMTP id t187mr11483178qke.258.1582581149942;
        Mon, 24 Feb 2020 13:52:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582581149; cv=none;
        d=google.com; s=arc-20160816;
        b=wb1tME3SynbXkO4mZyL7RIC4Yf/oPpC0F93Dqky7VwGqxG4d7iR8LdIjAJ1HTkdbuQ
         x1yYq3MLqCP77+R4Ghar8KFlZbc6YEfD0yTzU6Tn/MCj2jGpABLtVGkOCQ5eEU5lvGSZ
         JqbMcx3BS/a8Y6myhxwOsb0kuDqJ5mBOUBS2q89SKgfrulpg4A+LWsaomMKdUwKeF9N2
         pNy333YE0mMg+eA/4NBoqlS79pLeGCMIAuSnoc2zkztbMaKBnARi8yRHUmZXfpJDGFQt
         o+M1fOF2jrImVHR/n/AL2DtU14gHAH0i+7oj2Q6n1xna+KmTzr9/PXl1kf1F+U0L8mkz
         mHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=StqJFGk25DRObG1eUf3VsEaRXrOCmfJGPZ/cwXjxQcU=;
        b=c9WV7GcVwZGSaVFook81c/d7WtYqWhQa+n8NeDFKNKWYeDLVv2LNYW62009BaZ0/xS
         rTl5/em5kIfeFmMNSGgQAkxpaCAxxmZ7RZBJb8GsbbmnNniN1uoz8D2E3hUCBbOkALv6
         bOEDKuZ3qdQGMhEG2nEAGVLboHeTWPbYCHehd89pO6hEArjfxX6As+B0W4kzUT6/EYvL
         yUb5owERlbTIhwhBew7jecN/1cwuDRmEtAj/+zgKMPxtmNoXl7N76BqvoulaDSwSB32+
         c5lj44ouKa3WE+3fqbE/Nfl8dWNM7eHS69LTgPmWrKMcyWBPBI/XgkJgL48rTCzRGoR+
         w9ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OTs7s7vn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si6430923qvx.0.2020.02.24.13.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:52:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OTs7s7vn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LeP-0000Db-CH
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Ksl-0001Fe-OX
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Ksj-0008Va-2i
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:03:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47076
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Ksi-0008Tw-TJ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StqJFGk25DRObG1eUf3VsEaRXrOCmfJGPZ/cwXjxQcU=;
 b=OTs7s7vnvLnp/HKFx/Ap3N6e8/r58vnl64+tdoBls+fSLrlPe4+R2KJviQParEC+UZ6E+u
 vXxS7uUJPQmKij/DQbdiaBoXHZb+uVlYX+vqSul3+FXEkGXq/CDw4Sv9Qe9nW4HONJd6Ai
 d5cpNo7QPEh2jmiJ3BMuJIAj8PnjMXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-DejhcVKnPHCUF0iGsrmtVg-1; Mon, 24 Feb 2020 16:03:10 -0500
X-MC-Unique: DejhcVKnPHCUF0iGsrmtVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 608991005513;
 Mon, 24 Feb 2020 21:03:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 392765C21B;
 Mon, 24 Feb 2020 21:02:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH RESEND v2 32/32] hw/block/onenand: Let devices own the
 MemoryRegion they create
Date: Mon, 24 Feb 2020 21:55:33 +0100
Message-Id: <20200224205533.23798-33-philmd@redhat.com>
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
X-TUID: R1xfp7RUvL0r

Avoid orphan memory regions being added in the /unattached QOM
container.

Note this change break the migration of the nSeries machines.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/onenand.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 898ac563a3..f49db0b2ee 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -173,8 +173,8 @@ static int onenand_post_load(void *opaque, int version_=
id)
=20
 static const VMStateDescription vmstate_onenand =3D {
     .name =3D "onenand",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .pre_save =3D onenand_pre_save,
     .post_load =3D onenand_post_load,
     .fields =3D (VMStateField[]) {
@@ -809,9 +809,8 @@ static void onenand_realize(DeviceState *dev, Error **e=
rrp)
     }
     s->otp =3D memset(g_malloc((64 + 2) << PAGE_SHIFT),
                     0xff, (64 + 2) << PAGE_SHIFT);
-    memory_region_init_ram_nomigrate(&s->ram, OBJECT(s), "onenand.ram",
+    memory_region_init_ram(&s->ram, OBJECT(s), "onenand.ram",
                            0xc000 << s->shift, &error_fatal);
-    vmstate_register_ram_global(&s->ram);
     ram =3D memory_region_get_ram_ptr(&s->ram);
     s->boot[0] =3D ram + (0x0000 << s->shift);
     s->boot[1] =3D ram + (0x8000 << s->shift);
--=20
2.21.1

