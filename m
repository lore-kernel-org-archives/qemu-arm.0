Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp783509wru;
        Sat, 11 Aug 2018 02:09:19 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw5jKrd2+Rk8p/8lKjsYJP3v7Ku5+sHHGr0cPbC3T93veSwxkTC68oPO6T1044fxpPO7i9/
X-Received: by 2002:a0c:fac4:: with SMTP id p4-v6mr8763024qvo.179.1533978559277;
        Sat, 11 Aug 2018 02:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533978559; cv=none;
        d=google.com; s=arc-20160816;
        b=wCRGMAw/wM42fWPboPKTYt18zWsZW/dsBwsasZtiQur4uhW8HicYWtaN+HN7gi5y4m
         i6rzqCTImqU6hJtoileQMdODLvvlSXvxixlpYOkwYCd+WE+B73WUjZ8iLouyO8flXn+E
         PM91TCf2eVjMKS1chGrPtADsWuDw1iu/ObaH4DUqqe9K85SlrxsNQ+6Vujl1/l6sgTF1
         xKJ4Jlsa8vwQsT394EMs4EA1hNt0zMTyS2PuXxcS3a3k1aaT8J8K4UzBDQWbN0hqLckb
         h2r3Kn5AFzZq+ceNo2Ua0fJ4B5Vzd36hMzgURr1FuDHWZGjQBjBwldS1/8g96eMgkBKU
         FHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Dik38frX6G+8fUuvHWI1JSJIXMZ5GTLvcL2vMH0HOUA=;
        b=DHWW8yNjIuKE/i7FkzkRWaqqrLCGndD+f6bKRj/QCQp/FOrd51yeEX9RrckvMMd2LB
         k6LkOJ1OEzm8Jg5hXLOtpxYIS/wMX7YkToIU0lD2Yr8phWjvn+UDs2AZRRVvs/0uizGt
         5wYMpGxCEAz9sJpd4zmGSQlUEJ8g1g2Xl1zRxXxy/lo6ZDdCo85j9f6LFyC7nt4VcnEV
         Qhq8UrcMXaXbtKwLFd1K45ouUDsuSmdxjvsSCfsiRip/XTwmSkwPerHnMbgl2+pjtgyN
         z1EYESSh2qx+vaYMCZXvMwj6EnIT9LcqwjzkuDNCTJ1l6BnUyXRNg0pZ2hOzRUo9R4yA
         K00A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t40-v6si1687148qtj.158.2018.08.11.02.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Aug 2018 02:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1foPte-00066J-LO
	for alex.bennee@linaro.org; Sat, 11 Aug 2018 05:09:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPtA-0005sk-C2
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPt7-00019T-Fa
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:48 -0400
Received: from steffen-goertz.de ([88.198.119.201]:34678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1foPt7-00018M-55; Sat, 11 Aug 2018 05:08:45 -0400
Received: from localhost.localdomain (tmo-080-6.customers.d1-online.com
	[80.187.80.6])
	by steffen-goertz.de (Postfix) with ESMTPSA id 913604BBB0;
	Sat, 11 Aug 2018 11:05:36 +0200 (CEST)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Sat, 11 Aug 2018 11:08:31 +0200
Message-Id: <20180811090836.4024-3-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180811090836.4024-1-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH 2/7] arm: Move nRF51 machine state to dedicated
 header
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6pbxnFg5JSwE

The machine state will be used to host the SOC
and board level devices like the LED matrix and
devices to handle to pushbuttons A and B.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/microbit.c         | 38 ++++++++++++++++++++++++--------------
 include/hw/arm/microbit.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 14 deletions(-)
 create mode 100644 include/hw/arm/microbit.h

diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index 467cfbda23..8f3c446f52 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -14,22 +14,11 @@
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
=20
-#include "hw/arm/nrf51_soc.h"
-
-typedef struct {
-    MachineState parent;
-
-    NRF51State nrf51;
-} MICROBITMachineState;
-
-#define TYPE_MICROBIT_MACHINE "microbit"
-
-#define MICROBIT_MACHINE(obj) \
-    OBJECT_CHECK(MICROBITMachineState, obj, TYPE_MICROBIT_MACHINE)
+#include "hw/arm/microbit.h"
=20
 static void microbit_init(MachineState *machine)
 {
-    MICROBITMachineState *s =3D g_new(MICROBITMachineState, 1);
+    MicrobitMachineState *s =3D MICROBIT_MACHINE(machine);
     MemoryRegion *system_memory =3D get_system_memory();
     Object *soc;
=20
@@ -45,10 +34,31 @@ static void microbit_init(MachineState *machine)
             NRF51_SOC(soc)->flash_size);
 }
=20
+
 static void microbit_machine_init(MachineClass *mc)
 {
     mc->desc =3D "BBC micro:bit";
     mc->init =3D microbit_init;
     mc->max_cpus =3D 1;
 }
-DEFINE_MACHINE("microbit", microbit_machine_init);
+
+static void microbit_machine_init_class_init(ObjectClass *oc, void *data=
)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    microbit_machine_init(mc);
+}
+
+static const TypeInfo microbit_machine_info =3D {
+    .name       =3D TYPE_MICROBIT_MACHINE,
+    .parent     =3D TYPE_MACHINE,
+    .instance_size =3D sizeof(MicrobitMachineState),
+    .class_init =3D microbit_machine_init_class_init,
+};
+
+static void microbit_machine_types(void)
+{
+    type_register_static(&microbit_machine_info);
+}
+
+type_init(microbit_machine_types)
+
diff --git a/include/hw/arm/microbit.h b/include/hw/arm/microbit.h
new file mode 100644
index 0000000000..89f0c6bc07
--- /dev/null
+++ b/include/hw/arm/microbit.h
@@ -0,0 +1,29 @@
+/*
+ * BBC micro:bit machine
+ *
+ * Copyright 2018 Joel Stanley <joel@jms.id.au>
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef MICROBIT_H
+#define MICROBIT_H
+
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+#include "hw/arm/nrf51_soc.h"
+#include "hw/display/led_matrix.h"
+
+#define TYPE_MICROBIT_MACHINE       MACHINE_TYPE_NAME("microbit")
+#define MICROBIT_MACHINE(obj) \
+    OBJECT_CHECK(MicrobitMachineState, (obj), TYPE_MICROBIT_MACHINE)
+
+typedef struct MicrobitMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+
+    NRF51State nrf51;
+} MicrobitMachineState;
+
+#endif
--=20
2.18.0

