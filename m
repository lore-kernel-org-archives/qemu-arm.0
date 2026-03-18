Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B32103E162
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Mar 2026 10:49:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2oQo-0003bH-MC; Wed, 18 Mar 2026 06:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w2oQd-0003X4-LJ
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 06:47:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w2oQb-0003LX-9o
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 06:47:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso60920765e9.3
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 03:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773830823; x=1774435623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZccvTnv2HkjQxcvO+im/Zhj/O+R+gRIbwLk7ilc4DiI=;
 b=O6gQuZ8GfxeS8/hu7E1rkowN8SojwCj0JanjYlV1dZG+Zs/wTnsY/g4BKxZbhe7RTe
 sT178ful8HQlZZK52rHQ3QsK3Hvj7Em0ys13cxzO+88tT1AALcEssNHTEGdh/t224yQb
 Rv/gROub1SucHQ9FTJ2YNu6mBTJGJpwkYBjLMCzNrQ2p50r8kJW8VmpdetqgzpgbEyjo
 t3qtdLhippAcXja33/ZD2/uSnSVxh52Y6+KgI1GjlufmLVGbHaCBC43x4nC3lUNKuHS/
 xRByuwbwqUUZK6T/VgN3cIR/wTklKxEl5O9Nbe9pcx1RKLyntoNS9e5a7mmZ8hczVMpK
 a+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773830824; x=1774435624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZccvTnv2HkjQxcvO+im/Zhj/O+R+gRIbwLk7ilc4DiI=;
 b=DVKfF0cvNFea+i69wr8Z/KUAbbo5VClUamMn9Z9Nok9KYm0ZAKpOVCSbFtpaH8/1sM
 iNamcZcR3s/VnpwbZw7/Fycl+tpNMDP5qh5JuAd9lkSnwYv0eTlWjdenklehPOoexCHU
 39OnLy2KG1FMAsD9Y7Y3E9G/cdE8TKkFon6QZmkUJWIrDK59CrauMJEA9f0CjdaFGXMR
 nJL7H9De/qVXvPeEz5U3N2bIgOZHS6zXMTbhBZJIj40/oq7HIm4weA8HUCM6cZ6Vv3g/
 AbEYC+IjS/n7JsVdnUa5svNXmM+vhBR8XQ6xyNCon0UE0N37n1OlKodYM04mXXJ6fgmI
 zV9w==
X-Gm-Message-State: AOJu0Yy/y+NZXaLzuHvAg0+4QCvStDGWrBxXqMEqfNxCnz8qTCTyOBUT
 6RP13WZGVVB6rG+7gcoCOiu3Y34NsRfBZwsC+Tnvt46f5vatr646/hRt
X-Gm-Gg: ATEYQzwo2A8q2YZyygSlTLIC/zhw1qZ3RYRnsIeP96Uqt412LugCC1aR9ZrEyWdp25C
 GeHu/km/IFUU7P1fZ0RTdawHhxDoS13mcSyNMA/6icziTrX3kjlS4RrnSgzZ2NiqLZLvYgKPIeu
 skoTwAYy72mHCwUUnbnlgboZpl/wTGwvTNnhKq3nQXVsUeKA84e52yeQ+c2gDSlp4ayf1UT1up3
 78kWnhuRT4cLL1HM3YMOiPWwDskXR7v1XcES4994wZJn4SlmwW8I5WVhYppBzPpLlDbY8fqpTgn
 /aDIaeURQcXs7+J56a0gxc3EN8t75ZadRU6amTAykqgfpF/vxa5T4wf0hrc905fDho68EuDyBqh
 szt/zoE1+/q50HFJwULjTOkm9R51jgxDS+C5ZNGyrTzVYW69bQZWJfJfGmhkKl9BqrJQUe6G4Ts
 yknvPDmiqgxLPPcGc0P6eBAJO5Wfm+EaWjO3lONOaj89bnudgzJZK6jkmT2DSd7EbXoQ==
X-Received: by 2002:a05:600c:5248:b0:485:2f6a:6ed with SMTP id
 5b1f17b1804b1-486f4451b9amr52307335e9.28.1773830823435; 
 Wed, 18 Mar 2026 03:47:03 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-80-194.adsl.net.t-com.hr.
 [93.143.80.194]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-486f420de8asm56471095e9.3.2026.03.18.03.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 03:47:02 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 alex.bennee@linaro.org, peter.maydell@linaro.org,
 pierrick.bouvier@linaro.org, philmd@linaro.org, Ruslan_Ruslichenko@epam.com
Subject: [RFC PATCH 4/9] plugins: Introduce fault injection API and core
 subsystem
Date: Wed, 18 Mar 2026 11:46:35 +0100
Message-ID: <20260318104640.239752-5-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318104640.239752-1-ruslichenko.r@gmail.com>
References: <20260318104640.239752-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x330.google.com
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

The patch adds infrastructure of fault injection API to plugins.
The following capabilities introduced:

- MMIO overrides: Allows plugins to register callbacks that intercept
  MMIO accesses.
- IRQ injection: Provides mechanism to raise or pulse hardware irq's
  directly to primary interrupt controller.
- CPU Excheption injection: Provides API for injecting CPU exceptions.
  As of now only ARM targets supported.
- Custom Fault Registry: Implements a registry allowing QEMU device
  models to expose custom, device-specific fault handlers. Plugins
  can trigger these dynamically by name.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/plugins/qemu-plugin.h |  19 ++++++
 include/qemu/plugin.h         |  39 ++++++++++++
 plugins/api.c                 |  27 ++++++++
 plugins/fault.c               | 116 ++++++++++++++++++++++++++++++++++
 plugins/meson.build           |   1 +
 5 files changed, 202 insertions(+)
 create mode 100644 plugins/fault.c

diff --git a/include/plugins/qemu-plugin.h b/include/plugins/qemu-plugin.h
index a68427536f..96e2787788 100644
--- a/include/plugins/qemu-plugin.h
+++ b/include/plugins/qemu-plugin.h
@@ -1255,6 +1255,25 @@ uint64_t qemu_plugin_get_virtual_clock_ns(void);
 QEMU_PLUGIN_API
 void qemu_plugin_timer_virt_ns(uint64_t time, void (*cb)(void*), void *opaque);
 
+typedef bool (*qemu_plugin_mmio_override_cb_t)(uint64_t hwaddr,
+                                               unsigned size,
+                                               bool is_write,
+                                               uint64_t *value);
+
+QEMU_PLUGIN_API
+void qemu_plugin_register_mmio_override_cb(qemu_plugin_id_t id,
+                                           qemu_plugin_mmio_override_cb_t cb);
+
+QEMU_PLUGIN_API
+void qemu_plugin_inject_irq(int irq_num, int cpu, bool pulse);
+
+QEMU_PLUGIN_API
+void qemu_plugin_inject_exception(int excp_index, uint32_t data);
+
+QEMU_PLUGIN_API
+void qemu_plugin_trigger_custom_fault(const char *fault_name, void *target_data,
+                                      void *fault_data);
+
 #ifdef __cplusplus
 } /* extern "C" */
 #endif
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index ddd77bd82c..4cb01b2125 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -43,6 +43,11 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
     return i >> 16;
 }
 
+typedef void (*plugin_irq_inject_cb) (void *opaque, int irq,
+                                      int cpu, bool pulse);
+
+typedef void (*plugin_custom_fault_cb)(void *target_data, void *fault_data);
+
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
@@ -234,6 +239,27 @@ static inline enum qemu_plugin_cb_flags qemu_plugin_get_cb_flags(void)
     return current_cpu->neg.plugin_cb_flags;
 }
 
+void plugin_register_mmio_override_cb(qemu_plugin_id_t id,
+                                      qemu_plugin_mmio_override_cb_t cb);
+
+bool plugin_mmio_override_cb_invoke(uint64_t hwaddr,
+                                    uint64_t size,
+                                    bool is_write,
+                                    uint64_t* data);
+
+void plugin_register_intc(void *opaque, plugin_irq_inject_cb cb);
+
+void plugin_inject_irq(int irq_num, int cpu, bool pulse);
+
+void plugin_inject_exception(int excp_index, uint32_t data);
+
+void plugin_register_custom_fault(const char *fault_name,
+                                  plugin_custom_fault_cb cb);
+
+void plugin_trigger_custom_fault(const char* fault_name, void *target_data,
+                                 void *fault_data);
+
+
 #else /* !CONFIG_PLUGIN */
 
 static inline void qemu_plugin_add_opts(void)
@@ -324,6 +350,19 @@ static inline void qemu_plugin_user_prefork_lock(void)
 static inline void qemu_plugin_user_postfork(bool is_child)
 { }
 
+static inline bool plugin_mmio_override_cb_invoke(uint64_t hwaddr,
+                                                  uint64_t size,
+                                                  bool is_write,
+                                                  void* data)
+{ return false; }
+
+static void plugin_register_intc(void *opaque, plugin_irq_inject_cb cb)
+{ }
+
+static void plugin_register_custom_fault(const char *fault_name,
+                                         plugin_custom_fault_cb cb)
+{ }
+
 #endif /* !CONFIG_PLUGIN */
 
 #endif /* QEMU_PLUGIN_H */
diff --git a/plugins/api.c b/plugins/api.c
index fa650e1219..0adeaa0bc3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -687,3 +687,30 @@ void qemu_plugin_timer_virt_ns(uint64_t time, void (*cb)(void*), void *opaque)
 
     timer_mod(data->timer, time);
 }
+
+uint64_t qemu_plugin_get_virtual_clock_ns(void)
+{
+    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
+void qemu_plugin_register_mmio_override_cb(qemu_plugin_id_t id,
+                                           qemu_plugin_mmio_override_cb_t cb)
+{
+    plugin_register_mmio_override_cb(id, cb);
+}
+
+void qemu_plugin_inject_irq(int irq_num, int cpu, bool pulse)
+{
+    plugin_inject_irq(irq_num, cpu, pulse);
+}
+
+void qemu_plugin_inject_exception(int excp_index, uint32_t data)
+{
+    plugin_inject_exception(excp_index, data);
+}
+
+void qemu_plugin_trigger_custom_fault(const char *fault_name,
+                                      void *target_data, void *fault_data)
+{
+    plugin_trigger_custom_fault(fault_name, target_data, fault_data);
+}
diff --git a/plugins/fault.c b/plugins/fault.c
new file mode 100644
index 0000000000..8f7c1e1333
--- /dev/null
+++ b/plugins/fault.c
@@ -0,0 +1,116 @@
+/*
+ * Fault Injection Core Subsystem
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "cpu.h"
+#include "qemu/main-loop.h"
+#include "hw/core/irq.h"
+#include "qemu/plugin.h"
+
+typedef struct {
+    qemu_plugin_id_t id;
+    qemu_plugin_mmio_override_cb_t cb;
+} MMIOOverrideEntry;
+
+static GArray *mmio_callbacks = NULL;
+
+void *intc_opaque;
+static plugin_irq_inject_cb irq_inject_cb = NULL;
+
+static GHashTable *fault_registry = NULL;
+
+void plugin_register_mmio_override_cb(qemu_plugin_id_t id,
+                                      qemu_plugin_mmio_override_cb_t cb)
+{
+    if (!mmio_callbacks) {
+        mmio_callbacks = g_array_new(FALSE, FALSE,
+                        sizeof(MMIOOverrideEntry));
+    }
+
+    MMIOOverrideEntry entry = { .id = id, .cb = cb };
+    g_array_append_val(mmio_callbacks, entry);
+}
+
+bool plugin_mmio_override_cb_invoke(uint64_t hwaddr,
+                                    uint64_t size,
+                                    bool is_write,
+                                    uint64_t* data)
+{
+    if (!mmio_callbacks) {
+        return false;
+    }
+
+    for (int i = 0; i < mmio_callbacks->len; ++i) {
+        MMIOOverrideEntry *entry = &g_array_index(mmio_callbacks,
+                                                  MMIOOverrideEntry, i);
+        if (entry->cb(hwaddr, size, is_write, data)) {
+            /* Stop on first match */
+            return true;
+        }
+    }
+
+    return false;
+}
+
+void plugin_register_intc(void *opaque, plugin_irq_inject_cb cb)
+{
+    intc_opaque = opaque;
+    irq_inject_cb = cb;
+}
+
+void plugin_inject_irq(int irq_num, int cpu, bool pulse)
+{
+    if (!irq_inject_cb) {
+        return;
+    }
+
+    bool locked = bql_locked();
+
+    if (!locked) {
+        bql_lock();
+    }
+
+    irq_inject_cb(intc_opaque, irq_num, cpu, pulse);
+
+    if (!locked) {
+        bql_unlock();
+    }
+}
+
+void plugin_inject_exception(int excp_index, uint32_t data)
+{
+#if defined (TARGET_ARM)
+    arm_cpu_inject_exception(excp_index, data);
+#else
+    qemu_log_mask(LOG_UNIMP,
+                  "FI: Injecting exception is not supported for this target\n");
+#endif
+}
+
+void plugin_register_custom_fault(const char *fault_name,
+                                  plugin_custom_fault_cb cb){
+    if (!fault_registry) {
+        fault_registry = g_hash_table_new_full(g_str_hash, g_str_equal,
+                                               g_free, NULL);
+    }
+
+    g_hash_table_insert(fault_registry, g_strdup(fault_name), cb);
+}
+
+void plugin_trigger_custom_fault(const char* fault_name, void *target_data,
+                                 void *fault_data)
+{
+    plugin_custom_fault_cb cb = NULL;
+
+    if (fault_registry) {
+        cb = g_hash_table_lookup(fault_registry, fault_name);
+    }
+
+    if (cb) {
+        cb(target_data, fault_data);
+    }
+}
diff --git a/plugins/meson.build b/plugins/meson.build
index 9899f166ee..8995ce5977 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -86,3 +86,4 @@ system_ss.add(files('api.c', 'core.c'))
 
 common_ss.add(files('loader.c'))
 
+specific_ss.add(files('fault.c'))
-- 
2.43.0


