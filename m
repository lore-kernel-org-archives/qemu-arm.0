Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b7f28sm535903766b.70.2024.07.18.02.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:45:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9404F5FA39;
	Thu, 18 Jul 2024 10:45:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Beraldo Leal <bleal@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Ed Maste <emaste@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 06/15] tests/plugins: use qemu_plugin_outs for inline stats
Date: Thu, 18 Jul 2024 10:45:14 +0100
Message-Id: <20240718094523.1198645-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9wr9rP3lcFk3

Using bare printf's in plugins is perfectly acceptable but they do
rather mess up the output of "make check-tcg". Convert the printfs to
use g_string and then output with the plugin output helper which will
already be captured to .pout files by the test harness.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/inline.c | 58 ++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/tests/plugin/inline.c b/tests/plugin/inline.c
index cd63827b7d..73dde99578 100644
--- a/tests/plugin/inline.c
+++ b/tests/plugin/inline.c
@@ -71,10 +71,12 @@ static void stats_insn(void)
     const uint64_t cond_track_left = qemu_plugin_u64_sum(insn_cond_track_count);
     const uint64_t conditional =
         cond_num_trigger * cond_trigger_limit + cond_track_left;
-    printf("insn: %" PRIu64 "\n", expected);
-    printf("insn: %" PRIu64 " (per vcpu)\n", per_vcpu);
-    printf("insn: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
-    printf("insn: %" PRIu64 " (cond cb)\n", conditional);
+    g_autoptr(GString) stats = g_string_new("");
+    g_string_append_printf(stats, "insn: %" PRIu64 "\n", expected);
+    g_string_append_printf(stats, "insn: %" PRIu64 " (per vcpu)\n", per_vcpu);
+    g_string_append_printf(stats, "insn: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
+    g_string_append_printf(stats, "insn: %" PRIu64 " (cond cb)\n", conditional);
+    qemu_plugin_outs(stats->str);
     g_assert(expected > 0);
     g_assert(per_vcpu == expected);
     g_assert(inl_per_vcpu == expected);
@@ -91,10 +93,12 @@ static void stats_tb(void)
     const uint64_t cond_track_left = qemu_plugin_u64_sum(tb_cond_track_count);
     const uint64_t conditional =
         cond_num_trigger * cond_trigger_limit + cond_track_left;
-    printf("tb: %" PRIu64 "\n", expected);
-    printf("tb: %" PRIu64 " (per vcpu)\n", per_vcpu);
-    printf("tb: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
-    printf("tb: %" PRIu64 " (conditional cb)\n", conditional);
+    g_autoptr(GString) stats = g_string_new("");
+    g_string_append_printf(stats, "tb: %" PRIu64 "\n", expected);
+    g_string_append_printf(stats, "tb: %" PRIu64 " (per vcpu)\n", per_vcpu);
+    g_string_append_printf(stats, "tb: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
+    g_string_append_printf(stats, "tb: %" PRIu64 " (conditional cb)\n", conditional);
+    qemu_plugin_outs(stats->str);
     g_assert(expected > 0);
     g_assert(per_vcpu == expected);
     g_assert(inl_per_vcpu == expected);
@@ -107,9 +111,11 @@ static void stats_mem(void)
     const uint64_t per_vcpu = qemu_plugin_u64_sum(count_mem);
     const uint64_t inl_per_vcpu =
         qemu_plugin_u64_sum(count_mem_inline);
-    printf("mem: %" PRIu64 "\n", expected);
-    printf("mem: %" PRIu64 " (per vcpu)\n", per_vcpu);
-    printf("mem: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
+    g_autoptr(GString) stats = g_string_new("");
+    g_string_append_printf(stats, "mem: %" PRIu64 "\n", expected);
+    g_string_append_printf(stats, "mem: %" PRIu64 " (per vcpu)\n", per_vcpu);
+    g_string_append_printf(stats, "mem: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
+    qemu_plugin_outs(stats->str);
     g_assert(expected > 0);
     g_assert(per_vcpu == expected);
     g_assert(inl_per_vcpu == expected);
@@ -118,6 +124,7 @@ static void stats_mem(void)
 static void plugin_exit(qemu_plugin_id_t id, void *udata)
 {
     const unsigned int num_cpus = qemu_plugin_num_vcpus();
+    g_autoptr(GString) stats = g_string_new("");
     g_assert(num_cpus == max_cpu_index + 1);
 
     for (int i = 0; i < num_cpus ; ++i) {
@@ -135,20 +142,21 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
             qemu_plugin_u64_get(insn_cond_num_trigger, i);
         const uint64_t insn_cond_left =
             qemu_plugin_u64_get(insn_cond_track_count, i);
-        printf("cpu %d: tb (%" PRIu64 ", %" PRIu64
-               ", %" PRIu64 " * %" PRIu64 " + %" PRIu64
-               ") | "
-               "insn (%" PRIu64 ", %" PRIu64
-               ", %" PRIu64 " * %" PRIu64 " + %" PRIu64
-               ") | "
-               "mem (%" PRIu64 ", %" PRIu64 ")"
-               "\n",
-               i,
-               tb, tb_inline,
-               tb_cond_trigger, cond_trigger_limit, tb_cond_left,
-               insn, insn_inline,
-               insn_cond_trigger, cond_trigger_limit, insn_cond_left,
-               mem, mem_inline);
+        g_string_printf(stats, "cpu %d: tb (%" PRIu64 ", %" PRIu64
+                        ", %" PRIu64 " * %" PRIu64 " + %" PRIu64
+                        ") | "
+                        "insn (%" PRIu64 ", %" PRIu64
+                        ", %" PRIu64 " * %" PRIu64 " + %" PRIu64
+                        ") | "
+                        "mem (%" PRIu64 ", %" PRIu64 ")"
+                        "\n",
+                        i,
+                        tb, tb_inline,
+                        tb_cond_trigger, cond_trigger_limit, tb_cond_left,
+                        insn, insn_inline,
+                        insn_cond_trigger, cond_trigger_limit, insn_cond_left,
+                        mem, mem_inline);
+        qemu_plugin_outs(stats->str);
         g_assert(tb == tb_inline);
         g_assert(insn == insn_inline);
         g_assert(mem == mem_inline);
-- 
2.39.2
