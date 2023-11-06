Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0032fbd0c7d04sm304416wrq.55.2023.11.06.10.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:51:19 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 763C665565;
	Mon,  6 Nov 2023 18:51:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 11/22] cpu: Call plugin hooks only when ready
Date: Mon,  6 Nov 2023 18:51:01 +0000
Message-Id: <20231106185112.2755262-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106185112.2755262-1-alex.bennee@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eQiz6haJ+mUy

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The initialization and exit hooks will not affect the state of vCPU
outside TCG context, but they may depend on the state of vCPU.
Therefore, it's better to call plugin hooks after the vCPU state is
fully initialized and before it gets uninitialized.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231025093128.33116-16-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231103195956.1998255-23-alex.bennee@linaro.org>
---
 cpu-target.c         | 11 -----------
 hw/core/cpu-common.c | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 79363ae370..00cd7f4d69 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -42,7 +42,6 @@
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
-#include "qemu/plugin.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -143,11 +142,6 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
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
@@ -174,11 +168,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
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
index bab8942c30..0acfed4c0f 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -209,6 +209,11 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
         cpu_resume(cpu);
     }
 
+    /* Plugin initialization must wait until the cpu is fully realized. */
+    if (tcg_enabled()) {
+        qemu_plugin_vcpu_init_hook(cpu);
+    }
+
     /* NOTE: latest generic point where the cpu is fully realized */
 }
 
@@ -216,6 +221,11 @@ static void cpu_common_unrealizefn(DeviceState *dev)
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
-- 
2.39.2
