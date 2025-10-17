Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40F4CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:10:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kD7-0003at-Vf; Fri, 17 Oct 2025 09:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCh-00038E-HY
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCX-0004Vc-FX
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso1805110f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706533; x=1761311333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMx4fEQDiJT90/D4DN9KKgZOlwkZG5AqjHkgHNGaAMU=;
 b=gy+i3IuYLQZqQKLgtZTBlTXQZ6vxYnKfh6MehOsc69cTao0J43xBTYqZkIr/r6O8Bn
 ZrakJCaTuV5ClmuSqqEE2DoZx8PkuPAuHFPtoQoEUxRu8XVzh0dzFzDxMj9uQvENMZoW
 82aPqtqFcalPOf36vnaj/EG4Ke1PjuniZ8l+nynv6zEea6XysG8B/MyViJpkHr5vDkXa
 +MBznlunv9redmKhsb/RSYSPl3vvrcnH4Uj6GDzYvT/Bh2Dcgtka/RB8vE2ISbKpBsO3
 3pZK2BoZb0BGyPEpV2Ol3Sdwn550e+MNm0pXHO1acgcvkoHLsy24gd6St/fQ/zPWJJCf
 rPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706533; x=1761311333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMx4fEQDiJT90/D4DN9KKgZOlwkZG5AqjHkgHNGaAMU=;
 b=XnVVgUz4SsCYHrSs2I/1vbMXPNeob9khA5HD2Io4bn5gA+74uVIy/d1sX55BdP8Os1
 oBvASLiF6RwyZCZWPCFqe+uuZDUZ1lPJ09TLAm8v8VaKyISyQEq4byLj1tEFtzl0e80T
 YVqigi4L56ye/6b2SXsg0erLEOOvRkj+D7ILF9hS/N+FzVmhAGzCPK1ZkY1Cm4FCVW0z
 rCqyRClhMcPs0En9lVFuNS5yudZqQBxA4+BEalcNpkO3L2naYD49jYVaDlibGtMK0a93
 GHSNpH2FylQrJtyH9PSyJinDr/N3IbOBl+5dM/p6jTpaU0NZjyBeuTX20miMTTjXsXuD
 uGWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL6WaVOrZYWMsC0wq8olQrhhzENtV+D+1ZGGiks5gnZOjTAHzGsqwmIFxo9PWoryV3xA7w1KA1GQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw3tDebgkWd1zKFIVFXgtLGfppEaHDeDnHHg3qYjbOeJPF2zffU
 XUVwXit8c6rgB/1mNLfgDe/mzTEp1n2ELoZ2f3SWeelD/gSF5VwnFrXG3vODF4LNOsw=
X-Gm-Gg: ASbGnctZuEe2tkcAZFxkI2A24VpU7k6OCNCILlmGFoBLXR5kV4a9wshq9gC/98OnvAl
 xSdPSUvmYtibAKQslJMG52MlLGmFjE5HG3Wd+VVxmAJJI9wdPe7WBcC3e6qP2q3rBd3CYLPPDwO
 V09b1i2aBnCXSML4rd6afRjkZ2hZze0e7Czn7hhJD0ewQa5U8HDWBCekKzkOmygTK8n2dXHVqni
 y7jmdpCl7WcX/bbk9Ccg/3rRK/hZzOl2KtFEXeR7dR9vr0qHzW27rb99fvQmiztB4lvrw84Hawh
 EPbtglAuoG9x+RZkTZIHlwpVIHOg/gYF+ZfSWmNoO42JeJU0fM6DHSm4DMf9tFM2ug4k+UQlXl/
 e16Z5q0lptC8GiiMa3jnhAu5QZNYxOpkXjPuDCbDpLFdwg9ydSgLKDl/HpyRFqmfgoN8EXw6C8T
 w7069eZMIOrBwOYhgaaacqU2ctyN9VraRa82/7BNV8FdKPgifomh/iKvd00Ehm
X-Google-Smtp-Source: AGHT+IE8UN+4oQyxjGUMq75DN1hnmRVOHtIzWVcvAgmLkxSHO+M2PXS7GoNr4AUT9S+HUM4PSK4Lzw==
X-Received: by 2002:a05:6000:144e:b0:426:fb63:c01f with SMTP id
 ffacd0b85a97d-42704bf71ecmr2951519f8f.29.1760706532567; 
 Fri, 17 Oct 2025 06:08:52 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4270665efdcsm4169402f8f.29.2025.10.17.06.08.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:08:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/20] hw/arm/virt: Remove VirtMachineClass::acpi_expose_flash
 field
Date: Fri, 17 Oct 2025 15:08:05 +0200
Message-ID: <20251017130821.58388-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The VirtMachineClass::acpi_expose_flash field was only used by
the virt-5.0 machine, which got removed (see commit 2c1fb4d5c01
"hw/arm/virt-acpi-build: Only expose flash on older machine types"
for more context). Remove it as now unused.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h    |  1 -
 hw/arm/virt-acpi-build.c | 28 ----------------------------
 2 files changed, 29 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c77a33f6df2..ba16acb8626 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -124,7 +124,6 @@ struct VirtMachineClass {
     bool no_tcg_its;
     bool no_highmem_compact;
     bool no_kvm_steal_time;
-    bool acpi_expose_flash;
     bool no_secure_gpio;
     /* Machines < 6.2 have no support for describing cpu topology to guest */
     bool no_cpu_topology;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8bb6b605154..5db5baa7cf3 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -99,30 +99,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
-{
-    Aml *dev, *crs;
-    hwaddr base = flash_memmap->base;
-    hwaddr size = flash_memmap->size / 2;
-
-    dev = aml_device("FLS0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0015")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-
-    crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
-
-    dev = aml_device("FLS1");
-    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0015")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-    crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(base + size, size, AML_READ_WRITE));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
-}
-
 static void build_acpi0017(Aml *table)
 {
     Aml *dev, *scope, *method;
@@ -1011,7 +987,6 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     Aml *scope, *dsdt;
     MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
@@ -1036,9 +1011,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         acpi_dsdt_add_uart(scope, &memmap[VIRT_UART1],
                            (irqmap[VIRT_UART1] + ARM_SPI_BASE), 1);
     }
-    if (vmc->acpi_expose_flash) {
-        acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
-    }
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
     virtio_acpi_dsdt_add(scope, memmap[VIRT_MMIO].base, memmap[VIRT_MMIO].size,
                          (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
-- 
2.51.0


