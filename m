Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1362254lfu;
        Wed, 27 Apr 2022 16:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYwhb5B5FvlRxyE9WTo6bYiYXeE3ZbpCf9YaQ5vK0pxdtjXBBW7/ZfFqbBJdCaCBwUlVWJ
X-Received: by 2002:a05:622a:1820:b0:2f3:87b5:6a48 with SMTP id t32-20020a05622a182000b002f387b56a48mr1465795qtc.523.1651103215213;
        Wed, 27 Apr 2022 16:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651103215; cv=none;
        d=google.com; s=arc-20160816;
        b=RSuI2Y9PbI80g2EjIzvcXOEOkCVPaIDcOsyxhYXI/jhohBEoSYC6rLmElko2n963sx
         EJ9Iq6ij715LNKqQ5eDSITV0CgC/J+1UndLN1CzWAnViWfvijS8zQ06RvoxHDbLS9rkS
         8JMewVQs7m66RPIhdT0iEu9HD0BFAgDDYH2p9EGolPcapbdLIfqjgUv7JRuOAlxS/kuG
         HzwNvEhbuYGGNKLVI+AOoqktjq3nXxSCNNTskCS1ER7Au1cIzihHC8AE6Aemzxr9olhB
         WeQkSWHpaY5d087O/rlt1QUjOs20VwsFySH/u8kRTw/mDCxjghbkTDbiboToYpdlOP7K
         3uaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:wdcironportexception:ironport-sdr:ironport-sdr
         :dkim-signature;
        bh=UEGX8zdNwt3GAx6oVYoYI1xvMVKxK2oekwa2Bu/O1lM=;
        b=OUrAuMPbCM882NkXixDxB4jZJn0CObNspZA1Ta9Y1bkj+I7Nr0z5R2oY6r4GCuRYr9
         X5lalU0Na3IcTzK0jexnSy3lNPslMXx6OCDlo2AA0IaniNn6V9JU0Fw8xC9fRvwYk/fm
         fw8PJ6Zz/bg1wRi0jgJsUvFxZsIAUvUiu63WCtuuyJqby133ce5l0d00IIkbavgi0TYu
         KvkEUjIX8Kl5BHdOVy0Z53lN+eUOv1/bvA5bZHSWDEdm7EfOfu+XKp1lU9IDVe9CJviW
         KVFdAnz9Q235/aOjrVXIAxqeMo7qs1TfyaQ90XlCpdebTfhUnejE3RnSB17GY+ktMIT+
         i0eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=FUayBWa2;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=boLTODZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c189-20020a37b3c6000000b0069f74c9d6a5si918142qkf.679.2022.04.27.16.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 16:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=FUayBWa2;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=boLTODZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njrN0-0008VZ-NG
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 19:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIM-0004iM-Qo
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:06 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIK-0004Sr-6r
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102922; x=1682638922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jkyowbAH14peB4kqPOZJazAQCfstu9x4Mil66ErgDfs=;
 b=FUayBWa28Hhjb1FR67GoS9O5YC+7TXCMlq7JwdxE8zlMokbj+d3NRtN8
 pAlSdnHQmye9Iti3QyU5Pnov3gDlL5T+E70bW/Fz15NRY9BQ8NEYtwb8K
 3XGMt8Fr/Cwcykxy6776Dk2e3V7nBnt4ERxC5YygbBh0aE2V8+hDNglL3
 V3MJqq1MxqrjzRz2iEi9EdtM+J09mI1x07oNxs8bWJSA5hJTT7UUtK3rj
 vU2BWxxK/GHvbUGGE0Y0wkqBnOnaGq+sb4DMzg2FXBSlusZTrkKFYCMI6
 H+YhA+Lcd5fEn7+vRQy+aszTlGHJczIdykfKev3RFArkncyCEVyVC4kIt Q==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="203873210"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:41:59 +0800
IronPort-SDR: iID1ey9jwRCxqjM0fUJld2gcmPXJBJKzsu1CP1kPDyPYF21iG5ITjqSYFefqB/t/igUgZVL/Sx
 wnWuGnQ33dsgnnmfMNrgNpfbXbUru82zrfA7RMS5Bt2xrcd8VUfy/w30mXMYLg2Ko4TvMBpyJI
 wGW6t8w65Cchah8XE5lUVh+rZ8RHo7BlV13aSFcPGPWTrVnSmV7Mc9wgi8ItGWeURVNJg/LH8h
 oOxnCKM/WpPucvi5PVZGxnWEdVcTv1Cgxsm1+iTLTTqRP+ZcF22jCjAwlTjxt+itEMr2E07JOs
 LMj0po/oA5Sql6Qqux8HEl2k
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:10 -0700
IronPort-SDR: KKpLJ1Oj47eKXEOzB5G+rcjX526NW7O/HlCtaKF/u4uzj5UzsJHtw9AHrfrszaFIErqUxiz+9Q
 rWqS6zUnOYBrSltSz+CWLc1TQnatvJ28JBlMOHnLSxpk1PzEJQqLSGtLja4lURWWTvGWJDxv+K
 Hji3TlKWnpiLbl3vBEJHdyp/VeeU5+PiR4mVtlg3YgxUs8ROnizNKll6vFxR1pjMpbAeziPjyg
 itSKFED7GNT3gFj3NAaH/dMSbYFO0Jiic18yTXNdMUhiUlg6qgzO/0l4Nb7UVIZ3UQu5hZZHsQ
 pj0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzD3kyDz1SVnx
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 16:42:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102919; x=1653694920; bh=jkyowbAH14peB4kqPO
 ZJazAQCfstu9x4Mil66ErgDfs=; b=boLTODZWvVGcTu3B35COLAYhEG1NW7SFvg
 1iQxlK0arIjwUhFfZcD+rd3jAznenIM+VjU8QgI6SBB6oLhhkuUcRur975xSuldl
 SCvtYnDhKGXxh18I+WgLftaiKWSheOXWFMXdcLjMjhnvSDTzYlhs4C8w521BD4YH
 +yWTcMazaanLr4d0FdIVGXucK01geOx4O1zvRu6L4D8KmOPq22X7+j1og981f5q8
 kBvl43kQ/Jrcq2hGKfrobPrgJWD1zf/r3AhOPtfgzHI1U2zN6MHQspO33qXvcUSJ
 ZOFOHmT/r3/AZ1zN3AnpVISkMClawWCKeOBHByCm2KYnGk/J7qrA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6c7qIKhArLVy for <qemu-arm@nongnu.org>;
 Wed, 27 Apr 2022 16:41:59 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZz736tRz1Rvlx;
 Wed, 27 Apr 2022 16:41:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 1/6] hw/riscv: virt: Add a machine done notifier
Date: Thu, 28 Apr 2022 09:41:41 +1000
Message-Id: <20220427234146.1130752-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
References: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7dFGWjPNYhUk

From: Alistair Francis <alistair.francis@wdc.com>

Move the binary and device tree loading code to the machine done
notifier. This allows us to prepare for editing the device tree as part
of the notifier.

This is based on similar code in the ARM virt machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 include/hw/riscv/virt.h |   1 +
 hw/riscv/virt.c         | 191 +++++++++++++++++++++-------------------
 2 files changed, 102 insertions(+), 90 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 78b058ec86..8b8db3fb7c 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -45,6 +45,7 @@ struct RISCVVirtState {
     MachineState parent;
=20
     /*< public >*/
+    Notifier machine_done;
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b49c5361bd..99ab3d4bca 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1162,6 +1162,100 @@ static DeviceState *virt_create_aia(RISCVVirtAIAT=
ype aia_type, int aia_guests,
     return aplic_m;
 }
=20
+static void virt_machine_done(Notifier *notifier, void *data)
+{
+    RISCVVirtState *s =3D container_of(notifier, RISCVVirtState,
+                                     machine_done);
+    const MemMapEntry *memmap =3D virt_memmap;
+    MachineState *machine =3D MACHINE(s);
+    target_ulong start_addr =3D memmap[VIRT_DRAM].base;
+    target_ulong firmware_end_addr, kernel_start_addr;
+    uint32_t fdt_load_addr;
+    uint64_t kernel_entry;
+
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * so the "-bios" parameter is not supported when KVM is enabled.
+     */
+    if (kvm_enabled()) {
+        if (machine->firmware) {
+            if (strcmp(machine->firmware, "none")) {
+                error_report("Machine mode firmware is not supported in =
"
+                             "combination with KVM.");
+                exit(1);
+            }
+        } else {
+            machine->firmware =3D g_strdup("none");
+        }
+    }
+
+    if (riscv_is_32bit(&s->soc[0])) {
+        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
+    } else {
+        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
+    }
+
+    if (machine->kernel_filename) {
+        kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
+                                                         firmware_end_ad=
dr);
+
+        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
+                                         kernel_start_addr, NULL);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_ent=
ry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
+                                  end);
+        }
+    } else {
+       /*
+        * If dynamic firmware is used, it doesn't know where is the next=
 mode
+        * if kernel argument is not set.
+        */
+        kernel_entry =3D 0;
+    }
+
+    if (drive_get(IF_PFLASH, 0, 0)) {
+        /*
+         * Pflash was supplied, let's overwrite the address we jump to a=
fter
+         * reset to the base of the flash.
+         */
+        start_addr =3D virt_memmap[VIRT_FLASH].base;
+    }
+
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg =3D create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
+    /* Compute the fdt load address in dram */
+    fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
+                                   machine->ram_size, machine->fdt);
+    /* load the reset vector */
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
+                              virt_memmap[VIRT_MROM].base,
+                              virt_memmap[VIRT_MROM].size, kernel_entry,
+                              fdt_load_addr, machine->fdt);
+
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * So here setup kernel start address and fdt address.
+     * TODO:Support firmware loading and integrate to TCG start
+     */
+    if (kvm_enabled()) {
+        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
+    }
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D virt_memmap;
@@ -1169,10 +1263,6 @@ static void virt_machine_init(MachineState *machin=
e)
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     char *soc_name;
-    target_ulong start_addr =3D memmap[VIRT_DRAM].base;
-    target_ulong firmware_end_addr, kernel_start_addr;
-    uint32_t fdt_load_addr;
-    uint64_t kernel_entry;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
=20
@@ -1302,98 +1392,12 @@ static void virt_machine_init(MachineState *machi=
ne)
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
         machine->ram);
=20
-    /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
-
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
                            memmap[VIRT_MROM].size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
=20
-    /*
-     * Only direct boot kernel is currently supported for KVM VM,
-     * so the "-bios" parameter is not supported when KVM is enabled.
-     */
-    if (kvm_enabled()) {
-        if (machine->firmware) {
-            if (strcmp(machine->firmware, "none")) {
-                error_report("Machine mode firmware is not supported in =
"
-                             "combination with KVM.");
-                exit(1);
-            }
-        } else {
-            machine->firmware =3D g_strdup("none");
-        }
-    }
-
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
-
-    if (machine->kernel_filename) {
-        kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
-                                                         firmware_end_ad=
dr);
-
-        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_ent=
ry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
-                                  end);
-        }
-    } else {
-       /*
-        * If dynamic firmware is used, it doesn't know where is the next=
 mode
-        * if kernel argument is not set.
-        */
-        kernel_entry =3D 0;
-    }
-
-    if (drive_get(IF_PFLASH, 0, 0)) {
-        /*
-         * Pflash was supplied, let's overwrite the address we jump to a=
fter
-         * reset to the base of the flash.
-         */
-        start_addr =3D virt_memmap[VIRT_FLASH].base;
-    }
-
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg =3D create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
-    /* Compute the fdt load address in dram */
-    fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, machine->fdt);
-    /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
-                              virt_memmap[VIRT_MROM].base,
-                              virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, machine->fdt);
-
-    /*
-     * Only direct boot kernel is currently supported for KVM VM,
-     * So here setup kernel start address and fdt address.
-     * TODO:Support firmware loading and integrate to TCG start
-     */
-    if (kvm_enabled()) {
-        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
-    }
-
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
=20
@@ -1429,6 +1433,13 @@ static void virt_machine_init(MachineState *machin=
e)
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
+
+    /* create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
+    s->machine_done.notify =3D virt_machine_done;
+    qemu_add_machine_init_done_notifier(&s->machine_done);
 }
=20
 static void virt_machine_instance_init(Object *obj)
--=20
2.35.1

