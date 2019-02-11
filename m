Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp114267wrp;
        Mon, 11 Feb 2019 16:07:38 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYQqy1R/XTX7Csi+y9ytFOgz06v2HiLmqF4x8Pbhi1F3/HoGUldQB4R9sioZd8fLfsMycHs
X-Received: by 2002:a81:5c86:: with SMTP id q128mr624523ywb.431.1549930058532;
        Mon, 11 Feb 2019 16:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930058; cv=none;
        d=google.com; s=arc-20160816;
        b=GeFgc0sAqpbPXAPKjFU2VjLhDwIpZfxYE4pbAgYPB+oyLF/cW5LAnV23+yKCIb41Zk
         Q4knpzavxFg/nkBqQDOpV3vDs3ZBwIxsX5PR8nOvfHhbxU78IlWCwqSTWdrNOu0iMhBv
         tJI4ZRGCW7RHIg6bNL1G7WTABjUZtuSQDyUFAaBrsviOrNjJDC560Vwrl1U+lp7lAlLa
         /V7gn6J1BoMqNSH/lshgDlad9up6WjYI3oMo9bMtaQ9tfXDWaBFIo7JpZpdpwi4AO/yf
         eCfejN1dQwAM1HxyHJkDGuAxxnjsE/NeFN/OxBwU+DjGUxdU4ROH8Koi0Pxpj/B/C6Uc
         rc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=A8TAMIXN+69/Jk9cvH3CNk1W0843jdUBpea8zUdjfM0=;
        b=ly73vlGA0mwIaT0zOUKoIWOykDFaCo2U+79NwEBwyo+vmClDCWxQ8H/oRldXYwgR2E
         o6HFaN4m2WZAJjbioR8TGsAIMo3wPtR9rHzKWRNVNZwMHXsOhR6hvrmZos0hoC1ileEw
         cX8jxoB5h3gXwaTEZzf8G0WHzKhpE4wjr4CU2B85+eCc4sSBptSmWA18YgeB7LGfuRb7
         CRQF7xjLBhHZa2FGHs9tWPuTnkn/xb2yUBXWseywfaEsg4aPqoAMzcy0WjFasgDwbwAp
         PA9ujvyq4BkheIfqkVKWVmCjqgRmZyzesK20w977ER7g7zjeRk5VxZx0hj8KryXlLMoG
         Hr2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tA0F2DP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 78si6678036ywp.219.2019.02.11.16.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:07:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tA0F2DP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLbt-0007xt-QZ
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:07:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOi-0005sh-4U
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOe-0004zY-Sa
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:59 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOe-0004eS-Ew
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:56 -0500
Received: by mail-pf1-x441.google.com with SMTP id u6so319090pfh.11
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A8TAMIXN+69/Jk9cvH3CNk1W0843jdUBpea8zUdjfM0=;
	b=tA0F2DP7EoxMXpVxvMAcqvCHJiVK7S2Yx1FzUTc9Nk9wEtD7kkeNxvb9WqE5Wn/6yQ
	O+VX/M5Rt58NTZONQFiBicVI6U4HUJakbbXyYB6A5EnFbPeFiXc1i1FZjlIGt3Fd6MKC
	zoxOPAJ5sPKtgXuWgztdhjYaNVVBWzm1m3sTcQceeJVrMo9HwzDG7/FcTNnphr/Rk1hY
	zfDUuRiec57YWDQiHsVwud0sJau27+K4HhzBWWizalxO11np8AfKBok+rvUwWRW3dULV
	lgO2P8rwZG0Nay3l/HZQiDXrdKJ1qahRtnHttiFI9HoWW9iZY+ddCTb6+8aCldpfhm5t
	dgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A8TAMIXN+69/Jk9cvH3CNk1W0843jdUBpea8zUdjfM0=;
	b=AHpP2ODPvSoUWsig//KHVPxHF3qd/r5GT0vPjhSqfPiHw7kPQBrX6+JMUhujs/gtbF
	Mz41gyquh7pHO317xLFOiClC7aG0KM9ep5EbFmBmxqBaJigXpiIHaPgGSGtZggFSpDNp
	KDpyW6SSEJ3hbFq13Hvlw1sc4ZRGTKbv8xLLQDDrxeiltprESOhC5yaobF0WZ5lnGYRu
	JfjT8Yv3m9HSQYrJAfBlCwwDGCYAAwaSm8R1j9mHz/dkVsTtFCCHtx6pihae3MtDdLrv
	rmuI8hgqeGrPcAd8FIYprkHysrxFM17lA7EvBKBjd0XPJ2lLX28VpQcG+jtpalHZ5z5x
	ghvQ==
X-Gm-Message-State: AHQUAuZSnlJzIWuptVQTQfwdWq/667Vi8JdBhGgKl725lMt55veNZDRY
	unFIg+safP3Kh1lmUrVZPRcHHNrCHTs=
X-Received: by 2002:a63:134f:: with SMTP id 15mr823505pgt.19.1549929212346;
	Mon, 11 Feb 2019 15:53:32 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:54 -0800
Message-Id: <20190211235258.542-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v3 24/28] target/arm: Create tagged ram when MTE
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
X-TUID: b9A9OdkdyXku

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

