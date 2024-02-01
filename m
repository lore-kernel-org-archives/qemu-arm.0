Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp258911ejb;
        Thu, 1 Feb 2024 06:14:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxeFwbtbdMkRCxG1h1g5Zeb+FMRKH8AGRB1tXm5wVZdDg7+dhOP0IFTZ6hfYnDoCBAHqfa
X-Received: by 2002:a05:6871:7a11:b0:210:d74e:9d0d with SMTP id pc17-20020a0568717a1100b00210d74e9d0dmr5285770oac.57.1706796873503;
        Thu, 01 Feb 2024 06:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706796873; cv=none;
        d=google.com; s=arc-20160816;
        b=y3Y+OiKLhEqfJRqd7jJETP4GaSweGo0XTe1mK2KSuGwcYZHFP5IYYbjU1OEWm1GYH7
         ekW0biKbeBxqMRIPRSDiLbWU18ofW+drfd7kUDYuIRYXaIlPH8RV2u9FSw4wKu5fRXje
         7N6XBCV3giw375gPkfXvonP51fhhoEpZAMpbVcq9waAftcNyDNqyhu7g5jv2ecLWKFO9
         1QwpUWF0K6cWhE97wko93GEaM+6qfGXuds61vbjVaWIi7tnZMI3luua5cMPiIBkbFBHh
         iEftSx0zKXLyVr9HduvQ2BlOFv6JBEk0D5fvv57VeC1KjNr11nf4fTG5Jwd3Kul+pDc5
         1uPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=+yPj8FKJBX2Kcw93aydW2yxkDgoYNjEPVMw9WCyVrCc=;
        fh=W3Id17EL4lf9r2SMN0N5+acd5Ic0QOsL8Bdp9Nlz7wY=;
        b=jU2JAVkFJwn8TFyOSCJ/jx8zShB9xPlQcqp1u3+WrRRpOQBCRSMfTzYH2AIYtByZeE
         pfE5o+uwGsqhIgBL914Jn1dRzCnYO1342xxFcHgo+cYo1G0GRfeNej3p1BehmKLo5bG5
         N74LGy0OpSL029BPJI/RwnS3sfkbMATfFpYPA4/9yGsU+oxRDUMwXlUdKOWHAmbqpN5x
         mnn7djncV6yNtaDks85BJB/gNpfZvfJPteox6ZOlmq/VCzcg3cot/BaL2u/JQAyP8bh+
         sDAEPWulM7+3MvHO2r1NKaAvUXhkLJKzuMyXAjToTdq+jgx8VJv0zpf+xhnjtBTwHc+C
         49Bg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCXD7wK7Jw7TbLaQ6y4Lnj7UU/6CfGZEg5WRWzpkKLQWAYrv8XaalwN5REuIHpv038rq4mo2tn7mb5oOQMK1zXoqvl7xtqpw
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a0ce8c9000000b0068c7e9a6029si697782qvo.100.2024.02.01.06.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVXpB-0001K6-MC; Thu, 01 Feb 2024 09:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXoq-00010C-Ni; Thu, 01 Feb 2024 09:13:37 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXoh-0007n4-Su; Thu, 01 Feb 2024 09:13:28 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TQgqQ6KTWz4wcb;
 Fri,  2 Feb 2024 01:13:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQgqP0lH6z4wcM;
 Fri,  2 Feb 2024 01:13:20 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/17] hw/fsi: Introduce IBM's FSI Bus
Date: Thu,  1 Feb 2024 15:12:45 +0100
Message-ID: <20240201141253.806055-10-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201141253.806055-1-clg@kaod.org>
References: <20240201141253.806055-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: G0FK8YanA4JA

From: Ninad Palsule <ninad@linux.ibm.com>

This is a part of patchset where FSI bus is introduced.

The FSI bus is a simple bus where FSI master is attached.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: - removed include/hw/fsi/engine-scratchpad.h and
       	 hw/fsi/engine-scratchpad.c
       - dropped FSI_SCRATCHPAD
       - included FSIBus definition
       - dropped hw/fsi/trace-events changes ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/fsi/fsi.h | 19 +++++++++++++++++++
 hw/fsi/fsi.c         | 22 ++++++++++++++++++++++
 hw/fsi/meson.build   |  2 +-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 hw/fsi/fsi.c

diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
new file mode 100644
index 000000000000..50e8f5c888f1
--- /dev/null
+++ b/include/hw/fsi/fsi.h
@@ -0,0 +1,19 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 IBM Corp.
+ *
+ * IBM Flexible Service Interface
+ */
+#ifndef FSI_FSI_H
+#define FSI_FSI_H
+
+#include "hw/qdev-core.h"
+
+#define TYPE_FSI_BUS "fsi.bus"
+OBJECT_DECLARE_SIMPLE_TYPE(FSIBus, FSI_BUS)
+
+typedef struct FSIBus {
+    BusState bus;
+} FSIBus;
+
+#endif /* FSI_FSI_H */
diff --git a/hw/fsi/fsi.c b/hw/fsi/fsi.c
new file mode 100644
index 000000000000..60cb03f7a24e
--- /dev/null
+++ b/hw/fsi/fsi.c
@@ -0,0 +1,22 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 IBM Corp.
+ *
+ * IBM Flexible Service Interface
+ */
+#include "qemu/osdep.h"
+
+#include "hw/fsi/fsi.h"
+
+static const TypeInfo fsi_bus_info = {
+    .name = TYPE_FSI_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = sizeof(FSIBus),
+};
+
+static void fsi_bus_register_types(void)
+{
+    type_register_static(&fsi_bus_info);
+}
+
+type_init(fsi_bus_register_types);
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
index 93ba19dd0411..574f5f928903 100644
--- a/hw/fsi/meson.build
+++ b/hw/fsi/meson.build
@@ -1 +1 @@
-system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c'))
+system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c','fsi.c'))
-- 
2.43.0

