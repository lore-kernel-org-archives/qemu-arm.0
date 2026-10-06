Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DBCCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 04:47:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEJYS-0006OC-4a; Wed, 07 Oct 2026 00:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFm5-0005hd-3O
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:45:18 -0400
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFls-0006TX-9N
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:44:40 -0400
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c2e5e801487so178508966b.3
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 17:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791333615; x=1791938415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n+X9R9jlN+7vQGOVgR1i+/9dNr+MHCZvV0d0XgyV1TY=;
 b=XcZC1kTPvl67D2JNQS2RRSBQLjImZjMMbem9C3vWa3alGsdZElg/KPGdftXeFfXu4R
 LXfbWnuA/a11s/W88K08/zoYVMRqilj/vzcnofBEtYAola6BAGkh643meRUHRmZ/hqqU
 lnsIgD7wyu/2Sj+IcvtYSa+63T6Kf8PLcnoF+rMfiDxIw0h80NTSFrVB/Qp0bsvFl6We
 huovlr5FN4zIgq2fRMkeWyBDfRXQqye7zWEaE24mfARnaG1hxgRLDDEhznKhOkgj88J4
 u8/t24usSCsTjIj5iDXCAPuKSlNvVBUqw4I1WLrfDHpqcmdhG3oh+iwiIWih/oYpTxwY
 hNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791333615; x=1791938415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=n+X9R9jlN+7vQGOVgR1i+/9dNr+MHCZvV0d0XgyV1TY=;
 b=kc0eahEcZOLK+jWh64LQrK/1nG3l/685Cdz/zb2hWpO7igBurCdszNyNAhmNM2Irfk
 2BcZpsNVmKkbazfuwFAuNvRil9Ce9rAFzvjf2Yz4MnoLAplBSK17Wcs7GaGd6d/jFA+P
 wWHc+LQaZHYm1lf/orenq+B+vr+QsOOyH5M2ikA5j+OLpKLzOqXXUyeb8FSmNg2oWfCI
 lTftRd4gZGURWWL/mLptz6fLP7ZnFhaB9LlUuhLlHcuP/7YkNryDTssgchrr+62/dbUh
 EMdrFXeSW7Y5zS9kq9rauzMCTRp6/HE8Hc12Ds9oAz+1wZovi16oQwzM1k0pTiolmF5B
 ZCew==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjzhbdYWptdhAPiw9qYFdHO7BAAAc6pExFQ6OrSp4bKCkRzTBAB9w6dWOQepM7gsf+9VY9VbtkCQ==@nongnu.org
X-Gm-Message-State: AFq9FYISGMqUTutHb/h7QatWZOo0hQCknIaAGb1Bs4hEm64Y1c9x71CA
 vGSEcAhKhJOojm/iTVcPIoTUcPRzlqyoET/4dpLE6PJWRcm8M7WZpoDdCzIDhA==
X-Gm-Gg: AYBFou3pvl8uyf8vX9EZ094Ye2JO2riGiYFWJ1q5xTuK9sXPY9I9wiaRf0BvwjjMWEz
 iBUyWfKKyTt8yhMgQvrZpVxtScOpeTlhYc6q3lz/VcbEDb2Cn5IEa/daGNSCjFJmHjz3P9G+pH1
 Tu/El7WW+k/zghDY1VMuz9v7nxdLj0ihARma8CziJzAaPuBkGXZ5Zc7HJWkhU2naIDujDQgACuE
 onskJqcjuTf4nZfFjneEatKHHI9LLlV82kLLJbzX7VPItzADR7paJq2xRcaHW74Hq9N3CLrt8/z
 OWlmR1AS1Pdwtu6kZMTycuIfhYfE+/hp9OrqXS5xL5Y97uZCc6xHcADGzeEV9znJ3kupyaola+I
 upmN+1C7y4agZiSQ9qU8QA50a9npGu1WeX94sKAOr0yk7ODmNnjo8ks9wE0UucNGL22Nf9W8CtC
 PKpdHp5JGIV2RJh5mhOanYnCetcIJZeFeKeS36Af1dPB3woiZD9D/WI+wCAllizFv0NNNrkl//j
 kmed5R/l90pwu5WQCendbzEbawC5QdFkLrYJow=
X-Received: by 2002:a05:6000:4b02:b0:48b:451:4f19 with SMTP id
 ffacd0b85a97d-48c6d1ad0a5mr1051712f8f.51.1791275735359; 
 Tue, 06 Oct 2026 01:35:35 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:34 -0700 (PDT)
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
Subject: [PATCH v4 13/31] hw/arm/fsl-imx31: Derive from TYPE_SYS_BUS_DEVICE
Date: Tue,  6 Oct 2026 10:34:25 +0200
Message-ID: <20261006083445.30362-14-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.43; envelope-from=shentey@gmail.com;
 helo=mail-ej1-f43.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
 include/hw/arm/fsl-imx31.h | 5 ++---
 hw/arm/fsl-imx31.c         | 7 +------
 hw/arm/kzm.c               | 2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index 41232a2237..ea916de15a 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -25,6 +25,7 @@
 #include "hw/i2c/imx_i2c.h"
 #include "hw/gpio/imx_gpio.h"
 #include "hw/watchdog/wdt_imx2.h"
+#include "hw/core/sysbus.h"
 #include "system/memory.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -38,10 +39,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslIMX31State, FSL_IMX31)
 #define FSL_IMX31_NUM_GPIOS 3
 
 struct FslIMX31State {
-    /*< private >*/
-    DeviceState parent_obj;
+    SysBusDevice parent_obj;
 
-    /*< public >*/
     ARMCPU         cpu;
     IMXAVICState   avic;
     IMX31CCMState  ccm;
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 190f863355..dd929c1085 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -224,16 +224,11 @@ static void fsl_imx31_class_init(ObjectClass *oc, const void *data)
 
     dc->realize = fsl_imx31_realize;
     dc->desc = "i.MX31 SOC";
-    /*
-     * Reason: uses serial_hds in realize and the kzm board does not
-     * support multiple CPUs
-     */
-    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx31_type_info = {
     .name = TYPE_FSL_IMX31,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(FslIMX31State),
     .instance_init = fsl_imx31_init,
     .class_init = fsl_imx31_class_init,
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 387bf54ced..e9cc53ce01 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -69,7 +69,7 @@ static void kzm_init(MachineState *machine)
 
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_FSL_IMX31);
 
-    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     /* Check the amount of memory is compatible with the SOC */
     if (machine->ram_size > (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE)) {
-- 
2.56.0


