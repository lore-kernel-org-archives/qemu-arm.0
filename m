Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bcb89000000b003fee777fd84sm14309471wmi.41.2023.08.29.09.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 09:15:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 681B11FFBC;
	Tue, 29 Aug 2023 17:15:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Juan Quintela <quintela@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 10/12] gdbstub: refactor get_feature_xml
Date: Tue, 29 Aug 2023 17:15:26 +0100
Message-Id: <20230829161528.2707696-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230829161528.2707696-1-alex.bennee@linaro.org>
References: <20230829161528.2707696-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NWnKQwAMoV5k

Try to bring up the code to more modern standards by:

  - use dynamic GString built xml over a fixed buffer
  - use autofree to save on explicit g_free() calls
  - don't hand hack strstr to find the delimiter
  - fix up style of xml_builtin and invert loop

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - also clean-up xml_builtin loop
  - use strchr and defere copy for only xml case
v2
  - avoid needless g_strndup for copy of annex
---
 gdbstub/internals.h |  2 +-
 gdbstub/gdbstub.c   | 81 +++++++++++++++++++++++----------------------
 2 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index f2b46cce41..4876ebd74f 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -33,7 +33,7 @@ typedef struct GDBProcess {
     uint32_t pid;
     bool attached;
 
-    char target_xml[1024];
+    char *target_xml;
 } GDBProcess;
 
 enum RSState {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 8e9bc17e07..729e54139a 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -354,64 +354,67 @@ static CPUState *gdb_get_cpu(uint32_t pid, uint32_t tid)
 static const char *get_feature_xml(const char *p, const char **newp,
                                    GDBProcess *process)
 {
-    size_t len;
-    int i;
-    const char *name;
     CPUState *cpu = gdb_get_first_cpu_in_process(process);
     CPUClass *cc = CPU_GET_CLASS(cpu);
+    size_t len;
 
-    len = 0;
-    while (p[len] && p[len] != ':')
-        len++;
-    *newp = p + len;
+    /*
+     * qXfer:features:read:ANNEX:OFFSET,LENGTH'
+     *                     ^p    ^newp
+     */
+    char *term = strchr(p, ':');
+    *newp = term + 1;
+    len = term - p;
 
-    name = NULL;
+    /* Is it the main target xml? */
     if (strncmp(p, "target.xml", len) == 0) {
-        char *buf = process->target_xml;
-        const size_t buf_sz = sizeof(process->target_xml);
-
-        /* Generate the XML description for this CPU.  */
-        if (!buf[0]) {
+        if (!process->target_xml) {
             GDBRegisterState *r;
+            GString *xml = g_string_new("<?xml version=\"1.0\"?>");
+
+            g_string_append(xml,
+                            "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
+                            "<target>");
 
-            pstrcat(buf, buf_sz,
-                    "<?xml version=\"1.0\"?>"
-                    "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
-                    "<target>");
             if (cc->gdb_arch_name) {
-                gchar *arch = cc->gdb_arch_name(cpu);
-                pstrcat(buf, buf_sz, "<architecture>");
-                pstrcat(buf, buf_sz, arch);
-                pstrcat(buf, buf_sz, "</architecture>");
-                g_free(arch);
+                g_autofree gchar *arch = cc->gdb_arch_name(cpu);
+                g_string_append_printf(xml,
+                                       "<architecture>%s</architecture>",
+                                       arch);
             }
-            pstrcat(buf, buf_sz, "<xi:include href=\"");
-            pstrcat(buf, buf_sz, cc->gdb_core_xml_file);
-            pstrcat(buf, buf_sz, "\"/>");
+            g_string_append(xml, "<xi:include href=\"");
+            g_string_append(xml, cc->gdb_core_xml_file);
+            g_string_append(xml, "\"/>");
             for (r = cpu->gdb_regs; r; r = r->next) {
-                pstrcat(buf, buf_sz, "<xi:include href=\"");
-                pstrcat(buf, buf_sz, r->xml);
-                pstrcat(buf, buf_sz, "\"/>");
+                g_string_append(xml, "<xi:include href=\"");
+                g_string_append(xml, r->xml);
+                g_string_append(xml, "\"/>");
             }
-            pstrcat(buf, buf_sz, "</target>");
+            g_string_append(xml, "</target>");
+
+            process->target_xml = g_string_free(xml, false);
+            return process->target_xml;
         }
-        return buf;
     }
+    /* Is it dynamically generated by the target? */
     if (cc->gdb_get_dynamic_xml) {
-        char *xmlname = g_strndup(p, len);
+        g_autofree char *xmlname = g_strndup(p, len);
         const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
-
-        g_free(xmlname);
         if (xml) {
             return xml;
         }
     }
-    for (i = 0; ; i++) {
-        name = xml_builtin[i][0];
-        if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
-            break;
+    /* Is it one of the encoded gdb-xml/ files? */
+    for (int i = 0; xml_builtin[i][0]; i++) {
+        const char *name = xml_builtin[i][0];
+        if ((strncmp(name, p, len) == 0) &&
+            strlen(name) == len) {
+            return xml_builtin[i][1];
+        }
     }
-    return name ? xml_builtin[i][1] : NULL;
+
+    /* failed */
+    return NULL;
 }
 
 static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
@@ -2245,6 +2248,6 @@ void gdb_create_default_process(GDBState *s)
     process = &s->processes[s->process_num - 1];
     process->pid = pid;
     process->attached = false;
-    process->target_xml[0] = '\0';
+    process->target_xml = NULL;
 }
 
-- 
2.39.2
