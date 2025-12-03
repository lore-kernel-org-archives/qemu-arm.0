Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA68BD1266D
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:12:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg4s-0006JW-O6; Wed, 03 Dec 2025 01:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4q-0006Bd-Bz
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:11:00 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg4n-000185-Mb
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:11:00 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42e33956e76so1563855f8f.3
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742256; x=1765347056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHRX2PHd2udelGOqyOgj0hRR5PBHd5ge4rOssALUElU=;
 b=gY6yUhdX9e4uxPTueQk2C8uTqfreWys6rh84/XkeQ/m5WBov0eorkVRjgvXLePmkuq
 +KukL3cSpYT3pRqG23VMEKaMKM5thl6t0Ce9aLUUS7Yk7B7bVcuIsZyXfwFdDwodbrF0
 KjQEnDPHNZTcIm3UMAvvUF2LsbJLiAtYE6WrQyyXCFRwyeOFebhbtmhEyo6Ql/vYxjOO
 b12iRtYr+wdDUybdCtG//jNisFGz7NZCibo2ojZN+JM1JhRgqJsIcxWjXEOFvTGkzXNC
 FmMU0LR62n6Y+foEIJLN1bN97g4pMzP0P4nacVehNlD5ltif2Do3N5z+2HrfCasjwklG
 SjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742256; x=1765347056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NHRX2PHd2udelGOqyOgj0hRR5PBHd5ge4rOssALUElU=;
 b=KCByJ/mFdSuwziL8q4o8rRGwxacvdYuuUlw4qSI9byZh7X0GYm6ZUMv0LeeQD3Mmh6
 GwRwfZXXnLDau/V//0SBQ+h9WviCjhOd5ZT74Ckj43H/kubTQg/U7HEe1QdhYaS47My1
 B+kekLng4M4atJ0WeITpOznEnMGkU0d9cjO3N8rgiL7j5hI6BZ8fi5vGVhWQsyORV6bw
 /r2Q2L8nmJJNRxwXeZTkSNVJdrtnV8h7DALhmGk1ExLMapvttzCWLNB7cfpIhkBrAytp
 uBjG+OHiENcoTPtBA0tPfsd4XiYPLsAU6luQmguOhlTuw8QGWP/pWDgOnHsSigQX0R1l
 RSUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbusydbd+lpIXPOXfJVhe9mGFqU2CTc3qtZlUZyUBGwu4/dbE8VPtfdfxEQ2LmRdkNNjfBztQXzw==@nongnu.org
X-Gm-Message-State: AOJu0Yxs2+4kikHCNNQbnH9zFAR5AVhHQjji75ZtQ3uaSA+cFu85eYAO
 oxyo3jzzbTwq51BhAmWyje5FQdYnmZarO9xkmX3nmh+WYhXWa82YVYfLosUnHL8im08=
X-Gm-Gg: ASbGncvd6eYvgPMySDbvtlzxxUly4egLa5ychywd+XrsVYoZ4HXjw2vZbP57TfmTzWc
 rn+GbP9eOSZwwOMLpDSRWajtwg1dv2+A6PPkdG7MFsYhhA6op1C6u/8xCwfz6OcZapGTFLwN9fH
 0H9ZqYCu74B55mm402JJRY2406B5PWd2tee7s3r80TeL6kDNG7EGWrLl2iyB2myyb2bzWn8ik+z
 wb6BbblvNaZ4w5B/fewXP1lWiOvqnTSd8KOYV7ewNdtDraiaUm4Z9gIltCWO+pRc3V1uzaLRXP0
 6ldGOncRB9JaUNeHkkG6xc5c3YD0ba8PXuZGcdptyed18L1O7OmuXZwySEC+5yt8S9ouF9f4N4j
 FzBTTK0MAlIRvofI9xLNbD1DSK0GV3kToQs1cIs+mG9wypTdONVa14cobTJh0kSFRH9x7eL/u8T
 PQdHyqeAtzlAPwBqRMg7xNEbHndyyyM1g2uh8jjO3gfXDTZ5IbK5trCuO7sujy
X-Google-Smtp-Source: AGHT+IFKuw1jPjM//8+kLiiOD5oufj6Fdb9uBQLN84ztWIhzXUwriiQZtCRvdyWaXSYlgaVP9Db7Jw==
X-Received: by 2002:a05:6000:4383:b0:429:cce9:9b76 with SMTP id
 ffacd0b85a97d-42f731c43d1mr779951f8f.50.1764742255535; 
 Tue, 02 Dec 2025 22:10:55 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5d6181sm37271744f8f.18.2025.12.02.22.10.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:10:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-11.0 v6 10/13] hw/i386/x86: Remove
 X86MachineClass::fwcfg_dma_enabled field
Date: Wed,  3 Dec 2025 07:09:38 +0100
Message-ID: <20251203060942.57851-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

The X86MachineClass::fwcfg_dma_enabled boolean was only used
by the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
removed. Remove it and simplify.

'multiboot.bin' isn't used anymore, we'll remove it in the
next commit.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/i386/x86.h | 2 --
 hw/i386/microvm.c     | 3 ---
 hw/i386/multiboot.c   | 7 +------
 hw/i386/x86-common.c  | 3 +--
 hw/i386/x86.c         | 2 --
 5 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 8755cad50a3..201eee80eb7 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -30,8 +30,6 @@
 struct X86MachineClass {
     MachineClass parent;
 
-    /* use DMA capable linuxboot option rom */
-    bool fwcfg_dma_enabled;
     /* CPU and apic information: */
     bool apic_xrupt_override;
 };
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 69f04d74a15..8521df83584 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -641,7 +641,6 @@ GlobalProperty microvm_properties[] = {
 
 static void microvm_class_init(ObjectClass *oc, const void *data)
 {
-    X86MachineClass *x86mc = X86_MACHINE_CLASS(oc);
     MicrovmMachineClass *mmc = MICROVM_MACHINE_CLASS(oc);
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
@@ -675,8 +674,6 @@ static void microvm_class_init(ObjectClass *oc, const void *data)
     hc->unplug_request = microvm_device_unplug_request_cb;
     hc->unplug = microvm_device_unplug_cb;
 
-    x86mc->fwcfg_dma_enabled = true;
-
     object_class_property_add(oc, MICROVM_MACHINE_RTC, "OnOffAuto",
                               microvm_machine_get_rtc,
                               microvm_machine_set_rtc,
diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 78690781b74..3b993126edb 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -153,7 +153,6 @@ int load_multiboot(X86MachineState *x86ms,
                    int kernel_file_size,
                    uint8_t *header)
 {
-    bool multiboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     int i, is_multiboot = 0;
     uint32_t flags = 0;
     uint32_t mh_entry_addr;
@@ -402,11 +401,7 @@ int load_multiboot(X86MachineState *x86ms,
     fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, mb_bootinfo_data,
                      sizeof(bootinfo));
 
-    if (multiboot_dma_enabled) {
-        option_rom[nb_option_roms].name = "multiboot_dma.bin";
-    } else {
-        option_rom[nb_option_roms].name = "multiboot.bin";
-    }
+    option_rom[nb_option_roms].name = "multiboot_dma.bin";
     option_rom[nb_option_roms].bootindex = 0;
     nb_option_roms++;
 
diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index 60b7ab80433..1ee55382dab 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -645,7 +645,6 @@ void x86_load_linux(X86MachineState *x86ms,
                     int acpi_data_size,
                     bool pvh_enabled)
 {
-    bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
     int setup_size, kernel_size, cmdline_size;
     int dtb_size, setup_data_offset;
@@ -1004,7 +1003,7 @@ void x86_load_linux(X86MachineState *x86ms,
 
     option_rom[nb_option_roms].bootindex = 0;
     option_rom[nb_option_roms].name = "linuxboot.bin";
-    if (linuxboot_dma_enabled && fw_cfg_dma_enabled(fw_cfg)) {
+    if (fw_cfg_dma_enabled(fw_cfg)) {
         option_rom[nb_option_roms].name = "linuxboot_dma.bin";
     }
     nb_option_roms++;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index f80533df1c5..dbf104d60af 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -375,14 +375,12 @@ static void x86_machine_initfn(Object *obj)
 static void x86_machine_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
-    X86MachineClass *x86mc = X86_MACHINE_CLASS(oc);
     NMIClass *nc = NMI_CLASS(oc);
 
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
     mc->kvm_type = x86_kvm_type;
-    x86mc->fwcfg_dma_enabled = true;
     nc->nmi_monitor_handler = x86_nmi;
 
     object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
-- 
2.51.0


