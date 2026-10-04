Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839FDCA5FE6
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:28:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJv-0006af-GU; Sun, 04 Oct 2026 08:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJq-0006XE-S6
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJp-00079h-8E
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a16629a040so12910315e9.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116872; x=1791721672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ffa1V6tn2IfWueByDpRqxUf/UBayNFXRkCdogr6gDuE=;
 b=jZyXJ8J2V2Y/auLVwAPN/IjUNPxTa+qMDnR9OeQqGD30ZymgTtzY+Oe2gHn6Avn+ez
 CpSyJcch8nWq78Yt3s6EfW+Fg6j6qIBLGlquOORDZ7xBXmFubNhgcGICX8sOsmkbEZJm
 qbqMKNvz0rCBU8H6i2KHj0I36yJfPAXzUTocURAlc8LgmYSOd+yhgvU4QF45PE1WuRV+
 j7uNZhvS8FhkDZKxFTvTOJWiuDlSFGqDOc6YHofhiWOqC8IAd2R1xb1hpOvhIlrAWBKa
 OetElWneFKr3lRIXOXQdrBde1WSjpjMzRajXfV4U4FHO3mC4jPee6f7OdEHDjd5sz/h3
 WD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116872; x=1791721672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ffa1V6tn2IfWueByDpRqxUf/UBayNFXRkCdogr6gDuE=;
 b=As5gNqMrerPHRNuy0IFq9/P2zMZpJkxfPVSmKyO9AG0iOF+UlMIC21C4oANkEbHwM+
 wgoNKOLSbbJ1nvzUT/SkKcQh7Oh6Hywh6NiaDIGPr2Gpzoq9PQIis7Pj737XXtSKy2A7
 0ZgbgTjcpCGj8JVeptTmqX/DlkrqcTTvkDvXG2kV3nQZFU6juZZAMbZdTMPxKDvraVjF
 B4A9L4jsar1SFPbZ0vPcpRjNxU62b7mcZJuJWQE5DolIPr8ibraaJAra0a8mPjitDhMM
 nBInI7trFgIvCwtRKdkI5NQ8QKgauKbqU4c7hDfQmxqkVLtrBOqANV7fYn00Sr6LN/QJ
 +knQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwy1AR/NWKT8EKgtTwfyitnfDTNLAsyyeT4p0qmO47Q3JppSBa2QBqvc1+sTP25uR1SpkIDlVjlOQ==@nongnu.org
X-Gm-Message-State: AFuF++n2piBCBVVKaLiWyeKES1KUDlBo+sOQqRdxb2e1B+FfFi8/QFvR
 blRO9U28QHPjG7htcGVqdQWi9wGWHWC0MD6eTy8gn5SAEPKrvrM+xdTn
X-Gm-Gg: AYBFou2GEEl4ACkTDPvXHb4sbfLVWqdkBXtB6IMf46m/e3yVz3GbysIRdCYHdf7J5D8
 KpaS4Jg15zWUat9VTUNhbgiq/AUmWuxTdunNL6Xr3/4bXv41tu3Baral9+lREgvTCCW/DWDmaDR
 Ct5LZbHCta0Ml6KjAArcE+Rx8jVBvq5+O3IOybtkmoi/pm6k82o6O9uplEBzYQ6HmVHVZt+jh3W
 3u7tQWbzVeMYMq5CYlxxxKdfqG2o7139I53J1oSMeBjjbJUF9I3Gn1+jmOPjP09+u9YkLnNFnI0
 kTbyI+UxAhvsU6hEvtRcjQ772PJ7aDd2MJx61jbKos255m85gZ9VTDDRnobsv2MyH3+Npx6Oe0P
 4OAIaXaprrHHReVfOcQbZGARBM5ituBpQvzeYe8SZRM01LYDRAeANdx+o3hzFaTlt3u5gLclFNq
 75cYTbxbjSMunbeoRogUJ9fypfCbHjw2WV/F+sRL+cnIkYB540cEvFVAbITG/J8y0mqhOauEZ5n
 H5SfRtv4qxde1d74oQ+zkWpgbbaDI7wP4tPOQ==
X-Received: by 2002:a05:600c:3b01:b0:49c:ffab:551f with SMTP id
 5b1f17b1804b1-4a1680ed179mr63973645e9.22.1791116871872; 
 Sun, 04 Oct 2026 05:27:51 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:51 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 13/30] hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
Date: Sun,  4 Oct 2026 14:26:29 +0200
Message-ID: <20261004122647.3913-14-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32f.google.com
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
index 34f302f83c..f29443948e 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -66,7 +66,7 @@ static void sabrelite_init(MachineState *machine)
                                  OBJECT(s->canbus[i]), &error_fatal);
     }
 
-    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_MMDC_ADDR,
                                 machine->ram);
-- 
2.56.0


