Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp684233wrp;
        Wed, 4 Sep 2019 06:05:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9D3ws3X0M8BdhYacL6QNiAQfwc+en281qNillBzr3HpHYaWoX+UkJUuDs6ipFcpZVIeVO
X-Received: by 2002:ae9:dc87:: with SMTP id q129mr1501628qkf.92.1567602315803;
        Wed, 04 Sep 2019 06:05:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o90si14339195qte.101.2019.09.04.06.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 06:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vJoaRRoD;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5UyI-0004uX-Ef
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 09:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5Upa-0006To-JR
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 08:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5UpZ-0005Yb-6F
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 08:56:14 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:45960)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1i5UpY-0005Xu-UU; Wed, 04 Sep 2019 08:56:13 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 821B796F6A;
 Wed,  4 Sep 2019 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1567601772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdlTh3yyxOVxrasubJkegjXhqH/FOw0TXWBho063ltM=;
 b=vJoaRRoDYYVe144qOD97w4IdS4osxlKnocOOrdJB4UdUAouUXbwqrUsUBNdI44Gx9IIE9A
 IhsUTkN3MzUmpfSGRg0E5dNNnPuEhQc3ELkxk0FBJ4TMGmi6QMrVkbqpIcXqfvNDZojuRq
 7430xJihcj8+EnSGpRDh1ovhwZ8HMp0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 14:55:27 +0200
Message-Id: <20190904125531.27545-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904125531.27545-1-damien.hedde@greensocs.com>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1567601772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdlTh3yyxOVxrasubJkegjXhqH/FOw0TXWBho063ltM=;
 b=VZJJy4yaIh2A8LgJAd6huc7lrize3zQK99mcq78v2X7QGGE2x/VApmz3cR9HErMerx8rwW
 T6XHBn4Wj4SZh/OZKqGsQtH/eoBS0A1BvbX9sXaSc05IqbsNWUfQA6kL8JNSd57+h13cLX
 sljYKzfdtTfONwjkDSateqqeRvCqYTE=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1567601772; a=rsa-sha256; cv=none;
 b=nhS4/aSgHYx3589Dq0LCSflM3b6sQ6n94EeWiis8y7wGQn/pxtZ2S8hER/YH9amjG0Ittz
 XSYiEnNEJPSUo1WD70VCbJ37NHtG8yXCH6m8xvKgjxf9b+m2+zyimkqei+N+Z3jEcRacIV
 SueBAELtxFVwqysbdlKBPXFiKWYcqnI=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v6 5/9] qdev-clock: introduce an init array to
 ease the device construction
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zw+Ea9heq3O9

Introduce a function and macro helpers to setup several clocks
in a device from a static array description.

An element of the array describes the clock (name and direction) as
well as the related callback and an optional offset to store the
created object pointer in the device state structure.

The array must be terminated by a special element QDEV_CLOCK_END.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/qdev-clock.c    | 26 ++++++++++++++++
 include/hw/qdev-clock.h | 67 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index bebdd8fa15..32ad45c061 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -153,3 +153,29 @@ void qdev_connect_clock_out(DeviceState *dev, const =
char *name, ClockIn *clk,
=20
     clock_connect(clk, clkout);
 }
+
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)
+{
+    const struct ClockPortInitElem *elem;
+
+    assert(dev);
+    assert(clocks);
+
+    for (elem =3D &clocks[0]; elem->name !=3D NULL; elem++) {
+        /* offset cannot be inside the DeviceState part */
+        assert(elem->offset =3D=3D 0 || elem->offset > sizeof(DeviceStat=
e));
+        if (elem->is_output) {
+            ClockOut *clk;
+            clk =3D qdev_init_clock_out(dev, elem->name);
+            if (elem->offset) {
+                *(ClockOut **)(((void *) dev) + elem->offset) =3D clk;
+            }
+        } else {
+            ClockIn *clk;
+            clk =3D qdev_init_clock_in(dev, elem->name, elem->callback, =
dev);
+            if (elem->offset) {
+                *(ClockIn **)(((void *) dev) + elem->offset) =3D clk;
+            }
+        }
+    }
+}
diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
index c4ea912fdc..b6edb9421b 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -64,4 +64,71 @@ void qdev_connect_clock_out(DeviceState *dev, const ch=
ar *name, ClockIn *clk,
 void qdev_pass_clock(DeviceState *dev, const char *name,
                      DeviceState *container, const char *cont_name);
=20
+/**
+ * ClockInitElem:
+ * @name: name of the clock (can't be NULL)
+ * @is_output: indicates whether the clock is input or output
+ * @callback: for inputs, optional callback to be called on clock's upda=
te
+ * with device as opaque
+ * @offset: optional offset to store the ClockIn or ClockOut pointer in =
device
+ * state structure (0 means unused)
+ */
+struct ClockPortInitElem {
+    const char *name;
+    bool is_output;
+    ClockCallback *callback;
+    size_t offset;
+};
+
+#define clock_offset_value(_type, _devstate, _field) \
+    (offsetof(_devstate, _field) + \
+     type_check(_type *, typeof_field(_devstate, _field)))
+
+#define QDEV_CLOCK(_is_output, _type, _devstate, _field, _callback) { \
+    .name =3D (stringify(_field)), \
+    .is_output =3D _is_output, \
+    .callback =3D _callback, \
+    .offset =3D clock_offset_value(_type, _devstate, _field), \
+}
+
+/**
+ * QDEV_CLOCK_(IN|OUT):
+ * @_devstate: structure type. @dev argument of qdev_init_clocks below m=
ust be
+ * a pointer to that same type.
+ * @_field: a field in @_devstate (must be ClockIn* or ClockOut*)
+ * @_callback: (for input only) callback (or NULL) to be called with the=
 device
+ * state as argument
+ *
+ * The name of the clock will be derived from @_field
+ */
+#define QDEV_CLOCK_IN(_devstate, _field, _callback) \
+    QDEV_CLOCK(false, ClockIn, _devstate, _field, _callback)
+
+#define QDEV_CLOCK_OUT(_devstate, _field) \
+    QDEV_CLOCK(true, ClockOut, _devstate, _field, NULL)
+
+/**
+ * QDEV_CLOCK_IN_NOFIELD:
+ * @_name: name of the clock
+ * @_callback: callback (or NULL) to be called with the device state as =
argument
+ */
+#define QDEV_CLOCK_IN_NOFIELD(_name, _callback) { \
+    .name =3D _name, \
+    .is_output =3D false, \
+    .callback =3D _callback, \
+    .offset =3D 0, \
+}
+
+#define QDEV_CLOCK_END { .name =3D NULL }
+
+typedef struct ClockPortInitElem ClockPortInitArray[];
+
+/**
+ * qdev_init_clocks:
+ * @dev: the device to add clocks
+ * @clocks: a QDEV_CLOCK_END-terminated array which contains the
+ * clocks information.
+ */
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)=
;
+
 #endif /* QDEV_CLOCK_H */
--=20
2.22.0

