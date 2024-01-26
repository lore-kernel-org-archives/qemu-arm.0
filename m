Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp878127ejc;
        Fri, 26 Jan 2024 05:35:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGx6hXaTVr1X4DmOCZItr3s7qwS6H82J2qJIRH4PMs5L7oiU1NHwBLQG/V5lMuL3Ymr3yn
X-Received: by 2002:a05:6808:1184:b0:3bd:e4bd:987d with SMTP id j4-20020a056808118400b003bde4bd987dmr1504971oil.44.1706276123681;
        Fri, 26 Jan 2024 05:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706276123; cv=none;
        d=google.com; s=arc-20160816;
        b=JqxXU5hRYqbLqrVc/pPaxrwHePHTYyxdMo4nzll/cpEhPKRcPzA/LzJ3QgIw9zS5dD
         E6Oi+7fQ6+nOCtbhS5oJDzba6qcHQ5yS2MGZ+5IXtgrQPjk04wJtByeMTiIlhV+7Yj08
         4Gedk8br8Jn4pCLjY3MbBREVNWfbY4b956B7jc9Vja09M79EASTZeEOzUscGYamLn5pK
         g4Ya7cjUB3ri0D7vGyuqJ8e5oQvLssrHZipoqglQxr3AYxKUgO/dIJvy/RnCQHgqZ+mD
         5BcaciymctPbIdlHqcqBvTUZ1we7wqIfELByHS1/JDewvSTMuZIGE6fU5gxcRugIpDZx
         +0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=+yPj8FKJBX2Kcw93aydW2yxkDgoYNjEPVMw9WCyVrCc=;
        fh=za8d50mC5rkhZmLzbgC0DovKQfedkIjGsi2wxbrkWZ8=;
        b=sYR7NPY3o1t/AAFksEzsDWqEd9sPpeK4mFBeFitf369iOfjZYL9utBbkDvLqc0MbLH
         gI2kwGP10CajP8f4fJXJSl9XInHDzScEQUpgEazOCxQdF3bi40jGA1CE3KOmZZr2Sbvg
         YINzTKsUXXw3GbHosdt+12di/PRZ7zlFZFo+lnnj9jFyTLyMERRD9+BIUvFI7WjkUV0y
         qchJWnIHiUcFVlxvcb79naNVoitpyhL1qJoMP++eyU1N8Rq1C0X0JIUJZerc+WqE1ofW
         gmecn1wf60TPDhc2uoi5/M2Uzmp6O2TmtTSFlbxGl+EDrTID1wg9VUnEjuNSwceQbUQU
         /s8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22-20020a05620a111600b00783524de05csi1346460qkk.267.2024.01.26.05.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:35:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTMKF-0004BL-8Q; Fri, 26 Jan 2024 08:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMKA-0003nj-5p; Fri, 26 Jan 2024 08:32:50 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMK8-00080V-1S; Fri, 26 Jan 2024 08:32:49 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLzCL67yGz4x5l;
 Sat, 27 Jan 2024 00:32:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLzCK0jGMz4wny;
 Sat, 27 Jan 2024 00:32:44 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/17] hw/fsi: Introduce IBM's FSI Bus
Date: Fri, 26 Jan 2024 14:32:08 +0100
Message-ID: <20240126133217.996306-10-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126133217.996306-1-clg@kaod.org>
References: <20240126133217.996306-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d+Ozfa8LjBkp

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

