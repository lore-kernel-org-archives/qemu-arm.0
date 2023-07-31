Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2026336ejb;
        Mon, 31 Jul 2023 01:47:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:843:b0:67a:9208:87a with SMTP id q3-20020a056a00084300b0067a9208087amr10443223pfk.23.1690793246153;
        Mon, 31 Jul 2023 01:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793246; cv=none;
        d=google.com; s=arc-20160816;
        b=dL53XbHLmjp83EqOD+TQDCsFlpq/92ZESpkFA4NqcKzUWPlDtv4VkjDp6AB3p4Yxkp
         ooby6FlBXS8dgKZY6q6KchADNqG2cFOmJEl3x5U7kIUXi1duGtUHHQWWYtemZ4TE+T1y
         iUjqzQYh+54atpJW6JzPAos0E+wiOe8LQ4pd312l0+9OAj1+MnnCcjfhu4dKZ16PmtwD
         /MwEHpJ/VscevC7FZ1vg3ob9ZKUm17WRfANtqS1D7m0HKxL6OjGzdaJ4DSs8S89bSPsh
         4vDc2tWmWn6OGb2/eW42fXZlVU5BMZxMCqW8iXZC6gEfbb5pPJzHmMl7p8qHgq3tPKxm
         Z/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pkAMXzWLpRkH5krv4cGVkpHiNU1YTqojQ0YjYT7VOO8=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=wKa87IsbnXCjaiwsh+3nk8m3UNhCPoWVWPNc1bozgsNaryU0tiOFDQtKuHN8uFs8Do
         5vrGTglt/ctr6ssznJt5VVL2PXx/1iqfaLsGbdEzEzBbthKOh4e3nK2Mk93SeKoi3ZXC
         yULxA93NAQop+lwOdfQu1oWSpYuTRSczjME+eUEVwH9IeAA+p6M8Sh+3L+lZbiAi01Ps
         ZvKYuu3T3NGe+HVcSmVmpF4/nAx1bUoMDd80Kr43EIWcfygf3PEtOKj7efg5A15fi0L8
         Ss751vydn2V0eadeseBXH0ivDhfGs/XWuMrek4exPxiICHxkKSwDoi06YsRDm8pDDzeO
         9aKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="5VI/8DDy";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q12-20020aa7842c000000b006824b98dd84sor3448053pfn.7.2023.07.31.01.47.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:47:26 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="5VI/8DDy";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793245; x=1691398045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkAMXzWLpRkH5krv4cGVkpHiNU1YTqojQ0YjYT7VOO8=;
        b=5VI/8DDyL+Dq2u6mipsb7KpcrPPw7wzvVzIhOZjCRlnzLxQxlOCpk3uKPEGt/Vse3E
         llz11VoJTYVaMoD98xgVmXsGKNkEWz/gP0m49BECa1qBwSh92UZ6cKFrW6KrFlOCaVxX
         ywAYIsvSzWeSHerxo+8zLyS8+1LP/dNeW9yk+8pRRPB38FGFgCxZ2OlpY5qJxO8P2W9d
         uyd2RfAthgTZuVrDg8YkodLv7dqDuqr7VEo9EftBxUD2/rV3LU0jrEs/hmtggbO9gZxx
         A/xwXOVwQtBP6knVESb7mm4orqJNewvTIY9UHTSZ4uD/6vXKddWwVozEQ1DzYTwvbTZW
         NQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793245; x=1691398045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkAMXzWLpRkH5krv4cGVkpHiNU1YTqojQ0YjYT7VOO8=;
        b=I5G2NlV5QkVB9hv0Rh20vFwEcFYM0rAAPR1I9AivGhg/807yi/1UxTwXvCdsKu9kof
         zOZkdwfORRN5fR529cjSL2bfrpLq3T3Fgn5UpdTypFKEeu/wEZ7/nKi2S+izPAyWXzGp
         kbVa5lALPDm/VvagV4hnBSckZ6/r55nXxxkYPIXe2wyS0wcB1I3R+toFC9d0zRHRvJi/
         zT9z+DdCIpCy9Sr8+dqJIApSt90UK+c5go6undevEj4q5FjxPFK5+2asH1I1ay5F4N/r
         V/YVTMWRot0sd2U2herSRhsbbufDebAx5vB3EVZfzt5FYjJKkD4qEK9u/mMGPRRB3BQN
         luUw==
X-Gm-Message-State: ABy/qLZ7BJ9Pprop/dQOnrkY/5w1Mt2yzlL743ilnaHW/qI4zOXOINen
	5kv1acnM4KppLX9xugWUVpZpjw==
X-Google-Smtp-Source: APBJJlGU5LwqEBb0O9rbYYygkPxT10/cuYLhGKDiZiLetwr+kj+8R/Z5G3z2u8VZwh3KKgJ2AkMusw==
X-Received: by 2002:a05:6a00:88e:b0:681:3ed2:b493 with SMTP id q14-20020a056a00088e00b006813ed2b493mr10319253pfj.26.1690793245616;
        Mon, 31 Jul 2023 01:47:25 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:47:25 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 21/24] plugins: Allow to read registers
Date: Mon, 31 Jul 2023 17:43:48 +0900
Message-ID: <20230731084354.115015-22-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: n4IWeKcALtVs

It is based on GDB protocol to ensure interface stability.

The timing of the vcpu init hook is also changed so that the hook will
get called after GDB features are initialized.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/qemu/qemu-plugin.h   | 65 ++++++++++++++++++++++++++++++++++--
 cpu.c                        | 11 ------
 hw/core/cpu-common.c         | 10 ++++++
 plugins/api.c                | 40 ++++++++++++++++++++++
 plugins/qemu-plugins.symbols |  2 ++
 5 files changed, 114 insertions(+), 14 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 50a9957279..214b12bfd6 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -11,6 +11,7 @@
 #ifndef QEMU_QEMU_PLUGIN_H
 #define QEMU_QEMU_PLUGIN_H
 
+#include <glib.h>
 #include <inttypes.h>
 #include <stdbool.h>
 #include <stddef.h>
@@ -51,7 +52,7 @@ typedef uint64_t qemu_plugin_id_t;
 
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
-#define QEMU_PLUGIN_VERSION 1
+#define QEMU_PLUGIN_VERSION 2
 
 /**
  * struct qemu_info_t - system information for plugins
@@ -218,8 +219,8 @@ struct qemu_plugin_insn;
  * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
  * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
  *
- * Note: currently unused, plugins cannot read or change system
- * register state.
+ * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot change
+ * system register state.
  */
 enum qemu_plugin_cb_flags {
     QEMU_PLUGIN_CB_NO_REGS,
@@ -664,4 +665,62 @@ uint64_t qemu_plugin_end_code(void);
  */
 uint64_t qemu_plugin_entry_code(void);
 
+/**
+ * struct qemu_plugin_register_file_t - register information
+ *
+ * This structure identifies registers. The identifiers included in this
+ * structure are identical with names used in GDB's standard target features
+ * with some extensions. For details, see:
+ * https://sourceware.org/gdb/onlinedocs/gdb/Standard-Target-Features.html
+ *
+ * A register is uniquely identified with the combination of a feature name
+ * and a register name or a register number. It is recommended to derive
+ * register numbers from feature names and register names each time a new vcpu
+ * starts.
+ *
+ * To derive the register number from a feature name and a register name,
+ * first look up qemu_plugin_register_file_t with the feature name, and then
+ * look up the register name in its @regs. The sum of the @base_reg and the
+ * index in the @reg is the register number.
+ *
+ * Note that @regs may have holes; some elements of @regs may be NULL.
+ */
+typedef struct qemu_plugin_register_file_t {
+    /** @name: feature name */
+    const char *name;
+    /** @regs: register names */
+    const char * const *regs;
+    /** @base_reg: the base identified number */
+    int base_reg;
+    /** @num_regs: the number of elements in @regs */
+    int num_regs;
+} qemu_plugin_register_file_t;
+
+/**
+ * qemu_plugin_get_register_files() - returns register information
+ *
+ * @vcpu_index: the index of the vcpu context
+ * @size: the pointer to the variable to hold the number of returned elements
+ *
+ * Returns an array of qemu_plugin_register_file_t. The user should g_free()
+ * the array once no longer needed.
+ */
+qemu_plugin_register_file_t *
+qemu_plugin_get_register_files(unsigned int vcpu_index, int *size);
+
+/**
+ * qemu_plugin_read_register() - read register
+ *
+ * @buf: the byte array to append the read register content to.
+ * @reg: the register identifier determined with
+ *       qemu_plugin_get_register_files().
+ *
+ * This function is only available in a context that register read access is
+ * explicitly requested.
+ *
+ * Returns the size of the read register. The content of @buf is in target byte
+ * order.
+ */
+int qemu_plugin_read_register(GByteArray *buf, int reg);
+
 #endif /* QEMU_QEMU_PLUGIN_H */
diff --git a/cpu.c b/cpu.c
index 1c948d1161..2552c85249 100644
--- a/cpu.c
+++ b/cpu.c
@@ -42,7 +42,6 @@
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
-#include "qemu/plugin.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -148,11 +147,6 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     /* Wait until cpu initialization complete before exposing cpu. */
     cpu_list_add(cpu);
 
-    /* Plugin initialization must wait until cpu_index assigned. */
-    if (tcg_enabled()) {
-        qemu_plugin_vcpu_init_hook(cpu);
-    }
-
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
            qdev_get_vmsd(DEVICE(cpu))->unmigratable);
@@ -179,11 +173,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     }
 #endif
 
-    /* Call the plugin hook before clearing cpu->cpu_index in cpu_list_remove */
-    if (tcg_enabled()) {
-        qemu_plugin_vcpu_exit_hook(cpu);
-    }
-
     cpu_list_remove(cpu);
     /*
      * Now that the vCPU has been removed from the RCU list, we can call
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 549f52f46f..e06a70007a 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -211,6 +211,11 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
         cpu_resume(cpu);
     }
 
+    /* Plugin initialization must wait until the cpu is fully realized. */
+    if (tcg_enabled()) {
+        qemu_plugin_vcpu_init_hook(cpu);
+    }
+
     /* NOTE: latest generic point where the cpu is fully realized */
 }
 
@@ -218,6 +223,11 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 {
     CPUState *cpu = CPU(dev);
 
+    /* Call the plugin hook before clearing the cpu is fully unrealized */
+    if (tcg_enabled()) {
+        qemu_plugin_vcpu_exit_hook(cpu);
+    }
+
     /* NOTE: latest generic point before the cpu is fully unrealized */
     cpu_exec_unrealizefn(cpu);
 }
diff --git a/plugins/api.c b/plugins/api.c
index 2078b16edb..dd7ff5067b 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -35,6 +35,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "qemu/plugin.h"
 #include "qemu/log.h"
 #include "tcg/tcg.h"
@@ -442,3 +443,42 @@ uint64_t qemu_plugin_entry_code(void)
 #endif
     return entry;
 }
+
+static void count_gdb_feature(void *opaque, const GDBFeature *feature,
+                              int base_reg)
+{
+    (*(int *)opaque)++;
+}
+
+static void map_gdb_feature(void *opaque, const GDBFeature *feature,
+                            int base_reg)
+{
+    qemu_plugin_register_file_t **cursor = opaque;
+    (*cursor)->name = feature->name;
+    (*cursor)->regs = feature->regs;
+    (*cursor)->base_reg = base_reg;
+    (*cursor)->num_regs = feature->num_regs;
+    (*cursor)++;
+}
+
+qemu_plugin_register_file_t *
+qemu_plugin_get_register_files(unsigned int vcpu_index, int *size)
+{
+    QEMU_IOTHREAD_LOCK_GUARD();
+
+    *size = 0;
+    gdb_foreach_feature(qemu_get_cpu(vcpu_index), count_gdb_feature, size);
+
+    qemu_plugin_register_file_t *files =
+        g_new(qemu_plugin_register_file_t, *size);
+
+    qemu_plugin_register_file_t *cursor = files;
+    gdb_foreach_feature(qemu_get_cpu(vcpu_index), map_gdb_feature, &cursor);
+
+    return files;
+}
+
+int qemu_plugin_read_register(GByteArray *buf, int reg)
+{
+    return gdb_read_register(current_cpu, buf, reg, true);
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549..4ed9e70e47 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -42,4 +42,6 @@
   qemu_plugin_tb_vaddr;
   qemu_plugin_uninstall;
   qemu_plugin_vcpu_for_each;
+  qemu_plugin_get_register_files;
+  qemu_plugin_read_register;
 };
-- 
2.41.0
