Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AF8CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 07:51:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMR2-0000bJ-9A; Wed, 07 Oct 2026 03:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGD5-0001TB-Q3
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:13:07 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGCk-0003jF-6W
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:12:28 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6a601ba6870so5904898a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 18:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791335308; x=1791940108; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wmm7DGZqm4QJ3LuHhxoQfymIpreglajXFKpx721XcyM=;
 b=V191qqpKcHv/jDxEQ4/ltHqNVe2tXO8qQE5Ofo26/hBWk61ZZvKvCSrSymPWuZ7FVY
 xakntuFl8AaEHEweZFdh3YESMNa8+VVa6Z4qeE4U2XZBwHBmSHIDHM3H00rnMEUqqCu4
 at/ovMvbHfa5Gji9AtXXm0bqJPJXYyxoExqh99cMyuG5iAKI8t5UGV/9uaxlIBPvG+1m
 AeXr5OG+vahVnuIyaB6omlTe45IXySahXJnrcnDsPVs+Asnp/A6BhGFf5iVrCY0yYjto
 efbSayRtRTZaaECRyZqhBwDufLSKWn3d//YtyYGT89l1zG23cgFODP99OuhmXHfsSIlA
 uq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791335308; x=1791940108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wmm7DGZqm4QJ3LuHhxoQfymIpreglajXFKpx721XcyM=;
 b=eZc0WKe4mP0dv/wox3vq7dPChtDjqoaQFgj1JJQ5B7EbqugT8urGeHFUWo4Ut/ZxRL
 evYnAbGDztG9vIb8FdugcALhFGEyVlDaf9Z9kQgjkHjI8HXAGaXQzh7IHR5TfEHIuGcL
 dC8Uecug2GbiE03JQssktzAusSHg8H3zroKOFRfRnEibGxJnMT5a+wHweNxbd5RLiCFK
 fe6tE983AZofjxpLQ+b6pGix/ec5h89O+pRLasPy0FPV+UehRI/AGJlZ40qQOPahZEXp
 FT5eRjKDAoUhgECs1eBnh1iMJSsesPX35fjttW6IZpCv9Rupk9K17CZnpQy21Z3PvT2q
 JgJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzM6QpTllmxtfJZdOHU5o1T79FenW8D4YklzWPEv7SkmD+GCqIyDVYEjDNfyyptbt9mO1+QLAiI0A==@nongnu.org
X-Gm-Message-State: AFq9FYKi3PKPMpuBMtn7zWcEZYXlaihtUuEijQZCHYM46VOp+4R1gwj9
 hBkI02PX6qnR0QpCwdYFLKiPnVltgMSA5TGdeZ+DoO/JGf4KCiondoHMDSmkjA==
X-Gm-Gg: AYBFou0FELrAXWF2X4PchPnE5xIjQARMEG1S4kYNCdtHwClrt1DdgVQP7h8xoNrKrCx
 252iI47XWL4XV3dxKVglFP2LSgIUj4pMSgWtZfJkK12R6+1gPWQl7chq8nNX5ZbHOIu4JlB+4E6
 tWBWNYkK2cajogba/FQyA1mqTi+eLOLp+RKJgWwxCfSBBW8YUxtc2C8Jko1il9zEMaVKODpRyXN
 OxT2QErWol9NVaZMJ5TEZJTcra6VWllAB7SeH6pYeqt+xrtuwJmFYGPG9ez6KVoLlEJgRKMpcJL
 99Q0xIpE2VYy815lZpfOYsL2kdrnKtlS3fcmsYPO5ylexj6xgdBa2wJTN9O+i4QbFG6HKKUWF6y
 0GMKDV+3IEJqbM4BpFmaIfVcmYeKXEOFqmCNl23ziI8EYunZly/31nhvrqsvZz+DrhGuyUIHstk
 cO9xYD0dtrQE0dMK7ATemN7htmKpTYV4Nsl7vYVpbc6D/52sisq1HdQNU/CJtLBU04UmMW2lKoH
 Xv+bOyOk6iH9ULF0B8zoi5M1RRkXT5MENOKmg==
X-Received: by 2002:a5d:64e6:0:b0:48b:26c:8cc with SMTP id
 ffacd0b85a97d-48c47fd9eefmr18069961f8f.27.1791275739080; 
 Tue, 06 Oct 2026 01:35:39 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:38 -0700 (PDT)
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
Subject: [PATCH v4 16/31] hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE
Date: Tue,  6 Oct 2026 10:34:28 +0200
Message-ID: <20261006083445.30362-17-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 47744e66a4..55c23061b0 100644
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
2.56.0


