Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2841683ejh;
        Tue, 6 Sep 2022 02:44:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4iIb0jWLcVPR/ExkcGFYjQqiJL+oLcwpoUrkVezBRF1XtO5UzTNY1E/Q2Lx5H5gGZQ+s44
X-Received: by 2002:a05:620a:15ec:b0:6bb:4bcf:a14 with SMTP id p12-20020a05620a15ec00b006bb4bcf0a14mr33752873qkm.242.1662457461221;
        Tue, 06 Sep 2022 02:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662457461; cv=none;
        d=google.com; s=arc-20160816;
        b=iW7aCfgNu6g3w+ilg0HJLJ5XUbDufZgm9GEANejfnPhZf9wofO5rIvehdMbppblrsf
         o2rof7jk9Z0GFum4iEgpr1fQKG9PqfKA8yaA8nTEIEueiVaT4GzorptIbLA+dKQcjMhs
         dJBhVahj48UTkKen9wjMN+u5CinpthF2Gxn8BFHryP5ihHljDcegKRwNvQ09hWWVV/EZ
         2gKg3KAcB+opKC2G4qid0a7VpKHvEC7FfQ3X93OT+zNxlQn1kqANUALLv+j0tr+uDTcY
         /IPWPQw5bMlfqQoDokJjTlxploMrf61h4WVccfxu/Q5baN5nFroK1alcSXTSAc1VDwHJ
         Uw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=44Ji80GkoTkFbVPP3ShMaLLeSijFd9DLu55qjbCvEaU=;
        b=Qmyk/YRU2EnO2U9ZrOcTHmYU8nAS+5jSQfX5fqZbQ+aB21LVwe2jVtSehTbbVbS2DJ
         k55GTq0Qhojr16Lyv7VJy/V+b0e1nOohng8q62lSFv+ZAnBByxOVR7vaYnBPIhWMfTKz
         Rw21S7AgXJ6cccFA/mWnrigNNA5Lwq6kMLcekrs2Ha2k5WL3DF+Aahg/761khI51WTKo
         JBwHBMWUgJ0FGTkEeBfIsOyjoV0Ap8hjgVE15AJq+n8OnGX93sdnS5rX/uDJaYjSljzU
         OH0AqR9Z6ATwpBtlTLdqdMcaVPqa/c3s0eTK3K78tvZ43otQ/dACneiJM+XTCinDLFYi
         N1jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="eBuS+S/n";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n187-20020a3727c4000000b006be84ac659asi6249896qkn.219.2022.09.06.02.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 02:44:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="eBuS+S/n";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVV80-0002u6-Ix
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 05:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVUTk-0001fk-8g
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:02:44 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVUTh-00019V-9q
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:02:42 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b144so5919823pfb.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=44Ji80GkoTkFbVPP3ShMaLLeSijFd9DLu55qjbCvEaU=;
 b=eBuS+S/n3Q2BFnV/b7eny2lU4mH5BjJQWdCtc9uw2Ak1oG40G4RdRYFo9z+yJTSjiU
 52u21Zx/vEjb//OMtUwRGQxG8TSHEhSoK22SmV4J4hdQ+JIuJVLN0/AzZW/h1cylRVLL
 FpJbsDUWoiar0o3TAkwP0RACDxkWGisifY3YE0eeaBgOz9V3Jl7MYm2Dp3v7uUIvNcP4
 KtJY+DdykYB9IUFJa3DwgEiVm/WLGsbuDnMNMfkYd4XjuFcGjqEC8iDkN0kg7o7evnpZ
 EvmAl6nCoDX2eB2PwQKD+KcB9TB488z83yhP8vGQgeBiSQcd09P/lym2mtpdXdpNZdur
 T2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=44Ji80GkoTkFbVPP3ShMaLLeSijFd9DLu55qjbCvEaU=;
 b=syFU1MgYP05/0/TlSbkxCCmUaBdrtXP6CGnVQHtKuCNGxtyAT31Fz3krIap3ZbH4ue
 hpYHGeezcCiawKlNFrNIhGp6spFlD2gxPUJ6KJeyyMRa2dW5er2rcIhkJCkX4hajrv8G
 t89p1OVAeXFOgpfD95037oTBKg+2Naly0oYJZ1QsY77Ucz0YNl47pTqWu80GAJcBw6RO
 +N28xub4Qx+sQWmAGaiVrE5dWzbs1C3Y6gVBMjB/7aeznXzvvQIkufFL48gGp3t0V/Qr
 On7fTMrEt8mf3AzpYxxDuS2OLQHI16Yko8f4rcYjIv6JlMH0LixFDMmRCVlsRF9erG0g
 tFtA==
X-Gm-Message-State: ACgBeo0tCJUwX2+s0AWM8Vi+aowXPgrnTqZt4lKQUeB9oj+trIQ5+ipZ
 5i7fjnDHl2zoxW0jdIybK+0X9w==
X-Received: by 2002:aa7:8e4b:0:b0:535:da7c:c2d with SMTP id
 d11-20020aa78e4b000000b00535da7c0c2dmr53932531pfr.86.1662454959039; 
 Tue, 06 Sep 2022 02:02:39 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a17090a2f8200b001fabcd994c1sm11987315pjd.9.2022.09.06.02.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:02:38 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V4 3/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Tue,  6 Sep 2022 14:32:19 +0530
Message-Id: <20220906090219.412517-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906090219.412517-1-sunilvl@ventanamicro.com>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UAg2/EHZ+8CS

To boot S-mode firmware payload like EDK2 from persistent
flash storage, qemu needs to pass the flash address as the
next_addr in fw_dynamic_info to the opensbi.

When both -kernel and -pflash options are provided in command line,
the kernel (and initrd if -initrd) will be copied to fw_cfg table.
The S-mode FW will load the kernel/initrd from fw_cfg table.

If only pflash is given but not -kernel, then it is the job of
of the S-mode firmware to locate and load the kernel.

In either case, update the kernel_entry with the flash address
so that the opensbi can jump to the entry point of the S-mode
firmware.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/boot.c         | 29 +++++++++++++++++++++++++++++
 hw/riscv/virt.c         | 18 +++++++++++++++++-
 include/hw/riscv/boot.h |  1 +
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1ae7596873..fa8ad27da2 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -338,3 +338,32 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
         riscv_cpu->env.fdt_addr = fdt_addr;
     }
 }
+
+void riscv_setup_firmware_boot(MachineState *machine)
+{
+    if (machine->kernel_filename) {
+        FWCfgState *fw_cfg;
+        fw_cfg = fw_cfg_find();
+
+        assert(fw_cfg);
+        /*
+         * Expose the kernel, the command line, and the initrd in fw_cfg.
+         * We don't process them here at all, it's all left to the
+         * firmware.
+         */
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
+                             machine->kernel_filename,
+                             true);
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
+                             machine->initrd_filename, false);
+
+        if (machine->kernel_cmdline) {
+            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                           strlen(machine->kernel_cmdline) + 1);
+            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
+                              machine->kernel_cmdline);
+        }
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b6bbf03f61..40515a793d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1258,7 +1258,23 @@ static void virt_machine_done(Notifier *notifier, void *data)
     s->fw_cfg = create_fw_cfg(machine);
     rom_set_fw(s->fw_cfg);
 
-    if (machine->kernel_filename) {
+    if (drive_get(IF_PFLASH, 0, 1)) {
+        /*
+         * S-mode FW like EDK2 will be kept in second plash (unit 1).
+         * When both kernel, initrd and pflash options are provided in the
+         * command line, the kernel and initrd will be copied to the fw_cfg
+         * table and opensbi will jump to the flash address which is the
+         * entry point of S-mode FW. It is the job of the S-mode FW to load
+         * the kernel and initrd using fw_cfg table.
+         *
+         * If only pflash is given but not -kernel, then it is the job of
+         * of the S-mode firmware to locate and load the kernel.
+         * In either case, the next_addr for opensbi will be the flash address.
+         */
+        riscv_setup_firmware_boot(machine);
+        kernel_entry = virt_memmap[VIRT_FLASH].base +
+                       virt_memmap[VIRT_FLASH].size / 2;
+    } else if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index a36f7618f5..93e5f8760d 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -57,5 +57,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                                   uint32_t reset_vec_size,
                                   uint64_t kernel_entry);
 void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
+void riscv_setup_firmware_boot(MachineState *machine);
 
 #endif /* RISCV_BOOT_H */
-- 
2.25.1

