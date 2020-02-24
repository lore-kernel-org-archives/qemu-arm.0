Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp798391lfg;
        Mon, 24 Feb 2020 13:27:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqy845o7EVww1d14jsYNhaobSU2cHgJ8RKoiHuDwOtekEGvaqD8oyvD4DBCn4FnzONfFDeDN
X-Received: by 2002:a37:752:: with SMTP id 79mr7160460qkh.161.1582579670799;
        Mon, 24 Feb 2020 13:27:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579670; cv=none;
        d=google.com; s=arc-20160816;
        b=dh/7xmePGMWzz6M9oxULDPbwfennEYATGVwwNfjlcuXCRQhi+BQ7Pj+8F4JdtCZnOG
         auLytJ4eL2CDulOZ40RQhojkEhTVZNTeCoDzVRkaxuihlJWNqTUs/8y2eHnO23TYGR9V
         10zofnBMeVrNNlYjyfR2RKK6ABUqbBGyS2QPN+mSc02mvd0DjV6egJnfthZy5GiLl9qz
         JKrTNHzA/td3kbdpfVdBcZFiBQjsMZ3Jwj8x7CXbG8ss05XdktqPVVdv9wzxRxaw6Ve8
         p7J2tX1NNzD70RDf49qYdW+W0NtMYsHEoZVvE9VvktmxZVHMdjz6xsWKdM0PSaQbZ+4v
         fwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7saW0lUMlIpBkC9nkeABH78vi2gIhiCg17Oi76zLWlE=;
        b=XHG5hd7zAtzWbd9iiapgchd0oaLzIDdZjTECbF/2YK6R7GxvSWWlD0t1y6JK/tJj29
         Pq9TKVfG7IXeT2XSN9/wBnExHKkPUksOkA1ndxhtM5ey8l3OI/38/tYftvTIQkN1eEgz
         BYXtBz3rdW1zgrKbQuUG/biWhj4QuFFXW7jl/DmKthgsV9yJztTQYQeHV4AQr8MRjbdc
         O3qcUIfQK1vxQlAN+FRcnjnkGoJLg8XAVQ6+P/0zZtRs9ppFlwzCqu83XRyk3oBHnjSy
         3WQJSn4cCXi9osoBuKWyirQKNqDv5/vRO/yc3HhbP4WFQlaHsAJoe8B/XJrsV8FxLr82
         iGdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZZqxv46V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si286048qkc.291.2020.02.24.13.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:27:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZZqxv46V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43905 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LGY-00028r-5N
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kr7-0006jl-LX
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:01:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kr6-0007GW-HF
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:01:33 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33971
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kr6-0007GB-Cc
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7saW0lUMlIpBkC9nkeABH78vi2gIhiCg17Oi76zLWlE=;
 b=ZZqxv46VMKdcpEyXTx0t4+ifjeyWSgqo37NUapuPVJbeeY/85YUUQ0kM80im+oDkEPDX/p
 cSDOuLZrAGXVsevO2xrO25LSJX+9FFPL4Qs7pGwDgsff2YaHIEaAwy06fBFbGxZQZ/jyTG
 BO2VgHCsahuuN4QI1B5PqwkTXsp91eQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-M1AD5Pb4OvK-RNGG5JgPPg-1; Mon, 24 Feb 2020 16:01:30 -0500
X-MC-Unique: M1AD5Pb4OvK-RNGG5JgPPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E06CADBA5;
 Mon, 24 Feb 2020 21:01:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5E225C651;
 Mon, 24 Feb 2020 21:01:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 24/32] hw/char: Let devices own the MemoryRegion
 they create
Date: Mon, 24 Feb 2020 21:55:25 +0100
Message-Id: <20200224205533.23798-25-philmd@redhat.com>
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
X-TUID: 8GQ037hbeXr4

Avoid orphan memory regions being added in the /unattached QOM
container.

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/char/serial.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 9298881af9..2ab8b69e03 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -997,7 +997,7 @@ static void serial_io_realize(DeviceState *dev, Error *=
*errp)
         return;
     }
=20
-    memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
+    memory_region_init_io(&s->io, OBJECT(dev), &serial_io_ops, s, "serial"=
, 8);
     sysbus_init_mmio(SYS_BUS_DEVICE(sio), &s->io);
     sysbus_init_irq(SYS_BUS_DEVICE(sio), &s->irq);
 }
@@ -1106,8 +1106,9 @@ static void serial_mm_realize(DeviceState *dev, Error=
 **errp)
         return;
     }
=20
-    memory_region_init_io(&s->io, NULL, &serial_mm_ops[smm->endianness], s=
mm,
-                          "serial", 8 << smm->regshift);
+    memory_region_init_io(&s->io, OBJECT(dev),
+                          &serial_mm_ops[smm->endianness], smm, "serial",
+                          8 << smm->regshift);
     sysbus_init_mmio(SYS_BUS_DEVICE(smm), &s->io);
     sysbus_init_irq(SYS_BUS_DEVICE(smm), &smm->serial.irq);
 }
--=20
2.21.1

