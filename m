Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bcb8d000000b003ff3b964a9asm15334036wmi.39.2023.09.25.07.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:49:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D21F41FFC1;
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
	Beraldo Leal <bleal@redhat.com>,
	Matt Borgerson <contact@mborgerson.com>
Subject: [PATCH 23/31] plugins: Set final instruction count in plugin_gen_tb_end
Date: Mon, 25 Sep 2023 15:48:46 +0100
Message-Id: <20230925144854.1872513-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2NV79BP0rYI/

From: Matt Borgerson <contact@mborgerson.com>

Translation logic may partially decode an instruction, then abort and
remove the instruction from the TB. This can happen for example when an
instruction spans two pages. In this case, plugins may get an incorrect
result when calling qemu_plugin_tb_n_insns to query for the number of
instructions in the TB. This patch updates plugin_gen_tb_end to set the
final instruction count.

Signed-off-by: Matt Borgerson <contact@mborgerson.com>
[AJB: added g_assert to defed API]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <CADc=-s5RwGViNTR-h5cq3np673W3RRFfhr4vCGJp0EoDUxvhog@mail.gmail.com>
---
 include/exec/plugin-gen.h | 4 ++--
 accel/tcg/plugin-gen.c    | 6 +++++-
 accel/tcg/translator.c    | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index 52828781bc..c4552b5061 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -20,7 +20,7 @@ struct DisasContextBase;
 
 bool plugin_gen_tb_start(CPUState *cpu, const struct DisasContextBase *db,
                          bool supress);
-void plugin_gen_tb_end(CPUState *cpu);
+void plugin_gen_tb_end(CPUState *cpu, size_t num_insns);
 void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
 void plugin_gen_insn_end(void);
 
@@ -42,7 +42,7 @@ void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db)
 static inline void plugin_gen_insn_end(void)
 { }
 
-static inline void plugin_gen_tb_end(CPUState *cpu)
+static inline void plugin_gen_tb_end(CPUState *cpu, size_t num_insns)
 { }
 
 static inline void plugin_gen_disable_mem_helpers(void)
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 5c13615112..c0adc9f4b7 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -866,10 +866,14 @@ void plugin_gen_insn_end(void)
  * do any clean-up here and make sure things are reset in
  * plugin_gen_tb_start.
  */
-void plugin_gen_tb_end(CPUState *cpu)
+void plugin_gen_tb_end(CPUState *cpu, size_t num_insns)
 {
     struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
 
+    /* translator may have removed instructions, update final count */
+    g_assert(num_insns <= ptb->n);
+    ptb->n = num_insns;
+
     /* collect instrumentation requests */
     qemu_plugin_tb_trans_cb(cpu, ptb);
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 37f8dadbbd..ff84282fe5 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -212,7 +212,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     gen_tb_end(tb, cflags, icount_start_insn, db->num_insns);
 
     if (plugin_enabled) {
-        plugin_gen_tb_end(cpu);
+        plugin_gen_tb_end(cpu, db->num_insns);
     }
 
     /* The disas_log hook may use these values rather than recompute.  */
-- 
2.39.2
