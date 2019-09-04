Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp662101wrp;
        Wed, 4 Sep 2019 05:48:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/obxeDBXjHGq5RdColwjGIMAjcCdAou0QRgmr5Zgb256MJ5T9ITik3jmlqkt9yAyTYX6F
X-Received: by 2002:a17:906:f0c9:: with SMTP id dk9mr13088452ejb.261.1567601290577;
        Wed, 04 Sep 2019 05:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567601290; cv=none;
        d=google.com; s=arc-20160816;
        b=FZxFe7SVC/gVx7wAvGsd9d2UuC63iR6QRj3KJVbOU4R98sCmY0MP/rq5wWAEEhAoH5
         Y9+1bk3mbmZOx4pfjxxQuYYlI6pQR08nEw95qz40tIS6AuPpOlKxIrj14d6ytkEHJWyw
         oqhZDyP821d/Cpm0QOxQ4vtOwXNnIGbMfPRLanGNY9Dvbj0tDwape82/AM/QjF5SzjsR
         iuJ0gVg8ehgOTn+3NTjTdsqf8aQChFtFTWtPfVPZUEYKbCBoytWfYdrrjlE+HGvqM5Xo
         bbs0mGjjIswJWqHtbRXmoEDIlS3D5DzoxAO0zC+pZjtcwlv1BXBAQ+0PV2mwNLIIk0Me
         4XBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=maHjw57nHq4D7Qc3T0BUruHDBkArYwKHTizQf10RF2s=;
        b=q8VRx0rNjNcQ9xd6HXTxMK+akUPKiwuomdfcTxh5d50M9hYDCOcqRLvdck4THd3W4d
         y7DXejND4w6/a3AExbrDs8PJv7b1C3kugVgmsaNPhjMp/ploOF/I2ajv3/dr1Rl2ULqW
         PDsZPwCdh31nUVbhnTcwxQ1oMbNpt+WhOqL3N7QOraLiXYBvWnAmWFjwzTJCXayNYiw8
         JkRcK2WeN4oTAOMRrzFal+L63bNbnaUYVlLFjsjomDTDlxrP4cXYd7VFGAyh3c7ReXmM
         iCnk/2Njr03AG7vdBIakgqvgtXLQGKmrPiYra0AVPE7PdWK9ddtgDbkbp0nQRqy8oKqu
         RAyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s30si299962eda.260.2019.09.04.05.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 05:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Uhk-0006pX-Ri
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 08:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqn-0004pu-ES
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rql-0008PN-SR
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:17 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40544)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.con>)
 id 1i5Rql-0008Mz-KR; Wed, 04 Sep 2019 05:45:15 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4B2B096F54;
 Wed,  4 Sep 2019 09:38:51 +0000 (UTC)
From: damien.hedde@greensocs.con
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 11:38:36 +0200
Message-Id: <20190904093843.8765-3-damien.hedde@greensocs.con>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904093843.8765-1-damien.hedde@greensocs.con>
References: <20190904093843.8765-1-damien.hedde@greensocs.con>
MIME-Version: 1.0
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:47:12 -0400
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
X-TUID: d/6w0HUW2eSG

From: Damien Hedde <damien.hedde@greensocs.com>

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

