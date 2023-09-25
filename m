Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o13-20020adfeacd000000b00317f3fd21b7sm12170189wrn.80.2023.09.25.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:58:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B38181FFCD;
	Mon, 25 Sep 2023 15:48:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Snow <jsnow@redhat.com>,
	libvir-list@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Nicholas Piggin <npiggin@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 22/31] target/sh4: Disable decode_gusa when plugins enabled
Date: Mon, 25 Sep 2023 15:48:45 +0100
Message-Id: <20230925144854.1872513-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tf1WnZGm3es5

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230824181233.1568795-3-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/sh4/translate.c | 41 +++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index c1e590feb3..b4dee34c9a 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1816,6 +1816,18 @@ static void decode_opc(DisasContext * ctx)
 }
 
 #ifdef CONFIG_USER_ONLY
+/*
+ * Restart with the EXCLUSIVE bit set, within a TB run via
+ * cpu_exec_step_atomic holding the exclusive lock.
+ */
+static void gen_restart_exclusive(DisasContext *ctx)
+{
+    ctx->envflags |= TB_FLAG_GUSA_EXCLUSIVE;
+    gen_save_cpu_state(ctx, false);
+    gen_helper_exclusive(cpu_env);
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+
 /* For uniprocessors, SH4 uses optimistic restartable atomic sequences.
    Upon an interrupt, a real kernel would simply notice magic values in
    the registers and reset the PC to the start of the sequence.
@@ -2149,12 +2161,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
     qemu_log_mask(LOG_UNIMP, "Unrecognized gUSA sequence %08x-%08x\n",
                   pc, pc_end);
 
-    /* Restart with the EXCLUSIVE bit set, within a TB run via
-       cpu_exec_step_atomic holding the exclusive lock.  */
-    ctx->envflags |= TB_FLAG_GUSA_EXCLUSIVE;
-    gen_save_cpu_state(ctx, false);
-    gen_helper_exclusive(cpu_env);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    gen_restart_exclusive(ctx);
 
     /* We're not executing an instruction, but we must report one for the
        purposes of accounting within the TB.  We might as well report the
@@ -2242,12 +2249,22 @@ static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 #ifdef CONFIG_USER_ONLY
     if (unlikely(ctx->envflags & TB_FLAG_GUSA_MASK)
         && !(ctx->envflags & TB_FLAG_GUSA_EXCLUSIVE)) {
-        /* We're in an gUSA region, and we have not already fallen
-           back on using an exclusive region.  Attempt to parse the
-           region into a single supported atomic operation.  Failure
-           is handled within the parser by raising an exception to
-           retry using an exclusive region.  */
-        decode_gusa(ctx, env);
+        /*
+         * We're in an gUSA region, and we have not already fallen
+         * back on using an exclusive region.  Attempt to parse the
+         * region into a single supported atomic operation.  Failure
+         * is handled within the parser by raising an exception to
+         * retry using an exclusive region.
+         *
+         * Parsing the region in one block conflicts with plugins,
+         * so always use exclusive mode if plugins enabled.
+         */
+        if (ctx->base.plugin_enabled) {
+            gen_restart_exclusive(ctx);
+            ctx->base.pc_next += 2;
+        } else {
+            decode_gusa(ctx, env);
+        }
         return;
     }
 #endif
-- 
2.39.2
