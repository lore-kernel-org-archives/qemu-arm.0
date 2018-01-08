Received: by 10.28.173.206 with SMTP id w197csp2624302wme;
        Mon, 8 Jan 2018 07:57:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBouTzsEgYic6REub07vVSMn4ty4B5zwUXnFDN4rbuBUZmMpnQYgjxlzBhpeYGakBruo30Ger
X-Received: by 10.37.95.6 with SMTP id t6mr11520806ybb.521.1515427068150;
        Mon, 08 Jan 2018 07:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427068; cv=none;
        d=google.com; s=arc-20160816;
        b=NKQKSHTvsuGxva/66hq0f4z6A8X2W8HmNrveM5dfCzVbzktm2usp0m5qqtNX0atWcm
         HoBkA/bIg6ATlKxctCSBfiK22rglGxz8OzK/2P3mv8zb4RKRTcEcpyLg0nlH0e4LnieI
         epfk7BPU/vnjLy4a95zZAthImagg0DhO01KYuTfB6mMbqTon5RVuZh5ULm673SCRx3eV
         0yPX30nge+aJJGlb/QOKNGbz+NYX26ytOGmCrqFvKfTd09jTJBq7uLYdExw4V+wcRMei
         ddSxaMz8iPKfAzt4HQWtbuIBADUxdXs5+zmA5zOqPqoVV4/inf0xbKnXPwYUSkZbJd8u
         Fzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=I+F/KFrcm7DFc44TC5l7H+i1YZb2YZswEM0L+8xZOF4=;
        b=kx+y8W7GAqWn+nRJ0cJgqR/5K+tJ6fZKIBKRwpu9NY0pfDUesTUoawxX8q5dX8P0RL
         Ns4w0BQv6KZRmRM60/sw3/YfACk1gVkaraPc0IYfmERJmAEb9oGFceS/t4X1LFMQCVpu
         2xbgDoPWkWh0x9yRidqHUnWK3yz6pwZ7WBZWCGl36Z1Ei5jE5Xt6h7C3DVvFhbSf80u6
         MBtWfmjIKDmHd/dnHqrsUqCU8bIodbAZUYXY6yXv4/t3W7FeaeSk+vHjkuQHeBs8DbKX
         69mMbCF/g6DSDlhRO2WKAkgP8K+u+CE8vzbyLR0k3VwbRRom8/C0zUI/uqmHT9/HYAc4
         v9GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fo/OTFLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a37si2587229ybi.132.2018.01.08.07.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:57:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fo/OTFLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZo3-0005LA-GV
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:57:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbf-0002RF-1p
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:45:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbe-00080b-2M
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:59 -0500
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:33569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbb-0007y5-77; Mon, 08 Jan 2018 10:44:55 -0500
Received: by mail-qt0-x230.google.com with SMTP id e2so14092595qti.0;
	Mon, 08 Jan 2018 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=I+F/KFrcm7DFc44TC5l7H+i1YZb2YZswEM0L+8xZOF4=;
	b=Fo/OTFLuNRldO0M/4djBXDGxQLWiggamfuzl5jJW9NGVNlpv2lGIg0Vw4TDm/pyjLZ
	pbsZUAy/59m1g1Qy8Z0PK+chbI9C3UeOIYiQPJwSQj9UkZwjilw7Z2wVfBopNKbTAOmK
	Jrxp6ZpTpv88+/mPh+nD5F+LiaaHSgdXFek5YGsnEFgGmQFd/+jn88ZhjwBMVg2GEl6e
	cjC1PbQmZPGMN0VvIxjrTiXEs0qucurzQ9XnQs+B6lMDLNROwEBXdKMjdZTHys543LXh
	1es75/DgW4QwIaw2ymaEQI2S/bgw/Npj/PNlTxjouql3tgYZw7TFOovNswS5YgCyuvE1
	a5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=I+F/KFrcm7DFc44TC5l7H+i1YZb2YZswEM0L+8xZOF4=;
	b=mFJOu45Va60WvCou9ze9YMvdp9vYljUdhfamPcfadMKHhVQKsadLVBTe6RERgDuxAE
	7NF7t9W5XMygO4WtLW2n86jjDGgpLHq4KnkF5QHLf7P/HnlTHiQnucNpLlj893TOkOcZ
	udTLoaKUWcWSyUDqKI1utQYdb4ZxnWN2xPawuWhXnNSKXriRRdoYM8BquJbeIFLgBQ9i
	9D8z2HOMocLDxJRCx+Qm0mv/awFX6vOdfgPTK9Z13AmB+FgmOQuqopCywiKzsdXvpMl9
	0sLKWCqrr+A3h/zs7ftg+b7ZKcA6A0GeiwLbSeZV+P8XQ3lY3iHQy3RCLcCHHIGjNNUd
	haOg==
X-Gm-Message-State: AKwxytd6Wv/ocz3vPAnOfmirUjHFxkSWEj5KNAXNgJTcZ2VKAgdVgIyj
	gquRbYDjsc+tIOIYWLpVR+A=
X-Received: by 10.200.26.219 with SMTP id h27mr12038167qtk.77.1515426294625;
	Mon, 08 Jan 2018 07:44:54 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:50 -0300
Message-Id: <20180108154303.6522-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-arm] [PATCH v5 18/31] sdhci: add the Broadcom BCM2835 SDHCI
 controller
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WX+8KIGjk09M

based on Arasan SD 3.0, eMMC 4.4

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/bcm2835_sdhci.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/Makefile.objs   |  2 +-
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/bcm2835_sdhci.c

diff --git a/hw/sd/bcm2835_sdhci.c b/hw/sd/bcm2835_sdhci.c
new file mode 100644
index 0000000000..3baf0887d8
--- /dev/null
+++ b/hw/sd/bcm2835_sdhci.c
@@ -0,0 +1,77 @@
+/*
+ * Broadcom BCM2835 SDHCI controller emulation
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
+ * - SD Host Controller Specification Version 3.0 Draft 1.0
+ * - SDIO Specification Version 3.0
+ * - MMC Specification Version 4.4
+ *
+ * - 32-bit access only
+ * - default clocks
+ * - no DMA
+ * - SD high-speed (SDHS) card
+ * - maximum block size: 1kB
+ *
+ * For the exact details please refer to the Arasan documentation:
+ *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf   ¯\_(ツ)_/¯
+ */
+static void bcm2835_sdhci_realize(DeviceState *dev, Error **errp)
+{
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_GET_CLASS(dev);
+    Object *obj = OBJECT(dev);
+    Error *local_err = NULL;
+
+    object_property_set_uint(obj, 3, "sd-spec-version", &local_err);
+    object_property_set_uint(obj, 52, "timeout-freq", &local_err);
+    object_property_set_uint(obj, 52, "max-frequency", &local_err);
+    object_property_set_bool(obj, false, "sdma", &local_err);
+    object_property_set_bool(obj, false, "adma1", &local_err);
+    object_property_set_bool(obj, false, "adma2", &local_err);
+    object_property_set_bool(obj, true, "1v8", &local_err);
+    /* FIXME verify/validate with someone from Broadcom?
+    object_property_set_uint(obj, 1024, "max-block-length", &local_err);
+    */
+    object_property_set_bool(obj, true, "pending-insert-quirk",  &local_err);
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
+static void bcm2835_sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_CLASS(klass);
+
+    cc->parent_realize = dc->realize;
+    dc->realize = bcm2835_sdhci_realize;
+}
+
+static const TypeInfo bcm2835_sdhci_info = {
+    .name = "brcm,bcm2835-sdhci",
+    .parent = TYPE_SYSBUS_SDHCI,
+    .class_init = bcm2835_sdhci_class_init,
+};
+
+static void brcm_sdhci_register_types(void)
+{
+    type_register_static(&bcm2835_sdhci_info);
+}
+
+type_init(brcm_sdhci_register_types)
diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index ef0fc3d3f7..b3e69c3018 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -10,7 +10,7 @@ common-obj-$(CONFIG_SDHCI) += sdhci.o
 obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
 obj-$(CONFIG_OMAP) += omap_mmc.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_mmci.o
-obj-$(CONFIG_RASPI) += bcm2835_sdhost.o
+obj-$(CONFIG_RASPI) += bcm2835_sdhost.o bcm2835_sdhci.o
 
 # emulated SD/MMC devices
 common-obj-$(CONFIG_SD) += sd.o
-- 
2.15.1

