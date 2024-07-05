Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58fbfccf0f9sm444538a12.75.2024.07.05.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:41:04 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7D4CF62156;
	Fri,  5 Jul 2024 09:40:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 29/40] accel/tcg: Move qemu_plugin_vcpu_init__async() to plugins/
Date: Fri,  5 Jul 2024 09:40:36 +0100
Message-Id: <20240705084047.857176-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mTj8Q1CHngdF

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Calling qemu_plugin_vcpu_init__async() on the vCPU thread
is a detail of plugins, not relevant to TCG vCPU management.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240606124010.2460-4-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/core/cpu-common.c | 9 +--------
 plugins/core.c       | 8 +++++++-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 8f6cb64da3..b19e1fdacf 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -192,13 +192,6 @@ static void cpu_common_parse_features(const char *typename, char *features,
     }
 }
 
-#ifdef CONFIG_PLUGIN
-static void qemu_plugin_vcpu_init__async(CPUState *cpu, run_on_cpu_data unused)
-{
-    qemu_plugin_vcpu_init_hook(cpu);
-}
-#endif
-
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
@@ -274,7 +267,7 @@ static void cpu_common_initfn(Object *obj)
 #ifdef CONFIG_PLUGIN
     if (tcg_enabled()) {
         cpu->plugin_state = qemu_plugin_create_vcpu_state();
-        async_run_on_cpu(cpu, qemu_plugin_vcpu_init__async, RUN_ON_CPU_NULL);
+        qemu_plugin_vcpu_init_hook(cpu);
     }
 #endif
 }
diff --git a/plugins/core.c b/plugins/core.c
index a864275ae7..12c67b4b4e 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -241,7 +241,7 @@ static void plugin_grow_scoreboards__locked(CPUState *cpu)
     end_exclusive();
 }
 
-void qemu_plugin_vcpu_init_hook(CPUState *cpu)
+static void qemu_plugin_vcpu_init__async(CPUState *cpu, run_on_cpu_data unused)
 {
     bool success;
 
@@ -258,6 +258,12 @@ void qemu_plugin_vcpu_init_hook(CPUState *cpu)
     plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_INIT);
 }
 
+void qemu_plugin_vcpu_init_hook(CPUState *cpu)
+{
+    /* Plugin initialization must wait until the cpu start executing code */
+    async_run_on_cpu(cpu, qemu_plugin_vcpu_init__async, RUN_ON_CPU_NULL);
+}
+
 void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
 {
     bool success;
-- 
2.39.2
