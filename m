Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp742422ejc;
        Thu, 24 Aug 2023 07:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQd+H6vdgMLlAruGh2quOuobUYB60cSoGlEB0ae5wE8W+II7plwhOptaq9nZKJo1DgUCX7
X-Received: by 2002:a1f:dac4:0:b0:48f:9778:2ba2 with SMTP id r187-20020a1fdac4000000b0048f97782ba2mr7808782vkg.5.1692887535373;
        Thu, 24 Aug 2023 07:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692887535; cv=none;
        d=google.com; s=arc-20160816;
        b=X6RKM7UNr2mVqoTOBPRl7iphTj0zVkcxZM2r8kBshWyOw3w3zdi2CY7EDEGu0b7btY
         ckWArtHnNkJTaEqDIB5XZ22QtkNfEMTVAVaUB8ZdWUJwpinljgNFXyCOF0KatLHb85iB
         HtnGG5MrtY5CksbJU7qTEdWxae0y4J7rWBfapk80r9ONOVNChIG/np7P1IWGNIRoWVnW
         Dax12qb29RDE/pbiQEZnK9ZZSXLEUS9vq1OfvJArTLcB1cHeSPdrGH1MhPcK1cZGfVqo
         NipVCkN2TDbHXFNK97qo2wfzDDMFa63VQZRkCeviIwc6E+8BeEJ/CpM3JuFHintmasBk
         UatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M8WlI/tYHPNEXK52UPbxI6DX+BQEBJBMyIzPtqCgaAA=;
        fh=FstQSHJ5xalY0qvCfwQnzF4rG/Wi+NaC2f1qQ65wDU0=;
        b=VZxQIapnUe+x+9Y2XYqWQ52sr3Am54MRiudf7iWpMW2+HEUyhXTy/rUrtHki56pphm
         iBGFLCWG/uUEvVwTfeoxLP4wig6rxJCr+pAPipTUHqty7orB8R2FEgyJAtY2P5wS/mLb
         DW+J7+p7tQSbgk9wQYVRaWX1xIhYYHCY0Omqz4R+9CDH84wc9TgLm1BTsxU+gH6ZSz2h
         47aVC0TJsjeL6mR/fG2bUyAZBCsK5ZZmPsBCXeO/MIXQyiA+M1dETUy0bptLOEqAylrS
         vLjPjO2nrfT+uaH9jog2+q3RV0ho+DDE0uGPOSStvCAXSiUi9Qntrk+KEixPIPAvyDy9
         7MEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=cHG4nAl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24-20020a05622a199800b00405467358d0si3497334qtc.387.2023.08.24.07.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=cHG4nAl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZBNB-0001Yj-V3; Thu, 24 Aug 2023 10:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBN6-0001Ba-9a
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:31:41 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBN2-0000uG-Ka
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:31:40 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bba48b0bd2so46799305ad.3
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887495; x=1693492295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8WlI/tYHPNEXK52UPbxI6DX+BQEBJBMyIzPtqCgaAA=;
 b=cHG4nAl1x38ldT53jxQL5vsVbblPbxn0vp/vVM93LqRnOaItEbNlaazFcVZ0B4mDQE
 zXBWFPb/ewpIUMrGXjLvrdr3DsYH65NAFcXxVVK9N/PiUKcnz9yO0713chXzxp2F+vew
 KGRmFeDzCnJYQwMeIH2TMJaho8PyQ+Zwqx+8r6KX5FhesRR858/aYuDaj0aR4s8T1MzQ
 lqmKwxegeykX3ThpU/bMFBZsJZue4vk0r5wejAaCB6srLAUorw68AF1BOxCQFoOqa7c3
 +IReUqhi/Q7t6TB4i2Fv7nnw6DdtEXaKPDVh08S1igd1mwWI7gSdAmzIgeOZ6My/dM+W
 ZgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887495; x=1693492295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8WlI/tYHPNEXK52UPbxI6DX+BQEBJBMyIzPtqCgaAA=;
 b=XWAEQ7nWQHkdDf6e7moxGgJHLBjIZcAs6ECTTB9KxpMARrCD+R49U1Yixd4Rm56esM
 SQ4rZivWm3SjbpGZUa4wG8kGe9M5g78VaTZSwXDs4n6auwiX3/+Uu4pDmDrwMRed5PDf
 yWYDANXOG1dMHVBoCwHPdHS1gqhHARGJjSmOQhLf2yL2sioeMgmFzC/tU3LaDyvpXxVE
 ToYFfzJRiXNXiUZt9xts9cV6PO4VXxhFAj7fRIUjfjAHMsbFaG+WEFrQi05B8LQw58V1
 pMpGoUwz/ORCr11v+61C9TM6NwAwaGHdOB+xeQW99kklhdI+JUbEdwqf5l+C2tE4NuEr
 2qTA==
X-Gm-Message-State: AOJu0YzOK+11pWyQsMsfcDb32GyG3SapughWPsKgB72AMnbP/H1b7e5Y
 rxWo4Y/TtRLW/qKRjHJzOsCCIvite22sXt2WWtI=
X-Received: by 2002:a17:90b:4b4f:b0:262:df1d:8e16 with SMTP id
 mi15-20020a17090b4b4f00b00262df1d8e16mr12628470pjb.33.1692887494991; 
 Thu, 24 Aug 2023 07:31:34 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:31:33 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 09/12] hw/pci-host/gpex: Define properties for MMIO ranges
Date: Thu, 24 Aug 2023 19:59:39 +0530
Message-Id: <20230824142942.3983650-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VTxHf6nqWFmz

ACPI DSDT generator needs information like ECAM range, PIO range, 32-bit
and 64-bit PCI MMIO range etc related to the PCI host bridge. Instead of
making these values machine specific, create properties for the GPEX host
bridge with default value 0. During initialization, the firmware can
initialize these properties with correct values for the platform. This
basically allows DSDT generator code independent of the machine specific
memory map accesses.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/pci-host/gpex-acpi.c    | 13 +++++++++++++
 hw/pci-host/gpex.c         | 12 ++++++++++++
 include/hw/pci-host/gpex.h | 28 ++++++++++++++++++++--------
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 7c7316bc96..0983af3d9e 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -281,3 +281,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 
     crs_range_set_free(&crs_range_set);
 }
+
+void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq)
+{
+    bool ambig;
+    Object *obj = object_resolve_path_type("", TYPE_GPEX_HOST, &ambig);
+
+    if (!obj || ambig) {
+        return;
+    }
+
+    GPEX_HOST(obj)->gpex_cfg.irq = irq;
+    acpi_dsdt_add_gpex(scope, &GPEX_HOST(obj)->gpex_cfg);
+}
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index a6752fac5e..41f4e73f6e 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -154,6 +154,18 @@ static Property gpex_host_properties[] = {
      */
     DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
                      allow_unmapped_accesses, true),
+    DEFINE_PROP_UINT64(PCI_HOST_ECAM_BASE, GPEXHost, gpex_cfg.ecam.base, 0),
+    DEFINE_PROP_SIZE(PCI_HOST_ECAM_SIZE, GPEXHost, gpex_cfg.ecam.size, 0),
+    DEFINE_PROP_UINT64(PCI_HOST_PIO_BASE, GPEXHost, gpex_cfg.pio.base, 0),
+    DEFINE_PROP_SIZE(PCI_HOST_PIO_SIZE, GPEXHost, gpex_cfg.pio.size, 0),
+    DEFINE_PROP_UINT64(PCI_HOST_BELOW_4G_MMIO_BASE, GPEXHost,
+                       gpex_cfg.mmio32.base, 0),
+    DEFINE_PROP_SIZE(PCI_HOST_BELOW_4G_MMIO_SIZE, GPEXHost,
+                     gpex_cfg.mmio32.size, 0),
+    DEFINE_PROP_UINT64(PCI_HOST_ABOVE_4G_MMIO_BASE, GPEXHost,
+                       gpex_cfg.mmio64.base, 0),
+    DEFINE_PROP_SIZE(PCI_HOST_ABOVE_4G_MMIO_SIZE, GPEXHost,
+                     gpex_cfg.mmio64.size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index b0240bd768..441c6b8b20 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -40,6 +40,15 @@ struct GPEXRootState {
     /*< public >*/
 };
 
+struct GPEXConfig {
+    MemMapEntry ecam;
+    MemMapEntry mmio32;
+    MemMapEntry mmio64;
+    MemMapEntry pio;
+    int         irq;
+    PCIBus      *bus;
+};
+
 struct GPEXHost {
     /*< private >*/
     PCIExpressHost parent_obj;
@@ -55,19 +64,22 @@ struct GPEXHost {
     int irq_num[GPEX_NUM_IRQS];
 
     bool allow_unmapped_accesses;
-};
 
-struct GPEXConfig {
-    MemMapEntry ecam;
-    MemMapEntry mmio32;
-    MemMapEntry mmio64;
-    MemMapEntry pio;
-    int         irq;
-    PCIBus      *bus;
+    struct GPEXConfig gpex_cfg;
 };
 
 int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
 
 void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg);
+void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq);
+
+#define PCI_HOST_PIO_BASE               "pio-base"
+#define PCI_HOST_PIO_SIZE               "pio-size"
+#define PCI_HOST_ECAM_BASE              "ecam-base"
+#define PCI_HOST_ECAM_SIZE              "ecam-size"
+#define PCI_HOST_BELOW_4G_MMIO_BASE     "below-4g-mmio-base"
+#define PCI_HOST_BELOW_4G_MMIO_SIZE     "below-4g-mmio-size"
+#define PCI_HOST_ABOVE_4G_MMIO_BASE     "above-4g-mmio-base"
+#define PCI_HOST_ABOVE_4G_MMIO_SIZE     "above-4g-mmio-size"
 
 #endif /* HW_GPEX_H */
-- 
2.39.2

