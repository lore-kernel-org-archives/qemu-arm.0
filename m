Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp813304eja;
        Thu, 2 Nov 2023 20:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF58B3reql+JkCliVSjMeNLXN1096zx7Zs3Ue8M0eXQg0wd4bTCEuh+M3L0axC0lMssgme/
X-Received: by 2002:a05:620a:2549:b0:774:26bf:efa2 with SMTP id s9-20020a05620a254900b0077426bfefa2mr21654352qko.58.1698981563424;
        Thu, 02 Nov 2023 20:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981563; cv=none;
        d=google.com; s=arc-20160816;
        b=wSTXOXdFiPZ5J9rz6WW+wHQyJRYYyhGO3i/8ofaG3Jrn2/CFObXQHnag3oTohtzBnz
         b4rA8DtkYU7gthUGi5D66KXqta67Vw+6tU6ssZfkgfpZiPyeFUsx4fyj+U8vLuLF/HEr
         YCWSWVYCCWHGkHu2tm1rD+A0z4eMCWH2AOOgM9k0obIMQ1u3Kw1OSDijU2dqsWLvpEeK
         nDmak/UfKdKuK+6nCp6KtuSy4NlQFKcaT7agEPfOCNaxRIhB7tKUPVpVb44DX5nbocEz
         FoURHBgA9k2IUCclvB1BP4F5M1vn7Fej+CgwDRN2scqttXqavOitN6KCtbyHXHhj0QAZ
         gbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DrhblBc1X8px3wRZafgsKS8Byxr7Fs6wwWdAncaV14Q=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=Q12Pl0Fpzvi1dP8+aRqVvt29hOJCMU4yoU6sbv3HHfz72MX+c9Io4J7/9Wo3Jct757
         TaqIQ7oxlC6aMW7QTIxcDQpT48ZcbKe1V5VaF21DCQYgxd6ZOcC5cke1/GNXZn+wQBAD
         JrpTfPpoQy0UjKGMRBjSnpfLNBX8hf9ouAMrApUvOSdZRKgJm/B0OCjawHrRPc6RHgng
         xXiKc5EEwppcV2xHBHkh3OCwrivYBiqMPDKAEswXx3S3HLPoU1R/6aE808VXBmGf6DcR
         G9+BJwaSswRcXfgR4n6gTsiGMTgvblEt0gBG2JYv86nTcEZLquH4PtzR4+ssz5utNLMh
         HiXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=fnAtipa8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020a05620a295000b007743658a2besi878813qkp.499.2023.11.02.20.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=fnAtipa8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykhS-0000pB-1J; Thu, 02 Nov 2023 23:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykhN-0000QH-3d
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:18:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykhF-0004Qp-9u
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:18:16 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-280cc5f3fdcso1513076a91.1
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 20:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981487; x=1699586287; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrhblBc1X8px3wRZafgsKS8Byxr7Fs6wwWdAncaV14Q=;
 b=fnAtipa8S+gaSwVnAPdn/ZIUE1NZWzj+S3NiCoopfARUz9KDVxbkuOfIDmeqak3ORm
 9uC/kMn1yFdMlvVKcHx9lDqvpEwMcsyX81mhStAVVAIwYNdtBY/WbH0B39hoywZgjkNt
 z2p/hVMtFlTlewUSS1fyyJo3NU5qdpXFKC8UhF4Vdbo6uyHtQIOwzUfbbG+8N18t7jYH
 dPBvJS+sqGz2fIG/JIM7SA2TWjZNQEkvUl07U/6fTy5UnQb1uoosHVJefyaMCXy7vaar
 bv2V4X+1nUj7q1rq7h2xlvDJj0ixOpjz2ELV3s7bUVIGXn1QgWhLdbpIb1wtGqtGa6fJ
 m7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981487; x=1699586287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrhblBc1X8px3wRZafgsKS8Byxr7Fs6wwWdAncaV14Q=;
 b=mBs8wA1INPw1pqkyKN1BCHok0Es4TY42Oaf2YFL1Vz2C/QxVm781JcN70ZdHfPny9x
 13vMdsE1M2YlCdwdleYcV6XLdzbUjchRRy7i66loSkpcU4PtOkars7M3h9oM2NwokEt9
 lNod1wgCSK8NCYOksqYLjfSz2atb2y32Bc3eg2kBZmyyYkqp40QaThHgeqwgkAR7W0RT
 kTj6S7SWcpZ/0ITAwjewMZG9VWLg4xBPSId+tbQHyaAoOtuxEqf2woTJv43inAhlZZGH
 oCkuhmRT2PbIxxOjv8R8o81UEQlUroaWKd1a3Rn55R9KeVy5cfn2fMKJ57ZKni8N2PbU
 ekfw==
X-Gm-Message-State: AOJu0YziwQOIVSeKsXP0IwpyKKnq+KDGNJgpJAoBDkq19B40Dq5u9y6t
 Hx/vIjR8LFxbCQa4onqHJzzIoy3UuKnm9LJhNjg63w==
X-Received: by 2002:a17:90b:3b44:b0:280:cd49:2548 with SMTP id
 ot4-20020a17090b3b4400b00280cd492548mr5104536pjb.6.1698981486902; 
 Thu, 02 Nov 2023 20:18:06 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:18:06 -0700 (PDT)
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
Subject: [PATCH v7 11/13] hw/riscv/virt: Update GPEX MMIO related properties
Date: Fri,  3 Nov 2023 08:46:47 +0530
Message-Id: <20231103031649.2769834-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102f.google.com
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
X-TUID: 1LJGVaw9721+

Update the GPEX host bridge properties related to MMIO ranges with
values set for the virt machine.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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

