Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s25-20020a7bc399000000b003fa96fe2bebsm14598535wmj.41.2023.06.30.11.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:13:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3742A1FFD1;
	Fri, 30 Jun 2023 19:04:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v4 28/38] gdbstub: lightly refactor connection to avoid snprintf
Date: Fri, 30 Jun 2023 19:04:13 +0100
Message-Id: <20230630180423.558337-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ULsI3VJN704n

This may be a bit too much to avoid an snprintf and the slightly dodgy
assign to a const variable. But hopefully not.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fix checkpatch warning
---
 gdbstub/softmmu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 99d994e6bf..f509b7285d 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -332,11 +332,9 @@ static void create_processes(GDBState *s)
 
 int gdbserver_start(const char *device)
 {
-    trace_gdbstub_op_start(device);
-
-    char gdbstub_device_name[128];
     Chardev *chr = NULL;
     Chardev *mon_chr;
+    g_autoptr(GString) cs = g_string_new(device);
 
     if (!first_cpu) {
         error_report("gdbstub: meaningless to attach gdb to a "
@@ -350,15 +348,16 @@ int gdbserver_start(const char *device)
         return -1;
     }
 
-    if (!device) {
+    if (cs->len == 0) {
         return -1;
     }
-    if (strcmp(device, "none") != 0) {
-        if (strstart(device, "tcp:", NULL)) {
+
+    trace_gdbstub_op_start(cs->str);
+
+    if (g_strcmp0(cs->str, "none") != 0) {
+        if (g_str_has_prefix(cs->str, "tcp:")) {
             /* enforce required TCP attributes */
-            snprintf(gdbstub_device_name, sizeof(gdbstub_device_name),
-                     "%s,wait=off,nodelay=on,server=on", device);
-            device = gdbstub_device_name;
+            g_string_append_printf(cs, ",wait=off,nodelay=on,server=on");
         }
 #ifndef _WIN32
         else if (strcmp(device, "stdio") == 0) {
@@ -373,7 +372,7 @@ int gdbserver_start(const char *device)
          * FIXME: it's a bit weird to allow using a mux chardev here
          * and implicitly setup a monitor. We may want to break this.
          */
-        chr = qemu_chr_new_noreplay("gdb", device, true, NULL);
+        chr = qemu_chr_new_noreplay("gdb", cs->str, true, NULL);
         if (!chr) {
             return -1;
         }
-- 
2.39.2
