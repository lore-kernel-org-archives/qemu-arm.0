Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp853308eji;
        Mon, 18 Dec 2023 07:04:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa8/CYtOrjDUKBfiRrVdSggCii3jFz4NJ5IYb3pmnZ0joscp5Yls+IiUIxoFs8BPOoMAqD
X-Received: by 2002:aca:f13:0:b0:3b8:b4bb:205d with SMTP id 19-20020aca0f13000000b003b8b4bb205dmr9848160oip.115.1702911887424;
        Mon, 18 Dec 2023 07:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911887; cv=none;
        d=google.com; s=arc-20160816;
        b=kurfmYqPd76ppg9xzAsgPhXGIXJGANY9v8kbbwIARujyL7gnvF0P6kTvaP7gg5Z+SX
         JoSO2GkoPtajzPEIsevWJG/zxdOtk5456w8Oa5Mh4n4TL6HXcUDZQ29a4qjgSUpkf3Fz
         otf4A3hdM4eBx+ViIrTyZMYjVj9Xl9Dm8/Rol3TFlgUBaQ/aLKaqcVRGjwpAvl2ahY6t
         PfcxkhZRNl0liEAv/ie/GNNziRhg4/maMShhbLUSbkPZxYeBSYqYoC6KHk0bP5vsxV2n
         KR9iOhg2zMO/9lhfw9Oz53xAY792KEE3BJvAfWhSi4+yng330AzTQPyM/sH6KBOcGLCL
         iJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mAWQk+sbaMnX3VYkuvn0bjYfuTuiuW2VWEzTPBXOLTs=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=dDxkKjXe08OtX8FBsJdZQ5Eg/4bYwdIUqZ3tD/ueM601R0wfXXt2BOfjLTOB3MYoTv
         SbIIbkC7u64nlMA8CzVr7d5IMeBqr0gQ6pAo9brJSnet/g6QzFNIIP+HQoME1ohFkTgA
         nQZMKU0kZXi9L3g4Y9EHWtEbS1hxHJbNJiCMQR0VkGPz2UXEbTgrnxdtwmh4r3NeT/ae
         EWhXHl+XHmDZEheoVMQTpJBTSZITPq5Wvls0d/n6uSquBazOIIZ0y52UTeN0BbXsTXfu
         eg7Iqj/I1Ztr8oQh911Pr8AcM/B06EJHHHbdM2bNqPDOV3u27aRsry+2AA/qq7nY93co
         /ByA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=QVeEo42q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a0561020aca00b004668a938cd8si437402vsh.310.2023.12.18.07.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:04:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=QVeEo42q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFFA7-0003Xz-6h; Mon, 18 Dec 2023 10:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFFA5-0003Rz-72
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:04:05 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFFA3-0007IV-CA
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:04:04 -0500
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5bdb0be3591so2577826a12.2
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911841; x=1703516641; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAWQk+sbaMnX3VYkuvn0bjYfuTuiuW2VWEzTPBXOLTs=;
 b=QVeEo42qeS/qoftpAaVytopMHSv41EZHfmSex1ddQ8CosLEvqyPKbR2gcwmku7VMLu
 UCrXSyFoZSxCb6+sXsmx/7jF9DVUWbdfKQ3I8Br0VEjrUtyyHcsvG2DPckQgqaElPQ0a
 7IEp3nwEPc/PjG1vSsHPOb7SL53m2pO40qKQOHg5VI17T9yJs6PNzCVoH+H47BIDgx2Y
 SsbqF3F0UEOV/a4nDVAj0mPWfBhpjVL5SVf8+d2vdSia2OcvZTI2krkoZ0hhfittHNwf
 sk998TchwbBfQWt0iHCMtTSZICOpY8wVc9rw2is3tOB/ME4J8TqaYfz5j/EGmH39gry4
 FRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911841; x=1703516641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAWQk+sbaMnX3VYkuvn0bjYfuTuiuW2VWEzTPBXOLTs=;
 b=sKYsB/Tzkyl+Rur7Acj9uW6kajJKbPq5yu9I7EAKPWNQjMwzRu6yiWyFBpC4NI5MMG
 4wN9o2nbqs+K7Tg7ESYAIRYi6rQqx3tzchXub3UhkSecDMHNuUiHyRlWiSJKpOiUJVab
 XR6OezTW4aub3Wz1qvtAdJR+38gQAuHLngV3NjDgZJqlmxZP//tXoqZOvzTlYdabNSL6
 ilI9TANrpKgVbX50RcpAk9IdTTIQkLsFEZdeVHfxlBTrKHmPM1hGcUg+tY5asTODViIm
 qVAK42/SM6T/9+qco5HaD9OhpInCL0MvaEjzDNe5f2i2lStHqtvWavq3+Cn/fPyezP2w
 MBdQ==
X-Gm-Message-State: AOJu0YxddBlm06eBV5+kMGdFVh4FYlgTUDaMza4uif7z4BGBi56gbxJ7
 jPQPSZEBqtpEkl6mMa7G2cY+S2nECIrXOn77+cs=
X-Received: by 2002:a05:6a20:8f22:b0:191:60f5:fce4 with SMTP id
 b34-20020a056a208f2200b0019160f5fce4mr16517925pzk.12.1702911841429; 
 Mon, 18 Dec 2023 07:04:01 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:04:01 -0800 (PST)
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
Subject: [PATCH v8 10/13] hw/pci-host/gpex: Define properties for MMIO ranges
Date: Mon, 18 Dec 2023 20:32:44 +0530
Message-Id: <20231218150247.466427-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: LUzd4teCY88Y

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
index b0240bd768..dce883573b 100644
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
+#define PCI_HOST_PIO_BASE               "x-pio-base"
+#define PCI_HOST_PIO_SIZE               "x-pio-size"
+#define PCI_HOST_ECAM_BASE              "x-ecam-base"
+#define PCI_HOST_ECAM_SIZE              "x-ecam-size"
+#define PCI_HOST_BELOW_4G_MMIO_BASE     "x-below-4g-mmio-base"
+#define PCI_HOST_BELOW_4G_MMIO_SIZE     "x-below-4g-mmio-size"
+#define PCI_HOST_ABOVE_4G_MMIO_BASE     "x-above-4g-mmio-base"
+#define PCI_HOST_ABOVE_4G_MMIO_SIZE     "x-above-4g-mmio-size"
 
 #endif /* HW_GPEX_H */
-- 
2.39.2

