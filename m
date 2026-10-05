Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED46CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:22:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfoo-0003pz-I6; Mon, 05 Oct 2026 06:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmQ-0002Hd-6q
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:51 -0400
Received: from mail-wr2-x16.google.com ([2a00:1450:4864:30::16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmN-0000yc-MK
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:45 -0400
Received: by mail-wr2-x16.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so813253f8f.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195522; x=1791800322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5BgOm8ABXH25gZPPmMC7stVsyb70VMWWrYYHJ+SXr/o=;
 b=KAP2agGMRaCDUWNdcGCRpJajP7BpDeSTVFQpx0wPY+UZiMy/kWjrZ2Sytrn/MnuV87
 hyqQyr0Copko6WQ0kzlfd/fGuvTMtAxGl++qeKCdc0dwQzUDMz9ApRUAW1/U1IjiLJIk
 tWELSnYPSopzttPVAmtiosArHKFCFtAXrROQl1Pj6Hyha1/883biW24ewwG5pFKEZjmB
 0Xy83X5UZMtlHAWhIK8A42O7vizFnSKwoQVZ+s1OrLy/VX+Vp1vsTIod4x91igv23Eik
 HaH2miEY9KBvZ933zHBUvG3SO5JpTefd9DxJP1kIe4hW2Lh98NT7qsgQ0/YuOZidC3VG
 9hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195522; x=1791800322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5BgOm8ABXH25gZPPmMC7stVsyb70VMWWrYYHJ+SXr/o=;
 b=BtwkwzSIPe2fiM7SQ4EtPaUE5p7Rjor9v2g7P7uOKpzctK1HeZDYSh8tAxjItwKZxB
 I12xQ6WNx61IYe2Iay3ZtR1Kdlv72t51mer+3RmfkqBnRv4iDxJWZ2oKoDVY20eCy5xS
 UZ1kTTg3HpeTbWGiHo3FJHJqr4XurjtGOSemDGMK+NtP+WMKSrgCCn57hJxQ+5kyWNuo
 eznMw4V4wqVQzbGyy+LVuUZgUnnXWDYFbfQ/WaDcx9cGLHBxCqKD33ou2D4GQTfw5gC0
 NHJTxwxdEmeeiu9CazF6b+sFPgT/UbuUp9QwbFE7tCz9Lpw5kkEPGKKAPVEb0gcQTUtq
 Y7ig==
X-Forwarded-Encrypted: i=1;
 AKwUvBxC/F8P7wORgSv0W39A/X/zzh0+kj2GkvEsV2Jcj9Ver1oNq+E8C1PIsrNMdSeFk2dgXr2sRjYmqg==@nongnu.org
X-Gm-Message-State: AFq9FYKh4KnfFeK9UkXPTYuPBH1M7E60yYeXfdPe+cXB1TL6lWVHxEnW
 C/OcUgFTaY1sTz9MLjTGhSnPVz2qivMu7knjTdE6aYWTwZWkDdZkAtwN
X-Gm-Gg: AYBFou0xZB0/eyQcFnUlj4dkeZOK/JoFCwa5kfmSmfrm+d08dyl9MLBJ70iPIwFd+7h
 j3AZu+WK8JmM1cDqip1WXx3WTs7e0S0ELeGcCRB3f1wwv58iu09OUQZYHDxBPveAX/qN4YSLKYJ
 bWgteXFAlTCV2KUY5tAr8VrLDSD2sKFCr9HRfcVhc2aVfDROtnM0DafxYAguOFsyX7JacB8vYYM
 oxbeE93QHgrHkYv1vM2GVCBZryT0a82jKKKv31M3kc8MEcQkXgRtp79Qndqa4V/YWemm3LPs6bz
 O4jg2/ZvFV8RxrFy69FDtdKp9KCSPlZXK+OHzjdosq6R+UbWXXZcLPr0CmoM7cHg6MXi0al4CGS
 qptQ+NBFusNh/3Nq5Z26qc3mq5EDq05Q8pN6dNeCSP0RnyEUnsBihUGV+6RwaPj13JDX8tXgIDc
 bteA8b8o2DzOl3mMqn7h4zI0II9Pk6bc32fqtf/Makn/OClx+HLjnxnSDW2GLOB+cEcyYAls4Uy
 cm3I3cXhLERv/yb14ly89IqaWAfMQvzoPvCsj4CdHRc/sG0
X-Received: by 2002:a05:6000:200f:b0:488:7dbc:893f with SMTP id
 ffacd0b85a97d-48c424de020mr17774914f8f.55.1791195521836; 
 Mon, 05 Oct 2026 03:18:41 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:41 -0700 (PDT)
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
Subject: [PATCH v3 14/31] hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
Date: Mon,  5 Oct 2026 12:17:41 +0200
Message-ID: <20261005101800.10821-15-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::16;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x16.google.com
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


