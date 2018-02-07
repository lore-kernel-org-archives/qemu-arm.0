Received: by 10.28.71.27 with SMTP id u27csp240456wma;
        Tue, 6 Feb 2018 20:29:11 -0800 (PST)
X-Google-Smtp-Source: AH8x226hKFD12z6STyRj9dglLdGmFfO++Do2HTb6Goh1Y3b0VMC0oIeBsNKuBktZl4nUVHprL5At
X-Received: by 10.13.203.88 with SMTP id n85mr3026157ywd.158.1517977751649;
        Tue, 06 Feb 2018 20:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977751; cv=none;
        d=google.com; s=arc-20160816;
        b=HaYyZoLw1iBh3ivXGXWDkF7LSBbU5UQlS4bpXbrb10aRmO1IEFd0c9k59gWZYhD5CB
         slVmjU1Vbe8WM9DqhULP9lM37tlJQJfCnJmWQm1oy7YLLUB21K9uMGhb/3H6hvAAizn3
         0Un13Bm7G2KLMcpswF9jTc3J53X9Ads3SZsoTqU7dgMosvGKylE57tlRjMN6mROlyAML
         +xQk3dIGuxTjYaOnLoYgl2f0UkKzJNJQnVjFeXchtM7YSIQV8+4AkCjh3YO8fANWKdja
         8u7AC9l8orSkmh/uqGBgByo5AzZFiF/cGhftUzECZJIIR4kRRRTC6GYPNLc5oxwsKJ5z
         b68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qcFuM93SNHHFjRReOOBpQMdeyZfQX8cnVO6CB5umxaA=;
        b=u9woxTcLlAbJyOiADfByfPUytwOEz0N/wt+fpQR7JT4uFAg5MU7nrW9Jy1JOBFzSpQ
         uoL7INzpHmbMGv036RmjIF090U4q/Cl5j9SS8TjMb8Zbkd5UJRi6XpB2Xu6QEKnvEC4T
         jHQC/yMfLkvqqXD6Se86rAYDd98cEWDR5Mn/eo4P9KZ48Tq/DmCBn9zgJbeCRITC5Zsi
         Ka9vKSnt+8NyrUt1FPljWH+HpwzcFH02Ew0ECqZu+n5yYs74czZeuG1B5Zr+QhbqOsjW
         tlpHmTwmvU3uVBdetpmNCM7KrTOjbbYdhHgLwzLN8RE8zAD6Jtg7dSkqjUEt3MY5HPA+
         9dEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EqUdD+QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u16si112849ywe.459.2018.02.06.20.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:29:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EqUdD+QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHM5-0003h6-Hq
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:29:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIU-0000Wp-U5
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIT-0003US-A1
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:26 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:41985)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIT-0003SS-23; Tue, 06 Feb 2018 23:25:25 -0500
Received: by mail-pg0-x244.google.com with SMTP id m28so2032804pgc.9;
	Tue, 06 Feb 2018 20:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qcFuM93SNHHFjRReOOBpQMdeyZfQX8cnVO6CB5umxaA=;
	b=EqUdD+QJkiJ4FV2t9u7k7+c5NbUkjm2cLMiXFWoTZvDDEhOBeSXeeyf6xj8K5wHM1T
	XoYJ8DC242Y21jPvIeeWEwxJ2NxU9UCqBRcmRiEtcJEOsLnANbU+Tk96byhDm4xV9ToO
	sgqlOcf4uHj2KpxqasMCX4n1axYkOjFBMv3/SPrScu/6G1dSUkLbIuQ5IriE8a60BRir
	z54QYBWVmKKRWDcYjNfOccXRmOFtqm3ePxyuY6RAc0ineuj/GHy55B4g2iPEz6C7FRtb
	GuU+zBsNr5f3kTuXVq+Kmlx0NN/U48Pd22V87ZbzKqQD29TJEZ1dMnI8LBBWsAw8DjtP
	n/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qcFuM93SNHHFjRReOOBpQMdeyZfQX8cnVO6CB5umxaA=;
	b=cLCrgRTbhdBpPcfMAzrwIvxTWn8Cwmg0ALRvxOs/eZjNn7CO3gkLKo7R2nXU8OLVKO
	ATE8fXnDnT8tg5jkWJWH1y9H/ZTSpo82deJfLLKgI/wMTKAWlbdFhZXzI02XSq6XInpe
	e40dO8ASvX48UFtFW6cggEVcsqvI97QMSo07o1UC8jl/2b48wWGo4RHQyTKvXZMQPeP1
	ydcFihHGaC5KiSnqR4nP7jC01msjt1XyVxX0XcKehO7HAGYMbSESYbiDK0FfDO7FOhJq
	GaMWkBZixWx8tOE3YbhWZYQWhh5+yNFcheKkUT6dghTeUMraKdBC/qq6e/anzVdBnbfy
	DnGg==
X-Gm-Message-State: APf1xPA9ircfDvM9Fk0ce29Ze5lS0yCvBPE+nzZLzYBAPdWDzTjQj/gI
	1gIc+m+M4GzDDQ6r/KFzaAlNgIqB
X-Received: by 10.98.152.11 with SMTP id q11mr4656855pfd.131.1517977523871;
	Tue, 06 Feb 2018 20:25:23 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:23 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:37 -0800
Message-Id: <20180207042438.15422-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v5 13/14] hw/arm: Move virt's PSCI DT fixup code
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2a6WziA77DS7

Move virt's PSCI DT fixup code to arm/boot.c and set this fixup to
happen automatically for every board that doesn't mark "psci-conduit"
as disabled. This way emulated boards other than "virt" that rely on
PSIC for SMP could benefit from that code.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index b334c82eda..dbb3c8036a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -244,66 +244,6 @@ static void create_fdt(VirtMachineState *vms)
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
@@ -1409,7 +1349,6 @@ static void machvirt_init(MachineState *machine)
     }
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
-    fdt_add_psci_node(vms);
 
     memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
                                          machine->ram_size);
-- 
2.14.3

