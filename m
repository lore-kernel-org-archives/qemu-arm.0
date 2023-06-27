Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c0b5600b003fb40f5f553sm4180425wmr.31.2023.06.27.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:09:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E84E81FFDF;
	Tue, 27 Jun 2023 17:09:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
Subject: [PATCH v3 34/36] gdbstub: Add support for info proc mappings
Date: Tue, 27 Jun 2023 17:09:41 +0100
Message-Id: <20230627160943.2956928-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /3oZeAfxI1Tk

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently the GDB's generate-core-file command doesn't work well with
qemu-user: the resulting dumps are huge [1] and at the same time
incomplete (argv and envp are missing). The reason is that GDB has no
access to proc mappings and therefore has to fall back to using
heuristics for discovering them. This is, in turn, because qemu-user
does not implement the Host I/O feature of the GDB Remote Serial
Protocol.

Implement vFile:{open,close,pread,readlink} and also
qXfer:exec-file:read+. With that, generate-core-file begins to work on
aarch64 and s390x.

[1] https://sourceware.org/pipermail/gdb-patches/2023-May/199432.html

Co-developed-by: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230621203627.1808446-7-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h   |   5 ++
 gdbstub/gdbstub.c     |  45 +++++++++++++-
 gdbstub/user-target.c | 139 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+), 2 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 25e4d5eeaa..f2b46cce41 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -189,6 +189,11 @@ typedef union GdbCmdVariant {
 void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
 void gdb_handle_query_offsets(GArray *params, void *user_ctx); /* user */
 void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
+void gdb_handle_v_file_open(GArray *params, void *user_ctx); /* user */
+void gdb_handle_v_file_close(GArray *params, void *user_ctx); /* user */
+void gdb_handle_v_file_pread(GArray *params, void *user_ctx); /* user */
+void gdb_handle_v_file_readlink(GArray *params, void *user_ctx); /* user */
+void gdb_handle_query_xfer_exec_file(GArray *params, void *user_ctx); /* user */
 
 void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 697dd4bbad..6911b73c07 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1327,6 +1327,36 @@ static const GdbCmdParseEntry gdb_v_commands_table[] = {
         .cmd = "Kill;",
         .cmd_startswith = 1
     },
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Host I/O Packets. See [1] for details.
+     * [1] https://sourceware.org/gdb/onlinedocs/gdb/Host-I_002fO-Packets.html
+     */
+    {
+        .handler = gdb_handle_v_file_open,
+        .cmd = "File:open:",
+        .cmd_startswith = 1,
+        .schema = "s,L,L0"
+    },
+    {
+        .handler = gdb_handle_v_file_close,
+        .cmd = "File:close:",
+        .cmd_startswith = 1,
+        .schema = "l0"
+    },
+    {
+        .handler = gdb_handle_v_file_pread,
+        .cmd = "File:pread:",
+        .cmd_startswith = 1,
+        .schema = "l,L,L0"
+    },
+    {
+        .handler = gdb_handle_v_file_readlink,
+        .cmd = "File:readlink:",
+        .cmd_startswith = 1,
+        .schema = "s0"
+    },
+#endif
 };
 
 static void handle_v_commands(GArray *params, void *user_ctx)
@@ -1472,11 +1502,14 @@ static void handle_query_supported(GArray *params, void *user_ctx)
             ";ReverseStep+;ReverseContinue+");
     }
 
-#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
+#if defined(CONFIG_USER_ONLY)
+#if defined(CONFIG_LINUX)
     if (gdbserver_state.c_cpu->opaque) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
     }
 #endif
+    g_string_append(gdbserver_state.str_buf, ";qXfer:exec-file:read+");
+#endif
 
     if (params->len &&
         strstr(get_param(params, 0)->data, "multiprocess+")) {
@@ -1615,13 +1648,21 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .cmd_startswith = 1,
         .schema = "s:l,l0"
     },
-#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
+#if defined(CONFIG_USER_ONLY)
+#if defined(CONFIG_LINUX)
     {
         .handler = gdb_handle_query_xfer_auxv,
         .cmd = "Xfer:auxv:read::",
         .cmd_startswith = 1,
         .schema = "l,l0"
     },
+#endif
+    {
+        .handler = gdb_handle_query_xfer_exec_file,
+        .cmd = "Xfer:exec-file:read:",
+        .cmd_startswith = 1,
+        .schema = "l:l,l0"
+    },
 #endif
     {
         .handler = gdb_handle_query_attached,
diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
index fa0e59ec9a..5f0098c806 100644
--- a/gdbstub/user-target.c
+++ b/gdbstub/user-target.c
@@ -11,6 +11,10 @@
 #include "exec/gdbstub.h"
 #include "qemu.h"
 #include "internals.h"
+#ifdef CONFIG_LINUX
+#include "linux-user/loader.h"
+#include "linux-user/qemu.h"
+#endif
 
 /*
  * Map target signal numbers to GDB protocol signal numbers and vice
@@ -281,3 +285,138 @@ void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx)
                       gdbserver_state.str_buf->len, true);
 }
 #endif
+
+static const char *get_filename_param(GArray *params, int i)
+{
+    const char *hex_filename = get_param(params, i)->data;
+    gdb_hextomem(gdbserver_state.mem_buf, hex_filename,
+                 strlen(hex_filename) / 2);
+    g_byte_array_append(gdbserver_state.mem_buf, (const guint8 *)"", 1);
+    return (const char *)gdbserver_state.mem_buf->data;
+}
+
+static void hostio_reply_with_data(const void *buf, size_t n)
+{
+    g_string_printf(gdbserver_state.str_buf, "F%zx;", n);
+    gdb_memtox(gdbserver_state.str_buf, buf, n);
+    gdb_put_packet_binary(gdbserver_state.str_buf->str,
+                          gdbserver_state.str_buf->len, true);
+}
+
+void gdb_handle_v_file_open(GArray *params, void *user_ctx)
+{
+    const char *filename = get_filename_param(params, 0);
+    uint64_t flags = get_param(params, 1)->val_ull;
+    uint64_t mode = get_param(params, 2)->val_ull;
+
+#ifdef CONFIG_LINUX
+    int fd = do_guest_openat(gdbserver_state.g_cpu->env_ptr, 0, filename,
+                             flags, mode, false);
+#else
+    int fd = open(filename, flags, mode);
+#endif
+    if (fd < 0) {
+        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
+    } else {
+        g_string_printf(gdbserver_state.str_buf, "F%d", fd);
+    }
+    gdb_put_strbuf();
+}
+
+void gdb_handle_v_file_close(GArray *params, void *user_ctx)
+{
+    int fd = get_param(params, 0)->val_ul;
+
+    if (close(fd) == -1) {
+        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
+        gdb_put_strbuf();
+        return;
+    }
+
+    gdb_put_packet("F00");
+}
+
+#define BUFSIZ 8192
+
+void gdb_handle_v_file_pread(GArray *params, void *user_ctx)
+{
+    int fd = get_param(params, 0)->val_ul;
+    size_t count = get_param(params, 1)->val_ull;
+    off_t offset = get_param(params, 2)->val_ull;
+
+    size_t bufsiz = MIN(count, BUFSIZ);
+    g_autofree char *buf = g_try_malloc(bufsiz);
+    if (buf == NULL) {
+        gdb_put_packet("E12");
+        return;
+    }
+
+    ssize_t n = pread(fd, buf, bufsiz, offset);
+    if (n < 0) {
+        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
+        gdb_put_strbuf();
+        return;
+    }
+    hostio_reply_with_data(buf, n);
+}
+
+void gdb_handle_v_file_readlink(GArray *params, void *user_ctx)
+{
+    const char *filename = get_filename_param(params, 0);
+
+    g_autofree char *buf = g_try_malloc(BUFSIZ);
+    if (buf == NULL) {
+        gdb_put_packet("E12");
+        return;
+    }
+
+#ifdef CONFIG_LINUX
+    ssize_t n = do_guest_readlink(filename, buf, BUFSIZ);
+#else
+    ssize_t n = readlink(filename, buf, BUFSIZ);
+#endif
+    if (n < 0) {
+        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
+        gdb_put_strbuf();
+        return;
+    }
+    hostio_reply_with_data(buf, n);
+}
+
+void gdb_handle_query_xfer_exec_file(GArray *params, void *user_ctx)
+{
+    uint32_t pid = get_param(params, 0)->val_ul;
+    uint32_t offset = get_param(params, 1)->val_ul;
+    uint32_t length = get_param(params, 2)->val_ul;
+
+    GDBProcess *process = gdb_get_process(pid);
+    if (!process) {
+        gdb_put_packet("E00");
+        return;
+    }
+
+    CPUState *cpu = gdb_get_first_cpu_in_process(process);
+    if (!cpu) {
+        gdb_put_packet("E00");
+        return;
+    }
+
+    TaskState *ts = cpu->opaque;
+    if (!ts || !ts->bprm || !ts->bprm->filename) {
+        gdb_put_packet("E00");
+        return;
+    }
+
+    size_t total_length = strlen(ts->bprm->filename);
+    if (offset > total_length) {
+        gdb_put_packet("E00");
+        return;
+    }
+    if (offset + length > total_length) {
+        length = total_length - offset;
+    }
+
+    g_string_printf(gdbserver_state.str_buf, "l%.*s", length,
+                    ts->bprm->filename + offset);
+    gdb_put_strbuf();
+}
-- 
2.39.2
