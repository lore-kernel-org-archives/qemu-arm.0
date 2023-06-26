Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id da16-20020a056000197000b0031274a184d5sm8519676wrb.109.2023.06.26.15.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 15:05:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1111D1FFD0;
	Mon, 26 Jun 2023 22:59:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 26/26] tests/plugin: Remove duplicate insn log from libinsn.so
Date: Mon, 26 Jun 2023 22:59:26 +0100
Message-Id: <20230626215926.2522656-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626215926.2522656-1-alex.bennee@linaro.org>
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MciAk1y1XwpX

From: Richard Henderson <richard.henderson@linaro.org>

This is a perfectly natural occurrence for x86 "rep movb",
where the "rep" prefix forms a counted loop of the one insn.

During the tests/tcg/multiarch/memory test, this logging is
triggered over 350000 times.  Within the context of cross-i386-tci
build, which is already slow by nature, the logging is sufficient
to push the test into timeout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230621111520.1390967-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/insn.c                      | 9 +--------
 tests/tcg/i386/Makefile.softmmu-target   | 9 ---------
 tests/tcg/i386/Makefile.target           | 6 ------
 tests/tcg/x86_64/Makefile.softmmu-target | 9 ---------
 4 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index e251a84d86..5fd3017c2b 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -19,7 +19,6 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 #define MAX_CPUS 8 /* lets not go nuts */
 
 typedef struct {
-    uint64_t last_pc;
     uint64_t insn_count;
 } InstructionCount;
 
@@ -51,13 +50,7 @@ static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
     unsigned int i = cpu_index % MAX_CPUS;
     InstructionCount *c = &counts[i];
-    uint64_t this_pc = GPOINTER_TO_UINT(udata);
-    if (this_pc == c->last_pc) {
-        g_autofree gchar *out = g_strdup_printf("detected repeat execution @ 0x%"
-                                                PRIx64 "\n", this_pc);
-        qemu_plugin_outs(out);
-    }
-    c->last_pc = this_pc;
+
     c->insn_count++;
 }
 
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index ed922d59c8..5266f2335a 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -33,14 +33,5 @@ EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
-# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
-run-plugin-%-with-libinsn.so:
-	$(call run-test, $@, \
-	  $(QEMU) -monitor none -display none \
-		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
-                  -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
-	    	  -d plugin -D $*-with-libinsn.so.pout \
-		  $(QEMU_OPTS) $*)
-
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 821822ed0c..f2ee7a4db7 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -63,12 +63,6 @@ else
 SKIP_I386_TESTS+=test-i386-fprem
 endif
 
-# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
-run-plugin-%-with-libinsn.so:
-	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
-	       -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
-	       -d plugin -D $*-with-libinsn.so.pout $*)
-
 # Update TESTS
 I386_TESTS:=$(filter-out $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
 TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index 7207fee94c..1bd763f2e6 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -33,14 +33,5 @@ EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
-# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
-run-plugin-%-with-libinsn.so:
-	$(call run-test, $@, \
-	  $(QEMU) -monitor none -display none \
-		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
-                  -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
-	    	  -d plugin -D $*-with-libinsn.so.pout \
-		  $(QEMU_OPTS) $*)
-
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
-- 
2.39.2
