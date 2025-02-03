Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d0feasm777494766b.52.2025.02.03.06.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:40:56 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B9D4A608B4;
	Mon,  3 Feb 2025 14:40:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	Peter Xu <peterx@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Kyle Evans <kevans@freebsd.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-rust@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 11/18] gdbstub: Try unlinking the unix socket before binding
Date: Mon,  3 Feb 2025 14:40:41 +0000
Message-Id: <20250203144048.2131117-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gqWHcZEj+bTM

From: Ilya Leoshkevich <iii@linux.ibm.com>

In case an emulated process execve()s another emulated process, bind()
will fail, because the socket already exists. So try deleting it. Use
the existing unix_listen() function which does this. Link qemu-user
with qemu-sockets.c and add the monitor_get_fd() stub.

Note that it is not possible to handle this in do_execv(): deleting
gdbserver_user_state.socket_path before safe_execve() is not correct,
because the latter may fail, and afterwards we may lose control.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250117001542.8290-3-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/user.c     | 29 +++--------------------------
 stubs/monitor-fd.c |  9 +++++++++
 stubs/meson.build  |  2 ++
 util/meson.build   |  2 ++
 4 files changed, 16 insertions(+), 26 deletions(-)
 create mode 100644 stubs/monitor-fd.c

diff --git a/gdbstub/user.c b/gdbstub/user.c
index fd29d595f4..8225b70280 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -315,12 +315,10 @@ static bool gdb_accept_socket(int gdb_fd)
     return true;
 }
 
-static int gdbserver_open_socket(const char *path)
+static int gdbserver_open_socket(const char *path, Error **errp)
 {
     g_autoptr(GString) buf = g_string_new("");
-    struct sockaddr_un sockaddr = {};
     char *pid_placeholder;
-    int fd, ret;
 
     pid_placeholder = strstr(path, "%d");
     if (pid_placeholder != NULL) {
@@ -330,28 +328,7 @@ static int gdbserver_open_socket(const char *path)
         path = buf->str;
     }
 
-    fd = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (fd < 0) {
-        perror("create socket");
-        return -1;
-    }
-
-    sockaddr.sun_family = AF_UNIX;
-    pstrcpy(sockaddr.sun_path, sizeof(sockaddr.sun_path) - 1, path);
-    ret = bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr));
-    if (ret < 0) {
-        perror("bind socket");
-        close(fd);
-        return -1;
-    }
-    ret = listen(fd, 1);
-    if (ret < 0) {
-        perror("listen socket");
-        close(fd);
-        return -1;
-    }
-
-    return fd;
+    return unix_listen(path, errp);
 }
 
 static bool gdb_accept_tcp(int gdb_fd)
@@ -424,7 +401,7 @@ bool gdbserver_start(const char *port_or_path, Error **errp)
     if (port > 0) {
         gdb_fd = gdbserver_open_port(port, errp);
     } else {
-        gdb_fd = gdbserver_open_socket(port_or_path);
+        gdb_fd = gdbserver_open_socket(port_or_path, errp);
     }
 
     if (gdb_fd < 0) {
diff --git a/stubs/monitor-fd.c b/stubs/monitor-fd.c
new file mode 100644
index 0000000000..9bb6749885
--- /dev/null
+++ b/stubs/monitor-fd.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "qemu/osdep.h"
+#include "monitor/monitor.h"
+
+int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
+{
+    abort();
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index a8b3aeb564..b0fee37e05 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -61,6 +61,8 @@ if have_user
   if not have_system
     stub_ss.add(files('qdev.c'))
   endif
+
+  stub_ss.add(files('monitor-fd.c'))
 endif
 
 if have_system
diff --git a/util/meson.build b/util/meson.build
index 5d8bef9891..780b5977a8 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -84,6 +84,8 @@ if have_block or have_ga
   util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-coroutine-io.c'))
   util_ss.add(files(f'coroutine-@coroutine_backend@.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
+endif
+if have_block or have_ga or have_user
   util_ss.add(files('qemu-sockets.c'))
 endif
 if have_block
-- 
2.39.5
