Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1189887wrq;
        Wed, 23 Oct 2019 10:35:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzx99rwANSI0SyWMKkDRCeWwlYBmcA3gqLZveTM7oX/M4zkr4HTm80PTvnBVE9JP2bDbpw/
X-Received: by 2002:a17:906:1cce:: with SMTP id i14mr18010966ejh.296.1571852145134;
        Wed, 23 Oct 2019 10:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571852145; cv=none;
        d=google.com; s=arc-20160816;
        b=ayx8EkqZ4bO15WvamLdfnQcTyAbaV/+uOfX3s89XX7iaAh1w9klbAHJujqjzWQWCjn
         CYLLxnt4OE1tuVkdOrKfhrPhaeH4b+BPc9EOZ9Gp6LcnPLAn8aKxwF6HFKvD78CepO5s
         lJsCw745nhudRsFEV7DjZj+uMKRTP1als1PDyV0I7oLp+UoC75LOQ2o1Qj2qG6zBxFhI
         iH9suRJ0UTYGQW3FTOhkxhdwobSW/hX43mnibepKWKFDwenpI5tkcg6CVKImU84ZkOin
         5j35UyKI9UUzAJDJk9NeQmm8Hkg/zIp+jJUpL6paVr6a2jMxZrB5Q32KzasdCoEAts6c
         tlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wtm4LxrMDZBOs2ez1v6MwwVuXC9yxHT7+ExdZdCwfdw=;
        b=bMJRLeVydKIoj2vpHuNdYp68bt24mLNtIxObu5djsCT9Zokzijr+IKTD3r0mCugvqo
         tQ5b0dylQawDlUp29r4L0ZKqeEd/VgjAaXTIcj06fXTHB+z51H1WdC1JPVYmxNfeLTD/
         tqy8Jqbrrls2Iy9tHauCKIH4ras0QGivC6cfEbeEFT+vpRcLNoHxM9fPTjqmmTQZ0Ekd
         h1BGa8jWVMpoP7jLD+QFvikN3QLTvoECB/IWrCHzz3FT08GGjXi8xHUnL0Slgaj6+l5P
         tNs9TtFc24T1dBHdH/nwLqN7ht3Er2BEV3EejYmT0wmRAM7pI/iJ704YZ2uFYrBIq+Vw
         dkvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IRmRlqEW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si17725448ede.424.2019.10.23.10.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 10:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IRmRlqEW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNKXv-0005lS-Ae
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 13:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVj-0003zn-6I
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVh-0001on-T9
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34573
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKVh-0001oa-PJ
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtm4LxrMDZBOs2ez1v6MwwVuXC9yxHT7+ExdZdCwfdw=;
 b=IRmRlqEWKXMd+gKC0tUu6wDB8hG+lHz2cK3ApwsRNmPDV75wKZHVcynVxVoqmndTxlK9Ys
 fqFvXHFVz+L6XpRXyPQqt7IzhW54jiv1bWzxnEAX32KTQJVCmr+WhbEMALkw8U+8/6UO5Y
 fsvcyVxd8Nh/9d8CpSvh4PvPQQ72WIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-8dv7T9meP4qxOPzGGPypMw-1; Wed, 23 Oct 2019 13:33:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A0485E9;
 Wed, 23 Oct 2019 17:33:19 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF3561F21;
 Wed, 23 Oct 2019 17:33:13 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/33] serial: register vmsd with DeviceClass
Date: Wed, 23 Oct 2019 19:31:28 +0200
Message-Id: <20191023173154.30051-8-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 8dv7T9meP4qxOPzGGPypMw-1
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6nEJBJw1IQpF

QOM-ify further.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index c839035fdd..4af8b0ce4c 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -990,8 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
     s->baudbase =3D baudbase;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     serial_realize_core(s, &error_fatal);
-
-    vmstate_register(NULL, base, &vmstate_serial, s);
+    qdev_set_legacy_instance_id(dev, base, 2);
     qdev_init_nofail(dev);
=20
     memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
@@ -1000,9 +999,17 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
     return s;
 }
=20
+static void serial_class_init(ObjectClass *klass, void* data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->vmsd =3D &vmstate_serial;
+}
+
 static const TypeInfo serial_info =3D {
     .name =3D TYPE_SERIAL,
     .parent =3D TYPE_DEVICE,
+    .class_init =3D serial_class_init,
     .instance_size =3D sizeof(SerialState),
 };
=20
@@ -1060,7 +1067,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
=20
     serial_realize_core(s, &error_fatal);
-    vmstate_register(NULL, base, &vmstate_serial, s);
+    qdev_set_legacy_instance_id(dev, base, 2);
     qdev_init_nofail(dev);
=20
     memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
--=20
2.23.0.606.g08da6496b6

