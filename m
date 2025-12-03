Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7F5D1266D
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:10:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg4U-0005Rt-D3; Wed, 03 Dec 2025 01:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4G-0005Na-L7
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:26 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4D-00010u-Lb
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so3488455e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742220; x=1765347020; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d59yEPBhvNs72oBt/pK6ap8zRJfPgKjJjvIkF2NPKTI=;
 b=wIXebwFxR4LB6OQOR0wgB4Fzs7ZP86aJn2hiDTT+zzox/nG3C9cFpAil86Py6A/bJX
 a72JPMKVbubw7HX1yXH9AHs2QlY084W8voPLH0OD0+BbH6wyJLeeIz5ggHTtxhyTFdMo
 08YCnfzkYBxpgfqBJyRYrJqdljf9o2DG1Hfceam8KOpqKvasXrE/38bum8AYr5XSejQ5
 I0dmplBuqZ5VYh3UHJ/vtj3a+LYYzyCHVOtXcyhh575Ps9GcpSaGKxGbAgTX31DRxjDt
 3lnws6oaawNr7utglpMy/Ua8/Vt36sObzkfCrFbkXHF6cKddbQeRGhOs5hvIGLnlHahF
 +4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742220; x=1765347020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d59yEPBhvNs72oBt/pK6ap8zRJfPgKjJjvIkF2NPKTI=;
 b=euLc14cQzKdtKGK1prkthFhShLyTH9cGzJiJhuFcOuLEBcoViqqvRwF2ADHqvZc8aw
 HKbsGf46dI4wCWR1ij7zvxvBKmzLm+XNi00VI7gJo1GOpVwAa/0NAkBTwvwvlfrECn5S
 JJyyup+zaZg8luZ2QqZpakzQbsmKMWE+3SgWIExfhIiPFPWneixX1NHOcJxFXrM3sOoD
 1w+jYoRHEjLrMy9FrT06QrgPWrcfnh6r5t3kc8s6xYPusfxOod3dv/EuKkJvlCmtqZRO
 yflnlsuRuKNw42HteIaCgYe2LlzHSUmP815lY5IS8gKYcHAa3UBMwBZZeB+ucQ5G99ql
 EeYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcWjq1QDJF1IIgav3cMnmTvBg3HOdrmW2ddHPPYh8c1L2/Y8nsX3M3iv2WcS1F3/7F+YnWngTOUg==@nongnu.org
X-Gm-Message-State: AOJu0Yyd1JKgHumJFoDwAk4Fq5te9GPbCe+NvF/CfZ3w4lWwEwCYSr9l
 4VvCSohVkI8LChCwAqB5JosJt56IcWEdXJTDZcee+uHkYK2J7W5bX5sebPF0TmahrwAjJg73J21
 rJMYAqvU=
X-Gm-Gg: ASbGncuVyWaD8RlRcTzdugjtHvZAnjm3daGOzQvtN9RD8++pOb0Amu0JSUs6nyrHp+o
 i5Q+33+OeFcjjiznJTuz6Q8tmV/ku7U9GlzSWzdCP49er5MQEGuAQ7ZZmsBVhDstVGUvZJhUeUG
 zNsP+wjEjZvKMkSdGUojgMutVJermtGTwC375nG3XXe6WT+knYb4qm4ZAL9IDuPLFJbjrb16qnV
 2418G5+l838CK8gTEMgYnUghUZCOmgMltgwpQuimI5dBVepO+Uic9/6lHsyiGOeuzyGEa9X9XxX
 Tl9ZlMQxoTqP2QLa7ZytmuF7J8Qw0tkorrTP8L9l4ospVTVT1PZXsFG9yTVmQXS5fQLz2eWMn4c
 /KKojlYZpwuKCR3h+U/O/Pj3MZtJpEQCbQWPBAJxXC9pIGduQQMIZHFLEwXtKudPjivaQoDaASs
 pvv0OzV6xSrXM7Vra4BTX9sn5Sfh8jcuBEiyzqmE9b6SNyae4xE7rAoA0R5TtSfmC9aK4YBcU=
X-Google-Smtp-Source: AGHT+IHUidWQpMcxdt+65fXbL6Az7BDfr44WOMQhwWGw2toVqgrgtYVbDbr4/vzDHtFJ29DqoWz37Q==
X-Received: by 2002:a05:600c:3145:b0:477:9e0c:f59 with SMTP id
 5b1f17b1804b1-4792aee03eamr10306385e9.2.1764742219861; 
 Tue, 02 Dec 2025 22:10:19 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a7a78a0sm28527625e9.10.2025.12.02.22.10.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:10:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH-for-11.0 v6 05/13] hw/nvram/fw_cfg: Propagate I/O MemoryRegion
 to fw_cfg_init_io_dma()
Date: Wed,  3 Dec 2025 07:09:33 +0100
Message-ID: <20251203060942.57851-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

To allow callers to use I/O MemoryRegion different than the
global get_system_io(), pass it as argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/nvram/fw_cfg.h | 4 ++--
 hw/i386/fw_cfg.c          | 3 ++-
 hw/i386/microvm.c         | 3 ++-
 hw/i386/pc.c              | 3 ++-
 hw/nvram/fw_cfg.c         | 5 ++---
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index c4c49886754..7348cbfbc34 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -305,8 +305,8 @@ bool fw_cfg_add_file_from_generator(FWCfgState *s,
                                     Object *parent, const char *part,
                                     const char *filename, Error **errp);
 
-FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
-                                AddressSpace *dma_as);
+FWCfgState *fw_cfg_init_io_dma(MemoryRegion *io, uint32_t iobase,
+                               uint32_t dma_iobase, AddressSpace *dma_as);
 FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
                                   unsigned data_width);
 FWCfgState *fw_cfg_init_mem_dma(hwaddr ctl_addr,
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 5c0bcd5f8a9..498da9ec69c 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -127,7 +127,8 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
     const CPUArchIdList *cpus = mc->possible_cpu_arch_ids(ms);
     int nb_numa_nodes = ms->numa_state->num_nodes;
 
-    fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
+    fw_cfg = fw_cfg_init_io_dma(get_system_io(),
+                                FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
                                 &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, boot_cpus);
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 94d22a232ac..69f04d74a15 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -289,6 +289,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     X86MachineState *x86ms = X86_MACHINE(mms);
     MemoryRegion *ram_below_4g, *ram_above_4g;
     MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *io_memory = get_system_io();
     FWCfgState *fw_cfg;
     ram_addr_t lowmem = 0xc0000000; /* 3G */
     int i;
@@ -319,7 +320,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
         e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
     }
 
-    fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
+    fw_cfg = fw_cfg_init_io_dma(io_memory, FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
                                 &address_space_memory);
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, machine->smp.cpus);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2b8d3982c4a..5c52079be31 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -659,7 +659,8 @@ void xen_load_linux(PCMachineState *pcms)
 
     assert(MACHINE(pcms)->kernel_filename != NULL);
 
-    fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
+    fw_cfg = fw_cfg_init_io_dma(get_system_io(),
+                                FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
                                 &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
     rom_set_fw(fw_cfg);
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 3f0d337eb9c..34d7d107678 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1019,14 +1019,13 @@ static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
     qemu_add_machine_init_done_notifier(&s->machine_ready);
 }
 
-FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
-                                AddressSpace *dma_as)
+FWCfgState *fw_cfg_init_io_dma(MemoryRegion *iomem, uint32_t iobase,
+                               uint32_t dma_iobase, AddressSpace *dma_as)
 {
     DeviceState *dev;
     SysBusDevice *sbd;
     FWCfgIoState *ios;
     FWCfgState *s;
-    MemoryRegion *iomem = get_system_io();
     bool dma_requested = dma_iobase && dma_as;
 
     dev = qdev_new(TYPE_FW_CFG_IO);
-- 
2.51.0


