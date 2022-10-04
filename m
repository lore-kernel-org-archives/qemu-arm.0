Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp41895ocb;
        Tue, 4 Oct 2022 02:28:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pM2OshIar7AsjG0ne/XCuDX2/R3ac5p4jnVUoB8I2WSTQv7q242BGgOhkkA9+lqxWCcC4
X-Received: by 2002:a05:622a:1450:b0:35d:140d:f7bf with SMTP id v16-20020a05622a145000b0035d140df7bfmr18346285qtx.612.1664875690796;
        Tue, 04 Oct 2022 02:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664875690; cv=none;
        d=google.com; s=arc-20160816;
        b=us+ZP9BCSo0qShjEHXr4Wrd5dLA8RRYPkENXjOB31M/0PzszBsEXOs39mlH5VISkkX
         cVab+pYNSgoIuRyj/x6yh91WESxxuyCphO3eqtCRPq9+EpNDnPEAwyokLLaZt1V7LJ9+
         QozAazcGueTcvQAm4HynqiG1ZsgnXW2tsKfK8CnBURj7IRWF+0x8DUY5htXBJyrRxyVQ
         JKhnzzXrrgQq9EvxiMpkkozAObUtV+rTCysNG29kyC0KiFD7eBqQleF2zCvd6eaphTnt
         k2Etnlf3X9jeK8r8+0DB83p1a2hVJYo3qrV4J+asTqIjQZvPXXe5wbJ+GuX0wESTn8T+
         DZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FRti7/w2G6ja63I+XSRHDfjXoUV0Jx/llmf+dyAA6jk=;
        b=uepzLIit3EbGoaVQQLG3j0STt6rTvn3pVWt52gul5oEP78bDuPwtogTOB9G0pATKdn
         FsH4DfYguR2uB2jTkyRixIi+Zog0xwMiTK2ta1c1SgLpurxa7q886wXeqSsXsSRnKlKv
         Uel/7JlOanKu6DjOYSxooN3o+sDkaafDO29ZigSczkQeEfAnitumXCYi5yxLNGObK909
         xT/N+lV5c/UwIVWwtRCqlENaMVdjqKo06nkj797+Tu3WZPD2cBBpGKd12TsHlHkXQoXg
         UrBZMdTxGpIqrVjXYheQEv+UYGATP5U8uw2srhJnFOiTMvaJsfGS7jDrjbcyPobueI4h
         pBAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=NZAdq2nA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a05620a455600b006cefe9957d9si5529707qkp.206.2022.10.04.02.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 02:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=NZAdq2nA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofeDi-0000pI-9s
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 05:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofeA3-0004Pe-HG
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 05:24:23 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9t-0004Lt-1D
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 05:24:23 -0400
Received: by mail-pg1-x52e.google.com with SMTP id a23so4532085pgi.10
 for <qemu-arm@nongnu.org>; Tue, 04 Oct 2022 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FRti7/w2G6ja63I+XSRHDfjXoUV0Jx/llmf+dyAA6jk=;
 b=NZAdq2nAZyjbpb0QfySd4nxQIUESqNUZO210AHcGBebFqHOR70LOGqQ8uUhEo+KCNr
 Ws1Ckcx7yKtuY0IrVMFdHte9ZzXbg/0jq/Len2xn43wUjtLPDgpcLWHVq1a0CuivXrTW
 En3xv9ObTO6zMN4+5dEjajdTAIsMRS0HI1MeDl2qxxdxbkhBsQi2m5+8Llz+Rf1vWzFh
 Bvj4J7jQepgX9F0mEFAoU2ia5DiWvOspSe6yj6ZLsJEiDsTZwbl5QV1gGnMSr0j9br25
 EsVXxZLdMFE71jgpKtnmk6cQ0q8pd25hKXFv2DHb0XsAMjLKd2AzRzX7+mvppPvJwRA/
 BwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FRti7/w2G6ja63I+XSRHDfjXoUV0Jx/llmf+dyAA6jk=;
 b=iK+4tpzWSi8a9sQrnB9Go89cI8f2Q8HW5sYYguq6yqOaQ/tyeVpfiXyqgSDzoopkpD
 +oW3zfMU4FglAu7otgHUnGTO44Qh3v5cfa5RnbFnicyQpcdEZS5iECDtIgBaYfE0lhnS
 sj5vnPSlKQpStgRYnbd9gW78Jm33ADxVNDrV0D3cLCU5YYTxM6sgeT9/oI7OJBsFTaeW
 9s6Wx4zGVAyfLMNf94tvSxUIFvmZqZ8H0HrFqLaqPozdfS3VrUnH27vmhNCIJnBiAGp7
 Ab8Z4kKVVaiCVYdiS9UOM+ftQJnCjaTriUaqEMXRJfQbjqlhusM6Q0YjajEou5lvG3Ua
 CZDg==
X-Gm-Message-State: ACrzQf0mQs1FoD58AB9OkefAHOK3aS6SkMyzOQgU/sbIQSrM0W1hPqN0
 lWvAgMPy0OeIyIV9mM7zbt1Erw==
X-Received: by 2002:a63:1317:0:b0:42a:e7a5:ef5a with SMTP id
 i23-20020a631317000000b0042ae7a5ef5amr22876898pgl.392.1664875451273; 
 Tue, 04 Oct 2022 02:24:11 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.142])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090b070200b001fba4716f11sm2934551pjz.22.2022.10.04.02.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:24:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V5 3/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Tue,  4 Oct 2022 14:53:51 +0530
Message-Id: <20221004092351.18209-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004092351.18209-1-sunilvl@ventanamicro.com>
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RtT3Kc4ju5VS

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
index de2efccebf..a5bc7353b4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1274,7 +1274,23 @@ static void virt_machine_done(Notifier *notifier, void *data)
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

