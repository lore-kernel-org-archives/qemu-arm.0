Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp668370wrp;
        Wed, 4 Sep 2019 05:53:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJSV2WVChFYPA4MrsGDWkFmDHrJ7DQNQm0chHaNP9ELVngouhJu7fdjZV7+KB20Qr4yo17
X-Received: by 2002:a05:620a:302:: with SMTP id s2mr14011729qkm.497.1567601610776;
        Wed, 04 Sep 2019 05:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567601610; cv=none;
        d=google.com; s=arc-20160816;
        b=sCblaDexTHNO3I6UhjpBIIPJ57R5qhNwUH4hsnXdlMZr5z912m4TAUKn6Gaaw80RNU
         C/retOeLQv2hfUoOA0GhM9Z4Ar3VGO2EhvrG0gdHJOwnFnSVAFBmNChGNsA3smjCVTeB
         iWYyTeun57EEOi92JLN47+pUkM9KpvrDHbEzchq0G7pNO9OwQyy5Ih3DDx/29Zl5vp3r
         mLDhvbLjc88+WknaL97vo4lG5sCOtLwNKtZw6D9YJEfsSjEqeyeiwZpjDzlUTyD0ZbfW
         utepazK2QsrC37RmjJaFIg/jY6G2pDqGn82mFutc5+FcZ8RtJ+d0vlRkT3RTld1zDBEK
         6/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=B2qpNUM0UIdVBTGHk13qBYgOVUtStMiLkWgHVhvBQx4=;
        b=lNrPXt1s7RsC19Kq+q0ErqpJKRl58q051vIEFDD6FN3l9QLIGM3etpoJLHI7PP/e4F
         OMEqiOxO4wwa+dR8s7HhEMQ/INB83EJyBTgPWyMf3PzvlCkV9A3tZavBlZ3izkgA30Rt
         6uUUDGDFqwgK/qhdLXKOkCQIYNwcWIYfyEzew1m7HwuWfRF2hYn3+alpS7FKSYvRL7vp
         A+m7RzZlAiOyGs6f3vV59tMyZb2/Gp+JMzQFIvxmXsgo7ZTpOCMJt4sjSt5kjPKtvQJp
         jhRc0/kDi7Xej0amibcwTgrHp7e2R8LKtuOelvqTiL6I504vkcjZBRXOvQ5X9PB28ODh
         RX0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p48si15007985qtb.61.2019.09.04.05.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 05:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Umv-0003SS-Od
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 08:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqn-0004pv-K7
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rql-0008PU-SV
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:17 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.con>)
 id 1i5Rql-0008Mw-HZ; Wed, 04 Sep 2019 05:45:15 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 3147996F59;
 Wed,  4 Sep 2019 09:38:53 +0000 (UTC)
From: damien.hedde@greensocs.con
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 11:38:39 +0200
Message-Id: <20190904093843.8765-6-damien.hedde@greensocs.con>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904093843.8765-1-damien.hedde@greensocs.con>
References: <20190904093843.8765-1-damien.hedde@greensocs.con>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:47:13 -0400
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
X-TUID: KPk12+7JLXZs

From: Damien Hedde <damien.hedde@greensocs.com>

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

