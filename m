Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54357C982FD
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrn-0006M5-Oe; Mon, 21 Sep 2026 17:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrk-0006H2-Ip
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:00 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lri-0000IF-Tr
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:00 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e8185e037so19942945e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027267; x=1790632067; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UFJ7eXXZ5d7gsZxGK4KrSHs3EAiG0Yw71ndUgxHtfBE=;
 b=flatGhUrd6lEgx9RjQX429TfHQs1XhWsyuOEiNq+H9MRsNnkDMvIzQKlk8qQIRmCO+
 XycgM/1h/fwSLKLaMU6g3NZUkkSCkhik+8p8XbiNMvqYQ5rhtjFEfhMatOd55CdEWnBI
 XXFNVymw+FW6cA+IJSU6Lqi26Tp0dBplzjBBNGWmalYSpscEltjViEGMGJFF9jVWG0iP
 Yizl2b4OZ0hfBOj+oX6Zx9CX40jvanllQzt+JfQSUg2Bzk43STewzdvLiq8bcrrbeldk
 dLhCF+KCO8bLJuWJaebUwLCHAk+t+7/N+g1s5wF1y+rJ+u4AeqbrEJowj5L/c044jTla
 yISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027267; x=1790632067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UFJ7eXXZ5d7gsZxGK4KrSHs3EAiG0Yw71ndUgxHtfBE=;
 b=sN4WPfl/s+J6OYCNXgkX5LCn+th/CWfKwzblq7TRe/gtstZJWguFQKV7xaxzx5qhtm
 6n/GDDX1GhFG6O+ilsqjjXoiPbTH2a1uTOScdCh3kTAEKLpuquoRJAgYzkYuM2IXP9g7
 gTJqHZKdKLq/juCuLtvH0oZ1bs4b0G7rGKr6QIj0FfCsLfPb8JbDLezUeajZPftXEqKn
 LPRuZITJSwCUzXZWVKu9EEQwrK6JlB724k8vZwMtsVwvdMb3d/EqYdiWNJDHxzEXnU0z
 2q/Y9OOD02cEnM1qMStZ7u5EbCl8pNQZiCtqBD6/DJCB8EHaX7SzZiLM5r/nmxH4gR5U
 VIQQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzd4lNEKnGfdz1UKouZv5x2wlS6qI8wq2uqytthDoB1hKnuNj+FJOfn0g5k8uwdyVJuK9LpJTru2Q==@nongnu.org
X-Gm-Message-State: AFuF++kgtXqHdJYtnHX/OtrU6j50Occ3Qx+udHWlrFpjLcHMAsv0a4xE
 uK97quKGNJzz6DTWGyfmV+kWri+aLtvT5jNAPTDeevNhhdqlBU00TPVa
X-Gm-Gg: AYBFou0h6K5tPKYvUjb/nw7SW73OkVlLkHLmBE4dFmofwN1/WEwtTj78v+lp0V1q02G
 IbaxpqpOqb052OkMHGFdQ2qpfzadvm72lUgDVngj7e/02xMvY9q3OMmYcgCupGYxXAsIOeVB7TC
 AZH+wxTwa54y4t+X/iQh1Q6gzAsKCYnLvqqefHPdFvwxKn2Q9rIaBhJfUBBq6uMb3TujIhPTvNS
 W2KuxsxJ6DdbrRYuZgayLEOQw9i6DrTgEOJkd0WBbISxpAoYC88fNLHD/+Vw3rxpnyqaMex93ZY
 45sGy2LW3OjOq/DswhaRQhjW7/BxKe2evdWILvAf1gCEYaepfxPvJBhvMN7T3OLEcI38Ne+aRSe
 nCHGSI3tnFcX/Qy1o+ilQ52fSN2wBL2QnH4ibSrUe77HqjVBzKS9M4Jju+n4JLpQPZoSHm9+cKC
 Q0LoUXOh2c8zJeUNP491s6kB6sfNpaoUOkdqr2ZtM2/jn7QaSlgW8U1GBXF3XF91Z+uIpC9KQm2
 c3cSrVzWRbS5TgmzoHRoFpV1QnoDbGaMjS+FN4CHArfUelTgb1eR5Co/w4CzBCa207sKyCjNbPw
 +ww=
X-Received: by 2002:a05:600d:4449:10b0:49f:cc2a:f73a with SMTP id
 5b1f17b1804b1-49fcc2af743mr100432065e9.25.1790027267517; 
 Mon, 21 Sep 2026 14:47:47 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:46 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 15/42] hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE
Date: Mon, 21 Sep 2026 23:46:43 +0200
Message-ID: <20260921214710.29422-16-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 include/hw/arm/fsl-imx7.h | 5 ++---
 hw/arm/fsl-imx7.c         | 5 +----
 hw/arm/mcimx7d-sabre.c    | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index a573e0dd4f..945d8c5ad7 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -37,6 +37,7 @@
 #include "hw/pci-host/designware.h"
 #include "hw/usb/chipidea.h"
 #include "hw/core/or-irq.h"
+#include "hw/core/sysbus.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
 #include "qemu/units.h"
@@ -64,10 +65,8 @@ enum FslIMX7Configuration {
 };
 
 struct FslIMX7State {
-    /*< private >*/
-    DeviceState    parent_obj;
+    SysBusDevice   parent_obj;
 
-    /*< public >*/
     ARMCPU             cpu[FSL_IMX7_NUM_CPUS];
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX7_NUM_GPTS];
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 2defa498d3..fc5d0efe06 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -753,15 +753,12 @@ static void fsl_imx7_class_init(ObjectClass *oc, const void *data)
 
     device_class_set_props(dc, fsl_imx7_properties);
     dc->realize = fsl_imx7_realize;
-
-    /* Reason: Uses serial_hds and nd_table in realize() directly */
-    dc->user_creatable = false;
     dc->desc = "i.MX7 SOC";
 }
 
 static const TypeInfo fsl_imx7_type_info = {
     .name = TYPE_FSL_IMX7,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(FslIMX7State),
     .instance_init = fsl_imx7_init,
     .class_init = fsl_imx7_class_init,
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 8905bf0016..c0fefbf3b9 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -52,7 +52,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
     object_property_set_bool(OBJECT(s), "fec2-phy-connected", false,
                              &error_fatal);
-    qdev_realize(DEVICE(s), NULL, &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX7_MMDC_ADDR,
                                 machine->ram);
-- 
2.55.0


