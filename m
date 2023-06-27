Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm10991749wri.73.2023.06.27.09.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:25:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 07BDB1FFD2;
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 26/36] gdbstub: lightly refactor connection to avoid snprintf
Date: Tue, 27 Jun 2023 17:09:33 +0100
Message-Id: <20230627160943.2956928-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GUlgpkKOpwTN

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
