Received: by 10.28.173.206 with SMTP id w197csp2620071wme;
        Mon, 8 Jan 2018 07:53:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBotNNc8NJBTVK1lJSBgOorPKQzoAKFWUuYhGc7XqcBDS8rAir25d89269ZeGRwHk8zfrLbsN
X-Received: by 10.37.172.210 with SMTP id x18mr11777531ybd.297.1515426794193;
        Mon, 08 Jan 2018 07:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426794; cv=none;
        d=google.com; s=arc-20160816;
        b=Dm1hOzuSq81TusQPcnY+1DYq9s6FqNzswX5NdNM4znVJU96ewgSI4UMTxv1Zueimdy
         dm4C+XWKvKYV5YYFqGzl4pASelp7G5Xb3HHIuG8Zi0sAwVo5Q6FlNHK7iN4ReNKyPqmv
         IcxDrJs7sEBLXcj0BXXAAiLNS8oNiJjk+kZHfPHrJNhJtwSHh9YIRKiVx8arOGUfa0QZ
         dxasdX0bjlyRneQyLwGmWwDp2Bo9gvechP2F2kc7PvQ9Cu9z8MtWw9ovj9aXReFfZS5x
         0qBbHEMvOC0g5Qkebb4VJkd9P/dtl/1cm+COeCCayjne6B23JfnkIVZL83BpR/xmifuL
         E5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Lh7AjuqAV7rVDlwHYf3MCmQ/+c0qD/eTYi1lc8ZliHM=;
        b=KzOUMlaxaXEiTLFJumCvHgTVFNAbkNsPB8j7eVUzIEHAurkdJZaZgn/NgHxLhWLtzM
         m6pSltcxd81b9HzlzofWlIemRyAuG/fWV6M2zMPgn7MUTt16sGp80qZsfyfj0dKS9r2u
         HlMA75YKtiEyLa1LrX0sCWIp0O5R32AgexFQpL9Fmm5rqvvBJ/Z8o0nREFUIOu6NpTLX
         7cIREEX8ZxZZ5bdAdFfcX3LdsLzpmIwu31ugGklCkDYLSxNCg+Jug10mmlI6kXuWIAm1
         O3q7uJ1fLiJY9k7XBdVk1MArB7c9diWMQj33RIfM0fYGHzHlzy6jTJ+/4yEsPG0QqhZV
         r+tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oezXG1RK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d63si2573574ybi.596.2018.01.08.07.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:53:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oezXG1RK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZjd-0000WC-K7
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:53:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZb8-0001wR-9I
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZb7-0007b8-4S
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:26 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZb7-0007ai-12; Mon, 08 Jan 2018 10:44:25 -0500
Received: by mail-qk0-x242.google.com with SMTP id p13so14634612qke.4;
	Mon, 08 Jan 2018 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lh7AjuqAV7rVDlwHYf3MCmQ/+c0qD/eTYi1lc8ZliHM=;
	b=oezXG1RKL7LQNgpN+eeFRV1hSRly/W2OUzyQw1cUqPdpSK2mLIYfyKvGNVoQ0iULVR
	6qWkluEutT3vMcQ8pTUnKygi+ibyciD7KGltKI0rrD4AaoIXZ7QdYXZz/rOmgWiy+rbx
	3XqNNBI+9Y2PLHnjg3NWdA+R1oyGv/wqOpL+ORFnHfCKwh6zLjQfy/ctDA0mHkpSdZpt
	XtUrByx0WLhtHqBprWB2caLwejtfkqEjMCDgSNwQJKRe5NVbc8Gy6qnV33jdxRDvqwJg
	m5w47G42UIWNNhu/Yxlf8agcRdqETEBrAYtUu4Wck2KThXbUUcyKURIOeS4ZDF4qgsXw
	THkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Lh7AjuqAV7rVDlwHYf3MCmQ/+c0qD/eTYi1lc8ZliHM=;
	b=FOfbFRFNTKmz5+C5ANr/+ZqVAdyyS7LBSiaKsnnaIfMbpTV1qolcqCvW7PqciJJcDH
	nF+vrRue6DWvbHPX+I2/uMuBaZnlQYEPEzhvL7KRPDjWO+U2mJDCS5svAMvnVbdpXH9X
	qXR5kEV7k8sEdXQVJou1pcSXY3GFnOLCcNwOU08p01kxCw6LPi7VqR12RJYaETmox42A
	zdPKl7HyU+tFF+NtkwAUQkGT3D4sZE+yDW/BZzIxHaj5FdBA4acxdQYaUEfOPWGbezdx
	GZHVzlXTQ949xFBmn0SgGcSSnnwm+stwAutgeKraF03seuZBaB5GZ15DVnlz1oEvQr+g
	5RKg==
X-Gm-Message-State: AKwxytcOAm8raRPU4rDaQzInUcs00UWFAsc7zDVMsFxNWjuaE1jJnzvn
	1SUhcYKIR1ZMlV2pWaT7xXnjuFdqAas=
X-Received: by 10.55.214.150 with SMTP id p22mr13928814qkl.134.1515426264390; 
	Mon, 08 Jan 2018 07:44:24 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:44 -0300
Message-Id: <20180108154303.6522-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v5 12/31] sdhci: add the generic Arasan SDHCI
 4.9a PHY controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFu9RyNHmeX/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/arasan_sdhci.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/Makefile.objs  |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 hw/sd/arasan_sdhci.c

diff --git a/hw/sd/arasan_sdhci.c b/hw/sd/arasan_sdhci.c
new file mode 100644
index 0000000000..c6d96b2583
--- /dev/null
+++ b/hw/sd/arasan_sdhci.c
@@ -0,0 +1,72 @@
+/*
+ * Arasan SDHCI Controller emulation
+ *
+ * Copyright (C) 2018 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "hw/sd/sdhci.h"
+#include "qapi/error.h"
+
+/* Compatible with:
+ * - SD Host Controller Specification Version 2.0 Part A2
+ * - SDIO Specification Version 2.0
+ * - MMC Specification Version 3.31
+ *
+ * - SDMA (single operation DMA)
+ * - ADMA1 (4 KB boundary limited DMA)
+ * - ADMA2
+ *
+ * - up to seven functions in SD1, SD4, but does not support SPI mode
+ * - SD high-speed (SDHS) card
+ * - SD High Capacity (SDHC) card
+ *
+ * - Low-speed, 1 KHz to 400 KHz
+ * - Full-speed, 1 MHz to 50 MHz (25 MB/sec)
+ */
+static void arasan4_9a_sdhci_realize(DeviceState *dev, Error **errp)
+{
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_GET_CLASS(dev);
+    Object *obj = OBJECT(dev);
+    Error *local_err = NULL;
+
+    object_property_set_uint(obj, 2, "sd-spec-version", &local_err);
+    object_property_set_bool(obj, true, "adma1", &local_err);
+    object_property_set_bool(obj, true, "high-speed", &local_err);
+    object_property_set_uint(obj, 1024, "max-block-length", &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    cc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+}
+
+static void arasan4_9a_sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_CLASS(klass);
+
+    cc->parent_realize = dc->realize;
+    dc->realize = arasan4_9a_sdhci_realize;
+}
+
+static const TypeInfo arasan4_9a_sdhci_info = {
+    .name = "arasan,sdhci-4.9a",
+    .parent = TYPE_SYSBUS_SDHCI,
+    .class_init = arasan4_9a_sdhci_class_init,
+};
+
+static void arasan_sdhci_register_types(void)
+{
+    type_register_static(&arasan4_9a_sdhci_info);
+}
+
+type_init(arasan_sdhci_register_types)
diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index fd866d7f94..ef0fc3d3f7 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_SD) += core.o
 
 # SD/MMC host adapters
 common-obj-$(CONFIG_PL181) += pl181.o
+common-obj-$(CONFIG_ZYNQ) += arasan_sdhci.o
 common-obj-$(CONFIG_EXYNOS4) += dw-mshc.o
 common-obj-$(CONFIG_SSI_SD) += ssi-sd.o
 common-obj-$(CONFIG_SDHCI) += sdhci.o
-- 
2.15.1

