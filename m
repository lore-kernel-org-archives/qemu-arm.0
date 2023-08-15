Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w4-20020adfcd04000000b003176eab8868sm18259844wrm.82.2023.08.15.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 07:51:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C73DD1FFBB;
	Tue, 15 Aug 2023 15:51:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 8/9] gdbstub: refactor get_feature_xml
Date: Tue, 15 Aug 2023 15:51:25 +0100
Message-Id: <20230815145126.3444183-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230815145126.3444183-1-alex.bennee@linaro.org>
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2v0jIwcX+i9k

Try to bring up the code to more modern standards by:

  - use dynamic GString built xml over a fixed buffer
  - use autofree to save on explicit g_free() calls
  - don't hand hack strstr to find the delimiter

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h |  2 +-
 gdbstub/gdbstub.c   | 62 ++++++++++++++++++++++-----------------------
 2 files changed, 31 insertions(+), 33 deletions(-)

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
index 8e9bc17e07..0f9032d793 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -354,54 +354,52 @@ static CPUState *gdb_get_cpu(uint32_t pid, uint32_t tid)
 static const char *get_feature_xml(const char *p, const char **newp,
                                    GDBProcess *process)
 {
-    size_t len;
     int i;
     const char *name;
     CPUState *cpu = gdb_get_first_cpu_in_process(process);
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    len = 0;
-    while (p[len] && p[len] != ':')
-        len++;
-    *newp = p + len;
+    /* ‘qXfer:features:read:annex:offset,length' */
+    char *term = g_strstr_len(p, -1, ":");
+    size_t len = term - p;
+    g_autofree char *annex = g_strndup(p, len);
+    /* leave newp at offset,length for the rest of the params */
+    *newp = term + 1;
 
-    name = NULL;
-    if (strncmp(p, "target.xml", len) == 0) {
-        char *buf = process->target_xml;
-        const size_t buf_sz = sizeof(process->target_xml);
 
-        /* Generate the XML description for this CPU.  */
-        if (!buf[0]) {
+    name = NULL;
+    if (g_strcmp0(annex, "target.xml") == 0) {
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
     if (cc->gdb_get_dynamic_xml) {
-        char *xmlname = g_strndup(p, len);
+        g_autofree char *xmlname = g_strndup(p, len);
         const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
-
-        g_free(xmlname);
         if (xml) {
             return xml;
         }
@@ -2245,6 +2243,6 @@ void gdb_create_default_process(GDBState *s)
     process = &s->processes[s->process_num - 1];
     process->pid = pid;
     process->attached = false;
-    process->target_xml[0] = '\0';
+    process->target_xml = NULL;
 }
 
-- 
2.39.2
