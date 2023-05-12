Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4934725ejq;
        Fri, 12 May 2023 10:02:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6a+GGkOw8yTNJVQRtY2Mm+jPyq0avhIAelYZPYzOaPez/gHMCJJc4eyeb3bj4zEeSj6/09
X-Received: by 2002:a05:6102:1c2:b0:430:4a7f:4e6b with SMTP id s2-20020a05610201c200b004304a7f4e6bmr10529613vsq.11.1683910961830;
        Fri, 12 May 2023 10:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683910961; cv=none;
        d=google.com; s=arc-20160816;
        b=bbQohxCKp8HBuma94AIUhlr+o4nI2FkBaOwIS5GigAh09aiGghmyCbX2oqdN3IF4cJ
         UYEyiZ8kO0gTZ8u+xF6/LWoavcz3CPY5XiHmymn62WvRhSlXtrb6gXpJaey/i4XwS2EQ
         RCJp/dHmG/Srum66ANd23YKjUvrON530ixXNTX7nhzWbTc54o3ICwUCuM8PEeZ66cYY1
         CZ2P0P5EEbfd6WjFl6mftX/4YzAPtJ/s0UEhrLZ9zjt5PNwvA1TQS5N5zyCe3V7y+ve4
         p/i4Omu4YF903zUu1bKq2VOoLi4txJgpewCliCzJL4OS3POJ4k+ROt8K7CwBm0W0PEVr
         J8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MFCeM+1XGtMQYF2UODCgJ1l9ex3LQoWfG2ZoWUc7ySU=;
        b=bSagkBlRewifVtrYckvIb2uVF2I1jbJvxpJGw+KIH9q21VNxZeMQBnXm4aOTimn9jl
         8SKVlNkwemEMZhzEfHfMaLtF/memt6euCtXTNsAGB90VXpGr+Au76QmkyvshnTHqktEE
         I6DXuwJsojgtCyWsWSpENmd8sWIpWvsejQVPzVkhVgR+/qVx+oZZtOqAvrIaREWCV6Xb
         mMNdZfwC/VmNre12KzZ2uKUu1umuiYC9E4KGGWfzT+eF/t+D5lxsTmd7XQoU8XUGL//3
         6utm2ZzKljPx414jFZPFd2KagOLHEttSuMB9XuWvLUr1P1aEETb75zAwJpVAd2G5OtBu
         mbmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G4bRWB2H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cu36-20020a056102162400b0042e6904bcf3si2539131vsb.425.2023.05.12.10.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 10:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G4bRWB2H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxWA4-0001Bn-Te; Fri, 12 May 2023 13:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA3-0001Az-Hv
 for qemu-arm@nongnu.org; Fri, 12 May 2023 13:02:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA0-0002Au-Kt
 for qemu-arm@nongnu.org; Fri, 12 May 2023 13:02:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f475366514so26694935e9.2
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683910946; x=1686502946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MFCeM+1XGtMQYF2UODCgJ1l9ex3LQoWfG2ZoWUc7ySU=;
 b=G4bRWB2H8lVJbbvib4w05Rwbi89Ty8yXzQkVfb/LuZWg+NtEofbhp2X62d2Mp4VoJa
 lF93WlXE0xdRELJxdKyb36oedw40fh+eio09vFKKG7nskikdIAG3LoxNqPp3i/SWdFlp
 Jk4m5SSx/DlYsLnx8/vgPputgw/MIkzXbFoFZc8Zx+TMPRjDc71m/PVnlzOmRsJnNkpp
 kSuMpJDbhpKdM5VA2QbK0lVnnNpWLIG+UTWRxfheMtellO0JCrPO39rQ9bD3JUNpmIzO
 UaYazybAR/aVs0ASJv/vzclHq4q8Ba6XVscu/eGEwuTLo3oUK58qDc2BicTnaMoPoL8W
 KNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683910946; x=1686502946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFCeM+1XGtMQYF2UODCgJ1l9ex3LQoWfG2ZoWUc7ySU=;
 b=ZJ/b0eaG+ZkJ9DxXBFxAMpkfg9NT7nQxGrIYqda91NBZ8gs6vv+2H1wjQTVWNUuwhP
 cWXy38gqU7kc+7aAiv7/hpDaOl1hpVR8dLhmfezQjachBtV/BaMuTRP76KbeVini+zGT
 mgC09M1ydAn7rm3rgQS/QL0P/IVhUh7GcfDzoma+hDb2JCBsbRwyUMBGQV1gjVe69XG8
 tHKx6pzB4iUiO+eo5oky66HjYvSkcyEUM093GTIuZrUEs1UdibaC2Vg/aXzD5rcTk3Z+
 BlVXKDopNEbD/2jo+ACJlqDdjCSpe3e3ppE0M8Ax2mZoGRAFpdNXr5+UO7gIt/vEhu3h
 3EFw==
X-Gm-Message-State: AC+VfDyoSOru6BfOlMBcs2RJGYtfsvGqDnUlqSwqzQDyTfQ7stdB9L5V
 693j/dHgR6VodCkIogdKwYdYtBzZHkiFlcmPKFU=
X-Received: by 2002:a05:600c:218:b0:3f4:28fd:83e0 with SMTP id
 24-20020a05600c021800b003f428fd83e0mr11299920wmi.31.1683910946137; 
 Fri, 12 May 2023 10:02:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm3521004wmg.20.2023.05.12.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 10:02:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/arm/vexpress: Avoid trivial memory leak of 'flashalias'
Date: Fri, 12 May 2023 18:02:23 +0100
Message-Id: <20230512170223.3801643-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512170223.3801643-1-peter.maydell@linaro.org>
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ZCTLo/QjqfSL

In the vexpress board code, we allocate a new MemoryRegion at the top
of vexpress_common_init() but only set it up and use it inside the
"if (map[VE_NORFLASHALIAS] != -1)" conditional, so we leak it if not.
This isn't a very interesting leak as it's a tiny amount of memory
once at startup, but it's easy to fix.

We could silence Coverity simply by moving the g_new() into the
if() block, but this use of g_new(MemoryRegion, 1) is a legacy from
when this board model was originally written; we wouldn't do that
if we wrote it today. The MemoryRegions are conceptually a part of
the board and must not go away until the whole board is done with
(at the end of the simulation), so they belong in its state struct.

This machine already has a VexpressMachineState struct that extends
MachineState, so statically put the MemoryRegions in there instead of
dynamically allocating them separately at runtime.

Spotted by Coverity (CID 1509083).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/vexpress.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 34b012b528b..56abadd9b8b 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -173,6 +173,11 @@ struct VexpressMachineClass {
 
 struct VexpressMachineState {
     MachineState parent;
+    MemoryRegion vram;
+    MemoryRegion sram;
+    MemoryRegion flashalias;
+    MemoryRegion lowram;
+    MemoryRegion a15sram;
     bool secure;
     bool virt;
 };
@@ -182,7 +187,7 @@ struct VexpressMachineState {
 #define TYPE_VEXPRESS_A15_MACHINE   MACHINE_TYPE_NAME("vexpress-a15")
 OBJECT_DECLARE_TYPE(VexpressMachineState, VexpressMachineClass, VEXPRESS_MACHINE)
 
-typedef void DBoardInitFn(const VexpressMachineState *machine,
+typedef void DBoardInitFn(VexpressMachineState *machine,
                           ram_addr_t ram_size,
                           const char *cpu_type,
                           qemu_irq *pic);
@@ -263,14 +268,13 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
     }
 }
 
-static void a9_daughterboard_init(const VexpressMachineState *vms,
+static void a9_daughterboard_init(VexpressMachineState *vms,
                                   ram_addr_t ram_size,
                                   const char *cpu_type,
                                   qemu_irq *pic)
 {
     MachineState *machine = MACHINE(vms);
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *lowram = g_new(MemoryRegion, 1);
     ram_addr_t low_ram_size;
 
     if (ram_size > 0x40000000) {
@@ -287,9 +291,9 @@ static void a9_daughterboard_init(const VexpressMachineState *vms,
      * address space should in theory be remappable to various
      * things including ROM or RAM; we always map the RAM there.
      */
-    memory_region_init_alias(lowram, NULL, "vexpress.lowmem", machine->ram,
-                             0, low_ram_size);
-    memory_region_add_subregion(sysmem, 0x0, lowram);
+    memory_region_init_alias(&vms->lowram, NULL, "vexpress.lowmem",
+                             machine->ram, 0, low_ram_size);
+    memory_region_add_subregion(sysmem, 0x0, &vms->lowram);
     memory_region_add_subregion(sysmem, 0x60000000, machine->ram);
 
     /* 0x1e000000 A9MPCore (SCU) private memory region */
@@ -348,14 +352,13 @@ static VEDBoardInfo a9_daughterboard = {
     .init = a9_daughterboard_init,
 };
 
-static void a15_daughterboard_init(const VexpressMachineState *vms,
+static void a15_daughterboard_init(VexpressMachineState *vms,
                                    ram_addr_t ram_size,
                                    const char *cpu_type,
                                    qemu_irq *pic)
 {
     MachineState *machine = MACHINE(vms);
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
 
     {
         /* We have to use a separate 64 bit variable here to avoid the gcc
@@ -386,9 +389,9 @@ static void a15_daughterboard_init(const VexpressMachineState *vms,
     /* 0x2b060000: SP805 watchdog: not modelled */
     /* 0x2b0a0000: PL341 dynamic memory controller: not modelled */
     /* 0x2e000000: system SRAM */
-    memory_region_init_ram(sram, NULL, "vexpress.a15sram", 0x10000,
+    memory_region_init_ram(&vms->a15sram, NULL, "vexpress.a15sram", 0x10000,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, 0x2e000000, sram);
+    memory_region_add_subregion(sysmem, 0x2e000000, &vms->a15sram);
 
     /* 0x7ffb0000: DMA330 DMA controller: not modelled */
     /* 0x7ffd0000: PL354 static memory controller: not modelled */
@@ -547,10 +550,6 @@ static void vexpress_common_init(MachineState *machine)
     I2CBus *i2c;
     ram_addr_t vram_size, sram_size;
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *vram = g_new(MemoryRegion, 1);
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
-    MemoryRegion *flashalias = g_new(MemoryRegion, 1);
-    MemoryRegion *flash0mem;
     const hwaddr *map = daughterboard->motherboard_map;
     int i;
 
@@ -662,24 +661,25 @@ static void vexpress_common_init(MachineState *machine)
 
     if (map[VE_NORFLASHALIAS] != -1) {
         /* Map flash 0 as an alias into low memory */
+        MemoryRegion *flash0mem;
         flash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
-        memory_region_init_alias(flashalias, NULL, "vexpress.flashalias",
+        memory_region_init_alias(&vms->flashalias, NULL, "vexpress.flashalias",
                                  flash0mem, 0, VEXPRESS_FLASH_SIZE);
-        memory_region_add_subregion(sysmem, map[VE_NORFLASHALIAS], flashalias);
+        memory_region_add_subregion(sysmem, map[VE_NORFLASHALIAS], &vms->flashalias);
     }
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
     ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1", dinfo);
 
     sram_size = 0x2000000;
-    memory_region_init_ram(sram, NULL, "vexpress.sram", sram_size,
+    memory_region_init_ram(&vms->sram, NULL, "vexpress.sram", sram_size,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, map[VE_SRAM], sram);
+    memory_region_add_subregion(sysmem, map[VE_SRAM], &vms->sram);
 
     vram_size = 0x800000;
-    memory_region_init_ram(vram, NULL, "vexpress.vram", vram_size,
+    memory_region_init_ram(&vms->vram, NULL, "vexpress.vram", vram_size,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, map[VE_VIDEORAM], vram);
+    memory_region_add_subregion(sysmem, map[VE_VIDEORAM], &vms->vram);
 
     /* 0x4e000000 LAN9118 Ethernet */
     if (nd_table[0].used) {
-- 
2.34.1

