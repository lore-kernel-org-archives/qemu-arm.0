Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB449D6AB17
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 22:02:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q21-0008Ex-Et; Thu, 02 Apr 2026 17:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q1z-0008D9-E5
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:56:51 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q1x-00072y-H0
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:56:51 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b8d7f22d405so207461566b.0
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167008; x=1775771808; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COppB07ZdgBSIiLPYIXUKRW1DDBdEAcH3Z/PWDGJeWs=;
 b=XtDluCNb9W+ZBaPdofNm5Z+FphNrnu5bPHBpEorvBXcekKUACZBdVzwkdKdfKpE6sh
 76na9LzQDrDE/kNkiC3NhkcvN3olYrzfk7DicvwCEc0Z7UCfo2QN6niCLv94t1iFcdal
 s1oGfp6TA+TSRoX82NRYrnJc4qw3f/u985MaWrkXJPbrBPuskwTOCP97XItliGINab2y
 CYYznW3SJ1dLD+5d3fDlXbniFOg0X9sd0Kd8q3CKg1GP08BImpI+CVfBhsheRpz4U5cW
 zcpascM64CRx/avuTej5Bg3lweSnRPZ/KuOxL59GO23wxlxDe8Mqbb3NGCGQcekxd3XA
 h+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167008; x=1775771808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=COppB07ZdgBSIiLPYIXUKRW1DDBdEAcH3Z/PWDGJeWs=;
 b=TVg6+NgqstslO7fQGayNuGVRRyQAOy0m4rRzwnPsIZ9MRSmnKGLJjpWtPl5ztfUL7j
 DDfEAIVuRmu/JUgqknSR016cgniCWTza1zzlLbrXP6R1ad/PZKYZZtIamGTUo9j6ctqL
 4GacZGcw0y8zXUNSwsckJBRok5hZg9sTqRaI5gWsxN95VQIZoctRMkjLI7/63TsQBRev
 tSsffOBLWluJXdaOKhvF+/Z1hAROr7YAYSLnS9rgNwPXYgTB0lef1Lq9aq2xMwe86gf9
 eKyFg9me7TkwCIc2T7aGI60MXqb6MBZYBuJQshypK52+6nIkgisFobBZjKbK8RCjaZXf
 8caA==
X-Gm-Message-State: AOJu0YwhwkH6q5A2U57fi05xxnHQsVQG2tzI6YaA+mSWgAy1IUfSOS4y
 fRf1aTNAWUV6PjR/DPdVlL9Kqkc8NN8pXgp/ANNomJI/MMwsY6QIkmFJ
X-Gm-Gg: AeBDietYZSIS69bpIxg3ZVbGkDNjlBVcd9alXdm/2x5rok7XsC/c8tyArBOWu8czMcH
 5NuU8eRnVxq96P7B3fSdaqowZ5ZfydC4lrZPLtpriUJbCDWk+uyVWgeTitJ0smlr7pKZPFuchy5
 EnP7lHvlzq8LxcyNL0QdD6JtwtTuvlrcYyQLPcDdnaZt4RKQLzBrePkg6uPqkVh1Fl+uWStk4uk
 Am8NbSZFmLldhdxhROKvfk9C7XS5kMVX0sr4ELZeRVFcrap0PeuvW3XODTleEOtgYd2EvZtnx4Y
 VFfRHof1n0m2/vwD0n76zBg3IjleZzfgcRxFcMUWtAwbESF9y8uZ3WqnjnozMN/xYB6rQRYFWhg
 zdugDG6wt32OOyt75u7cxw80SlfaGEKbaJFZQw9jE25tTAsBci51sntW8fqAQA1TQkeGTkgTUaX
 LeL4jZgUm/HTdbZb2/4jdxdKMceH3NyfnwHDmi9oW+EW+Usuh8i4Zm6aWFkXDjr61SZN8CSoJd9
 0r3qiBO
X-Received: by 2002:a17:907:808:b0:b9c:3ba2:2da8 with SMTP id
 a640c23a62f3a-b9c67b83e0amr24481566b.52.1775167007568; 
 Thu, 02 Apr 2026 14:56:47 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:56:47 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v3 04/33] hw/core: introduce generic FDT device model registry
Date: Thu,  2 Apr 2026 23:55:49 +0200
Message-ID: <20260402215629.745866-5-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x62a.google.com
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

Introduce infrastructure to instantiate device models
directly from the device tree.

This includes the registry of known device models with
associated init functions and key API methods to
operate it.

The MIT license of fdt_generic.c preserved as in original
file from https://github.com/Xilinx/qemu.git repo.

The license for fdt_generic.h derived from matching
fdt_generic.c file.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic.c         | 110 ++++++++++++++++++++++++++++++++++
 include/hw/core/fdt_generic.h |  61 +++++++++++++++++++
 2 files changed, 171 insertions(+)
 create mode 100644 hw/core/fdt_generic.c
 create mode 100644 include/hw/core/fdt_generic.h

diff --git a/hw/core/fdt_generic.c b/hw/core/fdt_generic.c
new file mode 100644
index 0000000000..65e3c1efa3
--- /dev/null
+++ b/hw/core/fdt_generic.c
@@ -0,0 +1,110 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Tables of FDT device models and their init functions. Keyed by compatibility
+ * strings, device instance names.
+ *
+ * Copyright (c) 2010 PetaLogix Qld Pty Ltd.
+ * Copyright (c) 2010 Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>.
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
+#include "hw/core/fdt_generic.h"
+#include "hw/core/qdev-properties.h"
+#include "qemu/log.h"
+
+
+#define FDT_GENERIC_MAX_PATTERN_LEN 1024
+
+typedef struct TableListNode {
+    struct TableListNode *next;
+    char key[FDT_GENERIC_MAX_PATTERN_LEN];
+    FDTInitFn fdt_init;
+    void *opaque;
+} TableListNode;
+
+/* add a node to the table specified by *head_p */
+
+static void add_to_table(
+        FDTInitFn fdt_init,
+        const char *key,
+        void *opaque,
+        TableListNode **head_p)
+{
+    TableListNode *nn = malloc(sizeof(*nn));
+    nn->next = *head_p;
+    strcpy(nn->key, key);
+    nn->fdt_init = fdt_init;
+    nn->opaque = opaque;
+    *head_p = nn;
+}
+
+/* FIXME: add return codes that differentiate between not found and error */
+
+/*
+ * search a table for a key string and call the fdt init function if found.
+ * Returns 0 if a match is found, 1 otherwise
+ */
+
+static int fdt_init_search_table(
+        char *node_path,
+        FDTMachineInfo *fdti,
+        const char *key, /* string to match */
+        TableListNode **head) /* head of the list to search */
+{
+    TableListNode *iter;
+
+    for (iter = *head; iter != NULL; iter = iter->next) {
+        if (!strcmp(key, iter->key)) {
+            if (iter->fdt_init) {
+                return iter->fdt_init(node_path, fdti, iter->opaque);
+            }
+            return 0;
+        }
+    }
+
+    return 1;
+}
+
+TableListNode *compat_list_head;
+
+void add_to_compat_table(FDTInitFn fdt_init, const char *compat, void *opaque)
+{
+    add_to_table(fdt_init, compat, opaque, &compat_list_head);
+}
+
+int fdt_init_compat(char *node_path, FDTMachineInfo *fdti, const char *compat)
+{
+    return fdt_init_search_table(node_path, fdti, compat, &compat_list_head);
+}
+
+TableListNode *inst_bind_list_head;
+
+void add_to_inst_bind_table(FDTInitFn fdt_init, const char *name, void *opaque)
+{
+    add_to_table(fdt_init, name, opaque, &inst_bind_list_head);
+}
+
+int fdt_init_inst_bind(char *node_path, FDTMachineInfo *fdti,
+        const char *name)
+{
+    return fdt_init_search_table(node_path, fdti, name, &inst_bind_list_head);
+}
diff --git a/include/hw/core/fdt_generic.h b/include/hw/core/fdt_generic.h
new file mode 100644
index 0000000000..3d8ec2f7ff
--- /dev/null
+++ b/include/hw/core/fdt_generic.h
@@ -0,0 +1,61 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Tables of FDT device models and their init functions. Keyed by compatibility
+ * strings, device instance names.
+ */
+
+#ifndef FDT_GENERIC_H
+#define FDT_GENERIC_H
+
+#include "qemu/help-texts.h"
+#include "system/device_tree.h"
+
+typedef struct FDTMachineInfo FDTMachineInfo;
+
+typedef int (*FDTInitFn)(char *, FDTMachineInfo *, void *);
+
+/* associate a FDTInitFn with a FDT compatibility */
+
+void add_to_compat_table(FDTInitFn, const char *, void *);
+
+/*
+ * try and find a device model for a particular compatibility. If found,
+ * the FDTInitFn associated with the compat will be called and 0 will
+ * be returned. Returns non-zero on not found or error
+ */
+
+int fdt_init_compat(char *, FDTMachineInfo *, const char *);
+
+/* same as above, but associates with a FDT node name (rather than compat) */
+
+void add_to_inst_bind_table(FDTInitFn, const char *, void *);
+int fdt_init_inst_bind(char *, FDTMachineInfo *, const char *);
+
+/* statically register a FDTInitFn as being associate with a compatibility */
+
+#define fdt_register_compatibility_opaque(function, compat, n, opaque) \
+static void __attribute__((constructor)) \
+function ## n ## _register_imp(void) { \
+    add_to_compat_table(function, compat, opaque); \
+}
+
+#define fdt_register_compatibility_n(function, compat, n) \
+fdt_register_compatibility_opaque(function, compat, n, NULL)
+
+#define fdt_register_compatibility(function, compat) \
+fdt_register_compatibility_n(function, compat, 0)
+
+#define fdt_register_instance_opaque(function, inst, n, opaque) \
+static void __attribute__((constructor)) \
+function ## n ## _register_imp(void) { \
+    add_to_inst_bind_table(function, inst, opaque); \
+}
+
+#define fdt_register_instance_n(function, inst, n) \
+fdt_register_instance_opaque(function, inst, n, NULL)
+
+#define fdt_register_instance(function, inst) \
+fdt_register_instance_n(function, inst, 0)
+
+#endif /* FDT_GENERIC_H */
-- 
2.43.0


