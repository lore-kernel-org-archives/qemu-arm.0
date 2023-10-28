Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y15-20020a05600c2b0f00b004083996dad8sm7108076wme.18.2023.10.28.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 638545F798;
	Sat, 28 Oct 2023 11:33:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Brad Smith <brad@comstyle.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 14/17] gdbstub: Check if gdb_regs is NULL
Date: Sat, 28 Oct 2023 11:33:08 +0100
Message-Id: <20231028103311.347104-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231028103311.347104-1-alex.bennee@linaro.org>
References: <20231028103311.347104-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SJhRQgCqMqau

From: Akihiko Odaki <akihiko.odaki@daynix.com>

cpu->gdb_regs may be NULL if no coprocessor is registered.

Fixes: 73c392c26b ("gdbstub: Replace gdb_regs with an array")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20231019101030.128431-2-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Fabiano Rosas <farosas@suse.de>
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
