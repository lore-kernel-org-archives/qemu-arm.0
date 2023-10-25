Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2999371ejb;
        Wed, 25 Oct 2023 13:09:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYLp1uIjGat+iAazrlk/53bMw2GKdmtd+etedsQKHH0ZsvXKOsf8KUJOETsMIscv4dZJO8
X-Received: by 2002:a05:6214:d4c:b0:66d:a350:120 with SMTP id 12-20020a0562140d4c00b0066da3500120mr15855806qvr.37.1698264556086;
        Wed, 25 Oct 2023 13:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698264556; cv=none;
        d=google.com; s=arc-20160816;
        b=LRqDJRxG5D85hnYbFYHQKec2MZrbKFCH7s9WAIVLtesHcb2P3p4tER0MrsY17S24eS
         T0Uu04TplZAEl0pncVm8l4pOBd5NfWnwne8WnNP+jBcEK32fkz7D5gUQfUna7wxFn5pZ
         4YTXGICuo+Dr3Q88Xp3LEiwRl8CetGL3AW3pJOSscLf8thFYq/n7rckUJ8CUOm6r3AsI
         ZGJje2FMjhh+sOzfs/6y9hUnCYEWuo+B3Ig8hBwwE5gIykaB7ZPee2QYNV80qolfjjZY
         UCN8qce+jKqhMuj8hjXH5Z5mm313bk/uCEdAlYK/ijc+bRm9RuyR4VBWLbocubZ2QL74
         jUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S/X10QRATvrV6x66WN26VsMnlc76CHbjtlSmjbg9RSA=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=KGP4pAtVy8ZXp9H4/EDkLORBF8qohl/6TeEiYLM4VBX+EjCFoUr2JQ+/GOlCVJk5TJ
         JBkPE4MpreL5/eSsDpn5jrYHm0x7JWYzx1ZeTarrz6Jw9dgoRy5mmLHmZQubJHyMiuXW
         7uCWFE96NOk2MXi9y3pD40VZ3bStPZF5AuSk20mQjMynb5GIQvSWwiq8xXh0GAh1qXBz
         vsmG/vKwb8SKhlSIrf3o+oQXIb/l3JVUmf745QY4uj4EnITym9Ii4REOSGBgvttIUOlj
         Qm4YlHMWqhohkqHNazQEJ+o/cYr/BZm6EzakeG3wEqtZECTxbYj1Wn9n8ZJqpdj/1l8L
         UOPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="NXj/67KC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oh8-20020a056214438800b0065af80f546asi9192327qvb.2.2023.10.25.13.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="NXj/67KC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvkB9-000868-JD; Wed, 25 Oct 2023 16:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkB8-00082e-6k
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:08:34 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkB6-0003b1-0k
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:08:33 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6bb4abb8100so117388b3a.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264510; x=1698869310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/X10QRATvrV6x66WN26VsMnlc76CHbjtlSmjbg9RSA=;
 b=NXj/67KC6CSw/AamTn3PYnEXRZDoPctMFxJ52uJ3Wm/mXX39TvAtogCWyjgLI14tKW
 ajS+Cm7+Bj+SGEV6XacbXiI7Fr5dm47uS8i7Rh/QUPAJMAs660uMZ4tNjXK/y41rgHi5
 i8L5OEQnwiCWUSLZcz0/x18XicdGFaxfl8/aTeWrJRaOxWVDJ/yg5iYfO1DkI5+QzsHI
 eLVJaEKLhwIezvQJpTBg4DwZAWCfyVkTOsCj716rLRsN5he2bd6Lc4QYvasfFQCfxbwH
 m/PLafbrv7j2/k67Iw2dQnVIJ24bqXcSMhf8p8HTc4Uy7EAJtoymyUzDHvoKwfzpgMmM
 B6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264510; x=1698869310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/X10QRATvrV6x66WN26VsMnlc76CHbjtlSmjbg9RSA=;
 b=HZyE5spAk89eB3/rpqnT+5+IL6vVcpP2Hj0gZT3OO7zxjaDi8Mr2bkaIDr/L32Y/2N
 sO6nzuqJ085K9jSZ0FuPSWqaQLAU0+ygdoyyWqMHKCQrKWJ9Pz7pCzr0KSJeZrQjCzxA
 bfLW4qScFlKNkNh6uAxldITjamIvj9R6i9jQ+EQA7g2QDney0+Os7SW07fnHqn2zfVjV
 Ln1Zq0ODkK2EwWfj4mqaKrINmmx4eN6q7G4iqz2pV9XVbaxPJHNRIrTTm9ZNgSh1zT8J
 Q2/Mg0jNaygmZZN6lDG4G6MsMg5qSY6dw1bcg5QxH7KlMYgZy4sPLCEIT7IphrqUS7CL
 Lg3g==
X-Gm-Message-State: AOJu0YwHz/G0Il+bIZ3bzUeafXWbKHLc2sKa5LlazAVfeH7qfMPBRVaN
 +EVgj4LWMtq5LRFQhv9Af/L4ZZOOZ12MqjwBUWpwFA==
X-Received: by 2002:a05:6a21:1a3:b0:17b:129b:1815 with SMTP id
 le35-20020a056a2101a300b0017b129b1815mr7751733pzb.33.1698264510334; 
 Wed, 25 Oct 2023 13:08:30 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:08:29 -0700 (PDT)
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
Subject: [PATCH v4 11/13] hw/riscv/virt: Update GPEX MMIO related properties
Date: Thu, 26 Oct 2023 01:37:11 +0530
Message-Id: <20231025200713.580814-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 2dl4JEQ2Inv1

Update the GPEX host bridge properties related to MMIO ranges with
values set for the virt machine.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 47 ++++++++++++++++++++++++++++-------------
 include/hw/riscv/virt.h |  1 +
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 085654ab2f..e64886a4d8 100644
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

