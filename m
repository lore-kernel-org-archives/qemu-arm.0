Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c164a00b003e20cf0408esm328831wmn.40.2023.03.02.11.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:08:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 232F51FFBD;
	Thu,  2 Mar 2023 19:08:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Laurent Vivier <laurent@vivier.eu>,
	nicolas.eder@lauterbach.com,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	qemu-s390x@nongnu.org,
	Stafford Horne <shorne@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Marek Vasut <marex@denx.de>,
	Greg Kurz <groug@kaod.org>,
	Song Gao <gaosong@loongson.cn>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	mads@ynddal.dk,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 05/26] gdbstub: define separate user/system structures
Date: Thu,  2 Mar 2023 19:08:25 +0000
Message-Id: <20230302190846.2593720-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5MBUL4NBgT9C

In preparation for moving user/softmmu specific bits from the main
gdbstub file we need to separate the connection details into a
user/softmmu state. As these will eventually be defined in their own
files we move them out of the common GDBState structure.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - split into gdbserver_[user|system]_state now to avoid later hoop
  jumping
---
 gdbstub/gdbstub.c | 94 ++++++++++++++++++++++++++---------------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 63b56f0027..1e6f8978b5 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -341,6 +341,22 @@ enum RSState {
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
+static GDBUserState gdbserver_user_state;
+#else
+typedef struct {
+    CharBackend chr;
+    Chardev *mon_chr;
+} GDBSystemState;
+static GDBSystemState gdbserver_system_state;
+#endif
+
 typedef struct GDBState {
     bool init;       /* have we been initialised? */
     CPUState *c_cpu; /* current CPU for step/continue ops */
@@ -353,14 +369,6 @@ typedef struct GDBState {
     int line_csum; /* checksum at the end of the packet */
     GByteArray *last_packet;
     int signal;
-#ifdef CONFIG_USER_ONLY
-    int fd;
-    char *socket_path;
-    int running_state;
-#else
-    CharBackend chr;
-    Chardev *mon_chr;
-#endif
     bool multiprocess;
     GDBProcess *processes;
     int process_num;
@@ -412,15 +420,17 @@ static int get_char(void)
     int ret;
 
     for(;;) {
-        ret = recv(gdbserver_state.fd, &ch, 1, 0);
+        ret = recv(gdbserver_user_state.fd, &ch, 1, 0);
         if (ret < 0) {
-            if (errno == ECONNRESET)
-                gdbserver_state.fd = -1;
-            if (errno != EINTR)
+            if (errno == ECONNRESET) {
+                gdbserver_user_state.fd = -1;
+            }
+            if (errno != EINTR) {
                 return -1;
+            }
         } else if (ret == 0) {
-            close(gdbserver_state.fd);
-            gdbserver_state.fd = -1;
+            close(gdbserver_user_state.fd);
+            gdbserver_user_state.fd = -1;
             return -1;
         } else {
             break;
@@ -479,7 +489,7 @@ static inline void gdb_continue(void)
 {
 
 #ifdef CONFIG_USER_ONLY
-    gdbserver_state.running_state = 1;
+    gdbserver_user_state.running_state = 1;
     trace_gdbstub_op_continue();
 #else
     if (!runstate_needs_reset()) {
@@ -508,7 +518,7 @@ static int gdb_continue_partial(char *newstates)
             cpu_single_step(cpu, gdbserver_state.sstep_flags);
         }
     }
-    gdbserver_state.running_state = 1;
+    gdbserver_user_state.running_state = 1;
 #else
     int flag = 0;
 
@@ -560,7 +570,7 @@ static void put_buffer(const uint8_t *buf, int len)
     int ret;
 
     while (len > 0) {
-        ret = send(gdbserver_state.fd, buf, len, 0);
+        ret = send(gdbserver_user_state.fd, buf, len, 0);
         if (ret < 0) {
             if (errno != EINTR)
                 return;
@@ -572,7 +582,7 @@ static void put_buffer(const uint8_t *buf, int len)
 #else
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&gdbserver_state.chr, buf, len);
+    qemu_chr_fe_write_all(&gdbserver_system_state.chr, buf, len);
 #endif
 }
 
@@ -2094,7 +2104,8 @@ static void handle_query_rcmd(GArray *params, void *user_ctx)
     len = len / 2;
     hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
-    qemu_chr_be_write(gdbserver_state.mon_chr, gdbserver_state.mem_buf->data,
+    qemu_chr_be_write(gdbserver_system_state.mon_chr,
+                      gdbserver_state.mem_buf->data,
                       gdbserver_state.mem_buf->len);
     put_packet("OK");
 }
@@ -3027,10 +3038,10 @@ void gdb_exit(int code)
         return;
     }
 #ifdef CONFIG_USER_ONLY
-    if (gdbserver_state.socket_path) {
-        unlink(gdbserver_state.socket_path);
+    if (gdbserver_user_state.socket_path) {
+        unlink(gdbserver_user_state.socket_path);
     }
-    if (gdbserver_state.fd < 0) {
+    if (gdbserver_user_state.fd < 0) {
         return;
     }
 #endif
@@ -3041,7 +3052,7 @@ void gdb_exit(int code)
     put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
-    qemu_chr_fe_deinit(&gdbserver_state.chr, true);
+    qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
 #endif
 }
 
@@ -3077,7 +3088,7 @@ gdb_handlesig(CPUState *cpu, int sig)
     char buf[256];
     int n;
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return sig;
     }
 
@@ -3095,15 +3106,15 @@ gdb_handlesig(CPUState *cpu, int sig)
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
-    if (gdbserver_state.fd < 0) {
+    if (gdbserver_user_state.fd < 0) {
         return sig;
     }
 
     sig = 0;
     gdbserver_state.state = RS_IDLE;
-    gdbserver_state.running_state = 0;
-    while (gdbserver_state.running_state == 0) {
-        n = read(gdbserver_state.fd, buf, 256);
+    gdbserver_user_state.running_state = 0;
+    while (gdbserver_user_state.running_state == 0) {
+        n = read(gdbserver_user_state.fd, buf, 256);
         if (n > 0) {
             int i;
 
@@ -3114,9 +3125,9 @@ gdb_handlesig(CPUState *cpu, int sig)
             /* XXX: Connection closed.  Should probably wait for another
                connection before continuing.  */
             if (n == 0) {
-                close(gdbserver_state.fd);
+                close(gdbserver_user_state.fd);
             }
-            gdbserver_state.fd = -1;
+            gdbserver_user_state.fd = -1;
             return sig;
         }
     }
@@ -3130,7 +3141,7 @@ void gdb_signalled(CPUArchState *env, int sig)
 {
     char buf[4];
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return;
     }
 
@@ -3145,7 +3156,7 @@ static void gdb_accept_init(int fd)
     gdbserver_state.processes[0].attached = true;
     gdbserver_state.c_cpu = gdb_first_attached_cpu();
     gdbserver_state.g_cpu = gdbserver_state.c_cpu;
-    gdbserver_state.fd = fd;
+    gdbserver_user_state.fd = fd;
     gdb_has_xml = false;
 }
 
@@ -3277,7 +3288,7 @@ int gdbserver_start(const char *port_or_path)
     if (port > 0 && gdb_accept_tcp(gdb_fd)) {
         return 0;
     } else if (gdb_accept_socket(gdb_fd)) {
-        gdbserver_state.socket_path = g_strdup(port_or_path);
+        gdbserver_user_state.socket_path = g_strdup(port_or_path);
         return 0;
     }
 
@@ -3289,11 +3300,11 @@ int gdbserver_start(const char *port_or_path)
 /* Disable gdb stub for child processes.  */
 void gdbserver_fork(CPUState *cpu)
 {
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return;
     }
-    close(gdbserver_state.fd);
-    gdbserver_state.fd = -1;
+    close(gdbserver_user_state.fd);
+    gdbserver_user_state.fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
@@ -3487,21 +3498,22 @@ int gdbserver_start(const char *device)
                                    NULL, NULL, &error_abort);
         monitor_init_hmp(mon_chr, false, &error_abort);
     } else {
-        qemu_chr_fe_deinit(&gdbserver_state.chr, true);
-        mon_chr = gdbserver_state.mon_chr;
+        qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
+        mon_chr = gdbserver_system_state.mon_chr;
         reset_gdbserver_state();
     }
 
     create_processes(&gdbserver_state);
 
     if (chr) {
-        qemu_chr_fe_init(&gdbserver_state.chr, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&gdbserver_state.chr, gdb_chr_can_receive,
+        qemu_chr_fe_init(&gdbserver_system_state.chr, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&gdbserver_system_state.chr,
+                                 gdb_chr_can_receive,
                                  gdb_chr_receive, gdb_chr_event,
                                  NULL, &gdbserver_state, NULL, true);
     }
     gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
-    gdbserver_state.mon_chr = mon_chr;
+    gdbserver_system_state.mon_chr = mon_chr;
     gdbserver_state.current_syscall_cb = NULL;
 
     return 0;
-- 
2.39.2
