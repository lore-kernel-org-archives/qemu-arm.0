Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1F0CAC5BB
	for <qemu-arm@archiver.kernel.org>; Sat,  4 Oct 2025 20:30:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v58tI-0000cN-6r; Sat, 04 Oct 2025 16:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xpahos@gmail.com>) id 1v58j2-0007JD-Qr
 for qemu-arm@nongnu.org; Sat, 04 Oct 2025 16:19:28 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xpahos@gmail.com>) id 1v58iz-00081g-Eq
 for qemu-arm@nongnu.org; Sat, 04 Oct 2025 16:19:27 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-36d77ae9de5so34104161fa.2
 for <qemu-arm@nongnu.org>; Sat, 04 Oct 2025 13:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759609163; x=1760213963; darn=nongnu.org;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qo7hddKpSdc6MpWwF5YtNaqmI9PS33MydNZ8ZzjevYc=;
 b=VGHBK01dXtjdl6luxlTSw/CNkO+fj/J7m1SmKxPzo34BaXkk6CI2KSt9tSfyDu57J3
 65M9xnsfJJmeJekSNBj4DvTygimsVpR8jEvlcUEd5MnwDx5ysrXDL4l9Y46OTLA+1mSj
 KcDoLAj3A1znY8K71Wt3ebWTXgSRl8m43ePDdUJTDg2Kv9hxYC5Th43vvcw4gQYZ3aVF
 8xU2B9j32Sr0BeFQj9WGGcEn0rbNGG+jztcHED/8KlgSvVlCNcU0dGTx+xN3lUdD3XLL
 eLg4u1BeETikMe8VdUSt9Wl1JaCy5fG5pT6LJprIRO3yBRzvJ5UYHcMpPOHmfFNa11HM
 rCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759609163; x=1760213963;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qo7hddKpSdc6MpWwF5YtNaqmI9PS33MydNZ8ZzjevYc=;
 b=SuLCd7bs9/f+TquNZxObI8Msmf/haewjbaO5p4zmT0A4A0sya0KgBXJzCQHjmUB/GP
 KKKw0PwhM/ca4HHIsZeRYt5fzCW2U+kxRthCwQmXZbdaTLtYVvh58WDwXXxtduj8L1/D
 ysZHB2xQx/MOuU9cH/swIQ2Uk4c4fu5FVE//GktR1dUxBmEIhQfNZpRQavX3Ov5QgiRA
 WQs9ac1BdPvLLdUFdDRWPLc2iMjaaaQMy7x+W4tI94pQgt5e30m0e3MsuWKYXmXHQE7R
 sRmP6tTx3bEa3DNWqKzx4APoIwIjmK1t6rXbNRyOztvqjKkPgszEAuGqUyBRK0RW2/nO
 bQmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz97vsbulRPiDb+ZiPjoOUjvpzfcrX/Z8UxZHoEvEW0F4sYjaEW0DI4368L8NEBn1/UxOAd7ypwQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy2ZbMBhyU9IIEo5WIqTrb46JiBLWnIxoLSwfMDIxFXdKo9Z/QS
 GIw+6gLRFkYNMQakE5V+b4+6R+3bLJSRVZscuGRpxeCNmVL7qwIJHuMk
X-Gm-Gg: ASbGncso2esXiLfeJu7ghgxhn+v822ClJsKAeDtMP+Bu7repnjkNwPuzJm3gU3+QeI3
 m6kqwT4yakGVmOiGB1dJybUT1V7LdMMvN8yCihzgNTqKgPiwl8IvFROQebM0g2Fp4lhVd6xBKBq
 IRNECLnWeu/1p3lyr1AMlDLn0Z2USAICm8sxu8b+DV8gda/vQRzNqKC39PWjC86ar5sdFmDlg6U
 yLfyShW4Y2RsKwme2mjYD1V9+fwznaVE1fl9blQd/gsZzVupV/EMY/YrNPulkBnVLqoRE9X/vap
 zz3ar8AidTjhm4D2ywxy1SAN8h7S+TuG4fVQ14K3AoznDV41JqoYgSVnPTgoDYoZgnUy7HmMpwq
 rMtQWrZl9prcv1Jz62wJnhiSw8vtBcEAv8D0a/QXx5jZtv1o7ZkyAoA==
X-Google-Smtp-Source: AGHT+IFmQnlWQWl2OQhtk+OiUUcBSwh8IMzLFBO9I1by351N8N2FkY+4/GQjhFIxJR+z2x5o9JRCZQ==
X-Received: by 2002:a2e:be9c:0:b0:36b:b439:93cc with SMTP id
 38308e7fff4ca-374c389c921mr22620081fa.37.1759609162377; 
 Sat, 04 Oct 2025 13:19:22 -0700 (PDT)
Received: from smtpclient.apple ([2a02:6bf:8080:446::1:2b])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba2a536esm28391881fa.14.2025.10.04.13.19.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 Oct 2025 13:19:21 -0700 (PDT)
From: Alexander Gryanko <xpahos@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: [PATCH] hw/arm: add pvpanic mmio device for arm
Message-Id: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
Date: Sat, 4 Oct 2025 23:19:09 +0300
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org,
 =?utf-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCT0YDRj9C90LrQvg==?= <xpahos@gmail.com>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3776.700.51.11.2)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=xpahos@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 04 Oct 2025 16:30:01 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Currently, pvpanic is available in three device types: ISA,
MMIO, and PCI. For early stages of system initialisation
before PCI enumeration, only ISA and MMIO are suitable.
ISA is specific to the x86 platform; only MMIO devices
can be used for ARM. It is not possible to specify a
device as on the x86 platform (-device pvpanic); the
only possible way is to add an MMIO device to the dtb,
which can be implemented by manually adding new functions
to the QEMU code, as was done in the VMApple implementation.

Signed-off-by: Alexander Gryanko <xpahos@gmail.com>
---
hw/arm/virt.c         | 25 +++++++++++++++++++++++++
include/hw/arm/virt.h |  1 +
2 files changed, 26 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 02209fadcf..1059584b67 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -39,6 +39,7 @@
#include "hw/arm/virt.h"
#include "hw/block/flash.h"
#include "hw/display/ramfb.h"
+#include "hw/misc/pvpanic.h"
#include "net/net.h"
#include "system/device_tree.h"
#include "system/numa.h"
@@ -182,6 +183,7 @@ static const MemMapEntry base_memmap[] = {
    [VIRT_UART0] =              { 0x09000000, 0x00001000 },
    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
+    [VIRT_PVPANIC] =            { 0x09021000, 0x00000002 },
    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
    [VIRT_UART1] =              { 0x09040000, 0x00001000 },
    [VIRT_SMMU] =               { 0x09050000, SMMU_IO_LEN },
@@ -276,6 +278,27 @@ static bool ns_el2_virt_timer_present(void)
        arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu);
}

+static void create_pvpanic(VirtMachineState *vms)
+{
+    char *nodename;
+    MachineState *ms = MACHINE(vms);
+    DeviceState *dev = qdev_new(TYPE_PVPANIC_MMIO_DEVICE);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+
+    hwaddr base = vms->memmap[VIRT_PVPANIC].base;
+    hwaddr size = vms->memmap[VIRT_PVPANIC].size;
+
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, base);
+
+    nodename = g_strdup_printf("/pvpanic@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
+                            "qemu,pvpanic-mmio");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+}
+
static void create_fdt(VirtMachineState *vms)
{
    MachineState *ms = MACHINE(vms);
@@ -2498,6 +2521,8 @@ static void machvirt_init(MachineState *machine)
    create_pcie(vms);
    create_cxl_host_reg_region(vms);

+    create_pvpanic(vms);
+
    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
        vms->acpi_dev = create_acpi_ged(vms);
    } else {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ea2cff05b0..39bf07c9c1 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -81,6 +81,7 @@ enum {
    VIRT_NVDIMM_ACPI,
    VIRT_PVTIME,
    VIRT_ACPI_PCIHP,
+    VIRT_PVPANIC,
    VIRT_LOWMEMMAP_LAST,
};


---
base-commit: bd6aa0d1e59d71218c3eee055bc8d222c6e1a628
change-id: 20251004-arm-pvpanic-84a7d7b67d8d

Best regards,
-- 
Alexander Gryanko <xpahos@gmail.com>


