Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A4110ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:24:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bq-0006VH-OA; Fri, 27 Mar 2026 07:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bk-0006Q7-NC
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:17 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bi-0007qC-DF
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:15 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-486fb439299so18787225e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610233; x=1775215033; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPzosEGuwhk6i6RHzymnZDkK3KDFX6eGqZn4vO6SwyY=;
 b=mz0jMaK6KG6dpc+eABj71fbBfcWDfmkura4CKURzdMKBr7TiWcV/ROxzuTlzOLiGQw
 fslSCafzNIFoCJbEQ6o80jI1g557Isn6WL/8Lg/ZMDXFWPtlGS83nk9NSSSRmak6e+5F
 BCwnxLzBh+ZmMVaZdQrKexEKiFeF7VLRbllLegKR64JQ0fNS6r9mDhhotrHxgijyNPvz
 UXl2VhgiOqfD78L1q88e4ubf0i2NJfrt4E/ldsJkgtbiHhN+/CwOW0rwA+XHKX5tfJgR
 9RfgPGe1TmbDfT/bq8rkG4iMZkzuRh4GBzx251aYecaPLqG7mcnWrCON2q4CwCVDdljd
 qiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610233; x=1775215033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sPzosEGuwhk6i6RHzymnZDkK3KDFX6eGqZn4vO6SwyY=;
 b=PgkzCNUIunpEl44tor/3dknaqEPe76eiQgnmZu9UAsrHWvxDpQR1+33wtmD0N5eonK
 mKX9a08h1jgQCbFYPR3xVhg5Ni8B9t/HSLK6FljY8rMaSCW6rxtXOiiQrm+DyqGrpVxO
 XYODEZOFm2zC2CNM43TIuv4eKtyglr2EPFOGCT6sBKD6Sw/S7UnIlA3sIcGf9BGBD+vK
 +QuGauVch0rRHnSVcVEV179RkLhnrMOSLG0MotyRvWN+rgQ+L0M0a15ZqdrZe1HpK/Zd
 2SZSd0c3gpNAXXBNz36hPGxtHcB8FjgjaRXqqD4xceDWPztgHRi1fbpaO4p+pomnXUKE
 Ve9Q==
X-Gm-Message-State: AOJu0YzWd/X7XSgVOlMjYGVtr/ceTlDlieAP+iWt1+sRa9wkACYxs9zt
 zZTXPb0FPNcme5qaQK5PVtst375L34NVcWJyV9yTFcF21wtQHKj+s3y+BtB+FMO9BjppQ5KGkry
 Yso22e4s=
X-Gm-Gg: ATEYQzzaM4EDTr/26nsvryDA5Pq+WrLiyvANQOKgSPhYnq2G40pnoIdlK3JUa3ItdUA
 rO/hsrLmxBFTdOtAMEWiM8F3ey4/7nAUt5W03JyzXRFZIAzCRvTz1HhoNdU3RXQvvj2/EaW+53y
 vHDUG7vGoeXNUEAa/MySyTz89h7+WgmzJpKOmKA65qJG1Y08dFql5s6HcFxfgKapoC4h7Td+l6+
 dB3VlP+j7398y14GPuntYPwf8hwQPI8YzT9EvpTYSmwgIc5dKBwl5BebMn2985CumDxJvbJImwS
 fnAvr3nWapMCd8U/eF+oHH+t+N8ju3ECUpQ4Y9kfbGYzQJxBbSxcjqeh3nuVibhTWNgN04gRd0V
 8SSV1BZwOmzlXh9Jg9vrukfhKMYfOHSPYNbM+KHGr7+i0CgdO9snvNF+s4EUN4ujbtsHLQcJ+3u
 60uy5PwnOVxeZJ6bgGpF6d4GnfEtfpQne7/pCjPgoU7IQZJ5/HxjYYc5VyInexuDID0zH/0Xn9K
 ycB20VKvtZfHtVeCZnuf9HcEAkm94Y=
X-Received: by 2002:a05:600c:8b4b:b0:485:3fe6:21f5 with SMTP id
 5b1f17b1804b1-48727f0e5f8mr31326645e9.10.1774610232749; 
 Fri, 27 Mar 2026 04:17:12 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 11/65] hw/intc/arm_gicv5: Add link property for
 MemoryRegion for DMA
Date: Fri, 27 Mar 2026 11:16:06 +0000
Message-ID: <20260327111700.795099-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The GICv5 IRS keeps data structures in system memory.  (Notably, it
stores per-interrupt configuration information like the interrupt
priority and its active and pending state in an in-memory data
structure.) Add a link property so that the board or SoC can wire up
a MemoryRegion that we will do DMA to.  We name this property
"sysmem" to match the GICv3's equivalent property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5_common.c         | 8 ++++++++
 include/hw/intc/arm_gicv5_common.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index b58913b970..29cc96917e 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -122,6 +122,12 @@ static void gicv5_common_realize(DeviceState *dev, Error **errp)
                    cs->spi_base, cs->spi_irs_range, cs->spi_range);
         return;
     }
+    if (!cs->dma) {
+        error_setg(errp, "sysmem link property not set");
+        return;
+    }
+
+    address_space_init(&cs->dma_as, cs->dma, "gicv5-sysmem");
 
     trace_gicv5_common_realize(cs->irsid, cs->num_cpus,
                                cs->spi_base, cs->spi_irs_range, cs->spi_range);
@@ -137,6 +143,8 @@ static const Property arm_gicv5_common_properties[] = {
     DEFINE_PROP_UINT32("spi-base", GICv5Common, spi_base, 0),
     DEFINE_PROP_UINT32("spi-irs-range", GICv5Common, spi_irs_range,
                        GICV5_SPI_IRS_RANGE_NOT_SET),
+    DEFINE_PROP_LINK("sysmem", GICv5Common, dma, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
 };
 
 static void gicv5_common_class_init(ObjectClass *oc, const void *data)
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 906870e49f..900af53b0f 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -83,6 +83,10 @@ struct GICv5Common {
     uint32_t num_cpu_iaffids;
     uint32_t *cpu_iaffids;
 
+    /* MemoryRegion and AS to DMA to/from for in-memory data structures */
+    MemoryRegion *dma;
+    AddressSpace dma_as;
+
     uint32_t irsid;
     uint32_t spi_base;
     uint32_t spi_irs_range;
-- 
2.43.0


