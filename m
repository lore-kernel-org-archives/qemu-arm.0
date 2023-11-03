Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp813206eja;
        Thu, 2 Nov 2023 20:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKiOeElRvcdnFLtJxlQZEWMj2Lz4+VjhzFbNrEnFQbDuLsZ3Jwnx+v+D+WsFA4/P5fAqjQ
X-Received: by 2002:a05:622a:48e:b0:41c:cca5:ce8b with SMTP id p14-20020a05622a048e00b0041ccca5ce8bmr22976274qtx.61.1698981547867;
        Thu, 02 Nov 2023 20:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981547; cv=none;
        d=google.com; s=arc-20160816;
        b=CpRIBP2L+dD5OiIocHCp8TwLstqcAN6QRtqbqsBRgRMD784Yti1wwEbO7oi0aR5RB0
         0VsY4iJuvzCMB0WEBzl06gyrc8s/vDsTYOYdSAJG5DWLnwZwuk03e5LSNZ8G4W9rlfvT
         dLCjT++3xRfZ5f6SxlaZEJn5lwquIpyidzY3karrH2AUaL5B6YFkSQRMv4jnQeAX3/sw
         6zHsR67sWoju+SXK9UT+TCWHfKBfeQroc9CwOukbjL6kBAKCjDtxPuIznCGxnD66nDqi
         QpXClRk/ubyDUdExQbiAChmnt7HC+WqtMhPp424Z3ncmh7odafkHsC4G+uDmNNWBsKAf
         QEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v93540e6WuPVIuHRRUOeIVZq8uKmhthJTh8ZgKDPGNU=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=PUaVpDR3DPIUT+FFggVMf5tKOx3p06M5YOA7WtYM07xQ9uzz5yNJ2Y0q0/2wm+fJVb
         I0XDdVeOQ8lFZwJrnydr/l3LQ96yHelbeDQcsV48l3nl4lbNQyGXlCuFxcOO/ZVgm2xi
         tYyCKMRWTLqhCTA/SbcsViNi8x6WDEn/S0pCVuDvpgvsulNVUwbzmpprADc8QYKZLv8Q
         3NThMz/CeVzBvfA1LYJF3nznNlEVC5Lg/UalBFhOETKM8W5c2QsdRtebuFqMfGq0JzSH
         vzFLysFjoEq6nYGbuNoj7aAVxnwLTvi9zCkLGavgA7btd36BWDaOOz8UHe3IySZtYkvR
         ZwTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=JkC8yc4m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a05622a190600b004181590e39fsi732867qtc.807.2023.11.02.20.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=JkC8yc4m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qykhQ-0000ex-SJ; Thu, 02 Nov 2023 23:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykhN-0000QE-2d
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 23:18:18 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykh9-0004IT-IB
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 23:18:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-27d0e3d823fso1451367a91.1
 for <qemu-devel@nongnu.org>; Thu, 02 Nov 2023 20:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981481; x=1699586281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v93540e6WuPVIuHRRUOeIVZq8uKmhthJTh8ZgKDPGNU=;
 b=JkC8yc4mJa8pxPZouSRnDTpd09wjA5dui1sJvJLSwFTiLtHu5rGTnZqyqZXIQGk4Ut
 yltOij/8BdDFTYPuWGu9KeMvWdhmMXr1gJx3Vd1r3eMxAWvwH+iPywEbsPIWFmYeEn3w
 mWxe9dwj0uMO1fPSDl2meMBV3jX4rPakyU1VrhEe+dOuEhGAc4HrqLzWDWx5cY7uwpuk
 fggyX79K/9v6TMpU0Y3CYWGgEZcHVF5fFWUbWpsNO5yO7VstUabOhB478YydGI6BukYA
 VJBZvPi+MliShZ3eVvb1d34eqAJjTN33cZs/mC+P8vPLN36bHq8PSaP1H24pTmgAMRAK
 +2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981481; x=1699586281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v93540e6WuPVIuHRRUOeIVZq8uKmhthJTh8ZgKDPGNU=;
 b=VjSmFB4C8sUbbJIvL74JzYfImMIumE7aqMnsCRN7xIIDJUY74d4Xau5aUr1L4ebRUk
 fu9tUh/k+YeZ0uuQMLAxsAThsGGdI3YJsjAxOLi4cW6Lx95og305TLfSiYxpwOQ5mhdW
 lQky3zbKoMFxfOKrWBVss8l3buBT/SVqtYlUj9YBJRiTyD6WjIylQ3q32fIX3hiaGxwj
 +lyDzAGbV+qobLmwXECPwY/QZCOYGkMklOYiGifzYD5TrQieNmb85+Oc2iQcjwuwhXsP
 c28/0aIzWtlDsPe9gTvVbO9UmpOTDO7u5jDrOpdWpQx25Npptlx+Pl10kFcmD2xXlXuZ
 kjUw==
X-Gm-Message-State: AOJu0YymnmMZZD7c1kuUHjbZN1g+Z7p1LlzOSBam8mqbjoFYTckjlNdx
 fuRHi1wC0qRz1XlggJ6wjgc6yA==
X-Received: by 2002:a17:90b:1d8b:b0:280:19ba:7816 with SMTP id
 pf11-20020a17090b1d8b00b0028019ba7816mr14590574pjb.10.1698981480944; 
 Thu, 02 Nov 2023 20:18:00 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:18:00 -0700 (PDT)
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
Subject: [PATCH v7 10/13] hw/pci-host/gpex: Define properties for MMIO ranges
Date: Fri,  3 Nov 2023 08:46:46 +0530
Message-Id: <20231103031649.2769834-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4ZdZiLuFCJ3l

ACPI DSDT generator needs information like ECAM range, PIO range, 32-bit
and 64-bit PCI MMIO range etc related to the PCI host bridge. Instead of
making these values machine specific, create properties for the GPEX
host bridge with default value 0. During initialization, the firmware
can initialize these properties with correct values for the platform.
This basically allows DSDT generator code independent of the machine
specific memory map accesses.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
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

