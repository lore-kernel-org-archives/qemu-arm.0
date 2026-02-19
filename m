Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1404AE9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:39:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt57E-00008w-BS; Thu, 19 Feb 2026 09:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57C-000060-B9
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:50 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt579-0002xe-VC
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:50 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so980655f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771511686; x=1772116486; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01ZMGYFRrfWfHnGaFGvUO9i4Bz2/krK23Z8+MfNVIME=;
 b=nSuNBxURymz82328BZ6kISQ6iEs2MNjLOilXfKTkm0WHBZtnlEkdZlV0cpwic9u9Ji
 fbGX26coPQ2Qj24sLkN3MRXaAW6TgsCWAxBE6S9UJqe7M0TuKXcrs6B+83FTbdr36Rb2
 i/bepqg/C8aC5LkEPWjk8L90wEtJ1EHsrDgncFycf6UpRDb2d3zVdfsGR6gWBGIPsPv/
 jcfYCNcasDULFyVoFxWdppXxGW2svoxBE3XLt5zsXQSsx9w1Xxcrs0yK1UuFbmxqmZUz
 mSwxO9vK5P+C3pf01IyK7iswq7wCxD4oMqjsvof7NvQBQB+2Sgu9cmtqFX+gSSw7ioGJ
 alOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771511686; x=1772116486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=01ZMGYFRrfWfHnGaFGvUO9i4Bz2/krK23Z8+MfNVIME=;
 b=VrHIc9Tw5/AeV5FD2M3y1KAnyqPadYYmUzyLtLLVcaAZpQ+jNBx6yTTbtbjbvCQH3b
 krwbskU1GM6IQVSRDcehqhOxn1VbHY0GHi57o5UATs5h8AVUIckxW9B4TWN8cONLB4Hn
 bSd+VlycQDRo/E85mgH/bUWhF2ovaTBfHg98uKr3BhSaGAXzrNFmUdu9Fj28bL411XJ9
 h3o0IYbCo6E7sr4MQTWqVdjeOtwloCOKnkKHN+yLt/mqgbvGIAF8ZLZe6v/GGXRWc86i
 255+jCVltrRzeEOkTRp8rWOPKlet5bAZR/NDkkXdyuDrwvpyPszKLAoGepWBnefbfT9p
 Xt5w==
X-Gm-Message-State: AOJu0YzWO1DnIV9AM2RONpn6vb0yDKUfLgJBdftFu64rcHNxgysZjwh9
 XvZZdjYQsdSNNCmSEfdxwq8OQPawCPTVjfo8B90BBtiOhuyPMQLFozir
X-Gm-Gg: AZuq6aIjQOS7K+SpjGCo5RlPYqQzkoNGW58K14Me6Hw2Y+6H+yEEVyaAFELfeJlCG5h
 xPGp26cdvMBZqdHP7rUNRVJaYRyQAdtSY27MMH3AMlRpZoa1BQkaVcmR+vBn3axbnfHi4xCiVAH
 4zL6kPNuJRorPQI92EHCmeHY0xyjFP3/DDQfPywU2XdbzpHX5n5dGk/d7thRPOxI5AdHJgo53Fc
 0PSt70KBBFgTY04q+Mn4w+WkUMMMd5KeZ+uQB4ypBDLAui7UYmotXjn+/mZ1LzTqptAqk+D755U
 I7ajViwHmeaYCsI+bW7DfwwNTV0fUyAS/lPbLyLC9/pTCHyyoSe9DC6gFTiV29wy2O18c2+/Rab
 yaloT0HtKGM8YWO0PFc81CqXKD/itJMKuWD5vw/GI7RtOGd+ZWhxy4iY+gAkI2axBiO3oRTay+f
 o5N02ARCiLb1WIBuhtbM+aBo5amMlTH5O8e/BveEuIi4PTqLFM8ZbM1ztEO7j3tESgXdmU
X-Received: by 2002:a05:6000:2203:b0:436:173c:b8e3 with SMTP id
 ffacd0b85a97d-4379db93b3amr33744794f8f.29.1771511686405; 
 Thu, 19 Feb 2026 06:34:46 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52022770f8f.24.2026.02.19.06.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:34:45 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 07/33] hw/core/fdt_generic_util: implement main fdt parse
 routine
Date: Thu, 19 Feb 2026 15:33:06 +0100
Message-ID: <20260219143332.3316679-8-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Implement main fdt_generic_create_machine() routine.

As of now do the following:

- parse each node and subnode in device tree
- check node has correct compatible or device types
- call fdt_init_qdev() which will eventually create
  device object.

The MIT license of fdt_generic_util.c preserved as in original
file from https://github.com/Xilinx/qemu.git repo.

The license for fdt_generic_util.h derived from matching
fdt_generic_util.c file.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c         | 245 +++++++++++++++++++++++++++++
 include/hw/core/fdt_generic_util.h |  19 +++
 2 files changed, 264 insertions(+)
 create mode 100644 hw/core/fdt_generic_util.c
 create mode 100644 include/hw/core/fdt_generic_util.h

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
new file mode 100644
index 0000000000..3606c11349
--- /dev/null
+++ b/hw/core/fdt_generic_util.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Utility functions for fdt generic framework
+ *
+ * Copyright (c) 2009 Edgar E. Iglesias.
+ * Copyright (c) 2009 Michal Simek.
+ * Copyright (c) 2011 PetaLogix Qld Pty Ltd.
+ * Copyright (c) 2011 Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/core/fdt_generic_util.h"
+#include "system/memory.h"
+#include "system/address-spaces.h"
+#include "hw/core/sysbus.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "system/system.h"
+#include "system/reset.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "qemu/config-file.h"
+#include "hw/core/boards.h"
+#include "qemu/option.h"
+
+#ifndef FDT_GENERIC_UTIL_ERR_DEBUG
+#define FDT_GENERIC_UTIL_ERR_DEBUG 3
+#endif
+#define DB_PRINT(lvl, ...) do { \
+    if (FDT_GENERIC_UTIL_ERR_DEBUG > (lvl)) { \
+        qemu_log_mask(LOG_FDT, ": %s: ", __func__); \
+        qemu_log_mask(LOG_FDT, ## __VA_ARGS__); \
+    } \
+} while (0)
+
+#define DB_PRINT_NP(lvl, ...) do { \
+    if (FDT_GENERIC_UTIL_ERR_DEBUG > (lvl)) { \
+        qemu_log_mask(LOG_FDT, "%s", node_path); \
+        DB_PRINT((lvl), ## __VA_ARGS__); \
+    } \
+} while (0)
+
+/* FIXME: wrap direct calls into libfdt */
+
+#include <libfdt.h>
+#include <stdlib.h>
+
+static int fdt_generic_num_cpus;
+
+static int simple_bus_fdt_init(char *bus_node_path, FDTMachineInfo *fdti);
+
+FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq)
+{
+    char node_path[DT_PATH_LENGTH];
+    FDTMachineInfo *fdti = fdt_init_new_fdti(fdt);
+
+    fdti->irq_base = cpu_irq;
+
+    /* parse the device tree */
+    if (!fdt_get_path(fdt, 0, node_path, DT_PATH_LENGTH)) {
+        memory_region_transaction_begin();
+        fdt_init_set_opaque(fdti, node_path, NULL);
+        simple_bus_fdt_init(node_path, fdti);
+        while (qemu_co_enter_next(fdti->cq, NULL)) {
+            ;
+        }
+        memory_region_transaction_commit();
+    } else {
+        fprintf(stderr, "FDT: ERROR: cannot get root node from device tree %s\n"
+            , node_path);
+    }
+
+    /* FIXME: Populate these from DTS and create CPU clusters.  */
+    current_machine->smp.cores = fdt_generic_num_cpus;
+    current_machine->smp.cpus = fdt_generic_num_cpus;
+    current_machine->smp.max_cpus = fdt_generic_num_cpus;
+
+    DB_PRINT(0, "FDT: Device tree scan complete\n");
+    return fdti;
+}
+
+struct FDTInitNodeArgs {
+    char *node_path;
+    char *parent_path;
+    FDTMachineInfo *fdti;
+};
+
+static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat);
+
+static int check_compat(const char *prefix, const char *compat,
+                        char *node_path, FDTMachineInfo *fdti)
+{
+    char *compat_prefixed = g_strconcat(prefix, compat, NULL);
+    const int done = !fdt_init_compat(node_path, fdti, compat_prefixed);
+    g_free(compat_prefixed);
+    return done;
+}
+
+static void fdt_init_node(void *args)
+{
+    struct FDTInitNodeArgs *a = args;
+    char *node_path = a->node_path;
+    FDTMachineInfo *fdti = a->fdti;
+    g_free(a);
+
+    simple_bus_fdt_init(node_path, fdti);
+
+    const char *prop;
+    char *all_compats = NULL, *node_name;
+    char *device_type = NULL;
+    int prop_len;
+
+    DB_PRINT_NP(1, "enter\n");
+
+    /* try instance binding first */
+    node_name = strrchr(node_path, '/') + 1;
+    DB_PRINT_NP(1, "node with name: %s\n", node_name ? node_name : "(none)");
+    if (!node_name) {
+        printf("FDT: ERROR: nameless node: %s\n", node_path);
+    }
+    if (!fdt_init_inst_bind(node_path, fdti, node_name)) {
+        DB_PRINT_NP(0, "instance bind successful\n");
+        goto exit;
+    }
+
+    /* fallback to compatibility binding */
+    prop = qemu_fdt_getprop(fdti->fdt, node_path, "compatible",
+                                       &prop_len, NULL);
+    all_compats = g_memdup2(prop, prop_len);
+    if (all_compats) {
+        char *compat = all_compats;
+        char * const end = &all_compats[prop_len - 1]; /* points to nul */
+
+        while (compat < end) {
+            if (check_compat("compatible:", compat, node_path, fdti)) {
+                goto exit;
+            }
+
+            if (!fdt_init_qdev(node_path, fdti, compat)) {
+                check_compat("postinit:", compat, node_path, fdti);
+                goto exit;
+            }
+
+            /* Scan forward to the end of the current compat. */
+            while (compat < end && *compat) {
+                ++compat;
+            }
+
+            /* Replace nul with space for the debug printf below. */
+            if (compat < end) {
+                *compat++ = ' ';
+            }
+        };
+    } else {
+        DB_PRINT_NP(0, "no compatibility found\n");
+    }
+
+    /*
+     * Try to create the device using device_type property
+     * Not every device tree node has compatible  property, so
+     * try with device_type.
+     */
+    prop = qemu_fdt_getprop(fdti->fdt, node_path,
+                            "device_type", &prop_len, NULL);
+    device_type = g_memdup2(prop, prop_len);
+    if (device_type) {
+        if (check_compat("device_type:", device_type, node_path, fdti)) {
+            goto exit;
+        }
+
+        if (!fdt_init_qdev(node_path, fdti, device_type)) {
+            goto exit;
+        }
+    }
+
+    if (all_compats) {
+        DB_PRINT_NP(0, "FDT: Unsupported peripheral invalidated - "
+                    "compatibilities %s\n", all_compats);
+        qemu_fdt_setprop_string(fdti->fdt, node_path, "compatible",
+                                "invalidated");
+    }
+exit:
+
+    DB_PRINT_NP(1, "exit\n");
+
+    if (!fdt_init_has_opaque(fdti, node_path)) {
+        fdt_init_set_opaque(fdti, node_path, NULL);
+    }
+    g_free(node_path);
+    g_free(all_compats);
+    g_free(device_type);
+    return;
+}
+
+static int simple_bus_fdt_init(char *node_path, FDTMachineInfo *fdti)
+{
+    int i;
+    char **children;
+    int num_children = qemu_devtree_get_num_children(fdti->fdt, node_path);
+
+    if (num_children <= 0) {
+        return 0;
+    }
+
+    children = g_malloc0(sizeof(*children) * num_children);
+
+    num_children = qemu_devtree_get_children(fdti->fdt, node_path, num_children,
+                                             children);
+
+    DB_PRINT_NP(num_children ? 0 : 1, "num child devices: %d\n", num_children);
+
+    for (i = 0; i < num_children; i++) {
+        struct FDTInitNodeArgs *init_args = g_malloc0(sizeof(*init_args));
+        init_args->node_path = children[i];
+        init_args->fdti = fdti;
+        qemu_coroutine_enter(qemu_coroutine_create(fdt_init_node, init_args));
+    }
+
+    g_free(children);
+    return 0;
+}
+
+static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
+{
+    return 0;
+}
+
diff --git a/include/hw/core/fdt_generic_util.h b/include/hw/core/fdt_generic_util.h
new file mode 100644
index 0000000000..e18c4f9c8b
--- /dev/null
+++ b/include/hw/core/fdt_generic_util.h
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: MIT
+
+#ifndef FDT_GENERIC_UTIL_H
+#define FDT_GENERIC_UTIL_H
+
+#include "qemu/help-texts.h"
+#include "fdt_generic.h"
+#include "system/memory.h"
+#include "qom/object.h"
+
+/*
+ * create a fdt_generic machine. the top level cpu irqs are required for
+ * systems instantiating interrupt devices. The client is responsible for
+ * destroying the returned FDTMachineInfo (using fdt_init_destroy_fdti)
+ */
+
+FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq);
+
+#endif /* FDT_GENERIC_UTIL_H */
-- 
2.43.0


