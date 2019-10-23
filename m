Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1220833wrq;
        Wed, 23 Oct 2019 11:03:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/PHut3p9NMS4w1Odm9cktPl6cLPwO/mauSUOWIi7PY+B584w7BjZk3HIvQUaKol2EFXxv
X-Received: by 2002:a17:906:f249:: with SMTP id gy9mr13034534ejb.216.1571853823837;
        Wed, 23 Oct 2019 11:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571853823; cv=none;
        d=google.com; s=arc-20160816;
        b=mIUmC7YnLs6TrryYxA5cWrHeRf0Q0JXynBWn0dn5Y/dq8OvWFyGtVvRh9l9u9Injjs
         QWtD45czr5V0FlqVoxH9qJuNhO0JrJa6F7Mq6KXtkrablx1GMrUWYbeE1LjvlxqjhZ3j
         2gTrd4b9gqMQXRgzkL/EYIz3Wpje9b43KR6joxk6pIe1nnNXYf1gV1IcJFr+fMoKgnE3
         OacJKxpdFZWdLHNZt1WxvXs9EnobJ3YPJ+KooT9+/S0a9LrH3dQxj6dj/9ROj/8KpJ7O
         WKJcNaGPb8aI+6PuRBmthcjhFCEQT6kTtaIoV/qNDicrW5OOHr7d07C//RQCGjJUu5FM
         Fwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3n8NemwbAtO2vjJo0cvTmj3rjEQJOf2iog0bPQvhlk8=;
        b=Et6E5ECjybe369UVVX8vNBfcIpms4+q9yqxWVq93hYnrAdx3x9LapjVlcFCW1LqRpU
         uur2Vpwl4hDU049uf8O+4BkK40sypPToGJBSW4oA7Zv3CX2oURaZ2wcbRoRVJvDkrMdt
         tQSfw8E8BLgVAFxgopYtYRPGYYTWImvufawaurToerl1r9ZIrhPrJZB+HSLJ+bSuAOks
         mYiVLcX5yufpepe4qF3oPa346Mz4VYbiRcEEeEYKfiHeD3QDpPeSg4Nd9nnJryq9zXUx
         gWUlVk8c85Ygf1qqlQY2ozoKe5Bng9Duiun2AhpTzKWGhcsoFThfsiL6+U58XeQA9u1g
         BqiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QOj0Ehzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si13505913eju.329.2019.10.23.11.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 11:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QOj0Ehzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNKyy-0002HH-Pd
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 14:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWZ-0004lC-L9
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWX-00026X-UC
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50862
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKWX-000268-Nq
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3n8NemwbAtO2vjJo0cvTmj3rjEQJOf2iog0bPQvhlk8=;
 b=QOj0EhzzKUY1momYp6YDRy9tQx06Zko3laN+T4h1zj4iikfJCqBvGw4zcGRqyCA03MnrOl
 HU/ujWfWXapBMmgDV4Gk3f/HwOjNDdCcYzvIDbyRi5AKNeT2HoNJn98iS/OD79poyBNbMN
 AZPffiVUxQD+BwOuGtPyvUi+IUJsIds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-u0nE5TA2Ps2mdxSKYUAz6Q-1; Wed, 23 Oct 2019 13:34:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B111005512;
 Wed, 23 Oct 2019 17:34:10 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74C4B19C78;
 Wed, 23 Oct 2019 17:34:05 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/33] serial: make SerialIO a sysbus device
Date: Wed, 23 Oct 2019 19:31:38 +0200
Message-Id: <20191023173154.30051-18-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: u0nE5TA2Ps2mdxSKYUAz6Q-1
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
X-TUID: G+G0qje5XWoc

Make serial IO a proper sysbus device, similar to serial MM.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c         | 58 ++++++++++++++++++++++++++++++++--------
 include/hw/char/serial.h | 13 +++++++--
 2 files changed, 58 insertions(+), 13 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index a40bc3ab81..84de2740a7 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -986,22 +986,57 @@ const MemoryRegionOps serial_io_ops =3D {
     .endianness =3D DEVICE_LITTLE_ENDIAN,
 };
=20
-SerialState *serial_init(int base, qemu_irq irq, int baudbase,
-                         Chardev *chr, MemoryRegion *system_io)
+static void serial_io_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
-    SerialState *s =3D SERIAL(dev);
+    SerialIO *self =3D SERIAL_IO(dev);
+    SerialState *s =3D &self->serial;
=20
-    s->irq =3D irq;
-    qdev_prop_set_uint32(dev, "baudbase", baudbase);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    qdev_prop_set_int32(dev, "instance-id", base);
-    qdev_init_nofail(dev);
+    qdev_init_nofail(DEVICE(s));
=20
     memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
-    memory_region_add_subregion(system_io, base, &s->io);
+    sysbus_init_irq(SYS_BUS_DEVICE(self), &self->serial.irq);
+}
+
+static void serial_io_class_init(ObjectClass *klass, void* data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D serial_io_realize;
+}
+
+static void serial_io_instance_init(Object *o)
+{
+    SerialIO *self =3D SERIAL_IO(o);
+
+    object_initialize_child(o, "serial", &self->serial, sizeof(self->seria=
l),
+                            TYPE_SERIAL, &error_abort, NULL);
+
+    qdev_alias_all_properties(DEVICE(&self->serial), o);
+}
+
+
+static const TypeInfo serial_io_info =3D {
+    .name =3D TYPE_SERIAL_IO,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(SerialIO),
+    .instance_init =3D serial_io_instance_init,
+    .class_init =3D serial_io_class_init,
+};
+
+SerialIO *serial_init(int base, qemu_irq irq, int baudbase,
+                         Chardev *chr, MemoryRegion *system_io)
+{
+    SerialIO *self =3D SERIAL_IO(qdev_create(NULL, TYPE_SERIAL_IO));
=20
-    return s;
+    qdev_prop_set_uint32(DEVICE(self), "baudbase", baudbase);
+    qdev_prop_set_chr(DEVICE(self), "chardev", chr);
+    qdev_prop_set_int32(DEVICE(self), "instance-id", base);
+    qdev_init_nofail(DEVICE(self));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(self), 0, irq);
+    memory_region_add_subregion(system_io, base, &self->serial.io);
+
+    return self;
 }
=20
 static Property serial_properties[] =3D {
@@ -1138,6 +1173,7 @@ static const TypeInfo serial_mm_info =3D {
 static void serial_register_types(void)
 {
     type_register_static(&serial_info);
+    type_register_static(&serial_io_info);
     type_register_static(&serial_mm_info);
 }
=20
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 2d0802a909..cf9cdafaee 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -89,6 +89,12 @@ typedef struct SerialMM {
     uint8_t endianness;
 } SerialMM;
=20
+typedef struct SerialIO {
+    SysBusDevice parent;
+
+    SerialState serial;
+} SerialIO;
+
 extern const VMStateDescription vmstate_serial;
 extern const MemoryRegionOps serial_io_ops;
=20
@@ -100,8 +106,11 @@ void serial_set_frequency(SerialState *s, uint32_t fre=
quency);
 #define TYPE_SERIAL_MM "serial-mm"
 #define SERIAL_MM(s) OBJECT_CHECK(SerialMM, (s), TYPE_SERIAL_MM)
=20
-SerialState *serial_init(int base, qemu_irq irq, int baudbase,
-                         Chardev *chr, MemoryRegion *system_io);
+#define TYPE_SERIAL_IO "serial-io"
+#define SERIAL_IO(s) OBJECT_CHECK(SerialIO, (s), TYPE_SERIAL_IO)
+
+SerialIO *serial_init(int base, qemu_irq irq, int baudbase,
+                      Chardev *chr, MemoryRegion *system_io);
 SerialMM *serial_mm_init(MemoryRegion *address_space,
                          hwaddr base, int regshift,
                          qemu_irq irq, int baudbase,
--=20
2.23.0.606.g08da6496b6

