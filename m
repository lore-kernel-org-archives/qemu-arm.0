Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d12-20020a05600c3acc00b004068495910csm10002077wms.23.2023.10.29.07.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 07:50:40 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9C1515F7A2;
	Sun, 29 Oct 2023 14:50:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Brad Smith <brad@comstyle.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Kyle Evans <kevans@freebsd.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 16/19] gdbstub: Check if gdb_regs is NULL
Date: Sun, 29 Oct 2023 14:50:30 +0000
Message-Id: <20231029145033.592566-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029145033.592566-1-alex.bennee@linaro.org>
References: <20231029145033.592566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xn3NxfPgOQNO

From: Akihiko Odaki <akihiko.odaki@daynix.com>

cpu->gdb_regs may be NULL if no coprocessor is registered.

Fixes: 73c392c26b ("gdbstub: Replace gdb_regs with an array")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20231019101030.128431-2-akihiko.odaki@daynix.com>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231028103311.347104-15-alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 1e96a71c0c..29540a0284 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -385,12 +385,14 @@ static const char *get_feature_xml(const char *p, const char **newp,
                 xml,
                 g_markup_printf_escaped("<xi:include href=\"%s\"/>",
                                         cc->gdb_core_xml_file));
-            for (guint i = 0; i < cpu->gdb_regs->len; i++) {
-                r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-                g_ptr_array_add(
-                    xml,
-                    g_markup_printf_escaped("<xi:include href=\"%s\"/>",
-                                            r->xml));
+            if (cpu->gdb_regs) {
+                for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+                    r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+                    g_ptr_array_add(
+                        xml,
+                        g_markup_printf_escaped("<xi:include href=\"%s\"/>",
+                                                r->xml));
+                }
             }
             g_ptr_array_add(xml, g_strdup("</target>"));
             g_ptr_array_add(xml, NULL);
@@ -430,10 +432,12 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
         return cc->gdb_read_register(cpu, buf, reg);
     }
 
-    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
-        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
-            return r->get_reg(env, buf, reg - r->base_reg);
+    if (cpu->gdb_regs) {
+        for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+            r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+            if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+                return r->get_reg(env, buf, reg - r->base_reg);
+            }
         }
     }
     return 0;
@@ -449,10 +453,12 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
         return cc->gdb_write_register(cpu, mem_buf, reg);
     }
 
-    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
-        r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
-            return r->set_reg(env, mem_buf, reg - r->base_reg);
+    if (cpu->gdb_regs) {
+        for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+            r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+            if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+                return r->set_reg(env, mem_buf, reg - r->base_reg);
+            }
         }
     }
     return 0;
-- 
2.39.2
