Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g19-20020a05600c4ed300b003d978f8f255sm4625941wmq.27.2023.01.05.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:43:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A9E101FFBD;
	Thu,  5 Jan 2023 16:43:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Rolnik <mrolnik@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Greg Kurz <groug@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 05/21] gdbstub: define separate user/system structures
Date: Thu,  5 Jan 2023 16:43:04 +0000
Message-Id: <20230105164320.2164095-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +uvzX7CN1/l6

In preparation for moving user/softmmu specific bits from the main
gdbstub file we need to separate the connection details into a
user/softmmu state. These will eventually be defined in their own
files.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 91 +++++++++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 38 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be88ca0d71..42ae13b344 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -342,6 +342,20 @@ enum RSState {
     RS_CHKSUM1,
     RS_CHKSUM2,
 };
+
+#ifdef CONFIG_USER_ONLY
+typedef struct {
+    int fd;
+    char *socket_path;
+    int running_state;
+} GDBUserState;
+#else
+typedef struct {
+    CharBackend chr;
+    Chardev *mon_chr;
+} GDBSystemState;
+#endif
+
 typedef struct GDBState {
     bool init;       /* have we been initialised? */
     CPUState *c_cpu; /* current CPU for step/continue ops */
@@ -355,12 +369,9 @@ typedef struct GDBState {
     GByteArray *last_packet;
     int signal;
 #ifdef CONFIG_USER_ONLY
-    int fd;
-    char *socket_path;
-    int running_state;
+    GDBUserState user;
 #else
-    CharBackend chr;
-    Chardev *mon_chr;
+    GDBSystemState system;
 #endif
     bool multiprocess;
     GDBProcess *processes;
@@ -413,15 +424,17 @@ static int get_char(void)
     int ret;
 
     for(;;) {
-        ret = recv(gdbserver_state.fd, &ch, 1, 0);
+        ret = recv(gdbserver_state.user.fd, &ch, 1, 0);
         if (ret < 0) {
-            if (errno == ECONNRESET)
-                gdbserver_state.fd = -1;
-            if (errno != EINTR)
+            if (errno == ECONNRESET) {
+                gdbserver_state.user.fd = -1;
+            }
+            if (errno != EINTR) {
                 return -1;
+            }
         } else if (ret == 0) {
-            close(gdbserver_state.fd);
-            gdbserver_state.fd = -1;
+            close(gdbserver_state.user.fd);
+            gdbserver_state.user.fd = -1;
             return -1;
         } else {
             break;
@@ -480,7 +493,7 @@ static inline void gdb_continue(void)
 {
 
 #ifdef CONFIG_USER_ONLY
-    gdbserver_state.running_state = 1;
+    gdbserver_state.user.running_state = 1;
     trace_gdbstub_op_continue();
 #else
     if (!runstate_needs_reset()) {
@@ -509,7 +522,7 @@ static int gdb_continue_partial(char *newstates)
             cpu_single_step(cpu, gdbserver_state.sstep_flags);
         }
     }
-    gdbserver_state.running_state = 1;
+    gdbserver_state.user.running_state = 1;
 #else
     int flag = 0;
 
@@ -561,7 +574,7 @@ static void put_buffer(const uint8_t *buf, int len)
     int ret;
 
     while (len > 0) {
-        ret = send(gdbserver_state.fd, buf, len, 0);
+        ret = send(gdbserver_state.user.fd, buf, len, 0);
         if (ret < 0) {
             if (errno != EINTR)
                 return;
@@ -573,7 +586,7 @@ static void put_buffer(const uint8_t *buf, int len)
 #else
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&gdbserver_state.chr, buf, len);
+    qemu_chr_fe_write_all(&gdbserver_state.system.chr, buf, len);
 #endif
 }
 
@@ -2095,7 +2108,8 @@ static void handle_query_rcmd(GArray *params, void *user_ctx)
     len = len / 2;
     hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
-    qemu_chr_be_write(gdbserver_state.mon_chr, gdbserver_state.mem_buf->data,
+    qemu_chr_be_write(gdbserver_state.system.mon_chr,
+                      gdbserver_state.mem_buf->data,
                       gdbserver_state.mem_buf->len);
     put_packet("OK");
 }
@@ -3028,10 +3042,10 @@ void gdb_exit(int code)
       return;
   }
 #ifdef CONFIG_USER_ONLY
-  if (gdbserver_state.socket_path) {
-      unlink(gdbserver_state.socket_path);
+  if (gdbserver_state.user.socket_path) {
+      unlink(gdbserver_state.user.socket_path);
   }
-  if (gdbserver_state.fd < 0) {
+  if (gdbserver_state.user.fd < 0) {
       return;
   }
 #endif
@@ -3042,7 +3056,7 @@ void gdb_exit(int code)
   put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
-  qemu_chr_fe_deinit(&gdbserver_state.chr, true);
+  qemu_chr_fe_deinit(&gdbserver_state.system.chr, true);
 #endif
 }
 
@@ -3078,7 +3092,7 @@ gdb_handlesig(CPUState *cpu, int sig)
     char buf[256];
     int n;
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_state.user.fd < 0) {
         return sig;
     }
 
@@ -3096,15 +3110,15 @@ gdb_handlesig(CPUState *cpu, int sig)
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
-    if (gdbserver_state.fd < 0) {
+    if (gdbserver_state.user.fd < 0) {
         return sig;
     }
 
     sig = 0;
     gdbserver_state.state = RS_IDLE;
-    gdbserver_state.running_state = 0;
-    while (gdbserver_state.running_state == 0) {
-        n = read(gdbserver_state.fd, buf, 256);
+    gdbserver_state.user.running_state = 0;
+    while (gdbserver_state.user.running_state == 0) {
+        n = read(gdbserver_state.user.fd, buf, 256);
         if (n > 0) {
             int i;
 
@@ -3115,9 +3129,9 @@ gdb_handlesig(CPUState *cpu, int sig)
             /* XXX: Connection closed.  Should probably wait for another
                connection before continuing.  */
             if (n == 0) {
-                close(gdbserver_state.fd);
+                close(gdbserver_state.user.fd);
             }
-            gdbserver_state.fd = -1;
+            gdbserver_state.user.fd = -1;
             return sig;
         }
     }
@@ -3131,7 +3145,7 @@ void gdb_signalled(CPUArchState *env, int sig)
 {
     char buf[4];
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_state.user.fd < 0) {
         return;
     }
 
@@ -3146,7 +3160,7 @@ static void gdb_accept_init(int fd)
     gdbserver_state.processes[0].attached = true;
     gdbserver_state.c_cpu = gdb_first_attached_cpu();
     gdbserver_state.g_cpu = gdbserver_state.c_cpu;
-    gdbserver_state.fd = fd;
+    gdbserver_state.user.fd = fd;
     gdb_has_xml = false;
 }
 
@@ -3278,7 +3292,7 @@ int gdbserver_start(const char *port_or_path)
     if (port > 0 && gdb_accept_tcp(gdb_fd)) {
         return 0;
     } else if (gdb_accept_socket(gdb_fd)) {
-        gdbserver_state.socket_path = g_strdup(port_or_path);
+        gdbserver_state.user.socket_path = g_strdup(port_or_path);
         return 0;
     }
 
@@ -3290,11 +3304,11 @@ int gdbserver_start(const char *port_or_path)
 /* Disable gdb stub for child processes.  */
 void gdbserver_fork(CPUState *cpu)
 {
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_state.user.fd < 0) {
         return;
     }
-    close(gdbserver_state.fd);
-    gdbserver_state.fd = -1;
+    close(gdbserver_state.user.fd);
+    gdbserver_state.user.fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
@@ -3488,21 +3502,22 @@ int gdbserver_start(const char *device)
                                    NULL, NULL, &error_abort);
         monitor_init_hmp(mon_chr, false, &error_abort);
     } else {
-        qemu_chr_fe_deinit(&gdbserver_state.chr, true);
-        mon_chr = gdbserver_state.mon_chr;
+        qemu_chr_fe_deinit(&gdbserver_state.system.chr, true);
+        mon_chr = gdbserver_state.system.mon_chr;
         reset_gdbserver_state();
     }
 
     create_processes(&gdbserver_state);
 
     if (chr) {
-        qemu_chr_fe_init(&gdbserver_state.chr, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&gdbserver_state.chr, gdb_chr_can_receive,
+        qemu_chr_fe_init(&gdbserver_state.system.chr, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&gdbserver_state.system.chr,
+                                 gdb_chr_can_receive,
                                  gdb_chr_receive, gdb_chr_event,
                                  NULL, &gdbserver_state, NULL, true);
     }
     gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
-    gdbserver_state.mon_chr = mon_chr;
+    gdbserver_state.system.mon_chr = mon_chr;
     gdbserver_state.current_syscall_cb = NULL;
 
     return 0;
-- 
2.34.1
