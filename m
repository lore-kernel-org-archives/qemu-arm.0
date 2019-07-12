Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp920079wrv;
        Fri, 12 Jul 2019 06:41:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyeVYDMYU0bJkRNA+MTk0tVJICjm8o8rOu2KBuXiTIdLDHGd6r63gkOzBNLCjVQhGo5xPm
X-Received: by 2002:a17:906:fcb8:: with SMTP id qw24mr8269430ejb.239.1562938879872;
        Fri, 12 Jul 2019 06:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562938879; cv=none;
        d=google.com; s=arc-20160816;
        b=JLUn2d0hLsxAbvgUmJM/KW3chz1U+mN41kvoc1Ygjg6/R6LC9KoytaTlgnoMdadm9x
         vHFqsFogQx573tKdhaBt7WV2uNW2FoT5WPEFouf5O624MrAtTreLwmKi4JC3xFocsCiK
         FZWPdg2cWLNoi+Xz2iiyaER4qs1ctczWcy3s/kPT5Xb8udT7nScNMMQocK6aOjpPO/ST
         AlPO2rW9OitNDXvp5EShgHCDiUcZLu1NJFbMEr91F6GmKv/Lx1w6OLlp6SLLC2UpkW2g
         um5nE1vzv9vUZhHMZtua4FDzqCY4Ya0PKiNYNFyoC+wx6hPizBaoHmIiW+Hv++V1zp8j
         e5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LIC75kVTgZ5MR5IEMpzA2ujgxlqmEDAGaqodczf+Izw=;
        b=VIOW1npRQYq58RTqEEUY7w6kJYWzqATt1p3ALmEELo9JNztByVWMTws1/l1HidOfh5
         PcLplbtay1acPuG37/oaRTB44FMDHTV15AFozLbTgVDvQxwM90tYpJ6b9ZCSbOZ1Kj5B
         /Dr52udvibFoJjczPL0YNhKJsbj0fhTyJON8lvcm3q9oGIK5G8bSr6WSc04UD7mYyIm5
         Bo5zDDoFErw6SPQi5UXUYVfpF4OXpQmObDPSiX6/9Dg6hcfbixdyKRDCOzDOgb9hTgIQ
         UJA1648zva42sQR5Ce8T4trBrGHEZHGNutPVCa0kS/PGQLiX4yJ8/HjswdSKXgfAijT1
         9JjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si5788534edw.223.2019.07.12.06.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlvna-0001O9-OZ
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57929)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvnW-0001K7-Hy
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvnV-0007av-Kh
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:41:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42614)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvnV-0007aM-FK; Fri, 12 Jul 2019 09:41:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B813B87630;
 Fri, 12 Jul 2019 13:41:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37BC826FC1;
 Fri, 12 Jul 2019 13:41:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:28 +0200
Message-Id: <20190712133928.21394-8-philmd@redhat.com>
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
References: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 12 Jul 2019 13:41:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1? 7/7] hw/bt: Allow building with
 CONFIG_BLUETOOTH disabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ncXvUuFa2uSD

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile.objs       |  3 ++-
 bt-stubs.c          | 18 ++++++++++++++++++
 hw/bt/Makefile.objs |  4 ++--
 3 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 bt-stubs.c

diff --git a/Makefile.objs b/Makefile.objs
index c2845a0efc..98269e393a 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -65,8 +65,9 @@ common-obj-y +=3D replay/
=20
 common-obj-y +=3D ui/
 common-obj-m +=3D ui/
-common-obj-y +=3D bt-host.o bt-vhci.o bt-opts.o
 bt-host.o-cflags :=3D $(BLUEZ_CFLAGS)
+common-obj-$(CONFIG_BLUETOOTH) +=3D bt-host.o bt-vhci.o bt-opts.o
+common-obj-$(call lnot,$(CONFIG_BLUETOOTH)) +=3D bt-stubs.o
=20
 common-obj-y +=3D dma-helpers.o
 common-obj-y +=3D vl.o
diff --git a/bt-stubs.c b/bt-stubs.c
new file mode 100644
index 0000000000..d3f5158d3b
--- /dev/null
+++ b/bt-stubs.c
@@ -0,0 +1,18 @@
+/*
+ * Bluetooth stubs.
+ *
+ * Copyright (c) 2019 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "sysemu/bt.h"
+
+int bt_parse(const char *opt)
+{
+    error_report("Bluetooth support is disabled");
+
+    return 1;
+}
diff --git a/hw/bt/Makefile.objs b/hw/bt/Makefile.objs
index 867a7d2e8a..46aec8e38e 100644
--- a/hw/bt/Makefile.objs
+++ b/hw/bt/Makefile.objs
@@ -1,3 +1,3 @@
-common-obj-y +=3D core.o l2cap.o sdp.o hci.o hid.o
-common-obj-y +=3D hci-csr.o
+common-obj-$(CONFIG_BLUETOOTH) +=3D core.o l2cap.o sdp.o hci.o hid.o
+common-obj-$(CONFIG_BLUETOOTH) +=3D hci-csr.o
=20
--=20
2.20.1

