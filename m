Received: by 10.28.173.206 with SMTP id w197csp2616389wme;
        Mon, 8 Jan 2018 07:49:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBovUXlw3Wgw90DHoOpVitQaVO3my/qpnqW9r+pm+YFIdLjLYV+OvPj4AX3XfhyGZ2ppSpQ+/
X-Received: by 10.13.225.76 with SMTP id k73mr11251501ywe.36.1515426573522;
        Mon, 08 Jan 2018 07:49:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426573; cv=none;
        d=google.com; s=arc-20160816;
        b=TVraq/3AD5cvbKelF+aOPIvop5IFmGAsAELflv4vRZEFztj2esTe3o9b3KZ+Y7sW2X
         gF7r6ilQ7pHO+ZIAjbsqt9pRFxvz0DSWkAMHq57lnan0M6KaFSIqB5i37pB6TFXm/3AU
         WIMRIKOGKcFslT8xMkRLyp5xfOEHwLfmAShfNyEH08mMGpBlt3qc8TRdYbhKm0s0L5ez
         rKq6I6JGhHK+sqVbkie1sW7dDQSiIu8wIkcHaaM8nyfy2Mx9lX4p0r90aEmig5VDQiuJ
         BmQcTWACxckVNTFytCdn/XuwB6btMP6IUDU+5AfvSvVT5rC7tPpAeXQZglmGfstzFhlW
         pauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=S8WgP9d8b8vzBjL9L41DgSGepEXam+f5vAbsynfjV8o=;
        b=z1hwc7RjsmyXV+D1rpdgw1Jmrj9KaOHoq5eYSuQXc+6WPBB+k7NfK4RcuOy2Bc903H
         c2RgI8sdGA/Edxb4YaTsVXrsCIvHfbiPjdHqiFJzVbTi2+IVDtdJ2YWyLAxtS+uLRMUY
         XF+jSN/435iix44NnDJMpNKdvX2tbks1HNgZd/BGuHjImtsVMgJUiIv4qixJ3iNggL4n
         iX2XtL6hL1KHeekA0/JfDO8XEbUcfxT1AQyVIjv+9YK27dx0ZBZTHb+X2AWTFu1uN0oj
         thNlHXscIlfa0AcqbL7mcu9zBOAQXAKJ0vr7amy7kkLJLP+/fA3UMkM+/aWPldQV4qLB
         5wZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M1Hs0fNe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h32si2544439ybj.510.2018.01.08.07.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:49:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M1Hs0fNe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZg4-0005g7-Vd
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:49:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaw-0001lr-Nr
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZav-0007Sy-PD
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:14 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:46481)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZav-0007Sn-KF; Mon, 08 Jan 2018 10:44:13 -0500
Received: by mail-qk0-x244.google.com with SMTP id l12so14284349qke.13;
	Mon, 08 Jan 2018 07:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=S8WgP9d8b8vzBjL9L41DgSGepEXam+f5vAbsynfjV8o=;
	b=M1Hs0fNe3zlL4hApieVc7AOt6uEYxIoyG7xpaxujEB/IA00Ppy9AfVWjCvwzM6lVHC
	I2ijwi5LumhJTdO08y2dd81rR9QI0q52/hFFxlJFf7VaksHtvibUNM0QVfn1G9xLBfO4
	UzQpi1PYHJAIVc+z1V/zWD2goNfNF6KcSIu4uHB4eBv8qcA0e4D5JnhOmk1PoiyvS3pt
	w8fDieXmaPusWuGGk8oOkyiS9gCT+2j2Ft9XTHtUgKs7X8EuOIeWQwyU3f9pBVYr2KLN
	YveYoL6LeermNln8jl+Muaq1vpyVbX0WtMI+8oKdR8lB8mS6s+8OZ1pzridC6/w0lfDf
	mf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=S8WgP9d8b8vzBjL9L41DgSGepEXam+f5vAbsynfjV8o=;
	b=uO0XEt5wOkYFhWu+HGpblcYz68zoSSAAr2S9V/yDT0ubhbt5Z6B3hQtS3lCi8ue0CT
	2lrBm6x9v77k5Oy8HB6PgrfUW13LLHks5Qcgg+MwX0LPgAOMrJV/u2y2ltItPE8Bf/Cz
	pB4WY/+B1aNSZVq1mRClwgzcFtNYpl9FmOM8yWDMLpOTwcgOI2U8N+ZnPR1Mz/Ge9dFN
	CSoh/BQ2QHtpdRhX5ZU26IM6Mdi/qrFQM+15WF3k5hgWvuAp9ecYYxWVHdrRkgA8XeBx
	de0Mm6Gr7R9gDZcOcE/kzGs2PEM0Zjz+wGiQUoaIRKM8olQCXjL//F40q7Gxv4T3lQUv
	+Lsw==
X-Gm-Message-State: AKwxytcRGjACSzAnwrxnXAf5D+BIA2Ewtu5SpipJVshXOBZZ11Ay0mqW
	4/UDzMxb99Me0nqf5F9JVrE=
X-Received: by 10.233.244.75 with SMTP id z11mr12286qkl.68.1515426253055;
	Mon, 08 Jan 2018 07:44:13 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:42 -0300
Message-Id: <20180108154303.6522-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v5 10/31] sdhci: add a Designware/Samsung host
 controller
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
X-TUID: NEtLsZPfSiug

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/dw-mshc.c     | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/Makefile.objs |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 hw/sd/dw-mshc.c

diff --git a/hw/sd/dw-mshc.c b/hw/sd/dw-mshc.c
new file mode 100644
index 0000000000..c2869cd569
--- /dev/null
+++ b/hw/sd/dw-mshc.c
@@ -0,0 +1,64 @@
+/*
+ * Synopsys Designware Mobile Storage Host Controller emulation
+ * (and Samsung Exynos specific extensions)
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
+ * - SD Host Controller Specification Version 2.0
+ * - SDIO Specification Version 2.0
+ * - MMC Specification Version 4.3
+ *
+ * - SDMA
+ * - ADMA
+ */
+static void exynos4210_dw_mshc_realize(DeviceState *dev, Error **errp)
+{
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_GET_CLASS(dev);
+    Object *obj = OBJECT(dev);
+    Error *local_err = NULL;
+
+    object_property_set_uint(obj, 2, "sd-spec-version", &local_err);
+    object_property_set_bool(obj, true, "suspend", &local_err);
+    object_property_set_bool(obj, true, "1v8", &local_err);
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
+static void exynos4210_dw_mshc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_CLASS(klass);
+
+    cc->parent_realize = dc->realize;
+    dc->realize = exynos4210_dw_mshc_realize;
+}
+
+static const TypeInfo exynos4210_dw_mshc_info = {
+    .name = "samsung,exynos4210-dw-mshc",
+    .parent = TYPE_SYSBUS_SDHCI,
+    .class_init = exynos4210_dw_mshc_class_init,
+};
+
+static void dw_mshc_sdhc_register_types(void)
+{
+    type_register_static(&exynos4210_dw_mshc_info);
+}
+
+type_init(dw_mshc_sdhc_register_types)
diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index 0fe2501017..fd866d7f94 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_SD) += core.o
 
 # SD/MMC host adapters
 common-obj-$(CONFIG_PL181) += pl181.o
+common-obj-$(CONFIG_EXYNOS4) += dw-mshc.o
 common-obj-$(CONFIG_SSI_SD) += ssi-sd.o
 common-obj-$(CONFIG_SDHCI) += sdhci.o
 obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
-- 
2.15.1

