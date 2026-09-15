Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6712C88E7F
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6VbS-00086F-7X; Tue, 15 Sep 2026 12:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1x6VbP-0007re-LC
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:01:47 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1x6VbO-0003Vj-3U
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:01:47 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a605c198fdso6601704a12.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 09:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789488105; x=1790092905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QeOKPFEA582PfRWcIcHhtyxEQbe8HlQaK11TI65dVMU=;
 b=knsXiCAvWlS/nlWMcFwJ0/j0xewk/IYe50ameUaBqtA8BtF9YgLYbfFtdeRp+U9dkV
 1fybthndqhenqI9EluLzpb2raTPM657yQEM/cGWygaVSCCF/rzEKtdkHzRtDKekbAXmp
 Hb6UmHUNefpIo2BxhTfoBuvT1AWKj0Sb3nBQNzpoi09pSeaKtiRrKK/7wNst03CfCbI7
 ELKfrLd8SQBkaQ8NnG+Qi2xZUd0VQVGhbAWCicTdOA1V7zQYFfXifigOE7rPh0+ucZRc
 CppLAghN0RuEeyo1WuNPUwyx559OuFlAA46X1EUk4BlTCuAUjqRlEQ4MlI8SZokmEtCA
 ANDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789488105; x=1790092905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QeOKPFEA582PfRWcIcHhtyxEQbe8HlQaK11TI65dVMU=;
 b=15S/Ri3xRMlvByNK72rTpAI/4QhpenCgLkUflnSPtSLRabIi3fOvMujLRSmTCIDeGO
 yUZ3P9Go/eUauTQP61SGAOlM+kSG311wiNIsR3fm+HldsMTRv9LyTRNV1lnu/Ck67jah
 FmOHICSi13q0eAi6Y4SyeRQFpHogp4eSn1hPav/Yxrgub7a35vIToPs/t5n/I8DNd4qN
 9m48fKl+sd2KxLUL4xThOFl9pEXjVn7HQgyfziRWX7jZD0lV1U4+hy5jy/lVVw1H6vFI
 NIrebhcx7SPsUSkOjQ+b1NyWJnqSkQye3R0iJbUnD7EQj7TVf61mNL9CeL2jxl7dqTW+
 h6vw==
X-Gm-Message-State: AFuF++meFbLUuIVE94kVwfMf9juDu1gonah0JduGs/Lj9sDlCR3wG4RN
 LOBhSsIPZ4qeW0Fktx5GELwb8eqm5MK4stg5N5qgAcaDGD9OOKPkNAJR
X-Gm-Gg: AYBFou1rrDcNfEBI4Tct3eohxKkkbeuIl2LtAAb3RIXSEOSTz7U4RdZGT/hSt1ujGiA
 3jr+FasP56EHaHRUcIX91docyNs1kz967umQWb+t9aL6BG6yKh44D3IClmApW0K+bF3Nwxgeyfu
 QetOaRbwPkVyZa0Z930eYbxne3tzbLZmr1XnNLdoB1sFk70QV8F00BbMBuvQ/SkiPfzVcEQtAmv
 oOYhxu6zT0JmfbJZePocVvPPkSO/G60/La6rnj8vCHZripSuPqFEMTPOJLNfromRJTwNnhZ/X4A
 /aoCsKi8aJsikcbNFWKhDTNXS17w5yilMJvqtP8UY9gL0dJprlpWgOVmlzCj8LoyVDDQ+BgUU4g
 etFKj+k6bhCwZJJeuFMAY7a4G0pjpEHVAUieQk6JcGU6yfwCYULyoud1YaoJHE5p1aR3mWqe+Px
 6CHFayMn4nuIg1AhjBhOrPFG9fEyW6y8NlaOreWX7ASf/Vdy+I5JIroZzUvvmlj+gGTndeisi+H
 Qd/hYN0Y5SGstF6cWtrmWNC31rAF3Jh/gbQkM2A0buHGw==
X-Received: by 2002:a17:907:6d1f:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c29b84c9a48mr546735966b.3.1789488104484; 
 Tue, 15 Sep 2026 09:01:44 -0700 (PDT)
Received: from thinkpad-t470s.. (83-131-196-251.adsl.net.t-com.hr.
 [83.131.196.251]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-c29ddd86344sm3235866b.0.2026.09.15.09.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 09:01:43 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com,
 edgar.iglesias@gmail.com, berrange@redhat.com, eugene@nuvacore.ai,
 Ruslan_Ruslichenko@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v2 19/20] hw/core: Add FDT support to Remote Port GPIO
Date: Tue, 15 Sep 2026 18:00:43 +0200
Message-ID: <20260915160044.345788-20-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160044.345788-1-ruslichenko.r@gmail.com>
References: <20260915160044.345788-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ed2-x10.google.com
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Implement the FDTGenericIntc interface for the Remote
Port GPIO device.

This enables the device to be recognized as an interrupt
controller when instantiated via the fdt-generic framework.
It allows other devices defined in the Device Tree to connect
their interrupt lines to this GPIO controller using standard
FDT properties (e.g., 'interrupts' and 'interrupt-parent').

The implementation maps the interrupt specifier from the
Device Tree cells to the corresponding internal GPIO input
line based on the configured cell offset.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/remote-port-gpio.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/core/remote-port-gpio.c b/hw/core/remote-port-gpio.c
index 43a40315c5..af7f3c6075 100644
--- a/hw/core/remote-port-gpio.c
+++ b/hw/core/remote-port-gpio.c
@@ -20,6 +20,8 @@
 #include "hw/core/irq.h"
 #include "trace.h"
 
+#include "hw/core/fdt_generic_util.h"
+
 #include "hw/core/remote-port.h"
 #include "hw/core/remote-port-proto.h"
 #include "hw/core/remote-port-gpio.h"
@@ -157,14 +159,34 @@ static Property rp_properties[] = {
     DEFINE_PROP_BOOL("posted-updates", RemotePortGPIO, posted_updates, true),
 };
 
+static int rp_fdt_get_irq(FDTGenericIntc *obj, qemu_irq *irqs,
+                          uint32_t *cells, int ncells, int max,
+                          Error **errp)
+{
+    RemotePortGPIO *s = REMOTE_PORT_GPIO(obj);
+
+    if (cells[s->cell_offset_irq_num] >= s->num_gpios) {
+        error_setg(errp, "RP-GPIO was setup for %u interrupts: index %"
+                   PRIu32 " requested", s->num_gpios,
+                   cells[s->cell_offset_irq_num]);
+        return 0;
+    }
+
+    (*irqs) = qdev_get_gpio_in(DEVICE(obj), cells[s->cell_offset_irq_num]);
+    return 1;
+};
+
 static void rp_gpio_class_init(ObjectClass *oc, const void *data)
 {
     RemotePortDeviceClass *rpdc = REMOTE_PORT_DEVICE_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    FDTGenericIntcClass *fgic = FDT_GENERIC_INTC_CLASS(oc);
+
     rpdc->ops[RP_CMD_interrupt] = rp_gpio_interrupt;
     dc->legacy_reset = rp_gpio_reset;
     dc->realize = rp_gpio_realize;
     device_class_set_props_n(dc, rp_properties, ARRAY_SIZE(rp_properties));
+    fgic->get_irq = rp_fdt_get_irq;
 }
 
 static const TypeInfo rp_info = {
@@ -175,6 +197,7 @@ static const TypeInfo rp_info = {
     .class_init    = rp_gpio_class_init,
     .interfaces    = (InterfaceInfo[]) {
         { TYPE_REMOTE_PORT_DEVICE },
+        { TYPE_FDT_GENERIC_INTC },
         { },
     },
 };
-- 
2.43.0


