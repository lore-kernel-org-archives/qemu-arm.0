Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2B2CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:21:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfp9-00056I-Hg; Mon, 05 Oct 2026 06:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmT-0002Ho-7d
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:57 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmO-0000yy-Gx
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:47 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6351831so738948f8f.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195523; x=1791800323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tmb1LvWJuEGSfnKPDPWmN7ZvXQwtZpUegBkNdwPgjrQ=;
 b=p7tdAntrH1n2NZd2+zirTjw7CMLf4J//m/B0nz/v1cjnW0iMEmbm2c6FOp7JVIuO/F
 HnQuZxKjmqjLSwxdAoBLuqMv5cIYfL31YWShgo0nkih/7qqVldUCNor5/wmh/+4ygskS
 PTJmnCURghOU+bjD3txf6wbCNbrjaOeiKYSnsx8QXw03sNEpGurI9QYYeeSVRUYwGYIq
 5TP7Ohs3JKsc+0Jke5jYkKG5NS4RaqzkvO2QLXgWjzcRLDyutnYg6ctONL4zEOXDpVPg
 lNnHIsNGVqrO/BMsUv+JqwoR+0jHIJNIQh3kbrSguaiiGa/HIsYxhGJ46Ul2r3b7FYvI
 KaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195523; x=1791800323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tmb1LvWJuEGSfnKPDPWmN7ZvXQwtZpUegBkNdwPgjrQ=;
 b=Zv/dWFpu4ygHnaH3jnBEZCaiqyDWkfrNm0s2ksuxISoT/zpFdqFRq3Vkmd3XSygLus
 aXrHGb5V5C05KuhdbFTGX1dpT9oxQhYOeiq7BrdbvLQqR+4/cgjHTwxsRwbX81R5lrys
 WWwSai74ve7FfW4AmghjC7vnq8HGNAbtYeaHQJEL3eSYsHdO8YiC1ryF8VnBKnuegi4y
 37fSXxllKpIcWZ1g4WWPPWuvQ8qxO9V2jZa/NToRQKUZXNy0HNo2lRZPKuM5y1k029PU
 pe3dpURp8kccwxHYP1/lS+SCbzzIkRen4mb0FFkrULAmFZvaIcBag62En2/QDSjwhTv4
 rG1A==
X-Forwarded-Encrypted: i=1;
 AKwUvByLz4DyVwKtGsHeJ2XvkTSJ//uernt4E6EEYCxjL0VUpw8hXA3AEG0gfE54c8dwK5AD338Lu8y7cA==@nongnu.org
X-Gm-Message-State: AFq9FYLgmLnMWmUgtzXwx8e/C7GYUKjW2SELVVVYjU0+SqlNVeAc0QC2
 NubHwg+S+5jnTOAmKmlAnmTG455wM3k5fGJ/wIToxY7aTwWdWA8Az1gk
X-Gm-Gg: AYBFou1+rl+1VgerV+oMvgAxxFbBVQ1D9Qqu0ppiSYeWNZkMxK/xAGo6nVdXOSnfnz2
 hNTQ70Dfm7iMdRlkT4p/NHVRiZS5T/PKIvXj1KCvNUyoxFPF3zphG80VT6zPSQR+9ptjbn+rQ9o
 fnEJRjQzLpcSVsmMp0l9EeWkvMSX2D4DPgj2WLyJxxJ8D+kZA3WeJWYCx9ItsSdfRTV3qZT0oSD
 oZl8mJElnptjRi7BriOMo3z/0EiUJ8cRB3fDJHwjz6khfr2dsHHraLlBMRg4LhxTZ8MISVfQsUE
 q0MnrUzcAIwaeWqYmXVXP7BxxCHNJDjAy6vR/xbhQIJSDXvN3EUR7aWivc0BCHDf0PRU8DD3WvS
 /PXxd3WVniVXL96EG4wQLZOOXYtstNmtypFUbOfXZEZ0fMatonZdD3nA+XjSrKFLzmVBI6kNsVj
 VStRZYiLWYzDiv33PZhDJFkqhp8UkEvIsxgrY8fcUobK6XiLXTS56WoHQKZJEmJz4ADQZ+2A2IL
 sizIepK6zruKftIkmIWWMxr1zbNdmtpZxxtfQ==
X-Received: by 2002:a05:6000:46da:b0:487:342:d142 with SMTP id
 ffacd0b85a97d-48b1272d3d8mr13001796f8f.44.1791195523060; 
 Mon, 05 Oct 2026 03:18:43 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 15/31] hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
Date: Mon,  5 Oct 2026 12:17:42 +0200
Message-ID: <20261005101800.10821-16-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x10.google.com
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
 include/hw/arm/fsl-imx6ul.h | 5 ++---
 hw/arm/fsl-imx6ul.c         | 4 +---
 hw/arm/mcimx6ul-evk.c       | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 6205fe6b77..9ae0488990 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -18,6 +18,7 @@
 #define FSL_IMX6UL_H
 
 #include "hw/cpu/a15mpcore.h"
+#include "hw/core/sysbus.h"
 #include "hw/misc/imx6ul_ccm.h"
 #include "hw/misc/imx6_src.h"
 #include "hw/misc/imx7_snvs.h"
@@ -64,10 +65,8 @@ enum FslIMX6ULConfiguration {
 };
 
 struct FslIMX6ULState {
-    /*< private >*/
-    DeviceState    parent_obj;
+    SysBusDevice   parent_obj;
 
-    /*< public >*/
     ARMCPU             cpu;
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 1863558a0d..84451c9909 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -730,13 +730,11 @@ static void fsl_imx6ul_class_init(ObjectClass *oc, const void *data)
     device_class_set_props(dc, fsl_imx6ul_properties);
     dc->realize = fsl_imx6ul_realize;
     dc->desc = "i.MX6UL SOC";
-    /* Reason: Uses serial_hds and nd_table in realize() directly */
-    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx6ul_type_info = {
     .name = TYPE_FSL_IMX6UL,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(FslIMX6ULState),
     .instance_init = fsl_imx6ul_init,
     .class_init = fsl_imx6ul_class_init,
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 4964cb9345..53d221b4a9 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -44,7 +44,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     object_property_set_uint(OBJECT(s), "fec2-phy-num", 1, &error_fatal);
     object_property_set_bool(OBJECT(s), "fec1-phy-connected", false,
                              &error_fatal);
-    qdev_realize(DEVICE(s), NULL, &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_MMDC_ADDR,
                                 machine->ram);
-- 
2.56.0


