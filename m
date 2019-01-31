Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6751057wrt;
        Thu, 31 Jan 2019 03:25:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7xdNcSTc9jTfIQeQ0JnHRRl/YOzU0Gka8ZONrms076FdGPgp++K3NKwlGtcZrUo7SS7Ac8
X-Received: by 2002:a81:1693:: with SMTP id 141mr32149810yww.133.1548933940551;
        Thu, 31 Jan 2019 03:25:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548933940; cv=none;
        d=google.com; s=arc-20160816;
        b=OzW4+R2WXmlqhH9VJfqITkZE4exKCc4QEKTQg1expmvDsjzmfcL7/xcxQXDxmhRGcc
         bNuBk5ufCBWjqNdptRT54FSA8u0LODRziqqcMvAJdHcYx9xgCJrm9Bn6a4EpEnB2BZU/
         17g9yTQ5UlKQ6P3r/tDSjOnQrCpsI3PrD4H3b6B4XCAYDceA0WW6tXLoP56iVybPBXsW
         N6zexwcBiTTh4axbqAYFNFwY1FNfy4y+WmkzfCw36JbjOSWqVY4EFTVkm9s2xmBn4P+v
         9cy2SLwckwRuptCalazXdddNH6/F3G9GO9ri3NBdX6nB15RBom8ZuoXdEX6r6LiAj45x
         eNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Uf2xXVsV8siTL/MtqH6ndfNY6VKPGQ2YyqgRRm1aW8A=;
        b=ycnliZNVjoJsatbSBzyyR5gmxTw/n/vcnn7B8Z9/4tbFpUemOXQVkGKbFhqRdRj4oQ
         4MaRImZAYbTjKXqugwya8ZEbYfzHPp39Ygi95L4UQF8T4AB8LQjVXkKmQJ8+7Xg0tkm2
         46yN4xzCBqzKkMas10J+3qed5cwJlL5Ix30ZJGDhDGnNjit9NqxtWFCisOQimo/5ekcx
         a8b3CTqYb3RQV3JPK49RBwfVwaGClGioOd/Ik67ZAyVS52fMdqoS3xzsj9NvwdOCZsU7
         PBYYxrHyFWwUrJ8af41f5zh2OTzYAWpSPiBdXmVicCgfpwOfznbAZau6e+9XD7FKpmW5
         Ropw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7djuK8o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si2393588ybj.408.2019.01.31.03.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 03:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7djuK8o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpATU-0004TD-0e
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 06:25:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQi-0002EQ-OX
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 06:22:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQh-0008Cs-I6
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 06:22:48 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40902)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpAQh-0008CC-9u
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 06:22:47 -0500
Received: by mail-wr1-x443.google.com with SMTP id p4so2827636wrt.7
	for <qemu-arm@nongnu.org>; Thu, 31 Jan 2019 03:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Uf2xXVsV8siTL/MtqH6ndfNY6VKPGQ2YyqgRRm1aW8A=;
	b=d7djuK8ox30oz+t1QKSL+1T70rgc4OgBvGBkeayI4kQqqt5OF67q0gDfGNUEv8kIz6
	cbuuMOvFyp5qQ4pWe1ovUc9nxinp5RnN0NpR+O1fH59UdW5IV0CZlLaq9BVl8rd3bLsK
	8E/sGA350DwCwQHi4pw4fp30syM3RwmKYlbv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Uf2xXVsV8siTL/MtqH6ndfNY6VKPGQ2YyqgRRm1aW8A=;
	b=RDNqofFY1I8X/v377rq1B6H0n/g+4BUWwj5Iqw8npHcCq0OjNKzb0g3Jl09qlhCuzY
	MoXEzWd7YykpYF0aH6Quq7IcgOpoaaGdxfNuP7VqRyd2WKPxfPLKZuRJ7h6qc7cMpDLy
	36Uj4ukZm9PjWGJ4cFQ/qeHIsfTwE8F5d8mD8nRPUGFniDz3TQjhdzziqPre0RMIekZt
	P+DShZnatpw4tPhaF+FRK94JAo2TidXi0CyYaCmHncsZBXYdjImKgVncxcGbGUUTGLrY
	mE5PJ7CkIkhuSsjknoZDtzBXuQHvJGyrin7ty1xFwZfkxTf0r+AU3L4LO12bmFrW3UUw
	Y+Ww==
X-Gm-Message-State: AJcUukeO7xK3itTPcZt6NrXv5tX7Suvfy+h+8h+NnKxv1ELxWVZNIMQ5
	t1Z1VBXIATUATHE7zGA6bQVCC68A6c1iPA==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr34998886wrn.264.1548933765895; 
	Thu, 31 Jan 2019 03:22:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id c8sm4078173wrx.42.2019.01.31.03.22.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 03:22:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Jan 2019 11:22:37 +0000
Message-Id: <20190131112240.8395-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131112240.8395-1-peter.maydell@linaro.org>
References: <20190131112240.8395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 2/5] hw/arm/boot: Factor out "direct kernel boot"
 code into its own function
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OATuKu51eta1

Factor out the "direct kernel boot" code path from arm_load_kernel()
into its own function; this function is getting long enough that
the code flow is a bit confusing.

This commit only moves code around; no semantic changes.

We leave the "load the dtb" code in arm_load_kernel() -- this
is currently only used by the "direct kernel boot" path, but
this is a bug which we will fix shortly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 150 +++++++++++++++++++++++++++-----------------------
 1 file changed, 80 insertions(+), 70 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 6f9ceeb0e89..108e9b979f8 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -953,9 +953,12 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
     return size;
 }
 
-void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
+static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
+                                         struct arm_boot_info *info)
 {
+    /* Set up for a direct boot of a kernel image file. */
     CPUState *cs;
+    AddressSpace *as = arm_boot_address_space(cpu, info);
     int kernel_size;
     int initrd_size;
     int is_linux = 0;
@@ -963,75 +966,6 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     int elf_machine;
     hwaddr entry;
     static const ARMInsnFixup *primary_loader;
-    AddressSpace *as = arm_boot_address_space(cpu, info);
-
-    /*
-     * CPU objects (unlike devices) are not automatically reset on system
-     * reset, so we must always register a handler to do so. If we're
-     * actually loading a kernel, the handler is also responsible for
-     * arranging that we start it correctly.
-     */
-    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
-        qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
-    }
-
-    /*
-     * The board code is not supposed to set secure_board_setup unless
-     * running its code in secure mode is actually possible, and KVM
-     * doesn't support secure.
-     */
-    assert(!(info->secure_board_setup && kvm_enabled()));
-
-    info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
-    info->dtb_limit = 0;
-
-    /* Load the kernel.  */
-    if (!info->kernel_filename || info->firmware_loaded) {
-
-        if (have_dtb(info)) {
-            /*
-             * If we have a device tree blob, but no kernel to supply it to (or
-             * the kernel is supposed to be loaded by the bootloader), copy the
-             * DTB to the base of RAM for the bootloader to pick up.
-             */
-            info->dtb_start = info->loader_start;
-        }
-
-        if (info->kernel_filename) {
-            FWCfgState *fw_cfg;
-            bool try_decompressing_kernel;
-
-            fw_cfg = fw_cfg_find();
-            try_decompressing_kernel = arm_feature(&cpu->env,
-                                                   ARM_FEATURE_AARCH64);
-
-            /*
-             * Expose the kernel, the command line, and the initrd in fw_cfg.
-             * We don't process them here at all, it's all left to the
-             * firmware.
-             */
-            load_image_to_fw_cfg(fw_cfg,
-                                 FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
-                                 info->kernel_filename,
-                                 try_decompressing_kernel);
-            load_image_to_fw_cfg(fw_cfg,
-                                 FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
-                                 info->initrd_filename, false);
-
-            if (info->kernel_cmdline) {
-                fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
-                               strlen(info->kernel_cmdline) + 1);
-                fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
-                                  info->kernel_cmdline);
-            }
-        }
-
-        /*
-         * We will start from address 0 (typically a boot ROM image) in the
-         * same way as hardware.
-         */
-        return;
-    }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         primary_loader = bootloader_aarch64;
@@ -1206,6 +1140,82 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
         ARM_CPU(cs)->env.boot_info = info;
     }
+}
+
+void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
+{
+    CPUState *cs;
+    AddressSpace *as = arm_boot_address_space(cpu, info);
+
+    /*
+     * CPU objects (unlike devices) are not automatically reset on system
+     * reset, so we must always register a handler to do so. If we're
+     * actually loading a kernel, the handler is also responsible for
+     * arranging that we start it correctly.
+     */
+    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
+        qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
+    }
+
+    /*
+     * The board code is not supposed to set secure_board_setup unless
+     * running its code in secure mode is actually possible, and KVM
+     * doesn't support secure.
+     */
+    assert(!(info->secure_board_setup && kvm_enabled()));
+
+    info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
+    info->dtb_limit = 0;
+
+    /* Load the kernel.  */
+    if (!info->kernel_filename || info->firmware_loaded) {
+
+        if (have_dtb(info)) {
+            /*
+             * If we have a device tree blob, but no kernel to supply it to (or
+             * the kernel is supposed to be loaded by the bootloader), copy the
+             * DTB to the base of RAM for the bootloader to pick up.
+             */
+            info->dtb_start = info->loader_start;
+        }
+
+        if (info->kernel_filename) {
+            FWCfgState *fw_cfg;
+            bool try_decompressing_kernel;
+
+            fw_cfg = fw_cfg_find();
+            try_decompressing_kernel = arm_feature(&cpu->env,
+                                                   ARM_FEATURE_AARCH64);
+
+            /*
+             * Expose the kernel, the command line, and the initrd in fw_cfg.
+             * We don't process them here at all, it's all left to the
+             * firmware.
+             */
+            load_image_to_fw_cfg(fw_cfg,
+                                 FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
+                                 info->kernel_filename,
+                                 try_decompressing_kernel);
+            load_image_to_fw_cfg(fw_cfg,
+                                 FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
+                                 info->initrd_filename, false);
+
+            if (info->kernel_cmdline) {
+                fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                               strlen(info->kernel_cmdline) + 1);
+                fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
+                                  info->kernel_cmdline);
+            }
+        }
+
+        /*
+         * We will start from address 0 (typically a boot ROM image) in the
+         * same way as hardware.
+         */
+        return;
+    } else {
+        arm_setup_direct_kernel_boot(cpu, info);
+    }
 
     if (!info->skip_dtb_autoload && have_dtb(info)) {
         if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
-- 
2.20.1

