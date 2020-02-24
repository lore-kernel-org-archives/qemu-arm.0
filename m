Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp814857lfg;
        Mon, 24 Feb 2020 13:49:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvpohGcs92s8r7Oz6AEOgaFt+zZzij9M74B7rLE5eEAx3ssszcc2WRfq77mnIEsVGeqm19
X-Received: by 2002:a37:6393:: with SMTP id x141mr49667233qkb.134.1582580951579;
        Mon, 24 Feb 2020 13:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580951; cv=none;
        d=google.com; s=arc-20160816;
        b=lADL7gNQvYiRN9g7xORK3aqNFC2okeWORUPbcAqXja0p82/bnMiOXjhFGx3bZo1ST+
         Yt1MWDta/RHls6mQbUA8dyyw+uODp1RtZqHC01cDSJw5aO3zQaROldQbNUWmJuDhZdds
         Bdn46kPWKgw1cV+2sddCHL90+N0jFWMVXqjtR5esRyL4iKEBWJgPK/OiJOFAcC0fXGTQ
         /ttEA56FfD2cSbzbHwKlw0XQVGrsdhoIHjBoe41KySr/PZQa2tpinpS17Vr+ted4xXOm
         3+4SfTDOvuRttPyw1p2pqj9v5wkMv4nAJN+A1UptR5puhUyytmScv/3h/E9fmFM1Wa3/
         JrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=M00bRTY5Od/jt3qLVU2pJOLmr0uFfCYFYcH1/TRboO0=;
        b=BMWdY9lEkUPcBI2NN9zwvQYAhIS+gBWDwhKd8UnmTLDSKFvLokiipCwDKaIXdDVgC9
         qwFSLaiiN12KM5UvqdHgFrA+XoODR1609IfZWjlZ+rrgqFiBNsPec2Hl0VES2WVkQgQ8
         eaVBjSx4AjwE7RGzE0r4zCWbj5mx/Uy1fOjQCvfidtyAO6NU48rym+gzCZRwVURzaAfH
         zcj7lCq+HldGvX6izcafTERr+BzBJ53TjIHHlMYHru0L3XlNBlPlf8/oJbnJ4qEggrL4
         ukv00iEXlb9ONTzn/lDgAQkcP6GnAMtnt6guPo1rxq32Y3NqeQgc8R0vi8q3ZA7C1/X9
         viug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S5JY1smV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si6091294qvw.157.2020.02.24.13.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S5JY1smV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LbD-000458-1m
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KsM-0000Ta-JN
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:02:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KsL-0008G0-Dy
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:02:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53353
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KsL-0008Fe-9U
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M00bRTY5Od/jt3qLVU2pJOLmr0uFfCYFYcH1/TRboO0=;
 b=S5JY1smV2LkYB2ZV9tBkEm1Ggc4OQFiu1RcuXsmTcFRAbM79Hf80Zen4ld35Rnta3ZuHIe
 goLsUK/+oPcEY/7kHo0kxM+XHEchzuXODaY+smlH++AIlRpd1iLdq8QLJ49QdmLyxYgoGQ
 nNnfILHSFQG5fF5cTVp5pjRPu9fS2/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-KedknbR_Pg-GkEjsoyumTg-1; Mon, 24 Feb 2020 16:02:45 -0500
X-MC-Unique: KedknbR_Pg-GkEjsoyumTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C59B91005512;
 Mon, 24 Feb 2020 21:02:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E3B5C6DC;
 Mon, 24 Feb 2020 21:02:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH RESEND v2 30/32] hw/input/milkymist-softusb: Let devices
 own the MemoryRegion they create
Date: Mon, 24 Feb 2020 21:55:31 +0100
Message-Id: <20200224205533.23798-31-philmd@redhat.com>
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
X-TUID: 8AZLMr2V953n

Avoid orphan memory regions being added in the /unattached QOM
container.

Note this change break the migration of the LM32 milkymist machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/input/milkymist-softusb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 7deeb1294f..72bc7bae1e 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -259,13 +259,11 @@ static void milkymist_softusb_realize(DeviceState *de=
v, Error **errp)
     sysbus_init_mmio(sbd, &s->regs_region);
=20
     /* register pmem and dmem */
-    memory_region_init_ram_nomigrate(&s->pmem, OBJECT(s), "milkymist-softu=
sb.pmem",
+    memory_region_init_ram(&s->pmem, OBJECT(s), "milkymist-softusb.pmem",
                            s->pmem_size, &error_fatal);
-    vmstate_register_ram_global(&s->pmem);
     sysbus_init_mmio(sbd, &s->pmem);
-    memory_region_init_ram_nomigrate(&s->dmem, OBJECT(s), "milkymist-softu=
sb.dmem",
+    memory_region_init_ram(&s->dmem, OBJECT(s), "milkymist-softusb.dmem",
                            s->dmem_size, &error_fatal);
-    vmstate_register_ram_global(&s->dmem);
     s->dmem_ptr =3D memory_region_get_ram_ptr(&s->dmem);
     sysbus_init_mmio(sbd, &s->dmem);
=20
@@ -275,8 +273,8 @@ static void milkymist_softusb_realize(DeviceState *dev,=
 Error **errp)
=20
 static const VMStateDescription vmstate_milkymist_softusb =3D {
     .name =3D "milkymist-softusb",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, MilkymistSoftUsbState, R_MAX),
         VMSTATE_HID_KEYBOARD_DEVICE(hid_kbd, MilkymistSoftUsbState),
--=20
2.21.1

