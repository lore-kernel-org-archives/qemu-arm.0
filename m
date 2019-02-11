Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1948147wrq;
        Sun, 10 Feb 2019 17:18:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaHVX+Ikn7bXmqnz0frP4M1Z0Y7qH3Kq6TkFZ1lh4brE5NUESewFCX38JwTwLy3K8LiZ3A8
X-Received: by 2002:a1c:5984:: with SMTP id n126mr6833710wmb.62.1549847935162;
        Sun, 10 Feb 2019 17:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847935; cv=none;
        d=google.com; s=arc-20160816;
        b=pAQ051woiJvA8V4lG13K7Tzt2XokR3VOHZF6MwxHKvSilYNrBE3zUr9Rz3rG8OgpmA
         GgLBSow7/fm9hBhLN7RO52JovUBDuoi4qEl9O3x7TWiP6WybHEMmJlRkBY3eD8Rb6v0Q
         mRmArX3pc028G+PGvCLHafYbgIw2mVTlgiw4ao15FgscWyw5N7+RZXqB+wlgNSChX5u3
         n3gfGYMXzmtWMBE489acGW/Uiq4JGnnef/x4EDmvLF5UnsNU94Ut3jK+Soc1pHDK4Ecq
         DrLYuNureqZVR59m72LkujilFR8fpJWeOeCkL/NaTSoGC1qqEcq0avkimaI/9QPl+CD3
         XkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=A8TAMIXN+69/Jk9cvH3CNk1W0843jdUBpea8zUdjfM0=;
        b=d5qXB/DJI/5tthZ7a6+9t8LLAyWj85EjpWCBzDvQmRxPvxS5fhRInzAMeDyKqRUTwv
         1dzy5VQeKyIBgwVdcGqVT5Vq1w2jlnlKdGz/5juY/6XTlQ8AIMUqhR9gGaDztiRmGN42
         q+zce/DpXoKDf+qi/BBlknCiZDT8qW5OP+YDbC5hOif925tX6CJKT5nNFoJG4N8RAF/z
         JPetcK71H7Twoc4zY9Q8TPRguCqd2ifbb0B65Xq0+MysFo3WHrQ8Rb/eCvCl1oKxLk0w
         rhJGDNCBhPbMsQAOS6XRX/iIUCc2lMtx1FPOmo0aooVlJB+EKXFUMxHRniEetuq6saT9
         rF4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HNZ4pg/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si6061127wrn.5.2019.02.10.17.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:18:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HNZ4pg/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0FK-00059H-3E
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:18:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05p-0005qw-Qs
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05n-0008Tw-UB
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:05 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05m-0008Pv-HU
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:03 -0500
Received: by mail-pl1-x62a.google.com with SMTP id s1so4492606plp.9
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A8TAMIXN+69/Jk9cvH3CNk1W0843jdUBpea8zUdjfM0=;
	b=HNZ4pg/PDfGoe5B3SGC/gSoE9xmvAcX6RtnGXeG6dIUZe6/tEi1qhpLbMA05hfW6iI
	DHi36z73E7gdvDW7rFuTTfBQMzR9iimUzFkhWeid8ajzLHODHxnULMzaaTJi67IzhFJL
	Tt+5F4iAudruoBEIshwoKRnNBonFOUzpxIo2gys5KFK8PETcx59l3T394MtnVdv2UgH7
	k6Xv7AGUhMIS9+ZcS4R70TW7W+WaEfVLrg4ZuxoyAM1RlItaf7ETXVzdOttioLU13Hdv
	XTC46PSbz60JQN31pMjE0kSAIuYxBebjGlIp7JeYOaMXCy0nn5DpAiiZboEuO3Wog9G5
	YCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A8TAMIXN+69/Jk9cvH3CNk1W0843jdUBpea8zUdjfM0=;
	b=NXyOSJzYBN4mMhc67Tl+nPeXNnIdWG6rzVz7cwh8IeKj0FBTzrbP+rvwbrIUmaM1ae
	rkOdMGj8/YdaZOUzG2wxU83WT3Gg2SiWwh4j41iDTOzzyXVOl1cN5OUV3b2FrmDFhtBB
	Z2FPbATLokL9SgRgmSC3LANXRIsnDNoswQjeJfSeUDKfURkg8GEVdpCYsbn15uCwcC1O
	KB1yecU46BMAkOQZPTA1yODobTidr2ck4YVpY5dyfizMnAXCHl82cNtDyx/HWyoNMkjm
	iD3HSfiO6Y3DpOBIQPe9zXTsQ13PhCMdTCaRGe/rggSkk4S+s1qd0KhD4nNFX5GRHnLb
	qRLg==
X-Gm-Message-State: AHQUAuYGvnvhKc33RMxyRy7kZH2PSM8hnN7WeUS65LSnu6mUZbnRJ3pm
	Am5x56UGc1w5P1uHqOtsKuCaEQ==
X-Received: by 2002:a17:902:9a84:: with SMTP id
	w4mr26302882plp.283.1549847340230; 
	Sun, 10 Feb 2019 17:09:00 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:25 -0800
Message-Id: <20190211010829.29869-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62a
Subject: [Qemu-arm] [PATCH v2 22/26] target/arm: Create tagged ram when MTE
 is enabled
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r1Ow2ptYd92K

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h |  4 ++++
 hw/arm/virt.c    | 33 +++++++++++++++++++++++++++++++++
 target/arm/cpu.c | 21 ++++++++++++++++++---
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ca32939483..2626af4a9c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -768,6 +768,9 @@ struct ARMCPU {
     /* MemoryRegion to use for secure physical accesses */
     MemoryRegion *secure_memory;
 
+    /* MemoryRegion to use for allocation tag accesses */
+    MemoryRegion *tag_memory;
+
     /* For v8M, pointer to the IDAU interface provided by board/SoC */
     Object *idau;
 
@@ -2850,6 +2853,7 @@ int cpu_mmu_index(CPUARMState *env, bool ifetch);
 typedef enum ARMASIdx {
     ARMASIdx_NS = 0,
     ARMASIdx_S = 1,
+    ARMASIdx_TAG = 2,
 } ARMASIdx;
 
 /* Return the Exception Level targeted by debug exceptions. */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99c2b6e60d..dccd1345a1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1260,6 +1260,21 @@ static void create_secure_ram(VirtMachineState *vms,
     g_free(nodename);
 }
 
+static void create_tag_ram(VirtMachineState *vms, MachineState *machine,
+                           MemoryRegion *tag_sysmem)
+{
+    MemoryRegion *tagram = g_new(MemoryRegion, 1);
+    hwaddr base = vms->memmap[VIRT_MEM].base / 32;
+    hwaddr size = machine->ram_size / 32;
+
+    memory_region_init_ram(tagram, NULL, "mach-virt.tag", size, &error_fatal);
+    memory_region_add_subregion(tag_sysmem, base, tagram);
+
+    /* ??? Do we really need an fdt entry, or is MemTag enabled sufficient.  */
+    /* ??? We appear to need secure tag mem to go with secure mem.  */
+    /* ??? Does that imply we need a fourth address space?  */
+}
+
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 {
     const VirtMachineState *board = container_of(binfo, VirtMachineState,
@@ -1362,6 +1377,7 @@ static void machvirt_init(MachineState *machine)
     qemu_irq pic[NUM_IRQS];
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
+    MemoryRegion *tag_sysmem = NULL;
     int n, virt_max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
@@ -1518,6 +1534,20 @@ static void machvirt_init(MachineState *machine)
                                      "secure-memory", &error_abort);
         }
 
+        /*
+         * The cpu adds the property iff MemTag is supported.
+         * If it is, we must allocate the ram to back that up.
+         */
+        if (object_property_find(cpuobj, "tag-memory", NULL)) {
+            if (!tag_sysmem) {
+                tag_sysmem = g_new(MemoryRegion, 1);
+                memory_region_init(tag_sysmem, OBJECT(machine),
+                                   "tag-memory", UINT64_MAX / 32);
+            }
+            object_property_set_link(cpuobj, OBJECT(tag_sysmem),
+                                     "tag-memory", &error_abort);
+        }
+
         object_property_set_bool(cpuobj, true, "realized", &error_fatal);
         object_unref(cpuobj);
     }
@@ -1540,6 +1570,9 @@ static void machvirt_init(MachineState *machine)
         create_secure_ram(vms, secure_sysmem);
         create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
     }
+    if (tag_sysmem) {
+        create_tag_ram(vms, machine, tag_sysmem);
+    }
 
     vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index edf6e0e1f1..decf95de3e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -851,6 +851,18 @@ void arm_cpu_post_init(Object *obj)
 
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property,
                              &error_abort);
+
+#ifndef CONFIG_USER_ONLY
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
+        cpu_isar_feature(aa64_mte, cpu)) {
+        object_property_add_link(obj, "tag-memory",
+                                 TYPE_MEMORY_REGION,
+                                 (Object **)&cpu->tag_memory,
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG,
+                                 &error_abort);
+    }
+#endif
 }
 
 static void arm_cpu_finalizefn(Object *obj)
@@ -1164,16 +1176,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     init_cpreg_list(cpu);
 
 #ifndef CONFIG_USER_ONLY
+    cs->num_ases = 1;
     if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         cs->num_ases = 2;
-
         if (!cpu->secure_memory) {
             cpu->secure_memory = cs->memory;
         }
         cpu_address_space_init(cs, ARMASIdx_S, "cpu-secure-memory",
                                cpu->secure_memory);
-    } else {
-        cs->num_ases = 1;
+    }
+    if (cpu->tag_memory != NULL) {
+        cs->num_ases = 3;
+        cpu_address_space_init(cs, ARMASIdx_TAG, "cpu-tag-memory",
+                               cpu->tag_memory);
     }
     cpu_address_space_init(cs, ARMASIdx_NS, "cpu-memory", cs->memory);
 
-- 
2.17.2

