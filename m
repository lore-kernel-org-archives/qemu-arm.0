Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBB8CA5FEC
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:30:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJv-0006b0-TX; Sun, 04 Oct 2026 08:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJs-0006YB-Mn
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:56 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJq-0007AE-V1
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:56 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso10944815e9.3
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116873; x=1791721673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/A2aLB/NsuF6ndY4MGK8Mfb+SUeVFKzE5c0+psCM4MU=;
 b=llAOT5LonVL4FeFqG9whdo3lPnRmFrBJV3oQCLce3Z33XKTVqPoYNf0YlO52dXK9KZ
 JpEJvUQ9EosMvodh5eHy1Ms5LGnYvHcRPAB3SczJ1BofuF8hYkiPFAkf7enriJLDpmFS
 ENM96gOxqeP90G5UwzPRVNP9kYEOc7zWnS678bjGElqn10ucU5Q92a90AlP7N0cvWxwh
 GJuDsYFEbiCL0lmv1D/7xDcLsgpmtc/csnYQTPuEPrKP0pv5aSXJ8ddc1r3RyzKMXu5F
 FaPu21JgH0e7j0JeRGDl3TCv5KZ2jJhsO7mD1/+PSkmKTxjCvyUTPD7EzQ+BnAGTarqk
 SctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116873; x=1791721673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/A2aLB/NsuF6ndY4MGK8Mfb+SUeVFKzE5c0+psCM4MU=;
 b=KqZYK+pOkXnNADR9T7djr/FgEX2W158qrpkz0SjHTdOkSuShFw+jU7VZY8mPVLE6VF
 FGo9GEvhB5Rgtu0C/xAbhz9BMi7A0knEVvfBtZEgVRnI3umT6JGjt7GjEsNWJKaPkzPG
 g3qWj3//pw3zDPp08Bkd0TXrLhnWGnpM5oARdgSbcax0ICS0oc3cZnQY9iGJhnGqrCVn
 NMN1KkSTkQL4CU+VNNiQjnxZWKAdB529eXoBEt4x+eHNkH/zEcO9C9V+l47dEvV7gPo2
 1ht/TWzPd9HdKd+zqVx2h/5pS/OF6got01bz/Q5h71MnBktyIuDtXvCvhOv4Jvp8dSOB
 RDgQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByd3wAL0h+Bv1ojDOOemMWaUX6TKlMKh8YVr4kaW5lT4VMsziUe7VrU/090tMcZlvAJGKY15tsrow==@nongnu.org
X-Gm-Message-State: AFuF++nMhwp2ERx5FiSMUEwHFZrdCNsBeS410fJ+f/umvy+IR/Plv2sj
 stmNFgxpKGCajd/Zp5UEsdwoSiaI8aJPu2mkjNjWBgzomsIJqI9UoFGF
X-Gm-Gg: AYBFou3QjfcHStudhQn/7/eunoaB54NX8S12ZJaLW7mNGH8aSfwE96egQ+rjN8138Wm
 wUpO8TAm934hg6mQapGPN9eGBSnvxkXJ9P+6B7+zNi9igOaVIzrFbs9cZOHfZZ/TpvBPHbKUtVx
 9aTPjCGJ4AAJcaWymTC696V2GvzSM4+gk7ZezzKSRON6OzlbiIPVWrxN3ztlRIVkC1+tUOnB4wV
 9r1D17mMqrFoOEE3ivetFKF5X0THmt7aAuZoXdDfhsH18+ElBNHpZUZTM2ZBA38tfencEWkAnV8
 gCdHWdBQvS2CgoV2Ip+GqeZh2dgo1CuNcxTZsnefMmymzkYFGAGfQ1qtYT7GJwTuvdt9hl/Vbtk
 kov4Q9T6yxHLQRVcUoy+PxUaZYvv86NwU9uklBGs0HxEMl16iuLPE2/Mj3BtKAm5vYRLiWaRWdc
 MBDO24Jmv+fZmJQo+5nJX8/gjGK9KceeyDM+xHtw2bM9pHsUIWqZTGJjHmKppomH2QgYqqh2Icc
 xtMmLgSbw4Cs8r6MY7z0ZTyIRHAqo1jOgDxcQ==
X-Received: by 2002:a05:600c:3103:b0:4a0:1efa:c746 with SMTP id
 5b1f17b1804b1-4a1680f61damr61400965e9.21.1791116873279; 
 Sun, 04 Oct 2026 05:27:53 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:52 -0700 (PDT)
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
Subject: [PATCH v2 14/30] hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
Date: Sun,  4 Oct 2026 14:26:30 +0200
Message-ID: <20261004122647.3913-15-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
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


