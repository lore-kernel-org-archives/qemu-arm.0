Received: by 10.28.173.206 with SMTP id w197csp3382965wme;
        Mon, 15 Jan 2018 17:47:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBosk9L4xb7v4bt/OO67GvGZaGkU2StauzeXvz3KywqBM9KR0a70eDqF/TAn5yjpFTtKgJmE1
X-Received: by 10.37.55.75 with SMTP id e72mr20327173yba.411.1516067224403;
        Mon, 15 Jan 2018 17:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516067224; cv=none;
        d=google.com; s=arc-20160816;
        b=zPNNwlgE/kcZLWQ3UgXe6dgJIxdZ5ncOUou20RZqr7q+fs632q/6YiT2FMU28TK8ae
         t6qFiu633xPAxahwhZD5QPUHYfeP2dWGChKof3Uj03YwRdi41tKlEKbiSfn+kSWStBnf
         FY/4MuE8+QL1QGHzJGlicQi+8MgjolPxEtE0Ia3/8mVhLygJVHkbRmEugzF3wdPb25W6
         Zkmx/8k1UY5nC/6vJYE8ke/x+y4RiqGxux5YVYtsuMMSrHUwU9MC4VXHKtSK7buMfEdp
         VJ7/tjp/jsNynYfunTCrnTZwmp08G/fhhbsGRNy291igcqfsetIit+15MJGXFQLVoooK
         2XJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DaGPUCVnRGa0Uf2x3BftsPMhSeLEWDka2XSdBkrexsI=;
        b=URP7MnXuR2v2AnyV5JlVk/GV147QDuDAlURoOWajCVsVX2yQ8K8JpEj5mhvHmCxae5
         CJLqfu19T5Zafj1Y8bCik/DXn4wfMiV05DAzJYoGcZYHhifO5sqslKzCb5RVzVdFo9lh
         SUfuGw6fm5Biy/uJ7AT+M3HFhYw5Ey/ozp1HOw+L9zVdALSuhPLF0P/sbaaznhiWEOHl
         QXpPvVNuNlGB5cr73TzEnZL6YTtKm3Lq//Kc9MGSUbPwJdwb71FvAFecymys0hABpCKR
         5EHnBAju5MFWPKcwqwFEsut49o7yXE/6k3ApT6QmaVnHaUFoTGhB1ght+ZKsCNI6x2w8
         dJhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GhxnD4mV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c206si243166yba.483.2018.01.15.17.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GhxnD4mV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGL9-0005qI-Mq
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:47:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGCF-0006Gi-JF
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGCC-0005TF-SG
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:51 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:46322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGCC-0005Sf-KQ; Mon, 15 Jan 2018 20:37:48 -0500
Received: by mail-pl0-x241.google.com with SMTP id 66so4925752plc.13;
	Mon, 15 Jan 2018 17:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DaGPUCVnRGa0Uf2x3BftsPMhSeLEWDka2XSdBkrexsI=;
	b=GhxnD4mVaLsUymrI9PpI/kP4QHbK7fN3W9xdJosd4ryMiBNP9fpIh7nPa3ljOhaIVy
	YTnPSAhoQawboZdshNH6oSyRO8BcY324vFQuE5eTkWcBGWWYRELFbc89iUK4x/TdQCcH
	SIddB1+e5T8x+M8kgiNRY56VuU622x9dr1FapfrQK+idToiJDsooL2hCuw2Kg6M6mOoZ
	7v0fvcyPKzJzHn/xese6JyNyFDewGW1QpMYOfKCT2p4oP0QJS3IzvrZNWmPVIu4hs9Nk
	Zn//DfI3AaFHF9wG5CQ7XBikp/dk0hjjlWrT6LuncVBgyp4WPuWWTaE6ciqLyHYuspFi
	SfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DaGPUCVnRGa0Uf2x3BftsPMhSeLEWDka2XSdBkrexsI=;
	b=SxjVIKjPZIAF7Iov/duIlHljlE8EHnUR27dxvxBrZj1JQgjhogfEmB2liY6DgyR2k/
	nYbAkCPT/J3G3s7CJH3oL3kCuXw71tOMw3LKbatiOcrFWi7C9xSNQzb2pPwUzsMPqdqI
	SsWOFjDkqxvW1YHtk8gIEnDmttd+u1ox1yHswTuBB1uJ5uAQoWK4H02VYNtyQjm3mvUa
	2KRpsSkQYhZV5W3Fwsa/RaqpN+atY7VY6hDtMOMRKHC03ygdPzDNK9H6Mi/evISz4mCc
	ulS8QMGSWO/TCPv4XrCxd/u7ygo1KQGkRnzdR8U/dKtnKDbQsGqZD71LsBZ6HR2SE7sa
	hSkg==
X-Gm-Message-State: AKwxytfW4m5QSdzDjhz7tJXoU1IjUR8Tv8VaLoM34qIo9tx/F6hod1+T
	sCC2Q9KzmPIIvfOnWhcMXjKOmoRl
X-Received: by 10.84.168.99 with SMTP id e90mr7724697plb.440.1516066667426;
	Mon, 15 Jan 2018 17:37:47 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:46 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:37:08 -0800
Message-Id: <20180116013709.13830-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH v4 13/14] hw/arm: Move virt's PSCI DT fixup code
 to arm/boot.c
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PBj7yNSLofS3

Move virt's PSCI DT fixup code to arm/boot.c and set this fixup to
happen automatically for every board that doesn't mark "psci-conduit"
as disabled. This way emulated boards other than "virt" that rely on
PSIC for SMP could benefit from that code.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/arm/boot.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c | 61 -------------------------------------------------------
 2 files changed, 65 insertions(+), 61 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8046..18ada9152c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -384,6 +384,69 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
     }
 }
 
+static void fdt_add_psci_node(void *fdt)
+{
+    uint32_t cpu_suspend_fn;
+    uint32_t cpu_off_fn;
+    uint32_t cpu_on_fn;
+    uint32_t migrate_fn;
+    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
+    const char *psci_method;
+    int64_t psci_conduit;
+
+    psci_conduit = object_property_get_int(OBJECT(armcpu),
+                                           "psci-conduit",
+                                           &error_abort);
+    switch (psci_conduit) {
+    case QEMU_PSCI_CONDUIT_DISABLED:
+        return;
+    case QEMU_PSCI_CONDUIT_HVC:
+        psci_method = "hvc";
+        break;
+    case QEMU_PSCI_CONDUIT_SMC:
+        psci_method = "smc";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    qemu_fdt_add_subnode(fdt, "/psci");
+    if (armcpu->psci_version == 2) {
+        const char comp[] = "arm,psci-0.2\0arm,psci";
+        qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+
+        cpu_off_fn = QEMU_PSCI_0_2_FN_CPU_OFF;
+        if (arm_feature(&armcpu->env, ARM_FEATURE_AARCH64)) {
+            cpu_suspend_fn = QEMU_PSCI_0_2_FN64_CPU_SUSPEND;
+            cpu_on_fn = QEMU_PSCI_0_2_FN64_CPU_ON;
+            migrate_fn = QEMU_PSCI_0_2_FN64_MIGRATE;
+        } else {
+            cpu_suspend_fn = QEMU_PSCI_0_2_FN_CPU_SUSPEND;
+            cpu_on_fn = QEMU_PSCI_0_2_FN_CPU_ON;
+            migrate_fn = QEMU_PSCI_0_2_FN_MIGRATE;
+        }
+    } else {
+        qemu_fdt_setprop_string(fdt, "/psci", "compatible", "arm,psci");
+
+        cpu_suspend_fn = QEMU_PSCI_0_1_FN_CPU_SUSPEND;
+        cpu_off_fn = QEMU_PSCI_0_1_FN_CPU_OFF;
+        cpu_on_fn = QEMU_PSCI_0_1_FN_CPU_ON;
+        migrate_fn = QEMU_PSCI_0_1_FN_MIGRATE;
+    }
+
+    /* We adopt the PSCI spec's nomenclature, and use 'conduit' to refer
+     * to the instruction that should be used to invoke PSCI functions.
+     * However, the device tree binding uses 'method' instead, so that is
+     * what we should use here.
+     */
+    qemu_fdt_setprop_string(fdt, "/psci", "method", psci_method);
+
+    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_suspend", cpu_suspend_fn);
+    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_off", cpu_off_fn);
+    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_on", cpu_on_fn);
+    qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
+}
+
 /**
  * load_dtb() - load a device tree binary image into memory
  * @addr:       the address to load the image at
@@ -540,6 +603,8 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
+    fdt_add_psci_node(fdt);
+
     if (binfo->modify_dtb) {
         binfo->modify_dtb(binfo, fdt);
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 151592b1e5..5586aba01c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -242,66 +242,6 @@ static void create_fdt(VirtMachineState *vms)
     }
 }
 
-static void fdt_add_psci_node(const VirtMachineState *vms)
-{
-    uint32_t cpu_suspend_fn;
-    uint32_t cpu_off_fn;
-    uint32_t cpu_on_fn;
-    uint32_t migrate_fn;
-    void *fdt = vms->fdt;
-    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
-    const char *psci_method;
-
-    switch (vms->psci_conduit) {
-    case QEMU_PSCI_CONDUIT_DISABLED:
-        return;
-    case QEMU_PSCI_CONDUIT_HVC:
-        psci_method = "hvc";
-        break;
-    case QEMU_PSCI_CONDUIT_SMC:
-        psci_method = "smc";
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    qemu_fdt_add_subnode(fdt, "/psci");
-    if (armcpu->psci_version == 2) {
-        const char comp[] = "arm,psci-0.2\0arm,psci";
-        qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
-
-        cpu_off_fn = QEMU_PSCI_0_2_FN_CPU_OFF;
-        if (arm_feature(&armcpu->env, ARM_FEATURE_AARCH64)) {
-            cpu_suspend_fn = QEMU_PSCI_0_2_FN64_CPU_SUSPEND;
-            cpu_on_fn = QEMU_PSCI_0_2_FN64_CPU_ON;
-            migrate_fn = QEMU_PSCI_0_2_FN64_MIGRATE;
-        } else {
-            cpu_suspend_fn = QEMU_PSCI_0_2_FN_CPU_SUSPEND;
-            cpu_on_fn = QEMU_PSCI_0_2_FN_CPU_ON;
-            migrate_fn = QEMU_PSCI_0_2_FN_MIGRATE;
-        }
-    } else {
-        qemu_fdt_setprop_string(fdt, "/psci", "compatible", "arm,psci");
-
-        cpu_suspend_fn = QEMU_PSCI_0_1_FN_CPU_SUSPEND;
-        cpu_off_fn = QEMU_PSCI_0_1_FN_CPU_OFF;
-        cpu_on_fn = QEMU_PSCI_0_1_FN_CPU_ON;
-        migrate_fn = QEMU_PSCI_0_1_FN_MIGRATE;
-    }
-
-    /* We adopt the PSCI spec's nomenclature, and use 'conduit' to refer
-     * to the instruction that should be used to invoke PSCI functions.
-     * However, the device tree binding uses 'method' instead, so that is
-     * what we should use here.
-     */
-    qemu_fdt_setprop_string(fdt, "/psci", "method", psci_method);
-
-    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_suspend", cpu_suspend_fn);
-    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_off", cpu_off_fn);
-    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_on", cpu_on_fn);
-    qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
-}
-
 static void fdt_add_timer_nodes(const VirtMachineState *vms)
 {
     /* On real hardware these interrupts are level-triggered.
@@ -1407,7 +1347,6 @@ static void machvirt_init(MachineState *machine)
     }
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
-    fdt_add_psci_node(vms);
 
     memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
                                          machine->ram_size);
-- 
2.14.3

