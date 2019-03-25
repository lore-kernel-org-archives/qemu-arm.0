Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3712313wrx;
        Mon, 25 Mar 2019 04:03:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBUAPEEehRFV0RJ0CbQ0jYDzIrGDyAp8N5QGRuBR06j6Vr892xP0RoF2+07gM6djpvDo63
X-Received: by 2002:a81:49c7:: with SMTP id w190mr8601713ywa.510.1553511823170;
        Mon, 25 Mar 2019 04:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511823; cv=none;
        d=google.com; s=arc-20160816;
        b=v+KnnvOxJsyR3gcZ3Bu2MOPrunjxUQIP1EpxwKkPHCi8m3TAaAyG0/BjCeSBFGs8ML
         Y2y1vUD6DcczmXHyApTCdncmSW5kqCBb9I4I0SD/0JIDwivqM0Ki78RcO3AlQE/fKlU8
         VxuQfODE3tv64SBcmLQqjL8nZdOPJYe2PgJ/qDGiG3bPkxcZC0nPfEEgnQKmiBuaJw5x
         ArIx7go9pj8BebFmnfdepr9Eona6KWF0oyG/p+wKdHQrwTUxTDOsGDDPW/3PJjdmnqxp
         GPWhHpqU/6v9SS87Sfln9v2A5kyxC3N6vUnjse1QswUbmalaNUVxKnTbYe1RXYlHjrAk
         A2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=TMwYJeZI7vSL1DWJpKGh/Wq2gV4JEzR72XuTRymRAb8=;
        b=Mx1rNuZ4B2M+jskmCY0yyOtz9lXRZsuo7yjgYp660ZJPEpWAAJlhlpORg1d0w6WbYK
         YKTOdlzg2l1oBL6zq9d0GyXMKpZ21cQ68SLJGfoDnZRyjD5pEb8OIFHFintzRovQGNun
         tqB1ZFHMUy6T72TA481BeXehfiF5hLplOBu3expnvMTts+PfoUNWJCISbIVIsngm7fR+
         0fvh/axZQ3JgjhlEy0rtE/kmg1XuwdaRMT2E6gTJS8Q6iaYc0QoT0cXhz+YgaA/3XRNX
         Z/Dqj4NPIsKzleb/3PxCIODqC3XsR544RnIP7fYil46IPX0nU3ml71yE6sg9OdwXkPlB
         EcTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kNue+fmI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BQPwbnrL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BQPwbnrL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si9005902ybz.495.2019.03.25.04.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kNue+fmI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BQPwbnrL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BQPwbnrL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NOI-0005mA-F0
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:03:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNA-00056s-Ls
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN9-0007pC-8F
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:32 -0400
Received: from greensocs.com ([193.104.36.180]:38353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN8-0007oL-Ma; Mon, 25 Mar 2019 07:02:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id F13C07D78B6;
	Mon, 25 Mar 2019 12:02:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511746;
	bh=pK9FJbNdoyI0VAz9RM6Oo8TYJ2N+7i+dGeRy4KKzNO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kNue+fmI5Ry1bjwLTDrqk//nBklIkD5etwJir5fLuomczeeNVxEVnrzsw7o+o8gNS
	NuwR19j8wGHsUUAiWtirrldQR/bVCqlZxRMER+UfnCAt4Dw/wXcYyyYawpv0tcavx4
	WK0rkVNNayQBZTQ2CIv9RiLs12DGf6Q51b9N65kM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=BQPwbnrL;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=BQPwbnrL
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZKsc6NyXlwx; Mon, 25 Mar 2019 12:02:25 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id E9F677D78A0; Mon, 25 Mar 2019 12:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511742;
	bh=pK9FJbNdoyI0VAz9RM6Oo8TYJ2N+7i+dGeRy4KKzNO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BQPwbnrL7viIukwx4WlVPAEeaKRRSJiu5LibDCyuDl1E1KbQ+ululT+1uTAXxL39u
	YqO9nWa7G7aBTsS4J7nf9OZBH60w47g3BrNb+Hn+oopdj+7UpJBbxTa7c9zxvhjaaC
	gLlmIusExZvYblu5DbfGQBWIkClNGLJzA7AS1w7w=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 621137D78A2;
	Mon, 25 Mar 2019 12:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511742;
	bh=pK9FJbNdoyI0VAz9RM6Oo8TYJ2N+7i+dGeRy4KKzNO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BQPwbnrL7viIukwx4WlVPAEeaKRRSJiu5LibDCyuDl1E1KbQ+ululT+1uTAXxL39u
	YqO9nWa7G7aBTsS4J7nf9OZBH60w47g3BrNb+Hn+oopdj+7UpJBbxTa7c9zxvhjaaC
	gLlmIusExZvYblu5DbfGQBWIkClNGLJzA7AS1w7w=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:48 +0100
Message-Id: <11cf0b4f9c333696f462753c47dc71641717fb08.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 05/17] add vmstate description for device
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
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NJYIv7fdIJFm

The `device_vmstate_reset` can be added by device specialization, as
vmsd subsection, to migrate the reset related device state part.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/Makefile.objs  |  1 +
 hw/core/qdev-vmstate.c | 25 +++++++++++++++++++++++++
 include/hw/qdev-core.h |  6 ++++++
 3 files changed, 32 insertions(+)
 create mode 100644 hw/core/qdev-vmstate.c

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 320f71707c..562cf1034e 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -5,6 +5,7 @@ common-obj-y +=3D resettable.o
 common-obj-y +=3D reset-domain.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
+common-obj-$(CONFIG_SOFTMMU) +=3D qdev-vmstate.o
 # irq.o needed for qdev GPIO handling:
 common-obj-y +=3D irq.o
 common-obj-y +=3D hotplug.o
diff --git a/hw/core/qdev-vmstate.c b/hw/core/qdev-vmstate.c
new file mode 100644
index 0000000000..a9834f1a1c
--- /dev/null
+++ b/hw/core/qdev-vmstate.c
@@ -0,0 +1,25 @@
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
+const struct VMStateDescription device_vmstate_reset =3D {
+    .name =3D "device_reset",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(resetting, DeviceState),
+        VMSTATE_END_OF_LIST()
+    }
+};
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 0ef4d6c920..baad2e7066 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -500,4 +500,10 @@ static inline bool qbus_is_hotpluggable(BusState *bu=
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

