Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d547e5sm487267866b.201.2024.09.10.07.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:36 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 38F8B5FA08;
	Tue, 10 Sep 2024 15:07:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 06/26] gdbstub: Add support for MTE in system mode
Date: Tue, 10 Sep 2024 15:07:13 +0100
Message-Id: <20240910140733.4007719-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3ZNqlGMRfq3H

From: Gustavo Romero <gustavo.romero@linaro.org>

This commit makes handle_q_memtag, handle_q_isaddresstagged, and
handle_Q_memtag stubs build for system mode, allowing all GDB
'memory-tag' subcommands to work with QEMU gdbstub on aarch64 system
mode.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/620
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240906143316.657436-3-gustavo.romero@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/gdbstub64.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 85a19c14c7..9462d3f560 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -430,6 +430,7 @@ int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
     return 0;
 #endif
 }
+#endif /* CONFIG_USER_ONLY */
 
 static void handle_q_memtag(GArray *params, void *user_ctx)
 {
@@ -600,12 +601,10 @@ static const GdbCmdParseEntry cmd_handler_table[NUM_CMDS] = {
         .need_cpu_context = true
     },
 };
-#endif /* CONFIG_USER_ONLY */
 
 void aarch64_cpu_register_gdb_commands(ARMCPU *cpu, GString *qsupported,
                                        GPtrArray *qtable, GPtrArray *stable)
 {
-#ifdef CONFIG_USER_ONLY
     /* MTE */
     if (cpu_isar_feature(aa64_mte, cpu)) {
         g_string_append(qsupported, ";memory-tagging+");
@@ -614,5 +613,4 @@ void aarch64_cpu_register_gdb_commands(ARMCPU *cpu, GString *qsupported,
         g_ptr_array_add(qtable, (gpointer) &cmd_handler_table[qIsAddressTagged]);
         g_ptr_array_add(stable, (gpointer) &cmd_handler_table[QMemTags]);
     }
-#endif
 }
-- 
2.39.2
