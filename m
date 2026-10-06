Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DF3CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:42:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEN75-0002WC-Ad; Wed, 07 Oct 2026 04:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEI0B-0008VP-30
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:07:36 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHzt-0007Nd-L5
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:07:22 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so4910817a12.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791342196; x=1791946996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jxr6Z/nV68ZRXh1gyO1ohVQUm+zuc0cqi2mtEVuqXoY=;
 b=rXpcQDI60G3HNCP5MYOpUr0qbSTYES2MOHa/aROP+Mq/5naFYXcfp50HPxz9Nstb4d
 iVXQOjDPWwhDy4qtqgSR6hT44M7GoiYjS8XEouEwzVpAUyS81al56HBHk/vbwQl3NYoK
 ZSY686cz2gs6hzCjjFe/8HoNcMe+kKMt7+jAwQ6gl2oX3HrqUmEMyHLbUz/TqYx8IlUV
 9PPSkXOM/UbC5619uqFHqFxNI8fcYcU48yWDvLDgFAwbb3s1gYhniNcCz69EBAC0ou94
 LBf2xmr8DcgIuMZ9qIapfkohHiyRUEybjCDmnBRMuOI8F/DxAff/phGgiK484kP8+BhJ
 zS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791342196; x=1791946996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jxr6Z/nV68ZRXh1gyO1ohVQUm+zuc0cqi2mtEVuqXoY=;
 b=2BkQuovYvRup3VlccX0gs/YfSynhUiIMpzfaq2uGcgmI+2vXF41IsyOKI5QDiWn8xh
 FFuXRFKy0+x/i9FdZ9GSkDJwqENwBmEMejlSeT7K0XE1hfWmYbbOm7ortLVGzm+qVl+O
 hyLF4cVIvQU5cFQPFsQle28N09gKKZKJXke5APNDWZVx58u9tQTa9VI31LFosJzNfYG9
 9Oka2AwtZ0dd1KalC3015Ry3XZ+LICISquGWoZeDcPG2/AHdTvMmox2T4LMO16oXqz+P
 K4lsu9WPLjoVDnBOaFFn8Uq1xp9CRQg5WCzkipVEzfjwpFAqU6x8xh2i2fK2/Ivy1mfE
 Nahw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2e7olTUjeeTV4o/8Oq2y0JmDAuRvPc38HXJxmTUifiXRGWi2PcYjAnjhBccEGolCChxnjjIkBFQ==@nongnu.org
X-Gm-Message-State: AFq9FYIsRwZeVUCIL27xuHI/XZjghYxXEuWTpct9HO/pfgbGuHlq7ewj
 6PNHwZsTFvMNLZIddIxcd/Dg/Aw2pKvv+nSnxxf5ug+RUtOUAKcfRP7l/XjrHA==
X-Gm-Gg: AYBFou111B0bYLFaP5G8E4MRMbUbeC7pTrvcITzPLHsWQCuRz8A70xbVmtaA8zErY96
 /Y2WgtZWXPdGQSdiUOApfuY0vcRySOBYPFGeI9rTzu9ITW1TBtQ7IUibEgPpR0qt235ph5RDGy0
 N1cITd1NRY5xsaP/g2Ln2dupzvlh/z+EFtKzPpCUnJ7lNi+fqLHyPJj1VYZvR3enu6KNPHp9exH
 7fSk6w5LV708uZ6cfvSGfUd3mklij7tTVA3xdgRRflOELMSkjcYPVhos9KNK5PwAIlZWDiUfaMc
 S+/SxI2RlY9s2vvMS22qMVUSp0pX9PkMCjFHCNt6ZgwRQdxlqjMqYWIxa9yfBfJDolcdd/d6qSP
 lJxK+BND8ki/PybPeuZPtNZ16voF248Zsp7MYL/6pShY2XkOOtrtMoeIYaz2qfutHRxGlnji2sY
 Gea9s65oB5eRwEuYiMD+2kJ7g/tz8Urnj0O84RwEuRF0cNIGMrrq8pNKPW/2NaRHYKrlK5Cfc9d
 247jNd36kNhdQ+623Ic21pWWJOP/VVcexqzlQ==
X-Received: by 2002:a05:6000:41c5:b0:488:5c28:94d0 with SMTP id
 ffacd0b85a97d-48c6d15fb06mr1276000f8f.19.1791275736591; 
 Tue, 06 Oct 2026 01:35:36 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:36 -0700 (PDT)
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
Subject: [PATCH v4 14/31] hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
Date: Tue,  6 Oct 2026 10:34:26 +0200
Message-ID: <20261006083445.30362-15-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 include/hw/arm/fsl-imx6.h | 5 ++---
 hw/arm/fsl-imx6.c         | 4 +---
 hw/arm/sabrelite.c        | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 376deea3a4..4cf26f1fbc 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -35,6 +35,7 @@
 #include "hw/usb/imx-usb-phy.h"
 #include "hw/pci-host/designware.h"
 #include "hw/core/or-irq.h"
+#include "hw/core/sysbus.h"
 #include "system/memory.h"
 #include "target/arm/cpu.h"
 #include "net/can_emu.h"
@@ -56,10 +57,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslIMX6State, FSL_IMX6)
 #define FSL_IMX6_NUM_CANS 2
 
 struct FslIMX6State {
-    /*< private >*/
-    DeviceState parent_obj;
+    SysBusDevice parent_obj;
 
-    /*< public >*/
     ARMCPU             cpu[FSL_IMX6_NUM_CPUS];
     A9MPPrivState      a9mpcore;
     IMX6CCMState       ccm;
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index eec9673c6f..7ba9b85a2e 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -519,13 +519,11 @@ static void fsl_imx6_class_init(ObjectClass *oc, const void *data)
     device_class_set_props(dc, fsl_imx6_properties);
     dc->realize = fsl_imx6_realize;
     dc->desc = "i.MX6 SOC";
-    /* Reason: Uses serial_hd() in the realize() function */
-    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx6_type_info = {
     .name = TYPE_FSL_IMX6,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(FslIMX6State),
     .instance_init = fsl_imx6_init,
     .class_init = fsl_imx6_class_init,
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 34f302f83c..201766d8ea 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -66,7 +66,7 @@ static void sabrelite_init(MachineState *machine)
                                  OBJECT(s->canbus[i]), &error_fatal);
     }
 
-    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_MMDC_ADDR,
                                 machine->ram);
-- 
2.56.0


