Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3910942njc;
        Wed, 6 Nov 2024 17:25:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV2BwFT8+9MuKVPEc2TiK6kqIz20amPVE1TpluuGWVLznckbAPeKkakW7irQ8z512I7C3UYeH28ZTUbhw==@linaro.org
X-Google-Smtp-Source: AGHT+IH8HHuVleNi3rH1HBVc2QBnZpGa3MrKUg3iM96PRKaE6NaZ6k1eHV0y3MPNfeaWgCbTqlxR
X-Received: by 2002:ac8:5712:0:b0:458:532c:1e6f with SMTP id d75a77b69052e-4613c19bce0mr502849951cf.55.1730942709809;
        Wed, 06 Nov 2024 17:25:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942709; cv=none;
        d=google.com; s=arc-20240605;
        b=ZmX9m/QcvnKG6e0ilidgN7Rjicm54c3poL8sai0GkTqrHJCfS4qmvPCV/vERzCpcYo
         s3uscZn27Hghs+Gb361Zz7WcCWxkZPgH2Yu/TfImfz5KC5YBhMzmx+YY/cRraJ/3O/dU
         TokNWzVvhFMDbDsHmhGvoO9tMQ015rS0VaPwvsH2+1E9Lpt1BHUJysvKwUm+a+U/bdXV
         edzNOTgJusoTAqEHIT2hmUeeeUX1TtI0meLPXaor99GWPNbKNNoMXU2+czDWdUg7EpA3
         KacGfg9xRJEQLM0fVTemxy+9z1V7PKaCIofe1la+JcUksZKz8qG8gku0NqhReCuqFDAS
         MflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gVNNU4zI0zabCVfTlK35ClBmqCQUm+VaEpaZeazC3V0=;
        fh=/MVYzU7Z8iohwy3Qd/hxFd0NMHZYetn/21QtclgJlo0=;
        b=RDqYJvr8aC3gVIIKgczunUN9b2mRIQgAQSJaNqNdAagEpgHwc1Gdtn2+55AC/jyt2d
         0/FttoixX6hyDIanCGiGGjcEgrouHE9m9zACy/q7xK7pnrBytTvS+Cn1sF2TXjLL4171
         OCEtTYpu9XZTlqvoMigNTk/mAOV0vCiMIHnKmrC0Immr36G6JV0vI33PiqQEO51a7WHR
         O32t4VX72svvFiOjXfEM/AfWlIoThWj5t7MlXjVFuxzNaIJXPyT8CyZ+Ytkp2yLrnsKc
         Hn79vzp+dYL2whNSzqL0NvWk45p6kuRPqPS8ltdXfLy7LIyNFzoyZbVqR1PJEoxC1pg4
         urdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z2eHLLhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6812bcsi2684851cf.593.2024.11.06.17.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:25:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z2eHLLhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rEU-0004gQ-0C; Wed, 06 Nov 2024 20:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rER-0004fw-6a
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:22:43 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rEP-00033c-Er
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:22:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so307960f8f.3
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942560; x=1731547360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVNNU4zI0zabCVfTlK35ClBmqCQUm+VaEpaZeazC3V0=;
 b=z2eHLLhm/nxirS8XPG0dDxzN6+AxnSt0zEvNrFym8FoiLVkKrwPOSxpUN7GdqtgM1N
 RtmQQbFwfXbEq5r65aoHajelqOCTFufxHTuw6mOc1wUUDxJCX1+ZPTeVoZvtV1MWcBNW
 wYrH4/aaPbYkMsF5Ak1dydqefPSxKO4xFaCFYOHZTUefWU/Y1E2eIcbWQEJgYkrL/zrN
 7N45sUYbTwI/nD7wojAxmf18p76Z9npBDeke5kkbU527Rw93wADNo8uwn/buDGYZg4zq
 LYcDo/g0l53WzsK64eqKV/nBavrinxEVVpgVvfDDeLkZMuxtXkLW1oWO6rzaXHagT4QL
 8arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942560; x=1731547360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gVNNU4zI0zabCVfTlK35ClBmqCQUm+VaEpaZeazC3V0=;
 b=bZ3+SX3ap8BE7I4blr40Dur055KycP3KQTNUCIQ4ksFlbZnsuLuhVscVneYrku+Mpz
 U6ItPeYeaHttjk6x+Y7CX+tTJbih9RHTXR1ov7bpD29rrRw5DdB/W5nJAjGr/EylFk5O
 cAhfAS5XKm8Ns4CrqUvtuRbEbWzEw2GbAn4Iw/SPAXVMq3nn7wiKgMI5bqw27zWD4cfv
 QL49WPJZUARKi4xRzCGm9lbwzuGRBlEe2uEv+rQLhmQQYvuHqZusWRLD1gkyhzdpoygm
 mRWfyxVFvHMWc/kHPb8mtjIkpHUYu8bRu6V/ofpvtHijNJy5osIdbFtnlQWm06eKyWR5
 2e6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTcItRcIMoUcE8BAhfY/gLDuNxkxAErV6VP/MvHgofTczo/oHhQ8urHou1kvgYQgv50M5dlT+ylQ==@nongnu.org
X-Gm-Message-State: AOJu0YyTF9VxygnAg0nOjCFYcvR6LZQeQ6rWvonp4Y4WYc1/BPdoCpSb
 lA5gTyr8MJTHHXbIuualGgb5WsQCv2xEPczXJ0G9bUHqQkE8Ku+Hxswj4Gh8o7I=
X-Received: by 2002:a05:6000:1fad:b0:37d:5130:b380 with SMTP id
 ffacd0b85a97d-381c7a5e114mr24972810f8f.23.1730942559815; 
 Wed, 06 Nov 2024 17:22:39 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea4ebsm236852f8f.69.2024.11.06.17.22.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:22:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v2 02/16] hw/microblaze: Propagate CPU endianness to
 microblaze_load_kernel()
Date: Thu,  7 Nov 2024 01:22:08 +0000
Message-ID: <20241107012223.94337-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: J1/TK7Q9DUpv

Pass vCPU endianness as argument so we can load kernels
with different endianness (different from the qemu-system-binary
builtin one).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Message-Id: <20241105130431.22564-9-philmd@linaro.org>
---
 hw/microblaze/boot.h                     | 4 ++--
 hw/microblaze/boot.c                     | 8 ++++----
 hw/microblaze/petalogix_ml605_mmu.c      | 2 +-
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c          | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/microblaze/boot.h b/hw/microblaze/boot.h
index 5a8c2f7975..d179a551a6 100644
--- a/hw/microblaze/boot.h
+++ b/hw/microblaze/boot.h
@@ -2,8 +2,8 @@
 #define MICROBLAZE_BOOT_H
 
 
-void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
-                            uint32_t ramsize,
+void microblaze_load_kernel(MicroBlazeCPU *cpu, bool is_little_endian,
+                            hwaddr ddr_base, uint32_t ramsize,
                             const char *initrd_filename,
                             const char *dtb_filename,
                             void (*machine_cpu_reset)(MicroBlazeCPU *));
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index ed61e483ee..3675489fa5 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -114,8 +114,8 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return addr - 0x30000000LL;
 }
 
-void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
-                            uint32_t ramsize,
+void microblaze_load_kernel(MicroBlazeCPU *cpu, bool is_little_endian,
+                            hwaddr ddr_base, uint32_t ramsize,
                             const char *initrd_filename,
                             const char *dtb_filename,
                             void (*machine_cpu_reset)(MicroBlazeCPU *))
@@ -144,13 +144,13 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
         /* Boots a kernel elf binary.  */
         kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
                                &entry, NULL, &high, NULL,
-                               TARGET_BIG_ENDIAN, EM_MICROBLAZE, 0, 0);
+                               !is_little_endian, EM_MICROBLAZE, 0, 0);
         base32 = entry;
         if (base32 == 0xc0000000) {
             kernel_size = load_elf(kernel_filename, NULL,
                                    translate_kernel_address, NULL,
                                    &entry, NULL, NULL, NULL,
-                                   TARGET_BIG_ENDIAN, EM_MICROBLAZE, 0, 0);
+                                   !is_little_endian, EM_MICROBLAZE, 0, 0);
         }
         /* Always boot into physical ram.  */
         boot_info.bootstrap_pc = (uint32_t)entry;
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 61e47d8398..d2b2109065 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -204,7 +204,7 @@ petalogix_ml605_init(MachineState *machine)
     cpu->cfg.pvr_regs[5] = 0xc56be000;
     cpu->cfg.pvr_regs[10] = 0x0e000000; /* virtex 6 */
 
-    microblaze_load_kernel(cpu, MEMORY_BASEADDR, ram_size,
+    microblaze_load_kernel(cpu, true, MEMORY_BASEADDR, ram_size,
                            machine->initrd_filename,
                            BINARY_DEVICE_TREE_FILE,
                            NULL);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 6c0f5c6c65..8110be8371 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -129,7 +129,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
 
     create_unimplemented_device("xps_gpio", GPIO_BASEADDR, 0x10000);
 
-    microblaze_load_kernel(cpu, ddr_base, ram_size,
+    microblaze_load_kernel(cpu, !TARGET_BIG_ENDIAN, ddr_base, ram_size,
                            machine->initrd_filename,
                            BINARY_DEVICE_TREE_FILE,
                            NULL);
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 567aad47bf..bdbf7328bf 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -172,7 +172,7 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
     qdev_realize(DEVICE(pmu), NULL, &error_fatal);
 
     /* Load the kernel */
-    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
+    microblaze_load_kernel(&pmu->cpu, true, XLNX_ZYNQMP_PMU_RAM_ADDR,
                            machine->ram_size,
                            machine->initrd_filename,
                            machine->dtb,
-- 
2.45.2

