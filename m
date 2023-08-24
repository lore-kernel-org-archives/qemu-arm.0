Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp743356ejc;
        Thu, 24 Aug 2023 07:33:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaSOPoteyBGCRm4uTnKCrmam/OUVFQEaYG5Wvks/UcXcBMB3Ie9x71qFbS13MGzZWcer6Y
X-Received: by 2002:a05:6870:b291:b0:1c4:d735:38e9 with SMTP id c17-20020a056870b29100b001c4d73538e9mr18636321oao.57.1692887611912;
        Thu, 24 Aug 2023 07:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692887611; cv=none;
        d=google.com; s=arc-20160816;
        b=QZEmUqqp5RuGEHrYR2Nmprbit+e3vZeylKLaQH7AxeYPodbBSeOmf2yOOUUqv3vokv
         VeYPeD54AK6cedU5zEmpRGyppBCODP9ngEigA7CsqzZjg1Jn9avF2YsDczE4V7+5nfVK
         10WlXb32/wtuo8pyinSwXS3sY1tXk3Z21tLSBKfAWAICOc/qDAk7Ggx6YbuVqXYcbINL
         yi4tCjat1FaAmdlwPOo54ftu2XHw7mrdIWBNgcO78C0jC0EZDDOh8TGzUeG+tY93ymuE
         GwY1dtg7c0lEEzSv8zWESGOYt+QnoZcbLx/BH0EANjF+GFvRo2FnA1bjiRJnQOEWh0Qi
         djZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fktVFjxajwjIn3pW+eH8a+AlgKI895FkdjadjybOSXU=;
        fh=FstQSHJ5xalY0qvCfwQnzF4rG/Wi+NaC2f1qQ65wDU0=;
        b=eA2rK4/pIS0i6BKTnjmwKUiwDdgcuS0rhehto9eBHnGDeFKdcO0JQ4D0VSI8QFopKJ
         lwiwvdTcTK88Un41o9YQO2GDY33c8Y32HIFWtArgIKYvZCcxv4Bw0/U945Ck/2L6gfSt
         aCgmkK6L+RTR6LPggPEYGt9gGqWcklxTlzpfPhHI7cq6NILQ7rTcPOYnO2ET4huUGodu
         YRO2tQ7hBFObadllYJFgGH4G0UdSTW4HvugEzVvc0gvaZnDJIGIKCuIML7DS23wBM5wT
         9F8W+mGjjQc2p4E50p/zu7MUuQZ8EAbRCdPdXxbw8B3rrICSggYq1Ljiw90elxYpO4CR
         Pv6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=MCsVpczd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05620a0d8b00b0076cae6b0801si3398662qkl.640.2023.08.24.07.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=MCsVpczd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZBNK-00025w-RM; Thu, 24 Aug 2023 10:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBNE-0001ie-U9
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:31:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBNB-0000v0-Ku
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:31:48 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-56a3e6bce68so2771428a12.1
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887504; x=1693492304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fktVFjxajwjIn3pW+eH8a+AlgKI895FkdjadjybOSXU=;
 b=MCsVpczdJaGdPSY+cmvCgwp/JQqtwZ7vnGIF0yvtVDP13h6BlIqEqEQR1MvV99lpjZ
 7gKdt2YIJmocCCnxv+zmKrLL0AwBjn0wID5/8SLCFLecl8aITgJu3kzeQkvuvDVTzmrb
 xv3m6SPHCy86KTWG2hOgZsw1tbUr7pwi7Id6l2mmlb9c74jGqHbeKSoZCY9vZPVyfhxS
 73T+rQAe43MJ0iybGIsXSS8n9Id4eLzjgqyDkauvzIOnGW89px9clhIVEgpv129pYVuB
 u/mU+dJ+2jDjtwn9oZO3SNNjsD4cVP6waY/cWCDyjHJYf20uxutG1/Yt9QaRZwuKcazt
 QHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887504; x=1693492304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fktVFjxajwjIn3pW+eH8a+AlgKI895FkdjadjybOSXU=;
 b=YHlaR0KkKlKcD1Z/tIjQ4xvFPO7fuQXlGQ4MFwrpCsjOW83Xr5GG/yn/neAfJfTaIw
 y9QYCnFd5kPRBMvraA2MQ2PCkGMb6kACE/VxzvKi67j0X+fk2vUcbjq3nVNF+h+dXahb
 ES4v2jh3X7Q7w6H+TVAdLr4aHL/Zt9n0YFidcFbRfV6y0PFCotLSmWPWYTaJaeBjbFwE
 dfacD6kP8mTe64v5w9UcWY/t5WRlB/rKqhUwAPx9jgvmgY4QZOs4cF1S8vOb8FRdDho0
 czwAo30nLR0S8kNrznBqRN6yQk3AsRYOrCtg1vbRlUPDznurDc2AV1vTI2PIFkdb0qx9
 o+FQ==
X-Gm-Message-State: AOJu0YzkyGSefeTTyBYjXuvbpS9FXHnar6G0ie0CYCqx1eo60QqLBmuD
 TOo/PESnx8y9Dg02/mXe2YfkKjezxDxV4Lwt/xo=
X-Received: by 2002:a17:90b:1d8b:b0:263:829:2de with SMTP id
 pf11-20020a17090b1d8b00b00263082902demr12697536pjb.2.1692887503813; 
 Thu, 24 Aug 2023 07:31:43 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:31:41 -0700 (PDT)
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
Subject: [PATCH v2 10/12] hw/riscv/virt: Update GPEX MMIO related properties
Date: Thu, 24 Aug 2023 19:59:40 +0530
Message-Id: <20230824142942.3983650-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x534.google.com
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
X-TUID: Q+l7EQFMQ177

Update the GPEX host bridge properties related to MMIO ranges with values
set for the virt machine.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 47 ++++++++++++++++++++++++++++-------------
 include/hw/riscv/virt.h |  1 +
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7b65a847e2..f2b5e8338d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1049,21 +1049,45 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 }
 
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
-                                          hwaddr ecam_base, hwaddr ecam_size,
-                                          hwaddr mmio_base, hwaddr mmio_size,
-                                          hwaddr high_mmio_base,
-                                          hwaddr high_mmio_size,
-                                          hwaddr pio_base,
-                                          DeviceState *irqchip)
+                                          DeviceState *irqchip,
+                                          RISCVVirtState *s)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
     MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
+    hwaddr ecam_base = s->memmap[VIRT_PCIE_ECAM].base;
+    hwaddr ecam_size = s->memmap[VIRT_PCIE_ECAM].size;
+    hwaddr mmio_base = s->memmap[VIRT_PCIE_MMIO].base;
+    hwaddr mmio_size = s->memmap[VIRT_PCIE_MMIO].size;
+    hwaddr high_mmio_base = virt_high_pcie_memmap.base;
+    hwaddr high_mmio_size = virt_high_pcie_memmap.size;
+    hwaddr pio_base = s->memmap[VIRT_PCIE_PIO].base;
+    hwaddr pio_size = s->memmap[VIRT_PCIE_PIO].size;
     qemu_irq irq;
     int i;
 
     dev = qdev_new(TYPE_GPEX_HOST);
 
+    /* Set GPEX object properties for the virt machine */
+    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_BASE,
+                            ecam_base, NULL);
+    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_SIZE,
+                            ecam_size, NULL);
+    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
+                             PCI_HOST_BELOW_4G_MMIO_BASE,
+                             mmio_base, NULL);
+    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_BELOW_4G_MMIO_SIZE,
+                            mmio_size, NULL);
+    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
+                             PCI_HOST_ABOVE_4G_MMIO_BASE,
+                             high_mmio_base, NULL);
+    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ABOVE_4G_MMIO_SIZE,
+                            high_mmio_size, NULL);
+    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_BASE,
+                            pio_base, NULL);
+    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
+                            pio_size, NULL);
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     ecam_alias = g_new0(MemoryRegion, 1);
@@ -1094,6 +1118,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
         gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
     }
 
+    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(GPEX_HOST(dev))->bus;
     return dev;
 }
 
@@ -1492,15 +1517,7 @@ static void virt_machine_init(MachineState *machine)
             qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
     }
 
-    gpex_pcie_init(system_memory,
-                   memmap[VIRT_PCIE_ECAM].base,
-                   memmap[VIRT_PCIE_ECAM].size,
-                   memmap[VIRT_PCIE_MMIO].base,
-                   memmap[VIRT_PCIE_MMIO].size,
-                   virt_high_pcie_memmap.base,
-                   virt_high_pcie_memmap.size,
-                   memmap[VIRT_PCIE_PIO].base,
-                   pcie_irqchip);
+    gpex_pcie_init(system_memory, pcie_irqchip, s);
 
     create_platform_bus(s, mmio_irqchip);
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 5b03575ed3..f89790fd58 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -61,6 +61,7 @@ struct RISCVVirtState {
     char *oem_table_id;
     OnOffAuto acpi;
     const MemMapEntry *memmap;
+    struct GPEXHost *gpex_host;
 };
 
 enum {
-- 
2.39.2

