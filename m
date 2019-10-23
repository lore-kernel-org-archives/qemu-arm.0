Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1233576wrq;
        Wed, 23 Oct 2019 11:14:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJHTaN95Mkq9INzvDcI+1ZclpJzE66d8jwvFuXNegysMLmmaiJRaWpfDh0WW3D1aks7Vlp
X-Received: by 2002:a05:6402:7cc:: with SMTP id u12mr39195115edy.63.1571854471953;
        Wed, 23 Oct 2019 11:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571854471; cv=none;
        d=google.com; s=arc-20160816;
        b=qSi4AXLudLj4pUBP8UxuXA3jltO54WZgqiVguzSQbVc2ldebasH4SlN5SqwYgpwfK1
         8Chh/5EJAPhP2J7Nr1XFktpV2LqHChhBhzmm0ai6Qj1RPfvbp0QVT1vqSjAF8S0MK/YH
         NKkhH6J0O+b9mfecv9M8jPtGq6vemykpkwG/8/RvMD5n6qNj/stgA5qGUW/wDuFQOPrw
         InEh4X2T+b/gZycoKvSIEyLe9MpnGUQOjZXJ+xCJaWL1pC8hYr0imDCDg1HJAQ0n6QJ+
         oSfc+K1gpM6OrNuHKbEKhPqrA4ODEoLdDLRk7/ve8zlAHRvbClruyztO+lpxUO2DO16R
         I33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q0NcN9La6mtlCg8u7COd46bpf07XvGZW0dbEVjDzVPU=;
        b=Aq8A/xoa7sZNeUux3YBkjHwTzuXI8vAWUEjI7kcQVr+fAoEJzBqgEkDrNWfio77Xdt
         +fZfLe2kCyHUs9m2LSuOzS7b3wbfeJrUjwFQRFRE7u+7drZlHI/GhvRQb4Zgs8TrkuEu
         7pLMLCAjKpg/1jtP5S6NFTpCbI+fl4dDY17i32wxatyYyioYBE/+I0ry12YlHck2pPwd
         5Ds3/XEG9EsNu7VObY9UGzHL6CWvB8qy2c0cH5hEqpSmpT609bjOWwrTn1D7RCZqCcnj
         N5bhyEs+zahfeqddEaYorlN1Vy2UGUt9vFgsg8I0x4JEo1shlVFOmPG7NtaRXFSlcO3y
         kPjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OlVf7yCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si13629563ejs.401.2019.10.23.11.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 11:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OlVf7yCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNL9S-0003Bq-8X
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 14:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWh-0004yx-Vs
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWg-00028B-L7
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46724
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKWg-00027t-HM
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0NcN9La6mtlCg8u7COd46bpf07XvGZW0dbEVjDzVPU=;
 b=OlVf7yCgTBdO+hRWcA/CSNYvvBDTwPBmeK2UDcyUlMi4BpHdaP6icV8WZeQYZ1GLVkMiiM
 7IBnrzN6iz29cClBOjEAe8D/3UVjJGwl2bxjOGExc5054+Px8txFE1iZ0B0dGKYnUzhUxP
 g6WW5DXWQw5M7X0KhOO8F3fI1oAA+AA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-v-RhcreSM0qQs1Bx5neQGA-1; Wed, 23 Oct 2019 13:34:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F24695E9;
 Wed, 23 Oct 2019 17:34:17 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 063225DAAF;
 Wed, 23 Oct 2019 17:34:11 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/33] mips: inline serial_init
Date: Wed, 23 Oct 2019 19:31:39 +0200
Message-Id: <20191023173154.30051-19-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: v-RhcreSM0qQs1Bx5neQGA-1
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
X-TUID: thUrVGEMBdTO

The function is specific to mipssim, let's inline it.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c         | 16 ----------------
 hw/mips/mips_mipssim.c   | 13 ++++++++++---
 include/hw/char/serial.h |  2 --
 3 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 84de2740a7..ca95e09ec9 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -1023,22 +1023,6 @@ static const TypeInfo serial_io_info =3D {
     .class_init =3D serial_io_class_init,
 };
=20
-SerialIO *serial_init(int base, qemu_irq irq, int baudbase,
-                         Chardev *chr, MemoryRegion *system_io)
-{
-    SerialIO *self =3D SERIAL_IO(qdev_create(NULL, TYPE_SERIAL_IO));
-
-    qdev_prop_set_uint32(DEVICE(self), "baudbase", baudbase);
-    qdev_prop_set_chr(DEVICE(self), "chardev", chr);
-    qdev_prop_set_int32(DEVICE(self), "instance-id", base);
-    qdev_init_nofail(DEVICE(self));
-
-    sysbus_connect_irq(SYS_BUS_DEVICE(self), 0, irq);
-    memory_region_add_subregion(system_io, base, &self->serial.io);
-
-    return self;
-}
-
 static Property serial_properties[] =3D {
     DEFINE_PROP_CHR("chardev", SerialState, chr),
     DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 282bbecb24..26fb8fa4de 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -40,6 +40,7 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
@@ -219,9 +220,15 @@ mips_mipssim_init(MachineState *machine)
      * A single 16450 sits at offset 0x3f8. It is attached to
      * MIPS CPU INT2, which is interrupt 4.
      */
-    if (serial_hd(0))
-        serial_init(0x3f8, env->irq[4], 115200, serial_hd(0),
-                    get_system_io());
+    if (serial_hd(0)) {
+        DeviceState *dev =3D qdev_create(NULL, TYPE_SERIAL_IO);
+
+        qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+        qdev_prop_set_int32(dev, "instance-id", 0x3f8);
+        qdev_init_nofail(dev);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, env->irq[4]);
+        sysbus_add_io(SYS_BUS_DEVICE(dev), 0x3f8, &SERIAL_IO(dev)->serial.=
io);
+    }
=20
     if (nd_table[0].used)
         /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index cf9cdafaee..40e35e6fff 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -109,8 +109,6 @@ void serial_set_frequency(SerialState *s, uint32_t freq=
uency);
 #define TYPE_SERIAL_IO "serial-io"
 #define SERIAL_IO(s) OBJECT_CHECK(SerialIO, (s), TYPE_SERIAL_IO)
=20
-SerialIO *serial_init(int base, qemu_irq irq, int baudbase,
-                      Chardev *chr, MemoryRegion *system_io);
 SerialMM *serial_mm_init(MemoryRegion *address_space,
                          hwaddr base, int regshift,
                          qemu_irq irq, int baudbase,
--=20
2.23.0.606.g08da6496b6

