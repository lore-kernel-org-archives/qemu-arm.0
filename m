Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1192844wrq;
        Wed, 23 Oct 2019 10:37:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyud1K/nWRWoz44uOLaKBrxvi6+jVmbYRW3KxoW/n+kWKPdxWfrfKzyqN3Q4fOKG5AqkQkF
X-Received: by 2002:a37:6f06:: with SMTP id k6mr9692301qkc.143.1571852271159;
        Wed, 23 Oct 2019 10:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571852271; cv=none;
        d=google.com; s=arc-20160816;
        b=KAMsHRZg5ADWKURUtJSyF0qlywXDaaAO+wbjBhto0ZYaw+zCtYYXHw0eS0ndAVgYGO
         f+U7B+mWAt4qa3vRFWtnjFJgxZPTCFS4DEGpab+WA7eOYXQIwyNQLgGifKgunlsYb43Z
         80ErvhDqO8NkuXJkBfGFbaEHzWJIGPTF4UcvS8bqncj6tp+m9sb5UsQ2uuRf5IPZ4w60
         vNfLE4CdbiWC9haFRAxGYrmrm+/Vl3AozdXagfVP8A9fbnIjKo8C5ZZQHJ/HAOpxhWYV
         Vo4sge8ceKYLcQIlLrZjlCdBnTjClBiGqemPoefvAg1RQrNij8NPhz21nYP03fVMXPqa
         ZM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2oDJTKTVpXmUw77cMFMqxZOKq71XIv/EmoH7MpcQh6g=;
        b=aPxEhCTJ2j+HzFvqx0NMBbLNUupPuTKLvQEFWTLlOZg78wnvDmbcY4U2mgvtC49U4F
         9MtkVaOmyKgRS9DC6sbRaq4jH7FeYJJ1xfFfsWy1cEp1wVWvE4sPKZmaiRE5emD1QAlV
         gNth64SRpR5Fg7DWpzHBSXtlKMqt99f2mdeywtdKSNC9cW/tMj9yHxBBVzYgecmNpqj3
         D4yPhScexXTHSx7m9GDxXkrz6yzNB3u9DJjmHNhzocwqSflT5IrQ7bDvnPj/IZkDsoPK
         Ilv0T+ZjVOcU8b/tarikOIq8OX5Kilg0iX0FxxMlhB64xPtpqNNASeEdzWUa3EawOQR/
         sB/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IpRd0Do5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si18339374qkl.229.2019.10.23.10.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 10:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IpRd0Do5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNKZx-0007l8-Ub
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 13:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVe-0003r4-HP
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVc-0001m6-Pv
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:22 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22223
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKVc-0001ic-K1
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571851997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oDJTKTVpXmUw77cMFMqxZOKq71XIv/EmoH7MpcQh6g=;
 b=IpRd0Do5mkjX/82J4zG9HsB9NR/YmOGJfViNauvNK5Uagcd7zsE4EuPgIXQfpwgIHWNMkG
 wUzKYPs+w8XIXEN56Bj+rzBlPZtKf5AszXr6Sk8sK3GFIjzh14WaNt2IEDwoURiAaPzAZQ
 sDnTVB676KQIgouCxWsucvWYV7dr1os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-lQyGb31cOsusZTi-OA-Pgw-1; Wed, 23 Oct 2019 13:33:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B05E800D5B;
 Wed, 23 Oct 2019 17:33:12 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED6FA5C219;
 Wed, 23 Oct 2019 17:33:05 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/33] serial: initial qom-ification
Date: Wed, 23 Oct 2019 19:31:27 +0200
Message-Id: <20191023173154.30051-7-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: lQyGb31cOsusZTi-OA-Pgw-1
X-Mimecast-Spam-Score: 0
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
X-TUID: X1CdZfCwY+km

Make SerialState a device (the following patches will introduce IO/MM
sysbus serial devices)

None of the serial_{,mm}_init() callers actually free the returned
value (even if they did, it would be quite harmless), so we can change
the object allocation at will.

However, the devices that embed SerialState must now have their field
QOM-initialized manually (isa, pci, pci-multi).

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial-isa.c       |  9 +++++++++
 hw/char/serial-pci-multi.c | 15 +++++++++++++++
 hw/char/serial-pci.c       | 13 ++++++++++++-
 hw/char/serial.c           | 25 +++++++++++++++++++------
 include/hw/char/serial.h   |  7 ++++++-
 5 files changed, 61 insertions(+), 8 deletions(-)

diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 9e31c51bb6..9a5928b3ee 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -111,10 +111,19 @@ static void serial_isa_class_initfn(ObjectClass *klas=
s, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
=20
+static void serial_isa_initfn(Object *o)
+{
+    ISASerialState *self =3D ISA_SERIAL(o);
+
+    object_initialize_child(o, "serial", &self->state, sizeof(self->state)=
,
+                            TYPE_SERIAL, &error_abort, NULL);
+}
+
 static const TypeInfo serial_isa_info =3D {
     .name          =3D TYPE_ISA_SERIAL,
     .parent        =3D TYPE_ISA_DEVICE,
     .instance_size =3D sizeof(ISASerialState),
+    .instance_init =3D serial_isa_initfn,
     .class_init    =3D serial_isa_class_initfn,
 };
=20
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 6fa1cc6225..3485bdad87 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -182,10 +182,24 @@ static void multi_4x_serial_pci_class_initfn(ObjectCl=
ass *klass, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
=20
+static void multi_serial_init(Object *o)
+{
+    PCIDevice *dev =3D PCI_DEVICE(o);
+    PCIMultiSerialState *self =3D DO_UPCAST(PCIMultiSerialState, dev, dev)=
;
+    int i, nr_ports =3D multi_serial_get_nr_ports(PCI_DEVICE_GET_CLASS(dev=
));
+
+    for (i =3D 0; i < nr_ports; i++) {
+        object_initialize_child(o, "serial[*]", &self->state[i],
+                                sizeof(self->state[i]),
+                                TYPE_SERIAL, &error_abort, NULL);
+    }
+}
+
 static const TypeInfo multi_2x_serial_pci_info =3D {
     .name          =3D "pci-serial-2x",
     .parent        =3D TYPE_PCI_DEVICE,
     .instance_size =3D sizeof(PCIMultiSerialState),
+    .instance_init =3D multi_serial_init,
     .class_init    =3D multi_2x_serial_pci_class_initfn,
     .interfaces =3D (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -197,6 +211,7 @@ static const TypeInfo multi_4x_serial_pci_info =3D {
     .name          =3D "pci-serial-4x",
     .parent        =3D TYPE_PCI_DEVICE,
     .instance_size =3D sizeof(PCIMultiSerialState),
+    .instance_init =3D multi_serial_init,
     .class_init    =3D multi_4x_serial_pci_class_initfn,
     .interfaces =3D (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index cb9b76e22b..a33264a1fb 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -40,6 +40,8 @@ typedef struct PCISerialState {
     uint8_t prog_if;
 } PCISerialState;
=20
+#define TYPE_PCI_SERIAL "pci-serial"
+#define PCI_SERIAL(s) OBJECT_CHECK(PCISerialState, (s), TYPE_PCI_SERIAL)
=20
 static void serial_pci_realize(PCIDevice *dev, Error **errp)
 {
@@ -103,10 +105,19 @@ static void serial_pci_class_initfn(ObjectClass *klas=
s, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
=20
+static void serial_pci_init(Object *o)
+{
+    PCISerialState *self =3D PCI_SERIAL(o);
+
+    object_initialize_child(o, "serial", &self->state, sizeof(self->state)=
,
+                            TYPE_SERIAL, &error_abort, NULL);
+}
+
 static const TypeInfo serial_pci_info =3D {
-    .name          =3D "pci-serial",
+    .name          =3D TYPE_PCI_SERIAL,
     .parent        =3D TYPE_PCI_DEVICE,
     .instance_size =3D sizeof(PCISerialState),
+    .instance_init =3D serial_pci_init,
     .class_init    =3D serial_pci_class_initfn,
     .interfaces =3D (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/char/serial.c b/hw/char/serial.c
index b4aa250950..c839035fdd 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -983,9 +983,8 @@ const MemoryRegionOps serial_io_ops =3D {
 SerialState *serial_init(int base, qemu_irq irq, int baudbase,
                          Chardev *chr, MemoryRegion *system_io)
 {
-    SerialState *s;
-
-    s =3D g_malloc0(sizeof(SerialState));
+    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
+    SerialState *s =3D SERIAL(dev);
=20
     s->irq =3D irq;
     s->baudbase =3D baudbase;
@@ -993,6 +992,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
     serial_realize_core(s, &error_fatal);
=20
     vmstate_register(NULL, base, &vmstate_serial, s);
+    qdev_init_nofail(dev);
=20
     memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
     memory_region_add_subregion(system_io, base, &s->io);
@@ -1000,6 +1000,12 @@ SerialState *serial_init(int base, qemu_irq irq, int=
 baudbase,
     return s;
 }
=20
+static const TypeInfo serial_info =3D {
+    .name =3D TYPE_SERIAL,
+    .parent =3D TYPE_DEVICE,
+    .instance_size =3D sizeof(SerialState),
+};
+
 /* Memory mapped interface */
 static uint64_t serial_mm_read(void *opaque, hwaddr addr,
                                unsigned size)
@@ -1045,9 +1051,8 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
                             qemu_irq irq, int baudbase,
                             Chardev *chr, enum device_endian end)
 {
-    SerialState *s;
-
-    s =3D g_malloc0(sizeof(SerialState));
+    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
+    SerialState *s =3D SERIAL(dev);
=20
     s->it_shift =3D it_shift;
     s->irq =3D irq;
@@ -1056,9 +1061,17 @@ SerialState *serial_mm_init(MemoryRegion *address_sp=
ace,
=20
     serial_realize_core(s, &error_fatal);
     vmstate_register(NULL, base, &vmstate_serial, s);
+    qdev_init_nofail(dev);
=20
     memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
                           "serial", 8 << it_shift);
     memory_region_add_subregion(address_space, base, &s->io);
     return s;
 }
+
+static void serial_register_types(void)
+{
+    type_register_static(&serial_info);
+}
+
+type_init(serial_register_types)
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 8be3d8a4f9..180cc7c24e 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -30,10 +30,13 @@
 #include "exec/memory.h"
 #include "qemu/fifo8.h"
 #include "chardev/char.h"
+#include "hw/sysbus.h"
=20
 #define UART_FIFO_LENGTH    16      /* 16550A Fifo Length */
=20
 typedef struct SerialState {
+    DeviceState parent;
+
     uint16_t divider;
     uint8_t rbr; /* receive register */
     uint8_t thr; /* transmit holding register */
@@ -84,7 +87,9 @@ void serial_realize_core(SerialState *s, Error **errp);
 void serial_exit_core(SerialState *s);
 void serial_set_frequency(SerialState *s, uint32_t frequency);
=20
-/* legacy pre qom */
+#define TYPE_SERIAL "serial"
+#define SERIAL(s) OBJECT_CHECK(SerialState, (s), TYPE_SERIAL)
+
 SerialState *serial_init(int base, qemu_irq irq, int baudbase,
                          Chardev *chr, MemoryRegion *system_io);
 SerialState *serial_mm_init(MemoryRegion *address_space,
--=20
2.23.0.606.g08da6496b6

