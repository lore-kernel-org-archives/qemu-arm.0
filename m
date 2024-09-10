Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d2597ac96sm510004966b.73.2024.09.10.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:39:04 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1C1475FA0E;
	Tue, 10 Sep 2024 18:39:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH v2 07/10] gdbstub: Add support for MTE in system mode
Date: Tue, 10 Sep 2024 18:38:57 +0100
Message-Id: <20240910173900.4154726-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910173900.4154726-1-alex.bennee@linaro.org>
References: <20240910173900.4154726-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3/4FYqY+QStC

From: Gustavo Romero <gustavo.romero@linaro.org>

This commit makes handle_q_memtag, handle_q_isaddresstagged, and
handle_Q_memtag stubs build for system mode, allowing all GDB
'memory-tag' subcommands to work with QEMU gdbstub on aarch64 system
mode.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/620
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240906143316.657436-3-gustavo.romero@linaro.org>
[AJB: add #ifdef CONFIG_TCG guards]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - while we enable system mode it is still TCG only so added guards
  to handle the --disable-tcg case (native KVM and Xen builds)
---
 target/arm/gdbstub64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 85a19c14c7..1a4dbec567 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -430,7 +430,9 @@ int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
     return 0;
 #endif
 }
+#endif /* CONFIG_USER_ONLY */
 
+#ifdef CONFIG_TCG
 static void handle_q_memtag(GArray *params, void *user_ctx)
 {
     ARMCPU *cpu = ARM_CPU(user_ctx);
@@ -600,13 +602,13 @@ static const GdbCmdParseEntry cmd_handler_table[NUM_CMDS] = {
         .need_cpu_context = true
     },
 };
-#endif /* CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG */
 
 void aarch64_cpu_register_gdb_commands(ARMCPU *cpu, GString *qsupported,
                                        GPtrArray *qtable, GPtrArray *stable)
 {
-#ifdef CONFIG_USER_ONLY
     /* MTE */
+#ifdef CONFIG_TCG
     if (cpu_isar_feature(aa64_mte, cpu)) {
         g_string_append(qsupported, ";memory-tagging+");
 
-- 
2.39.2
