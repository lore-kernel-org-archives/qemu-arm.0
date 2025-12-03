Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02345D116F3
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:11:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg4j-000617-QZ; Wed, 03 Dec 2025 01:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4h-0005vN-Tn
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:51 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4g-00016E-12
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so45194725e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742248; x=1765347048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=quCJPogV7nRUmrNwgtt7+y1aIO17eQXRGgz3UisICQs=;
 b=LxRjV1mOd5EfdizpnEuiyZ2yu+2+6/LkUVNjX0gUwb3RCkXx6eHqmUItNK20iMv+3P
 NK9il66ke4f3P1FPnHF85kKbKqiMvi8+2BValQzmqJhL3IalxjT/v0Ber4w4/jOuOeeG
 CTqvshnbJGZ/75STFu4LmuaE9Lc7TVey++ZS6+EHPEKbyNTEHZTRRt+7s7w884g2C34l
 8mclUArtLAcqf/CtdyaeBrUDNoEm7YmI+J19weeGo6xX6l9YIO9cNklje5tril6jepgD
 t8z064PXdO7iF4nl4DJvtPqZL4qi5RCE3g82Z7seR7AC6XgVc4chZSaCPsGwaIohfQS+
 f2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742248; x=1765347048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=quCJPogV7nRUmrNwgtt7+y1aIO17eQXRGgz3UisICQs=;
 b=rLVtL7XvNBmOw8uAzdFh2ArDdA4byVQZysG8U780zIvHgrObKGaL5wqtYTCJeieZyD
 h9q/5NgwQNGtx6VU4KnbjRF3FnejM++A23G6tavmUd6HDR9nJwJ1jSfrUkLRGhKDDhpY
 SiGyPsoW+thKiHr+NQT0KthtBYk3711u8DepMQh6IpokweJQZlweBT6zDH7DK9PUVWuT
 brdw9+kvBRyJDxqpfX5/28RtgCFQBHuGvGihaq7BsM5JOoT8td4L70tenYrI9XTl8Kxz
 ycB5FQ/RRg5SmcWjjKEzxejpHJqqeermTN3j8wBlwLjBxiVlmnIv0cX6zUNmWrjybC3/
 VzAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxTJUL8jT2AD+pQMFLxmqLvB+Un2LvhG2YBOQOJwh6to3sKm0Ipk0A67933Bu/dYDlNIv+bhYu+g==@nongnu.org
X-Gm-Message-State: AOJu0Yw3JL0RCoCP00E5UI2uFDfI2b3+uYRR2DQtN/ij9uNOebgGcday
 tXepVPIld3mbpC7sSuyqlhqSmn6IAE4oe14389SPYXk7GrWduzJkfJxDLShgG4atMQ8=
X-Gm-Gg: ASbGnctpqF991vm5VEFPH3pHF1biDxFJZHk0Os4MUbIAk/3nV3fR572LL9mxkFcMmob
 mavUHUGvep72k+UddTRTpdFV5wVkHQeQu3xTrMRhSt4G2haoCSnYx93mkaGeQFrMYJHxNHi586u
 kJqSjnYjLigcE0wBUiGaIDavKB0ZhD3lq4fw3y8nkhgIwVmFAXqpyd7JFoGl0kDtZsC3DXe4rf0
 E8kmq3LffCtk1SivXDGb6YrMIwmBj1p3fA9+ABes3Y/DOL/dDIdPLspRITYGvTRufpfGO1/Bzfx
 eXEXi933GLEQqF2QLpgjLE2ibkkSVW/rWsUFqsN1kNAnxbr/FFC1Tcm1pIVWTogZMxlwD2bucdm
 4WXZhgmodOGemucqBIddHhnYL6NW47/PaN1hrIEY/6FYFaa6rJEj7gRXSjG0M+6gi5MxUgMthOQ
 g3ZOaR1qaZKqIEje/4XFXxvn31feZ5rOS/UVMJYUfv5lW8pqP/e3ymyL+T/lxq
X-Google-Smtp-Source: AGHT+IHb5GGL3dNPV8pAWpWQo+oO1ln71vxDjpnW98Ij7PAUP87vZLn4REjuXe0G0YBrVVytO5PbnQ==
X-Received: by 2002:a05:600c:3b97:b0:46e:33b2:c8da with SMTP id
 5b1f17b1804b1-4792af40489mr10490725e9.32.1764742248380; 
 Tue, 02 Dec 2025 22:10:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a79dd66sm29299405e9.6.2025.12.02.22.10.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:10:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH-for-11.0 v6 09/13] hw/nvram/fw_cfg: Remove
 fw_cfg_io_properties::dma_enabled
Date: Wed,  3 Dec 2025 07:09:37 +0100
Message-ID: <20251203060942.57851-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Now than all calls to fw_cfg_init_io_dma() pass DMA arguments,
the 'dma_enabled' of the TYPE_FW_CFG_IO type is not used anymore.
Remove it, simplifying fw_cfg_init_io_dma() and fw_cfg_io_realize().

Note, we can not remove the equivalent in fw_cfg_mem_properties[]
because it is still used in HPPA and MIPS Loongson3 machines:

  $ git grep -w fw_cfg_init_mem_nodma
  hw/hppa/machine.c:204:    fw_cfg = fw_cfg_init_mem_nodma(addr, addr + 4, 1);
  hw/mips/loongson3_virt.c:289:    fw_cfg = fw_cfg_init_mem_nodma(cfg_addr, cfg_addr + 8, 8);

'linuxboot.bin' isn't used anymore, we'll remove it in the
next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/fw_cfg.c  | 15 +++++++--------
 hw/nvram/fw_cfg.c | 26 ++++++++------------------
 2 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 498da9ec69c..bf38338fb47 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -216,18 +216,17 @@ void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
 #ifdef CONFIG_ACPI
 void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw_cfg)
 {
+    uint8_t io_size;
+    Aml *dev = aml_device("FWCF");
+    Aml *crs = aml_resource_template();
+
     /*
      * when using port i/o, the 8-bit data register *always* overlaps
      * with half of the 16-bit control register. Hence, the total size
-     * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, the
-     * DMA control register is located at FW_CFG_DMA_IO_BASE + 4
+     * of the i/o region used is FW_CFG_CTL_SIZE; And the DMA control
+     * register is located at FW_CFG_DMA_IO_BASE + 4
      */
-    Object *obj = OBJECT(fw_cfg);
-    uint8_t io_size = object_property_get_bool(obj, "dma_enabled", NULL) ?
-        ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t) :
-        FW_CFG_CTL_SIZE;
-    Aml *dev = aml_device("FWCF");
-    Aml *crs = aml_resource_template();
+    io_size = ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t);
 
     aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
 
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 079c28f9212..e0a140d01c0 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1027,12 +1027,9 @@ static FWCfgState *fw_cfg_init_io_internal(MemoryRegion *iomem,
     SysBusDevice *sbd;
     FWCfgIoState *ios;
     FWCfgState *s;
-    bool dma_requested = dma_iobase && dma_as;
 
+    assert(dma_iobase);
     dev = qdev_new(TYPE_FW_CFG_IO);
-    if (!dma_requested) {
-        qdev_prop_set_bit(dev, "dma_enabled", false);
-    }
 
     object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
                               OBJECT(dev));
@@ -1043,13 +1040,10 @@ static FWCfgState *fw_cfg_init_io_internal(MemoryRegion *iomem,
     memory_region_add_subregion(iomem, iobase, &ios->comb_iomem);
 
     s = FW_CFG(dev);
-
-    if (s->dma_enabled) {
-        /* 64 bits for the address field */
-        s->dma_as = dma_as;
-        s->dma_addr = 0;
-        memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
-    }
+    /* 64 bits for the address field */
+    s->dma_as = dma_as;
+    s->dma_addr = 0;
+    memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
 
     return s;
 }
@@ -1198,8 +1192,6 @@ static void fw_cfg_file_slots_allocate(FWCfgState *s, Error **errp)
 }
 
 static const Property fw_cfg_io_properties[] = {
-    DEFINE_PROP_BOOL("dma_enabled", FWCfgIoState, parent_obj.dma_enabled,
-                     true),
     DEFINE_PROP_UINT16("x-file-slots", FWCfgIoState, parent_obj.file_slots,
                        FW_CFG_FILE_SLOTS_DFLT),
 };
@@ -1220,11 +1212,9 @@ static void fw_cfg_io_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->comb_iomem, OBJECT(s), &fw_cfg_comb_mem_ops,
                           FW_CFG(s), "fwcfg", FW_CFG_CTL_SIZE);
 
-    if (FW_CFG(s)->dma_enabled) {
-        memory_region_init_io(&FW_CFG(s)->dma_iomem, OBJECT(s),
-                              &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma",
-                              sizeof(dma_addr_t));
-    }
+    memory_region_init_io(&FW_CFG(s)->dma_iomem, OBJECT(s),
+                          &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma",
+                          sizeof(dma_addr_t));
 
     fw_cfg_common_realize(dev, errp);
 }
-- 
2.51.0


