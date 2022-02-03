Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1876300lfk;
        Thu, 3 Feb 2022 06:14:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu8Rk5jOm/GoVPSxHUTCGdNJ4aPf5YUROQ0iWbFyQmQ6yh3qlfUsLyOdfzT/6Zud+yq8QM
X-Received: by 2002:a25:9746:: with SMTP id h6mr34980830ybo.389.1643897644407;
        Thu, 03 Feb 2022 06:14:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643897644; cv=none;
        d=google.com; s=arc-20160816;
        b=M723xKBChCNXnZjU3tlrVr9L+q4YijRavuJYR7srKad3GcoYbSUTXmA4K+J1jrIjY+
         4YjzUP73GInwHu1uU+CHFs7tGQGrH/yUB1WiysplJNrDUeR1KN8zjpn1r1ffLenKE5oz
         n0W+T0jhbYCU19j776JWgFPXkopjUi1kR8BFw+r+ZfRkRFQqqqIsVgUh21v5kwf0Ybgt
         aqgrNVFRbUpkr+Ni1aE+hOJlCbR2gtvi0N+kvtopUaNYy0KwlwiVkSBF083g6Njcoo9r
         FtoY02ZAq7cjLZTK7H02V2nSBdyTBIh6/PpGQ0l8Qt2bQgwDOJPUOJ9oxEprnqcAF6rN
         mMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NQupA5Y18UtYDXxrSHsWoqHw/Jxb7tl2Kdbr+7k1aW8=;
        b=d9W7wGirLwVaTx1miV4USWakkIpDDnnBBAwA9p8NytRV72x06bGr2WU1T88FydbuXP
         kInGdaGZlHSrHV0tLSMd6V0MC1BK3SSNPOqAXpx95wP1vCVuMfOKmrkfr49XfeV7RowS
         KSpAcMZbrNK2W316Df7UMTgDS6evSNFioXRew/TlBkJI7vJvtX2QAHCIv1LNcV0u9f4a
         UISkluyY5veDUrnzgz5MVNxe8jEyI6TwKuM8jWqOU5KiDTwTPw+dv0+7K8vwOoIo3f90
         TDQGwn7hZ8u0y/GPInOIQsaQTztB/nWtAzoy6ROOLtaEaP3GVmvzooaXy9HcdHAOdFxE
         ys4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=fueQlx1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b188si691005ywa.500.2022.02.03.06.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Feb 2022 06:14:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=fueQlx1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nFcs5-0003ms-72
	for alex.bennee@linaro.org; Thu, 03 Feb 2022 09:14:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgI-0005MR-GE; Thu, 03 Feb 2022 09:01:50 -0500
Received: from [2a00:1450:4864:20::131] (port=43895
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgG-0000Rq-Si; Thu, 03 Feb 2022 09:01:50 -0500
Received: by mail-lf1-x131.google.com with SMTP id u6so6129139lfm.10;
 Thu, 03 Feb 2022 06:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQupA5Y18UtYDXxrSHsWoqHw/Jxb7tl2Kdbr+7k1aW8=;
 b=fueQlx1ujU6D/rtLYjXQPYt1dQ8CLjjTcCxrCJG0dPkrS5jKXlwa7G/nF4ILJfiUQ4
 UaW/nVdPm9DoKESla/YOkK2DBjFSPYuyL6LdG/IeEJqhGBEecOv/u5qzpUiHQKqRgDLp
 My7wAjP64mJy8HEh3L0urA2+UZrwNpDj0r3qdSULupL5d9s5CHJWZNw7O8Ln6w7226gU
 s01X34Pf1qYqdP5n8rsVGm0b/wcEWjDKgxhqluzUwzq0lv+sixYzB0R2GDr35e5f4UZO
 vs0G4c/U1BmTAD43Tx3y2tElUmDH6yqNTSUfbAyiK+0hjMlougoMAX/KG1Ai4HsoXJel
 PF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQupA5Y18UtYDXxrSHsWoqHw/Jxb7tl2Kdbr+7k1aW8=;
 b=r5yWgv9IY60+FpzNpLY75EN0JyJmPGxdZS0aTKe4J1DBIdWwuTXodqrW3qSu4GEefc
 HoL4OpNXVy/NBFhyU1RT7oac1FHsrMvB1ch6Sjketpiqn0xr8Pwzv696Elk5fbsAawyq
 R3WAmNPnM9ttubpTBOcNXwAnUzoSlcA4mWLcEqlkN/+WH+PFXGY9QjkQd41rAPlzDAon
 1bVca2kY+2vDgjBUeKVoj/+ZgUTcoXSBP8muVVNYrwrO8Pc+4nKnP2KhjlSjoITbasZO
 qWeJyCPwnp9tA6VmmMlcRrQw41CXcdWHJ3WHTz9+Q5KQqh1cURd7bmpjylcw7gZ6la+1
 RQuA==
X-Gm-Message-State: AOAM531r/JbYc8NU3SVHi3GTIQS04gJONog0prGOfQwDuGugsPQYjTPb
 43TvXVQbr1TfeT54uTFZ4wj619h6T/Q+6g==
X-Received: by 2002:ac2:4304:: with SMTP id l4mr27635248lfh.304.1643896906742; 
 Thu, 03 Feb 2022 06:01:46 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id u26sm2583661lfi.307.2022.02.03.06.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 06:01:46 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
Date: Thu,  3 Feb 2022 15:01:39 +0100
Message-Id: <20220203140141.310870-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203140141.310870-1-edgar.iglesias@gmail.com>
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YOuxsHRF8E72

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP CRF - Clock Reset FPD device.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 99ceb8a609..d5a3ad3df2 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -38,6 +38,7 @@
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
+#include "hw/misc/xlnx-zynqmp-crf.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -122,6 +123,7 @@ struct XlnxZynqMPState {
     XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
+    XlnxZynqMPCRF crf;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3dae51a786..9f433ee5d8 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -51,6 +51,9 @@
 #define QSPI_IRQ            15
 #define QSPI_DMA_ADDR       0xff0f0800
 
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
@@ -683,6 +698,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-- 
2.25.1

