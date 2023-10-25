Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp3000207ejb;
        Wed, 25 Oct 2023 13:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5lK07E1fyrVjkd4x8I86rzBSO/zUzYrt+ulld7Li16vJfWLeOV5/GPRwiHY/i0yQvyGSd
X-Received: by 2002:a05:600c:6027:b0:405:3b1f:968b with SMTP id az39-20020a05600c602700b004053b1f968bmr12500661wmb.21.1698264632619;
        Wed, 25 Oct 2023 13:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698264632; cv=none;
        d=google.com; s=arc-20160816;
        b=AiDWxePNr4Fpz+0QGI1MxHyOMxfYMOgf5xPWMSfOliFFIO7usT8JX5YdTj8TQgbeX1
         Oi+Xe8mkwnzcd0QfYrHEHk7BOKrtjJQTvuuHxClfQ9wvdiuVSvkpAtIlTZFAC3NFG+Is
         jLF4ZcKledKFeTb73Si5BNH6X1WzN7vvecQugryP2nkqW/G9I/K3ncC6y/9znYUCCT1L
         cxfMTZZJghgYCxDN91GEPk8ArQFzDm8xWOG9IM/XiwJp1WLdYL66vmhccSTriJgbT88J
         fDfcpxF7EiEWl8I3vV4tImizgiMSOYlwegadb+xbDAn7KN80rcBkIujZhV4T050xZDaD
         xcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JKuvbE8TdjB+iGlQW/1l3BYZ+xnoog3bPhivLZBfhY0=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=xZ+u+HBryAMn631AC9QQc0uNrqVU4Fgv2UfcRjDCcuSr+9fgdZKoho1e56K8DJYoSS
         4MUW1spAnt1p7d/02RYC60kri2/+BNW1kDDhu8ZMA+qK2FPbZM/siwbSN/IjJLjWeBCO
         YN+VbziFpJrCDPUWLPz/TQV/puXYG+Qd/YLF+L8gIBRaeMC9x944Au9lDZamqH0Sh3Rb
         PUe5JHrkGvn8jhZkYrfXUD95DWJyqyMMBL/X2VRjyJpIBQEc/wMHqhdzqE9CZ8C/xqGm
         FQtI7U9A57Oj08oAuI0AgauS60sEMwzwzAG0V88ZfbynMWodkkWIN/T1InxuYRJ77XsW
         lo9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Ko2d3XV9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05600c190b00b003fee8638370si467653wmq.214.2023.10.25.13.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Ko2d3XV9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvkB6-0007xX-7H; Wed, 25 Oct 2023 16:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkB4-0007x5-Mr
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 16:08:30 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAz-0003Zk-DB
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 16:08:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6bd0e1b1890so108825b3a.3
 for <qemu-devel@nongnu.org>; Wed, 25 Oct 2023 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264504; x=1698869304; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKuvbE8TdjB+iGlQW/1l3BYZ+xnoog3bPhivLZBfhY0=;
 b=Ko2d3XV9F3qS76kFfFA6OBFeDkLwyVqGrps7GlStJ2m5TfpbibZUR0Bw2RPJJhEOcw
 I219Cu6YeF2DfSX7zInpzxW+guNYA1JiIehC+QVr681P5+EUwdz1iXbz3b1eQZf8xS/g
 4xpMJQn9LnkLFu8obZ93HvJKsJLfj9ZdlIvbDX2blgn70SvDADVwSGqvmYAi9qVxTSSc
 bLJZPHeUpZFXeSFXdglt4HqI5uMkM2VH6lRTF03DktsnWEHAOBPBM+NhsJxKBkj7FO5I
 tcpX9VVFygrF/0bzE8dTiov9w5fcBqrjcTNWqHs6tLz+50gELaHbsn4qL3nYK9jlx5fh
 5U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264504; x=1698869304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JKuvbE8TdjB+iGlQW/1l3BYZ+xnoog3bPhivLZBfhY0=;
 b=C5ZULSmxHZFAQgQab80FlpJoz7ihjdpyO4O+7P2r+rYPSt6fURBAg1NHsDNqyrbw3H
 FPR2tEOTRZ/okb8c9bInFeukRzBZ+W18pzjSHa3HJZLlU6k6GR+l/WRy+F55q+4jJhmx
 OFwjDqHrPisTyh3lGzMLpf8CJEX5HKIXHBmfAPeuIOQs5UaYZduflvxljMxNUYV5d9dz
 tjlPO8hAiZL+6n3YRrAXwl6B/24pktsOaCJYcFDoVVodsIWSW2qKM2b09xkKF6hTIwze
 MqizzSSObYmdNeaEiKMBpDnVnn7QJAUAhDf/ZdnMv7FiKK3HHh65ZdVWlajLMJxv3Ep7
 SA2Q==
X-Gm-Message-State: AOJu0Yzfn7a9yMSpEvlg9MwI4axH5S9VroiZQd0yTYJ0ULmF0yCx863r
 uyGJvrvSXlJXDmSPS1wERK0k0w==
X-Received: by 2002:a62:8458:0:b0:68e:2478:d6c9 with SMTP id
 k85-20020a628458000000b0068e2478d6c9mr12847419pfd.2.1698264504231; 
 Wed, 25 Oct 2023 13:08:24 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:08:23 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 10/13] hw/pci-host/gpex: Define properties for MMIO ranges
Date: Thu, 26 Oct 2023 01:37:10 +0530
Message-Id: <20231025200713.580814-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: HJCeN9XpTxin

ACPI DSDT generator needs information like ECAM range, PIO range, 32-bit
and 64-bit PCI MMIO range etc related to the PCI host bridge. Instead of
making these values machine specific, create properties for the GPEX
host bridge with default value 0. During initialization, the firmware
can initialize these properties with correct values for the platform.
This basically allows DSDT generator code independent of the machine
specific memory map accesses.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/pci-host/gpex-acpi.c    | 13 +++++++++++++
 hw/pci-host/gpex.c         | 12 ++++++++++++
 include/hw/pci-host/gpex.h | 28 ++++++++++++++++++++--------
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 1092dc3b70..f69413ea2c 100644
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

