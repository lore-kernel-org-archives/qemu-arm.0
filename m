Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1714248lfg;
        Tue, 25 Feb 2020 05:55:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqzb5z9FM6h7ZgWZwmN+cD+6qaJ5HsKbKJyOrEBAcjwZA8IG5u3UtPhxm+KvkEsvcs6HBegW
X-Received: by 2002:a37:4550:: with SMTP id s77mr19139584qka.336.1582638938187;
        Tue, 25 Feb 2020 05:55:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si1526553qto.118.2020.02.25.05.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 05:55:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2VVIrUeO;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6agT-00008O-GW
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 08:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2m-0007s7-K9
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 08:14:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2j-00023t-26
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 08:14:34 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:57210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1j6a2g-00021r-Re; Tue, 25 Feb 2020 08:14:31 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id B1AF596F52;
 Tue, 25 Feb 2020 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582636468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqSRTY6rjrAFDgu21fuqsHvriNk00Q2D0c+ln5Zh6Po=;
 b=2VVIrUeO8nyx3gWEQmtCZNQeYw+iEcpHfWqnna9YXXKs9UWAAx2+PLtRx6ycSAVsjSpfa0
 51TjtE3QCoicyJMJ3dsaYsRO7pBzokEDlgwZyhMWcFVkDeEHVaikWO0TXXRpi4n6dv5s0z
 IMNYnUZ2nc+5CH/+mWOXT41k5IjkIyQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/9] qdev-clock: introduce an init array to ease the device
 construction
Date: Tue, 25 Feb 2020 14:14:17 +0100
Message-Id: <20200225131422.53368-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200225131422.53368-1-damien.hedde@greensocs.com>
References: <20200225131422.53368-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582636468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqSRTY6rjrAFDgu21fuqsHvriNk00Q2D0c+ln5Zh6Po=;
 b=qmWK40eWN2Ho1/DWR6bLcChnwu9HFVzHpR83nb7Tf3FxBh9BHDxeMUimKOzEq9GtJit7X6
 eGFw0+3FBXyp4Z31z54eBl0jyyoSbw+vO9BpQpHV4125waayucoWLybadk54kLxkOPWQvP
 dDFNcPE8Vtcxhu13H/fgZwsW8jTlxvE=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582636468; a=rsa-sha256; cv=none;
 b=aev5dM6dYHHHTEFh1y2DMLUzr/8Z1Ts04Kx+VA4zeuF2fs/xgh+hCI4GUR9UDPT9kIblU4
 LXeXlah/ptyTOEZdTTVqxD/mDGdUXnxt/IRWosPNOfwoCQIgVBJ+MHwbadsfTnV5Eeh93/
 ajDhV25gf6ANJGwlaRRpjwuore8AfRc=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
 berrange@redhat.com, ehabkost@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me, mark.burton@greensocs.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LE+hK9eMpD6d

Introduce a function and macro helpers to setup several clocks
in a device from a static array description.

An element of the array describes the clock (name and direction) as
well as the related callback and an optional offset to store the
created object pointer in the device state structure.

The array must be terminated by a special element QDEV_CLOCK_END.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
--

v7:
 + update ClockIn/Out types
 + remove the QDEV_CLOCK_IN_NOFIELD macro
 + remove leading underscores in macro arguments (Peter)
 + updated some comments (Peter)
 + removed trivial asserts (Peter)
---
 include/hw/qdev-clock.h | 55 +++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev-clock.c    | 17 +++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
index b3b3a3e021..a340f65ff9 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -101,4 +101,59 @@ Clock *qdev_alias_clock(DeviceState *dev, const char=
 *name,
  */
 void qdev_finalize_clocklist(DeviceState *dev);
=20
+/**
+ * ClockPortInitElem:
+ * @name: name of the clock (can't be NULL)
+ * @output: indicates whether the clock is input or output
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
+#define clock_offset_value(devstate, field) \
+    (offsetof(devstate, field) + \
+     type_check(Clock *, typeof_field(devstate, field)))
+
+#define QDEV_CLOCK(out_not_in, devstate, field, cb) { \
+    .name =3D (stringify(field)), \
+    .is_output =3D out_not_in, \
+    .callback =3D cb, \
+    .offset =3D clock_offset_value(devstate, field), \
+}
+
+/**
+ * QDEV_CLOCK_(IN|OUT):
+ * @devstate: structure type. @dev argument of qdev_init_clocks below mu=
st be
+ * a pointer to that same type.
+ * @field: a field in @_devstate (must be Clock*)
+ * @callback: (for input only) callback (or NULL) to be called with the =
device
+ * state as argument
+ *
+ * The name of the clock will be derived from @field
+ */
+#define QDEV_CLOCK_IN(devstate, field, callback) \
+    QDEV_CLOCK(false, devstate, field, callback)
+
+#define QDEV_CLOCK_OUT(devstate, field) \
+    QDEV_CLOCK(true, devstate, field, NULL)
+
+#define QDEV_CLOCK_END { .name =3D NULL }
+
+typedef struct ClockPortInitElem ClockPortInitArray[];
+
+/**
+ * qdev_init_clocks:
+ * @dev: the device to add clocks to
+ * @clocks: a QDEV_CLOCK_END-terminated array which contains the
+ * clocks information.
+ */
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)=
;
+
 #endif /* QDEV_CLOCK_H */
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index 62035aef83..a94cc44437 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -116,6 +116,23 @@ Clock *qdev_init_clock_in(DeviceState *dev, const ch=
ar *name,
     return ncl->clock;
 }
=20
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)
+{
+    const struct ClockPortInitElem *elem;
+
+    for (elem =3D &clocks[0]; elem->name !=3D NULL; elem++) {
+        Clock **clkp;
+        /* offset cannot be inside the DeviceState part */
+        assert(elem->offset > sizeof(DeviceState));
+        clkp =3D (Clock **)(((void *) dev) + elem->offset);
+        if (elem->is_output) {
+            *clkp =3D qdev_init_clock_out(dev, elem->name);
+        } else {
+            *clkp =3D qdev_init_clock_in(dev, elem->name, elem->callback=
, dev);
+        }
+    }
+}
+
 static NamedClockList *qdev_get_clocklist(DeviceState *dev, const char *=
name)
 {
     NamedClockList *ncl;
--=20
2.25.1

