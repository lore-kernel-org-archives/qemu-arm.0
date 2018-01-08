Received: by 10.28.173.206 with SMTP id w197csp2640612wme;
        Mon, 8 Jan 2018 08:11:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBotUbPLEsEdw3TX0+iEfYKjyUSCsmxZ/FZIaEV4jR7fTkQmekJGapJVVfA0BZamO7qLoLKIO
X-Received: by 10.37.183.132 with SMTP id n4mr12021372ybh.220.1515427878820;
        Mon, 08 Jan 2018 08:11:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427878; cv=none;
        d=google.com; s=arc-20160816;
        b=krnS5TwUr6/4rlXnVpxSbehQpmuf90rNM4rqchm4CrumFEFw5uun5houE+//1ybRJI
         bDnIidASV3Joj0O7QAgt6dXvLuDrMrpcAFXOjhqvnoKVjju3JnGJGHZI+EWIcAHz+iwu
         vFqJ53i2o8mLLXXnX4E1WAPMWEhKba3wom0MlnYlaXN8h2nMdJtYioZPSJmql4AG+krs
         +ympRC7mpJ4/rMm6IDYg0jiMfTyoMLLR+1YXB5ZnxTXHepSDNmlL6bo02lxeOReXu7PN
         0eKsDCFlNoLvveSUoPvnGpMrw0mqwLCQF66fKH4n8nTwSAj4+y02Ig+fTSiKSZH8knkC
         kUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=H82LAP42JoubDjEfVrLf8lWGvDT3hODw0HitNmp3Wog=;
        b=NuTg97G+d+wNAAQy1wuyI+BWRFcS6A3NU81fZ6P3/Y0XeEFE5iaphWVKdLJ80gnKYW
         TmD9eEAbPfwGFkKnaQ2PTcOPkWkNM9ouWJ4bYiSXW1JfzNgVFg9BFq2PgsE0aH2tcj8L
         1KMxZv2J2yg0Vzc5zK77w/LBbI3Txd/hYHjyb/6Oj4hk2qC7t3MiLf7T5k5I6CEQEYvi
         EL68G2tIu1/bRMUXfVrhM2RlDPvo85JQ1ZsVtRlNITChyhR+lUucQD7kPgIWkL4MF/kG
         UiX8w5DF7LlzsetLixD8jnQRC09cn6YTEFDM7ZOvnE+vkceWXx6H3U3jI5wx8QE564YW
         ZGhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nkBkk9d/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si2512492ywb.790.2018.01.08.08.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:11:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nkBkk9d/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYa18-00006E-46
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:11:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbl-0002ZU-UW
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbk-00086B-Ti
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:05 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43544)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbk-00085e-P5; Mon, 08 Jan 2018 10:45:04 -0500
Received: by mail-qt0-x243.google.com with SMTP id w10so14073896qtb.10;
	Mon, 08 Jan 2018 07:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=H82LAP42JoubDjEfVrLf8lWGvDT3hODw0HitNmp3Wog=;
	b=nkBkk9d/3bl0gafRrCax27WpVHSH/GDNCBGe9g2dmKmqfOkoo+dmBweln+5Yvs84bT
	itnfGQl0zg8+WsVcaVP/A7C+p64EYcJyNto1j2xYUiESN658G8yYVgg6vXFrVgXYP37C
	MVN7yXqMSsdnypRPP72MCwMbkOHhu5EbaGJTuq664qiMCg7wTH6GXbpVbVQeEjGp7HhC
	zOa8/AQNFA9/JkWDnlnNLNhNzEBr5beqoeKevV/45FsSfNWVXiIRSgI66NMciUx00hp3
	ikaQZMxY6JxKxtttfdaBBJMAkjBtWLrYF19wkmlQrsVO7ufQ86M/vgg7yt/RCmV0sOJ4
	OcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=H82LAP42JoubDjEfVrLf8lWGvDT3hODw0HitNmp3Wog=;
	b=hF04oyoxvvN9zzMLomrerGIx9Cutn0JaqEjBpO92KD3ibo9uNs/geiZA26tygJzcUc
	FkmEITr82Ag4bg5KqN0XA/l01ixqnl3YXruDjctaLKazi+/Iutfe5WqrEFN/+jUxfWo8
	sFNdGTB/rTuWV8E17GIYIml5lSsn3dUwon+FG4OGj0SgQlSbRuEKdiCpPDiDtL20sX1F
	TdVoqT21Z7OoiHEyAELEp8IX3e+/X0XyefyfGimrZNfrt5vvxfHQ26KtyH6gatQpM2IC
	lH/28ghe6PNCTyORJQSIv7QpdIwu/40B0No839oYCqUyirfFwejS5wHiAn+6O3EAuQOK
	0fxg==
X-Gm-Message-State: AKwxyte+LBRBrqsm5jF8s99pOLDg7DCBYUCol5ezOkOBazLP2iDPyhoM
	M7ooD5lh5q1RboYHx1MY/k4=
X-Received: by 10.237.63.184 with SMTP id s53mr16317861qth.217.1515426304207; 
	Mon, 08 Jan 2018 07:45:04 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:52 -0300
Message-Id: <20180108154303.6522-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v5 20/31] sdhci: add the Freescale controller
 for i.MX
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
X-TUID: p0T8YCss6VUc

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/fsl-sdhc.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/Makefile.objs |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 hw/sd/fsl-sdhc.c

diff --git a/hw/sd/fsl-sdhc.c b/hw/sd/fsl-sdhc.c
new file mode 100644
index 0000000000..aa8075a9e5
--- /dev/null
+++ b/hw/sd/fsl-sdhc.c
@@ -0,0 +1,58 @@
+/*
+ * Freescale SD Host Controller for i.MX emulation
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
+/* UHS-I SDIO3.0 SDR104 1.8V ADMA */
+static void fsl_imx6q_usdhc_realize(DeviceState *dev, Error **errp)
+{
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_GET_CLASS(dev);
+    Object *obj = OBJECT(dev);
+    Error *local_err = NULL;
+
+    object_property_set_uint(obj, 3, "sd-spec-version", &local_err);
+    object_property_set_uint(obj, 52, "timeout-freq", &local_err);
+    object_property_set_uint(obj, 52, "max-frequency", &local_err);
+    object_property_set_bool(obj, true, "adma1", &local_err);
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
+static void fsl_imx6q_usdhc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_CLASS(klass);
+
+    cc->parent_realize = dc->realize;
+    dc->realize = fsl_imx6q_usdhc_realize;
+}
+
+static const TypeInfo fsl_imx6q_usdhc_info = {
+    .name = "fsl,imx6q-usdhc",
+    .parent = TYPE_SYSBUS_SDHCI,
+    .class_init = fsl_imx6q_usdhc_class_init,
+};
+
+static void fsl_imx_sdhc_register_types(void)
+{
+    type_register_static(&fsl_imx6q_usdhc_info);
+}
+
+type_init(fsl_imx_sdhc_register_types)
diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index b3e69c3018..b058a9328e 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-$(CONFIG_SD) += core.o
 # SD/MMC host adapters
 common-obj-$(CONFIG_PL181) += pl181.o
 common-obj-$(CONFIG_ZYNQ) += arasan_sdhci.o
+common-obj-$(CONFIG_IMX) += fsl-sdhc.o
 common-obj-$(CONFIG_EXYNOS4) += dw-mshc.o
 common-obj-$(CONFIG_SSI_SD) += ssi-sd.o
 common-obj-$(CONFIG_SDHCI) += sdhci.o
-- 
2.15.1

