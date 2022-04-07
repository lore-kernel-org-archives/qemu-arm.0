Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp1142167lfu;
        Wed, 6 Apr 2022 19:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3g2ifgAUIydd0qNpDe//KaiDFDebJpm8QPRVt6HtDXtR9vdrR9dxfmPodmv87Wk+LvAhw
X-Received: by 2002:a05:6214:f6d:b0:443:f201:aac9 with SMTP id iy13-20020a0562140f6d00b00443f201aac9mr7067100qvb.1.1649297245886;
        Wed, 06 Apr 2022 19:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649297245; cv=none;
        d=google.com; s=arc-20160816;
        b=vBZezCtDedfySOhqcpllfHIhSTtsbiOlUtLoLCMV863wpkV9TgxN4PbO6MSmpZztm9
         s/bWu30UjHeeDlb4Ayl5Olnn//RtW/vclg6I9gCy7hWoWPXbrCKj+Xh+uYQA3PDyLY2r
         Muqs1rOvzCLEGjdjcC9IPjJdtBHV6bX/tHlL0iqxvoAgGegVUtFLMGcD7y3yi2eNewM3
         ZIpLVH2YKogfrO97NLQI6hDHHej++Fqg4Jb6fUQLdP4J6W+Lsj6/iLRu4HaFt24XB9Nj
         V52srDHWyNsVGzByRpTE6jYNyBCHWqBXf+HB+1dwwOs5kQz/KblOdY7PXnxQePWa/Dwg
         QQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:wdcironportexception:ironport-sdr:ironport-sdr
         :dkim-signature;
        bh=hof3ipc2p3otFGM6EBNM3XHZUseTM3VX9oawR0A1Wbc=;
        b=utu5p1U3XAVXZhBQ6JyUeDSoaj0cigcoB9n7Sw57LasB1+REQknDPPpyaM31wIDO9S
         UcBDE7jdEScBI3i0dpEA55S58aw4mZcciz7nroAhETnTnJuczgpqwHuD8JMGo1XLW5/r
         l2liZmQ0TRdRCpsfGU8EEtuHZlu1Nkguy/zLTwG682RAu/Oi7ca6Zx2SlEpUtZwiI2vt
         KDKi/Gh3nj4jEayzhkMdWu52Bg48k9K6TpoLbLTC8bOV/ej6Uzv3RvRCPZ+pvoNbHQEE
         H9Tr/485NX5ruPwKLhFUZfghA50pGh0G3CPBAOq15sDhiatlpzJTa+ckui7ugLlhXrHS
         kQgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=oCfWu3V7;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=oQTIkapu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a0ccd90000000b00443d0b63e28si4646053qvm.298.2022.04.06.19.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 19:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=oCfWu3V7;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=oQTIkapu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:39140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncHYT-0007RZ-Br
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 22:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHW3-0004ZF-QF
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:04:56 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHW1-00079w-Pg
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297093; x=1680833093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3rHBwKMCHbwZDHfBtuUh4TGCYl673DE9Sft6y2lR7ew=;
 b=oCfWu3V7wy+px3VBOa9gF86OOd718rCKcWg7Jxii0BK43jwSHN5sWBps
 xlUncefA1BkrkZV4nvv6PKqheF8RaM9U+SKsnM5UgiaPhF1CHM95CKwJG
 wny9vxFI82fn10mOe9F/hJZqUbViA7LixNHYwTbkd44aXF9U5YLN5fyo9
 dyAA/iAqzTWoFRJMcN5yNs26RPB8dtgsCoFtC49EyyvdSTCznj+tVyk8e
 ilkejOfFEQFBA1onLDktm33HeTFs5jpAd0+w3k+QbxXSG36MqQYtfQ/6p
 82fPACoDnpy+Jk6bJURNv0kTlaaTJDnrsT6n5gre2G2YGHkOcrAE8DGZx g==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="301467843"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:04:49 +0800
IronPort-SDR: VGTRjNe5nzACG5vuORaW1q258LYwwpiYRMeocVPkuBjPHU9q+CXkXXx+Uy0WszCynUTI8KyUGL
 +jJu4MQZhbihLoNvIY5b5liWHK3fjJLqIK9+wTORbIYggp4BgLj/MYFOBvaT1cFK3oKEYGYcAc
 3EJKRxO0DDK1d4Cyq7BDBRiqsahtd5Axc5pOq0EalN6/2Wox57WYmmhjVZJ2EOdPIhwdwBh8y6
 HXF0l6FqAAx34fl8DcRl+zL13gs8zHxDUrVE8+ijVcOe6u70zKVDsaV7QjJD5BFJOvuN7aFtjG
 tKSP/sQyVhzW1bwDbhSC7f4f
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:35:30 -0700
IronPort-SDR: 8mSnAjFyQTpBPLMpg827bZEr5/1aMGJG4KG7+71o1mRdT5kI0yUB8eG/ImLyU66owE1oJmUp5+
 LELhsmr7wQ26FcYuzGKZ4RlqCX8fe7GUKC4doE6A0KrRI0t/TrJ0h2/8NzS1cdfRtDb/rENA2n
 QT/wl6Bcu5x/xdort6jiwj0EuDrHtS8Am7Z9pJ1/5Mk24wR4cUGbO2VKjtv/g7jPWpzXsWGMic
 p5mUrY3eIkju34YUBnGcauxFIvgRQtzeEqbaKgvBMWH8LOmw9AeT378YnO2DL40qrJxktVkQkt
 f4U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:04:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl7h6Vtmz1SVp6
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 19:04:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1649297087; x=1651889088; bh=3rHBwKMCHbwZDHfBtu
 Uh4TGCYl673DE9Sft6y2lR7ew=; b=oQTIkapuCbQ/zBFiXa+brNTUj+y1qG3n47
 d/+TcqsEDbrTO/pAec3xUWv7H2G5Ob6RavzH3foO4J47u1Ea4DEN3I3sfE7o3Ouo
 yzC9y+FJQNUGZhbvccC9cjTz6IXz690JQm5IhjDv1PTSZJlaJX8aB02ZzfCn0lD0
 hO9kOUR4YgFE7tlIUNYi4X3lqRLU6PgoWmBYc9d6+98HuQ//wWqoIkJsJBrBO2Z+
 e0y53pZppa54lIjfnqhapVyCmjV92OtRD+7iqm/tYZPphXIOkUibxOpiqYEWMCCD
 34FdUlp/509Ep9Ls0SVAFcFYEE8aXntsY2jUbMr+N9V1FZChzmsw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ES7_paXw5MPh for <qemu-devel@nongnu.org>;
 Wed,  6 Apr 2022 19:04:47 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl7Z4SMQz1SHwl;
 Wed,  6 Apr 2022 19:04:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 1/6] hw/riscv: virt: Add a machine done notifier
Date: Thu,  7 Apr 2022 12:04:27 +1000
Message-Id: <20220407020432.4062829-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: raVLcywAmhPH

From: Alistair Francis <alistair.francis@wdc.com>

Move the binary and device tree loading code to the machine done
notifier. This allows us to prepare for editing the device tree as part
of the notifier.

This is based on similar code in the ARM virt machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h |   1 +
 hw/riscv/virt.c         | 180 +++++++++++++++++++++-------------------
 2 files changed, 97 insertions(+), 84 deletions(-)

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
index da50cbed43..3f065b540e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1156,6 +1156,99 @@ static DeviceState *virt_create_aia(RISCVVirtAIATy=
pe aia_type, int aia_guests,
     return aplic_m;
 }
=20
+static
+void virt_machine_done(Notifier *notifier, void *data)
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
+    /* create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * so the "-bios" parameter is ignored and treated like "-bios none"
+     * when KVM is enabled.
+     */
+    if (kvm_enabled()) {
+        g_free(machine->firmware);
+        machine->firmware =3D g_strdup("none");
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
@@ -1163,10 +1256,6 @@ static void virt_machine_init(MachineState *machin=
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
@@ -1296,92 +1385,12 @@ static void virt_machine_init(MachineState *machi=
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
-     * so the "-bios" parameter is ignored and treated like "-bios none"
-     * when KVM is enabled.
-     */
-    if (kvm_enabled()) {
-        g_free(machine->firmware);
-        machine->firmware =3D g_strdup("none");
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
@@ -1417,6 +1426,9 @@ static void virt_machine_init(MachineState *machine=
)
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
+
+    s->machine_done.notify =3D virt_machine_done;
+    qemu_add_machine_init_done_notifier(&s->machine_done);
 }
=20
 static void virt_machine_instance_init(Object *obj)
--=20
2.35.1

