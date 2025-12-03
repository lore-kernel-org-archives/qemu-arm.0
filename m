Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1415D1268E
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:12:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg4E-0005L8-BL; Wed, 03 Dec 2025 01:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4C-0005K1-Dw
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:20 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg49-0000zb-58
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:20 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42e2e445dbbso1580965f8f.2
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742213; x=1765347013; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Aelh7UWqNgbcmPHyVQy8EjDJIrtSb25vmBSRy1lOpo=;
 b=sJ5A75c1BFdxUVH8XlnYwJEQW+qTM0CMCrXSPb0UwYHHbQk3YCsQrM81MgO06814p3
 xB3FScXvrE9KLRxd3TVXywJrFYhvJ6jhYpmZHAe/ziaiD7/iRhxVDxAYJaCp4z64od1K
 WQLbegUnPBthJks8c++hUKdJveJYagtG/iTyDCpeQUyWcZ6JBwCS5X74h1PnFq3/rtXL
 56Stmy6fXXNpbTd7pF+qRftMZL8DbORgbtjEfts+KoQ6MWQcr6zH4q7wr1tHoyHBxs2A
 mbmRNBFhFyU7lm9rBf5O5KvL40NVJfUBEAtY43F6nMby5kKnUsNXN2JUy1y8hMIDbpOE
 EntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742213; x=1765347013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Aelh7UWqNgbcmPHyVQy8EjDJIrtSb25vmBSRy1lOpo=;
 b=GpxlnYBL8Sr7ZzYpjjmCTDOEbcwBof1Y5eAu54LkczhHeqiDdQBnZmb7bJjiDTkerg
 iog6m6PMoJ3sorWHq7Kn2pwpRJzToaryiVzQ7dU08fURQXhdKkagDm+4hP8p0wZNTuUN
 r6C4XQRdmqwxN5wXvCh7Cxki+6jFO3gMv5zVgfnsZBpI9pOTOS5M5LuP1EPJ6tcD5IVm
 d4jzSNzr9dAqpzwBQBfdbL+wAPtEygWJKulcdqjNc1Op+lmhevYHAb1BEvHP54xJ2d94
 +Tqrt29FIm6ZUNzNzL24t+wyutjOhZJllqdY/oIJMm1UuYUFWL3cZfZrf2cgDuVBoPa9
 u7zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAYKhWg25oo9yWYWdBg1ZHJFqDfPEutshwO8hpKiKaR8aAwMqrrMY2iM4/7hTFkqxDmQx9LKxDKw==@nongnu.org
X-Gm-Message-State: AOJu0Yz2eI9IDQ4mN50QqmmFoU56GzNgoxqGBAhK/fYOApRnYfidzi/D
 vzEwf9H07cKqIoDtiLjQPA9fzyE5DeXrCcvTQAJsYOEGxZpsUWrdseSONM6hr3OrBSo=
X-Gm-Gg: ASbGnctKJGmgMrsBu0prbVcxhfj1anOWA3mCGaPNKgrlQoESQT9dJgLiVAUp7hLv/Yl
 XBe07KgxMEYi3JY/Dl4MDP7Wjj/8jjwAKls927HWsmHdja+kmh+kTZVoKcTpZDa/qEsbymoXiTD
 Ci0A2XID3Z+/tigqbv2IfF6+bD2jtODrMN4x4Tr0n1nPLFadq68XIHtgtScAdhSQ+7hDz29AKWC
 ZCQRbKhZ8L6T4BLxbpyeLpoPqFv74QAxZxwy1vsoQvDYAu2Pa0uhrZURNGvw69/EbLCgnnj/4y8
 OuI4GJ52Wn5YP5aC/d+ZZ4L09yAnojHiHtz1yyQZ65/3DXR3xTva7frlkRZ0lqbNYSDvp+H/qXm
 izUw4ghrYcSFqh1iJmCDJ8/DWPdfHmYR1QvNZVB6dSBim2M/J5o/cn2QuWvV5FapqWRjZmbVuuw
 mJggY98cCDT1J/gPlbki6tyCzF3p0XBPolK65WYYzRsp9/QWYaeTPVr6DRDU6F
X-Google-Smtp-Source: AGHT+IHRw9eH1u/Tjksz7z2yBy1gzSLCZcDugsLH106IbTnKIiOWLmvHbO9jCXsIaCxf4X8O14gYUw==
X-Received: by 2002:a5d:5c89:0:b0:42b:3339:c7ff with SMTP id
 ffacd0b85a97d-42f731bcd33mr861328f8f.43.1764742212594; 
 Tue, 02 Dec 2025 22:10:12 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5d618csm36467457f8f.14.2025.12.02.22.10.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:10:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH-for-11.0 v6 04/13] hw/nvram/fw_cfg: Rename
 fw_cfg_init_mem_wide() -> fw_cfg_init_mem_dma()
Date: Wed,  3 Dec 2025 07:09:32 +0100
Message-ID: <20251203060942.57851-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

"wide" in fw_cfg_init_mem_wide() means "DMA support".
Rename for clarity.

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/nvram/fw_cfg.h | 6 +++---
 hw/arm/virt.c             | 2 +-
 hw/loongarch/fw_cfg.c     | 4 ++--
 hw/nvram/fw_cfg.c         | 6 +++---
 hw/riscv/virt.c           | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index d5161a79436..c4c49886754 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -309,9 +309,9 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
                                 AddressSpace *dma_as);
 FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
                                   unsigned data_width);
-FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
-                                 hwaddr data_addr, uint32_t data_width,
-                                 hwaddr dma_addr, AddressSpace *dma_as);
+FWCfgState *fw_cfg_init_mem_dma(hwaddr ctl_addr,
+                                hwaddr data_addr, uint32_t data_width,
+                                hwaddr dma_addr, AddressSpace *dma_as);
 
 FWCfgState *fw_cfg_find(void);
 bool fw_cfg_dma_enabled(void *opaque);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 25fb2bab568..23d88e2fd01 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1412,7 +1412,7 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     FWCfgState *fw_cfg;
     char *nodename;
 
-    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
+    fw_cfg = fw_cfg_init_mem_dma(base + 8, base, 8, base + 16, as);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
 
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
index 493563669e5..d2a79efbf76 100644
--- a/hw/loongarch/fw_cfg.c
+++ b/hw/loongarch/fw_cfg.c
@@ -23,8 +23,8 @@ FWCfgState *virt_fw_cfg_init(ram_addr_t ram_size, MachineState *ms)
     int max_cpus = ms->smp.max_cpus;
     int smp_cpus = ms->smp.cpus;
 
-    fw_cfg = fw_cfg_init_mem_wide(VIRT_FWCFG_BASE + 8, VIRT_FWCFG_BASE, 8,
-                                  VIRT_FWCFG_BASE + 16, &address_space_memory);
+    fw_cfg = fw_cfg_init_mem_dma(VIRT_FWCFG_BASE + 8, VIRT_FWCFG_BASE, 8,
+                                 VIRT_FWCFG_BASE + 16, &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index c65deeb7c38..3f0d337eb9c 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1088,9 +1088,9 @@ static FWCfgState *fw_cfg_init_mem_internal(hwaddr ctl_addr,
     return s;
 }
 
-FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
-                                 hwaddr data_addr, uint32_t data_width,
-                                 hwaddr dma_addr, AddressSpace *dma_as)
+FWCfgState *fw_cfg_init_mem_dma(hwaddr ctl_addr,
+                                hwaddr data_addr, uint32_t data_width,
+                                hwaddr dma_addr, AddressSpace *dma_as)
 {
     assert(dma_addr && dma_as);
     return fw_cfg_init_mem_internal(ctl_addr, data_addr, data_width,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 17909206c7e..bfbb28f5bd2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1274,8 +1274,8 @@ static FWCfgState *create_fw_cfg(const MachineState *ms, hwaddr base)
 {
     FWCfgState *fw_cfg;
 
-    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
-                                  &address_space_memory);
+    fw_cfg = fw_cfg_init_mem_dma(base + 8, base, 8, base + 16,
+                                 &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
 
     return fw_cfg;
-- 
2.51.0


