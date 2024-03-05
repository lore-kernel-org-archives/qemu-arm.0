Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c3ac800b00412e84e59d8sm3851590wms.44.2024.03.05.04.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:10:12 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8A5E65F9CF;
	Tue,  5 Mar 2024 12:10:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brad Smith <brad@comstyle.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Brian Cain <bcain@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Beraldo Leal <bleal@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	David Hildenbrand <david@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Warner Losh <imp@bsdimp.com>,
	qemu-riscv@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 11/29] gdbstub: Introduce gdb_handle_detach_user()
Date: Tue,  5 Mar 2024 12:09:47 +0000
Message-Id: <20240305121005.3528075-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AtYEtT1KSOGO

From: Ilya Leoshkevich <iii@linux.ibm.com>

The upcoming follow-fork-mode child support needs to perform certain
actions when GDB detaches from the stopped parent or the stopped child.
Introduce a user-specific hook for this.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20240219141628.246823-11-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 1 +
 gdbstub/gdbstub.c   | 6 ++++++
 gdbstub/user.c      | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index b4905c7181a..b4724598384 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -198,6 +198,7 @@ void gdb_handle_query_xfer_exec_file(GArray *params, void *user_ctx); /* user */
 void gdb_handle_set_catch_syscalls(GArray *params, void *user_ctx); /* user */
 void gdb_handle_query_supported_user(const char *gdb_supported); /* user */
 bool gdb_handle_set_thread_user(uint32_t pid, uint32_t tid); /* user */
+bool gdb_handle_detach_user(uint32_t pid); /* user */
 
 void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 3eb93162aa8..17efcae0d0e 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1024,6 +1024,12 @@ static void handle_detach(GArray *params, void *user_ctx)
         pid = get_param(params, 0)->val_ul;
     }
 
+#ifdef CONFIG_USER_ONLY
+    if (gdb_handle_detach_user(pid)) {
+        return;
+    }
+#endif
+
     process = gdb_get_process(pid);
     gdb_process_breakpoint_remove_all(process);
     process->attached = false;
diff --git a/gdbstub/user.c b/gdbstub/user.c
index b048754c4f8..1a7b582a40d 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -391,6 +391,11 @@ bool gdb_handle_set_thread_user(uint32_t pid, uint32_t tid)
     return false;
 }
 
+bool gdb_handle_detach_user(uint32_t pid)
+{
+    return false;
+}
+
 /*
  * Execution state helpers
  */
-- 
2.39.2
