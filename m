Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp514467ejb;
        Thu, 19 Oct 2023 06:29:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKvA64HH80xN4W7EwL9Gxt1ljh4g3EXoAabuZcn6pvlus6jFmdGXDqKRxJU4+ZwXUp+rpj
X-Received: by 2002:a05:620a:801b:b0:767:8373:a890 with SMTP id ee27-20020a05620a801b00b007678373a890mr1945976qkb.45.1697722146766;
        Thu, 19 Oct 2023 06:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697722146; cv=none;
        d=google.com; s=arc-20160816;
        b=fkhZjFu8bpKyvcQwxs6SMa8tKM/6BFehjnQ2bX4ZuCJjI01l+UW32M9FoV0da+nsxq
         f3G1vG/ymuw49Jn+s3T8ODjTqZfECRhLCoNXonodhz31s8TBXEbSQbifLVSfOGMbfPLK
         zSRNtbP4EHywRD+FczUPsIOpiYAgfMcovx98QjqXC/kGWMFNVkoE6rHdoC8iCzDk3/rf
         vggvviEnDoHixchKeBzxQW2B5BV5Cx1Ndz2fqbiTruOnroPNOB3fKwmQvlZ+/cqYFp2W
         7SUv7GYwAPWYYPF0D64dMKtN7b7R9M+FYR/m1PN6CFbtuxDISSngbHRjtjuLA0wta67v
         7diQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O0sHR6AEYnHUakLMqwZ+R/TP889J0AOlPPpTs7hmzDA=;
        fh=qS7HOACB/fnzOG4UkP/DQwrsj+RVK26yEZmW8KA6D/k=;
        b=MCXEfTFJLxSvvfsrUYuNzpO6Ip1njdDEFTv07FK5q7LfukrT9rGA75467kNKekGfIz
         8jNQsIO4R3o6gYCWmjpKbWMhS+U1Dfoq9ZmJXTEYnDwAOv3lVQH2wLkl2sA5jRD/TiAK
         m5KxthjdFVzteled1aqgbsHMjexruCsmUx22ZkaSX59PUltFsPmPwDVoEtiVAAE2gWDr
         g6xE/9KHdTOwIHYxtadQbUskAgOwRUyzci/oeMJa1cG4En0w99SsQrD5JtJSo7nJdLrA
         jdxOs6R7uOZDXkr9bK1P+NYCq0e8fd7e7Hq+H85lPyHWIWplo+YG8pF9moovuC0PSxsX
         3Nfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=PeftBLjL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a05620a167500b007758ffaef15si1490844qko.522.2023.10.19.06.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=PeftBLjL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtT4x-0005HU-Sk; Thu, 19 Oct 2023 09:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4n-0004vr-I9
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:28:39 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4k-00077X-UL
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:28:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6b1ef786b7fso5968470b3a.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697722113; x=1698326913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0sHR6AEYnHUakLMqwZ+R/TP889J0AOlPPpTs7hmzDA=;
 b=PeftBLjLv0r9nMZUSqXn9C1tjN1Xj6V60icSAeeZqIbQq9YWwKAM/iZjYFIBuGk7bi
 gp0g9gaLD+2K6VjJo8g5CK8Qta6fwL86hVrrR6xFaK8fFie0Kmyx6Evct+DuKdZwXNtg
 dN5/+1dpkayhUcb4GiuL7gYFG0U4gOUmTNZXrZ541TNiuiyOqQF9HVUc6YyaH2rMVKEf
 uYps2DNQ/dvmvXyyDHbdEd91jfbmySnDokyiQySdf4KUJOXRy2Z0T3S5BOuzvu8QIQzg
 d+kDR7PdBiTfLRMaZD0y9SW7LBriH82Zz75NibgZCwjxA0sXfUlv+cjQuuQdh5upukft
 BMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697722113; x=1698326913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O0sHR6AEYnHUakLMqwZ+R/TP889J0AOlPPpTs7hmzDA=;
 b=YiXZiz5mKpgNzEXd1vFsn/vnaBP1ofrGxOM6TclFp/71od1eyXcxFVUBHIug9dLhzI
 yhQDfmO8S8Eiv0e+Jqae1npSjpmR0Vj60Km8N9H/3u4J6yUod6zpdnqKXXhxUk4jNhUX
 tsoxfLZiS6Zd/a44t79KqX10OcNSxxzWkJTRQk45XEQlt/g1R91k0R2Zic/Pi2gFT+lW
 n1QJ3MK8r6jGW66/He6IHxZ6inY53AmWNZTeAGx/gR4AjGrEswCpEkFMm1Df/qGWvU89
 pIgAWtG9BLEm2HlasTnX8Om0rh/3tAjmHAacddsO8T55uxFYmGSDkcP4oEvkxozcg4No
 MyXw==
X-Gm-Message-State: AOJu0Yyrei1TQFzrLw0/NPmUAFfDnF5Qq0GU5QMuGrkCvwvdxJWdUuln
 kBh4ClU+t0aZ5zQhThS+ZUynSg==
X-Received: by 2002:a05:6a00:158a:b0:6b4:231b:a45c with SMTP id
 u10-20020a056a00158a00b006b4231ba45cmr1797376pfk.26.1697722113234; 
 Thu, 19 Oct 2023 06:28:33 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com
 ([2409:4071:6e8b:3a98:dd76:4e82:7da6:44ab])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a056a00228b00b0068feb378b89sm5273113pfe.171.2023.10.19.06.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 06:28:32 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
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
Subject: [PATCH v3 10/12] hw/riscv/virt: Update GPEX MMIO related properties
Date: Thu, 19 Oct 2023 18:56:46 +0530
Message-Id: <20231019132648.23703-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019132648.23703-1-sunilvl@ventanamicro.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
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
X-TUID: 4mY9e+FZUDdp

Update the GPEX host bridge properties related to MMIO ranges with values
set for the virt machine.

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
2.34.1

