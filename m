Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4438366lfm;
        Mon, 27 Apr 2020 11:17:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypLKvGdJ8bOfYebIem/x9JlTKMVFct5MHwcptJidoyUqtZOqPgCOkqhm6+3WrqAMsHVZdHAa
X-Received: by 2002:ac8:4e45:: with SMTP id e5mr24610923qtw.101.1588011458992;
        Mon, 27 Apr 2020 11:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588011458; cv=none;
        d=google.com; s=arc-20160816;
        b=t5+mcOCeLt6ANkYsMqM5phQNhfCj19IOmimZO/Z61abDpd79uEo1p8etgw+0yt2V5s
         0+H4t9UbPXdfyihRxPPf1209WLm/80M3WtnppK7S7EXXtRQru3q4poL71dPmA+sWnpsC
         h70CMkkPm2xLDww/Ko0iizNzpmC+FBHjl84Mjfcy5hY2uSgYmHUBUGlSdGT6QHYGiQAr
         vAb0CnrjcdytM61Pxp08Ri2UeFJnpaEI4lzUON7mgZuMIks8zfjiGTc0vdkV9W1OI6wV
         GOOPxFTMFlsxtdbS1BiSA2gYSg+CD57NOR2w8Tg/8HTBrwO5+JQTITBgukHk1VeUJfBN
         VbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GPC7muRhlUGu2WX8H12OYbV9Y7LEMhxX59INi0Q7t54=;
        b=mUQyvVoXwsluzbnZ/yjVgHElnlHraHsInskWKmB43R0ueUnhmcrYBhR6uJXn4dffZm
         PnCY8ZT8Us+jQok10ndqO4JV9E8C7Bx+vTi9R4L7NJv/Qxc4A87V6A4O9oIcgrxFx0X3
         sgCkJ5nkqAJe3RUyrqaapZULxeD31OlfShopeIW+OPgQdT8txxqH3v2EhxW+W/YUGUQN
         NKZpzN96f5kkQx92zHBk+aFH/Ml6AeJZ5omRhd4JldtZ5lj20miR96fZ6/z8PWWCWjSi
         Le+27xUc2zZBB6V3gPOHBBndNSYmzM2I0xScR5r2nKBE9p9A4IrVDARFGyOTe7nLRCRN
         05vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U9kYsAVV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si9417769qko.291.2020.04.27.11.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 11:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U9kYsAVV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT8K2-0000t3-9M
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 14:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JS-0000HN-Rz
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 14:17:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JS-0005Mg-El
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 14:17:02 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jT8JQ-0005Hx-S4; Mon, 27 Apr 2020 14:17:00 -0400
Received: by mail-lj1-x243.google.com with SMTP id y4so18658652ljn.7;
 Mon, 27 Apr 2020 11:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPC7muRhlUGu2WX8H12OYbV9Y7LEMhxX59INi0Q7t54=;
 b=U9kYsAVVwzkiI1exgIr0cy8osthl3OdGielMlmp0Vht9kBiTJugNpsF7HJCJFwdWR5
 rfSAXPrDafPlelWD8B6Ho1u24R9HBM575eTV0aOlFZZO5e0b1OMLMM4BNnWFm5yfvZVM
 NF0jksQEgMdmUoiX93nP5hx7XPZu5RafE7cF5cgAv8b3HcAhU+fHwpHMOSc3AxRlQCAc
 Xu+g14ilWTXaq2XBkYumAQK9COn6Upp/rWZciZQTezpz8fTRv8YAgExIRzM67uLzuFmV
 DRtEMg+A4B31LDx5nEGRTgQdn7V4wwKgYPkyJt42Oy5hZqGHv/E+bJ1sCGuJ/9G4Mt/A
 50Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPC7muRhlUGu2WX8H12OYbV9Y7LEMhxX59INi0Q7t54=;
 b=ZXB19sUEdy1CXHSFEIesplEjxVz3mL4fS7VcIot9JE8hDk0tCzt36dTJe1P4pdy/ll
 n4M/NM8ApfFaC57/FDxnDP1IEQ92XS399lx+aRWrw1DtPNKVxPRQVdrjj6xeXO9OLNPJ
 yreX2asWsRJxfIDPPIuGRPkHj/DqFeJt8vCGknsn4RYluHMtVfUT/bgA930ncG6W8mmZ
 9E7c6s4uranhGC/D/CXpH1Dm5rTPeCvK0AtSJdf06K/LXT5shg9LGvFVrvmoipUofxav
 o/+bBR9TeYr8yTXTClQ4pv1IwMQYGR+RwfhHDQeRjBStroG6r0YiIVoOU7adi7HeKwx/
 OtnA==
X-Gm-Message-State: AGi0PuYt1YS7kXSRjWznKlWqyaLFLaTC57kwfUi5Qrrj2JSlhTNSl+ud
 Sq7aBHWNiUEFuyAEKv15fP3kkeLxHZc=
X-Received: by 2002:a2e:8999:: with SMTP id c25mr15312182lji.73.1588011418770; 
 Mon, 27 Apr 2020 11:16:58 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q19sm10470021ljj.84.2020.04.27.11.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 11:16:58 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/11] hw/arm: versal: Embedd the ADMAs into the SoC type
Date: Mon, 27 Apr 2020 20:16:44 +0200
Message-Id: <20200427181649.26851-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427181649.26851-1-edgar.iglesias@gmail.com>
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::243
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8BdI/759jmfp

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Embedd the ADMAs into the SoC type.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c         | 14 +++++++-------
 include/hw/arm/xlnx-versal.h |  3 ++-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index e424aa789e..ebd2dc51be 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -203,18 +203,18 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
         DeviceState *dev;
         MemoryRegion *mr;
 
-        dev = qdev_create(NULL, "xlnx.zdma");
-        s->lpd.iou.adma[i] = SYS_BUS_DEVICE(dev);
-        object_property_set_int(OBJECT(s->lpd.iou.adma[i]), 128, "bus-width",
-                                &error_abort);
-        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
+        sysbus_init_child_obj(OBJECT(s), name,
+                              &s->lpd.iou.adma[i], sizeof(s->lpd.iou.adma[i]),
+                              TYPE_XLNX_ZDMA);
+        dev = DEVICE(&s->lpd.iou.adma[i]);
+        object_property_set_int(OBJECT(dev), 128, "bus-width", &error_abort);
         qdev_init_nofail(dev);
 
-        mr = sysbus_mmio_get_region(s->lpd.iou.adma[i], 0);
+        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
         memory_region_add_subregion(&s->mr_ps,
                                     MM_ADMA_CH0 + i * MM_ADMA_CH0_SIZE, mr);
 
-        sysbus_connect_irq(s->lpd.iou.adma[i], 0, pic[VERSAL_ADMA_IRQ_0 + i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[VERSAL_ADMA_IRQ_0 + i]);
         g_free(name);
     }
 }
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 01da736a5b..94b7826fd4 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -16,6 +16,7 @@
 #include "hw/arm/boot.h"
 #include "hw/intc/arm_gicv3.h"
 #include "hw/char/pl011.h"
+#include "hw/dma/xlnx-zdma.h"
 #include "hw/net/cadence_gem.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
@@ -53,7 +54,7 @@ typedef struct Versal {
         struct {
             PL011State uart[XLNX_VERSAL_NR_UARTS];
             CadenceGEMState gem[XLNX_VERSAL_NR_GEMS];
-            SysBusDevice *adma[XLNX_VERSAL_NR_ADMAS];
+            XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
         } iou;
     } lpd;
 
-- 
2.20.1

