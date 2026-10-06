Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A218CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 04:39:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEJQY-0004lt-Au; Wed, 07 Oct 2026 00:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFfl-0004f6-1T
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:38:48 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFfQ-0005Hb-6R
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:38:02 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso4224659a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 17:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791333211; x=1791938011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BpZ/p/gz1o4fr4QWDS/Zht3fqM3aWd0SAgwA09g8thI=;
 b=dXHlNe8pDtMAe3S7mbfPciwgY8qcoDzCoYoS248DzHMj7etZPNU1QLwQkbzsf6zUj5
 KWhmFbmxI2Gxb3ym0jf4DqqGKhnZqixEYkpx9+TR1CbpD78t7R5ANWX3Znh0qzPWT9GG
 1FaFCmU69god1hYD5cIhEvpWHT42aRGUWDWE0Wt0mLJI3dQcJTTlDQj0mf/h/xjcOwEO
 qFVhXrz829xhho1kMR0BCDGu7eCaancFTdclAHm96ydNmu6fpXWupSV0rFpM5ejdc8jR
 H1nyaMl9TmJ0WT3oXL33PX2RECICbNVItsf0+It63TFzyn/cXFdzlFJErSqF8/S0RCV9
 isDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791333211; x=1791938011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BpZ/p/gz1o4fr4QWDS/Zht3fqM3aWd0SAgwA09g8thI=;
 b=HW5Yyh7Hie31gLmzxy2Y4FJ6E2f0942LkY3e6AlJFMpmgU3oiP8O/1NL+Ocrm494HK
 L3Xf+NmcwjsAIvdwlNcpiM8w8I3FDMCFA8PFxC2Gzc9wbvmpZFywFEveba3Q11KHGYHV
 69iG7S5EwGuIQf6te+lwjDWsvPfbTez3aUjZ7TPE7x3uuqMa9KQBeRSDrbFoEt/BnU8v
 zZQ3QuP5PepyBceTQTXVIFtk2U8nqccA6pSXd9HUoZRyc7hF3vlgq/VCsCYLKt/k68f0
 gMOJFONrnU2l61yAjP553nYg3M17h9Ezs4xxXTU5KcrAcLeSzJeOcP5lcfviwOyYLUfa
 sQZg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3ZytBBaK5XvAUe2y5pVQwArUdzeOqk230s5YIQ+2Z6BcbxSlRPs+hz9o7r++zW08WPNbWYuwomw==@nongnu.org
X-Gm-Message-State: AFq9FYI4mHgKGr4JiUfjr2MDyXN5/p12VtqG4EixQ1b9juWIWmKICsUT
 SJXvOd/45Ffx/n+vbMIvZ0OXKSrr4UZ9b3vT70OFqdC9tYfcG4IIi81HUoZDZA==
X-Gm-Gg: AYBFou0Zohi9arO/zHbIT7xUShoMiy+LsnHSZhWrUJmQex2hMGMdGHNgIW0TvEjeRyu
 1sl8SF++u0b5UAFcqn1uXgGXyHnVJpQV7tCFDkYp653tT8tOYwAnd/jgDq2A+N0JiAq/JFZ1M5z
 TiTXYjBlCqiCOdCndF1cpgHr1L07NJCm/wtFg+WfOwtGY4je6GgHJCZAc8mAzCD6qB01d49nVH/
 P6KGqZc6wHZskcdQOLj7Dm0IElg2SlPzUbgRm0+stRyPuBNIhA6nl/4DpSuUwwRVxpNz3l2NA5A
 YescxHhsivpTp+AsWWMWV9tdKm08SyZk1M8q6nG2ms8XcVgtvGOcVRqEEbgOZIzObDvx0Yh+pbm
 HIBees5asFAh7m0GbRSwOXIbYWqcdzCn4d/WSUW0fA4dz1iKCcGIJgid+uUq3lI8rJDPe3EFALR
 FU8GIVX/NHt6ECuWjfD7gu6U82mPOZnzIhw/UFFnnGesY/Eq/Q1ioT/cr+KFwCwrjaAT3AdMK2X
 iAPmALeCnGHugUJMypliK2blKe9F+Te5423yQ==
X-Received: by 2002:a05:6000:40cb:b0:48c:45ed:2425 with SMTP id
 ffacd0b85a97d-48c47c8ed6cmr15281700f8f.4.1791275734264; 
 Tue, 06 Oct 2026 01:35:34 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:33 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 12/31] hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
Date: Tue,  6 Oct 2026 10:34:24 +0200
Message-ID: <20261006083445.30362-13-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
machine reset.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/arm/fsl-imx25.h | 5 ++---
 hw/arm/fsl-imx25.c         | 7 +------
 hw/arm/imx25_pdk.c         | 2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index b68d4334a0..4bb4d5b3e5 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -29,6 +29,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/usb/chipidea.h"
 #include "hw/watchdog/wdt_imx2.h"
+#include "hw/core/sysbus.h"
 #include "system/memory.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -45,10 +46,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslIMX25State, FSL_IMX25)
 #define FSL_IMX25_NUM_USBS 2
 
 struct FslIMX25State {
-    /*< private >*/
-    DeviceState parent_obj;
+    SysBusDevice parent_obj;
 
-    /*< public >*/
     ARMCPU         cpu;
     IMXAVICState   avic;
     IMX25CCMState  ccm;
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 7f65f4ca4b..efb22359c5 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -317,16 +317,11 @@ static void fsl_imx25_class_init(ObjectClass *oc, const void *data)
     device_class_set_props(dc, fsl_imx25_properties);
     dc->realize = fsl_imx25_realize;
     dc->desc = "i.MX25 SOC";
-    /*
-     * Reason: uses serial_hds in realize and the imx25 board does not
-     * support multiple CPUs
-     */
-    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx25_type_info = {
     .name = TYPE_FSL_IMX25,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(FslIMX25State),
     .instance_init = fsl_imx25_init,
     .class_init = fsl_imx25_class_init,
diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 243c30a67e..a33050788c 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -72,7 +72,7 @@ static void imx25_pdk_init(MachineState *machine)
 
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_FSL_IMX25);
 
-    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     /* We need to initialize our memory */
     if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE)) {
-- 
2.56.0


