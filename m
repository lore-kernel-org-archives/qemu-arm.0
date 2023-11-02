Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp531025eja;
        Thu, 2 Nov 2023 10:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTmg4ACCmLv8tJe0Urm4wSxi3H2TXjhglOzrH0uuJWDYUwaViULHA1y8/s5ldYY12IYTHN
X-Received: by 2002:a05:622a:103:b0:41e:23fc:a040 with SMTP id u3-20020a05622a010300b0041e23fca040mr25254325qtw.56.1698944647254;
        Thu, 02 Nov 2023 10:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698944647; cv=none;
        d=google.com; s=arc-20160816;
        b=G9icEFapX9ShbN9ZgehOp6mWMlKvaUl2Ro0Ve/TAiLv3C6sC3f9c1vUL+DznQJTaGV
         OKGFM4UVa9zr5ZnSJVHgzOPcehkM8Zfr2CjSGcZUo4epz+LcisN2BLsqPq6w1LEP9lN1
         o37MBFc4D9dJT79/NnQQ4twzUGVpGBD3hVEua2BOF00npFAi8yLQedib0xcdAHxA2I0Z
         gghlQdCMXUgYPFA89FhWcQZPPuM6V/Vq8SZbSSBQv2m1IxBmmMXUFrME8dxD2LHowPkY
         DvEDey8MbnQ8h4E28LfMRmmucxd14DNp3HS3g8fUE4FE/Azdn9Aw5qBfaCSJ1lYz44a8
         KuOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DrhblBc1X8px3wRZafgsKS8Byxr7Fs6wwWdAncaV14Q=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=Xv61Sn4bEQlhqKfVXF+FiG+uuUEq+YrnVT4EgMvFs0KRMELqTicDcXyIE4RmXdrjw3
         sa0mlOyusM/3iDaLdAtk1rHvemISZ0pp06hmE6u1HVY9EFybL5C7miUOvyLqtTKePA9n
         oO3N35t7C7QS0Ig+TSWRTr2gJDX8SkqlsmiWEgjvuITqsFLV6X5SzZILY8tIF/6Kzj21
         H773bXAResvlMY9u6D09pZ8Bcsm+ScNruxc6jd4SxPTgioOEZbNkydDQgDJECtrMalu1
         YuHMKzZe3Dgx+neMhbLjWh79bITeME3KEwLRK9m6Q4SCXLbjJdQdBSfVNk8TVIXszMJK
         8ALg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=LFY8wT0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020a05622a054f00b00417e0aca068si200542qtx.802.2023.11.02.10.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 10:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=LFY8wT0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyb6l-0003o8-Ry; Thu, 02 Nov 2023 13:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6f-0003jS-SX
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:03:45 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6d-0004KV-BN
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:03:45 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5bd33abbb90so424711a12.2
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944621; x=1699549421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrhblBc1X8px3wRZafgsKS8Byxr7Fs6wwWdAncaV14Q=;
 b=LFY8wT0fuje0edTxcEQtKwWR8bmSQ44OEWiPx+/Bb4uqa876A7+yhSGr/fyLBqZ8Gd
 +OUgTF2xLDZTTaAflmXhpbUyVKTHr/MbK7a6y0gm/xGWPC4IYIEEVw8//iY3iIQaaNZb
 upj2E7j326U4c06Q9Rzcv7Q773DlS0xPWm3RLgnjK3+CyTzJHAG0IhsqO2oNab5oXUcU
 I3Gv5/ChwxUOHJyf1i8ukO4hJmCwoQmTMhDZWI1ebLW+p2+IvNCQtLH2STzogC8kghLQ
 aB7a4venCqYQDZILA67ml46t9ZXybpNxF44bSFrcL0PQLBipDuIUxozc2t1opZ/PcrKk
 vDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944621; x=1699549421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrhblBc1X8px3wRZafgsKS8Byxr7Fs6wwWdAncaV14Q=;
 b=TinDlA5yk80PGlE9aCny5UROgL5AH9F6SNzSsdk0V0kaRQFloWZZ1DBaB/228C4qGW
 Aew535hxIvFIbUcXcnCe1na/IA085ZZNeN1n+sKbYJG5cK4N2C22EWI2ujs5lzbqkmFT
 1REcWXFgS7AgZxlos7uYr3oOS3AgFxHc7tlsAsfICThTBY1vuzlos2pDaMvnEi3a/inn
 eOlXIrEsJAguG94/zQ0GCAxt+YlCwGnBsmMYlFJrMlskq/WuTZIlUWYDBQhaBbaREvH3
 l03M4oZMOJb59ipDxlt3BQfW7kIkllaqzv7vk4z5xmhjTDyGoUdpCRnGMEihNv0LRIhR
 7v9A==
X-Gm-Message-State: AOJu0YyP8bTrbU/La4hEZYUMmJnK2pTh4T/DFO75+1zd75jRCdozrO+7
 SOTuIOZYo0CgFEvlRRX6kSpajKc9SqGkQm+du3bWiA==
X-Received: by 2002:a17:90a:1a10:b0:27c:e826:5038 with SMTP id
 16-20020a17090a1a1000b0027ce8265038mr15728288pjk.14.1698944621205; 
 Thu, 02 Nov 2023 10:03:41 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:03:40 -0700 (PDT)
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
Subject: [PATCH v6 11/13] hw/riscv/virt: Update GPEX MMIO related properties
Date: Thu,  2 Nov 2023 22:32:21 +0530
Message-Id: <20231102170223.2619260-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DNJAqYHMoQ2C

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

