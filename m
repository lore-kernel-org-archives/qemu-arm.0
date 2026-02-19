Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED3BE9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:51:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt5MM-00044E-Uu; Thu, 19 Feb 2026 09:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5M5-0003mL-Q8
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5Lx-00084z-Q1
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4362197d174so697713f8f.3
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771512593; x=1772117393; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qjrmCbZ4irjeMgFjgDLjHWP5I2nb6lT5hUfv6l7aZI=;
 b=amECIGVXw59IVC1MHNWZlzx19fhU+TIIoNvRVSP5OfsWJ0F/RTIzr6MiW52S6ZVvC0
 GH0wvnyeD9Ql44sequU7BDbFgdphyxrj8tz1ypsTIJ3qoQsh8hWHNuS5oBQ7Pah/ioXi
 jbvR0lNZnBxLR6y49XDVI0J9XXIFghJPPwxy6jXqTuB0T1thr5UZPyvMlatCQoG2wrZo
 W85Hrilh4UHFn/tbKLXhq61JA4bSHOqS0i1H8GbuUm/mVt+jafQQUmr3DVANPoRE9Bz4
 VvSwChVaU0Bb6w+W8ld8IWJ2HeJqwacsQuOxJ8Deuid8esTtAnex1QYMbIGi48AY3uTn
 epvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771512593; x=1772117393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1qjrmCbZ4irjeMgFjgDLjHWP5I2nb6lT5hUfv6l7aZI=;
 b=B/gm2xzVklt0Wk+Lt6ZRo5cSO+754KP7bXgmd4pdYankBUz98XTStEgnR37SOXOKaa
 Gj55X9NDdPCwA5eO+EBGxRph6JUUodvYFyJISfILpaNa7F/ewF5uBnlMkt9yqd85iyEU
 LjW0nwsI6twy7NpyK4lC7x0cy7sys9I5pWRX0llcSD5Dtr0CZ0mltRTLYu63f7hCBp3A
 +kgG3Lf2pgSpkMYGhTS35w3941Ctf7DquNtvmZbr0bBWgv1T/1qthvq6IALpOLnVtSXW
 3aozVMljKalEPZC0Y5/doXeSMIJQdHrPZGPLVAoxTCe4KLr6w6K4qi3Rrbk/94hQeAn+
 ty4g==
X-Gm-Message-State: AOJu0Yyol+knvvk4/Y/vufrj4WQttEZv/ziIiSpaceO+LnafNQUGsMgs
 KDgQu/cmfbEWY7Y9xxcpcNXmLHtR5ONVgP4uAyOQ6OlRBiGNBMP+86Se
X-Gm-Gg: AZuq6aIjhiWwJ6bvm1baD15NrhD+OeuVvupeTKzmKqSQsKMmsXZ40PfLs0iB9i/EGbs
 TB0NZ5FR7o2PgdwGRAcG2Dnq9FGDfMND9pAz72XFeF+C3cBHuritKpmFA0oT4Q/Z7VZTKKcwIJc
 X3SfLC5duwHRNdToJKhSWkdMn+6Qt33OBC+w1S+hZL5zJz4aouhP/tQdi+aspkM7aciYho8OxeN
 ANr7cWc6ypl0YVP3y99oLOVwRYyr726nmub1twUk5BD+03wbtuDj2plXKJWIN6bdS0l5K57gPBq
 sZ4INX5Cb7D7cB88bIcA1AzyPM36yAmJqADmXh6yLWypYxDaUbwHYZ+8X/Noi6okX0WzZCDoAHm
 ig1VmKfPHQ51l7uCRqk5PIBVNlBsTnkswRl9JqX3RL/4o8vgNFw7HwwueTHvynicDnSTBqC9wOY
 842iGzaQoye+DnJ5XJoRDvrvpy8aqpfq2IMbfZuoLOTzXClo2J2Q5yXsz3U7wIuZpU2Acd
X-Received: by 2002:a05:6000:184e:b0:436:1a4b:de36 with SMTP id
 ffacd0b85a97d-43958e0314amr9545077f8f.22.1771512592729; 
 Thu, 19 Feb 2026 06:49:52 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm50163087f8f.31.2026.02.19.06.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:49:52 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 28/33] system/memory: add QOM aliases for fdt support
Date: Thu, 19 Feb 2026 15:48:56 +0100
Message-ID: <20260219144901.3317747-10-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219144901.3317747-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
 <20260219144901.3317747-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

The patch registers FDT compatibility handlers and
QOM aliases of memory subsystem, so that memory
regions can be created from a device tree model.

The alias 'qemu:system-memory' could be used to attach
subregion to root address space.
The system memory can also be attached to another
container with other priority, which may be used
for implementing secure memory structures.

Also 'qemu-memory-region' types can be used to create
new memory regions.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 system/memory.c | 99 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/system/memory.c b/system/memory.c
index 81e6846c60..66b5f6a484 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -4120,3 +4120,102 @@ static void memory_register_types(void)
 }
 
 type_init(memory_register_types)
+
+static int sysmem_fdt_init(char *node_path, FDTMachineInfo *fdti,
+                           void *priv)
+{
+    int priority = 0;
+    uint32_t container_phandle;
+    MemoryRegion *container;
+    char container_node_path[DT_PATH_LENGTH];
+    Error *errp = NULL;
+
+    fdt_init_set_opaque(fdti, node_path, OBJECT(get_system_memory()));
+
+    /* allow to set system_memory region as subregion */
+    container_phandle = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                            "container",
+                                            0, &errp);
+    if (!errp) {
+        /*
+         * TBD: move reg_info work to fdt_generic_util.c
+         */
+        int sc = 0;
+        sc = qemu_fdt_getprop_cell(fdti->fdt, node_path, "#address-cells",
+                                    0, &errp);
+        if (!errp && sc) {
+            error_report("can't change sysmem address");
+            return -1;
+        }
+
+        if (errp) {
+            error_free(errp); errp = NULL;
+        }
+
+        sc = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                    "#size-cells", 0, &errp);
+        if (!errp && sc) {
+            error_report("can't change sysmem size");
+            return -1;
+        }
+
+        error_free(errp); errp = NULL;
+        /* Check for custom "#priority-cells" extension */
+        sc = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                    "#priority-cells", 0, &errp);
+        if (errp) {
+            /* priotity is optional */
+            priority = 0;
+            error_free(errp); errp = NULL;
+        } else if (sc) {
+            priority = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                    "reg", 0, &errp);
+            if (errp) {
+                error_report("failed to read priority from reg");
+                error_free(errp);
+                return -1;
+            }
+        }
+
+        if (qemu_devtree_get_node_by_phandle(fdti->fdt, container_node_path,
+                                             container_phandle)) {
+            error_report("failed to get contaier node");
+            return -1;
+        }
+
+        while (!fdt_init_has_opaque(fdti, container_node_path)) {
+            fdt_init_yield(fdti);
+        }
+
+        container = MEMORY_REGION(fdt_init_get_opaque(fdti,
+                                                      container_node_path));
+
+        memory_region_add_subregion_overlap(container, 0,
+                                            get_system_memory(), priority);
+    } else {
+        /* container is optional property */
+        error_free(errp);
+        errp = NULL;
+    }
+
+    return 0;
+}
+
+
+fdt_register_compatibility(sysmem_fdt_init, "compatible:qemu:system-memory");
+
+static const TypeInfo fdt_qom_aliases[] = {
+    {   .name = "qemu-memory-region",       .parent = "memory-region"  },
+    {   .name = "simple-bus",               .parent = "memory-region"  },
+};
+
+static void fdt_memory_types(void)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(fdt_qom_aliases); ++i) {
+        type_register_static(&fdt_qom_aliases[i]);
+    }
+}
+
+type_init(fdt_memory_types)
-- 
2.43.0


