Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp111943lfo;
        Wed, 16 Mar 2022 09:52:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuoYNGPLjaEHJH4xeMEL+Ghw0AZjcds1rCy5iecFZOrdwpKpa/TGT0TlV/yFt+6J9ceu3x
X-Received: by 2002:a25:7407:0:b0:628:97bf:39e5 with SMTP id p7-20020a257407000000b0062897bf39e5mr756989ybc.597.1647449533350;
        Wed, 16 Mar 2022 09:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647449533; cv=none;
        d=google.com; s=arc-20160816;
        b=rVeZ+lmnztle1t5FSMNVStWnYhz894HMpFhiZeSBt/KjrL7wgnkYIYOgY10tb/H6BQ
         pOBWP/2EGv0HEediwausW8eIafNBuhFpnfSmuC6iDjI0YkZXyPVGTCCQ7KU6hviBKycx
         8CYGE8Dtl+bm7dK29eOop50GOwYHo8Tsvqsg0lwsXnpLaWkhbyhzK3r6vA+vbVpKV7/a
         VEnt3xlj9iZg2v2Bv8FbGND8DUBxnPe9Rm/1EIEtm6ucCS733EtF3DMcBkfzb4qBh6s8
         4zGGTjdlbLeAT0uhGLLdTkMz6u53poPv4typJS2eFue1oP8HKVZfmAeCeECu7pk8PhSf
         7VWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vjSKlj2HOOuOlqZSJv+6qJArnYb8DSZASbB5gHvwpgE=;
        b=KoJJUZaDbimmrLChP0f6s+Pf2U/HxqnoYIPut2hVTDtK8rtFtlStKa352JzclgUEqm
         NgY6E/Pfma9/aycy0OkdBcOiv4ACV5vIZoQjWZcrcl9lEq8FBcT11Z5rcbkzTuYn6Ydy
         VcADoa9JCuAVz3wrpf0hrNnCU76ADNeExG4spzEsrBE0IoJysC9SqdHITM5hs7jeiylA
         0ZjD9ye99TzL2/89q+5XwMFTQm55E26RefiQ3FAtWzVpVzjFTIiqa/svPMKNH/m/THrd
         sqspJAXK2iSQHYIzYImiCz7mPPOIQksvMwNZDbkWg0ksdERXv7Cl13JBJeiScv0mf/oy
         nhpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=PHyqXRtx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a250b0e000000b006289ddd363dsi2595803ybl.540.2022.03.16.09.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Mar 2022 09:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=PHyqXRtx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUWse-0007ef-Q4
	for alex.bennee@linaro.org; Wed, 16 Mar 2022 12:52:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWna-0000B5-Hu; Wed, 16 Mar 2022 12:47:00 -0400
Received: from [2a00:1450:4864:20::136] (port=38768
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnV-0006El-DK; Wed, 16 Mar 2022 12:46:56 -0400
Received: by mail-lf1-x136.google.com with SMTP id w27so4726853lfa.5;
 Wed, 16 Mar 2022 09:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vjSKlj2HOOuOlqZSJv+6qJArnYb8DSZASbB5gHvwpgE=;
 b=PHyqXRtxEBxmv4V8ZBlGCCECD+j6AnVodXgvo/jG4iAao8bxQR9JcE7YhwvwXSSTia
 go5lch/72GT9MXOeJv6WDxwj5bFyYcrmYKa3D9iTjqqW9xQY8IuDhSJSiZZfkF9YH+/w
 gmBKOz5f4+z/V6OLqKsaqF7I5H7375nVZzC/q6R+66ewSbuwCd5mBqz2NQsFgE24VThv
 SmluJEaSt83vOhFw+YbJAw8XEdT2r59voK5LXSKTSJ5rSXmmB4JvxSqVYi7cN6WGcK2+
 q7HLQqSCb6ywcXTdHzx740T7T6P1BJx8gEhEjXDJlrYXFunJQNhI9OL0xvIDLOZ49mQS
 ti8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vjSKlj2HOOuOlqZSJv+6qJArnYb8DSZASbB5gHvwpgE=;
 b=BDqLCw3VzTsB4Oi52kYN1FPNVtYoIZVRN75lCqE0oW1wfG0mIRzRzCITbi6Ey7kK8G
 XTwL3WoxptgSlH8OoX80DBAIilrCMwC+kmU3F1HZXsS5n5uhR0wkArOEr6FtA5FWOegT
 XBomkfWvsjC97EbZKuc4KaNDJ86WaxBB4ASiUO8XfkoxknX2MqByY/cS3KaiwIURzAlF
 c2C2JghY5YmsalzD7kn3XXAZfhDyUoqvCILrmbtcGBVbw4NfJ+SSn03dnYmGmXnhSE/F
 PGgt5qavkr6BaKNLjPc72YXf78PxHRKe6zFgoesZFZqME+7YJ1o59zj480NzXlcjdeRx
 EvAA==
X-Gm-Message-State: AOAM532s7PL61AtLRHKH15XmMJeibFL5Gmt5Lg4ImgxMdHunuQuNWEL0
 Sa5+t65mRR1kVPrVRopDQxfrR360bpogqQ==
X-Received: by 2002:ac2:4c4c:0:b0:448:a156:504b with SMTP id
 o12-20020ac24c4c000000b00448a156504bmr291113lfk.99.1647449211353; 
 Wed, 16 Mar 2022 09:46:51 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 y18-20020ac24472000000b0044838266d69sm221175lfl.17.2022.03.16.09.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 09:46:50 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
Date: Wed, 16 Mar 2022 17:46:43 +0100
Message-Id: <20220316164645.2303510-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pIXUL06cRQnv

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP CRF - Clock Reset FPD device.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 0552ba18b4..7938f223a4 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -39,6 +39,7 @@
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
 #include "hw/or-irq.h"
+#include "hw/misc/xlnx-zynqmp-crf.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -124,6 +125,7 @@ struct XlnxZynqMPState {
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
     qemu_or_irq qspi_irq_orgate;
+    XlnxZynqMPCRF crf;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 47324cdc44..f4575eea7f 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -52,6 +52,9 @@
 #define QSPI_DMA_ADDR       0xff0f0800
 #define NUM_QSPI_IRQ_LINES  2
 
+#define CRF_ADDR            0xfd1a0000
+#define CRF_IRQ             120
+
 /* Serializer/Deserializer.  */
 #define SERDES_ADDR         0xfd400000
 #define SERDES_SIZE         0x20000
@@ -280,6 +283,18 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
 }
 
+static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child(OBJECT(s), "crf", &s->crf, TYPE_XLNX_ZYNQMP_CRF);
+    sbd = SYS_BUS_DEVICE(&s->crf);
+
+    sysbus_realize(sbd, &error_fatal);
+    sysbus_mmio_map(sbd, 0, CRF_ADDR);
+    sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
+}
+
 static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
 {
     static const struct UnimpInfo {
@@ -684,6 +699,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-- 
2.25.1

