Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp552853lfg;
        Mon, 24 Feb 2020 09:04:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOjXkjTOxpnaedx0/M9KCNnlpjVQrmmgmEXNhPVW5KgyNKvAH4MFBAXG2kdzt2yM5/W13M
X-Received: by 2002:aed:3462:: with SMTP id w89mr45976893qtd.159.1582563888506;
        Mon, 24 Feb 2020 09:04:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si5332498qvi.18.2020.02.24.09.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 09:04:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3bH2GieB;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6H9z-0004Fn-Qc
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 12:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6H8X-00035q-CA
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:03:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6H8T-0005Wp-Di
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:03:16 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46534)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1j6H8T-0005VW-1K; Mon, 24 Feb 2020 12:03:13 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id D821396F50;
 Mon, 24 Feb 2020 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582563791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4G+xlL/fUt5DMmB/QGEqSlK0ypIhsRcgyJCMOphg+8=;
 b=3bH2GieBoJbrit2fN9HPDpMhgtByLj9BeUKwPyT6ZVpMbjwp1hGFsggPH34Ynd4/kVCiWc
 GWfjEWikr3+hxkHyCV95mjBfeQ9UzlRh3/W7RlUc+1OOuR0lR35+OZXxln1nXSpV9+ya3r
 oWwPA1rrZnTI7fHnfnDBdIPaRE9U1l8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/9] hw/core/clock-vmstate: define a vmstate entry for
 clock state
Date: Mon, 24 Feb 2020 18:02:54 +0100
Message-Id: <20200224170301.246623-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224170301.246623-1-damien.hedde@greensocs.com>
References: <20200224170301.246623-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582563791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4G+xlL/fUt5DMmB/QGEqSlK0ypIhsRcgyJCMOphg+8=;
 b=2NkdHeYpnOQZx1QmoRPG7Ecs1RNa6DBet+LqkYhvqYt4daz78AYZGggHl8l1T5eX6qcEM/
 /mtkH2rn3e7lX4McX8JfudEOM2/dmtqBP9glsZdpan/YuuN2/uhnExVfpJDPOE7OMyb8qg
 /83vI7Gp8zosj0m+FUU8aE49cIdJ8os=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582563791; a=rsa-sha256; cv=none;
 b=j/+4CaaPx/vB8f0nqG2s2v1DQSEpWmYxwZofgVMZ/3mYz1GRv6kVA1NYp4/0w9X3u4+qGe
 dr8X94dginSYUGov/ESOkvVBBjkh/PgeXi/6BusKyJ8PpNCfC7KrPGZDs33nByDVxu1ew/
 bf5/yajH6DjsCow8is4s8PLJsITk6XQ=
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
X-TUID: i/1yiLCGQyAr

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
--

v7: remove leading underscores in macro args
---
 include/hw/clock.h      |  9 +++++++++
 hw/core/clock-vmstate.c | 25 +++++++++++++++++++++++++
 hw/core/Makefile.objs   |  1 +
 3 files changed, 35 insertions(+)
 create mode 100644 hw/core/clock-vmstate.c

diff --git a/include/hw/clock.h b/include/hw/clock.h
index 30ac9a9946..8c191751a1 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -74,6 +74,15 @@ struct Clock {
     QLIST_ENTRY(Clock) sibling;
 };
=20
+/*
+ * vmstate description entry to be added in device vmsd.
+ */
+extern const VMStateDescription vmstate_clock;
+#define VMSTATE_CLOCK(field, state) \
+    VMSTATE_CLOCK_V(field, state, 0)
+#define VMSTATE_CLOCK_V(field, state, version) \
+    VMSTATE_STRUCT_POINTER_V(field, state, version, vmstate_clock, Clock=
)
+
 /**
  * clock_setup_canonical_path:
  * @clk: clock
diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
new file mode 100644
index 0000000000..260b13fc2c
--- /dev/null
+++ b/hw/core/clock-vmstate.c
@@ -0,0 +1,25 @@
+/*
+ * Clock migration structure
+ *
+ * Copyright GreenSocs 2019-2020
+ *
+ * Authors:
+ *  Damien Hedde
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
+const VMStateDescription vmstate_clock =3D {
+    .name =3D "clock",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(period, Clock),
+        VMSTATE_END_OF_LIST()
+    }
+};
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index d7080edf89..e3d796fdd4 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -22,6 +22,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
 common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
 common-obj-$(CONFIG_SOFTMMU) +=3D machine-hmp-cmds.o
 common-obj-$(CONFIG_SOFTMMU) +=3D numa.o
+common-obj-$(CONFIG_SOFTMMU) +=3D clock-vmstate.o
 obj-$(CONFIG_SOFTMMU) +=3D machine-qmp-cmds.o
=20
 common-obj-$(CONFIG_EMPTY_SLOT) +=3D empty_slot.o
--=20
2.24.1

