Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf61f69sm662766266b.67.2024.07.05.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:41:00 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4CA5E5F92B;
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
Subject: [PATCH v2 27/40] plugins: Ensure vCPU index is assigned in init/exit hooks
Date: Fri,  5 Jul 2024 09:40:34 +0100
Message-Id: <20240705084047.857176-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cKYgzPevRWLc

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since vCPUs are hashed by their index, this index can't
be uninitialized (UNASSIGNED_CPU_INDEX).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240606124010.2460-2-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/plugins/core.c b/plugins/core.c
index 9d737d8278..a864275ae7 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -245,6 +245,7 @@ void qemu_plugin_vcpu_init_hook(CPUState *cpu)
 {
     bool success;
 
+    assert(cpu->cpu_index != UNASSIGNED_CPU_INDEX);
     qemu_rec_mutex_lock(&plugin.lock);
     plugin.num_vcpus = MAX(plugin.num_vcpus, cpu->cpu_index + 1);
     plugin_cpu_update__locked(&cpu->cpu_index, NULL, NULL);
@@ -263,6 +264,7 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
 
     plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_EXIT);
 
+    assert(cpu->cpu_index != UNASSIGNED_CPU_INDEX);
     qemu_rec_mutex_lock(&plugin.lock);
     success = g_hash_table_remove(plugin.cpu_ht, &cpu->cpu_index);
     g_assert(success);
-- 
2.39.2
