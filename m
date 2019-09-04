Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp682696wrp;
        Wed, 4 Sep 2019 06:04:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxL10WvA9o8jzZImju4/Wzmg/jMuRXIRBU3UcSP60L/z3usuWXxWMQ+m4wk67dJ4dGcWK5Q
X-Received: by 2002:a0c:c15d:: with SMTP id i29mr18123263qvh.5.1567602256005;
        Wed, 04 Sep 2019 06:04:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si14574548qva.129.2019.09.04.06.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 06:04:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FpzhLdV1;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5UxK-0004Is-Rk
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 09:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5UpY-0006RK-9q
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 08:56:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5UpX-0005X3-6e
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 08:56:12 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:45908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1i5UpW-0005WQ-Tz; Wed, 04 Sep 2019 08:56:11 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 87F8896F65;
 Wed,  4 Sep 2019 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1567601770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1cYSywxsNjFTbyO7aWViJMbAww4xP344l5lA8bvklQ=;
 b=FpzhLdV1/pkM4IfvexiVv2kMoSjWDI1jcgcZLHg9tnz4ocOkihTkBte1hq07fTr3mLnkJ/
 NqIU5OF2N0I4tXuhMtEdLFv9MSDTyiEZgiXov7m9ONoFHLPZscu8ruAMQCxL07xd9QUKpw
 jC4QrRStYnYgJdqpJd9PWIO60yvhuN0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 14:55:24 +0200
Message-Id: <20190904125531.27545-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904125531.27545-1-damien.hedde@greensocs.com>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1567601770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1cYSywxsNjFTbyO7aWViJMbAww4xP344l5lA8bvklQ=;
 b=fV/ccsRfVBAx9ltMid7Bl4D5Pc4fchLwCmZIfa2GutHCRluL/ERVjZIT9pK0gZNCtcDSSO
 qys4JdUsZCflEcLoieYzzjiDTrokA1t+axxGKlhAlbhClkql5ZOS//Xi1Cgrg0XmQGmCIr
 4pLgO4RKHGx7FuHD6YzBnu5ODrnea2o=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1567601770; a=rsa-sha256; cv=none;
 b=PyRokgH1uWH1zed9Pc729W8qXFWKLt7J1XYK6S9ide8COsIoSsnbHmb2QFyxhh4vLlqr51
 AjQL+yKQ3fWUBGZloy1FG0GF56+x50iG/glrQ6DCqXiX3lptU3HRPzmYyFwQ5cErJuHsQl
 34CpTKgfoVQx6lUCYz/ng2Z/2rrvkKk=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v6 2/9] hw/core/clock-vmstate: define a vmstate
 entry for clock state
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
X-TUID: JhwQRlheGIdS

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
This was in the previous reviewed commit. But it can't be in the
clock.c file in order to allow linux-user builds.
---
 hw/core/Makefile.objs   |  1 +
 hw/core/clock-vmstate.c | 25 +++++++++++++++++++++++++
 include/hw/clock.h      |  9 +++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 hw/core/clock-vmstate.c

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index c66a5b2c6b..8fcebf2e67 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-y +=3D bus.o reset.o
 common-obj-y +=3D resettable.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
+common-obj-$(CONFIG_SOFTMMU) +=3D clock-vmstate.o
 # irq.o needed for qdev GPIO handling:
 common-obj-y +=3D irq.o
 common-obj-y +=3D hotplug.o
diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
new file mode 100644
index 0000000000..c781369c15
--- /dev/null
+++ b/hw/core/clock-vmstate.c
@@ -0,0 +1,25 @@
+/*
+ * Clock migration structure
+ *
+ * Copyright GreenSocs 2019
+ *
+ * Authors:
+ *  Damien Hedde <damien.hedde@greensocs.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "migration/vmstate.h"
+#include "hw/clock.h"
+
+const VMStateDescription vmstate_clockin =3D {
+    .name =3D "clock",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(frequency, ClockIn),
+        VMSTATE_END_OF_LIST()
+    }
+};
diff --git a/include/hw/clock.h b/include/hw/clock.h
index fd11202ba4..e7efb6ad17 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -34,6 +34,15 @@ struct ClockOut {
     QLIST_HEAD(, ClockIn) followers; /* list of registered clocks */
 };
=20
+/*
+ * vmstate description entry to be added in device vmsd.
+ */
+extern const VMStateDescription vmstate_clockin;
+#define VMSTATE_CLOCKIN(_field, _state) \
+    VMSTATE_CLOCKIN_V(_field, _state, 0)
+#define VMSTATE_CLOCKIN_V(_field, _state, _version) \
+    VMSTATE_STRUCT_POINTER_V(_field, _state, _version, vmstate_clockin, =
ClockIn)
+
 /**
  * clock_out_setup_canonical_path:
  * @clk: clock
--=20
2.22.0

