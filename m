Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c3ef218bsm76340466b.71.2024.07.05.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:41:01 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6572862155;
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
Subject: [PATCH v2 28/40] plugins: Free CPUPluginState before destroying vCPU state
Date: Fri,  5 Jul 2024 09:40:35 +0100
Message-Id: <20240705084047.857176-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VXDFzU2R533F

From: Philippe Mathieu-Daudé <philmd@linaro.org>

cpu::plugin_state is allocated in cpu_common_initfn() when
the vCPU state is created. Release it in cpu_common_finalize()
when we are done.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240606124010.2460-3-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h | 3 +++
 hw/core/cpu-common.c  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index bc5aef979e..af5f9db469 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -149,6 +149,9 @@ struct CPUPluginState {
 
 /**
  * qemu_plugin_create_vcpu_state: allocate plugin state
+ *
+ * The returned data must be released with g_free()
+ * when no longer required.
  */
 CPUPluginState *qemu_plugin_create_vcpu_state(void);
 
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f131cde2c0..8f6cb64da3 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -283,6 +283,11 @@ static void cpu_common_finalize(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
+#ifdef CONFIG_PLUGIN
+    if (tcg_enabled()) {
+        g_free(cpu->plugin_state);
+    }
+#endif
     g_array_free(cpu->gdb_regs, TRUE);
     qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
     qemu_mutex_destroy(&cpu->work_mutex);
-- 
2.39.2
