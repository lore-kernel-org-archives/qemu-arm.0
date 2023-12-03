Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2371520ejb;
        Sun, 3 Dec 2023 15:48:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuMtsGNSp1LDkWbb7wtfNWGqG2nPldp4OixqZ4QZZVTkCb51Wv4zFgUAGkwMSl/V06jGdB
X-Received: by 2002:a05:620a:190e:b0:77e:fba3:9383 with SMTP id bj14-20020a05620a190e00b0077efba39383mr4609808qkb.101.1701647292892;
        Sun, 03 Dec 2023 15:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647292; cv=none;
        d=google.com; s=arc-20160816;
        b=Fap9pecQFXOmRxhJtwZHmDz+VGT5kEjUC/wv8Dz7DdyCj3bJU3O6kFawyLdipZK07t
         JxmAQOFiIrS7gjKhFIFr7HNvI8Bx8glZK+Wvg+SIGN2aLQbswIr9Tbdwz0Mwp5JZBw5b
         IKZtzlo3uzRsoGzqyygLducSpssTEpWDLnZrloDgOngWWsTZ1Ak0qWw+uqdYFjC4ODTp
         vBLp5WEgqX6NxR2MenJ3l7pyjP4sI4fWf4nvcdFwDlNNXfR2ZUk1W1Dzn/NNvCtVXaIw
         uRZQkTZXrWEDqhg7PNjwdcFaq8YjS5Nq7cMszcIyNuy8PgBt/rzbiONsMD/2L6en9qvT
         yZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=MBpuBrOeDcuscD68cPT/KG0MeeXeAmHY9wcrvjYQX3YYhPF1juX9Whi43DxYrN9mHO
         K6d/qckXjPK8a7ydbSz2VoO80HzveAx8M8jukfUm7hUmiH21xItCdnOvU0sm/xQNuYG2
         SA8WHLX/64WqkjOmKsmqD+XFWfazMmmZkmZEGr6RJVUHP7xRsOGZJXd/6C/skj1A3opD
         VsEXU8cK0AKUjqZtfXTsO8a0+aUUC7m9xTfO47fG6baB+oSRc4Ruxe+5lh4c/QItu1hc
         wpnW85agHVQpab5UunYV2nJ7Q22H0rZk7wt4VnhvD3DTW8blo5/H0BuoqNllHKtdtlx4
         5TCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iTKoSINs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os41-20020a05620a812900b0077f01ebbf45si3253487qkn.465.2023.12.03.15.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iTKoSINs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9w6l-00075D-Qr; Sun, 03 Dec 2023 18:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6d-0006u2-Hk; Sun, 03 Dec 2023 18:42:35 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6b-0002kC-GN; Sun, 03 Dec 2023 18:42:35 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5c85e8fdd2dso42792937b3.2; 
 Sun, 03 Dec 2023 15:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646951; x=1702251751; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
 b=iTKoSINs9m2xIKArXNUQY7OT4n8sG5MIOE3eRGpDV/4mBNoGWEzf2vfvr/cqsbcMeL
 vPkShiY9cbeOnijbvu6HsbZ2RbXg+U1IMFZ2Yq7t/uY9rDRMWfaUmlh92OGtKnHWB5QZ
 QpxUVuzo48ccK2IFVjUbPb+wNDjc8hg8vn3QTUdbrAtzVtmbxZ5py6UBXpvqzZujHUig
 E35PnSl1Fcp6M5rsoCYuRE5LIToUBXE9K23H/XhAl0qJWDRcy4e9xOwa/8ZdwokJQjiB
 KoQwdAMthFXtde1cd8hSIEOUX18PNgCh1EH+90TxPZ5woxY4WaextO6kcmPzcnqgujnh
 TRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646951; x=1702251751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
 b=hKqtLwxZp7wdgcRp1Nsh+UWdoCOLVXVSsLnlophV8QD4aE+SEGCCQE7bSq4p7y6mYI
 AtdvI6wNxkXhVyCDEnFjAkbhoKmWjv67xx5j2AV5JqBHMAwTrHFpRHIwdPKuegOTs29T
 DFN1y8SDjIQtMoaMCPFIsNBxRULMNyIxE7j+bBqeUIyn8izL3gac5cdXN/yW7cC6yzE0
 rJSu7OG9ohWM4ayJbMiDW40hTxteThvi6P9uf4MCDg51wFtW7kkHXPj7bCPSeJX4VviR
 CoVFK7mpbywioSAaBmgUKCuTMV/CHB9iMBfnvMtSu3Ds/9TRhkSShfSFAn/WFgYyf9uU
 2WtA==
X-Gm-Message-State: AOJu0YzJ1gr5cpkly085upEkEzB4h29BOUTRgWXRX7Y1ao7xRP3C6uwJ
 zGz+epz81rYYTcmY0PE1XqF3/BhQfOyk5Q==
X-Received: by 2002:a05:690c:f85:b0:5d7:1940:dd60 with SMTP id
 df5-20020a05690c0f8500b005d71940dd60mr2083145ywb.54.1701646951333; 
 Sun, 03 Dec 2023 15:42:31 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:42:31 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 13/45] Add memory region for BCM2837 RPiVid ASB
Date: Sun,  3 Dec 2023 17:41:41 -0600
Message-Id: <20231203234213.1366214-14-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tlu8mqszShsC

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 3 +++
 include/hw/arm/bcm2838_peripherals.h | 3 ++-
 include/hw/arm/raspi_platform.h      | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 196fb890a2..d3b42cf25b 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -182,6 +182,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
 
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
+
+    /* BCM2838 RPiVid ASB must be mapped to prevent kernel crash */
+    create_unimp(s_base, &s->asb, "bcm2838-asb", RPI4B_ASB_OFFSET, 0x24);
 }
 
 static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 0a87645e01..af085934c9 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -64,12 +64,13 @@ struct BCM2838PeripheralState {
     MemoryRegion mphi_mr_alias;
 
     SDHCIState emmc2;
-    UnimplementedDeviceState clkisp;
     BCM2838GpioState gpio;
 
     OrIRQState mmc_irq_orgate;
     OrIRQState dma_7_8_irq_orgate;
     OrIRQState dma_9_10_irq_orgate;
+
+    UnimplementedDeviceState asb;
 };
 
 struct BCM2838PeripheralClass {
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 0db146e592..537fc6b4af 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -74,6 +74,7 @@ uint64_t board_ram_size(uint32_t board_rev);
 #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
 #define ARBA_OFFSET             0x9000
 #define BRDG_OFFSET             0xa000
+#define RPI4B_ASB_OFFSET        0xa000   /* BCM2838 (BCM2711) RPiVid ASB */
 #define ARM_OFFSET              0xB000   /* ARM control block */
 #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
 #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
-- 
2.34.1

