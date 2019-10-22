Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp141472wrq;
        Tue, 22 Oct 2019 09:33:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5SYHvGyEngm4m0/sEASnnqzw8eUxSDqKEqIkJ/QFJ8WEg/WyhDu/jXJyO93LjXJQUmnFI
X-Received: by 2002:ad4:40cc:: with SMTP id x12mr4113441qvp.1.1571762033841;
        Tue, 22 Oct 2019 09:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571762033; cv=none;
        d=google.com; s=arc-20160816;
        b=sUrNazIUKWrcxgtXqiTHQmaKwyJnXUbmmy4MidvgJWVJmHMJrkSz8c0T0HWg/kKw0N
         xnuwDjkFWLvrcoHLrCCRqLSfB3x3a3Ktmm2agUdGZfQKxggu/Um8LiWsakSWQOtE2B85
         sy8rjzwTG0WuMh6vSQ23G9RUmEm6y+MKT4d1TqujBJvr9mG0O0OML/a4OpFegooHrdVk
         SwGEZVg2Jo9ECVMagYhX1qY3B0kT+OphdPT58+QzZE4C3W4oWD04rY5p62HujNNHH8aa
         n3YoGHtWlJPcvnnyuXhENw/Y/EsjefibbHNM6Zwj/mreywNfYOsI91+K42JxOZh7buiU
         VIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YKn0rkeEmo85GVGGJBaBivsp9eHGS4vNvWaaLOlUKWM=;
        b=eydK3ShBmv/mojRiAg+punA/MFESqAyFCn7jP2DAfzBlIfbmwWblQiLNSPcj4coq21
         CGTIQxVR1lc7/OFDAX7Y0zyZLEbeM/gFZUReyZt/fTjgCfWTSE1Wqi3TNSlOP5Ma/xTa
         VDrEiHckEATS1NoTrAjYfkNossQ6LxsFPz8+Rbl8lmcvJ5K2ipVqnr5ATjxK/5W/Xl/L
         RjTtBhGHo4QYD4VXNeFbrx8hbtYvhPCEERoOd2GjVo1pE6RjWDE2rwP3HD/Q/L2pTJ4g
         yBqP2ZLQS/qsrvqwU6r8oxSf1dlfW6vAZD58ye5/yBq/RdclIrL9guuL6mOErmgBuUJ0
         oDPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A1eoHMic;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22si5520669qtl.322.2019.10.22.09.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A1eoHMic;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMx6W-000253-O8
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwS-0007W4-3l
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwQ-0007UJ-W8
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49261
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMwwQ-0007Tz-SV
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKn0rkeEmo85GVGGJBaBivsp9eHGS4vNvWaaLOlUKWM=;
 b=A1eoHMicHgFnYnKuHVimUIHJ/mE9US5FZwlQkZjq44Zk8Y6Pcl44dYlgs732wMd/BPiJrg
 OrcimuVQGws3v7dFJF0gtL39wAfpgdFft05YM3CgnV7ZvUsv21lS2nJA5Sr17nPtyEe4hx
 OP3Z+Xm7155tpJkmHYIZyGOKtJnm9ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-sXBTBNP1PviJqGVqsHcRzg-1; Tue, 22 Oct 2019 12:23:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EDAB476;
 Tue, 22 Oct 2019 16:23:17 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DBC610027A1;
 Tue, 22 Oct 2019 16:23:13 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/28] serial: replace serial_exit_core() with unrealize
Date: Tue, 22 Oct 2019 18:21:21 +0200
Message-Id: <20191022162137.27161-13-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: sXBTBNP1PviJqGVqsHcRzg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: xzRzysGPeBjS

Instead of calling serial_exit_core() directly, use the QDev unrealize
callback.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial-pci-multi.c | 2 +-
 hw/char/serial-pci.c       | 2 +-
 hw/char/serial.c           | 5 ++++-
 include/hw/char/serial.h   | 1 -
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 60c1c948b8..a3200555aa 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -56,7 +56,7 @@ static void multi_serial_pci_exit(PCIDevice *dev)
=20
     for (i =3D 0; i < pci->ports; i++) {
         s =3D pci->state + i;
-        serial_exit_core(s);
+        object_property_set_bool(OBJECT(s), false, "realized", NULL);
         memory_region_del_subregion(&pci->iobar, &s->io);
         g_free(pci->name[i]);
     }
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 35a8552674..54bdd98325 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -69,7 +69,7 @@ static void serial_pci_exit(PCIDevice *dev)
     PCISerialState *pci =3D DO_UPCAST(PCISerialState, dev, dev);
     SerialState *s =3D &pci->state;
=20
-    serial_exit_core(s);
+    object_property_set_bool(OBJECT(s), false, "realized", NULL);
     qemu_free_irq(s->irq);
 }
=20
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 1500216c69..72d48b5cd8 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -952,8 +952,10 @@ static void serial_realize(DeviceState *dev, Error **e=
rrp)
     qdev_set_legacy_instance_id(dev, s->base, 2);
 }
=20
-void serial_exit_core(SerialState *s)
+static void serial_unrealize(DeviceState *dev, Error **errp)
 {
+    SerialState *s =3D SERIAL(dev);
+
     qemu_chr_fe_deinit(&s->chr, false);
=20
     timer_del(s->modem_status_poll);
@@ -1015,6 +1017,7 @@ static void serial_class_init(ObjectClass *klass, voi=
d* data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D serial_realize;
+    dc->unrealize =3D serial_unrealize;
     dc->user_creatable =3D false;
     dc->vmsd =3D &vmstate_serial;
     dc->props =3D serial_properties;
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 28bce0a791..5e657d8ade 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -89,7 +89,6 @@ typedef struct SerialMMState {
 extern const VMStateDescription vmstate_serial;
 extern const MemoryRegionOps serial_io_ops;
=20
-void serial_exit_core(SerialState *s);
 void serial_set_frequency(SerialState *s, uint32_t frequency);
=20
 #define TYPE_SERIAL "serial"
--=20
2.23.0.606.g08da6496b6

