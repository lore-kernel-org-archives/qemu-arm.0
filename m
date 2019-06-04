Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2093200wrg;
        Tue, 4 Jun 2019 09:29:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhLTGegiQ2Bb4Z+w9UfaYTY3TtYORgSt6KDz4lWBowAESRxp6FdpJ7flRsu3X/JJN/48/o
X-Received: by 2002:ac8:1115:: with SMTP id c21mr29351950qtj.155.1559665779683;
        Tue, 04 Jun 2019 09:29:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si6569339qkf.99.2019.06.04.09.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Jun 2019 09:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZiD70jtD;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYCJf-0003wD-4R
	for alex.bennee@linaro.org; Tue, 04 Jun 2019 12:29:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1hYCFv-0000XP-1w
	for qemu-arm@nongnu.org; Tue, 04 Jun 2019 12:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1hYCFt-0003Y6-N2
	for qemu-arm@nongnu.org; Tue, 04 Jun 2019 12:25:46 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
	id 1hYCFt-0003Wh-EE; Tue, 04 Jun 2019 12:25:45 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPSA id E0A7096F60;
	Tue,  4 Jun 2019 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1559665544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=6EFLWJiXnIDh4G42bZanNNuCQdKUk7RN59mJdttTr24=;
	b=ZiD70jtDlPpOxgyZSBUycnFNnLMtTxgs7BEla/ZZg+FZbMa3Rrir3DjEuDpd9CCSv0a/41
	MgMP5wtDyWXyBwcQIWpLTdzNBc5aDDZm6bXowFnyj4KlCkd+gOpafn3FgU5GrwyVsFdnvl
	GEStZHTm+6xx76hTHPXZsOnW3u3gJaA=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 18:25:20 +0200
Message-Id: <20190604162526.10655-7-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604162526.10655-1-damien.hedde@greensocs.com>
References: <20190604162526.10655-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
	s=mail; t=1559665544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=6EFLWJiXnIDh4G42bZanNNuCQdKUk7RN59mJdttTr24=;
	b=LpAx+SUevuy//buTU6W3eizqRWN9mkwLktl35rSHqjP7vAOW+RtvrAKZ9ZC0M3YD2gcP7j
	Nbks990yePPAVGZTTFRTek7p8nxUbqL2AIL5i3+ZmidROkbLkc+g+nryD8bzf9j+9nI/Vm
	M1BCvylY2aNayhi40rewYpoY1OR1mRw=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1559665544; a=rsa-sha256; cv=none;
	b=U0s5U0WI451qiHSzVN9FbmwVJ5Z+AdYpBCMMWcev21CM/1MYLveFAKBwIzFfwIkiAFOfyk
	DY3itOyh9nHE8VGnXRueng97UEdG3Y1nT23dx7I4fEii/rW1LT14RDRLuirzi+L44WRCWU
	ar/ZTmjUYx+lQTB74Cca/p1qLfdP/bE=
ARC-Authentication-Results: i=1; ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [RFC PATCH v2 06/12] add vmstate description for device
 reset state
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	marc.burton@greensocs.com, alistair@alistair23.me,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	marcandre.lureau@redhat.com, pbonzini@redhat.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RO9EKIx8rOO0

The `device_vmstate_reset` can be added by device specialization, as
vmsd subsection, to migrate the reset related device state part.

It contains the resetting counter and the reset inputs current status.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/Makefile.objs  |  1 +
 hw/core/qdev-vmstate.c | 34 ++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h |  6 ++++++
 3 files changed, 41 insertions(+)
 create mode 100644 hw/core/qdev-vmstate.c

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 97007454a8..b3b4990005 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-y +=3D bus.o reset.o
 common-obj-y +=3D resettable.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
+common-obj-$(CONFIG_SOFTMMU) +=3D qdev-vmstate.o
 # irq.o needed for qdev GPIO handling:
 common-obj-y +=3D irq.o
 common-obj-y +=3D hotplug.o
diff --git a/hw/core/qdev-vmstate.c b/hw/core/qdev-vmstate.c
new file mode 100644
index 0000000000..5322b70b0e
--- /dev/null
+++ b/hw/core/qdev-vmstate.c
@@ -0,0 +1,34 @@
+/*
+ * Device vmstate
+ *
+ * Copyright (c) 2019 GreenSocs
+ *
+ * Authors:
+ *   Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev.h"
+#include "migration/vmstate.h"
+
+static bool device_vmstate_reset_needed(void *opaque)
+{
+    DeviceState *dev =3D (DeviceState *) opaque;
+    return dev->resetting;
+}
+
+const struct VMStateDescription device_vmstate_reset =3D {
+    .name =3D "device_reset",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .needed =3D device_vmstate_reset_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(resetting, DeviceState),
+        VMSTATE_BOOL(cold_reset_input.state, DeviceState),
+        VMSTATE_BOOL(warm_reset_input.state, DeviceState),
+        VMSTATE_END_OF_LIST()
+    }
+};
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 693f79b385..596a5bbead 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -546,4 +546,10 @@ static inline bool qbus_is_hotpluggable(BusState *bu=
s)
 void device_listener_register(DeviceListener *listener);
 void device_listener_unregister(DeviceListener *listener);
=20
+/**
+ * device_vmstate_reset:
+ * vmstate entry for reset related state
+ */
+extern const struct VMStateDescription device_vmstate_reset;
+
 #endif
--=20
2.21.0

