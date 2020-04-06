Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3994243lfi;
        Mon, 6 Apr 2020 06:53:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypLJ/G5Ps8ji0STbu/SQzSwBAfDaWrqoPihgdGWR3Tck/yUKECx7J3CBXTyeO1Y02N8awBmY
X-Received: by 2002:a05:620a:718:: with SMTP id 24mr21235739qkc.280.1586181225973;
        Mon, 06 Apr 2020 06:53:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k64si7216185qke.321.2020.04.06.06.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 06:53:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CQ10Ml8N;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLSC7-000402-V9
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 09:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1jLSBg-0003wi-4T
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 09:53:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1jLSBe-00022f-Gv
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 09:53:15 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1jLSBe-000222-8B; Mon, 06 Apr 2020 09:53:14 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPS id 2847296F50;
 Mon,  6 Apr 2020 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1586181192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rq6m+vucrgvZy/M+Gi95Dh58FmBHWgpH8MYOnBgpeVI=;
 b=CQ10Ml8NWy3V0EgwTkXH3jjbMqUYMy3E30/UByIRj8YmqQxQ2ll/exkNhLXy8vnDkmdzOa
 40oCZIHTUbuNdILlXU1PXKjK3+JJblj1X+eiaVa+SyVwihI0hRowtHd9eVpsLMXVjRLJvd
 5D0QSiTawrDC3LEUpMtI1Gud+f7FRu8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 2/9] hw/core/clock-vmstate: define a vmstate entry for
 clock state
Date: Mon,  6 Apr 2020 15:52:44 +0200
Message-Id: <20200406135251.157596-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406135251.157596-1-damien.hedde@greensocs.com>
References: <20200406135251.157596-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1586181192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rq6m+vucrgvZy/M+Gi95Dh58FmBHWgpH8MYOnBgpeVI=;
 b=Jz58wOUU6r3BNqBZ/nP0cpM9YNQXnBmVKLepdQHvmuUjdH2gEh5VYwcy2WQF3qLury/7UA
 RHxmRy2+RHljp/UXrETvdVguEZedVNZ2TtUG0/x6flo4xpEysv50T/9UZmHHVpFGxCYKNY
 Z0tPEBTB5hB8F9ajWHKcU0goTq6QHFw=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1586181192; a=rsa-sha256; cv=none;
 b=1zdhP2EzYS7oJ8uk3IXU6Ew/Py/b6ySeJ23cnHOpD+39zny7Ynj+aOOd/n/lkn9Py8fTJL
 gD2pdyAmPsXQ5DTskNzNReXt8dDVoG7mCqA8LGdceZSbPqxOAyr+tlkfVbpGxkXmpEz2b6
 L6D2F7mBsi4OEuaTLZYt+tl3sBQ2YDs=
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
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, berrange@redhat.com,
 ehabkost@redhat.com, pbonzini@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, marcandre.lureau@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: roGWFLfrMUy9

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
--

v7: remove leading underscores in macro args
---
 include/hw/clock.h      |  9 +++++++++
 hw/core/clock-vmstate.c | 25 +++++++++++++++++++++++++
 hw/core/Makefile.objs   |  1 +
 3 files changed, 35 insertions(+)
 create mode 100644 hw/core/clock-vmstate.c

diff --git a/include/hw/clock.h b/include/hw/clock.h
index 82a7f3c698..f3e44e9460 100644
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
index 1d9b0aa205..115df55087 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -21,6 +21,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
 common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
 common-obj-$(CONFIG_SOFTMMU) +=3D machine-hmp-cmds.o
 common-obj-$(CONFIG_SOFTMMU) +=3D numa.o
+common-obj-$(CONFIG_SOFTMMU) +=3D clock-vmstate.o
 obj-$(CONFIG_SOFTMMU) +=3D machine-qmp-cmds.o
=20
 common-obj-$(CONFIG_EMPTY_SLOT) +=3D empty_slot.o
--=20
2.26.0

