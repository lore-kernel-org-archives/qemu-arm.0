Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37A2CA5FFD
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:27:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfpI-0005Rw-1d; Mon, 05 Oct 2026 06:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmT-0002Hp-N7
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmP-0000zB-Hb
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so1242011f8f.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195524; x=1791800324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wmm7DGZqm4QJ3LuHhxoQfymIpreglajXFKpx721XcyM=;
 b=kAbKgiogKMPznYKAozbPXFSbA8euYmVfh7DhcVfVgaKVGCWCKgUQGOXPnIPXhriY+m
 Bkns7pbtTOS0W7hGE4fiZW8JiuMS5pJOB3Mnt+rTRktG0xW5WkoNoXDAMONhDi0mkxbJ
 LwxHOewasJ1yRIOv32kpmmgfHek0QW4kfvw5kmRkesUjeG7WHPjS7eK3CtwzLLkwz59d
 3GCv4+x6tRGjEJpdogHgl1uT8VhrqS1txxPS0jwceIbBIzMopu9pfppjnP/d3VUs8l2N
 FdUcwBVlUVO90P3lkfSLwIadFj7UkAAKLS4KDHejf9TyEm/zNy3jyuaQGCZEnba94ouI
 qiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195524; x=1791800324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wmm7DGZqm4QJ3LuHhxoQfymIpreglajXFKpx721XcyM=;
 b=KnifFDIFY+VXpYoIi3SJRXWANu/7WI/8eWsHMrifxZvy0+SJMrdDbaiyPV6dwgXSUJ
 57JzxRq9WSXHdujSk+RKE+r4edvtB+O/M9A75RMo6pnFWCcxPixzipaC/aHxK+ljMeC/
 /hEIrwIXOPIykmgqLIapKUWT1l63jXQRgsWf+ESy4cbiS9Q9d/ELaxzbKU939WxQb68o
 ScYe1fQTk6x6a2up9CVCkq1yfe5qw3g7UlqMbLjh3eoUO7APP/5YIsgqwESUiimIOdAg
 XQfqXHleHRF+s/fGvydCKMyvwKFWfw91urqd78DhbbYUiTkxrfbV8KugxoGdt7+4Prfj
 tk2w==
X-Forwarded-Encrypted: i=1;
 AKwUvBziogqx+p/sXXIOnrqVWAiUUnh0P/BwBsZ7KVgyK+1yvAzEde8YMSmZSoYD5x6KKBG7xErH3T57Kw==@nongnu.org
X-Gm-Message-State: AFq9FYJ0/BKXkxpXUXQ40K30H5Uq+tEqSmf8P1pUvq3eaZOpYBfYN7df
 /F+CwTjD5Rs8/+9MxY9Uop+AadSLpxncCtd4whhWL29o6fNLx3guEBRF
X-Gm-Gg: AYBFou1KUblLHkq6W5lXOxb0vsEGcWhAfvgvVJB7u5XO1vOjaNVpkCkrR3CkaC6AatW
 lFMiGEvc8TOCyF025LdIY//GOJsfP+US99OEIH2Ooi5zstnldpeIZNK5VNQsZ3QJvvq88o6MI/g
 KE0Y/7kC5k8XzZWB0dDnrFhKanPVhItFiVPcvQSi2BJUlqLDoAvw80+Gn+k+2dQ8zvGG5QMdzLS
 IlUfn95/V8H8T6FqbRiTQ8+/bD2nKUkNeTEAwKmJa1UtVfUqYtDDTocL1hEe95t5NxUNEPqOSP5
 gJQypyP9idz7OZntz+V4FDyJn5NA51im8Nyiqg8SoNw22CuyjYWKoBGsGDKI43JG8X8rsRueHAF
 DgOHoilpoIsH+kS+SezmFzCvLTxQwFjjEuElfPw8aJrjg6F3itiejBEf03WwG5L04ZDuEjabcak
 s4BjxCUbhoFsqZnpkVIpWbYTX4n9SPGdoCfiQhNciCKNo3BxZBU0troUkVGKAZ7W7F9W0ScPAXY
 taCB5HPFrcuA3+dv2onbYxtUL/tPW88X5c1Vg==
X-Received: by 2002:a05:6000:46cb:b0:48c:5358:f999 with SMTP id
 ffacd0b85a97d-48c5358fccfmr4615553f8f.37.1791195524082; 
 Mon, 05 Oct 2026 03:18:44 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:43 -0700 (PDT)
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
Subject: [PATCH v3 16/31] hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE
Date: Mon,  5 Oct 2026 12:17:43 +0200
Message-ID: <20261005101800.10821-17-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x435.google.com
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


