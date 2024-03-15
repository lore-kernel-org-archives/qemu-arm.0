Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989954eju;
        Fri, 15 Mar 2024 06:10:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKd3D34D+erbw6FdVzMFr2/x8+eqqzq+QzSY/EJra7Evt0dw/9heRaB5TXOBSwGX/ow7jSweqlOQtj9dbuMyuQ8womI9nz
X-Received: by 2002:a17:906:c307:b0:a45:f99d:9864 with SMTP id s7-20020a170906c30700b00a45f99d9864mr3101571ejz.68.1710508249442;
        Fri, 15 Mar 2024 06:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508249; cv=none;
        d=google.com; s=arc-20160816;
        b=hUtl3ISEmSqUYMPR9CrkQWxYLeLAYdi6Re3mopmATMZLVs1RktLslfbGOhSEkrgSTz
         9wuZnrd9Y8N5jyxHx4SftpIwbi6KIHXO7WRNEGqqli7vnaSB+nxWebd/ro/0dc8l9qma
         6b9SCnL5H4dDbRM1fjVNV14XevfgZ6riMDJ7bVmif98r3DlnqFCwTzVeKfDtMgCeODFW
         2DJu0nltTVU3wxTG/0xEohkKkqbIhWi6StPvbHjexxQ827sgo0IpKWgt7aDHs1uZrGvp
         vYn0pNVGKONXvi9KuuML73hm8SFBh6UiRxsKFRU/Qst7rnl+tYetBZEd5rtlxCVkzn67
         YUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H3LBH1Jf2Bo2/j/14kl9+1lHNfd8WjvuONiFN4gQJjI=;
        fh=9x3MsbVoeE+lC0ZpbWHsIRK1fbSb7Nk26aMN1WhoyRU=;
        b=FWkm04aXTKugKgLhYu89Vo0btanSmZ0hlf5kWtx7tEwu3X4VIrzeqyuLgw12ixiCYp
         eUjZqwfrOQ+oBxBmTSHu89PRRZmM9JTN8y/QDQNMB2VeG4Nyq0nMZkVfLIcM/9U679hz
         EcIlBCk4CdjNJu7NCXk9B59Eyyh0sXXgnMbYMOIDD8A4xStbXOvv0mdLNY8rUmLETJYE
         wbNyTsOjEjKdl1ewFfiiP/Lbz2Y5cCN62iiQMbtecsyy9yxzuSIBYxbF/w0berhw/Rfc
         wHtVxN634M7I/MKF8Fodnz4p6KLKRtGFSIdxMH09fA9kjlECruv11qW6gVMSuzUhhdf0
         fKKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iv8x+osE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mb7-20020a170906eb0700b00a469be3a999sor17863ejb.2.2024.03.15.06.10.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iv8x+osE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508249; x=1711113049; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3LBH1Jf2Bo2/j/14kl9+1lHNfd8WjvuONiFN4gQJjI=;
        b=iv8x+osEO8xeVeGqygp27btwHJrX+qNnu6PEJbXAi/+N0aHzGM8buUQ1MaAwyUU+bB
         MF5cxLeEcuyCwbZt6sAgww8En1LgtQhx6NMYfQvzOKjrEUPOWCRBoZ68s+C6R41l0g9D
         07h7oqt0C27skw24RP7Ou4y4ru1m1W/B53wX6iHIM1sGEJ+S9ZSkR1yZ6XSru5ZkJGHA
         +jG5ZuifU1rP/UKK05CvaNFnlqV92xMkV+zRlhG/AfOk97WPiurWykwtDlzW3BVTOwUS
         33udkjP4mUZ4JzlanWXIHTtLLZk9YHS2mqW3ErvhsSi8mD+UWwXdiIUQeB2adu3TWCT9
         Urug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508249; x=1711113049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3LBH1Jf2Bo2/j/14kl9+1lHNfd8WjvuONiFN4gQJjI=;
        b=GyfdljZozki7bd8GlbWiXZGfPFzTqTZru3YnbuExbfrqmobzkuE6GiDeS19LvBIXNY
         CnKPztxSOVJZt/9W9BxDKZO9MliOY15ekoqafArqUbuQmmSWFa7oRsTkw7M0duD45WXl
         QOTFz8pE8FmAqs77V9GYkqTc6kzZjTZJYpjmX/7iDDuWjwOVcnZEBFCRgnwYNLQ2k6FV
         9xN51TUccwZBiehszmqLTg3S05UW04Og+RCCIgm5gx5NXze9C9lo6z4MxYOGEqDzoLDW
         NOR7mEaRiWEKmdyJYJ+BTSBo9eNNcvLzSfqWzjEEgeCbijjUBA5oXuiDoGzrv+TlxJF+
         meYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVn3bLx2ZyKBZ2nW6FjWUmtbXrMJpONo9gRRhvyXlPYCfep6SjU2WlFUmy17BUmWrv1s7AoD0QrADAA7KO+u6FPiYEgGQq
X-Gm-Message-State: AOJu0YzppofegZq8iKE82+0N+SvEsYRKu3nlf21efniTaZk+2+nx7GL/
	6jmT9DNk9MyywYOYcjQ2oZFvqZQExQ2ATLY/vIESlGR8RWmidXEpjtV2iDW9c8+OUg==
X-Google-Smtp-Source: AGHT+IHT0ljMv+ZylpuooIW3Z37sPNxE+a2hhO+L1RZyKrqkhraPNn7FD79q/JmglujaaRO/o6TY3g==
X-Received: by 2002:a17:907:7d8f:b0:a46:98a5:ba58 with SMTP id oz15-20020a1709077d8f00b00a4698a5ba58mr459522ejc.40.1710508248931;
        Fri, 15 Mar 2024 06:10:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id gx27-20020a1709068a5b00b00a465fd3977esm1730440ejc.143.2024.03.15.06.10.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Roth <michael.roth@amd.com>
Subject: [RFC PATCH-for-9.1 14/21] system: Introduce QMP generic_query_cpu_definitions()
Date: Fri, 15 Mar 2024 14:09:02 +0100
Message-ID: <20240315130910.15750-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UwTfSv22dWeR

Each target use a common template for qmp_query_cpu_definitions().

Extract it as generic_query_cpu_definitions(), keeping the
target-specific implementations as the following SysemuCPUOps
handlers:
 - cpu_list_compare()
 - add_definition()
 - add_alias_definitions()

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                           |  2 +
 include/hw/core/sysemu-cpu-ops.h      | 14 ++++++
 include/qapi/commands-target-compat.h | 14 ++++++
 system/cpu-qmp-cmds.c                 | 71 +++++++++++++++++++++++++++
 system/meson.build                    |  1 +
 5 files changed, 102 insertions(+)
 create mode 100644 include/qapi/commands-target-compat.h
 create mode 100644 system/cpu-qmp-cmds.c

diff --git a/MAINTAINERS b/MAINTAINERS
index af27490243..39d7c14d98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -148,6 +148,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: system/cpus.c
+F: system/cpu-qmp-cmds.c
 F: system/cpu-qom-helpers.c
 F: system/watchpoint.c
 F: cpu-common.c
@@ -1894,6 +1895,7 @@ F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
+F: include/qapi/commands-target-compat.h
 F: include/sysemu/numa.h
 F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 24d003fe04..2173226e97 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -11,6 +11,7 @@
 #define SYSEMU_CPU_OPS_H
 
 #include "hw/core/cpu.h"
+#include "qapi/qapi-types-machine.h"
 
 /*
  * struct SysemuCPUOps: System operations specific to a CPU class
@@ -81,6 +82,19 @@ typedef struct SysemuCPUOps {
      */
     bool (*virtio_is_big_endian)(CPUState *cpu);
 
+    /**
+     * @cpu_list_compare: Sort alphabetically by type name,
+     *                    respecting CPUClass::ordering.
+     */
+    gint (*cpu_list_compare)(gconstpointer cpu_class_a, gconstpointer cpu_class_b);
+    /**
+     * @add_definition: Add the @cpu_class definition to @cpu_list.
+     */
+    void (*add_definition)(gpointer cpu_class, gpointer cpu_list);
+    /**
+     * @add_alias_definitions: Add CPU alias definitions to @cpu_list.
+     */
+    void (*add_alias_definitions)(CpuDefinitionInfoList **cpu_list);
     /**
      * @legacy_vmsd: Legacy state for migration.
      *               Do not use in new targets, use #DeviceClass::vmsd instead.
diff --git a/include/qapi/commands-target-compat.h b/include/qapi/commands-target-compat.h
new file mode 100644
index 0000000000..86d45d8fcc
--- /dev/null
+++ b/include/qapi/commands-target-compat.h
@@ -0,0 +1,14 @@
+/*
+ * QAPI helpers for target specific QMP commands
+ *
+ * SPDX-FileCopyrightText: 2024 Linaro Ltd.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef QAPI_COMPAT_TARGET_H
+#define QAPI_COMPAT_TARGET_H
+
+#include "qapi/qapi-types-machine.h"
+
+CpuDefinitionInfoList *generic_query_cpu_definitions(Error **errp);
+
+#endif
diff --git a/system/cpu-qmp-cmds.c b/system/cpu-qmp-cmds.c
new file mode 100644
index 0000000000..daeb131159
--- /dev/null
+++ b/system/cpu-qmp-cmds.c
@@ -0,0 +1,71 @@
+/*
+ * QAPI helpers for target specific QMP commands
+ *
+ * SPDX-FileCopyrightText: 2024 Linaro Ltd.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "qapi/commands-target-compat.h"
+#include "sysemu/arch_init.h"
+#include "hw/core/cpu.h"
+#include "hw/core/sysemu-cpu-ops.h"
+
+static void cpu_common_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = cpu_model_from_type(typename);
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+static void arch_add_cpu_definitions(CpuDefinitionInfoList **cpu_list,
+                                     const char *cpu_typename)
+{
+    ObjectClass *oc;
+    GSList *list;
+    const struct SysemuCPUOps *ops;
+
+    oc = object_class_by_name(cpu_typename);
+    if (!oc) {
+        return;
+    }
+    ops = CPU_CLASS(oc)->sysemu_ops;
+
+    list = object_class_get_list(cpu_typename, false);
+    if (ops->cpu_list_compare) {
+        list = g_slist_sort(list, ops->cpu_list_compare);
+    }
+    g_slist_foreach(list, ops->add_definition ? : cpu_common_add_definition,
+                    cpu_list);
+    g_slist_free(list);
+
+    if (ops->add_alias_definitions) {
+        ops->add_alias_definitions(cpu_list);
+    }
+}
+
+CpuDefinitionInfoList *generic_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+
+    for (unsigned i = 0; i <= QEMU_ARCH_BIT_LAST; i++) {
+        const char *cpu_typename;
+
+        cpu_typename = cpu_typename_by_arch_bit(i);
+        if (!cpu_typename) {
+            continue;
+        }
+        arch_add_cpu_definitions(&cpu_list, cpu_typename);
+    }
+
+    return cpu_list;
+}
diff --git a/system/meson.build b/system/meson.build
index c6ee97e3b2..dd78caa9b7 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -10,6 +10,7 @@ system_ss.add(files(
   'balloon.c',
   'bootdevice.c',
   'cpus.c',
+  'cpu-qmp-cmds.c',
   'cpu-qom-helpers.c',
   'cpu-throttle.c',
   'cpu-timers.c',
-- 
2.41.0
